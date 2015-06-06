plot3 <- function() {
    
    # Read the header and data separately
    header <- read.csv("household_power_consumption.txt", header=FALSE, sep=";", nrows=1)
    plotData <- read.csv("household_power_consumption.txt", header=FALSE, sep=";", nrows=2880, skip=66637)
    
    # Use header names as column names
    colnames( plotData ) <- unlist(header)
    
    # Create a new column with date and time combined
    plotData$Date_time <- strptime(paste(plotData$Date, plotData$Time), format="%d/%m/%Y%H:%M:%S")
    
    # Open a png graphics device
    png(filename="plot3.png", width = 480, height = 480)
    
    plot(plotData$Date_time, plotData$Sub_metering_3, type="n", ylim=c(0, max(plotData$Sub_metering_1, plotData$Sub_metering_2, plotData$Sub_metering_3)), main="", xlab = "", ylab="Energy sub metering")

    lines(plotData$Date_time, plotData$Sub_metering_1, type = "l", col = "black")
    lines(plotData$Date_time, plotData$Sub_metering_2, type = "l", col = "red")
    lines(plotData$Date_time, plotData$Sub_metering_3, type = "l", col = "blue")
    
    legend("topright", lwd = 1, pch=c(NA,NA,NA), col=c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    dev.off()
    
}
