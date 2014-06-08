
get_data <- function() {
  data <- read.csv("household_power_consumption.txt", sep=";")
  #data <- read.csv("household_power_consumption.txt", sep=";", colClasses=c("character", "character", rep("numeric",7)))
  data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M") 
  sel <- which(data$datetime>=strptime("2007-02-01 00:00","%Y-%m-%d %H:%M") & data$datetime<strptime("2007-02-03 00:00","%Y-%m-%d %H:%M"))
  data <- data[sel,]
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
  data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
  data$Voltage <- as.numeric(as.character(data$Voltage))
  data$Global_intensity <- as.numeric(as.character(data$Global_intensity))
  data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_3))
  data
}

data <- get_data()
hist(data$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)") 
dev.copy(png,'plot1.png', width=480, height=480, bg = "white")
dev.off()
