install.packages("quanteda")
library(quanteda)

alice <- readLines("/Users/valentinaporcu/R_test/text/alice.txt")

tokenize(toLower(alice), removePunct = TRUE, ngrams = 2)

tokenize(toLower(alice), removePunct = TRUE, ngrams = 3)


install.packages("ngram")
library(ngram)


alice2 <- as.String(alice)

ngram_asweka(alice2, min = 2, max = 3, sep = " ")

library(tm)
install.packages('RWeka')
library(RWeka)

corpus <- VCorpus(DirSource("~/dir"))

corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus , stripWhitespace)
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, removeWords, stopwords("english")) 
corpus <- tm_map(corpus, stemDocument, language = "english") 

# qui abbiamo due notazioni alternative, possiamo usare la prima o la seconda, sono equivalenti
ngram <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 3))

ngram <- function(x) {RWeka::NGramTokenizer(x, RWeka::Weka_control(min = 2, max = 3))}

# tdm <- TermDocumentMatrix(corpus, control = list(tokenize = ngram, weighting = weightTfIdf))

# importiamo il testo
alice <- scan("~/alice.txt", what="character", sep="\n")
               
# convertiamo in minuscolo
alice <- tolower(alice)
               
# convertiamo da righe a vettore di caratteri
alice <- unlist(strsplit(alice, "[^a-z]+"))
               
# eliminiamo i termini vuoti
alice <- alice[alice != ""]
               
# creiamo e visualizziamo i 20 bigram più frequenti nel testo in questo modo
alice2 <- c(alice[-1], ".")
               
freq <- sort(table(paste(alice, alice2)), decreasing=T)
               
for (n in names(freq)[1:20]) {
        cat(n, freq[n], "\n", sep="\t")
}

               

# creiamo e visualizziamo i trigram più frequenti nel testo in questo modo
alice3 <- c(alice2[-1], ".")
               
trigrams <- paste(alice, alice2, alice3)
               
               
freq2 <- sort(table(trigrams), decreasing=T)
               
for (n in names(freq2)[1:20]) {
        cat(n, freq2[n], "\n", sep="\t")
}


               
