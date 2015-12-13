

#this code reads in data on houshold power consumption from the working directory;
#the data is from the days 1/2/2007 and 2/2/2007;
#it then builds four plots;
#upper left plot is global active power over time as a line graph;
#upper right plot is voltage over time as a line graph;
#lower left plot is a line graph the sub metering observations over time for three zones of household power usage;
#lower right plot is global reactive power over time as a line graph;
#it saves the plots together as one png file to the working directory

#first read in a bit of data and save column names as a vector for later read.table call
someData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)
Cnames <- colnames(someData)

#read in the subset of the data for the two days; subset starts at row 6638
plotData <- read.table("household_power_consumption.txt", col.names=Cnames, sep=";", na.strings="?", skip=66637, nrows=2880)

#add a column with date/time class for processing time in plot
plotData$Date <- as.Date(plotData$Date, "%d/%m/%Y")
plotData$DateTime <- strptime(paste(plotData$Date, plotData$Time), format="%Y-%m-%d %H:%M:%S")

png(file="plot4.png")

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

#upper left plot
plot(plotData$DateTime, plotData$Global_active_power, type="n", xlab="", ylab="Global Active Power")
lines(plotData$DateTime, plotData$Global_active_power)
#upper right plot
plot(plotData$DateTime, plotData$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(plotData$DateTime, plotData$Voltage)
#lower left plot
plot(plotData$DateTime, plotData$Sub_metering_1, type="n",xlab="", ylab="Energy sub metering")
lines(plotData$DateTime, plotData$Sub_metering_1)
lines(plotData$DateTime, plotData$Sub_metering_2, col="red")
lines(plotData$DateTime, plotData$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch="—", bty="n")
#lower right plot
plot(plotData$DateTime, plotData$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(plotData$DateTime, plotData$Global_reactive_power)


dev.off()


