

#this code reads in data on houshold power consumption from the working directory;
#the data is from the days 1/2/2007 and 2/2/2007;
#it then plots the 3 sub metering observations over time for three zones of household power usage;
#it saves the plot as a png file to the working directory

#first read in a bit of data and save column names as a vector for later read.table call
someData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)
Cnames <- colnames(someData)

#read in the subset of the data for the two days; subset starts at row 6638
plotData <- read.table("household_power_consumption.txt", col.names=Cnames, sep=";", na.strings="?", skip=66637, nrows=2880)

#add a column with date/time class for processing time in plot
plotData$Date <- as.Date(plotData$Date, "%d/%m/%Y")
plotData$DateTime <- strptime(paste(plotData$Date, plotData$Time), format="%Y-%m-%d %H:%M:%S")

png(file="plot3.png")

plot(plotData$DateTime, plotData$Sub_metering_1, type="n",xlab="", ylab="Energy sub metering")
lines(plotData$DateTime, plotData$Sub_metering_1)
lines(plotData$DateTime, plotData$Sub_metering_2, col="red")
lines(plotData$DateTime, plotData$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch="—")


dev.off()


