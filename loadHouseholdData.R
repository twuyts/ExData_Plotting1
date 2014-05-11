loadHouseholdData <- function() {
    library(data.table)
    
    # Check if we can use a cached version of the file
    zipFile<-"HouseholdData.zip"
    if ( (file.exists(zipFile)) && 
            (file.info(zipFile)$ctime > Sys.time()-24*60*60) &&
            (file.info(zipFile)$size > 20000000)
        ) {
        warning("Using cached file")
    } else {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",zipFile)
        if (!file.exists(zipFile)) {
            stop("Download file failed")
        }
        if (file.info(zipFile)$size < 20000000 ) {
            stop("Downloaded file is too small")
            unlink(zipFile)
        }
    }
    
    # read the data
    alldata <- read.table(unz(zipFile, "household_power_consumption.txt"), 
                       header=T, quote="\"", sep=";",
                       stringsAsFactors=F, na.strings="?",
                       colClasses=c(rep("character",2) , rep("numeric",7)))
    
    # filter out anything that's not 2007-02-01 or 2007-02-02
    # and make it a data.table
    data<-data.table(alldata[alldata$Date=='1/2/2007' | alldata$Date=='2/2/2007',])
    # add a calculated field, labeled epoch, that holds the datetime in Posixct format
    data<-data[,epoch:=as.POSIXct(paste(Date, Time, sep=" "),format="%d/%m/%Y %H:%M:%S")]
}