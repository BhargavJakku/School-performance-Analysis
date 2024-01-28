library(ggplot2)
library(tidyverse)
library(dplyr)
library(corrplot)
library(RColorBrewer)


data = read.csv('C:\\Users\\Buncy\\Desktop\\Sem_1\\AIT_580\\FinalProject\\SchoolReport.csv')
data

data = na.omit(data)


# Mean score of all districts.
dist_overall_grade = data %>% group_by(DISTRICT) %>% summarise_at(vars(OVERALL.SCORE),funs(mean(.,na.rm=TRUE))) %>%
  as.data.frame()
dist_overall_grade

ggplot(dist_overall_grade, aes(x = DISTRICT, y = OVERALL.SCORE))+
  geom_line( color="#69b3a2", size=1, alpha=0.9)+
  labs(subtitle = 'Mean score of all districts')

#Grade-wise overall score of all district.
ggplot(data, aes(x = DISTRICT, y = OVERALL.SCORE, color = OVERALL.GRADE)) +
  geom_boxplot() +
  geom_jitter(color = 'black', size = 0.3)+
  facet_wrap(vars(OVERALL.GRADE))+
  labs(subtitle = 'Grade-wise overall score of all district')

#correlation of all the grades 
data1 = data[,c(2,8,10,11,13,15,17)]
data1
corr = cor(data1)
corrplot(corr, type="upper", order="hclust",
         col=brewer.pal(n=8, name="RdYlBu"))

