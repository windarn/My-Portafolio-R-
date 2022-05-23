library(e1071)
library(naivebayes)
library(caret)

ep <- read.csv("data/Tema 3/electronics-purchase.csv")

set.seed(2021)

t.ids <- createDataPartition(ep$Purchase, p = 0.67, list = F)

mod <- naiveBayes(Purchase ~ ., data = ep[t.ids,])

mod

pred <- predict(mod, ep[-t.ids,])

tab <- table(ep[-t.ids,]$Purchase, pred, dnn = c("Actual", "Predicha"))
confusionMatrix(tab)


