
# The ifelse() function is a simplified version of the if-else conditional statement
# It is applied to vectors.
# It takes three arguments ifelse(condion,action if true,action if false)

x<-c(6,9,10,5,20,7,16)
x

y<- ifelse(x%%2 == 0,x/2,x)
y

z <- ifelse(x<=10,x*5,x)
z
