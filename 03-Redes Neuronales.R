library(nnet)
library(caret)

banknote <- read.csv("data/Tema 3/banknote-authentication.csv")

banknote$class <- factor(banknote$class)

t.ids <- createDataPartition(banknote$class, p = 0.7, list = F)

mod <- nnet(class ~ ., data = banknote[t.ids,], 
            size = 3, maxit = 10000, decay = 0.001, rang = 0.05, 
            na.action = na.omit, skip = T)


pred <- predict(mod, newdata = banknote[-t.ids,], type = "class")

table(banknote[-t.ids,]$class, pred, dnn = c("Actual", "Predichos"))

pred2 <- predict(mod, newdata = banknote[-t.ids,], type = "raw")

library(ROCR)

perf <- performance(prediction(pred2, banknote[-t.ids,"class"]), 
                    "tpr", "fpr")

plot(perf)










