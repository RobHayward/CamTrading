# the bond yield and trendline
da <- read.csv('./Data/Bond.csv')
head(da)
da[,1] <- as.Date(da$DATE, format = '%Y-%m-%d')
colnames(da) <- c("Date", "Yield")
plot(da, type = 'l', main = "US 10-year bond yield")
y <- c(10, 1.0)
x <- c(6085, 20050)
lines(x, y)
  