importedData <- read.csv("household_power_consumption.txt", sep=';', stringsAsFactors=F, na.strings="?")

importedData$Date <- as.Date(importedData$Date, format="%d/%m/%Y")

#### Subsetting the data
subsetData <- subset(importedData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(importedData)

## Converting dates
dateTime <- paste(as.Date(subsetData$Date), subsetData$Time)
subsetData$Datetime <- as.POSIXct(dateTime)
str(subsetData)

## Plot 2
plot(subsetData$Global_active_power~subsetData$Datetime, type="l",
    ylab="Global Active Power (kilowatts)", xlab="")
## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()