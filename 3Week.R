install.packages(c("ggplot2","plyr","reshape","dplyr"))
install.packages("dplyr")
install.packages("ggplot2")
#launching 패키지
library(ggplot2)
library(reshape)
library(plyr)
library(dplyr)
install.packages("nycflights13")
library(nycflights13)

flight_df <-data.frame(flights)
flight_df %>%
  mutate(arr_delay_group=ifelse(arr_delay>0, "delay", "no delay"))
flight_df %>%
  mutate(arr_delay_group=ifelse(arr_delay>0, "delay", "no delay"))->mutate1_flight_df
### 3.5. group_by와 summarise ######################################################
##group_by는 특정 변수로 grouping하는 것 (성별(남/여)에 따라 데이터를 split)
##summarize는 group_by와 쌍으로 자주 쓰임. 그룹별로 특정 변수의 값을 요약(평균, 분산 등)할때 사용
flight_df %>%
  group_by(month)

mutate1_flight_df %>% 
  group_by(arr_delay_group) %>% 
  summarise(max=max(arr_delay),
            min=min(arr_delay), 
            mean=mean(arr_delay), 
            med=median(arr_delay), 
            per20=quantile(arr_delay, 0,25))

table(mutate1_flight_df$arr_delay_group)

flight_df %>%
  filter(!is.na(arr_delay)) %>% 
  mutate(arr_delay_group=ifelse(arr_delay>0, "delay", "no delay")) %>% 
  group_by(arr_delay_group) %>% 
  summarise(max=max(arr_delay),
            min=min(arr_delay), 
            mean=mean(arr_delay), 
            med=median(arr_delay), 
            per20=quantile(arr_delay, 0,25))->final
final
##summarise : 요약통계량 계산
#mean(x,na.rm=TRUE) : 결측값제외하고 평균
#median(x,na.rm=TRUE) : 중앙값
#sd(x,na.rm=TRUE) : 표준편차
#min(x,na.rm=TRUE) : 최솟값
#max(x,na.rm=TRUE) : 최대값
#IQR(x,na.rm=TRUE) : 사분위수 : Q3-Q1
#sum(x,na.rm=TRUE) : 합
#n() 관측치 개수 계산, x변수 입력 하지 않음
#n_disinct(x) : 중복없는 유일한 관측치 개수 계산
###실습######
mutate1_flight_df %>% 
  group_by(arr_delay_group) %>% 
  summarise(n=n())

mutate1_flight_df %>% 
  group_by(arr_delay_group) %>% 
  summarise(countofarrdelaygroup=n())

mutate1_flight_df %>% 
  filter(!is.na(arr_delay)) %>% 
  group_by(arr_delay_group) %>% 
  summarise(n=n())

str(mutate1_flight_df)
mutate2_flight_df<- rename(mutate1_flight_df, destination=dest)
str(mutate2_flight_df)

install.packages('ggplot2')
library(ggplot2)
flight_df %>%
  filter(!is.na(arr_delay)) %>% 
  group_by(month) %>% 
  summarise(max=max(arr_delay)) %>% 
  ggplot(.,aes(x=month, y=max))+geom_line()

install.packages(c("ggplot2", "plyr", "reshape"))
library(ggplot2)
library(reshape)
library(plyr)
library(dplyr)
install.packages("reshape")
library(plyr)
library(reshape)

getwd()
install.packages("readxl")
install.packages("foreign")
library(readxl)
library(foreign)
#csv 엑셀로 저장하는 것을                            TRUE는 제목으로 인식
examData <- read.delim("Exam Anxiety.dat",  header = TRUE)
names(examData)
str(examData)

a<-ggplot(examData,aes(Anxiety, Exam))
a+geom_point()

a<-ggplot(examData,aes(Anxiety, Exam))+
  geom_point()

#Simple scatter                   x축     y축 <-약속임
scatter <- ggplot(examData, aes(Anxiety, Exam, colour = Gender))+
  geom_point()
scatter

scatter <- ggplot(examData, aes(Anxiety, Exam, colour = Gender)) + 
  geom_point(shape=5, size=5, colour="black")
scatter

help(pch)scatter <- ggplot(examData, aes(Anxiety, Exam))
scatter + 
  geom_point() + 
  labs(x = "Exam Anxiety", y = "Exam Performance %") + 
  ggtitle("exam anxiety")+
  geom_text(aes(label=Code, size=1, vjust=2, hjust=0))

##집단별 모양을 달리한 scatter plot
scatter <- ggplot(examData, aes(x=Anxiety, y=Exam, shape=Gender))
scatter + 
  geom_point() + 
  labs(x = "Exam Anxiety", y = "Exam Performance %") + 
  ggtitle("exam anxiety")

##집단별 층위를 나누어서 산포도를 그릴때
scatter <- ggplot(examData, aes(x=Anxiety, y=Exam))
scatter + 
  geom_point() + 
  facet_grid(Gender~.)+
  labs(x = "Exam Anxiety", y = "Exam Performance %") + 
  ggtitle("exam anxiety")

#Simple scatter with smooth/ 
scatter <- ggplot(examData, aes(Anxiety, Exam))
scatter + geom_point() + 
  geom_smooth() + 
  labs(x = "Exam Anxiety", y = "Exam Performance %")+ 
  ggtitle("exam anxiety")

#Simple scatter with regression line(red), 여기서 se는 표준오차 안보여줌F 보여줌 T
scatter <- ggplot(examData, aes(Anxiety, Exam))
scatter + 
  geom_point() + 
  geom_smooth(method = "lm", colour = "Red", se = F) + 
  labs(x = "Exam Anxiety", y = "Exam Performance %") 

#Simple scatter with regression line + coloured CI, alpha는 투명도 
scatter <- ggplot(examData, aes(Anxiety, Exam))
scatter + geom_point() + 
  geom_smooth(method = "lm", colour = "Red", alpha = 0.1, fill = "Red") + 
  labs(x = "Exam Anxiety", y = "Exam Performance %") 

festivalData <- read.delim("DownloadFestival.dat",  header = TRUE)
festivalHistogram<-ggplot(festivalData,aes(day1))
festivalHistogram+labs(legend.position="none")+
  geom_histogram(binwidth = 0.4)+
  labs(x="Hygiene(Day 1 of Festival", y="Frequency")

#1 outlier cased문에 그래프가 이상한걸 확인
festivalData %>% 
  arrange(-day1) ->festvalDara_a

festivalData2 = read.delim("DownloadFestival(No Outlier).dat",  header = TRUE)
ggplot(festivalData2, aes(day1))+
  geom_histogram(binwidth=0.4)+
  labs(x="Hygiene of Day 1", y="Frequency")

festivalDensity <- ggplot(festivalData2, aes(day1))
festivalDensity + geom_density() + 
  labs(x = "Hygiene (Day 1 of Festival)", y = "Density Estimate")

festivalDensity + geom_density(aes(fill = gender), alpha = 0.3) + 
  labs(x = "Hygiene (Day 1 of Festival)", y = "Density Estimate")

festivalBoxplot <- ggplot(festivalData, aes(gender, day1))
festivalBoxplot + geom_boxplot() + labs(x = "Gender", y = "Hygiene (Day 1 of Festival)")

festivalData2 = read.delim("DownloadFestival(No Outlier).dat",  header = TRUE)

ggplot(festivalData2, aes(gender, day1))+
  geom_boxplot() + 
  labs(x = "Gender", y = "Hygiene (Day 1 of Festival)")

chickFlick = read.delim("ChickFlick.dat",  header = TRUE)

ggplot(chickFlick, aes(film, arousal))+
  geom_point()+
  labs(x = "Film", y = "Arousal") 

ggplot(chickFlick, aes(film, arousal))+
  geom_boxplot()+
  labs(x = "Film", y = "Arousal")

ggplot(chickFlick, aes(film, arousal))+
  stat_summary(fun.y = mean, geom = "bar", fill = "white", colour = "Black")+
  geom_point()+
  labs(x = "Film", y = "Arousal") 

ggplot(chickFlick, aes(film, arousal, fill = gender ))+
  stat_summary(fun.y = mean, geom = "bar", position="dodge") +
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar", position=position_dodge(width=0.90), width = 0.2) + 
  labs(x = "Film", y = "Mean Arousal", fill = "Gender")
library(Hmisc)
