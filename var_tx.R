## Machine Learning Practice Project ##
##      Christine McWilliams         ##

library(haven)
library(tidyr)
library(tidyverse)
library(dplyr)
library(magrittr)
library(ggplot2)



tb <- read_sas("C:/Users/Christine McWilliams/Documents/Box/ML_Practice/nsfg2011_2017.sas7bdat")

str(tb)

table(tb$constat1)

# Create contraception var where those not at risk of unintended pregnancy set to nan

tb <-
  tb %>% 
  mutate(con = case_when(
    constat1 <= 22 | constat1 == 42 ~ constat1
  ))

table(tb$con, useNA = "always")

# Not using contraception but at risk of unintended pregnancy

tb <-
  tb %>% 
    mutate(nouse = case_when(
      con == 42 ~ 1,
      con != 42 ~ 0
    ))

# Using IUD vs using something else | contraceptive user

contraceptors <- 
  tb %>%
    filter(con <= 22) %>% 
    mutate(iud = case_when(
      con == 10 ~ 1,
      con != 10 ~ 0
    ))

str(contraceptors)