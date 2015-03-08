plot3 <- function(){
  #Read data from file
  #Read only data of interest from 1-2-07 to 2-2-07
  data <- read.table(file="household_power_consumption.txt", sep = ";", na.strings = "?", skip = 66638, nrows = 2879, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #Reformat date
  dates <-strptime(as.character(data$Date), "%d/%m/%Y")
  data <- data[,2:ncol(data)]
  data <- cbind(dates,data)
  
  #Plot 3
  png("plot3.png", width=480, height=480)
  plot(as.POSIXct(paste(data$dates,data$Time)), data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="l")
  lines(as.POSIXct(paste(data$dates,data$Time)), data$Sub_metering_2, ylab = "Energy sub metering", xlab = "", type="l", col="red")
  lines(as.POSIXct(paste(data$dates,data$Time)), data$Sub_metering_3, ylab = "Energy sub metering", xlab = "", type="l", col="blue")
  
  legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c('black', 'red', 'blue'), border="black")
  dev.off()
}