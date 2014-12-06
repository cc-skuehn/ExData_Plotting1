# R Script for plot3 from Course Project 1 - EDA - Stefan Kühn

# Preparing the data
hpdata <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",colClasses=c("character","character",rep("numeric",7)))
subhpdata <- hpdata[is.element(hpdata$Date,c("1/2/2007","2/2/2007")),]
len_data <- length(subhpdata$Date)
tickmarks = c(0,median(1:len_data),len_data)
col_array = c("black","red","blue")

# Printing to png file 
png("plot3.png", width=480, height=480)
plot(1:len_data,subhpdata$Sub_metering_1,ylab="Energy sub metering",col=col_array[1],xlab="",xaxt="n",type="l")
lines(1:len_data,subhpdata$Sub_metering_2,col=col_array[2])
lines(1:len_data,subhpdata$Sub_metering_3,col=col_array[3])
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = rep(1,3),lwd = rep(1,3),col=col_array)
axis(side=1,at=tickmarks,labels=c("Thu","Fri","Sat"))
dev.off()
