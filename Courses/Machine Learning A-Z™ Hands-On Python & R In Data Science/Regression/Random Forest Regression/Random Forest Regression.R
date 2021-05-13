## Decision Tree Regressor

# Importing the dataset
df= read.csv('Position_Salaries.csv')
df=df[2:3]
df


# install package('e1071')
library('randomForest')

set.seed(1234)
rfr = randomForest(x=df[1],
            y=df$Salary,
            ntree = 10)

# Predicting the result

y_pred=predict(rfr,data.frame(Level=6.5))
y_pred


library(ggplot2)

ggplot()+
  geom_point(aes(x=df$Level,y=df$Salary),color='red') +
  geom_line(aes(x=df$Level,y=predict(rfr,newdata=df)),color='blue') +
  ggtitle('Decision Tree Regression')+
  xlab('Level')+
  ylab('Salary')


