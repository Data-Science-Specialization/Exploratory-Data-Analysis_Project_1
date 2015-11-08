pwr_consumption <- read.table("../household_power_consumption.txt", header=T, 
                              sep = ";", na.strings= '?')

pwr_consumption$Date <- as.Date(pwr_consumption$Date, format = "%d/%m/%Y")

data_subset <- subset(pwr_consumption, pwr_consumption$Date>="2007-02-01" & 
                          pwr_consumption$Date <= "2007-02-02")

myTime <- as.POSIXct(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S")

plot(x=myTime, data_subset$Global_active_power, type = "l", xlab="",
     ylab="Global Active Power (kilowatts)")

dev.copy(png, filename = "plot2.png")
dev.off()