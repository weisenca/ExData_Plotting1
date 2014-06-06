########## Description of Code ##########

## This script creates a line plot of all Energy Sub Metering variables  


########## Define Working Varibles ##########

## Load the data file
mydata<- read.csv("household_power_consumption.txt",sep=";",header=TRUE,colClasses="character")

## Find correct dates
mydates<-strptime(mydata[,1], "%d/%m/%Y")
first.date<-grep("2007-02-01",mydates)
second.date<-grep("2007-02-02",mydates)

## Define all no time and date variables 
working.data<-mydata[first.date[1]:second.date[length(second.date)],3:9]

## Define "Date-Time" varaible
mydate<-mydata[first.date[1]:second.date[length(second.date)],1]
mytime<-mydata[first.date[1]:second.date[length(second.date)],2]
temp<-paste(mydate,mytime)
working.dates<-strptime(temp, "%d/%m/%Y %H:%M:%S")

## Remove variables
t<-c("working.dates","working.data")
rm(list=setdiff(ls(),t))


########## Create Plot#3 ##########

## Define variables 
x<-working.dates

y1<-as.numeric(unlist(working.data["Global_active_power"]))
y2<-as.numeric(unlist(working.data["Voltage"]))
y3a<-as.numeric(unlist(working.data["Sub_metering_1"]))
y3b<-as.numeric(unlist(working.data["Sub_metering_2"]))
y3c<-as.numeric(unlist(working.data["Sub_metering_3"]))
y4<-as.numeric(unlist(working.data["Global_reactive_power"]))

## Plot figure
png(filename = "plot4.png",width = 480, height = 480)

par(mfrow = c(2, 2))
plot(x,y1,type="l",ylab="Global Active Power",xlab="")
plot(x,y2,type="l",ylab="Voltage",xlab="datetime")
plot(x,y3a,type="l",ylab="Energy sub metering",xlab="")
lines(x, y3b, col="red")
lines(x, y3c, col="blue")
plot(x,y4,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off() ## Don't forget to close the PNG device!

## Clear variables 
t<-c("working.dates","working.data")
rm(list=setdiff(ls(),t)) 