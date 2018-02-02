# CAPE
library(xts)
names <- c("Date", "S&P", "Dividend", "Earnings", "CPI", "Date.frac", "Long rate", "Real price", "Real dividend", "Real earnings", "PE10")
da2 <- read.csv("./Data/ie_data.csv", skip = 7, stringsAsFactors = FALSE)
da2 <- da2[, c(1, dim(da2)[2])]
da2$Date <- as.yearmon(da2$Date, format = "&Y.%m")
plot(da2$Date, da2$CAPE, type = 'l', main = "CAPE 1871 to 2018", 
     ylab = "CAPE", xlab = "Year")
text(1966, 26, "24.1 Jan 1966", col = "DarkGreen")
text(2018, 25, "23.7 2018", col = "DarkGreen")
#text(1925, 34, "32.6 Jan 1929", col = "DarkGreen")
text(1982, 44, "44.2 Dec 1999", col = "DarkGreen")
@