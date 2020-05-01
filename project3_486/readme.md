# Project 3   

## Description  
Health Insurance Coverage in Maryland (Redux)   

## Data   
I will be re-using the data I gathered and summarized in project 1, namely the tables B27001 ("Health Insurance Coverage Status By Sex By Age") and B19001 ("Median Household Income in the Past 12 Months") downloaded from [Census Data Explorer](https://data.census.gov). To further this add another possible variable of interest, I will be using tidycensus to get the Total Population and White Population columns of table B02001. The data from these tables will be joined to the census boundary shapefile I used in Project 2. I plan on using the tables for 2012 and 2017 only so as to not to significantly alter the scope of project 1, which should let me focus on the analysis for each year.

The census boundary files from tigris are TIGER/Line data, which is in the NAD83 projection. I plan on using the most recent boundary data (2018) for displaying data for each of the above tables.

## Analysis  
I will make webmaps of Health Insurance coverage during 2012 and 2017. These webmaps will include two scatterplots, one between percent insured and median household income, and another between percent insured and percent white population.

## Outputs  
- Web map of values for each year.  
- Scatterplot of Median Household Income vs Percent Insured
- Scatterplot of Percent White vs Percent Insured

## Interactive Features  
- Clicking a point on the scatterplot will highlight the corresponding census tract  
- Dragging a box on the scatterplot will highlight multiple corresponding census tracts  
- Should be able to toggle between plots rather than having both visible and taking up screenspace (if this proves impossible, I will display only MHHI vs Pct. Insured as that shows a clearer correlation)
