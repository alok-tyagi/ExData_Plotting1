 ##Download file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
unzip("household_power_consumption.zip")

##Read data
hpcData <- read.table("household_power_consumption.txt", sep = ';', header=T, na.strings='?', colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

rData <- hpcData[hpcData$Date == "1/2/2007" | hpcData$Date == "2/2/2007",] 
rData$DateTime <- strptime(paste(rData$Date,rData$Time), format = "%d/%m/%Y %H:%M:%S")

##Create plot1 and copy the plot in the png file
##Open png device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

##plot histogram
hist(rData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

##close device
dev.off()