# calcoliamo la distanza di Jaccard
gdiss <- dissimilarity(Groceries, which = "items")

# utilizziamo la funzione hclust() per il clustering gerarchico
clust <- hclust(gdiss)


plot(clust, cex = .7)

install.packages("networkD3")
library(networkD3)

radialNetwork(as.radialNetwork(clust))





