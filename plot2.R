DT <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", skipNul = TRUE, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
d <- subset(DT, as.Date(Date, format="%d/%m/%Y") %in% c(as.Date("2007/2/1"), as.Date("2007/2/2")))

# Create timestamp variable so that we don't need to re-calcuate x-axis for every plot
d$datetime <- as.POSIXlt(paste(d$Date, d$Time), format="%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
with(d,
	plot(datetime, Global_active_power, type='l', xlab=NA, ylab="Global Active Power (kilowatts)"))

dev.off()
