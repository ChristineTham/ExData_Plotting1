DSclasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
DS <- read.table("household_power_consumption.txt", header = TRUE,
                 sep = ";", colClasses = DSclasses, na.strings = c("?"))
DS$Date2 = as.Date(DS$Date, "%d/%m/%Y")
DS$Time2 <- strptime(paste(DS$Date, DS$Time), "%d/%m/%Y %H:%M:%S")
DS2 <- DS[DS$Date2==as.Date("2007-02-01") | DS$Date2==as.Date("2007-02-02"),]
png("plot4.png")
par(mfrow = c(2, 2), mar = c(4, 4, 4, 4), oma = c(0, 0, 2, 0))
plot(DS2$Time2, DS2$Global_active_power, type = "l", col = "black",
     xlab = "", ylab = "Global Active Power")
plot(DS2$Time2, DS2$Voltage, type = "l", col = "black",
     xlab = "datetime", ylab = "Voltage")
plot(DS2$Time2, DS2$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(DS2$Time2, DS2$Sub_metering_2, type = "l", col = "red")
lines(DS2$Time2, DS2$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(DS2$Time2, DS2$Global_reactive_power, type = "l", col = "black",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
