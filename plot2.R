# R Script for plot2 from Course Project 1 - EDA - Stefan Kühn

# Preparing the data
hpdata <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",colClasses=c("character","character",rep("numeric",7)))
subhpdata <- hpdata[is.element(hpdata$Date,c("1/2/2007","2/2/2007")),]
len_data <- length(subhpdata$Date)
tickmarks = c(0,median(1:len_data),len_data)

# Printing to png file
png("plot2.png", width=480, height=480)
plot(1:len_data,subhpdata$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",xaxt="n",type="l")
tickmarks = c(0,median(1:len_data),len_data)
axis(side=1,at=tickmarks,labels=c("Thu","Fri","Sat"))
dev.off()
