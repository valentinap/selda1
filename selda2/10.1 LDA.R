# installiamo e carichiamo il pacchetto ggplot2
install.packages("ggplot2")
library(ggplot2)

# richiamiamo e visualizziamo i dati
data(mpg)
View(mpg)

# mescoliamo i dati del dataset in modo da renderli meno omogenei
set.seed(12345)
random <- runif(nrow(mpg))
mpg2 <- mpg[order(random),]

# creiamo un dataset di train e uno di test
train <- mpg2[1:150,]
test <- mpg2[151:234,]

# creiamo il modello predittivo: prediremo la variabile cyl a partire dalle variabili cty, hwy e displ
mod <- lda(data = train, cyl ~ cty + hwy + displ)

# applichiamo il modello sul dataset di test
pred <- predict(mod, test)

# visualizziamo i dati della predizione
table(pred$class, test$cyl)
