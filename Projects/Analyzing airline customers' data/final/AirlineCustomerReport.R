################################################
# Intro to data science, Standard Homework Heading
#
# Student name:ZIJUN YI
#              CHANG LIU 
#              DONG WANG
#              NAIQIU ZHAN
#
# 
#
dev.off()                                                                       # Clear the graph window
cat('\014')                                                                     # Clear the console
rm(list=ls())                                                                   # Clear user objects from the environment

# Library
library(jsonlite);library(usmap);library(tidyverse);
library(ggplot2);library(arules);library(arulesViz);
library(MASS);library(kernlab);library(ggthemes);
library(scales);library(caret);


# Transfer source data (json) into data frame
source.json <- fromJSON('airsurvey.json')                                       #Transfer source data (json) into data frame
factor.df <- as.data.frame(source.json,stringsAsFactors = TRUE)
source.df <- as.data.frame(source.json)
clean.factor.Data <- factor.df[complete.cases(factor.df), ]                     # clean the source data by eliminating all the rows contains NA
clean.Data<-source.df[complete.cases(source.df), ]


# Satisfaction with type of travel
TravelType <- clean.Data$Type.of.Travel
box_Sat_Travel <- ggplot(clean.Data, aes(x=TravelType, y= as.numeric(Likelihood.to.recommend))) +
  geom_boxplot(aes(color = TravelType)) + ggtitle("Satisfaction with Type of Travel")+
  ylab("Likelihood.to.recommend") +xlab("type of travel")
box_Sat_Travel

# Satisfaction with Class
box_Class <- ggplot(clean.Data, aes(x=Class, y=Likelihood.to.recommend)) + 
  geom_boxplot(aes(color = boxclass)) + ggtitle("Satisfaction with Class") + 
  ylab("satisifaction") + xlab("Class")
box_Class

# Histograms of age
Hist_Age <- ggplot(clean.Data, aes(x = Age)) + 
  geom_histogram(fill="white", color="black") + 
  ggtitle("Histogram of Age") + scale_color_brewer(palette="Accent") + 
  theme_minimal()+theme(legend.position="top")
Hist_Age

# Histogram of Satisfaction
Hist_SoutheastSat <- ggplot(clean.Data, aes(x = Likelihood.to.recommend)) + 
  geom_histogram(aes(y=..density..),binwidth = 1,colour="black", fill="white") + 
  geom_density(alpha=.2, fill="#FF6666") +
  ggtitle("Histogram of Satisfaction")+ scale_color_brewer(palette="Accent") + 
  theme_minimal()+theme(legend.position="top")
Hist_SoutheastSat


# Gender Pie Chart
gender.title <- c("Male","Female")
gender.count <- c(length(which(clean.Data$Gender == "Male")),
         length(which(clean.Data$Gender == "Female")))
gender.count <- gender.count/sum(gender.count)
gender.matrix <- data.frame(gender.title, gender.count)
gender.pie <- ggplot(gender.matrix,aes(x="", y= gender.count, fill= gender.title)) +
  geom_col() +
  geom_text(aes(x=1.3,y = gender.count, 
                label = percent(gender.count)), position = position_stack(vjust = 0.5), size=5) +
  coord_polar("y") +
  labs(title = "Pie Chart of Gender",
       fill = "Gender")  + theme_void()
gender.pie



## Pie chart of type of travel
pie.Business<-length(which(clean.Data$Type.of.Travel == "Business travel"))
pie.Mileage<-length(which(clean.Data$Type.of.Travel == "Mileage tickets"))
pie.Travel<-length(which(clean.Data$Type.of.Travel == "Personal Travel"))
pie.TypeCount <- c(pie.Business,pie.Mileage,pie.Travel)
pie.TypePercent<-pie.TypeCount/sum(pie.TypeCount)

pie.TypeofTravel <- c("Business Travel","Mileage Tickets","Personal Travel")
pie.tot.df <- data.frame(pie.TypeofTravel,pie.TypePercent)

Pie.tot <- ggplot(pie.tot.df,aes(x="", y=pie.TypePercent, fill=pie.TypeofTravel)) +
  geom_col() +
  coord_polar("y") + 
  geom_text(aes(x=1.3,y = pie.TypePercent,label = percent(pie.TypePercent)), 
            position = position_stack(vjust = 0.5), size=5) + 
  labs(title = "Pie Chart of Type of Travel",
       fill = "Travel Type") + theme_void()
Pie.tot

# Histograms of age and gender
Hist_Age <- ggplot(clean.Data, aes(x = Age,fill = Gender)) + 
  geom_histogram(alpha=0.4, position="identity") + 
  ggtitle("Histogram of Age and Gender") + scale_color_brewer(palette="Dark2") + 
  theme_minimal() + theme(legend.position="top")
Hist_Age

# Linear Regression
lmData <- clean.Data[,-24]                                                      #Remove Flight.cancelled column
lmData <- lmData                                                           

# Model 1 : Observe the relationship between Likelihood.to.recommend and all the rest of variables
lmOut_v1 <- lm(formula = Likelihood.to.recommend~.,data = lmData)
summary(lmOut_v1)                                                               # Display model 1 result

# Model 2: Observe the relationship between Likelihood.to.recommend and all the rest of variables after removing 
# all geographical variables
lmOut_v2<-lm(formula = Likelihood.to.recommend ~ lmData$Age
             +lmData$Gender
             +lmData$Price.Sensitivity
             +lmData$Airline.Status
             +lmData$Type.of.Travel
             +lmData$Flights.Per.Year
             +lmData$Loyalty
             +lmData$Total.Freq.Flyer.Accts
             +lmData$Shopping.Amount.at.Airport
             +lmData$Eating.and.Drinking.at.Airport
             +lmData$Class
             +lmData$Arrival.Delay.in.Minutes
             +lmData$Departure.Delay.in.Minutes
             +lmData$Flight.time.in.minutes
             +lmData$Scheduled.Departure.Hour
             +lmData$Flight.Distance,
             data = lmData)
summary(lmOut_v2)                                                               # Display model 2 result

#Model 3: Observe the relationship between Likelihood.to.recommend and all the rest of variables
#         by removing all the variables have p-Values greater than 0.05
#     EXCLUDED:
#            +lmData$Flights.Per.Year
#            +lmData$Loyalty
#            +lmData$Shopping.Amount.at.Airport
#            +lmData$Eating.and.Drinking.at.Airport
#            +lmData$Departure.Delay.in.Minutes
#            +lmData$Flight.time.in.minutes
#            +lmData$Year.of.First.Flight
#            +lmData$Day.of.Month
#            +lmData$Flight.date
#            +lmData$Scheduled.Departure.Hour
#            +lmData$Flight.Distance
lmOut_v3<-lm(formula = Likelihood.to.recommend ~ lmData$Age
             +lmData$Gender
             +lmData$Price.Sensitivity
             +lmData$Airline.Status
             +lmData$Type.of.Travel
             +lmData$Total.Freq.Flyer.Accts
             +lmData$Class
             +lmData$Arrival.Delay.in.Minutes
             ,data = lmData)
summary(lmOut_v3)                                                               # Display Model 3 result   


# Model 4 & Model 5 will only focus on personal travel customer
lmPersonalTrav <- subset(lmData,lmData$Type.of.Travel=="Personal Travel")       # Subset a new data frame only contains personal travel
lmPersonalTrav <- lmPersonalTrav[,-10]                                            # Remove Type.of.Travel column

#Model 4: Observe the relationship between Likelihood.to.recommend and all the rest of variables
#         based on Model 2
lmOut_V4<-lm(formula = Likelihood.to.recommend ~ lmPersonalTrav$Airline.Status
             +lmPersonalTrav$Age
             +lmPersonalTrav$Gender
             +lmPersonalTrav$Price.Sensitivity
             +lmPersonalTrav$Flights.Per.Year
             +lmPersonalTrav$Loyalty
             +lmPersonalTrav$Total.Freq.Flyer.Accts
             +lmPersonalTrav$Shopping.Amount.at.Airport
             +lmPersonalTrav$Eating.and.Drinking.at.Airport
             +lmPersonalTrav$Class
             +lmPersonalTrav$Departure.Delay.in.Minutes
             +lmPersonalTrav$Arrival.Delay.in.Minutes
             +lmPersonalTrav$Flight.time.in.minutes
             +lmPersonalTrav$Flight.Distance
             ,data = lmPersonalTrav)
summary(lmOut_V4)                                                               # Display model 4 result

#Model 5: Observe the relationship between Likelihood.to.recommend and all the rest of variables
#         by removing all the variables have p-Values greater than 0.05
#     EXCLUDED:
#            +lmPersonalTrav$Flights.Per.Year
#            +lmPersonalTrav$Loyalty
#            +lmPersonalTrav$Total.Freq.Flyer.Accts
#            +lmPersonalTrav$Shopping.Amount.at.Airport
#            +lmPersonalTrav$Eating.and.Drinking.at.Airport
#            +lmPersonalTrav$Class
#            +lmPersonalTrav$Departure.Delay.in.Minutes
lmOut_V5<-lm(formula = Likelihood.to.recommend ~ lmPersonalTrav$Airline.Status
             +lmPersonalTrav$Age
             +lmPersonalTrav$Gender
             +lmPersonalTrav$Price.Sensitivity
             +lmPersonalTrav$Arrival.Delay.in.Minutes
             +lmPersonalTrav$Flight.time.in.minutes
             +lmPersonalTrav$Flight.Distance
             ,data = lmPersonalTrav)
summary(lmOut_V5)                                                               # Display 

# Check personal travel customer who has silver card to make sure recommendation is convincable
lm.silver.customer <- subset(lmPersonalTrav,lmPersonalTrav$Airline.Status=="Silver")# Store the personal travel customer who has silver card
dim(lm.silver.customer)                                                         # Display the number of personal travel customer 
                                                                                # who has silver card

# Data Frame to Transaction
ap.data <- clean.factor.Data
ap.data$ltr.dummy <-  ap.data$Likelihood.to.recommend
ap.data <- ap.data %>%
  mutate(ltr.dummy = case_when( ltr.dummy > 8  ~ 'High',
                                ltr.dummy >= 6 ~ 'Mid',
                                ltr.dummy < 6 ~ 'Low'))                         
ap.data$ltr.dummy <- as.factor(ap.data$ltr.dummy )
ap.data <- ap.data[,which(sapply(ap.data, class) == "factor")]
ap.clean.data <- ap.data[,-12]

# Apriori
trans.Data <- as(ap.clean.data,"transactions")
freq.data <- itemFrequency(trans.Data)
freq.data <- sort(freq.data)
head(freq.data)

rule <- apriori(ap.clean.data,
                parameter=list(supp=0.01, conf=0.5),
                control=list(verbose=F),
                appearance=list(default="lhs",rhs=("ltr.dummy=Low")))
rule <- sort (rule, by="confidence", decreasing=TRUE)
inspect(head(rule))

rule2 <- apriori(ap.clean.data,
                 parameter=list(supp=0.05, conf=0.5),
                 control=list(verbose=F),
                 appearance=list(default="lhs",rhs=("ltr.dummy=Low")))
inspect(head(rule))

rule3 <- apriori(ap.clean.data,
                 parameter=list(supp=0.03, conf=0.5),
                 control=list(verbose=F),
                 appearance=list(default="lhs",rhs=("ltr.dummy=High")))
rule3 <- sort (rule3, by="confidence", decreasing=TRUE)
inspect(head(rule3))

rule4 <- apriori(ap.clean.data,
                 parameter=list(supp=0.08, conf=0.5),
                 control=list(verbose=F),
                 appearance=list(default="lhs",rhs=("ltr.dummy=High")))
inspect(head(rule4))



# US Origin City Average Recommendation Score
mean.ltr.mapdata <- clean.Data                             %>% 
  filter(olong < -68)                                      %>%                  # taking out the flight that go to protorico
  group_by(olong,olat,Orgin.City)                          %>% 
  summarise(mean.ltr = mean(Likelihood.to.recommend),
            count = n())

mean.ltr.mapdata.transformed <- usmap_transform(mean.ltr.mapdata)               # this might require you to install a dependency

#us map with average and frequency
usmap::plot_usmap("states", labels = TRUE) +
  geom_point(data = mean.ltr.mapdata.transformed, 
             aes(x = olong.1, y = olat.1, 
                 colour = mean.ltr, size = count ), alpha = 0.7) +
  scale_size_continuous(range = c(3, 14), label = scales::comma) +
  labs(title = "US Origin City Average Recommendation Score",
       size = "Counts", color = "Recommendation Score") + scale_color_gradient(low = "darkblue", high = "orange")

mean.state.mapdata <- clean.Data                           %>% 
  filter(olong < -68)                                      %>%                  
  group_by(Origin.State)                                   %>% 
  summarise(mean.ltr = mean(Likelihood.to.recommend),
            count = n())                                   %>%
  rename(state = Origin.State)

usmap::plot_usmap(data = mean.state.mapdata, values = "mean.ltr", labels = TRUE) +
  labs(title = "US Origin City Average Recommendation Score") 

# svm
svm.Data <- clean.Data %>%
  mutate(svm.Likey = case_when( Likelihood.to.recommend > 8  ~ 'High',          # covering to factor and dropping empty factor
                                Likelihood.to.recommend >= 6 ~ 'Mid',
                                Likelihood.to.recommend < 6 ~ 'Low'))
svm.Data$svm.Likey <- as.factor(svm.Data$svm.Likey )

svm.Data$Likey <- as.factor(svm.Data$svm.Likey)
svm.clean.Data <- svm.Data[,-24]
svm.clean.Data<- svm.clean.Data[,-(1:2)]                                        # filtering number columns
svm.clean.Data<- svm.clean.Data[,-(15:18)]
svm.clean.Data<- svm.clean.Data[,-(21:24)]
svm.clean.Data<- svm.clean.Data[,-(13:14)]
svm.clean.Data<- svm.clean.Data[,-5]

svm.randIndex <- sample(1:dim(svm.clean.Data)[1])
svm.cutPoint2_3 <- floor(2*dim(svm.clean.Data)[1]/3)

trainData <- svm.clean.Data[svm.randIndex[1:svm.cutPoint2_3],]
testData <- svm.clean.Data[svm.randIndex[(svm.cutPoint2_3+1):dim(svm.clean.Data)[1]],]
svmOutput <- ksvm(svm.Likey ~., data=trainData, kernel = "rbfdot", kpar = "automatic", 
                  C=5, cross = 3, prob.model=TRUE)
svmOutput

svm.y_hat <- predict(svmOutput, testData)
svm.m <- table(testData$Likey,svm.y_hat)                                        # output the model result compare to the ground truth

sum(diag(svm.m))/sum(svm.m)                                                     # Error Rate

confusionMatrix(svm.y_hat,testData$Likey)                                       # seeing the accuracy

