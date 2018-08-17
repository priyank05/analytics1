#decision making
#creating decision tree (from CART-code)
#install packages rpart,rpart.plot

library(rpart) #doing classification
library(rpart.plot) #visualising a tree

#data set
str(iris)
head(iris)
summary(iris)
names(iris)

ctree=rpart(Species~.,method='class',data=iris)
ctree=rpart(Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,method='class',data=iris)
ctree
# . is same as all the variable names except Species ,ie both the above statements are same

rpart.plot(ctree,main='cassification Tree',nn=T,type=4,extra=104,cex=1.2)
rpart.plot(ctree) #upper one has better representation


