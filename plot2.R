library(dplyr)

df <- read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?" )
tab <- tbl_df(df)
tab.filtered <- filter(tab,Date == "1/2/2007" | Date =="2/2/2007")
tt <- tbl_df(transform(tab.filtered, DateTime = strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S")))
with(tt, plot(DateTime, Global_active_power, type="l" , ylab="Global Active Power (kilowatts)", xlab=""))
dev.copy(png,'plot2.png',width = 480, height = 480)
dev.off()

