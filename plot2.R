#Getting the full dataset
file <- "../household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#Creating the working subset
workingData <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
#Creating the needed variables for the plot
dateTime <- as.POSIXct(paste(as.Date(workingData$Date), workingData$Time))
globalActivePower <- as.numeric(workingData$Global_active_power)
#Making the plot
plot(dateTime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
#Saving in the graphic device
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
