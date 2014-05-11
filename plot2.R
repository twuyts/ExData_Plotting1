plot2 <- function() {
    data<-loadHouseholdData()
    # force locale to C, so days will be printed in English
    Sys.setlocale(category="LC_TIME", "C")
    png("plot2.png")
    with(data,plot(epoch, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
    dev.off()
}