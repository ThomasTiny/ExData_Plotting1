library(lubridate)
library(zoo)

#plot setting:
# 1 row 1 column
# square plotting region
par(mar=c(4,4,2,2), mfrow=c(2,2), pty = "s")
z <- read.zoo("household_power_consumption.txt", sep=";", header=TRUE, format = "%d/%m/%Y")
sub_z <- window(z, start = "2007-02-01", end = "2007-02-02")
dateTime <- ymd_hms(paste(index(sub_z[,1]), sub_z[,1]))

#'global acive power' 
Active_pow <- as.numeric(sub_z[,2])
plot(x = dateTime, y = Active_pow, type = "l", xlab = "dateTime", ylab = "Global Active Power")

#'energy sub metering'
sub_meter_1 <- as.numeric(sub_z[ ,6])
sub_meter_2 <- as.numeric(sub_z[ ,7])
sub_meter_3 <- as.numeric(sub_z[ ,8])
plot(x = dateTime, y = sub_meter_1, type = "l", col = "black", xlab = "dateTime", ylab = "Energy Sub Metering")
points(x = dateTime, y = sub_meter_2, type = "l", col = "red")
points(x = dateTime, y = sub_meter_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2)

#'voltage'
voltage <- as.numeric(sub_z[,4])
plot(x = dateTime, y = voltage, type = "l", xlab = "dateTime", ylab = "Voltage")

#'global reactive power'
globalreactivepower <- as.numeric(sub_z[,3])
plot(x = dateTime, y = globalreactivepower, type = "l", xlab = "dateTime", ylab = "Global Reactive Power")

#export png
dev.copy(png, file = "plot4.png")
dev.off()

#reset to previous setting
par(op)