setwd("C:/Users/lenovo/desktop/DataScienceCoursera")
# reading data into csv file
data <- read.csv2("household_power_consumption.txt",header = TRUE, na.strings = "?")

#Getting only required columns
data <- data[,c("Date","Time","Sub_metering_1","Sub_metering_2","Sub_metering_3")]

# Converting data type
data$Date <- as.character(data$Date)
data$Time <- as.character(data$Time)
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime,"%d/%m/%Y %H:%M:%S")


# Get the data  between given dates
data <- subset(data, data$datetime >="2007-02-01" & data$datetime < "2007-02-03")
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))


# Ploting the Graph
png("plot3.png", width=480, height=480)

plot(data[, "datetime"], data[, "Sub_metering_1"], type="l", xlab="", ylab="Energy sub metering")
lines(data[, "datetime"], data[, "Sub_metering_2"],col="red")
lines(data[, "datetime"], data[, "Sub_metering_3"],col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.off()

