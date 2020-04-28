# Project 3   

## Description  
Health Insurance Coverage in Maryland (Redux)   

## Data  
Tabular census data is available from the [Census Data Explorer](https://data.census.gov). State census tract shapefiles are available through [tidycensus](https://cran.r-project.org/web/packages/tidycensus/index.html) [sources](https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html).    

## Transformations/Subsets  
No transformations or subsetting should be necessary. Leaflet automatically reprojects geographic coordinates into Web Mercator, and tidycensus allows you to choose which variables appear in the resulting table.    

## Analysis  
I will make webmaps regarding Health Insurance coverage between 2010 and 2015: a map of the insured vs uninsured population and a map of the percent difference. (Should I keep this??)   

## Outputs  
- Web map of values for each year.  
- Web map of the difference between the two years (?)
- Scatterplot between each year of __ vs ___

## Interactive Features  
- Clicking a point on the scatterplot will highlight the corresponding census tract  
- Dragging a box on the scatterplot will highlight multiple corresponding census tracts  
