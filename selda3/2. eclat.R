library(arules)

data(Groceries)
eclat1 <- eclat(Groceries, parameter = list(support = 0.05, maxlen = 10))

inspect(eclat1[1:10])


summary(eclat1)


inspect(sort(eclat1, by="support")[1:10])
