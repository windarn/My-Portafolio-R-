library(tidyr)

crime.data<- read.csv("data/Tema 1/USArrests.csv", 
                      stringsAsFactors = F)

View(crime.data)

crime.data <- cbind(state = rownames(crime.data), crime.data)


crime.data.1 <- gather(crime.data,
                       key = "crime_type", 
                       value = "arrest_estimate",
                       Murder : UrbanPop)

crime.data.2 <- gather(crime.data,
                       key = "crime_type", 
                       value = "arrest_estimate",
                       -state)

crime.data.3 <- gather(crime.data,
                       key = "crime_type", 
                       value = "arrest_estimate",
                       Murder, Assault)

crime.data.4 <- spread(crime.data.2, 
                       key = "crime_type", 
                       value = "arrest_estimate")


crime.data.5 <- unite(crime.data,
                      col = "Murder_&_Assault",
                      Murder, Assault, sep = "-")


crime.data.6 <- separate(crime.data.5,
                      col = "Murder_&_Assault",
                      into = c("Murder", "Assault"), 
                      sep = "-")


















