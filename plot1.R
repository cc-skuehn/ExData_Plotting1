# R Script for plot1 from Course Project 1 - EDA - Stefan Kühn

# Preparing the data
hpdata <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",colClasses=c("character","character",rep("numeric",7)))
subhpdata <- hpdata[is.element(hpdata$Date,c("1/2/2007","2/2/2007")),]

# Printing to png file
png("plot1.png", width=480, height=480)
hist(subhpdata$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power",breaks=20)
dev.off()