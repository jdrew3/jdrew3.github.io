library(tidyverse)
library(tidycensus)
library(tigris)
library(sf)

setwd("C:/Users/jdrew/Documents/Classes/SP20/GES 486/proj2")


noMOE <- function(x) {
  x[str_subset(names(x),"M$",negate=T)]
}

# Total Units, Occupied Units, Owner-Occupied Units, Median Household Income 
dvars <- c("totalUnits"="DP04_0001E","occupUnits"="DP04_0045E",
          "ownOccUnits"="DP04_0046E")
bvars <- c("mhhi"="B19013_001E")

geo <- "tract"

md_cty <- read_sf("md_counties.gpkg")
md_shp <- read_sf("md_tracts.gpkg")

md_nowater <- md_shp %>% filter(ALAND > 0)

for(yr in 2010:2018) {
  tbl_d <- get_acs(geography = geo, 
                         variables = dvars, 
                         state = "MD",
                         year = yr,
                         output = "wide"
  ) 
  
  tbl_b <- get_acs(geography = geo, 
                         variables = bvars, 
                         state = "MD",
                         year = yr,
                         output = "wide"
  ) 
  
  out <- left_join(md_nowater["GEOID"],tbl_d,by="GEOID") %>%
    left_join(select(tbl_b,-NAME),by="GEOID") %>%
    noMOE() %>% 
    mutate(ownOcc_total_pct = round(ownOccUnits / totalUnits * 100, 2)) #%>%
    #st_transform(3857)
  
  out$start <- yr
  out$end <- yr
  
  write_sf(out,paste0("geojs/output",yr,".geojson"))
  
}
