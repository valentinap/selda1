set.seed(12345)
df <- data.frame(sex <- sample(1:2, 100, replace = TRUE), 
                 n.visits <- sample(1:20, 100, replace = TRUE),
                 tot.spent <- sample(20:350, 100, replace = TRUE),
                 age <- sample(18:75, 100, replace = TRUE))

colnames(df) <- c("sex", "n.visits", "tot.spent", "age")

hc <- hclust(dist(df, method = "euclidean"), method = "ward.D2")

plot(hc, hang = -0.01, cex = 0.7)

hc2 <- hclust(dist(df), method = "single")
plot(hc2, hang = -0.01, cex = 0.7)

rect.hclust(hc, k = 4, border = "green")

# in questo modo andiamo a vedere come i casi si distribuiscono dei vari cluster
fit <- cutree(hc, k = 4)
fit
table(fit)


library(cluster)

dv <- diana(df, metric = "euclidean")

summary(dv)

plot(dv)


