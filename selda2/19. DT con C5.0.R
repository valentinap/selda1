install.packages("C50")
library(C50)


set.seed(12345)
random <- runif(nrow(iris))
iris2 <- iris[order(random),]

head(iris2)


cir <- C5.0(Species ~., data = iris2[1:100,])

pred <- predict(cir, iris2[101:150, 1:4], type = "prob")

C5imp(cir)

C5imp(cir, metric = "splits")

cbind(as.character(iris2[101:150, 5]), pred)

pred2 <- predict(cir, iris2[101:150, 1:4], type = "class")

table(iris2[101:150, 5], pred2, dnn = c("classe effettiva", "classe predetta"))
     
