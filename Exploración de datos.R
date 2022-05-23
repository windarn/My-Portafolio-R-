data <- read.csv("data/Tema 2/auto-mpg.csv", stringsAsFactors = F)


data$cylinders <- factor(data$cylinders, 
                         levels = c(3,4,5,6,8), 
                         labels = c("3cil", "4cil", "5cil", "6cil", "8cil")
                         )
summary(data)

str(data)

summary(data$cylinders)

summary(data$mpg)

str(data$cylinders)

str(data$mpg)
###################################Estadística Básica#################################
library(modeest)
library(raster)
library(moments)

X <- data$mpg

###Medidas de Centralización###############

mean(X)
median(X)
mfv(X)
quantile(X)

###############Medidas de dispersión##################

var(X)
sd(X)
cv(X)

##############Medidas de Asimetría####################

skewness(X)
kurtosis(X)

par(mfrow = c(1,1))
hist(X)

########################Subsets##############################################

#Index by possition

data[1:5, 8:9]
data[1:5, c(8,9)]

#Index by Name
data[1:5, c("model_year", "car_name")]

##Min & MAx de mpg

data[data$mpg == max(data$mpg) | data$mpg == min(data$mpg),]

##Filtro con condiciones

data[data$mpg > 30 & data$cylinders == "6cil", c("car_name", "mpg")]

data[data$mpg > 30 & data$cyl == "4cil", c("car_name", "mpg")]

##Subset

subset(data, mpg > 30 & cylinders == "6cil", select = c("car_name", "mpg"))

##Excluir columnas

data[1:5, c(-1,-9)]
data[1:5, -c(1,9)]

data[1:5, !names(data) %in% c("model_year", "car_name")]

data[data$mpg %in% c(15,20), c("car_name", "mpg")]

data[c(F,F,F,F,T), c(F,F,T)]


#########################Split###############################

#split / unsplit

carlist <- split(data, data$cylinders)

carlist[1] #Objeto de la lista

carlist[[1]] # EL valor asociado

str(carlist[1])

str(carlist[[1]])



























