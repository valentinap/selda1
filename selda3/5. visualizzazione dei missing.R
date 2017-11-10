install.packages("VIM")
library(VIM)

test <- read.csv("missing_test2.csv")

aggr(test)


matrixplot(test)

install.packages("Amelia")
library(Amelia)

missmap(test)

x <- c(10, 15, 19, NA, 45, 67, 84, NA, 14, 22, 18)

# proviamo a calcolare la media
mean(x)

# impostiamo l'argomento na.rm, che rimuove i missing, come TRUE. Contrariariamente, è di default impostato come FALSE
mean(x, na.rm = TRUE)

# stavolta il calcolo della media funziona!

