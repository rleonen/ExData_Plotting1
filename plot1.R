# this script must execute in the same directory as the data file 'household_power_consumption.txt'
# the data file may be downloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# this script also requires the chron libary to be loaded.

# read entire data set
hpc <- read.table("household_power_consumption.txt"
                  ,sep=c(";",".")
                  ,header=TRUE
                  ,na.strings="?")

# change hpc$Date column to proper data type
hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")
hpc$Time <- times(hpc$Time)

# subset to 02/01/2007 and 02/02/2007
hpc2 <- hpc[hpc$Date == as.Date("2007-02-01") | hpc$Date == as.Date("2007-02-02"),]

png(file="plot1.png")
hist(hpc2$Global_active_power
     ,col="red"
     ,xlab="Global Active Power (kilowatts)"
     ,main="Global Active Power"
     ,ylim=c(0,1200))

dev.off()
