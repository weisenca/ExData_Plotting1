########## Description of Code ##########

## This script creates a historgram plot of the Global Active Data  


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


########## Create Plot#1 ##########

## Define variables 
x<-as.numeric(unlist(working.data["Global_active_power"]))

## Plot figure
png(filename = "plot1.png",width = 480, height = 480) ## Open PNG device
hist(x,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="Red")
dev.off() ## Close the PNG device

## Clear variables 
t<-c("working.dates","working.data") ## List of variables not to clear
rm(list=setdiff(ls(),t))