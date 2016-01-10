library(dplyr)

df <- read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?" )
tab <- tbl_df(df)
tab.filtered <- filter(tab,Date == "1/2/2007" | Date =="2/2/2007")
tab.filtered
tt <- tbl_df(transform(tab.filtered, DateTime = strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S")))

par(mfcol=c(2,2))
with(tt, plot(DateTime, Global_active_power, type="l" , ylab="Global Active Power (kilowatts)", xlab=""))

with(tt, plot(DateTime, Sub_metering_1,type="l", ylab="Energy sub metering", xlab=""))
with(tt, points(DateTime, Sub_metering_2, type="l" , col="red"))
with(tt, points(DateTime, Sub_metering_3, type="l" , col="blue"))
legend("topright", lwd=1 ,col=c("black","red","blue"), cex=0.60,
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(tt, plot(DateTime, Voltage, type="l" , ylab="Voltage", xlab="datetime"))
with(tt, plot(DateTime, Global_reactive_power, type="l" , xlab="datetime"))

dev.copy(png,'plot4.png',width = 480, height = 480)
dev.off()
