DSclasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
DS <- read.table("household_power_consumption.txt", header = TRUE,
                 sep = ";", colClasses = DSclasses, na.strings = c("?"))
DS$Date2 = as.Date(DS$Date, "%d/%m/%Y")
DS$Time2 <- strptime(paste(DS$Date, DS$Time), "%d/%m/%Y %H:%M:%S")
DS2 <- DS[DS$Date2==as.Date("2007-02-01") | DS$Date2==as.Date("2007-02-02"),]
png("plot2.png")
plot(DS2$Time2, DS2$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
