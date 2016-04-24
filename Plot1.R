
mydirectory<-"C:/Users/uchae/Documents/R/course/exploratory data analysis/assigngment"
setwd(mydirectory)

fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("data")){
    dir.create("data")
}

download.file(fileurl,destfile="./data/HHpowerConsumption")
list.files("./data")

DateDownLoaded<-date()

# unzip all of the files in the downloaded .zip file into the current working directory
# then save all of their unzipped locations into a character vector called 'myfile'

myfile <-unzip("./data/HHpowerConsumption",exdir ="./data")

#Full dataset
powerconsumption<-read.csv(myfile,sep=";",head=TRUE,stringsAsFactors=FALSE)

# Subsetting data from the dates 2007-02-01 and 2007-02-02

subset_PowerCon <- powerconsumption[powerconsumption$Date %in% c("1/2/2007","2/2/2007") ,]

#Remove full dataset
#rm(powerconsumption)


## Converting dates
datetime <- paste(as.Date(subset_PowerCon$Date), subset_PowerCon$Time)
subset_PowerCon$Datetime <- as.POSIXct(datetime)

## Plot 1
GlobalActivePower <- as.numeric(subset_PowerCon$Global_active_power)

hist(GlobalActivePower, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()




