data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE,dec =".",na.string="?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
subdata<-subset(data,subset=(Date >="2007-02-01" & Date <="2007-02-02"))
DateTime<-paste(subdata$Date,subdata$Time,sep=" ")
subdata$Date<-as.POSIXct(DateTime)

with(subdata,{
    plot(Sub_metering_1 ~ Date,ylab="Energy sub metering",xlab="",type="l")
    lines(Sub_metering_2 ~ Date,type="l",col="red")
    lines(Sub_metering_3 ~ Date,type="l",col="blue")
})
legend(x="topright",col=c("black","red","blue"),pch="",lty=1,lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.75,y.intersp=0.4
       ,x.intersp=2)
dev.copy(png,file="plot3.png",width=480,height=480,units="px")
dev.off()