#Lab 7 & 8 3/31/2023
#Class/Lab Work
#Sonya Khudyakov
data("iris") #read data
irisdata1 <-iris[,1:4] #look at only the first 4 columns *ignore last one
#library("princomp")
principal_components <- princomp(irisdata1,cor=TRUE,score=TRUE) #run the PCA to find components
summary(principal_components) #print components

plot(principal_components)

plot(principal_components,type="l")

biplot(principal_components)

##################################################################
wine_data <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data", sep = ",")
nrow(wine_data)
colnames(wine_data) <- c("Cvs","Alchol",
                         "Malic_Acid", "Ash","Alkalinity_Ash",
                         "Magnesium","Total_Phenols","Flavanoids","NonFlavanoid_Phenols",
                         "Proanthocyanins","Color_Intensity","Hue","OD280/OD315_of_Diluted_Wine",
                         "Proline")
