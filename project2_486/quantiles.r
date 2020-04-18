library(sf)

setwd("C:/Users/jdrew/Documents/Classes/SP20/GES 486/proj2")

yrs <- as.character(2010:2018)

for(y in yrs) {
  x <- read_sf(paste0("webmap/geojs/output",y,".geojson"))
  
  print(y)
  print(quantile(x$ownOcc_total_pct, na.rm = T))
}

# 0 10 25 40 100
# 0 40 65 80 100

# 0 10 25 40 65 80 100
#  1  2  3  4  5  6


