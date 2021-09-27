library("data.table")
# get / convert the data
data <- read.csv("household_power_consumption.txt", na.strings="?", sep = ";")
dataDT <- setDT(data)

# get date column
dataDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
dataDT <- dataDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#save png
png("plot1.png")

#get plot
hist(dataDT[, Global_active_power], main="Power", xlab="Power  in kw", ylab="Frequency", col="Red")
dev.off()
