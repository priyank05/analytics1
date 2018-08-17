#linear regression
women
#predict weight for height 67.5
fit=lm(weight~height,data=women) #for simple regression
#fit1=lm(sales~price+promtion,data=_____) #for multiple regression
summary(fit)
(ndata1=data.frame(height=c(62.8,56.1)))
(p1=predict(fit,newdata=ndata1,type='response'))
cbind(ndata1,p1)
# for different values
(ndata2=data.frame(height=c(60:70)))
(p2=predict(fit,newdata=ndata2,type='response'))
cbind(ndata2,p2)
