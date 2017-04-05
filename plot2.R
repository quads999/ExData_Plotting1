png(filename = "plot2.png", width = 480, height = 480)

powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
powerdatafiltered <- powerdata[as.Date(powerdata$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(powerdata$Date, "%d/%m/%Y") == "2007-02-02",]
powerdatamod <- mutate(powerdatafiltered, datetime = as.POSIXct(paste(powerdatafiltered$Date, powerdatafiltered$Time), format="%d/%m/%Y %H:%M:%S"))

plot(powerdatamod$datetime, as.numeric(powerdatamod$Global_active_power) / 1000, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()