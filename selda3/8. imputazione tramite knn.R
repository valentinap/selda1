library(VIM)

test <- read.csv("missing_test2.csv")

test_knn <- kNN(test)

test_knn

cbind(test$ex2, test_knn$ex2)
