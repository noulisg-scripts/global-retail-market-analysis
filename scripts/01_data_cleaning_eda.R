library(readr)
library(dplyr)

# Load dataset
sales_data <- read_csv("data/sales_data_sample.csv")

# Basic structure
str(sales_data)
summary(sales_data)

# Remove unnecessary columns
sales_data <- sales_data %>%
  select(-ADDRESSLINE2, -STATE)

# Remove rows with missing POSTALCODE
sales_data <- sales_data %>%
  filter(!is.na(POSTALCODE))

# Check missing values
colSums(is.na(sales_data))
