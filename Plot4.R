
rm(list=ls())

mydirectory<-"C:/Users/uchae/Documents/R/course/exploratory data analysis/assigngment"
setwd(mydirectory)

myfile <-"./data/household_power_consumption.txt"

#Full dataset
powerconsumption<-read.csv(myfile,sep=";",head=TRUE,stringsAsFactors=FALSE)


# Subsetting data from the dates 2007-02-01 and 2007-02-02

subset_PowerCon <- powerconsumption[powerconsumption$Date %in% c("1/2/2007","2/2/2007") ,]

## Converting dates
datetime <- strptime(paste(subset_PowerCon$Date, subset_PowerCon$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subset_PowerCon$Global_active_power)

globalReactivePower<-as.numeric(subset_PowerCon$Global_reactive_power)

subMetering1 <- as.numeric(subset_PowerCon$Sub_metering_1)
subMetering2 <- as.numeric(subset_PowerCon$Sub_metering_2)
subMetering3 <- as.numeric(subset_PowerCon$Sub_metering_3)
voltage <- as.numeric(subset_PowerCon$Voltage)


## Plot 4

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(datetime,globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime,voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()