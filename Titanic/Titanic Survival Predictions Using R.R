# This program predict the survival in the Titanic Disaster Using Decision Trees.
# Decision Trees are powerfull tools in Machine learning

# Importing the necessary library
library(rpart) # Loading Decision Tree Package
library(plyr) # means
library(dplyr) # data cleaning
library(stringr) # data cleaning
library(naniar)  # missing data visualizations
library(ggplot2) # Data visualization
library(readr) # CSV file I/o, e.g. the read_csv function.
library(rattle) # Visualize Decision trees
library(rpart.plot) # visualize decision trees.
library(caret) # model tunning
library(caTools) # cross validation
library(pROC) # ROC curves
library(RColorBrewer) 
library(Hmisc)
library(kableExtra) # markdown tables

# Loading our train and test dataset.
train <- read.csv("train.csv")
test <- read.csv("test.csv")

# Check the data
str(train)
str(test)


# a quick look at train and test data.
View(train)
View(test)


# Preprocess Data.

# Create survived column in test set
test$Survived <- NA
View(test)

# Bind test and train data to create new variables in both sets
df <- rbind(train, test)
View(df)
dim(df)
str(df)

# Here Ticket and PassengerId column is not so much important so i can delete these columns.
# Droping the ticket and PassengerId columns
df1 <- df[c(-1,-9)]
View(df1)
summary(df1)

summary(train)

# Visualization
qplot(factor(Pclass), data=train, geom="bar", fill=factor(Survived))

qplot(factor(Sex), data=train, geom="bar", fill=factor(Survived))

ggplot(data=train, aes(x=Age, fill=Survived)) + geom_density(alpha=1)

qplot(factor(SibSp), data=train, geom="bar", fill=factor(Survived))

qplot(factor(Parch), data=train, geom="bar", fill=factor(Survived))

qplot(factor(Fare), data=train, geom="bar", fill=factor(Survived))

qplot(factor(Embarked), data=train, geom="bar", fill=factor(Survived))




# checking NA value
summary(is.na(df1))
view(df1)

#There were quite a few missing values that I dealt with in the following section.
#First, I imputed the missing values in Embarked with the mode, ‘S’

table(df1$Embarked)

# there are two missing value in Embarked columns.
# From the table i saw that in Embarked column 'S' is 914 times
# which is greater than 'C'=270 and 'Q'=123.
# so i handle these missing value with 'S'.

df1$Embarked[is.na(df1$Embarked)] <- 'S'
## Check if it worked
which(is.na(df1$Embarked))


# Next, I imputed the median Fare for that particular Pclass
#using the ave() function for the missing values in df1$Fare

df1$Fare[is.na(df1$Fare)] <- with(df1,ave(Fare,Pclass,FUN = function(x) median(x,na.rm = TRUE)))[is.na(df1$Fare)]
## Check if it worked 
which(is.na(df1$Fare))


#efore imputing missing values on the Age column, 
#I decided to do some feature engineering.
# I first created a variable called Title I extracted from the Name column

df1$Title <- NA
df1$Title <- str_sub(df1$Name,str_locate(df1$Name,',')[,1]+2,str_locate(df1$Name,'\\.')[,1]-1)
which(is.na(df1$Title))
table(df1$Title)

# Convert to factor
df1$Title<-factor(df1$Title)


#I created a simple column called FamilySize,
#This column is constructred by adding together the SibSp and Parch traveling with a person,
#plus one (for themselves) to equal total family size on board.
#Then, I discretized FamilySize and created 3 levels of family size: “self”, “small”, and “large”.

df1$FamilySize <- df1$SibSp + df1$Parch + 1

df1$relFamilySize <- NA
df1$relFamilySize <- ifelse(df1$FamilySize == 1, "self", 
                            ifelse(df1$FamilySize <= 4, "small", "large")) 
df1$relFamilySize <- factor(df1$relFamilySize)
## Check if it worked
table(df1$relFamilySize)
view(df1)
which(is.na(df1$relFamilySize))


#Convert categorical values to numericalvalues of 'Embarked','Tittle' and 'Sex' columns.
df1$Embarked <- ifelse(df1$Embarked=='S', 0,
                       ifelse(df1$Embarked=='C',1,2))

df1$Title <-ifelse(df1$Title=='Mr', 0,
                   ifelse(df1$Title=='Miss',1,
                          ifelse(df1$Title=='Mrs',2,
                                 ifelse(df1$Title=='Master',3,4))))
# Remove Name column
df1<- df1[-3]

df1$Sex <- ifelse(df1$Sex=='male',0,1)
view(df1)

#  I returned to Age and its missing values. I used the corrgram package to construct a correlogram
#to visualize which numeric variables are most correlated to Age

table(is.na(df1$Age))


# Handling missing value of 'Age columns

cor.test(df1$Age,df1$Pclass)
cor.test(df1$Age,df1$Sex)
cor.test(df1$Age,df1$Fare)
cor.test(df1$Age,df1$SibSp)
cor.test(df1$Age,df1$Parch)
cor.test(df1$Age,df1$Title)

df1$Age[is.na(df1$Age)] <- with(df1, ave(Age, Pclass, Title, 
                                         FUN = function(x) median(x, na.rm=TRUE)))[is.na(df1$Age)]
## Check if it worked 
summary(df1$Age)
which(is.na(df1$Age))


## For some reason, we have a NA for Age at row 980. Let's give it the median value.

require(dplyr)
tbl <- df1 %>% group_by(Pclass) %>% summarise(median(Age, na.rm=TRUE))
df1$Age[980] <- tbl[3,2]

## Convert to numeric
df1$Age <- as.numeric(df1$Age)
which(is.na(df1$Age))


# Working with Cabin column

table(is.na(df1$Cabin))
df1$CabinL <- NA
df1$CabinL <- factor(substr(df1$Cabin, start=1, stop=1))

## Check if it worked
table(df1$CabinL)
df1$CabinFloor <- NA
df1$CabinFloor <- ifelse(df1$CabinL=="A", 1, 
                         ifelse(df1$CabinL=="B", 2, 
                                ifelse(df1$CabinL=="C", 3, 
                                       ifelse(df1$CabinL=="D", 4, 
                                              ifelse(df1$CabinL=="E", 5,
                                                     ifelse(df1$CabinL=="F", 6, 
                                                            ifelse(df1$CabinL=="G", 7, 
                                                                   ifelse(df1$CabinL=="T", 0, NA))))))))
df1$CabinFloor <- as.integer(df1$CabinFloor)
view(df1)

cor.test(df1$CabinFloor,df1$Pclass)

cor.test(df1$CabinFloor,df1$Age)

cor.test(df1$CabinFloor,df1$Sex)

cor.test(df1$CabinFloor,df1$SibSp)

cor.test(df1$CabinFloor,df1$Fare)


# From all of that we show that CabinFloor has positive relation with Pclass.
df1$CabinFloor[is.na(df1$CabinFloor)] <- with(df1, ave(CabinFloor, Pclass,
                                                       FUN = function(x) mean(x, na.rm=TRUE)))[is.na(df1$CabinFloor)]

## Check if it worked
summary(df1$CabinFloor)
which(is.na(df1$CabinFloor))

# Droping the unnecessary columns.
view(df1)
df1<-df1[c(-8,-12,-13)]
view(df1)


#Split the data

train <- df1[1:891,]
view(train)

test<- df1[892:1309,]
view(test)

target<- df1[1]
view(target)

# visualise the train data
library(ggplot2)
qplot(factor(Pclass), data=train, geom="bar", fill=factor(Survived))
qplot(factor(Sex), data=train, geom="bar", fill=factor(Survived))
qplot(factor(Age), data=train, geom="density", fill=factor(Survived))
qplot(factor(SibSp), data=train, geom="bar", fill=factor(Survived))
qplot(factor(Parch), data=train, geom="bar", fill=factor(Survived))
qplot(factor(Fare), data=train, geom="bar", fill=factor(Survived))
qplot(factor(Embarked), data=train, geom="bar", fill=factor(Survived))
qplot(factor(Title), data=train, geom="bar", fill=factor(Survived))
qplot(factor(FamilySize), data=train, geom="bar", fill=factor(Survived))
qplot(factor(CabinFloor), data=train, geom="bar", fill=factor(Survived))
qplot(Pclass,Age,colour=Survived,data=train, na.rm=TRUE)+geom_smooth(method='lm',formula=y~x)


# Build the model
fit <- rpart(Survived~., data =train, method = 'class')
rpart.plot(fit)


# predict the model

fit.survived.predicted <- predict(fit, data=test, type = 'class')
print(fit.survived.predicted)

# Confusion matrix for evaluating the model
library(e1071)
confusionMatrix(fit.survived.predicted,factor(train$Survived))
