library("data.table")
# get / convert the data
data <- read.csv("household_power_consumption.txt", na.strings="?", sep = ";")
dataDT <- setDT(data)

# format / filter date field
dataDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
dataDT <- dataDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#save png
png("plot4.png")
par(mfrow=c(2,2))
# get 4 plots
plot(dataDT[, dateTime], dataDT[, Global_active_power], type="l", xlab="", ylab="Power")
plot(dataDT[, dateTime],dataDT[, Voltage], type="l", xlab="datetime", ylab="Voltage")
plot(dataDT[, dateTime], dataDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(dataDT[, dateTime], dataDT[, Sub_metering_2], col="red")
lines(dataDT[, dateTime], dataDT[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 
plot(dataDT[, dateTime], dataDT[,Global_reactive_power], type="l", xlab="datetime", ylab="Power")
dev.off()