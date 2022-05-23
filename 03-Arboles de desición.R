library(caret)
library(rpart)
library(rpart.plot)

banknote <- read.csv("data/Tema 3/banknote-authentication.csv")



set.seed(2018)
training.ids <- createDataPartition(banknote$class, 
                                    p = 0.7, list = F)

mod <- rpart(class ~ ., data = banknote[training.ids,],
             method = "class",
             control = rpart.control(minsplit = 20, cp = 0.01))

mod

prp(mod, type = 2, extra = 104, nn = T,
    fallen.leaves = T, faclen = 4, varlen = 8,
    shadow.col = "gray")

mod$cptable

mod.pruned <- prune(mod, mod$cptable[6, "CP"])

prp(mod.pruned, type = 2, extra = 104, nn = T,
    fallen.leaves = T, faclen = 4, varlen = 8,
    shadow.col = "gray")

pred.pruned <- predict(mod, banknote[-training.ids,], 
                       type = "class")

table(banknote[-training.ids,]$class, pred.pruned,
      dnn = c("Actual", "Predicho"))

pred.pruned2 <- predict(mod, banknote[-training.ids,], type = "prob")

library(ROCR)

pred <- prediction(pred.pruned2[,2], banknote[-training.ids, "class"])
perf <- performance(pred, "tpr", "fpr")
plot(perf)

#####################Bosques Aleatorios#############################

library(caret)
library(randomForest)

banknote <- read.csv("data/Tema 3/banknote-authentication.csv")

banknote$class <- factor(banknote$class)

set.seed(2018)

training.ids <- createDataPartition(banknote$class, 
                                    p = 0.7, list = F)

mod <- randomForest(x = banknote[training.ids, 1:4],
                    y = banknote[training.ids, 5],
                    ntree = 500, keep.forest = T)

pred <- predict(mod, banknote[-training.ids,], typle = "class")

table(banknote[-training.ids, "class"], pred, 
      dnn = c("Actual", "Predicho"))

probs <- predict(mod, banknote[-training.ids,], type = "prob")

library(ROCR)
head(probs)
pred <- prediction(probs[,2], banknote[-training.ids, "class"])
perf <- performance(pred, "tpr", "fpr")
plot(perf)









