# this script must execute in the same directory as the data file 'household_power_consumption.txt'
# the data file may be downloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# read entire data set
hpc <- read.table("household_power_consumption.txt"
                  ,sep=c(";",".")
                  ,header=TRUE
                  ,na.strings="?")


hpc$Date2 <- as.Date(hpc$Date,"%d/%m/%Y")

# subset to 02/01/2007 and 02/02/2007
hpc2 <- hpc[hpc$Date2 == as.Date("2007-02-01") | hpc$Date2 == as.Date("2007-02-02"),]

# create date/time column
hpc2$dt <- paste(hpc2$Date,hpc2$Time,sep=" ")
hpc2$dt <- strptime(hpc2$dt,"%d/%m/%Y %H:%M:%S")

png(file="plot2.png")

plot(hpc2$dt
     ,hpc2$Global_active_power
     ,ylab="Global Active Power (kilowatts)"
     ,xlab=""
     ,type="l")

dev.off()
