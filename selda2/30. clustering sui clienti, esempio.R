# carichiamo il dataset aggiungendo gli argomenti na.strings e strip.white per aggiungere il label NA dove ci sono dati mancanti
churn <- read.csv("~/R_test/churn.csv", na.strings = "", strip.white = TRUE)

# vediamo le prime occorrenze e alcuni dati sul dataset
head(churn)
summary(churn)

# abbiamo dei dati qualitatiti, quindi procediamo ricodificando le variabili e trasformandole eventualmente da fattori a numeri
churn$gender <- ifelse(churn$gender == "female", 1, 2)
churn$gender <- as.integer(churn$gender)

# un modo semplice per ricodificare le variabili è tramite il pacchetto plyr
library(plyr)
churn$paymethod <- as.integer(revalue(churn$paymethod, c("bancomat"= 1, "credit card"= 2, "cash" = 3)))
churn$label <- as.integer(revalue(churn$label, c("loyal" = 1, "churn" = 2)))

# eliminiamo i missing values
churn <- churn[complete.cases(churn), ]

# normalizziamo i dati
churn_stand <- as.data.frame(scale(churn))

# il pacchetto NbClust ci indicherà il numero corretto di cluster per il dataset
library(NbClust)

nbc <- NbClust(churn_stand, method = "complete", index = "all")

hist(nbc$Best.nc[1,], breaks = max(na.omit(nbc$Best.nc[1,])), col = "royalblue3")

barplot(table(nbc$Best.nc[1,]), , col = "royalblue3", main = "Numero di cluster ideale")

# calcoliamo i cluster con i kmeans
churn_kmeans <- kmeans(churn_stand, 15)

# aggreghiamo i risultait in base alla media 
churn_cl <- aggregate(churn, by=list(churn_kmeans$cluster),FUN=mean)

# visualizziamo i risultati
round(churn_cl)

# tramite il pacchetto cluster possiamo visualizzare graficamente i risultati 
library(cluster) 
clusplot(churn, churn_kmeans$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)


# creiamo il dendrogramma dei risultati
library(pvclust)
churn3 <- pvclust(churn, method.hclust="ward.D", method.dist="euclidean")

plot(churn3) 
pvrect(churn3, alpha=.95)
