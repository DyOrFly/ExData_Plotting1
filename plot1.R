
library(dplyr)

df <- read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?" )
tab <- tbl_df(df)
tab.filtered <- filter(tab,Date == "1/2/2007" | Date =="2/2/2007")
hist(tab.filtered$Global_active_power, col="red", main = "Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.copy(png,'plot1.png',width = 480, height = 480)
dev.off()
