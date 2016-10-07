#Read in data
data <-
      read.table("household_power_consumption.txt", header = TRUE,sep = ";", stringsAsFactors = FALSE)

#Convert Date column to date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")
head(data$Date)

#Subset days of interest
data_sub <-
      subset(data, Date == as.Date("2007-02-01") |
                   Date == as.Date("2007-02-02"))
head(data_sub)

#Convert Time to time class
data_sub$Time <-
      strptime(paste(data_sub$Date, data_sub$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")
head(data_sub)

#Plot time series of Sub_metering_1-3
plot(data_sub$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="", xaxt="n")
lines(data_sub$Sub_metering_2, col="red")
lines(data_sub$Sub_metering_3, col="blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lty=1)
axis(side=1, at=c(0,1500,2900), labels=c("Thu", "Fri", "Sat"))

#Save as .png

png(filename = "plot3.png", width = 480, height = 480)

plot(data_sub$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="", xaxt="n")
lines(data_sub$Sub_metering_2, col="red")
lines(data_sub$Sub_metering_3, col="blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lty=1)
axis(side=1, at=c(0,1500,2900), labels=c("Thu", "Fri", "Sat"))

dev.off()

