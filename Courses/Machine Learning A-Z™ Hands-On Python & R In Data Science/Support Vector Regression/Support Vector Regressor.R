# SVR

# Importing the dataset
df= read.csv('Position_Salaries.csv')
df=df[2:3]
df


# install package('e1071')
library('e1071')
regressor=svm(formula = Salary ~ .,
              
              data=df,
              type='eps-regression'
              
              )


# Predicting the result

y_pred=predict(regressor,data.frame(Level=6.5))
y_pred


## Visualize the SVR results

library(ggplot2)

ggplot()+
  geom_point(aes(x=df$Level,y=df$Salary),color='red') +
  geom_line(aes(x=df$Level,y=predict(regressor,newdata=df)),color='blue') +
              ggtitle('Support Vector Regressor')+
              xlab('Level')+
              ylab('Salary')










