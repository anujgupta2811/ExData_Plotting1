#Pass the directory where the file is stored as argument to the function
plot1 <- function(directory)
{
#Reading the file and filtering it with dates 1/2/2007 and 1/2/2007
read_data <- subset(read.table(paste(directory, "household_power_consumption.txt",sep = ""), 
                               header = TRUE, sep = ";"), 
                    Date == "1/2/2007" | Date == "2/2/2007")
#Opening the PNG Device
png(file = "plot1.png")

#Plotting the histogram
hist(as.numeric(as.character(read_data$Global_active_power)), breaks = 15, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
#Closing the PNG Device
dev.off()
}


