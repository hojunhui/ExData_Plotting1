# Import data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Time <- paste(data$Date,data$Time)

# Change Date and Time column to date and time formats respectively
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")

# Subset data from dates 2007-02-01 and 2007-02-02
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

# Plot time-series graph of global active power
par(mar = c(5,5,4,2))
plot(data$Time,as.numeric(levels(data$Global_active_power)[data$Global_active_power]), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Generate png image of graph
dev.copy(png,'plot2.png')
dev.off()
