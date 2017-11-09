install.packages("tree")
library(tree)


library(kernlab)
data(spam)


set.seed(12345)
random <- runif(nrow(spam))
spam2 <- spam[order(random),]

train <- spam2[1:3500,]
test <- spam2[3501:4601,]

tree1 <- tree(type ~., train)

pred <- predict(tree1, test, type = "class")

table(pred, test$type)
