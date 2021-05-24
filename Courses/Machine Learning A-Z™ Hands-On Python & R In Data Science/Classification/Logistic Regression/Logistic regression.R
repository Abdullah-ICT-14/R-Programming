# Logistic Regression

# Importing the dataset
df= read.csv('Social_Network_Ads.csv')
df=df[,3:5]
df

# Splitting dataset into train and test set
# install package('caTools)
library('caTools')

set.seed(1234)
split=sample.split(df$Purchased,SplitRatio = 0.75)
training_set=subset(df,split==TRUE)
test_set=subset(df,split==FALSE)



# Feature Scaling
training_set[, 1:2]= scale(training_set[, 1:2])
test_set[, 1:2]= scale(test_set[,1:2])


# Fitting logistic regression model on the data set
lr=glm(formula =Purchased ~ .,
       family = binomial,
       data=training_set
       )


# Predicting the test set result

prob_pred=predict(lr,type = 'response',newdata = test_set[-3])
prob_pred

y_pred=ifelse(prob_pred>0.5 ,1,0)
y_pred


# Making the confusion matrix
cm=table(test_set[, 3],y_pred)
cm


