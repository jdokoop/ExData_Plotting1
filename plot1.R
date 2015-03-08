plot1 <- function(){
  #Read data from file
  #Read only data of interest from 1-2-07 to 2-2-07
  data <- read.table(file="household_power_consumption.txt", sep = ";", na.strings = "?", skip = 66638, nrows = 2879, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #Plot 1
  png("plot1.png", width=480, height=480)
  hist(data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", ylim = c(0,1200))
  dev.off()
}