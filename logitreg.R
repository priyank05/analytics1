#logistic regression
library(ISLR)
data(Default)
head (Default)
str(Default)
head(Default[Default$default=='YES',])
table(Default$student)
table(Default$default)
t1=table(Default$default,Default$student)
addmargins(t1)
addmargins(t1,FUN=mean)

library(dplyr)
Default %>% group_by(student,default)%>% summarise(n())

#mean income of students who defaulted
Default%>% group_by(student,default)%>% summarise(mean(income),mean(balance))


#logistic model creation
#modelname=function(Y~X1+X2+....,data=______,,...)
logit1=glm(default~income+balance+student,data=Default,family='binomial')
summary(logit1) #income not a good variable (significant) to predict

logit2=glm(default~balance+student,data=Default,family='binomial')
summary(logit2)

ndata=data.frame(balance=mean(Default$balance),student="Yes")
predict(logit2,newdata=ndata,type='response')

ndata2=data.frame(balance=1486,student="Yes")
predict(logit2,newdata=ndata2,type='response')
