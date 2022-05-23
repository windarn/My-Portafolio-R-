auto <- read.csv("data/Tema 2/auto-mpg.csv", stringsAsFactors = F)

auto$cylinders <- factor(auto$cylinders,
                         levels = c(3,4,5,6,8),
                         labels = c("3C", "4C", "5C", "6C", "8C"))
library(lattice)



bwplot(~auto$mpg | auto$cylinders,
       main = "MPG según cilindrada",
       xlab = "Millas por Galéon", 
       layout = c(2,3), aspect = 1)


xyplot(mpg~weight | cylinders, data = auto, 
       main = "Peso vs Consumo vs Cilindrada",
       xlab = "Peso (kg)",
       ylab = "Consumo (mpg)")

trellis.par.set(theme = col.whitebg())









