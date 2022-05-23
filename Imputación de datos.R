library(mice)


housing.data = read.csv("data/Tema 1/housing-with-missing-value.csv", stringsAsFactors = F)


columns <- c("ptratio", "rad")

imputed_data <- mice(housing.data[,names(housing.data) %in% columns],
                     m = 5, maxit = 50, method = "pmm", seed = 2021)


complete.data <- mice::complete(imputed_data)


housing.data$ptratio <- complete.data$ptratio
housing.data$rad <- complete.data$rad


anyNA(housing.data)


library(Hmisc)

imputed_arg <- aregImpute(~ptratio + rad, data = housing.data, n.impute = 5)

imputed_arg

imputed_arg$imputed$rad
