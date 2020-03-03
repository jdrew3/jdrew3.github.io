# Project 1  

## Topic  
Health Insurance Coverage in Maryland

## Data  
Census data from [American FactFinder](https://factfinder.census.gov/faces/nav/jsf/pages/index.xhtml) until its taken offline at the end of March, and then the new [Census Data Explorer](data.census.gov) thereafter. State shapefiles (currently hosted at [American FactFinder](https://factfinder.census.gov/faces/nav/jsf/pages/index.xhtml), though [other](https://cran.r-project.org/web/packages/tidycensus/tidycensus.pdf) [sources](https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html) exist) divided at the census tract level are available.    

## Transformations/Subsets  
No subsetting should be necessary.    

## Analysis  
I will make two maps regarding Health Insurance coverage for 2010 and 2015: a map of the insured vs uninsured population and a map of spatial autocorrelation thereof using the Getis-Ord G statistic to distinguish clusters of high coverage from clusters of low coverage.    

## Outputs  
- Web map of values for each year. Ideally, this will take the form of one map where the user can change the year being displayed via a menu or series of buttons.   
- Web map of the result of the Getis-Ord analysis. Ideally, this will also be part of the previous web map to enable the user to quickly switch between the data values and the cluster map for a given year.   
