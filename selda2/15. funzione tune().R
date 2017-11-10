# mescoliamo i casi di iris
random <- runif(nrow(iris))
iris2 <- iris[order(random),]

# estraiamo un oggetto di train e uno di test
iris_train <- iris2[1:100,]
iris_test <- iris2[101:150,]


tune.res <- tune(svm, train.x=iris_train[1:4], 
                 train.y=iris_train[,5],kernel='radial', ranges=list(cost=10^(-1:2), gamma=c(.5,1,2)))

summary(tune.res)


tuned.svm <- svm(Species ~., data=iris_train, kernel="radial", cost=1, gamma=0.5)

summary(tuned.svm)


pred <- predict(tuned.svm,iris_test[1:4])

table(pred,iris_test[,5])
