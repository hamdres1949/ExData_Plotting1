setwd("/Users/andresparrado/Dropbox/Exploratory Data Analysis/Week 1")

## Downloading the Data
houseurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(houseurl, destfile = "household.zip", method = "curl")
unzip("household.zip")

## Reading the data
power <- read.table("household_power_consumption.txt", header = TRUE, 
                    sep = ";", na.strings = "?")

## Converting and Subsetting
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
c <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02" ,]

## Plot 3
png("plot3.png")
plot(c$Time, c$Sub_metering_1, type = "l", col = "black", xlab = " ", ylab = "Energy sub Metering")
points(c$Time, c$Sub_metering_2, type = "l", col = "red", xlab = " ", ylab = "Energy sub Metering")
points(c$Time, c$Sub_metering_3, type = "l", col = "blue", xlab = " ", ylab = "Energy sub Metering")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
