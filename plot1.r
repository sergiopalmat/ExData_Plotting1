fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile=paste0(getwd(),"/Power_consumption.zip"),method = "curl")
unzip("Power_consumption.zip",exdir="./semana1")
setwd("./semana1")
lectura<-read.table("household_power_consumption.txt", header=TRUE,sep=";", nrows=5)
housepwrc<-read.table("household_power_consumption.txt", header=TRUE,sep=";", skip=66630, 
                nrows=2900, col.names=names(lectura), na.strings=c("?"),
                colClasses=c("character", "character","numeric","numeric","numeric","numeric",
                             "numeric","numeric","numeric"))
housepwrc$Date<-as.Date(housepwrc$Date, format = "%d/%m/%Y")
housepwrc$Time<-strptime(paste(housepwrc$Date,housepwrc$Time),"%F %T")
housepwrc<-subset(housepwrc,housepwrc$Date %in% as.Date(c("2007-02-01","2007-02-02")))		

par(mfrow=c(1,1),mar=c(5,4.5,4,2))
hist(housepwrc$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")	

png("plot1.png", width=480, height=480)
par(mfrow=c(1,1),mar=c(5,4.5,4,2))
hist(housepwrc$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
