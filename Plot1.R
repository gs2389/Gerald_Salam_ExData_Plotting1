
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",stringsAsFactors=FALSE)
household_power_consumption$Date<-strptime(household_power_consumption$Date, "%d/%m/%Y")
household_power_consumption$Date<-as.Date(household_power_consumption$Date,format="%Y-%m-%d")

household_power_consumption<-subset(household_power_consumption, household_power_consumption$Date == '2007-02-01' | household_power_consumption$Date == '2007-02-02')

# row.has.na <- apply(household_power_consumption, 1, function(x){any(is.na(x))})
# household_power_consumption <- household_power_consumption[!row.has.na,]

op<-par(cex.lab=0.8, cex.axis=0.8 ,cex.main=1, font.lab=1)

png('Plot1.png', width = 480, height = 480)

hist(household_power_consumption$Global_active_power, col="red", xlim=c(0,6), ylim=c(0,1200), xaxt = "n", ann=F )
title(main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)")
axis(1, at=c(0,2,4,6), labels=c(0,2,4,6))

dev.off()
par(op)

