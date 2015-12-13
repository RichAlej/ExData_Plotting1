

#this code reads in data on houshold power consumption from the working directory;
#the data is from the days 1/2/2007 and 2/2/2007;
#it then plots the frequency of global active power as a histogram;
#it saves the plot as a png file to the working directory

#first read in a bit of data and save column names as a vector for later read.table call
someData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)
Cnames <- colnames(someData)

#read in the subset of the data for the two days; subset starts at row 6638
plotData <- read.table("household_power_consumption.txt", col.names=Cnames, sep=";", na.strings="?", skip=66637, nrows=2880)


png(file="plot1.png")

hist(plotData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()


