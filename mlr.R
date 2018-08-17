#multiple linear regression
url="https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=1595306231"
omni=as.data.frame(gsheet::gsheet2tbl(url))
head(omni)

#predict data for different combination of price and promotion
fit1=lm(sqty~price+promotion,data=omni)
summary(fit1)
#sqty=5837-(53*price)+(3.6*promotion)
ndata1=data.frame(price=65,promotion=300)
sqty1=predict(fit1,newdata=ndata1,type='response')
cbind(ndata1,sqty1)

mean(omni$sqty)
omni%>% group_by(price)%>% summarise(salesqty=mean(sqty))%>%arrange(desc(salesqty))

omni%>%filter(promotion==200)%>% group_by(price)%>% summarise(salesqty=mean(sqty))%>%arrange(desc(salesqty))

omni%>% group_by(price,promotion)%>% summarise(salesqty=mean(sqty))%>%arrange(desc(salesqty))

#predict data for omni
#check assumptions for linear regression
#1 is there linear relationship b/w independent and dependent variable
car::crplots(fit1)

#2 do residues have equal variance(homoscedascity)
plot(fit1)
plot(fit1,which=1)

#3 points around straight line
#4 are residues normally distributed (should be normally distributed)
plot(density(residuals(fit1)))
plot(fit1,which=2) # if the dots are around the dotted line , residues are normally distributed

#5 no auto correlation
car::durbinWatsonTest(fit1)

#if pvalue>0.05,there is no auto correlation (NO AUTO correlation)

#6 is there multicollinearity (not needed)
car::vif(fit1)
#if sqrt of above values >2 
#7 are their significant outliers which can affect models(remove outliers)

#predict data
ndata2=data.frame(price=c(60:70),promotion=c(seq(200,300,by=10)))
range(omni$price)
range(omni$promotion)
p2=predict(fit1,newdata=ndata2)
cbind(ndata2,p2)
