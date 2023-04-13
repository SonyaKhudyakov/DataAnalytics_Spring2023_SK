# Class work 4/11/2023
#Sonya Khudyakov
# SVM

data('iris')
library(ggplot2)
library(e1071)
head(iris)
qplot(Petal.Length, Petal.Width, data=iris, color = Species)

#SVM Model 1
svm_model1 <- svm(Species~., data=iris) #running the model1
summary(svm_model1) #summary of the model

#plotting the model1
plot(svm_model1, data=iris,
      Petal.Width~Petal.Length, 
      slice = list(Sepal.Width=3, Sepal.Length =4))
#applying the model to predict
pred1 <- predict(svm_model1, iris)

#confusion matrix
table1 <- table(Predicted = pred1, Actual = iris$Species)
table1

#Accuracy score using formula
Model1_accuracyRate = sum(diag(table1))/sum(table1)
Model1_accuracyRate

#Missclassification rate using formula
Model1_MissClassificationRate = 1 - Model1_accuracyRate
Model1_MissClassificationRate
#########################################################################
#SVM Model 2
svm_model2 <- svm(Species~., data=iris,kernel = "polynomial") #running the model2
summary(svm_model2) #summary of the model

#plotting the model2
plot(svm_model2, data=iris, 
     Petal.Width~Petal.Length, 
     slice = list(Sepal.Width=3, Sepal.Length =4))
#applying the model to predict
pred2 <- predict(svm_model2, iris)

#confusion matrix
table2<- table(Predicted = pred2, Actual = iris$Species)
table2

#Accuracy score using formula
Model2_accuracyRate = sum(diag(table2))/sum(table2)
Model2_accuracyRate

#Missclassification rate using formula
Model2_MissClassificationRate = 1 - Model1_accuracyRate
Model2_MissClassificationRate

#########################################################################

#SVM Model 3
svm_model3 <- svm(Species~., data=iris,kernel = "polynomial") #running the model3
summary(svm_model3) #summary of the model

#plotting the model3
plot(svm_model3, data=iris, 
     Petal.Width~Petal.Length, 
     slice = list(Sepal.Width=3, Sepal.Length =4))
#applying the model to predict
pred3 <- predict(svm_model3, iris)

#confusion matrix
table3 <- table(Predicted = pred3, Actual = iris$Species)
table3

#Accuracy score using formula
Model3_accuracyRate = sum(diag(table3))/sum(table3)
Model3_accuracyRate

#Missclassification rate using formula
Model3_MissClassificationRate = 1 - Model3_accuracyRate
Model3_MissClassificationRate
#kernal = polynomial is the worst model 