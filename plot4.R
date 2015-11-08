# Load data and subset the required dates (2007-02-01 and 2007-02-02) only
pwr_consumption <- read.table("../household_power_consumption.txt", header = T, 
                              sep = ";", na.strings = '?')
pwr_consumption$Date <- as.Date(pwr_consumption$Date, format = "%d/%m/%Y")
data_subset <- subset(pwr_consumption, pwr_consumption$Date >= "2007-02-01" & 
                          pwr_consumption$Date <= "2007-02-02")

# Create a time vector spanning the two required dates
myTime <- as.POSIXct(paste(data_subset$Date, data_subset$Time), format = "%Y-%m-%d %H:%M:%S")

# Open .png file to save the data ('copy' doesn't work correctly for the legend)
png(filename = "plot4.png")

# Specify the requirement for 4 subplots and plot the data
par(mfrow = c(2,2))

plot(x = myTime, y = data_subset$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power")

plot(x = myTime, y = data_subset$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage")

plot(x = myTime, y = data_subset$Sub_metering_1, type = "n", xlab="", 
     ylab = "Energy sub metering")

points(x = myTime, y = data_subset$Sub_metering_1, type = "l", col = "black")
points(x = myTime, y = data_subset$Sub_metering_2, type = "l", col = "red")
points(x = myTime, y = data_subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black","red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = "n")

plot(x = myTime, y = data_subset$Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")

# Change the subplot settings back to 1x1
par(mfrow = c(1,1))

# Close the .png file
dev.off()