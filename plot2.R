setwd("/Users/Imo/Desktop")
top <- c("date", "time", "globalActive", "globalReactive", 
         "voltage", "globalIntensity", "sub1", "sub2", 
         "sub3")
b <- read.csv("household_power_consumption.txt", header = TRUE, 
              skip = 1, sep = ";", 
              col.names = top, na.strings = "?")
c <- b[b$date=="2/2/2007"|b$date=="1/2/2007",]
c$DateTime <- strptime(paste(c$date, c$time), 
                       format="%d/%m/%Y %H:%M:%S")

#plot2
png(filename = "plot2.png", width = 480, height = 480)
plot(c$DateTime, c$globalActive, type="l", xlab=" ", 
     ylab="Global Active power (kilowatts)")
dev.off()