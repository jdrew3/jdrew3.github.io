library(stringr)
library(magrittr)

setwd("C:/Users/jdrew/Documents/Classes/SP20/GES 486/proj2")

gdir <- "webmap/geojs/"
pat <-  "geojson$"
lyr.rt <- "output"
geo.ls <- list.files(gdir,pat,full.names = T)

for(fn in geo.ls) {
  x <- readLines(fn)
  
  nm <- fn %>% str_remove(gdir) %>% str_remove(pat)
  yr <- str_extract(nm,"[0-9]+")
  lyr.nm <- paste0(lyr.rt,yr)
  x[1] <- paste("var",lyr.nm,"=",x[1])
  
  writeLines(x,paste0(gdir,nm,"js"))
}

