# R Script for plot2 from Course Project 1 - EDA - Stefan Kühn

# Preparing the data
hpdata <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",colClasses=c("character","character",rep("numeric",7)))
subhpdata <- hpdata[is.element(hpdata$Date,c("1/2/2007","2/2/2007")),]
len_data <- length(subhpdata$Date)
tickmarks = c(0,median(1:len_data),len_data)

# Printing to png file
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
par(mar=c(5,4,2,1))

# Subplot 1
plot(1:len_data,subhpdata$Global_active_power,ylab="Global Active Power",xlab="",xaxt="n",type="l")
tickmarks = c(0,median(1:len_data),len_data)
axis(side=1,at=tickmarks,labels=c("Thu","Fri","Sat"))

# Subplot 2
plot(1:len_data,subhpdata$Voltage,ylab=colnames(subhpdata)[5],xlab="datetime",xaxt="n",type="l")
tickmarks = c(0,median(1:len_data),len_data)
axis(side=1,at=tickmarks,labels=c("Thu","Fri","Sat"))

# Subplot 3
plot(1:len_data,subhpdata$Sub_metering_1,ylab="Energy sub metering",col=col_array[1],xlab="",xaxt="n",type="l")
lines(1:len_data,subhpdata$Sub_metering_2,col=col_array[2])
lines(1:len_data,subhpdata$Sub_metering_3,col=col_array[3])
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",lty = rep(1,3),lwd = rep(1,3),col=col_array)
axis(side=1,at=tickmarks,labels=c("Thu","Fri","Sat"))

# Subplot 4
plot(1:len_data,subhpdata$Global_reactive_power,ylab=colnames(subhpdata)[4],xlab="datetime",xaxt="n",type="l")
tickmarks = c(0,median(1:len_data),len_data)
axis(side=1,at=tickmarks,labels=c("Thu","Fri","Sat"))

dev.off()
