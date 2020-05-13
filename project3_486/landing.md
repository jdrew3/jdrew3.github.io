## Health Insurance in Maryland

### Project description:   
Looking at the Percentage of People Insured in Maryland in 2012 and 2017.   

### Web Map  
[<img src="images/map_preview.jpg?raw=true">](https://jdrew3.github.io/project3_486/webmap/index.html)    

[Link to Web Map](https://jdrew3.github.io/project3_486/webmap/index.html)    

### Side-by-Side Comparison
[<img src="images/pdf_preview.jpg?raw=true">](compare_v2.pdf)   

[Link to Full Graphic](compare_v2.pdf)   

### Scatter Plots   
[<img src="images/plots_preview.jpg?raw=true">](plots.pdf)   

[Link to Full Graphic](plots.pdf)   

### Tools Used:    
* [R](https://www.r-project.org/) 
  + [tidycensus](https://cran.r-project.org/web/packages/tidycensus/index.html)
  + [tigris](https://cran.r-project.org/web/packages/tigris/index.html)
  + [sf](https://cran.r-project.org/web/packages/sf/index.html)
	+ [ggplot2](https://cran.r-project.org/web/packages/ggplot2/index.html)
* [Leaflet](https://leafletjs.com/)
  + [leaflet-timeline-slider](https://github.com/svitkin/leaflet-timeline-slider)
  + [EasyButton](https://github.com/CliffCloud/Leaflet.EasyButton)
* [QGIS](https://qgis.org)
* [ColorBrewer](https://colorbrewer2.org/)
* [Chart.js](https://www.chartjs.org/)  
* [Inkscape](https://inkscape.org/)  

### Data:    
I used Census data both from [the Census portal](https://data.census.gov) and downloaded in R via the `tidycensus` package, then joined the results to the census boundary shapefiles downloaded in R via the `tigris` package. In R, the specific census variables I used were  Median Household Income (MMHI) from table B19013 and Total Population and White Population from table B02001. For the insurance coverage information, I needed the entirety of table B27001, Health Insurance Coverage Status By Sex By Age.   

The census boundary files from `tigris` are TIGER/Line data, which is in the NAD83 projection. I used the 2018 boundary files to visualize the census data.   

### Analysis:   
In R, I summarized the information in table B27001 into Insured and Uninsured for each census tract, once for each year. Then, I joined that resulting tables to that year's MHHI table, and finally joined those to the Census tract boundary shapefile from `tigris` before saving the attributed shapefiles as GeoJSONs that could be easily converted to javascript files readable by Leaflet.  

Next, I created an HTML file that would ultimately become the webmap linked above. I used `leaflet-timeline-slider` plugin to change between each year's spatial data, as well as which year's data appeared on the embedded Chart.js scatter plot. Since I wanted the plot to compare Percent Insured to MHHI as the Percentage of Population that was white, I used the `EasyButton` plugin to shift between which variable appeared as the x-axis. To make the plot link more meaningfully to the map, I also used the `onHover` functionality to make it so that hovering over points on the plot both shows a circle marker over the tract on the map and opens a textbox showing the tract's name and the plotted values. The basemap is [ESRI's Dark Gray Canvas](https://www.arcgis.com/home/item.html?id=1970c1995b8f44749f4b9b6e81b5ba45).  

In addition to creating the webmap, I wanted to display each year's spatial and tabular side-by-side as PDFs for easy comparison. To show the spatial data, I used QGIS to make a simple display of a map and the total overall percentage of people with health insurance for each year. To show the tabular data, I created four scatterplots, two for each year, in R using `ggplot2`. This makes it plain to see that the overall percentage of people insured has gone up. As a result, it seems that the positive correlation between MHHI and each of the other two variables actually became weaker.  

