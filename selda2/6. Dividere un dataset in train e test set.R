dim(iris)

iris_train <- iris[1:100 ,]
iris_test <- iris[101:150 ,]

random <- runif(nrow(iris))
iris2 <- iris[order(random),]


install.packages('caTools')
library(caTools)

split = sample.split(iris$Species, SplitRatio = 0.7)
train = subset(iris, split == TRUE)
test = subset(iris, split == FALSE)

install.packages("dplyr")
library(dplyr)

set.seed(1234)
sample_n(iris,10)

install.packages("caTools")
library(caTools)

split = sample.split(iris$Species, SplitRatio = 0.7)
train = subset(iris, split == TRUE)
test = subset(iris, split == FALSE)

install.packages('caret')
library(caret)

intrain <- createDataPartition(iris$Species, p=0.75, list=FALSE)

training <-iris[intrain, ]
testing <- iris[-intrain, ]

str(testing)

set.seed(1234)
createFolds(iris$Species, 10)

lista1 <- createFolds(iris$Species, 10)


iris[lista1[[1]],]

iris_test <- iris[lista1[[1]],]