library(dplyr)
library(lubridate)
data <- read.table('household_power_consumption.txt', sep = ";", header = TRUE, stringsAsFactors = FALSE, colClasses = c(rep('character', 2), rep('numeric', 7)), na.strings = '?')
data <- tbl_df(data)
data <- mutate(data, date_time = dmy_hms(paste(Date, Time)))
data <- mutate(data, Date = dmy(Date))
data <- filter(data, Date > '2007-01-31', Date <= '2007-02-02')

par(mfrow = c(1, 1))


#Plot 2
plot(data$date_time, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts) ", xlab = "")

dev.copy(png, 'plot2.png')
dev.off()