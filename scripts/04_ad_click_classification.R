library(readr)
library(caret)
library(e1071)

data <- read_csv("data/advertising.csv")

set.seed(123)
trainIndex <- createDataPartition(data$`Clicked on Ad`, p = .7, list = FALSE)

train <- data[trainIndex, ]
test <- data[-trainIndex, ]

model <- glm(`Clicked on Ad` ~ ., data = train, family = binomial)

pred <- predict(model, test, type = "response")
pred_class <- ifelse(pred > 0.5, 1, 0)

confusionMatrix(factor(pred_class), factor(test$`Clicked on Ad`))
