df <- read.table("household_power_consumption.txt", header=TRUE, sep =";")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
hpc <- subset(df, Date %in% c("2007-02-01", "2007-02-02"))
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

png(filename = "plot1.png", width = 480, height = 480)
with(hpc, hist(Global_active_power,
       col="red",
       xlab="Global Active Power (kilowatts)",
       ylab="Frequency",
       main="Global Active Power"))

dev.off()