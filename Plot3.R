library("data.table")
# get / convert the data
data <- read.csv("household_power_consumption.txt", na.strings="?", sep = ";")
dataDT <- setDT(data)


# format / filter date field
dataDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
dataDT <- dataDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#save png
png("plot3.png")
#get plot
plot(dataDT[, dateTime], dataDT[, Sub_metering_1], type="l", xlab="Focus days", ylab="Energy")
lines(dataDT[, dateTime], dataDT[, Sub_metering_2],col="red")
lines(dataDT[, dateTime], dataDT[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()