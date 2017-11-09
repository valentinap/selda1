install.packages("party")
library(party)

set.seed(12345)
random <- runif(nrow(iris))
iris2 <- iris[order(random),]

train <- iris2[1:100,]
test <- iris2[101:150,]


irp <- ctree(Species ~., data = train)

table(predict(irp), train$Species)

print(irp)

plot(irp)

test_pred <- predict(irp, test)

table(test_pred, test$Species)
