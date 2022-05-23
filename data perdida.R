housing.data <- read.csv("data/Tema 1/housing-with-missing-value.csv", stringsAsFactors = F)


summary(housing.data)

###Eliminar todas las observaciones que contengan algun NA
housing.data.1 <- na.omit(housing.data)
summary(housing.data.1)

###Eliminar las NAs de ciertas columnas

drop_na <- c("rad")
housing.data.2 <- housing.data[complete.cases(housing.data[,!(names(housing.data))%in% drop_na]),]

summary(housing.data.2)


##Eliminar toda una columna del DF

housing.data$rad <- NULL
summary(housing.data)

drops <- c("rad", "ptratio")

housing.data.3 <- housing.data[,!(names(housing.data)%in% drops)]
summary(housing.data.3)

library(Hmisc)

housing.data.copy1 <- housing.data

housing.data.copy1$ptratio <- impute(housing.data.copy1$ptratio, mean)
housing.data.copy1$rad <- impute(housing.data.copy1$rad, mean)
summary(housing.data.copy1)


housing.data.copy2 <- housing.data
housing.data.copy2$ptratio <- impute(housing.data.copy2$ptratio, 18)
housing.data.copy2$rad <- impute(housing.data.copy2$rad, 7)
summary(housing.data.copy2)

library(mice)
md.pattern(housing.data)

library(VIM)


aggr(housing.data, col = c('green', 'red'), numbers = T, sortVars = T, 
     labels = names(housing.data),
     cex.axis = 0.7, gap = 1, ylab = c("histograma de NAs", "Patron"))

















