library(dplyr)
library(lubridate)
data <- read.table('household_power_consumption.txt', sep = ";", header = TRUE, stringsAsFactors = FALSE, colClasses = c(rep('character', 2), rep('numeric', 7)), na.strings = '?')
data <- tbl_df(data)
data <- mutate(data, date_time = dmy_hms(paste(Date, Time)))
data <- mutate(data, Date = dmy(Date))
data <- filter(data, Date > '2007-01-31', Date <= '2007-02-02')

par(mfrow = c(1, 1))

#Plot 1
hist((data$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, 'plot1.png')
dev.off()