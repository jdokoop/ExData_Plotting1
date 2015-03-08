plot2 <- function(){
  #Read data from file
  #Read only data of interest from 1-2-07 to 2-2-07
  data <- read.table(file="household_power_consumption.txt", sep = ";", na.strings = "?", skip = 66638, nrows = 2879, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #Reformat date
  dates <-strptime(as.character(data$Date), "%d/%m/%Y")
  data <- data[,2:ncol(data)]
  data <- cbind(dates,data)
  
  #Plot 2
  png("plot2.png", width=480, height=480)
  plot(as.POSIXct(paste(data$dates,data$Time)), data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type="l")
  dev.off()
}