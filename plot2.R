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

#Convert Global_active_power to numeric
data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power)
head(data_sub)

#Plot time series of Global_active_power
plot(data_sub$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(side=1, at=c(0,1500,2900), labels=c("Thu", "Fri", "Sat"))

#Save as .png

png(filename = "plot2.png", width = 480, height = 480)

plot(data_sub$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(side=1, at=c(0,1500,2900), labels=c("Thu", "Fri", "Sat"))

dev.off()

