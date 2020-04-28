# Project 3   

## Description  
Health Insurance Coverage in Maryland (Redux)   

## Data  
Tabular census data is available from the [Census Data Explorer](https://data.census.gov). State census tract shapefiles are available through [tidycensus](https://cran.r-project.org/web/packages/tidycensus/index.html) [sources](https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html).    
I will be using census table data downloaded in R via the tidycensus package joined to census boundary shapefiles downloaded in R via the tigris package. The census table I will be using is DP04 (“Selected Housing Characteristics”) with the following columns: Total Housing Units, Total Occupied Units, and Owner-Occupied Units. I plan on using the tables for each year from 2010 to 2018.

The census boundary files from tigris are TIGER/Line data, which is in the NAD83 projection. I plan on using the most recent boundary data (2018) for displaying data for each of the above tables.
## Analysis  
I will make webmaps regarding Health Insurance coverage between 2010 and 2015: a map of the insured vs uninsured population and a map of the percent difference. (Should I keep this??)   

## Outputs  
- Web map of values for each year.  
- Web map of the difference between the two years (?)
- Scatterplot between each year of __ vs ___

## Interactive Features  
- Clicking a point on the scatterplot will highlight the corresponding census tract  
- Dragging a box on the scatterplot will highlight multiple corresponding census tracts  
