# carichiamo il file
test <- read.csv("missing_test2.csv")
head(test)

# dal momento che abbiamo delle variabili categoriali, dobbiamo estrarre solo quelle numeriche per calcolare la correlazione
test2 <- test[, 3:5]
head(test2)

# possiamo servirci della funzione cor per calcolare le variabili più correlate tra loro
cor(test2)

cor(test2, use="complete.obs")

lm.test <- lm(ex2~ex1+ex3, data = test2)

pred <- predict(lm.test, test2)


reg.imp <- function(x, x.imp) {
        ifelse(is.na(x), x.imp, x)
}

imp.test <- reg.imp(test2$ex2, pred)

cbind(test2$ex2, imp.test)

