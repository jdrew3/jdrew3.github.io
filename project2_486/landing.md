## Owner-Occupied Housing Units in Maryland

### Project Description:    
Looking at Owner-Occupied Housing Units per 100 Housing Units in Maryland from 2010 to 2018.   
  
### Tools Used:    
* [R](https://www.r-project.org/) 
  + [tidycensus](https://cran.r-project.org/web/packages/tidycensus/index.html)
  + [tigris](https://cran.r-project.org/web/packages/tigris/index.html)
  + [sf](https://cran.r-project.org/web/packages/sf/index.html)
  + [ggplot2](https://cran.r-project.org/web/packages/ggplot2/index.html)
* [Leaflet](https://leafletjs.com/)
  + [leaflet-timeline-slider](https://github.com/svitkin/leaflet-timeline-slider)
* [ColorBrewer](https://colorbrewer2.org/)
* [Chart.js](https://www.chartjs.org/)  
* [Inkscape](https://inkscape.org/)  

### Data:    
I used Census data downloaded in R via the `tidycensus` package joined to census boundary shapefiles downloaded in R via the `tigris` package. The specific census variables I used were Total Housing Units, Total Occupied Units, and Owner-Occupied Units from table DP04 (“Selected Housing Characteristics”), and Median Household Income (MMHI) from table B19013.    

The census boundary files from `tigris` are TIGER/Line data, which is in the NAD83 projection. I used the 2018 boundary files to visualize the census data.    

### Analysis:  
Using the `output="wide"` option in the `tidycensus::get_acs()` function returns the variables as columns, like they appear in the original census data table, with the GEOID of the corresponding census tract. I then separately joined the table for each year (2010-2018) to the 2018 boundary data to create nine `sf` objects, each with one year's data. Given how small some census tracts are, I chose not to display the census tract borders in the final maps, and instead added the borders for the MD county boundaries.    

To get the data to display in leaflet, I saved each object as a GeoJSON and then converted the file to Javascript (created a copy with `var output20## = ` prepended to it) that could be read in by the HTML that creates the webmap. I had first planned to project all my data to Web Mercator (ESPG:3857) before exporting it. However, using planar coordinates made each file over 30MB (GitHub has a limit of 25MB for a single file upload), and a brief search revealed that Leaflet reads in geographic coordinates and automatically reprojects it to Web Mercator in the actual map. Saving the GeoJSONs in the original NAD83 coordinates halved the file sizes, so this was good news for me.   

To allow users to navigate the data in an intuitive manner, I used the [leaflet-timeline-slider](https://github.com/svitkin/leaflet-timeline-slider) plugin to control the layer being displayed rather than a normal layer control. Later, when I implemented the [Chart.js](https://www.chartjs.org/) scatter-plot to display the possible relationship between MHHI and owner-occupancy, this also enabled me to update the plot on-the-fly for the selected year.   

This was also where I first noticed an apparent regime change between the data distribution in 2014 and the distribution in 2015. To highlight this, I used a diverging color palette from [ColorBrewer](https://colorbrewer2.org/) to difference when the majority of census tracts had less than 40 owner-occupied units per 100 housing units to when the majority had *greater than* 40. This change also corresponded to a reverse in the relationship between MHHI and Owner-Occupancy from negative to positive. To highlight that sudden change further, I used `ggplot2` to create a four pane graphic (two panes each for 2014 and 2015, one for the map and one for the scatterplot of MHHI vs Owner-Occupancy). I saved it to a PDF, which I've cleaned up in Inkscape before uploading it here.     

### Outputs:   
#### Web Map  
[<img src="proj2_webmap_thum.png?raw=true">](https://jdrew3.github.io/project2_486/webmap/index.html)    

[Link to Web Map](https://jdrew3.github.io/project2_486/webmap/index.html)    

#### Comparison of 2014 to 2015
[<img src="proj2_thum.png?raw=true">](owner_occupancy_2014_2015.pdf)   

[Link to Full Graphic](owner_occupancy_2014_2015.pdf)    
