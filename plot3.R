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


png("plot3.png",width=480,height=480,units="px")
plot(datetime,subdat$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(datetime,subdat$Sub_metering_1,col="black")
lines(datetime,subdat$Sub_metering_2,col="red")
lines(datetime,subdat$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))
dev.off()
