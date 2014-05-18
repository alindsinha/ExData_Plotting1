#Reading the data
x=read.csv("household_power_consumption.txt",sep=";")

#Sub setting the data for the given date range
df=subset(x,strptime(x[,1],"%d/%m/%Y")>strptime("2007-01-31","%Y-%m-%d") & strptime(x[,1],"%d/%m/%Y")<strptime("2007-02-03","%Y-%m-%d"))

#combining the date and time
foo <- transform(df, timestamp=as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

#opening the device with required width and height
png(bg = "white", 
    filename = "plot3.png",
    width = 480, 
    height = 480 
)
#creating the plot,since the data is converted to factors thus converting it back to numeric
plot(foo[,10],as.numeric(as.character(foo[,7])),type="o",pch=".",ylab="Energy sub metering",xlab="",col="black")

#Adding the other varables to the plot 
lines(foo[,10],as.numeric(as.character(foo[,8])),col="red")
lines(foo[,10],as.numeric(as.character(foo[,9])),col="blue")

#Adding the legend
legend("topright",legend=colnames(foo[7:9]),lty=1,col=c("black","red","blue"))

#switching off the device
dev.off()