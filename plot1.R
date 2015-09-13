#plot setting:
# 1 row 1 column
# square plotting region
par(mar=c(4,4,2,2), mfrow=c(1,1), pty = "s")
z <- read.zoo("household_power_consumption.txt", sep=";", header=TRUE, format = "%d/%m/%Y")
sub_z <- window(z, start = "2007-02-01", end = "2007-02-02")
plot(x <- hist(as.numeric(sub_z[,2])), xlab = "Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
#reset to previous setting
par(op)