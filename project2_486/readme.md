# Project 2 Proposal   

## Description:   
Looking at Homeownership Rates in Maryland from 2010 to 2018.   

## Data:  
I will be using census table data downloaded in R via the tidycensus package joined to census boundary shapefiles downloaded in R via the tigris package. The census table I will be using is DP04 (“Selected Housing Characteristics”) with the following columns: Total Housing Units, Total Occupied Units, and Owner-Occupied Units. I plan on using the tables for each year from 2010 to 2018.   

The census boundary files from tigris are TIGER/Line data, which is in the NAD83 projection. I plan on using the most recent boundary data (2018) for displaying data for each of the above tables.   

## Analysis:  
By default, the tidycensus::get_acs() function gives a data.frame with one row per census variable and provides both an estimate and a MOE column for each row. My first task will be to transform each year’s data.frame into a single data.frame with one column for each census variable by year (estimate only), the GEOID and the geography name, and then join that to the census boundary sf object.   

I will also be reprojecting the sf object to the Web Mercator projection so it displays better. For the symbology for each year’s homeownership rate in R, I will be using the RColorBrewer package and/or the color controls in the ggplot package. The goal is to produce a graphic displaying the two most dissimilar years, exported from R as a PDF and cleaned up in Illustrator or a similar program.    

To display changes over time, I will be exporting the final reprojected and attributed sf object as a GeoJSON for use in a Leaflet map that will be able to display data for each year via a timeline slider.    

## Outputs:  
* A web map produced in Leaflet that displays the entire time series.    
* A PDF map produced in R and refined in Illustrator to highlight two especially disparate years, or the start and end of the series if no two years in between contrast that well.   
