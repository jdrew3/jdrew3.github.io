library(tidyverse)
library(magrittr)
library(sf)

setwd("C:/Users/jdrew/Documents/Classes/SP20/GES 486/proj2")

gls <- list.files("geojs","geojson$",full.names = T)

for(fn in gls) {
  x <- read_sf(fn)
  yr <- str_extract(fn,"[0-9]+") # %>% as.integer()
  
  x$start <- paste0(yr,"-01-01")
  x$end <- paste0(yr,"-12-31")
  
  write_sf(x,fn,delete_dsn=T)
}

source("geojson_to_js.r")
