#Reading the data
x=read.csv("household_power_consumption.txt",sep=";")

#Sub setting the data for the given date range
df=subset(x,strptime(x[,1],"%d/%m/%Y")>strptime("2007-01-31","%Y-%m-%d") & strptime(x[,1],"%d/%m/%Y")<strptime("2007-02-03","%Y-%m-%d"))

#combining the date and time
foo <- transform(df, timestamp=as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

#opening the device with required width and height
png(bg = "white", 
    filename = "plot4.png",
    width = 480, 
    height = 480 
)

#Setting the margin and the columns and rows to display 4 plots on a single frame without loss of variables
par(mfrow=c(2,2),mar=c(4,4,2,2))

#plot1
plot(foo[,10],as.numeric(as.character(foo[,3])),type="o",pch=".",ylab="Global Active Power",xlab="")

#plot2
plot(foo[,10],as.numeric(as.character(foo[,5])),type="o",pch=".",ylab="voltage",xlab="datetime")

#plot3
plot(foo[,10],as.numeric(as.character(foo[,7])),type="o",pch=".",ylab="Energy sub metering",xlab="",col="black")
lines(foo[,10],as.numeric(as.character(foo[,8])),col="red")
lines(foo[,10],as.numeric(as.character(foo[,9])),col="blue")
legend("topright",legend=colnames(foo[7:9]),lty=1,col=c("black","red","blue"))

#plot4
plot(foo[,10],as.numeric(as.character(foo[,4])),type="o",pch=".",ylab="Global_reacctive_power",xlab="datetime")

#switching the device off
dev.off()