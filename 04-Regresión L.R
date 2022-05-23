library(caret)
auto <- read.csv("data/Tema 4/auto-mpg.csv")
auto$cylinders <- factor(auto$cylinders,
                         levels = c(3,4,5,6,8),
                         labels = c("3c", "4c", "5c", "6c", "8c"))

set.seed(2021)
t.id <- createDataPartition(auto$mpg, p = 0.7, list = F)
names(auto)

mod <- lm(mpg ~ ., data = auto[t.id,-c(1,8,9)])

mod

summary(mod)

boxplot(mod$residuals)


sqrt(mean((mod$fitted.values - auto[t.id,]$mpg)^2))

pred <- predict(mod, auto[-t.id, -c(1,8,9)])
sqrt(mean((pred - auto[-t.id,]$mpg)^2))

par(mfrow=c(2,2))
plot(mod)

auto <- within(auto, 
               cylinders <- relevel(cylinders, ref="4c"))
mod <- lm(mpg ~. , data = auto[t.id, -c(1,8,9)])
summary(mod)
pred <- predict(mod, auto[-t.id, -c(1,8,9)])
sqrt(mean((pred-auto[-t.id,]$mpg)^2))
plot(mod)

library(MASS)

mod
summary(mod)

step.model <- stepAIC(mod, direction="backward")
summary(step.model)

















