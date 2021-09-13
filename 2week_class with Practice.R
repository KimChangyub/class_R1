
print("hello world")

1*2
3*4
2/4

a<-2
a
a<-3
a
a<-c(1,2,3)
a

scalar<-1
scalar<-"bts"
scalar

vector<-c(1,2,3)
vector
vector<-c("v","rm","suga")
vector

#matrix는 row가 여러개이다.
matrix <-matrix(c(1,2,3,4,5,6),nrow=3)
matrix
matrix <-matrix(c(1,2,3,4,5,6),nrow=2)
matrix
matrix<-matrix(c(1:20),nrow=4,ncol=5,byrow=TRUE)
matrix
mat1<-c(1:3)
mat2<-c(4:6)
matrix <-cbind(mat1,mat2)
matrix
matrix <-rbind(mat1, mat2)
matrix

matrix[1,2]
matrix[1:2]
matrix[1,]
matrix[,1]
matrix[c(1,2),]

matrix1<-matrix(c(1:9),nrow=3)
matrix2<-matrix(c(10:18),nrow=3)
matrix3<- matrix(c(19:27),nrow=3)
matrix1
matrix2
matrix3
array<-array(c(matrix1,matrix2,matrix3),dim=c(3,3,3))
array

btsname<-c("RM","Jin","suga","jhope","jimin","V","JK")
btsyear<-c(1994,1992,1993,1994,1995,1995,1997)
btsposition<-c("rap", "vocal", "rap", "rap", "vocal", "vocal","vocal")
bts<-data.frame(btsname,btsyear,btsposition)
bts
str(bts)

bts<-data.frame(btsname,btsyear,btsposition,stringsAsFactors = TRUE)
str(bts)

gender=factor(c("male", "female", "female", "male"))
gender
str(gender)

gender=factor(gender,levels = c("male","female"))
gender
str(gender)

bts$btsname
bts$btsposition=factor(btsposition, levels=c("vocal", "rap"))
bts
bts$btsposition
bts$age<-2021-bts$btsyear+1
bts
bts$null<-NULL
bts
bts$na<-NA
bts
dim(bts)
bts
bts[1,5]<-3
bts[2,5]<-5
bts[2,4]<-30
bts[3,5]<-1
bts
bts[1,4]<-NA
mean(bts$na)
mean(bts$age)
mean(bts$age,na.rm=TRUE)

getwd()

installpackages()
install.packages("dplyr")
library(dplyr)

install.packages()
install.packages("dplyr")
library(dplyr)
#자주쓰는 패키지는 libray()명령어를 통해 열어놓자.
%>% 
x<-c(30,20,10,0)
sqrt(mean(abs(x)))
x %>%
  abs() %>% 
  mean() %>% 
  sqrt()

install.packages("nycflights13")
library(nycflights13)
head(flights)
flight_df<-data.frame(flights)
str(flight_df)
flight_df %>% 
  filter(month==2) %>% 
  count(month)
table(flight_df$month)

flight_df %>%
  filter(month==2|day==1) %>% 
  head(5)

flight_df %>% 
  filter(month==2) %>%
  count(month)

flight_df %>% 
  filter(month!=2)
  
flight_df %>% 
  filter(month>=5)

flight_df %>% 
  filter(month %in% c(5,7,10))

flight_df %>% 
  filter(is.na(month))

flight_df %>% 
  filter(!is.na(month))

filter_flight_df <-
  flight_df %>% 
  filter(month %in% c(5,7,10))
#data frame 을 따로 만들었을때


select_flight_df <-
  flight_df %>%
  select(month, day)

str(select_flight_df)

select_flight_df<-
  flight_df %>%
  select(year:day)

select_flight_df<-
  flight_df %>%
  select(-c(year, month))

arrange_flight_df<-
  flight_df %>%
  arrange(month, day) 

flight_df %>%
  mutate(mean_distance=distance/hour, 
         ratio_delay=arr_delay/(hour*60+minute))

mutate(mean_q=q1+q2+q3+q4/4)
#우리가 많이 쓰는 평균만드는 변수
#age(23,24,40,50,80)->집단변수로 만듦 더미로 카타고리로 만듦
flight_df %>% 
  mutate(arr_delay_group=ifelse(arr_delay>0, "delay", "no delay"))->mutate1_flight_df

str(mutate1_flight_df)

install.packages("ggplot2")
library(ggplot2)
data("mpg")
View(mpg)
a<-ggplot(data=mpg, aes(x=displ, y=hwy))
a+geom_point()

b<-ggplot(data=mpg, aes(x=displ))
b+geom_histogram()
b<-ggplot(data=mpg, aes(x=hwy))
b+geom_histogram()

a<-ggplot(data=mpg, aes(x=manufacturer, y=displ))
a+geom_boxplot()

a<-ggplot(data=mpg, aes(x=displ, y=hwy))
a+stat_summary(fun.y=mean, geom="bar")

a<-ggplot(data=mpg, aes(x=displ, y=hwy))
a+stat_summary(fun.y=mean, geom="line")

