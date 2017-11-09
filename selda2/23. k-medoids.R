install.packages("fpc")
library(fpc)

iris2 <- iris[, 1:4]

pamk_iris <- pamk(iris2)
pamk_iris

plot(pamk_iris$pamobject)


pamk_iris2 <- pamk(iris2, 3)


plot(pamk_iris2$pamobject)

