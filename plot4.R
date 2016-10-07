#Read in data
data <-
      read.table(
            "household_power_consumption.txt", header = TRUE,sep = ";", stringsAsFactors = FALSE
      )

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

#Convert Global_active_power to numeric
data_sub$Global_active_power <-
      as.numeric(data_sub$Global_active_power)
head(data_sub)

#Set up 2x2 plot frame
par(mfrow = c(2,2))
#Adjust plot margins
par(mar = c(2,4.8,2,3))
#Recreate plot from plot2.R
plot(
      data_sub$Global_active_power, type = "l", ylab = "Global Active Power", xlab =
            "", xaxt = "n"
)
axis(
      side = 1, at = c(0,1500,2900), labels = c("Thu", "Fri", "Sat")
)

#Create new plot of voltage
plot(
      data_sub$Voltage, type = "l", ylab = "Voltage", xlab = "datetime", xaxt =
            "n"
)
axis(
      side = 1, at = c(0,1500,2900), labels = c("Thu", "Fri", "Sat")
)

#Recreate plot3.R
plot(
      data_sub$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab =
            "", xaxt = "n"
)
lines(data_sub$Sub_metering_2, col = "red")
lines(data_sub$Sub_metering_3, col = "blue")
legend(
      "topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col =
            c("black","red","blue"),lty = 1, bty = "n"
)
axis(
      side = 1, at = c(0,1500,2900), labels = c("Thu", "Fri", "Sat")
)

#Create plot of Global_reactive_power
plot(
      data_sub$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", xaxt = "n"
)
axis(
      side = 1, at = c(0,1500,2900), labels = c("Thu", "Fri", "Sat")
)

#Save as .png

png(filename = "plot4.png", width = 480, height = 480)

#Set up 2x2 plot frame
par(mfrow = c(2,2))
#Adjust plot margins
par(mar = c(4.2,4.8,4.8,2.6))
#Recreate plot from plot2.R
plot(
      data_sub$Global_active_power, type = "l", ylab = "Global Active Power", xlab =
            "", xaxt = "n"
)
axis(
      side = 1, at = c(0,1500,2900), labels = c("Thu", "Fri", "Sat")
)

#Create new plot of voltage
plot(
      data_sub$Voltage, type = "l", ylab = "Voltage", xlab = "datetime", xaxt =
            "n"
)
axis(
      side = 1, at = c(0,1500,2900), labels = c("Thu", "Fri", "Sat")
)

#Recreate plot3.R
plot(
      data_sub$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab =
            "", xaxt = "n"
)
lines(data_sub$Sub_metering_2, col = "red")
lines(data_sub$Sub_metering_3, col = "blue")
legend(
      "topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col =
            c("black","red","blue"),lty = 1, bty = "n", cex=0.8
)
axis(
      side = 1, at = c(0,1500,2900), labels = c("Thu", "Fri", "Sat")
)

#Create plot of Global_reactive_power
plot(
      data_sub$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", xaxt = "n")
axis(
      side = 1, at = c(0,1500,2900), labels = c("Thu", "Fri", "Sat")
)

dev.off()
