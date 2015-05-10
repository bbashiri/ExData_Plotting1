library(dplyr)
library(lubridate)
data <- read.table('household_power_consumption.txt', sep = ";", header = TRUE, stringsAsFactors = FALSE, colClasses = c(rep('character', 2), rep('numeric', 7)), na.strings = '?')
data <- tbl_df(data)
data <- mutate(data, date_time = dmy_hms(paste(Date, Time)))
data <- mutate(data, Date = dmy(Date))
data <- filter(data, Date > '2007-01-31', Date <= '2007-02-02')

par(mfrow = c(1, 1))



#Plot 3
plot(data$date_time, data$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$date_time, data$Sub_metering_2, col = "red")
lines(data$date_time, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), 
       col = c("black", "red", "blue"))
dev.copy(png, 'plot3.png')
dev.off()