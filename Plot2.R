library("data.table")
# get / convert the data
data <- read.csv("household_power_consumption.txt", na.strings="?", sep = ";")
dataDT <- setDT(data)


# format / filter date field
dataDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
dataDT <- dataDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]


#save png
png("plot2.png")
#get plot
plot(x = dataDT[, dateTime], y = dataDT[, Global_active_power], type="l", xlab="Focus days", ylab="Power in kw")
dev.off()