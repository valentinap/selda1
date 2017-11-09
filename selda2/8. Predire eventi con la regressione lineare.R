altezza <- c(150, 155, 160, 164, 165, 170, 172, 173, 179, 180)
peso <- c(40, 45, 50, 54, 55, 60, 62, 63, 69, 70)

df <- as.data.frame(cbind(altezza, peso))

plot(df)


lm(df$altezza ~ df$peso)


110 + 1 * 65


newd <- as.data.frame(c(40, 45, 47, 50, 55, 60, 65, 70, 75, 80))
colnames(newd) <- "peso2"

modello <- lm(df$altezza ~ df$peso)

pred <- predict(modello, newd)


cbind(pred, newd)

df2 <- cbind(pred, newd)

plot(df2)



# secondo esempio

# carichiamo il dataset
df <- read.csv("regrdf.csv")

# abbiamo due variabili: la prima è il numero di oggetti acquistati, la seconda il prezzo pagato. Vogliamo vedere se esiste una relazione tra queste 
# due variabili e vogliamo prevedere eventuali nuove aggiunte in base a questi dati

print(df)

# vediamo una rappresentazione grafica
plot(df)

# creiamo un oggetto di train e uno di test
set.seed(12345)
sampling <- sample(2, nrow(df), replace=TRUE, prob=c(0.6, 0.4))
train <- df[sampling==1,]
test <- df[sampling==2,]

# creiamo 
lr <- lm(formula = nobj ~ price, data = train)


pred <- predict(lr, newdata = test)

cbind(test$nobj, round(pred))

library(ggplot2)

ggplot() +
        geom_point(aes(x = train$price, y = train$nobj),
                   colour = 'red4') +
        geom_line(aes(x = train$price, y = predict(lr, newdata = train)),
                  colour = 'green4') +
        ggtitle('Variazione del numero di oggetti acquistati in base al costo (Train set)') +
        xlab('numero oggetti acquistati') +
        ylab('costo')

# risultati sul test set
ggplot() +
        geom_point(aes(x = train$price, y = train$nobj),
                   colour = 'blue') +
        geom_line(aes(x = test$price, y = predict(lr, newdata = test)),
                  colour = 'green') +
        ggtitle('Variazione del numero di oggetti acquistati in base al costo (Test set)') +
        xlab('numero oggetti acquistati') +
        ylab('costo')



