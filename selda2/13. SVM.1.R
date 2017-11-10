# generiamo dei dati casuali 
set.seed(12345)
x <- runif(50, min = 0, max = 20)
y <- runif(50, min = 0, max = 20)

plot(x,y)

# creiamo delle etichette per i nostri dati e applichiamole in base ai valori
class <- rep("class1", 50)
class[x > 10] <- "class2"

# visualizziamo i dati
plot(x,y, col = ifelse(class=="class1", "red", "blue"))


# creiamo un dataframe con i nostri dati
df <- data.frame(x, y, class)

library(e1071)

# creiamo un modello predittivo con kernel lineare
ml <- svm(class ~., df, kernel ="linear", cost =0.1)

# creiamo altre due distribuzioni dati
z <- runif(50, min = 0, max = 20)
h <- runif(50, min = 0, max = 20)

# creiamo un altro dataframe
df2 <- data.frame(z,h)
# rappresentiamo graficamente i dati
plot(df2)


# prediciamo tramite il nostro modello l’appartenenza alle due classi per gli elementi del secondo dataframe df2
predict(ml, df2)

# modello non lineare
set.seed(1234)
x <- runif(50, min = 0, max = 20)
y <- runif(50, min = 0, max = 20)

# stavolta i dati della classe2 saranno distribuiti diversamente, nei valori centrali
class <- rep("class1", 50)
class[x>4 & x < 13] <- "class2"

# creiamo un dataframe con i nostri vettori
df <- data.frame(x, y, class)

# visualizziamo la rappresentazione grafica
plot(x,y, col = ifelse(class=="class1", "red", "green"))


# creiamo alcuni modelli impostando il kernel come radiale e modificando i parametri gamma e cost. cost è il parametro di penalizzazione e gamma il parametro kernel per la funzione rediale

ml <- svm(class~., df, type='C', kernel ="radial", gamma = 0.1)
ml2 <- svm(class~., df, type='C', kernel ="radial", gamma = 1, cost = 1)
ml3 <- svm(class~., df, type='C', kernel ="radial", gamma = 1, cost = 10)


# estraiamo e mescoliamo alcuni dati dal nostro dataset di partenza
random <- runif(nrow(df))
df2 <- df[order(random),]
df3 <- df[1:25,]

# creiamo tre predizioni, ognuno con un diverso modello
pred1 <- predict(ml, df3)
pred2 <- predict(ml2, df3)
pred3 <- predict(ml3, df3)

# visualizziamo i risultati a confronto con i valori effettivi
table(df3$class, pred1)

table(df3$class, pred2)

table(df3$class, pred3)

