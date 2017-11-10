# creiamo un dataframe casuale. Il set.seed() ci permette di replicare esattamente i risultati della generazione casuale, se tra parentesi inseriamo lo stesso numero, in questo caso 12345
set.seed(12345)
df <- data.frame(x = rnorm(100), y = rnorm(100))

# creiamo un modello predittivo
ml <- lm(y ~ x, data = df)

# creiamo un nuovo dataframe di test per predire i risultati di y a partire dai risultati di x
df2 <- data.frame(x = rnorm(100))
predict(ml, newdata = df2)

# per creare l’XML, usiamo la funzione pmml() e tra parentesi il nome del modello
install.packages('pmml')
library(pmml)

pmml(ml)

save(ml, file = "ml.RData")
load("ml.RData")


# per salvare il nostro file, utilizziamo la funzione saveXML() in questo modo:
saveXML(pmml(ml), "ml.pmml")


