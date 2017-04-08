#Pass the directory where the file is stored as argument to the function
plot4 <- function(directory)
{
#Reading the file and filtering it with dates 1/2/2007 and 1/2/2007
  read_data <- subset(read.table(paste(directory, "household_power_consumption.txt",sep = ""), 
                                 header = TRUE, sep = ";"), 
                      Date == "1/2/2007" | Date == "2/2/2007")

#Converting the class of the data frame
  read_data$Date_Time <- as.POSIXlt(as.character(paste(read_data$Date, read_data$Time, sep = " ")), format = "%d/%m/%Y %H:%M:%S")
  read_data$Sub_metering_1 <- as.numeric(as.character(read_data$Sub_metering_1))
  read_data$Sub_metering_2 <- as.numeric(as.character(read_data$Sub_metering_2))
  read_data$Global_active_power <- as.numeric(as.character(read_data$Global_active_power))
  read_data$Global_reactive_power <- as.numeric(as.character(read_data$Global_reactive_power))
  read_data$Voltage <- as.numeric(as.character(read_data$Voltage))

#Opening the PNG Device
  png(file = "plot4.png")

#Multiple Graphs
  par(mfrow = c(2,2))

#Plotting the Multiple Graphs
  with(read_data, plot(Date_Time,Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))
  axis(side = 2, lwd = 2)
  with(read_data, plot(Date_Time,Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))
  axis(side = 2, lwd = 2)
  with(read_data, plot(Date_Time,Sub_metering_1, type = "l", col="black", ylab = "Energy sub metering", xlab = ""))
  lines(read_data$Date_Time,read_data$Sub_metering_2, type = "l", col="red")
  lines(read_data$Date_Time,read_data$Sub_metering_3, type = "l", col="blue")
  axis(side = 2, lwd = 2)
  legend("topright", col = c("black", "red", "blue"), bty = "n", lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  with(read_data, plot(Date_Time,Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))
  axis(side = 2, lwd = 2)

#Closing the PNG Device
  dev.off()
  
}