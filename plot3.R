plot3 <- function() {
    data<-loadHouseholdData()
    # force locale to C, so days will be printed in English
    Sys.setlocale(category="LC_TIME", "C")
    png("plot3.png")
    with(data,plot(epoch, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
    with(data,lines(epoch, Sub_metering_2, col="red"))
    with(data,lines(epoch, Sub_metering_3, col="blue"))   
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1)
    dev.off()
}