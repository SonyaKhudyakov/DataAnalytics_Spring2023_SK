# In class work 3/21-3/24
# Sonya Khudyakov
library(ISLR)
library(MASS)
library(boot)
set.seed(123)

??cv.glm  # Read the cv.glm documentation

help("sample")
train = sample(392,196)

lm.fit <- lm(mpg~horsepower, data = Auto, subset = train) # Linear
attach(Auto)
mean((mpg-predict(lm.fit,Auto))[-train]^2) #21.24991

lm.fit2 <- lm(mpg~poly(horsepower,2), data = Auto, subset = train) # Quadratic
mean((mpg-predict(lm.fit2,Auto))[-train]^2) # 16.48112

# Cubic regression line
lm.fit3 <- lm(mpg~poly(horsepower,3), data = Auto, subset = train) # Cubic
mean((mpg-predict(lm.fit3,Auto))[-train]^2) #16.58276

# The error rates are: 16.48112 for quadratics and 16.58276 for cubic

set.seed(12)
train = sample(392,196)
lm.fit <- lm(mpg~horsepower, data = Auto, subset = train) # Linear
mean((mpg-predict(lm.fit,Auto))[-train]^2)
# the error rate is 24.7332
lm.fit2 <- lm(mpg~poly(horsepower,2), data = Auto, subset = train) # Quadratic
mean((mpg-predict(lm.fit2,Auto))[-train]^2)
# the error rate is 20.46137

lm.fit3 <- lm(mpg~poly(horsepower,3), data = Auto, subset = train) # Cubic
mean((mpg-predict(lm.fit3,Auto))[-train]^2)
# the error rate is 20.41125


# k-Fold Cross Validation
# The cv.glm() function can also be used to implement k-fold CV.
# We once again, set a random seed and initialize a vector in which,
# we will store the CV errors corresponding to the polynomial fits of orders one to #ten.
# here the K =10
# Read the cv.glm documentation
??cv.glm
set.seed(17)
help("rep") # read the documentation for the rep() function in R.
cv.error.10 = rep(0,10) # read documentation, help("rep")
for(i in 1:10){
  glm.fit = glm(mpg ~ poly(horsepower, i), data = Auto)
  cv.error.10[i] = cv.glm(Auto,glm.fit, K=10) $delta[1]
}
cv.error.10


#Titanic Datad

data(Titanic)





