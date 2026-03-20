library(dplyr)
library(readr)
library(zoo)

features <- read_csv("data/Features data set.csv")
sales <- read_csv("data/sales data-set.csv")
stores <- read_csv("data/stores data-set.csv")

merged <- merge(features, sales, by = c("Store","Date"))
final_data <- merge(merged, stores, by = "Store")

# Impute missing values
final_data$Weekly_Sales[is.na(final_data$Weekly_Sales)] <- median(final_data$Weekly_Sales, na.rm = TRUE)

# Regression model
model <- lm(Weekly_Sales ~ Temperature + Fuel_Price, data = final_data)

summary(model)
