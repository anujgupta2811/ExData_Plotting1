#Pass the directory where the file is stored as argument to the function
plot2 <- function(directory)
{
#Reading the file and filtering it with dates 1/2/2007 and 1/2/2007
  read_data <- subset(read.table(paste(directory, "household_power_consumption.txt",sep = ""), 
                                 header = TRUE, sep = ";"), 
                      Date == "1/2/2007" | Date == "2/2/2007")

#Converting the class of the data frame
  read_data$Date_Time <- as.POSIXlt(as.character(paste(read_data$Date, read_data$Time, sep = " ")), format = "%d/%m/%Y %H:%M:%S")
  read_data$Global_active_power <- as.numeric(as.character(read_data$Global_active_power))

#Opening the PNG Device
  png(file = "plot2.png")
  
#Plotting the Graph
  with(read_data, plot(Date_Time,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
  axis(side = 2, lwd = 2)

#Closing the PNG Device
  dev.off()
}
