library(readr)
library(stringr)
library(dplyr)

#setwd("C:/Users/Justin/Documents/Classes/SP20/GES 486/proj1")
setwd("Z:/ges486/Project1")

as.pct <- function(x, digits = 2) {
  round(x*100, digits = digits)
}

ins.12 <- read_csv("summary_data/insurance_2012.csv",col_types = cols())
ins.17 <- read_csv("summary_data/insurance_2017.csv",col_types = cols())

ins.12$pct_ins <- with(ins.12, insured / total)
ins.17$pct_ins <- with(ins.17, insured / total)

ins.12.17 <- inner_join(ins.12,ins.17,by = ("GEOID"="GEOID"), suffix = c("12","17"))

ins.12.17$pct_ins_chg <- with(ins.12.17, pct_ins17 - pct_ins12)

pct_ins.12 <- with(ins.12, sum(insured) / sum(total)) # 0.8927705
pct_ins.17 <- with(ins.17, sum(insured) / sum(total)) # 0.9265638
chg <- pct_ins.17 - pct_ins.12

print(paste0("Percent Insured in 2012: ",as.pct(pct_ins.12),"%"))
print(paste0("Percent Insured in 2017: ",as.pct(pct_ins.17),"%"))
print(paste0("Percent Change: ",as.pct(chg),"%"))

write_csv(ins.12.17,"summary_data/insured_2012_2017.csv")

mhhi.12 <- read_csv("clean_tables/MHHI_2012.csv",col_types = cols())
mhhi.17 <- read_csv("clean_tables/MHHI_2017.csv",col_types = cols())
nm <- c("GEO_ID","MHHI")
ins.12.17.mhhi <- ins.12.17 %>% inner_join(mhhi.12[nm], by = c("GEOID"="GEO_ID")) %>%
  inner_join(mhhi.17[nm], by = c("GEOID"="GEO_ID"),suffix = c("12","17"))

write_csv(ins.12.17,"summary_data/insured_mhhi_2012_2017.csv")
