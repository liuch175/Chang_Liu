#Chang Liu
#IST 719 Poster
#2022/4/29

#Install packages
#install.packages('tidyverse')
#install.packages('scales')
#install.packages('wordcloud')
#install.packages('ggpubr')

#Library packages
library(ggpubr)
library(wordcloud)
library(scales)
library(mapproj)
library(ggplot2)
library(tidyverse)
library(maps)
library(RColorBrewer)
library(ggthemes)
library(dtplyr)
library(treemapify)


#import dataset
setwd("\\\\hd.ad.syr.edu/02/63753d/Documents/IST719/poster")
covid <- read.csv("COVID-19 Coronavirus.csv",header = TRUE, stringsAsFactors = FALSE)

colnames(covid)[which(names(covid)=="Country")] <- "region"
colnames(covid)[which(names(covid)=="ISO.3166.1.alpha.3.CODE")] <- "Country.Code"
colnames(covid)[which(names(covid)=="TotÂ.Cases..1M.pop")] <- "Total.Cases/Millian.Pop"
colnames(covid)[which(names(covid)=="TotÂ.Deaths.1M.pop")] <- "Total.Deaths/Millian.Pop"

# Add a column we need (Case percentage)
covid$Case.percentage <- covid$Total.Cases/covid$Population
na.omit(covid)
covid$Case.percentage <- as.numeric(covid$Case.percentage)






#Word Cloud
covid5 <- covid                          # Replicate original data
covid5$region <- factor(covid4$region,                               
                        levels = covid5$region[order(covid5$Total.Deaths, decreasing = TRUE)])
wordcloud(covid5$region, covid5$Total.Deaths
          , scale = c(3.5,0.3)
          , min.freq = 1
          , max.words = Inf)

#Two Box plot
par(mfrow = c(1,2))
d<- boxplot(covid5$Death.percentage, xlab ='Death.percantage',ylab = 'Freguency')
c<- boxplot(covid5$Case.percentage, xlab = 'Case.percantage',ylab = 'Freguency')


#world map
world<- map_data("world")

covid2 <- left_join(map_data('world'),covid,by='region')
ggplot(covid2,aes(long,lat,group = group))+
  geom_polygon(aes(fill=Case.percentage),color = 'black')+
  scale_fill_gradientn(colors = brewer.pal(8,"Oranges")
                       ,na.value='azure2')+
  xlab("")+ylab("")+
  theme(legend.position = "right",
        axis.text=element_blank(),
        axis.ticks=element_blank(),
        panel.background=element_blank())+
  ggtitle("Mass Shootings in the US")


#tree map
p.tree <-  ggplot(covid)+
  aes(area = Total.Cases, fill = Continent, subgroup = Continent)+
  geom_treemap()+
  geom_treemap_subgroup_text(color = 'white')+
  geom_treemap_text(aes(label = region), color = 'black')+
  scale_fill_manual(values = brewer.pal(6,"Set3"))+
  guides(fill = FALSE)

p.tree


#pie chart
covid3 <- aggregate(covid$Total.Deaths, list(continent = covid$Continent), sum)
pie(covid3$x, labels = covid3$continent
    ,las = 2, main = "Total death by continent")+
  scale_fill_brewer(brewer.pal(6,"Set3"))+
  theme_minimal()















