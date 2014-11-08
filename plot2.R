setwd("../project1data")
zipfile<-"exdata-data-household_power_consumption.zip"
file<-"household_power_consumption.txt"
con<-unz(zipfile,file)
dat<-read.table(con,header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)
setwd("../project1")
dat$Date<-as.Date(dat$Date,format="%d/%m/%Y")
subsetdates<-(dat$Date=="2007-02-01"|dat$Date=="2007-02-02")
subdat<-dat[subsetdates,]
datetime<-paste(subdat$Date,subdat$Time)
datetime<-strptime(datetime,"%Y-%m-%d %H:%M:%S")


png("plot2.png",width=480,height=480,units="px")
plot(datetime,subdat$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(datetime,subdat$Global_active_power)
dev.off()
