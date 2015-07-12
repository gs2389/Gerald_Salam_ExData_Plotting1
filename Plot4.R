household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",stringsAsFactors=FALSE)
household_power_consumption$Date<-strptime(household_power_consumption$Date, "%d/%m/%Y")
household_power_consumption$Date<-as.Date(household_power_consumption$Date,format="%Y-%m-%d")

household_power_consumption<-subset(household_power_consumption, household_power_consumption$Date == '2007-02-01' | household_power_consumption$Date == '2007-02-02')


png(filename = "Plot4.png", width = 480, height = 480)

op<-par(mfrow=c(2,2), cex.lab=1, cex.axis=1 ,cex.main=1)

plot(household_power_consumption$Global_active_power, type='l', ann=F, xlim=c(0,3000), xaxt = "n")
title(ylab="Global Active Power")
axis(1, at=c(0,1500,3000), labels=c("Thu", "Fri", "Sat"))

plot(household_power_consumption$Voltage, type='l', ann=F, xlim=c(0,3000), xaxt = "n")
title(ylab="Voltage", xlab="datetime")
axis(1, at=c(0,1500,3000), labels=c("Thu", "Fri", "Sat"))

plot(household_power_consumption$Sub_metering_1, type='l', ann=F, xlim=c(0,3000), xaxt = "n")
lines(household_power_consumption$Sub_metering_2,col="red")
lines(household_power_consumption$Sub_metering_3,col="blue")
title(ylab="Energy sub metering")
axis(1, at=c(0,1500,3000), labels=c("Thu", "Fri", "Sat"))
legend("topright", cex=0.8, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(2.5,2.5,2.5), lty=1, col=c("black", "red","blue"), bty="n")

plot(household_power_consumption$Global_reactive_power, type='l', ann=F, xlim=c(0,3000), ylim=c(0,0.5),  xaxt = "n")
title(ylab="Global_reactive_power", xlab="datetime")
axis(1, at=c(0,1500,3000), labels=c("Thu", "Fri", "Sat"))

par(op)
dev.off()
