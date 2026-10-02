df <- read.table("household_power_consumption.txt", header=TRUE, sep =";")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
hpc <- subset(df, Date %in% c("2007-02-01", "2007-02-02"))
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

png(filename = "plot2.png", width = 480, height = 480)

with(hpc, plot(Global_active_power,
       type="l",
       ylab="Global Active Power (kilowatts)",
       xlab="",
       xaxt="n"))

axis(side=1, at = c(0,1440,2880), label=c("Tru", "Fri", "Sat"))



dev.off()