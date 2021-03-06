
#setwd()

library(readr)
library(dplyr)

d1 <- read_delim("....../household_power_consumption.txt", 
                 delim = ";", na = "?", n_max = 50)
View(d1)

d2 <- read_delim("........./household_power_consumption.txt", delim = ";", na = "?", 
                 col_types = cols(
                   Date = col_date(format = "%d/%m/%Y"),
                   Time = col_time(format = "%H:%M:%S"),
                   Global_active_power = col_double(),
                   Global_reactive_power = col_double(),
                   Voltage = col_double(),
                   Global_intensity = col_double(),
                   Sub_metering_1 = col_double(),
                   Sub_metering_2 = col_double(),
                   Sub_metering_3 = col_double() )) 


head(d2)

d3 <- subset(d2, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
dim(d3)
head(d3)
tail(d3)

rm(d2)

# plot 1

png(file = "plot1.png", width = 480, height = 480)

hist(d3$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (Kilowatts)")

dev.off()
