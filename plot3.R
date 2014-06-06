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
y1<-as.numeric(unlist(working.data["Sub_metering_1"]))
y2<-as.numeric(unlist(working.data["Sub_metering_2"]))
y3<-as.numeric(unlist(working.data["Sub_metering_3"]))

## Plot figure
png(filename = "plot3.png",width = 480, height = 480)

plot(x,y1,type="l",ylab="Energy sub metering",xlab="")
lines(x, y2, col="red")
lines(x, y3, col="blue")
legend("topright", pch = "-", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
title(ylab="Energy sub metering")

dev.off() ## Don't forget to close the PNG device!

## Clear variables 
t<-c("working.dates","working.data")
rm(list=setdiff(ls(),t)) 