

myfile <-"./data/household_power_consumption.txt"

#Full dataset
powerconsumption<-read.csv(myfile,sep=";",head=TRUE,stringsAsFactors=FALSE)


# Subsetting data from the dates 2007-02-01 and 2007-02-02

subset_PowerCon <- powerconsumption[powerconsumption$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(subset_PowerCon$Date, subset_PowerCon$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subset_PowerCon$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()