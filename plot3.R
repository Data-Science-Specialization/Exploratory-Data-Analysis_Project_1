# Load data and subset the required dates (2007-02-01 and 2007-02-02) only
pwr_consumption <- read.table("../household_power_consumption.txt", header = T, 
                              sep = ";", na.strings = '?')
pwr_consumption$Date <- as.Date(pwr_consumption$Date, format = "%d/%m/%Y")
data_subset <- subset(pwr_consumption, pwr_consumption$Date >= "2007-02-01" & 
                          pwr_consumption$Date <= "2007-02-02")

# Create a time vector spanning the two required dates
myTime <- as.POSIXct(paste(data_subset$Date, data_subset$Time), format = "%Y-%m-%d %H:%M:%S")

# Open .png device to save the plot and plot the data
png(filename = "plot3.png")

plot(x = myTime, y = data_subset$Sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy sub metering")
points(x = myTime, y = data_subset$Sub_metering_1, type = "l", col = "black")
points(x = myTime, y = data_subset$Sub_metering_2, type = "l", col = "red")
points(x = myTime, y = data_subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black","red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close .png device
dev.off()