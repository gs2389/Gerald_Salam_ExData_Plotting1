household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",stringsAsFactors=FALSE)
household_power_consumption$Date<-strptime(household_power_consumption$Date, "%d/%m/%Y")
household_power_consumption$Date<-as.Date(household_power_consumption$Date,format="%Y-%m-%d")

household_power_consumption<-subset(household_power_consumption, household_power_consumption$Date == '2007-02-01' | household_power_consumption$Date == '2007-02-02')

png('Plot3.png', width = 480, height = 480)

#op<-par(cex.lab=0.8, cex.axis=0.8 ,cex.main=1, font.lab=1)

plot(household_power_consumption$Sub_metering_1, type='l', ann=F, xlim=c(0,3000), xaxt = "n")
lines(household_power_consumption$Sub_metering_2,col="red")
lines(household_power_consumption$Sub_metering_3,col="blue")
title(ylab="Energy sub metering")
axis(1, at=c(0,1500,3000), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty = 1, cex=0.8, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(2.5,2.5,2.5), col=c("black", "red","blue"))

par(op)

dev.off()

