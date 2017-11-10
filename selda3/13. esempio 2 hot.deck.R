churn <- read.csv("churn.csv", na.strings = "", strip.white = TRUE, sep = "," )

install.packages('hot.deck')
library(hot.deck)

churn2 <- hot.deck(churn, m = 1)

churn2$data

