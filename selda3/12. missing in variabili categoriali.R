install.packages("missForest")
library(missForest)

iris.missing <- prodNA(iris, noNA = 0.2)

iris.missing

iris.missF <- missForest(iris.missing, xtrue = iris, verbose = TRUE)

iris.missF

