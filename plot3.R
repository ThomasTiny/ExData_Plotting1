library(lubridate)
library(zoo)

#plot setting:
# 1 row 1 column
# square plotting region
par(mar=c(4,4,2,2), mfrow=c(1,1), pty = "s")

z <- read.table('household_power_consumption.txt', header=TRUE, sep=";")
sub_z <- window(z, start = "2007-02-01", end = "2007-02-02")
dateTime <- ymd_hms(paste(index(sub_z[,1]), sub_z[,1]))
sub_meter_1 <- as.numeric(sub_z[ ,6])
sub_meter_2 <- as.numeric(sub_z[ ,7])
sub_meter_3 <- as.numeric(sub_z[ ,8])
plot(x = dateTime, y = sub_meter_1, type = "l", col = "black", xlab = "dateTime", ylab = "Energy Sub Metering")
points(x = dateTime, y = sub_meter_2, type = "l", col = "red")
points(x = dateTime, y = sub_meter_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2)
dev.copy(png, file = "plot3.png")
dev.off()
