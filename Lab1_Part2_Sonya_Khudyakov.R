############################################################################################################################################################################
#1/27/2023
#Sonya Khudyakov
#Lab 1 Part 2
library(ggplot2)
plot(mtcars$wt,mtcars$mpg)
qplot(mtcars$wt,mtcars$mpg)
qplot(wt,mpg,data=mtcars)
ggplot(mtcars,aes(x=wt,y=mpg))+geom_point()
plot(pressure$temperature,pressure$pressure,type='l')
points(pressure$temperature,pressure$pressure)

lines(pressure$temperature,pressure$pressure/2,col='red')
points(pressure$temperature,pressure$pressure/2,col='blue')

qplot(pressure$temperature,pressure$pressure, geom='line')
qplot(temperature,pressure,data=pressure,geom='line')
ggplot(pressure,aes(x=temperature,y=pressure))+geom_line()+geom_point()


# bar graphs
barplot(BOD$demand,names.arg=BOD$Time)
table(mtcars$cyl)
barplot(table(mtcars$cyl)) # this creates a table of counts
qplot(mtcars$cyl)
qplot(factor(mtcars$cyl))

#bar graph of counts
qplot(factor(cyl),data=mtcars)
ggplot(mtcars,aes(x=factor(cyl)))+geom_bars()


#Histogram
hist(mtcars$mpg)
hist(mtcars$mpg,breaks=10)
hist(mtcars$mpg,breaks=5)
hist(mtcars$mpg,breaks=12)
qplot(mpg,data=mtcars,binwidth=4)
ggplot(mtcars,aes(x=mpg))+geom_histogram(binwidth = 4)
ggplot(mtcars,aes(x=mpg))+geom_histogram(binwidth = 5)


#boxplots using ggplot
plot(ToothGrowth$supp,ToothGrowth$len)
boxplot(len ~ supp, data=ToothGrowth)
boxplot(len~supp + dose, data = ToothGrowth)
qplot(ToothGrowth$supp,ToothGrowth$len, geom = 'boxplot')
qplot(supp,len, data=ToothGrowth, geom = 'boxplot')
ggplot(ToothGrowth, aes(x=supp, y=len)) + geom_boxplot()
qplot(interaction(ToothGrowth$supp, ToothGrowth$dose), ToothGrowth$len, geom= 'boxplot')
qplot(interaction(supp,dose), len, data = ToothGrowth, geom = 'boxplot')
ggplot(ToothGrowth, aes(x=interaction(supp,dose), y=len))+geom_boxplot()

######################################################################################
library(dplyr)

multivariate<- read.csv("~/Desktop/School work/Spring 23/Data Analytics/Data/multivariate.csv") # reading in the file
View(multivariate)
head(multivariate)
attach(multivariate)
help(lm)
mm <-lm(multivariate$Homeowners~multivariate$Immigrant)
mm # mm here is a R object.
summary(mm)$coef # The output above shows the estimate of the regression beta coefficients (column Estimate) and
# their significance levels (column Pr(>|t|).
# The intercept is 107494.898 and the coefficient of Immigrant variable is -6656.839.
# The estimated regression equation can be written as follow:
# Homeowners = 107494.898 + (-6656.839)*Immigrant
# We can rewrite it as:
# Homeowners = 107494.898 - 6656.839*Immigrant.

plot(multivariate$Homeowners~multivariate$Immigrant)
help(abline)
abline(mm)
abline(mm,col=2,lwd=3)
# Using this formula, for each new value in Immigrant, you can predict the value for Homeowners.
# As an example:
# For Immigrant value = 0, we will get: Homeowners = 107494.898 - 6656.839*0 = 107494.898
# for Immigrant value = 20, we will get: Homeowners = 107494.898 - 6656.839*20 = -25641.88
# Predictions can be easily made using the R function predict().
# In the following example, we predict Homeowners for two Immigrant values: 0 and 20.
# you can pass the 0 and 20 values as a concatenated list for Immigrants as follows:
newImmigrantdata <- data.frame(Immigrant = c(0, 20))
newImmigrantdata
mm %>% predict(newImmigrantdata)
abline(mm)
abline(mm,col=3,lwd=3) # line color = green, line width = 3
attributes(mm)
mm$coefficients