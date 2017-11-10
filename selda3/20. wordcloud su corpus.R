t1 <- readLines("/Users/valentinaporcu/R_test/the100/txt/John\ F.\ Kennedy\ -\ Cuban\ Missile\ Crisis.txt")
t2 <- readLines("/Users/valentinaporcu/R_test/the100/txt/Russell\ Conwell\ -\ Acres\ of\ Diamonds.txt")

t1 <- paste(t1, collapse = " ")
t2 <- paste(t2, collapse = " ")

text <- c(t1, t2)


library(tm)
Vtest <- VectorSource(text)

Vcor <- VCorpus(Vtest)


cVcor <- tm_map(Vcor, removeWords, stopwords("english"))
cVcor <- tm_map(cVcor, removePunctuation)
cVcor <- tm_map(cVcor, removeNumbers)
cVcor <- tm_map(cVcor, content_transformer(tolower))
cVcor <- tm_map(cVcor, stripWhitespace)



# creiamo la matrice termini documenti
tdm <- TermDocumentMatrix(cVcor)

# Trasformiamo in matrice
mat <- as.matrix(tdm)



library(wordcloud)

# usiamo la funzione commonality.cloud() che ci mostra le parole in comune tra due documenti
commonality.cloud(mat, colors = "tomato1", max.words = 50)


# usiamo la funzione comparison.cloud() per visualizzare i termini che NON sono in comune tra i due documenti
comparison.cloud(mat, colors = c("red", "blue"), max.words = 50)


# piramide polarizzata
install.packages("plotrix")
library(plotrix)

colnames(tdm) <- c("t1", "t2")
mat2 <- as.matrix(tdm)


# estraiamo le parole in comune
cw <- subset(mat2, mat2[, 1] > 0 & mat2[, 2] > 0)

# creiamo un vettore con le parole non in comune
diff <- abs(cw[, 1] - cw[, 2])

# Combiniamo le parole in comune e quelle non in comune
cw <- cbind(cw, diff)

# ordiniamo le differenze dalla più grande alla più piccola
cw <- cw[order(cw[, 3], decreasing = TRUE), ]

# estraiamo le prime 20 parole 
cw20 <- data.frame(x = cw[1:20, 1], 
                       y = cw[1:20, 2], 
                       labels = rownames(cw[1:20, ]))

# creiamo la piramide polarizzata
pyramid.plot(cw20$x, cw20$y, labels = cw20$labels, 
             gap = 8, top.labels = c("t1", "words", "t2"), 
             main = "common words", laxlab = NULL, 
             raxlab = NULL, unit = NULL)



