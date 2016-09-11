#Getting the full dataset
file <- "../household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#Creating the working subset
workingData <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
#Creating the needed variables for the plot
globalActivePower <- as.numeric(workingData$Global_active_power)
#Making the plot
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
#Saving in the graphic device
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()