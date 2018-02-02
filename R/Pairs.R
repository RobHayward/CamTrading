#Paris
da1 <- read.csv('./Data/COKE.csv', colClasses=c('Date'='Date'))
da2 <- read.csv('./Data/PEP.csv', colClasses=c('Date'='Date'))
da <- merge(da1, da2, by = 'Date')
par(mfrow = c(1, 2))
plot(da$Close.y ~ da2$Date, main = "Pepsi", xlab = "Date", ylab = "Share price", type = 'l')
plot(da$Close.x ~ da2$Date, main = "Coke", xlab = "Date", ylab = "Share price", type = 'l')
head(da)
tail(da)
