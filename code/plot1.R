
#Reading the data
x=read.csv("household_power_consumption.txt",sep=";")

#Sub setting the data for the given date range
df=subset(x,strptime(x[,1],"%d/%m/%Y")>strptime("2007-01-31","%Y-%m-%d") & strptime(x[,1],"%d/%m/%Y")<strptime("2007-02-03","%Y-%m-%d"))
#opening the device
png(bg = "white", 
    filename = "plot1.png",
    width = 480, 
    height = 480 
)
#creating the plot
hist(as.numeric(df[,3]),main=paste("Global Active Power"),xlab="Global Active Power(kilowatts)",col="red")
#switching off the device
dev.off()