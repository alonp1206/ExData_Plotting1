df <- read.table("household_power_consumption.txt", header=TRUE, sep =";")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
hpc <- subset(df, Date %in% c("2007-02-01", "2007-02-02"))
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

png(filename = "plot4.png", width = 480, height = 480)


par(mfrow = c(2, 2))

#G1
with(hpc, plot(Global_active_power,
       type="l",
       ylab="Global Active Power (kilowatts)",
       xlab="",
       xaxt="n"))

axis(side=1, at = c(0,1440,2880), label=c("Tru", "Fri", "Sat"))



#G2
with(hpc,
     plot(Voltage,
       type="l",
       ylab="Voltage",
       xlab="datetime",
       xaxt="n"))

axis(
  side=1,
  at = c(0,1440,2880),
  label=c("Tru", "Fri", "Sat"))



#G3
with(hpc,{
     plot(
      Sub_metering_1,
      type="l",
      ylab="Energy sub metering",
      xlab="",
      xaxt="n")

    points(
      Sub_metering_2,
      type="l",
      col="red")

    points(
      Sub_metering_3,
      type="l",
      col="blue")

  })

legend(
  "topright",
  legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
  col = c("black", "red", "blue"),
  bty="n",
  lty = 1)

axis(
  side=1,
  at = c(0,1440,2880),
  label=c("Tru", "Fri", "Sat"))



#G4
with(hpc,
     plot(Global_reactive_power,
       type="l",
       ylab="Global_reactive_power",
       xlab="datetime",
       xaxt="n"))

axis(
  side=1,
  at = c(0,1440,2880),
  label=c("Tru", "Fri", "Sat"))


dev.off()