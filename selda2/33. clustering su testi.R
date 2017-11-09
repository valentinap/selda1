# carichiamo il testo dei tweet

analytics <- read.csv("analytics.csv")


# estraiamo il testo dei tweets
bd <- analytics$text

# per proseguire, abbiamo bisogno del pacchetto tm, molto utile quando si parla di analisi dei testi
library(tm)

# convertiamo in corpus, in modo da poterlo trattare con tm 
bd2 <- Corpus(VectorSource(bd))

# ripuliamo il testo
bdc <- tm_map(bd2, content_transformer(function(x) iconv(x, to='UTF-8-MAC', sub='byte')), mc.cores=1)

bdc <- tm_map(bdc, content_transformer(tolower)) 
bdc <- tm_map(bdc, removePunctuation)
bdc <- tm_map(bdc, function(x)removeWords(x,stopwords()))

# creiamo la matrice documenti termini
dtm <- DocumentTermMatrix(bdc)

dtm <- removeSparseTerms(dtm, sparse = 0.95)


mat2 <- as.matrix(dtm)

# creiamo i cluster con i k-means
k <- 6
kmeans_res <- kmeans(mat2, k)
round(kmeans_res$centers, digits=3)


# modifichiamo l’output del cluster

for (i in 1:k) {
        cat(paste("cluster", i, ":  ", sep=""))
        s <- sort(kmeans_res$centers[i,], decreasing=T)
        cat(names(s)[1:3], "\n")
}


library(fpc)

med <- pamk(mat2, metric="manhattan")

k <- med$nc


med <- med$pamobject

for (i in 1:k) {
        cat(paste("cluster", i, ":  "))
        cat(colnames(med$medoids)[which(med$medoids[i,]==1)], "\n")
}

plot(med, color=F, labels=4, lines=0, cex=.8, col.clus=1, col.p=med$clustering)
