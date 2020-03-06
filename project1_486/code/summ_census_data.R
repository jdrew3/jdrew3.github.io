library(readr)
library(stringr)
library(dplyr)

setwd("Z:/ges486/Project1")

ins <- read_csv("clean_tables/health_insurance_by_sex_by_age_2012.csv")

nm<-names(ins)

ins.y.mat <- as.matrix(ins[str_subset(nm,"[.]insured")])
rownames(ins.y.mat) <- ins$GEO_ID
insured <- colSums(t(ins.y.mat))
ins.n.mat <- as.matrix(ins[str_subset(nm,"[.]uninsured")])
rownames(ins.n.mat) <- ins$GEO_ID
uninsured <- colSums(t(ins.n.mat))

summ <- tibble(GEOID = names(insured), 
               insured = insured, uninsured = uninsured)
summ <- mutate(summ, total = insured + uninsured)

write_csv(summ,"insurance_2012.csv")

ins <- read_csv("clean_tables/health_insurance_by_sex_by_age_2017.csv")

nm<-names(ins)

ins.y.mat <- as.matrix(ins[str_subset(nm,"[.]insured")])
rownames(ins.y.mat) <- ins$GEO_ID
insured <- colSums(t(ins.y.mat))
ins.n.mat <- as.matrix(ins[str_subset(nm,"[.]uninsured")])
rownames(ins.n.mat) <- ins$GEO_ID
uninsured <- colSums(t(ins.n.mat))

summ <- tibble(GEOID = names(insured), 
               insured = insured, uninsured = uninsured)
summ <- mutate(summ, total = insured + uninsured)

write_csv(summ,"insurance_2017.csv")
