library(caret)

osservati <- c(0.18, 0.79, 0.15, -0.32, 0.05, 0.98, 0.45, 0.63, -1.17)
previsti <- c(0.16, 0.81, 0.14, -0.29, 0.05, 0.98, 0.46, 0.59, -1.14)


R2(previsti, osservati)
