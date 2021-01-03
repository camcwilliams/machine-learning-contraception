## Machine Learning Practice Project ##
##      Christine McWilliams         ##

# Build and Test ModelS

library(tidyr)
library(tidyverse)
library(dplyr)
library(magrittr)
library(ggplot2)
library(xgboost)
library(caret)
library(e1071)
library(randomForest)

# TRAINING AND TESTING ON SUBSETS OF THE FULL DATASET, 2011-2017 DATA

# Drop vars I'm not going to use for IUD model
contr_model <- select(contraceptors, -caseid, -constat1, -agebaby1, -elevenToFifteen, -fifteenToSeventeen, -con, -nouse, -agebaby1_round)

# Make outcome a factor to run CART
contr_model$iud <- as_factor(contr_model$iud)

contr_model <- 
  contr_model %>% 
    mutate(iud = case_when(
      iud == "1" ~ "IUD",
      iud == "0" ~ "contr not IUD"
    ))

table(contr_model$iud)


str(contr_model)

# Create train/test split
# Following along from https://www.youtube.com/watch?v=8-LriJaYuQw

inTraining <- createDataPartition(contr_model$iud, p = .75, list = FALSE)
training <- contr_model[ inTraining,]
testing <- contr_model[-inTraining,]


# 10-fold cross-validation (keeping repeat at 1 for now)
fitControl <- trainControl(method = "repeatedcv", number = 10, repeats = 1)


# ML MODELS


# Train CART, checking system time for fun, CART is fast tho
system.time(
cartfit1 <- train(iud~., data = training, method = "rpart", trControl=fitControl)
)

cartfit1

ggplot(cartfit1)

  # Predict on test set
  pred_iud <- predict(cartfit1, newdata = testing)
  
  str(pred_iud)
  
  prob_iud <- predict(cartfit1, newdata = testing, type = "prob")
  
  head(prob_iud)
  
  confusionMatrix(data = pred_iud, testing$iud)


# Train Random Forest
system.time(
rffit <- train(iud~., data = training, method = "rf", trControl = fitControl)
)


