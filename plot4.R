DT <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", skipNul = TRUE, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
d <- subset(DT, as.Date(Date, format="%d/%m/%Y") %in% c(as.Date("2007/2/1"), as.Date("2007/2/2")))

# Create timestamp variable so that we don't need to re-calcuate x-axis for every plot
d$datetime <- as.POSIXlt(paste(d$Date, d$Time), format="%d/%m/%Y %H:%M:%S")

# Plot now
png("plot4.png", width=480, height=480)

# Set layout
par(mfrow = c(2,2))

# Graph #1
with(d, plot(datetime, Global_active_power, type='l', xlab=NA, ylab="Global Active Power (kilowatts)"))

# Graph #2
with(d, plot(datetime, Voltage, type='l'))

# Graph #3
with(d, {
	 plot(datetime, Sub_metering_1, type='n', xlab=NA, ylab="Energy sub metering")
	 lines(datetime, Sub_metering_1, col="black")
	 lines(datetime, Sub_metering_2, col="red")
	 lines(datetime, Sub_metering_3, col="blue")
})
legend("topright", lty=c(1,1,1), col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

# Graph #4
with(d, plot(datetime, Global_reactive_power, type='l'))

dev.off()
