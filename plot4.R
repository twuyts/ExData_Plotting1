plot4 <- function() {
    data<-loadHouseholdData()
    # force locale to C, so days will be printed in English
    Sys.setlocale(category="LC_TIME", "C")
    png("plot4.png")
    par(mfrow = c(2, 2))
    with(data, {
        plot(epoch, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        plot(epoch, Voltage, type="l", xlab="datetime")
        plot(epoch, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
        lines(epoch, Sub_metering_2, col="red")
        lines(epoch, Sub_metering_3, col="blue")   
        legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1)
        plot(epoch, Global_reactive_power, type="l", xlab="datetime")
    })
    dev.off()
}