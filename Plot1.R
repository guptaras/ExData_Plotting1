setwd("C:/Users/lenovo/desktop/DataScienceCoursera")
# reading data into csv file
data <- read.csv2("household_power_consumption.txt",header = TRUE, na.strings = "?")

#Getting only required columns
data <- data[,c("Date","Global_active_power")]

# Converting data type
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

# Get the data  between given dates
data <- subset(data, data$Date >="2007-02-01" & data$Date <= "2007-02-02")


# Ploting the Graph
png("Plot1.png",width = 480, height = 480)
hist(data[,"Global_active_power"], main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency", col = "Red")
dev.off()