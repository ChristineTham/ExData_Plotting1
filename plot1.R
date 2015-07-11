DSclasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
DS <- read.table("household_power_consumption.txt", header = TRUE,
                 sep = ";", colClasses = DSclasses, na.strings = c("?"))
DS$Date2 = as.Date(DS$Date, "%d/%m/%Y")
DS$Time2 <- strptime(paste(DS$Date, DS$Time), "%d/%m/%Y %H:%M:%S")
DS2 <- DS[DS$Date2==as.Date("2007-02-01") | DS$Date2==as.Date("2007-02-02"),]
png("plot1.png")
hist(DS2$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     xlim = c(0,6), ylim = c(0,1200))
dev.off()
