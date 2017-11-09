install.packages("NbClust")
library(NbClust)

NbClust(iris[-5], method = "centroid", index = "dunn")

NbClust(iris[-5], method = "complete", index = "all")

nbc <- NbClust(iris[-5], method = "complete", index = "all")

hist(nbc$Best.nc[1,], breaks = max(na.omit(nbc$Best.nc[1,])), col = "royalblue3")


barplot(table(nbc$Best.nc[1,]), , col = "royalblue3", main = "Numero di cluster ideale")
