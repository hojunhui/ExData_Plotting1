# Import data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Time <- paste(data$Date,data$Time)

# Change Date and Time column to date and time formats respectively
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")

# Subset data from dates 2007-02-01 and 2007-02-02
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

# Plot multiple graphs
par(mfrow = c(2,2), mar = c(5,5,4,2), cex = 0.7)
plot(data$Time,as.numeric(levels(data$Global_active_power)[data$Global_active_power]), type = "l", xlab = "", ylab = "Global Active Power")
plot(data$Time,as.numeric(levels(data$Voltage)[data$Voltage]), type = "l", xlab = "datetime", ylab = "Voltage")
plot(data$Time,as.numeric(levels(data$Sub_metering_1)[data$Sub_metering_1]), type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Time,as.numeric(levels(data$Sub_metering_2)[data$Sub_metering_2]), col = "red")
lines(data$Time,data$Sub_metering_3, col = "blue")
legend("topright", bty = "n", cex = 0.7, lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$Time,as.numeric(levels(data$Global_reactive_power)[data$Global_reactive_power]), type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Generate png image of graphs
dev.copy(png,'plot4.png')
dev.off()
