data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE,dec =".",na.string="?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
subdata<-subset(data,subset=(Date >="2007-02-01" & Date <="2007-02-02"))
DateTime<-paste(subdata$Date,subdata$Time,sep=" ")
subdata$Date<-as.POSIXct(DateTime)

hist(as.numeric(subdata$Global_active_power),col="red",xlab="Global Active Power (Kilowatts)",main="Global Active Power")
dev.copy(png,file="plot1.png",width=480,height=480,units="px")
dev.off()


