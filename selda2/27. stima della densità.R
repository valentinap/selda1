set.seed(12345)

random <- runif(nrow(iris))
iris2 <- iris[order(random),]
iris3 <- as.matrix(iris2[, -5])


install.packages("fpc")
library(fpc)


dbs <- dbscan(iris3, eps = 0.5)

table(dbs$cluster, iris2$Species)

plotcluster(iris3, dbs$cluster)


# creiamo dieci item fittizi in una matrice e facciamo la somma con dieci casi dalla matrice iris3 che abbiamo creato sopra 
matrice <-  matrix(runif(10*4, min=0, max = 0.2), nrow = 10, ncol = 4)
iris4 <- iris3[1:10, ] + matrice

# effettuiamo la predizione mettendo come primo argomento il modello dbs, come secondo il primo dataset, e come terzo il dataset da clusterizzare
pred <- predict(dbs, iris3, iris4)

# mettiamo a confronto i risultati ottenuti con quelli dei casi corrispondenti nel primo dataset
cbind(pred, iris2[1:10, 5])
