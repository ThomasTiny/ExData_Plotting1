library(lubridate)
library(zoo)

#plot setting:
# 1 row 1 column
# square plotting region
par(mar=c(4,4,2,2), mfrow=c(1,1), pty = "s")

z <- read.zoo("household_power_consumption.txt", sep=";", header=TRUE, format = "%d/%m/%Y")
sub_z <- window(z, start = "2007-02-01", end = "2007-02-02")
dateTime <- ymd_hms(paste(index(sub_z[,1]), sub_z[,1]))
Active_pow <- as.numeric(sub_z[,2])
plot(x = dateTime, y = Active_pow, type = "l", xlab = "dateTime", ylab = "Global Active Power")
dev.copy(png, file = "plot2.png")
dev.off()

#reset to previous setting
#par(op)