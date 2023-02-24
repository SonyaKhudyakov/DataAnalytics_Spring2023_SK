# Lab work on 2/17/2023
#Sonya Khudyakov

#Outliers in Data
library(dataset)
data(cars)
cars1 <- cars[1:30,] #first 30 rows

cars_outliers <- data.frame(speed=c(19,19,20,20,20), dist = c(190,186,210,220,218)) #intro to outliers
head(cars_outliers)

cars2 <-rbind(cars1, cars_outliers) #combines the two dataframes togther

par(mfrow=c(1,2))
plot(cars2$speed, cars2$dist,xlim=c(0,28),ylim=c(0,230), main = 'With Outliers',xlab='speed',ylab='dist',pch='*',col='red',cex=2)

abline(lm(dist ~ speed, data=cars2), col='blue', lwd=3,lty=2)

plot(cars1$speed, cars1$dist,xlim=c(0,28),ylim=c(0,230), main = 'Outliers removes \nA much better fit!',xlab='speed',ylab='dist',pch='*',col='red',cex=2)

abline(lm(dist ~ speed, data=cars1), col='blue', lwd=3,lty=2)
