#Getting the full dataset
file <- "../household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#Creating the working subset
workingData <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
#Creating the needed variables for the plot
dateTime <- as.POSIXct(paste(as.Date(workingData$Date), workingData$Time))
globalActivePower <- as.numeric(workingData$Global_active_power)
subMetering1 <- as.numeric(workingData$Sub_metering_1)
subMetering2 <- as.numeric(workingData$Sub_metering_2)
subMetering3 <- as.numeric(workingData$Sub_metering_3)
#Making the plot
png("plot3.png", width=480, height=480)
plot(dateTime, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(dateTime, subMetering2, type = "l", col = "red")
lines(dateTime, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
#Saving in the graphic device
dev.off()