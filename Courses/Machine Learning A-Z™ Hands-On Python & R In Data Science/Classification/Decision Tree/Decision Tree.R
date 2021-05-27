# Decision Tree

# Importing the dataset
df= read.csv('Social_Network_Ads.csv')
df=df[,3:5]
df

# Encoding the target features as factors

df$Purchased=factor(df$Purchased,levels = c(0,1))

# Splitting dataset into train and test set
# install package('caTools)
library('caTools')

set.seed(1234)
split=sample.split(df$Purchased,SplitRatio = 0.75)
training_set=subset(df,split==TRUE)
test_set=subset(df,split==FALSE)



# Feature Scaling
training_set[-3]= scale(training_set[-3])
test_set[-3]= scale(test_set[-3])

# Fitting SVM model on the data set
library('rpart')
naive=rpart(formula = Purchased~ ., 
            data=training_set)
# Predicting the test set result

y_pred=predict(naive,newdata = test_set[-3],type = 'class')
y_pred


# Making the confusion matrix
cm=table(test_set[, 3],y_pred)
cm


