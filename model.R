## Machine Learning Practice Project ##
##      Christine McWilliams         ##

# Build and Test XGBoost Model

library(tidyr)
library(tidyverse)
library(dplyr)
library(magrittr)
library(ggplot2)
library(xgboost)

# Create test set containing the 2015-2017 data

test <-
  contraceptors %>% 
    filter(fifteenToSeventeen == 1)

table(test$iud)

# Create training set with 60% of 2011-2015 sample

train <- 
  contraceptors %>% 
    filter(is.na(fifteenToSeventeen)) %>% 
    sample_frac(size = 0.6)

table(train$iud)

# Create cross-validation set with other 40% of 2011-2015 sample

outer_join <- pull(train, caseid)

cv <-
  contraceptors %>% 
    filter(!(caseid %in% outer_join))

table(cv$iud)


### Next step use caret for processing ###