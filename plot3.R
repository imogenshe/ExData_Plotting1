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

#plot3
png(filename = "plot3.png", width = 480, height = 480)

plot(c$DateTime,c$sub1, type="l", xlab = "",
     ylab = "Energy sub metering")
lines(c$DateTime, c$sub2, col = "red")
lines(c$DateTime, c$sub3, col = "blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,cex=0.8)
dev.off()
