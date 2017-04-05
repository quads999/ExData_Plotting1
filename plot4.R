png(filename = "plot4.png", width = 480, height = 480)

powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
powerdatafiltered <- powerdata[as.Date(powerdata$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(powerdata$Date, "%d/%m/%Y") == "2007-02-02",]
powerdatamod <- mutate(powerdatafiltered, datetime = as.POSIXct(paste(powerdatafiltered$Date, powerdatafiltered$Time), format="%d/%m/%Y %H:%M:%S"))

par(mfcol = c(2,2))

plot(powerdatamod$datetime, as.numeric(powerdatamod$Global_active_power) / 1000, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

plot(powerdatamod$datetime, powerdatamod$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
points(powerdatamod$datetime, powerdatamod$Sub_metering_2, type = "l", col = "red")
points(powerdatamod$datetime, powerdatamod$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty=c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

plot(powerdatamod$datetime, as.numeric(powerdatamod$Voltage), type = "l", xlab="datetime", ylab="Voltage")

plot(powerdatamod$datetime, as.numeric(powerdatamod$Global_reactive_power) / 1000, type = "l", xlab="datetime", ylab="Global_reactive_power")

dev.off()