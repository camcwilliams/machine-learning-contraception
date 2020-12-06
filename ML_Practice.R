# CREATING NEW TABLE FROM SAS DATASETS

## Machine Learning Practice Project ##
##      Christine McWilliams         ##

library(haven)
library(tidyr)
library(tidyverse)
library(dplyr)
library(magrittr)
library(ggplot2)


# reading in the separate sas files, these will have formats and labels at attributes

nsfg2015_2017 <- read_sas("C:/Users/Christine McWilliams/Documents/Box/ML_Practice/nsfg2015_2017.sas7bdat")

nsfg2011_2015 <- read_sas("C:/Users/Christine McWilliams/Documents/Box/ML_Practice/nsfg.sas7bdat")

names(nsfg2011_2015) %<>% tolower
names(nsfg2015_2017) %<>% tolower

# keeping vars of interest

elevenToFifteen <- select(nsfg2011_2015, caseid, rscrage, constat1, agebaby1, 
                          hieduc, hisprace, poverty, parity, rwant, rmarital, curr_ins, 
                          cmintvw, quarter, phase, intvwyear)
fifteenToSeventeen <- select(nsfg2015_2017, caseid, rscrage, constat1, agebaby1, 
                             hieduc, hisprace, poverty, parity, rwant, rmarital, curr_ins, 
                             cmintvw, quarter, phase, intvwyear)

# creating flag to identify the source table

fifteenToSeventeen$fifteenToSeventeen <- 1

tb <- bind_rows(elevenToFifteen, fifteenToSeventeen)

write_sas(tb, "C:/Users/Christine McWilliams/Documents/Box/ML_Practice/nsfg2011_2017.sas7bdat")

table(tb$fifteenToSeventeen)
table(fifteenToSeventeen$rscrage > 44)

ggplot(elevenToFifteen, aes(x=cmintvw)) + geom_histogram(binwidth = 1)

str(tb)











