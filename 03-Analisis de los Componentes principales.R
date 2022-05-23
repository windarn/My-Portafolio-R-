us_arrests <- read.csv("data/Tema 3/USArrests.csv", stringsAsFactors = F)

rownames(us_arrests) <- us_arrests$X
us_arrests$X <- NULL

head(us_arrests)





apply(us_arrests, 2, var)

acp <- prcomp(us_arrests, 
              center = T, scale = T)

acp

plot(acp, type = "l")

summary(acp)

biplot(acp, scale = 0)

pc1 <- apply(acp$rotation[,1]*us_arrests, 1, sum)
pc2 <- apply(acp$rotation[,2]*us_arrests, 1, sum)

us_arrests$pc1 <- pc1
us_arrests$pc2 <- pc2

us_arrests[,1:4] <- NULL








