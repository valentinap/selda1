# creiamo una matrice casuale
set.seed(12345)
matrice1 <- matrix(rnorm(100), nrow=5, ncol=5)
# stampiamola per visualizzarla
matrice1

# creiamo un oggetto in cui calcoliamo la distribuzione gerarchica
dg <- hclust(dist(matrice1))

# visualizziamo la funzione di clustering
hclust(d = dist(matrice1), method = "ward.D")

# visualizziamo il dendrogramma
plot(dg)

ds <- dist(matrice1, method = "euclidean")
dg <- hclust(ds)


rect.hclust(dg, k=3, border = "blue")
