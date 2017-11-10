install.packages("topicmodels")
install.packages("tm")
install.packages("SnowballC")

library(topicmodels)
library(tm)

the100 <- VCorpus(DirSource(directory = "/Users/valentinaporcu/R_test/the100/txt", encoding = "UTF-8"))


the100 <- tm_map(the100, content_transformer(tolower))
the100 <- tm_map(the100, content_transformer(stripWhitespace))
the100 <- tm_map(the100, content_transformer(removeWords), stopwords("english"))
the100 <- tm_map(the100, content_transformer(removeWords), c("rhetoriccom", "will"))
the100 <- tm_map(the100, content_transformer(stemDocument))
the100 <- tm_map(the100, content_transformer(removePunctuation))
the100 <- tm_map(the100, content_transformer(PlainTextDocument))

DTM <- DocumentTermMatrix(the100)

DTM2 <- removeSparseTerms(DTM, 0.7)

topics <- LDA(DTM, k = 4)
topics2 <- LDA(DTM2, k = 4, method = "Gibbs")

terms(topics, 8)

