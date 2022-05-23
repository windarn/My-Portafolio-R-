data <- read.csv("data/Tema 1/missing-data.csv", na.strings = "")
data.cleaned <- na.omit(data)



is.na(data[4,2])
is.na(data$Income)


#Limpiar NA de la columna Income
data.income.cleaned <- data[!is.na(data$Income),]

complete.cases(data)

data.cleaned.2 <- data[complete.cases(data), ]

#Convertir los 0 en NA

data$Income[data$Income == 0] <- NA

#Medidas de centralización y dispersión

mean(data$Income)
mean(data$Income, na.rm = T)

sd(data$Income)
sd(data$Income, na.rm = T)

#################Replace Missing##################

data <- read.csv("data/Tema 1/missing-data.csv", na.strings = "")

data$Income.mean <- ifelse(is.na(data$Income), 
                           mean(data$Income, na.rm = T), 
                           data$Income
                           )
rand.impute <- function(x){ 
  missing <- is.na(x)
  n.missing <- sum(missing)
  x.obs <- x[!missing]
  imputed <- x
  imputed[missing] <- sample(x.obs, n.missing, replace = T)
  return(imputed)
}

random.impute.data.frame <- function(dataframe, cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col], "imputed", sep = ".")
    dataframe[name] = rand.impute(dataframe[,col])
  }
  dataframe
}


data <- read.csv("data/Tema 1/missing-data.csv", na.strings = "")
data$Income[data$Income == 0] <- NA
data <- random.impute.data.frame(data, c(1,2))

####################Remove duplicated########################################

family.salary = c(40000,60000,50000,80000,75000,900000,105000)
family.size = c(4,3,2,5,2,7,6)
family.car = c("Lujo","Compacto","Utilitario","Lujo","Utilitario","Compacto","Compacto")



family <- data.frame(family.salary, family.size, family.car)

family.unique <- unique(family)

duplicated(family)

family[duplicated(family),]















