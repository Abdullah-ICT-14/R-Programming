x<-c(10,20,30,40,NA,1)
x

# removing the NA value.
y<-na.omit(x)
y

mean(y)

mean(x,na.rm = TRUE)

c<-is.na(x)
c
