 ##Download file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
unzip("household_power_consumption.zip")

##Read data
hpcData <- read.table("household_power_consumption.txt", sep = ';', header=T, na.strings='?', colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

rData <- hpcData[hpcData$Date == "1/2/2007" | hpcData$Date == "2/2/2007",] 
rData$DateTime <- strptime(paste(rData$Date,rData$Time), format = "%d/%m/%Y %H:%M:%S")

##Create plot4 and copy the plot in the png file
##Open png device
png(filename = "plot4.png", width = 480, height = 480, units = "px")

##plot graph with legend
par(mfrow = c(2,2),mar = c(4,4,2,1), oma = c(0,0,2,0))

plot(rData$DateTime,rData$Global_active_power,type="l", xlab="", ylab = "Global Active Power")
plot(rData$DateTime,rData$Voltage, type="l", ylab = "Voltage",xlab="datetime")

plot(rData$DateTime,rData$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
with(rData,lines(DateTime,Sub_metering_2, type="l", col="red"))
with(rData,lines(DateTime,Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1,lwd = 1, col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")

plot(rData$DateTime,rData$Global_reactive_power, type="l", xlab="datetime", ylab = "Global_reactive_power")

##close device
dev.off()