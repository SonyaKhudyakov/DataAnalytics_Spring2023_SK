#Lab Work on 2/24/2023
#Sonya Khudyakov
library(ISLR)
library(dplyr)
head(Hitters)
dim(Hitters)
is.na(Hitters)
HittersData <- na.omit(Hitters)
dim(HittersData)
glimpse(HittersData)
head(HittersData)

SalaryPredictModel1 <-lm(HittersData$Salary~.,data=HittersData)
summary(SalaryPredictModel1)
cooksD <- cooks.distance(SalaryPredictModel1)
influential <- cooksD[(cooksD)>(3*mean(cooksD,na.rm=T))]
influential

namesInfluential <- names(influential)
namesInfluential

outliers <- HittersData[namesInfluential,]
HittersWOOuterliers <- HittersData %>% anti_join(outliers)

#Model 2
SalaryPredictModel2 <- lm(HittersData$Salary~., data = HittersWOOuterliers)
summary(SalaryPredictModel2)
