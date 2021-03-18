
# In order to create a matrix these vectors muust have the same length.
x <- c(10,11,12,13)
x

y<-c(20,30,40,50)
y

# if we use rbind() vectors our vectors will be rows

z<-rbind(x,y)
z

# if we use cbind vectors our vectors will be columns

z<-cbind(x,y)
z

