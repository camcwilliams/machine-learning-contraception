## Machine Learning Practice Project ##
##      Christine McWilliams         ##

library(haven)
library(tidyr)
library(tidyverse)
library(dplyr)
library(magrittr)
library(ggplot2)

setwd("C:/Users/Christine McWilliams/Documents/Box/ML_Practice")

tb <- read_sas("C:/Users/Christine McWilliams/Documents/Box/ML_Practice/nsfg2011_2017.sas7bdat")

# Checking things
str(tb)

table(tb$constat1)

table(tb$fifteenToSeventeen, useNA = "always")


# Create contraception var where those not at risk of unintended pregnancy set to NA
tb <-
  tb %>% 
  mutate(con = case_when(
    constat1 <= 22 | constat1 == 42 ~ constat1
  ))

table(tb$con, useNA = "always")


# Not using contraception but at risk of unintended pregnancy = 1, using contraception = 0
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
table(contraceptors$iud)


# Checking remaining vars to decide what to keep/change
mean(contraceptors$rscrage)
hist(contraceptors$rscrage) # age can be left as-is
hist(contraceptors$agebaby1, breaks=20) # years are coded differently
                                        # categorize to unify
table(contraceptors$hieduc) # change to factors or recode to relevant schooling (or add discontinuity)
table(contraceptors$hisprace) # change to factors but consider not including
hist(contraceptors$poverty) # keep as continuous for now (could do flag for discontinuity at 500, similar to diss)
table(contraceptors$parity)
mean(contraceptors$parity) # keep as continuous for now
table(contraceptors$rwant) # change to factors 
table(contraceptors$rmarital) # change to factors
# currins change to factors
# do I need to change 1/0s to factors??


# Changing relevant continuous vars to factors
fac_vars <- c('hieduc', 'hisprace', 'rwant', 'rmarital', 'curr_ins')
contraceptors[,fac_vars] <- lapply(contraceptors[,fac_vars], factor)
str(contraceptors)

# Creating discontinuity flag for poverty var, just in case
contraceptors$poverty_500 <- ifelse(contraceptors$poverty == 500, 1, 0)


  # fixing agebaby1 discrepancy between years
  # changing the 11-15 survey's age at first birth to reflect real whole years
  contraceptors <- 
    contraceptors %>% 
      mutate(agebaby1_round = case_when(
        fifteenToSeventeen == 1 ~ agebaby1,
        elevenToFifteen == 1 ~ floor(agebaby1/100)
      ))
  
  # forgive me epi gods but categorizing age at first birth
  # tried using cut() but cats did not line up
  contraceptors <-
    contraceptors %>% 
      mutate(agefirstbirth = case_when(
        is.na(agebaby1_round) ~ "nulliparous",
        agebaby1_round >= 11 & agebaby1_round <= 14 ~ "11-14",
        agebaby1_round >= 15 & agebaby1_round <= 19 ~ "15-19",
        agebaby1_round >= 20 & agebaby1_round <= 24 ~ "20-24",
        agebaby1_round >= 25 & agebaby1_round <= 29 ~ "25-29",
        agebaby1_round >= 30 & agebaby1_round <= 34 ~ "30-34",
        agebaby1_round >= 35 & agebaby1_round <= 39 ~ "35-39",
        agebaby1_round >= 40 & agebaby1_round <= 44 ~ "40-44",
        agebaby1_round >= 45 & agebaby1_round <= 49 ~ "45-49"
      ))
  
  # sample_10 <- sample_n(test, 10)
  # table(sample_10$agebaby1_round, sample_10$agefirstbirth)  
  
# Keeping interview year info in case it's needed for later reference
  
# Dropping interim vars
contraceptors <- contraceptors %>% select(-agebaby1, -agebaby1_round)

str(contraceptors)
