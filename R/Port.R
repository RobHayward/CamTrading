# Now file to test the portfolio performance
da1 <- read.csv('./Data/SPY.csv')
da1[,1] <- as.Date(da1[,1], format = '%Y-%m-%d')
da2 <- read.csv('./Data/TLT.csv')
da2[,1] <- as.Date(da2[,1], format = '%Y-%m-%d')
da <- merge(da1, da2, by = 'Index')
head(da)
tail(da)
da <- da[,c(1, 7, 12)]
colnames(da) <- c('Date', 'SPY', 'TLT')
# calculate the number of shares for 50:50 split.  Assume 1000 dollars
spynum <- 500/da$SPY[1]
tltnum <- 500/da$TLT[1]
da$portvalue <- da$SPY*spynum + da$TLT*tltnum
head(da)
plot(da$Date, da$portvalue, type = 'l')
# Create function to re-base the parts of the portfolio for comparison
rebalance <- function(x){
  x/x[1]*100
}
da$rebasePort <- rebalance(da$portvalue)
da$rebasespy <- rebalance(da$SPY)
da$rebasetlt <- rebalance(da$TLT)

plot(da$Date, da$rebasePort, type = 'l', xlab = "Date", ylab = "Re-based Value", 
     main = "Portfolio Performance")
lines(da$Date, da$rebasetlt, col = 'DarkGreen')
lines(da$Date, da$rebasespy, col = 'Brown')
legend('topleft', c('Portfolio', 'SPY', 'TLT'), lty = 1, 
       col = c("Black", "DarkGreen", "Brown"))
# write the file to the directory so that it can be used in teh slides
write.csv(da, file = './Data/port.csv')
da$SPYl <- c(rep(NA, 1), da$SPY)[1:length(da$SPY)]
da$SPYR <- (da$SPY - da$SPYl)/da$SPYl
da$TLTl <- c(rep(NA, 1), da$TLT)[1:length(da$TLT)]
da$TLTR <- (da$TLT - da$TLTl)/da$TLTl
da$Portl <- c(rep(NA, 1), da$portvalue)[1:length(da$portvalue)]
da$PORTR <- (da$portvalue - da$Portl)/da$Portl

head(da)
str(da)
mystats <- function(x){
x <- x[!is.na(x)]
n <- length(x)
m <- mean(x)
AnnRet <- ((m + 1)^250-1)*100
s <- sd(x) 
AnnVol <- s * 250^0.5 * 100
max <- max(x)
min <- min(x)
return(data.frame(N=n, AnnRet = AnnRet, AnnVol = AnnVol, Sharpe = AnnRet/AnnVol, 
                  DailyMax = 100 * max, DailyMin = 100 * min))
       
}
a <- mystats(x = c(da$SPYR, da$TLTR, da$PORTR))
round(a, 2)
require(xtable)
xtable(a)
a
plot(da$Date, da$SPYR, type = 'l', main = "SPY VOlatilkty", xlab = "Date", ylab = "Return")
sd(da$SPYR, na.rm = TRUE)*250^0.5
#===================calculate weights
da$SPY[dim(da)[1]]*500/da$SPY[1]/da$portvalue[dim(da)[1]]*100
da$TLT[dim(da)[1]]*500/da$TLT[1]/da$portvalue[dim(da)[1]]*100
