# Data Preprocessing

# Import dataset
data <- read.csv('Data.csv')


# Taking care of missing data
data$Age = ifelse(is.na(data$Age),
                  ave(data$Age,FUN = function(x) mean(x,na.rm = TRUE)),
                  data$Age)
data$Salary = ifelse(is.na(data$Salary),
                     ave(data$Salary,FUN = function(x) mean(x,na.rm=TRUE)),
                     data$Salary)


# Encoding Categorical variables
data$Country = factor(data$Country,
                      levels= c('France','Spain','Germany'),
                      labels= c(1,2,3))
data$Purchased = ifelse(data$Purchased=="Yes",1,0)


# Spliting dataset into train and test dataset
library("caTools")
set.seed(42)
split=sample.split(data$Purchased,SplitRatio = 0.8)
training_set = subset(data,split==TRUE)
test_set = subset(data,split !=TRUE)



# Feature scalling
training_set[,2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(test_set[,2:3])
