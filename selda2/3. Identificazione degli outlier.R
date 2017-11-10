# fissiamo il set.seed che ci permetterà, a parità di numero tra parentesi, di replicare esattamente lo stesso risultato
set.seed(12345)

# per prima cosa creiamo una distribuzione casuale di numeri, e la registriamo nell’oggetto x
x <- rnorm(1000)

# in questo modo possiamo visualizzare gli outlier
boxplot.stats(x)$out

# creiamo il grafico con la funzione boxplot()
boxplot(x)

identify(rep(1, length(x)), x, labels = seq_along(x))


install.packages('DMwR')
library(DMwR)

# il k è il numero dei vicini che verrà usato per calcolare gli outlier

iris2 <- iris[, 1:4]
outlier <- lofactor(iris2, k = 5)
plot(density(outlier))

iris2 <- iris[, 1:4]
iris_kmeans <- kmeans(iris2, 3)
iris_kmeans$centers
iris_kmeans$cluster
centri <- iris_kmeans$centers[iris_kmeans$cluster, ]
dist <- sqrt(rowSums((iris2 - centri)^2))
outliers <- order(dist, decreasing = TRUE)[1:5]
print(outliers)
print(iris2[outliers,])




