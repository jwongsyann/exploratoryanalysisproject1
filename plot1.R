setwd("../project1data")
zipfile<-"exdata-data-household_power_consumption.zip"
file<-"household_power_consumption.txt"
con<-unz(zipfile,file)
dat<-read.table(con,header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)
setwd("../project1")
dat$Date<-as.Date(dat$Date,format="%d/%m/%Y")
subsetdates<-(dat$Date=="2007-02-01"|dat$Date=="2007-02-02")
subdat<-dat[subsetdates,]

png("plot1.png",width=480,height=480,units="px")
par(mar=c(4,4,2,2))
hist(subdat$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
