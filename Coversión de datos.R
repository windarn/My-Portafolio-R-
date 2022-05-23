students <- read.csv("data/Tema 1/data-conversion.csv")


bp <- c(-Inf, 10000, 31000, Inf)
names <- c("Low", "Average", "High")

students$Income.cat <- cut(students$Income, breaks = bp, labels = names)

students$Income.cat2 <- cut(students$Income, breaks = bp)

students$Income.cat3 <- cut(students$Income, 
                            breaks = 4, 
                            labels = c("L1", "L2", "L3", "L4")
                            )
###############################Dummy Variables##########################################
students <- read.csv("data/Tema 1/data-conversion.csv")
library(dummies)


students.dummy <- dummy.data.frame(students, sep = ".")
names(students.dummy)

dummy(students$Gender, sep = ".")

dummy.data.frame(students, names = c("State", "Gender") ,sep = ".")








