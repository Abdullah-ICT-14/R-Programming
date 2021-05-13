## Decision Tree Regressor

# Importing the dataset
df= read.csv('Position_Salaries.csv')
df=df[2:3]
df


# install package('e1071')
library('rpart')

dtr = rpart(formula = Salary ~ .,
            data=df,
            control = rpart.control(minsplit = 1)
            )

# Predicting the result

y_pred=predict(dtr,data.frame(Level=6.5))
y_pred


library(ggplot2)

ggplot()+
  geom_point(aes(x=df$Level,y=df$Salary),color='red') +
  geom_line(aes(x=df$Level,y=predict(dtr,newdata=df)),color='blue') +
  ggtitle('Decision Tree Regression')+
  xlab('Level')+
  ylab('Salary')


