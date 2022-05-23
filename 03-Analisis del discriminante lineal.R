library(MASS)
library(caret)

bn <- read.csv("data/Tema 3/banknote-authentication.csv")

bn$class <- factor(bn$class)

set.seed(2021)


t.id <- createDataPartition(bn$class, p=0.7, list = F)

mod <- lda(bn[t.id,1:4], bn[t.id,5])

bn[t.id, "Pred"] <- predict(mod, bn[t.id, 1:4])$class

table(bn[t.id, "class"], bn[t.id, "Pred"], dnn = c("Actual", "Predichos"))

bn[-t.id, "Pred"] <- predict(mod, bn[-t.id, 1:4])$class

table(bn[-t.id, "class"], bn[-t.id, "Pred"], dnn = c("Actual", "Predichos"))

