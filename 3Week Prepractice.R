#install 패키지
install.packages(c("ggplot2","plyr","reshape","dplyr"))

#launching 패키지
library(ggplot2)
library(reshape)
library(plyr)
library(dplyr)

getwd()
setwd("C://Users/pc1/Desktop/class_R/3Week")
getwd()
#scatter plots
examData<-read.delim("Exam Anxiety.dat",header = TRUE)
names(examData)
str(examData)

#simple scatter
scatter<-ggplot(examData,aes(Anxiety, Exam, colour=Gender))
scatter+geom_point()

scatter<-ggplot(examData,aes(Anxiety, Exam, colour = Gender))
scatter+geom_point(shape=24, size=1, colour="black")

#plot symbol(points)
help(pch)

#Simple scatter / labs(x="x축 이름",y="y축 이름")/ggtitle("title")
scatter<-ggplot(examData, aes(Anxiety, Exam))
scatter+
  geom_point()+
  labs(x="Exam Anxiety",y="Exam Performance %")+
  ggtitle("exam anxiety")

#data labeling
scatter<-ggplot(examData,aes(Anxiety, Exam))
scatter+
  geom_point()+
  labs(x="Exam Anxiety",y="Exam Performance %")+
  ggtitle("exam anxiety")+
  geom_text(aes(label=Code, size=10, vjust=2, hjust=0))

#shape별 Value를 알고 싶을때
help(geom_text)

#집단별 색깔을 달리한 scatter plot
scatter<-ggplot(examData,aes(x=Anxiety, y=Exam, colour=Gender))
scatter+
  geom_point()+
  labs(x="Exam Anxiety", y="Exam Performance %")+
  ggtitle("exam anxiety")

#집단별 모양을 달리한 scatter plot
scatter<-ggplot(examData, aes(x=Anxiety, y=Exam, shape=Gender))
scatter+
  geom_point()+
  labs(x="Exam Anxiety", y="Exam Performance %")+
  ggtitle("exam anxiety")

#집단별 층위를 나누어서 산포도를 그릴때
scatter<-ggplot(examData,aes(x=Anxiety, y=Exam))
scatter+
  geom_point()+
  facet_grid(Gender~.)+
  labs(x="Exam Anxiety", y="Exam Performance %")+
  ggtitle("exam anxiety")

#Simple scatter with regression line(red)+CI
scatter<-ggplot(examData,aes(Anxiety, Exam))
scatter+geom_point()+
  geom_smooth(method="lm", colour="Red")+
  labs(x="Exam Anxiety", y="Exam Performance %")

#Grouped scatter with regression line+CI
scatter<-ggplot(examData,aes(Anxiety, Exam, colour=Gender))
scatter+geom_point()+geom_smooth(method="lm",aes(fill=Gender),alpha=0.1)+
  labs(x="Exam Anxiety", y="Exam Performance %", colour="Gender")

#(학생실습과제)
#"FacebookNarcissism.dat" 자료로 NPQC_R_Total(X축), Rating(y축)의 산포도 그리기
# 1) 산포도 그리기(Rating_Type에 따라 색상 다르게)
# 2) 산포도와 함께 회귀선 그리기(Rating_Type에 따라 회귀선 색상 다르게, method는 lm으로)
# 3) 그림 title은 "geom_smooth(aes(colour = Rating_Type))" 으로 제시
examData2<-read.delim("FacebookNarcissism.dat", header = TRUE)
scatter2<-ggplot(examData2,aes(x=NPQC_R_Total, y=Rating, colour=Rating_Type))
scatter2+geom_point()+
  labs(x="NPQC_R_Total", y="Rating")+
  ggtitle("FacebookNarcissism")
scatter2<-ggplot(examData2,aes(NPQC_R_Total, Rating, colour=Rating_Type))
scatter2+geom_point()+geom_smooth(method="lm",aes(fill=Rating_Type), alpha=0.1)+
  labs(x="NPQC_R_Total", y="Rating")+
  ggtitle("geom_smooth(aes(colour=Rating_type))")

#Load the data file into R. This is a tab-delimited file hence use of read.delim
festivalData<-read.delim("DownloadFestival.dat",header=TRUE)
#Histogram with Outlier
festivalHistogram<-ggplot(festivalData,aes(day1))
festivalHistogram+labs(legend.position="none")+
  geom_histogram(binwidth = 0.4)+
  labs(x="Hygiene(Day 1 of Festival", y="Frequency")
#그래프가 나오지 않음. 이상함-> 수정하여 festivalHistogram 추가하였음

festivalHistogram <- 
  ggplot(festivalData, aes(day1)) + 
  labs(legend.position="none")+ 
  geom_histogram(binwidth = 0.4) + 
  labs(x = "Hygiene (Day 1 of Festival)", y = "Frequency")

#outlier case로 인해 그래프 이상 확인
festivalData %>% 
  arrange(-day1->festivalData_a)

festivalData2=read.delim("DownloadFestival(No Outlier).dat", header=TRUE)

ggplot(festivalData2,aes(day1))+
  geom_histogram(binwidth = 0.4)+
  labs(x="Hygiene of Day 1", y="Frequency")

#Density without outlier(추가)
festivalDensity<-ggplot(festivalData2,aes(day1))
festivalDensity+geom_density()+labs(x="Hygiene(Day 1 of Festival)", y="Density Estimate")

#집단별로 색깔 다르게, alpha=투명도
festivalDensity+geom_density(aes(fill=gender),alpha=0.5)+
  labs(x="Hygiene(Day 1 of Festival",y="Density Estimate")

#이제부터 Boxplots
festivalBoxplot<-ggplot(festivalData,aes(gender,day1))
festivalBoxplot+geom_density(aes(fill=gender),alpha=0.5)+
  labs(x="Hygiene(Day 1 of Festival)", y="Density Estimate")

#with Outlier Removed
ggplot(festivalData2,aes(gender,day1))+
  geom_boxplot()+
  labs(x="Gender", y="Hygiene(Day 1 of Festival)")

#(학생실습과제) days 2 and 3 각각 box plot 그려보기
#day2
ggplot(festivalData2,aes(gender,day2))+
  geom_boxplot()+
  labs(x="Gender", y="Hygiene(Day 2 of Festival)")
#day3
ggplot(festivalData2,aes(gender,day3))+
  geom_boxplot()+
  labs(x="Gender", y="Hygiene(Day 3 of Festival)")

#Bar Chart
chickFlick=read.delim("ChickFlick.dat", header = TRUE)
#fun.y는 더이상 사용하지 않음->fun으로 변경
ggplot(chickFlick, aes(film,arousal))+
  stat_summary(fun = mean, geom="bar", fill="White", colour="Black")+
  stat_summary(fun.data=mean_cl_normal, geom="pointrange")+
  labs(x="Film", y="Mean Arousal")

ggplot(chickFlick, aes(film, arousal, fill=gender))+
  stat_summary(fun=mean, geom="bar",position="dodge")+
  stat_summary(fun.data = mean_cl_normal, geom="errorbar", position=position_dodge(width=0.90),width=0.2)+
  labs(x="Film", y="Mean Arousal", fill="gender")

ggplot(chickFlick, aes(film, arousal, fill=film))+
  stat_summary(fun=mean, geom="bar")+
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar", width=0.2)+
  facet_wrap(~gender)+
  labs(x="Film", y="Mean Arousal")+
  theme(legend.position = "none")

#(학생실습과제) chickFlick 자료, x축 film, y축 arousal.
# 1) 막대 그래프(막내 내부는 흰색, 테두리는 검은색) 
# + 오차 막대 errorbar 형태, mean_cl_normal로 오차 표현, 오차막대 빨간색상으로, 너비는 0.2)
# 2) 막대 그래프(막내 내부는 흰색, 테두리는 검은색) 
#+ 오차 막대 errorbar 형태, mean_cl_boot로 오차 표현, 오차막대 빨간색상으로, 너비는 0.2)

ggplot(chickFlick, aes(film, arousal))+
  stat_summary(fun=mean, geom="bar", )