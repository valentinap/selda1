# carichiamo i pacchetti necessari
library(mlbench)
library(caret)

# carichiamo i dati
data(PimaIndiansDiabetes)
pid <- PimaIndiansDiabetes

# impostiamo i metodi di controllo
contr <- trainControl(method="repeatedcv", number=10, repeats=3)

# Linear Discriminant Analysis
mod.lda <- train(diabetes~., data=pid, method="lda", metric="Accuracy", preProc=c("center", "scale"), trControl=contr)

# Logistic Regression
mod.glm <- train(diabetes~., data=pid, method="glm", metric="Accuracy", trControl=contr)

# GLMNET
mod.glmnet <- train(diabetes~., data=pid, method="glmnet", metric="Accuracy", preProc=c("center", "scale"), trControl=contr)

# SVM Radial
mod.svmRadial <- train(diabetes~., data=pid, method="svmRadial", metric="Accuracy", preProc=c("center", "scale"), trControl=contr, fit=FALSE)

# kNN
mod.knn <- train(diabetes~., data=pid, method="knn", metric="Accuracy", preProc=c("center", "scale"), trControl=contr)

# Naive Bayes
mod.nb <- train(diabetes~., data=pid, method="nb", metric="Accuracy", trControl=contr)

# CART
mod.cart <- train(diabetes~., data=pid, method="rpart", metric="Accuracy", trControl=contr)

# C5.0
mod.c50 <- train(diabetes~., data=pid, method="C5.0", metric="Accuracy", trControl=contr)

# Bagged CART
mod.treebag <- train(diabetes~., data=pid, method="treebag", metric="Accuracy", trControl=contr)

# Random Forest
mod.rf <- train(diabetes~., data=pid, method="rf", metric="Accuracy", trControl=contr)

# Stochastic Gradient Boosting 
mod.gbm <- train(diabetes~., data=pid, method="gbm", metric="Accuracy", trControl=contr, verbose=FALSE)


res <- resamples(list(lda=mod.lda, logistic=mod.glm, glmnet=mod.glmnet,
                      svm=mod.svmRadial, knn=mod.knn, nb=mod.nb, cart=mod.cart, c50=mod.c50,
                      bagging=mod.treebag, rf=mod.rf, gbm=mod.gbm))

# compariamo i risultati
summary(res)


# creiamo i grafici
bwplot(res)
dotplot(res)
