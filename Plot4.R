setwd("C:/Users/lenovo/desktop/DataScienceCoursera")
# reading data into csv file
data <- read.csv2("household_power_consumption.txt",header = TRUE, na.strings = "?")

data$Date <# Converting data type- as.character(data$Date)
data$Time <- as.character(data$Time)
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime,"%d/%m/%Y %H:%M:%S")


# Get the data  between given dates
data <- subset(data, data$datetime >="2007-02-01" & data$datetime < "2007-02-03")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

# Ploting the Graph
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(data[, "datetime"], data[, "Global_active_power"], type="l", xlab="", ylab="Global Active Power")

plot(data[, "datetime"],data[, "Voltage"], type="l", xlab="datetime", ylab="Voltage")


plot(data[, "datetime"], data[, "Sub_metering_1"], type="l", xlab="", ylab="Energy sub metering")
lines(data[, "datetime"], data[, "Sub_metering_2"],col="red")
lines(data[, "datetime"], data[, "Sub_metering_3"],col="blue")

plot(data[, "datetime"], data[,"Global_reactive_power"], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()


legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))



plot(data[, "datetime"], data[, "Sub_metering_1"], type="l", xlab="", ylab="Energy sub metering")
lines(data[, "datetime"], data[, "Sub_metering_2"],col="red")
lines(data[, "datetime"], data[, "Sub_metering_3"],col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.off()

