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

#Create histogram of global active power
plot1 <- hist(data_sub$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency",ylim=c(0,1200))
plot1

#Save as .png

png(filename = "plot1.png", width = 480, height = 480)

hist(data_sub$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency",ylim=c(0,1200))

dev.off()
