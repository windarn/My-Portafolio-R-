library(caret)

BH <- read.csv("data/Tema 3/boston-housing-logistic.csv")


BH$CLASS <- factor(BH$CLASS, levels = c(0,1))

set.seed(2021)
t.id <- createDataPartition(BH$CLASS, p=0.7, list = F)

mod <- glm(CLASS ~ ., data = BH[t.id, ], family = binomial)
summary(mod)



BH[-t.id, "PROB_SUCCESS"] <- predict(mod, newdata = BH[-t.id,], type="response")

BH[-t.id, "PRED_50"] <- ifelse(BH[-t.id, "PROB_SUCCESS"]>=0.5, 1, 0)

table(BH[-t.id,"CLASS"], BH[-t.id,"PRED_50"], dnn=c("Actual","Predicho"))















