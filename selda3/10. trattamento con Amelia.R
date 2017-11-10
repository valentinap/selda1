install.packages("Amelia")
library(Amelia)

iris2 <- iris[,-5]

iris2$Petal.Length[sample(150,15)] <- NA

am.test <- amelia(iris2,5)

write.amelia(obj=am.test, file.stem = "amelia.output")

output1 <- read.csv("amelia.output1.csv")
output2 <- read.csv("amelia.output2.csv")
output3 <- read.csv("amelia.output3.csv")
output4 <- read.csv("amelia.output4.csv")
output5 <- read.csv("amelia.output5.csv")

round(cbind(iris2$Petal.Length, iris$Petal.Length, output1$Petal.Length, output2$Petal.Length, output3$Petal.Length, output4$Petal.Length, output5$Petal.Length))

AmeliaView()

write.table(iris2, file="iris.missing.csv", sep = ",")
