data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

sub <- subset(data, Date >= as.Date("2007-02-01") &
                Date <= as.Date("2007-02-02"))

sub$Datetime <- as.POSIXct(paste(sub$Date, sub$Time))

png("plot3.png", width = 480, height = 480)

plot(sub$Datetime,
     sub$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(sub$Datetime, sub$Sub_metering_2, col = "red")
lines(sub$Datetime, sub$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.off()