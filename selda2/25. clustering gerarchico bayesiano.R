install.packages("mclust")
library(mclust)

set.seed(12345)
random <- runif(nrow(iris))
iris2 <- iris[order(random),]

iris3 <- as.matrix(iris2[, -5])

# calcoliamo i cluster tramite la funzione Mclust()
ir_cl <- Mclust(iris3)
plot(ir_cl)



set.seed(12345)
dataset <- data.frame(x=runif(1000),y=runif(1000),z=runif(1000))

mclust_test <- Mclust(dataset)

sum <- summary(mclust_test$BIC, data=dataset)

dataset$CLUST <- mclust_test$classification
