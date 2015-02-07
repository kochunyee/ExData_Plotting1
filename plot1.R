DT <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", skipNul = TRUE, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
d <- subset(DT, as.Date(Date, format="%d/%m/%Y") %in% c(as.Date("2007/2/1"), as.Date("2007/2/2")))

# Plot now
png("plot1.png", width=480, height=480)
with(d, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red"))
dev.off()
