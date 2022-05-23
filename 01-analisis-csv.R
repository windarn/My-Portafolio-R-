getwd()
setwd("C:/Users/dguai/Documents/Courses/Machine Learning Data Science en RStudio/Practicas/")
auto = read.csv("data/Tema 1/auto-mpg.csv", header = TRUE, sep = ",")
names(auto)

auto_no_header <- read.csv("data/Tema 1/auto-mpg-noheader.csv", header = FALSE)
head(auto_no_header, 4)

auto_custom = read.csv("data/Tema 1/auto-mpg-noheader.csv", 
                       header = FALSE, 
                       col.names = c("numero", "mpg", "cilindrada", "desplazamiento", 
                                     "cp", "peso", "acc", "año", "modelo"
                                     )
                       )
head(auto_custom, 5)

#NA : not available
#strings.na = ""
#as.character()

who_from_web <- read.csv("https://frogames.es/course-contents/r/intro/tema1/WHO.csv")

#########Analisis de XML#################

library(XML)

url <- "data/Tema 1/cd_catalog.xml"

xmldoc <- xmlParse(url)
rootnode <- xmlRoot(xmldoc)
rootnode[1]

cds_data <- xmlSApply(rootnode, function(x) xmlSApply(x, xmlValue))
cds.catalog <- data.frame(t(cds_data), row.names = NULL)
head(cds.catalog, 5)
cds.catalog[1:3,]

#xpathSApply()
#getNodeset()

population_url <- "data/Tema 1/WorldPopulation-wiki.htm"
tables <- readHTMLTable(population_url)

most_populated <- tables[[6]]
head(most_populated, 3)

custom_table <- readHTMLTable(population_url, which = 6)

######################JSON############################

library(jsonlite)

dat.1 <- fromJSON("data/Tema 1/students.json")
dat.2 <- fromJSON("data/Tema 1/student-courses.json")

head(dat.1, 3)
dat.1$Email

dat.1[c(2,5,8),]
dat.1[, c(2,5)]

head(dat.2, 3)

###################Fixed Wide Formated#############################

students_data <- read.fwf("data/Tema 1/student-fwf.txt", 
                          widths = c(4, 15, 20, 15, 4), 
                          col.names = c("id", "nombre", "email", "carrera", "año")
                          )
students_data_head <- read.fwf("data/Tema 1/student-fwf-header.txt", 
                               widths = c(4, 15, 20, 15, 4),
                               header = TRUE, sep = "\t", skip = 2
                               )
students_data_no_email <- read.fwf("data/Tema 1/student-fwf.txt", 
                          widths = c(4, 15, -20, 15, 4), 
                          col.names = c("id", "nombre", "carrera", "año")
                          )


