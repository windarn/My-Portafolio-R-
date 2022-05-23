library(OpenImageR)
library(ClusterR)


img <- readImage("data/Tema 5/bird.jpg")

img.resize <- resizeImage(img, 350, 350, 
                          method = "bilinear")

imageShow(img.resize)

img.vector <- apply(img.resize, 3, as.vector)
dim(img.vector)


kmmb<-MiniBatchKmeans(img.vector, clusters = 10,
                      batch_size = 20, num_init = 5,
                      max_iters = 100, init_fraction = 0.2,
                      initializer = "kmeans++",
                      early_stop_iter = 10, verbose = F)

kmmb


prmb <- predict_MBatchKMeans(img.vector, kmmb$centroids)

get.cent.mb <- kmmb$centroids
new.img <- get.cent.mb[prmb,]
dim(new.img) <- c(nrow(img.resize), ncol(img.resize),3)
imageShow(new.img)

##########################clara (kmeans)###############################

protein <- read.csv("data/Tema 5/protein.csv")
rownames(protein) = protein$Country
protein$Country = NULL
protein.scaled <- as.data.frame(scale(protein))

library(cluster)
library(factoextra)

km <- pam(protein.scaled, 4)
km


fviz_cluster(km)


clarafit <- clara(protein.scaled, 4, samples = 15)
clarafit

fviz_cluster(clarafit)




















