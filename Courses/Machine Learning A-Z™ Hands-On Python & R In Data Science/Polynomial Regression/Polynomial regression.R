# Polynomial regression

# Importing the dataset
df= read.csv('Position_Salaries.csv')
df=df[2:3]

# Fitting the linear regression model
lr=lm(formula = Salary ~ .,data = df)
lr

# Fitting the linear regression model

df$Level2 = df$Level^2
df$Level3 = df$Level^3 # for higher degree polynomial
df$Level4 = df$Level^4
pr=lm(formula = Salary ~ ., data = df)
summary(pr)


# Visualizing the linear regression model
library(ggplot2)
ggplot() + 
  geom_point(aes(x=df$Level,y=df$Salary),
             color='blue') + 
  geom_line(aes(x=df$Level,y=predict(lr,newdata = df)),
            color='red') +
  ggtitle("Truth or Bluff (Linear Regression)") +
  xlab("Level") + 
  ylab("Salary")



# Visualizing the Polynomial regression model
ggplot() + 
  geom_point(aes(x=df$Level,y=df$Salary),
             color='blue') + 
  geom_line(aes(x=df$Level,y=predict(pr,newdata = df)),
            color='red') +
  ggtitle("Truth or Bluff (Polynomial Regression)") +
  xlab("Level") + 
  ylab("Salary")

# Predicting the result with Polynomial regression
y_pred =predict(pr,newdata = df)
y_pred
