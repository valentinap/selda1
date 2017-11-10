frase1 <- c(2,1,2,2,0,1,1,2,0,2)
frase2 <- c(1,0,1,1,1,0,0,1,1,1)

crossprod(frase1, frase2)/sqrt(crossprod(frase1)* crossprod(frase2))

# creiamo due nuovi vettori:
frase3 <- c(2,1,2,2,1,1,2,0,2)
frase4 <- c(1,0,1,1,1,0,1,1,1)

# conteggiamone la similarità
crossprod(frase3, frase4)/sqrt(crossprod(frase3)* crossprod(frase4))