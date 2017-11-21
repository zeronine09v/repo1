importedData <- read.csv("household_power_consumption.txt", sep=';', stringsAsFactors=F, na.strings="?")

importedData$Date <- as.Date(importedData$Date, format="%d/%m/%Y")

#### Subsetting the data
subsetData <- subset(importedData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(importedData)

## Converting dates
dateTime <- paste(as.Date(subsetData$Date), subsetData$Time)
subsetData$Datetime <- as.POSIXct(dateTime)
str(subsetData)

## Plot 3
with(subsetData, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()