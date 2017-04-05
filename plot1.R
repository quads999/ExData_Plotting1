png(filename = "plot1.png", width = 480, height = 480)

powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
powerdatafiltered <- powerdata[as.Date(powerdata$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(powerdata$Date, "%d/%m/%Y") == "2007-02-02",]

hist(as.numeric(powerdatafiltered$Global_active_power) / 1000, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()