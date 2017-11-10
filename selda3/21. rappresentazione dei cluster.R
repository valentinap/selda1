# creiamo dei vettori con le frequenze delle parole dei nostri documenti
doc1 <- c(6,7,8,4)
doc2 <- c(10,11, 3, 9)
doc3 <- c(9,3,8,5)
doc4 <- c(5,6,6,7)
doc5 <- c(8, 7, 11, 14)

# creiamo una matrice con i nostri vettori
matrice.doc <- rbind(doc1, doc2, doc3, doc4, doc5)

# attribuiamo dei nomi alle colonne (le parole di cui abbiamo misurato la frequenza)
colnames(matrice.doc) <- c("par1", "par2", "par3", "par4")

# visualizziamo la nostra matrice
matrice.doc

dist(matrice.doc)

matrice.dist <- dist(matrice.doc)

matrice.hc <- hclust(matrice.dist)

plot(matrice.hc)
