# Data Extraction
library(dplyr)

#Set the working directory
setwd('C:/Users/Reena/Desktop/Project in R')

d=read.csv('Weather 2021-March 2022.csv')

#Dimension of the dataset
dim(d)

#Structure of the dataset
str(d)

#Displays the first six records
head(d)

#Displays the last 6 records
tail(d)

#Columns of the Dataset
colnames(d)

# Five sample values
sample_n(d,5)

# Length of the dataset
length(d)

#Data Cleansing

#Check null values
table(is.na(d))

#Null values in each column
summary(d)

#Check duplicated values
table(duplicated(d))

#Convert to upper case
d$District=toupper(d$District)#Convert to upper case
d$District=toupper(d$District)

#Convert to lower case
d$Mandal=tolower(d$Mandal)
head(d)

# Data Transformation

# Rename the columns
d=rename(d,"Rain_mm"="Rain..mm.",
         "Min_Temp_C"="Min.Temp...C.",
         "Max_Temp_C"="Max.Temp...C.",
         "Min_Humidity_percent"="Min.Humidity....",
         "Max_Humidity_percent"="Max.Humidity....",
         "Min_Wind_Speed_Kmph"="Min.Wind.Speed..Kmph.",
         "Max_Wind_Speed_Kmph"="Max.Wind.Speed..Kmph.")
head(d)

#Change the data type
#d=type.convert(d) #Automatic conversion
str(d)

#Change the data type
d$District=as.character(d$District)
d$Mandal=as.character(d$Mandal)
d$Date=as.Date(d$Date,'%d-%b-%y')
d$Year=as.numeric(format(d$Date,'%Y'))
d$Month=as.numeric(format(d$Date,'%m'))

str(d)

#Sort the Data
d=arrange(d,District)

# Data Wrangling

#District Wise Max Temperature in C, Max Rain in mm, Max Humidity in %, Max Wind in kmph (Jan 2021 - March 2022)
districtwise=d %>% group_by(District) %>% summarise(Maxtemp=max(Max_Temp_C),Maxrain=max(Rain_mm),Maxhumid=max(Max_Humidity_percent),MaxWind_Kmph=max(Max_Wind_Speed_Kmph,na.rm=TRUE)) %>% arrange(desc(Maxtemp))
districtwise

# District Wise Min Temperature in C, Min Rain in mm, Min Humidity in %, Min Wind in kmph (Jan 2021 - March 2022)
districtwise1=d %>% group_by(District) %>% summarise(Mintemp=min(Min_Temp_C),Minrain=min(Rain_mm),Minhumid=min(Min_Humidity_percent),MinWind_Kmph=min(Min_Wind_Speed_Kmph,na.rm=TRUE)) %>% arrange(Mintemp)
districtwise1


library('sqldf')
#Monthly Wise Max Temperature in C
print(sqldf('SELECT Month, District, Date, Max_Temp_C FROM d GROUP BY month HAVING max(Max_Temp_C)'))

#Monthly Wise Max Rain in mm
print(sqldf('SELECT Month, District, Date, Rain_mm FROM d GROUP BY month HAVING max(Rain_mm)'))

#Monthly Wise Max Wind in kmph
print(sqldf('SELECT Month, District, Date, Max_Wind_Speed_Kmph FROM d GROUP BY month HAVING max(Max_Wind_Speed_Kmph)'))

#District wise Average Max Temperatures in C from Jan 2021-March 2022
print(sqldf('SELECT District, Max_Temp_C Average_Max_Temp FROM d GROUP BY District HAVING avg(Max_Temp_C)'))

#Max Temp from Jan 2021-March 2022
Maxtemp=subset(d,Max_Temp_C==max(Max_Temp_C))
select(Maxtemp,District,Mandal,Date,Max_Temp_C,Year,Month)

#Min Temp from Jan 2021-March 2022
Mintemp=subset(d,Min_Temp_C==min(Min_Temp_C))
select(Mintemp,District,Mandal,Date,Min_Temp_C,Year,Month)

#Max Rainfall from Jan 2021-March 2022
MaxRain=subset(d,Rain_mm ==max(Rain_mm ))
select(MaxRain,District,Mandal,Date,Rain_mm,Year,Month)

#Min Rainfall except 0 from Jan 2021-March 2022
Rainfall=subset(d,Rain_mm>0)
MinRain1=subset(Rainfall,Rain_mm==min(Rain_mm))
head(select(MinRain1,District,Mandal,Date,Rain_mm,Year,Month),20)

#Descriptive Statistics
summary(d)

#Mean 
mean(d$Rain_mm)

#Median
median(d$Max_Temp_C)

#Quantile
print(quantile(d$Max_Temp_C))
print(quantile(d$Min_Temp_C))

Rainfall=subset(d,Rain_mm>0)
print(quantile(Rainfall$Rain_mm))

#Variance
var(d$Rain_mm)
var(d$Max_Temp_C)
var(d$Min_Temp_C)

#Correlation
cor(d$Rain_mm,d$Max_Temp_C,method='pearson')
cor(d$Rain_mm,d$Min_Temp_C,method='pearson')
cor(d$Rain_mm,d$Max_Temp_C,method='spearman')

#Standard Deviation
sd(d$Rain_mm)

#Covariance
cov(d$Rain_mm,d$Max_Temp_C)

#Inter Quartile Range
IQR(d$Max_Temp_C)

#T-Test
t.test(d$Rain_mm,d$Max_Temp_C)

#Data Visualization
library('ggplot2')
library('choroplethr')
library('choroplethrMaps')

#District wise-Max Rain
Maxrain_plot=ggplot(data=districtwise,aes(x=District,y=Maxrain,fill=District))+geom_bar(stat='identity')+ggtitle('District wise-Max Rain')+ theme(axis.text.x = element_text(angle = 90))
Maxrain_plot

#District wise-Max Temp
Maxtemp_plot=ggplot(data=districtwise,aes(x=District,y=Maxtemp,fill=District))+geom_bar(stat='identity')+ theme(axis.text.x = element_text(angle = 90))+ggtitle('District wise-Max Temp')
Maxtemp_plot

#Monthly wise-Max Temp
Monthly=d %>% group_by(Month) %>% summarise(Maxtemp=max(Max_Temp_C,na.rm=TRUE))
ggplot(data=Monthly,aes(x=Month,y=Maxtemp,fill=Month))+geom_bar(stat='identity')+ggtitle('Monthly wise-Max Temp')

#District wise-Average Rain
Avg_rain=d %>% group_by(District) %>% summarise(Avgrain=max(Rain_mm,na.rm=TRUE))
ggplot(data=Avg_rain,aes(x=District,y=Avgrain,fill=District))+geom_bar(stat='identity')+ theme(axis.text.x = element_text(angle = 90))+ggtitle('District wise-Average Rain')
