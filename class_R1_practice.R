1+1

245*190

typeof(10)
typeof("Hello World")
typeof(2<4)

x<-c(5,12,13,12)
xf<-factor(x)
xf

str(xf)

unclass(xf)

a<-c("ha","kim","park","bae")
b<-c("f","m","f","m")
c<-c(1,2,3,4)
d<-data.frame(a,b,c)
d<-data.frame(name=a,gender=b,numbers=c)

str(d)

getwd()

install.packages("readxl")
library(readxl)

a<-read_excel("data_excel")

View(a)
str(a)
summary(a)
summary(a$score)

