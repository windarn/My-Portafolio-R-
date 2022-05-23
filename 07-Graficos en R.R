#Gráficos de dispersión

library(ggplot2)
auto <- read.csv("data/Tema 7/auto-mpg.csv", stringsAsFactors = F)
auto$cylinders <- factor(auto$cylinders,
                         labels = c("3C", "4C", "5C", "6C", "8C"))
head(auto)

plot <- ggplot(auto, aes(weight, mpg))

plot + geom_point()

plot + geom_point(alpha = 1/2, size = 5, 
                  aes(color = factor(cylinders))) + 
  geom_smooth(method = "lm", se = TRUE, col ="green") +
  facet_grid(cylinders~.) +
  theme_bw(base_family = "Arial", base_size = 10)+
  labs(x = "Peso") + labs(y = "Millas por Galeón")+
  labs(title = "Consumo vs Peso")



qplot(x=weight, y = mpg, data = auto,
      geom=c("point", "smooth"), method = "lm", 
      formula = y~x, color = cylinders, 
      main = "Regresión de MPG sobre el Peso")

#############################Line Charts##################################

#Line Charts 
library(ggplot2)
mtcars <- read.csv("data/Tema 7/mtcars.csv", stringsAsFactors = F)
head(mtcars)

plot <- ggplot(mtcars, aes(wt, mpg))
plot + geom_line()
plot + geom_line(linetype = "dashed", color = "red")

plot + geom_line(aes(color = as.factor(carb)))

##########################Bar Graphs########################################

#Bar Graphs 
library(ggplot2)

bike <- read.csv("data/Tema 7/daily-bike-rentals.csv")
bike$season <- factor(bike$season, 
                      levels = c(1,2,3,4),
                      labels = c("Invierno", "Primavera", "Verano", "Otoño"))
bike$workingday <- factor(bike$workingday,
                          levels = c(0,1),
                          labels = c("Día libre", "Día de trabajo"))
bike$weathersit <- factor(bike$weathersit,
                          levels = c(1,2,3),
                          labels = c("Buen tiempo", "Día nublado", "Mal tiempo"))

library(dplyr)
bike.sum = bike %>%
  group_by(season, workingday) %>%
  summarize(rental = sum(cnt))

bike.sum

ggplot(bike.sum, aes(x = season, y = rental, 
                     fill = workingday, label = scales::comma(rental))) +
  geom_bar(show.legend = T, stat = "identity", fill="lightblue", colour = "black") + 
  labs(title = "Alquileres de bicicletas por estación y día") +
  scale_y_continuous(labels = scales::comma) +
  geom_text(size = 3, position = position_stack(vjust = 0.5))





























































