setwd("C:/Users/lenovo/desktop/DataScienceCoursera")
# reading data into csv file
data <- read.csv2("household_power_consumption.txt",header = TRUE, na.strings = "?")
#Getting only required columns
data <- data[,c("Date","Time","Global_active_power")]
# Converting data type
data$Date <- as.character(data$Date)
data$Time <- as.character(data$Time)
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime,"%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,"%d/%m/%Y")

# Get the data  between given dates
data <- subset(data, data$Date >="2007-02-01" & data$Date < "2007-02-03")

# Ploting the Graph
png("plot2.png", width=480, height=480)
plot(x= data[,"datetime"], y= data[,"Global_active_power"], type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
