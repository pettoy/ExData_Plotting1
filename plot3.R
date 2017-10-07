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

# plot 3


png(file = "plot3.png", width = 480, height = 480)

plot(d3$index, d3$Sub_metering_1, type = "n",
     ylab = "Energy sub metering", xlab = "", xaxt = "n")

lines(d3$index, d3$Sub_metering_1)
lines(d3$index, d3$Sub_metering_2, col = "red")
lines(d3$index, d3$Sub_metering_3, col = "blue")
axis(side = 1, at = c(1,1441, 2874), labels = c("Thu", "Fri", "Sat"))
legend(x ="topright", y = NULL, legend = names(d3)[7:9], 
       lty = 1, col = c("black","red","blue"), cex = 1)

dev.off()