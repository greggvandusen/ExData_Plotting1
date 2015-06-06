plot1 <- function() {

    # Read the header and data separately
    header <- read.csv("household_power_consumption.txt", header=FALSE, sep=";", nrows=1)
    plotData <- read.csv("household_power_consumption.txt", header=FALSE, sep=";", nrows=2880, skip=66637)
    
    # Use header names as column names
    colnames( plotData ) <- unlist(header)
    
    # Convert the date strings to Date objects
    plotData$Date <- as.Date(plotData$Date,format="%d/%m/%Y")
    
    # Open a png graphics device
    png(filename="plot1.png", width = 480, height = 480)
    
    hist(plotData$Global_active_power, col="red", main="Global Active Power", xlab = "Global active power (kilowatts)")
    
    dev.off()
    
}