# variabili dummy 

set.seed(12345)

df <- data.frame(class = sample(c("A","B"), 10, replace = TRUE))

model.matrix( ~ class - 1, data = df)

# possiamo farlo tramite il pacchetto dummies

install.packages("dummies")
library(dummies)

cbind(df, dummy(df$class, sep = "_"))

# oppure tramite il pacchetto mlr

install.packages("mlr")
library(mlr)

createDummyFeatures(df, cols = "class")
