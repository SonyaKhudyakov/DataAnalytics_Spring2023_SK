######################################################################################
#Lab 1 Practice - EPI
days <- c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
temp <- c(30,31,30,27,29,30.5,29.7)
snowed <- c('T','T','F','T','T','T','F')

RPI_Weather_Week <- data.frame(days,temp,snowed)

head(RPI_Weather_Week)

summary(RPI_Weather_Week)

######################################################################################
######################################################################################
#Using 2010 Data
all_content = readLines("~/Desktop/School work/Spring 23/Data Analytics/Data/2010EPI_data.csv")
skip_second = all_content[-2]
EPI_data = read.csv(textConnection(skip_second), header = TRUE, stringsAsFactors = FALSE) # To read 2010 dataset 
View(EPI_data)
attach(EPI_data) # sets the 'default' object

#Using just EPI Dataset
EPI<- read.csv("~/Desktop/School work/Spring 23/Data Analytics/Data/EPI_data.csv",header=TRUE)

tf <- is.na(EPI$EPI) # Records True values if the value is NA
EPI$EPI

E <- EPI$EPI[!tf] #filters out NA
tf

#Excercise 1
summary(EPI$EPI) #basic summary stats of each column in the dataframe

fivenum(EPI$EPI, na.rm=TRUE)

stem(EPI$PEPI) #Stem and leaf plot of population07 of EPI data

hist(EPI$EPI) # Historgram
hist(EPI$EPI, seq (30.,95.,1.0),prob=TRUE) # Historgram

lines(density(EPI$EPI,na.rm=TRUE,bw=1)) # the original way to do it
lines(density(EPI$EPI,na.rm=TRUE,bw="SJ")) # look up SJ

rug(EPI$EPI)

plot(ecdf(EPI$EPI),do.points = F, vericals = T)
qqnorm(EPI$EPI)
qqline(EPI$EPI)

qqnorm(EPI$BIODIVERSITY)

boxplot(EPI$EPI,EPI$DALY)
qqplot(EPI$EPI,EPI$DALY)

####################################################################################
#Excercise 2


####################################################################################
install.packages("readxl")
library("readxl")
#2010 EPI Dataset
#reading in CSV file, it didn't work the first time because you need to rewrite your CSV file to nonumberic starting values
all_content = readLines("~/Desktop/School work/Spring 23/Data Analytics/Data/EPI2010_data.csv")
skip_second = all_content[-2]
EPI_data = read.csv(textConnection(skip_second), header = TRUE, stringsAsFactors = FALSE)
EPI_data

#EPI_xls <- read_excel("~/Desktop/School work/Spring 23/Data Analytics/Data/EPI2010_data.xls")
#EPI_xls

