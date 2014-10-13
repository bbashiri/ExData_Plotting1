library(dplyr)
library(lubridate)
data <- read.table('household_power_consumption.txt', sep = ";", header = TRUE, stringsAsFactors = FALSE, colClasses = c(rep('character', 2), rep('numeric', 7)), na.strings = '?')
data <- tbl_df(data)
data <- mutate(data, date_time = dmy_hms(paste(Date, Time)))
data <- mutate(data, Date = dmy(Date))
data <- filter(data, Date > '2007-01-31', Date <= '2007-02-02')

par(mfrow = c(1, 1))

#Plot 4
par(mfrow = c(2, 2), mar = c(4, 5, 4, 2))
#Top Left
plot(data$date_time, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
#Top Right
plot(data$date_time, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#Bottom Left
plot(data$date_time, data$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$date_time, data$Sub_metering_2, col = "red")
lines(data$date_time, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), 
       col = c("black", "red", "blue"))
#Bottom Right
plot(data$date_time, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, 'plot4.png')
dev.off()