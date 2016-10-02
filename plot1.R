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

## Plot 1
png("plot1.png")
hist(c$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)", xlim = c(0,6))
dev.off()