library(dplyr)

# Top countries by sales
sales_by_country <- sales_data %>%
  group_by(COUNTRY) %>%
  summarise(total_sales = sum(SALES)) %>%
  arrange(desc(total_sales))

top_5 <- head(sales_by_country, 5)

barplot(top_5$total_sales, names.arg = top_5$COUNTRY)

# Monthly analysis
sales_data$ORDERDATE <- as.Date(sales_data$ORDERDATE, format = "%d/%m/%Y")
sales_data$MONTH <- format(sales_data$ORDERDATE, "%m")

monthly_sales <- sales_data %>%
  group_by(MONTH) %>%
  summarise(total_sales = sum(SALES))

barplot(monthly_sales$total_sales)
