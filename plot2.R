plot2 <- function() {
    
    # Read the header and data separately
    header <- read.csv("household_power_consumption.txt", header=FALSE, sep=";", nrows=1)
    plotData <- read.csv("household_power_consumption.txt", header=FALSE, sep=";", nrows=2880, skip=66637)
    
    # Use header names as column names
    colnames( plotData ) <- unlist(header)
    
    # Create a new column with date and time combined
    plotData$Date_time <- strptime(paste(plotData$Date, plotData$Time), format="%d/%m/%Y%H:%M:%S")
    
    # Open a png graphics device
    png(filename="plot2.png", width = 480, height = 480)
    
    plot(plotData$Date_time, plotData$Global_active_power, type="l", main="", xlab = "", ylab="Global active power (kilowatts)")
    
    dev.off()
    
}

