ozone.data <- read.csv("data/Tema 1/ozone.csv", stringsAsFactors = F)

outlier_values <- boxplot(ozone.data$pressure_height,
                          main = "Pressure Height",
                          boxwex = 0.5)



summary(ozone.data$pressure_height)





boxplot(pressure_height ~ Month,
        data = ozone.data,
        main = "Pressure Height per Month")




boxplot(ozone_reading ~ Month,
        data = ozone.data,
        main = "Ozone reading per Month")$out


impute_outliers <- function(x, removeNA = T){
  quantiles <- quantile(x, c(0.05,0.95), na.rm = removeNA)
  x[x<quantiles[1]] <- mean(x, na.rm = removeNA)
  x[x>quantiles[2]] <- median(x, na.rm = removeNA)
  x
}



impute_data <- impute_outliers(ozone.data$pressure_height)


par(mfrow = c(1,2))

boxplot(ozone.data$pressure_height, main = "Presion con outliers")
boxplot(impute_data, main = "Presion con outliers")

replace_outliers <- function(x, removeNA = T){
  qrts <- quantile(x, probs = c(0.25,0.75), na.rm = removeNA)
  caps <- quantile(x, probs = c(.05,.95), na.rm = removeNA)
  iqr <- qrts[2]-qrts[1]
  h <- 1.5 * iqr
  x[x<qrts[1]-h] <- caps[1]
  x[x>qrts[2]+h] <- caps[2]
  x
}

par(mfrow = c(1,2))

capped_pressure_height <- replace_outliers(ozone.data$pressure_height)

boxplot(ozone.data$pressure_height, main = "Presion con outliers")
boxplot(capped_pressure_height, main = "Presion con outliers")

















