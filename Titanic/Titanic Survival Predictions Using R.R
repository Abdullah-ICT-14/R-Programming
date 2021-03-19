
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
