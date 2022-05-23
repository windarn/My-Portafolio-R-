clientes <- c("Juan", "Ricardo", "Pedro")
fechas <- as.Date(c("2017-12-27", "2017-11-01", "2018-01-01"))
pago <- c(315, 192.55, 40.15)
pedidos <- data.frame(clientes, fechas, pago)

clientes_vip <- c("Juan", "Ricardo")


save(pedidos, clientes_vip ,file = "data/Tema 1/pedidos_clientes.Rdata")
saveRDS(pedidos, file = "data/Tema 1/pedidos_clt.rds")

remove(pedidos)

load("data/Tema 1/pedidos.Rdata")

orders <- readRDS("data/Tema 1/pedidos.rds")

library(datasets)
data(iris)
data(cars)
summary(iris)
summary(cars)

save.image(file = "data/Tema 1/alldata_1.Rdata")



primes <- c(2,3,5,7,11,13)
pow2 <- c(2,4,16,32,34,128)

save(list = c("primes", "pow2"), file = "primes_et_pow2.Rdata")

attach("primes_et_pow2.Rdata")

###data()




