##################Error cuadrático medio#####################

dat <- read.csv("data/Tema 4/rmse.csv")

rmse <- sqrt(mean((dat$price - dat$pred)^2))

plot(dat$price, dat$pred, xlab = "Actual", ylab = "Predicho")
abline(0,1)

rmse <- function(actual, predicted){
  return(sqrt(mean((actual-predicted)^2)))
}

rmse(dat$price, dat$pred)

##################KNN#########################################

library(dummies)
library(FNN)
library(scales)
library(caret)

edu <- read.csv("data/Tema 4/education.csv")
dms <- dummy(edu$region, sep = "_")
edu <- cbind(edu, dms)

edu$urban.s <- rescale(edu$urban)
edu$income.s <- rescale(edu$income)
edu$under18.s <- rescale(edu$under18)


set.seed(2021)
t.id <- createDataPartition(edu$expense, p = 0.6, list = F)
tr <- edu[t.id, ]
temp <- edu[-t.id, ]
v.id <- createDataPartition(temp$expense, p = 0.5, list = F)
val <- temp[v.id,]
test <- temp[-v.id,]

reg1 <- knn.reg(tr[,7:12], val[,7:12], tr$expense, k=1,
                algorithm = "brute")
rmse1 <- sqrt(mean((reg1$pred-val$expense)^2))
rmse1


reg2 <- knn.reg(tr[,7:12], val[,7:12], tr$expense, k=2,
                algorithm = "brute")
rmse2 <- sqrt(mean((reg1$pred-val$expense)^2))
rmse2

reg3 <- knn.reg(tr[,7:12], val[,7:12], tr$expense, k=3,
                algorithm = "brute")
rmse3 <- sqrt(mean((reg1$pred-val$expense)^2))
rmse3

reg4 <- knn.reg(tr[,7:12], val[,7:12], tr$expense, k=4,
                algorithm = "brute")
rmse4 <- sqrt(mean((reg1$pred-val$expense)^2))
rmse4

errors = c(rmse1, rmse2, rmse3, rmse4)

plot(errors, type = 'o', xlab = "k", ylab = "RMSE")

reg.test <- knn.reg(tr[,7:12], test[,7:12], tr$expense, k=3,
                    algorithm = "brute")
rmse.test <- sqrt(mean((reg1$pred-val$expense)^2))
rmse.test

t.id <- createDataPartition(edu$expense, p = 0.7, list = F)
tr <- edu[t.id, ]
val <- edu[-t.id,]
reg <- knn.reg(tr[,7:12], test = NULL, y = tr$expense,
               k = 3, algorithm = "brute")




rmse.reg <- sqrt(mean(reg$residuals^2))
rmse.reg

##Función para automatizar KNN
rda.knn.reg <- function(tr_predictor, val_predictors,
                        tr_target, val_target, k){
  library(FNN)
  res <- knn.reg(tr_predictor, val_predictors,
                 tr_target, k, algorithm = "brute")
  rmserror <- sqrt(mean((val_target - res$pred)^2))
  cat(paste("RMSE para k = ", toString(k), ": ", rmserror,"\n", sep = ""))
  rmserror
}

##Función para realizar mÃºltiples KNN
rda.knn.reg.multi <- function(tr_predictors, val_predictors,
                              tr_target, val_target, start_k, end_k){
  rms_errors <- vector()
  for(k in start_k:end_k){
    rms_error <- rda.knn.reg(tr_predictors, val_predictors,
                               tr_target, val_target, k)
    rms_errors <- c(rms_errors, rms_error)
  }
  plot(rms_errors, type = 'o', xlab = "k", ylab = "RMSE")
}

rda.knn.reg.multi(tr[,7:12], val[,7:12], 
                  tr$expense, val$expense, 1,10)





























































