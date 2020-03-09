library(readr)
library(stringr)

setwd("Z:/ges486/Project1")

tab <- "B19013"
yr <- "2012"

csvs <- list.files("tables","overlays.+csv$",full.names = TRUE)

loadCensusCSV <- function(csvfn, na = c("","NA"), col_types = NULL, col_names = TRUE, skip = 0, skip_row = NULL) {
  rawcsv <- read_csv(csvfn,col_types = cols(.default = col_character()))
  nm <- names(rawcsv)
  if(is.null(skip_row)) {
    rawcsv <- rawcsv[str_which(nm,"M$",negate = TRUE)]
  } else {
    rawcsv <- rawcsv[-skip_row,str_which(nm,"M$",negate = TRUE)]
  }
  
  tmp <- tempfile()
  write_csv(rawcsv,tmp)
  read_csv(tmp,col_names = col_names,col_types = col_types, na = na, skip = skip)
}

getCSV <- function(csv_ls,tab,yr) {
  pattern <- paste0(yr,"[.]",tab)
  csv_ls[str_detect(csv_ls,pattern)]
}

csv <- loadCensusCSV(getCSV(csvs,tab,yr),na=c("","NA","-","250,000+"),
                     col_types = cols(),col_names = T,skip_row = 1)
names(csv)[3] <- "MHHI"

write_csv(csv,paste0("clean_tables/MHHI_",yr,".csv"),na="")

yr <- "2017"
csv <- loadCensusCSV(getCSV(csvs,tab,yr),na=c("","NA","-","250,000+"),
                     col_types = cols(),col_names = T,skip_row = 1)
names(csv)[3] <- "MHHI"
write_csv(csv,paste0("clean_tables/MHHI_",yr,".csv"),na="")

tab <- "B27001"
yr <- "2012"

csv <- loadCensusCSV(getCSV(csvs,tab,yr),#na=c("","NA","-","250,000+"),
                     col_types = cols(),col_names = T,skip_row = 1)



bas <- "total"
gen <- c("male","female")
age <- c("under6","6to17","18to24","25to34","35to44","45to54","55to64","65to74","over75")
status <- c("insured","uninsured")

new_nm <- NULL
for(n1 in bas) {
  new_nm <- c(new_nm,n1)
  for(n2 in gen) {
    new_nm <- c(new_nm,paste(n1,n2,sep="."))
    for(n3 in age) {
      new_nm <- c(new_nm,paste(n1,n2,n3,sep="."))
      for(n4 in status) {
        new_nm <- c(new_nm,paste(n1,n2,n3,n4,sep="."))
      }
    }
  }
}

names(csv) <- c(names(csv)[1:2],new_nm)
write_csv(csv,paste0("clean_tables/health_insurance_by_sex_by_age_",yr,".csv"))

yr <- "2017"

csv <- loadCensusCSV(getCSV(csvs,tab,yr),#na=c("","NA","-","250,000+"),
                     col_types = cols(),col_names = T,skip_row = 1)

age <- c("under6","6to18","19to25","26to34","35to44","45to54","55to64","65to74","over75")
new_nm <- NULL
for(n1 in bas) {
  new_nm <- c(new_nm,n1)
  for(n2 in gen) {
    new_nm <- c(new_nm,paste(n1,n2,sep="."))
    for(n3 in age) {
      new_nm <- c(new_nm,paste(n1,n2,n3,sep="."))
      for(n4 in status) {
        new_nm <- c(new_nm,paste(n1,n2,n3,n4,sep="."))
      }
    }
  }
}


names(csv) <- c(names(csv)[1:2],new_nm)
write_csv(csv,paste0("clean_tables/health_insurance_by_sex_by_age_",yr,".csv"))

tab <- "B27015"
yr <- "2012"

csv <- loadCensusCSV(getCSV(csvs,tab,yr),#na=c("","NA","-","250,000+"),
                     col_types = cols(),col_names = T,skip_row = 1)
bas <- "total"
mhhi <- c("under25K","25Kto50K","50Kto75K","75Kto100K","100Kplus")
status <- c("insured","uninsured")
type <- c("private","public")

new_nm <- NULL
for(n1 in bas) {
  new_nm <- c(new_nm,n1)
  for(n2 in mhhi) {
    new_nm <- c(new_nm,paste(n1,n2,sep="."))
    n3 <- status[1]
    new_nm <- c(new_nm,paste(n1,n2,n3,sep="."))
    for(n4 in type) {
      new_nm <- c(new_nm,paste(n1,n2,n3,n4,sep="."))
    }
    n3 <- status[2]
    new_nm <- c(new_nm,paste(n1,n2,n3,sep="."))
  }
}
names(csv) <- c(names(csv)[1:2],new_nm)
write_csv(csv,paste0("clean_tables/health_insurance_by_mhhi_by_type_",yr,".csv"))

yr <- "2017"

csv <- loadCensusCSV(getCSV(csvs,tab,yr),#na=c("","NA","-","250,000+"),
                     col_types = cols(),col_names = T,skip_row = 1)

names(csv) <- c(names(csv)[1:2],new_nm)
write_csv(csv,paste0("clean_tables/health_insurance_by_mhhi_by_type_",yr,".csv"))
