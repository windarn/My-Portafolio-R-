#Mosaic Plot
library(stats)
mtcars <- read.csv("data/Tema 7/mtcars.csv")
head(mtcars)

mosaicplot(~ gear + carb, data = mtcars, 
           color=2:7,  las = 1)
