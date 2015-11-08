pwr_consumption <- read.table("../household_power_consumption.txt", header=T, 
                              sep = ";", na.strings= '?')

pwr_consumption$Date <- as.Date(pwr_consumption$Date, format = "%d/%m/%Y")

data_subset <- subset(pwr_consumption, pwr_consumption$Date>="2007-02-01" & 
                                       pwr_consumption$Date <= "2007-02-02")

hist(data_subset$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)",
    main="Global Active Power")

dev.copy(png, filename = "plot1.png")
dev.off()