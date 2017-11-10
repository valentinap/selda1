install.packages("hot.deck")
library(hot.deck)

test <- read.csv("missing_test2.csv")

hot.deck(test, m = 1)

