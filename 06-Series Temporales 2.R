s <- read.csv("data/Tema 6/ts-example.csv")
head(s)

s.ts <- ts(s)
class(s.ts)
head(s.ts)
plot(s.ts)

s.ts.a <- ts(s, start = 2001)
s.ts.a
plot(s.ts.a)


s.ts.m <- ts(s, start = c(2001,1), frequency = 12)
s.ts.m
plot(s.ts.m)


s.ts.q <- ts(s, start = 2001, frequency = 4)
s.ts.q
plot(s.ts.q)



start(s.ts.m)
end(s.ts.m)
frequency(s.ts.m)

start(s.ts.q)
end(s.ts.q)
frequency(s.ts.q)


prices <- read.csv("data/Tema 6/prices.csv")
head(prices)

prices.ts <- ts(prices, start = c(1980,1), frequency = 12)
prices.ts
plot(prices.ts)

plot(prices.ts, plot.type = "single", col = 1:2)
legend("topleft", colnames(prices.ts), col = 1:2, lty = 1)

#log(a*b) = log (a) + log(b)

#Descomposición de una serie temporal 

#stl
#Seasonal Decomposition of Time Series by Loess
flour.l <- log(prices.ts[,1])
flour.stl<- stl(flour.l, s.window = "period")
plot(flour.stl)
flour.stl

gas.l <- log(prices.ts[,2])
gas.stl <- stl(gas.l, s.window = "period")
plot(gas.stl)


#decompose
#Classical Seasonal Decomposition by Moving Averages
flour.dec <- decompose(flour.l)
plot(flour.dec)

gas.dec <- decompose(gas.l)
plot(gas.dec)



gas.season.adjusted <- prices.ts[,2] - (gas.dec$seasonal)
plot(gas.season.adjusted)

n <- 12
gas.f.1 <- filter(prices.ts[,2], filter = rep(1/n, n), sides = 2)
gas.f.2 <- filter(prices.ts[,2], filter = rep(1/n,n), sides = 1)
plot(prices.ts[,2])
lines(gas.f.1, col = "blue", lwd = 3)
lines(gas.f.2, col = "red", lwd = 3)


######################################################################
wmt <- read.csv("data/Tema 6/WMT.csv", stringsAsFactors = F)

plot(wmt$Adj.Close, type = "l")

d <- diff(wmt$Adj.Close)

head(d)
plot(d, type = "l")

hist(d, prob = T, ylim = c(0,0.8), breaks = 30, main = "Walmart Stocks", col = "green")
lines(density(d), lwd = 3)

wmt.m <- read.csv("data/Tema 6/WMT-monthly.csv", stringsAsFactors = F)
#wmt.m <- wmt.m[2:nrow(wmt.m),]
#wmt.m$Date <- as.Date(wmt.m$Date)
wmt.m.ts <- ts(wmt.m$Adj.Close)

d <- diff(as.numeric(wmt.m.ts))
d

wmt.m.return <- d/lag(as.numeric(wmt.m.ts), k = -1)
hist(wmt.m.return, prob = T, col = "blue")

