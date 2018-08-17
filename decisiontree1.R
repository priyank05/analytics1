
gender=sample(x=c('Male','Female'),size=1000,replace=T,prob=c(0.5,0.5))
buy=sample(x=c('Buy','Not Buy'),size=1000,replace=T,prob=c(0.5,0.5))
married=sample(x=c('Married','Single'),size=1000,replace=T,prob=c(0.3,0.7))
age=ceiling(runif(1000,22,30))
course=sample(x=c('Phd','MBA','BBA'),size=1000,replace=T,prob=c(0.3,0.3,0.4))
students=data.frame(gender,buy,married,age,course)
head(students)

ctree=rpart(buy~.,data=students)
ctree
rpart.plot(ctree,cex=1)
rpart.plot(ctree,nn=T,cex=1)

(ndata1=data.frame(gender='Male',course='Phd',married='Single',age=25))
(p1=predict(ctree,newdata=ndata1,type='class'))
(p2=predict(ctree,newdata=ndata1,type='prob'))
cbind(p1,ndata1)
cbind(p2,ndata1)

ctree2=rpart(buy~.,data=students,cp=-1)
ctree2
rpart.plot(ctree2,nn=T,cex=0.5)
printcp(ctree2)

cptree2b=prune(ctree,cp=0.004)
cptree2b
rpart.plot(cptree2b,nn=T)

(ndata1=data.frame(gender=c('Male','Female'),course=c('Phd','MBA'),married=c('Single','Married'),age=c(25,27)))
(p1=predict(ctree,newdata=ndata1,type='class'))
(p2=predict(ctree,newdata=ndata1,type='prob'))
cbind(ndata1,p1,p2)

