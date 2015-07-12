
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",stringsAsFactors=FALSE)
household_power_consumption$Date<-strptime(household_power_consumption$Date, "%d/%m/%Y")
household_power_consumption$Date<-as.Date(household_power_consumption$Date,format="%Y-%m-%d")

household_power_consumption<-subset(household_power_consumption, household_power_consumption$Date == '2007-02-01' | household_power_consumption$Date == '2007-02-02')

op<-par(cex.lab=0.8, cex.axis=0.8 ,cex.main=1, font.lab=1)

png('Plot2.png', width = 480, height = 480)


plot(household_power_consumption$Global_active_power, type='l', ann=F, xlim=c(0,3000), xaxt = "n")
title(ylab="Global Active Power (kilowatts)")
axis(1, at=c(0,1500,3000), labels=c("Thu", "Fri", "Sat"))

dev.off()
par(op)

