
# a vector is a sequence of elements of same type: numeric,character or logical
# The elements of vectors are called components.

# Create a vector using c() function.

x <- c(1,2,3,4) # numeric vector
x
class(x)
typeof(x)

char_vector <-c('A','B','C') # character vector
char_vector
class(char_vector)

log_vector <- c(TRUE,FALSE,TRUE)
log_vector
class(log_vector)
typeof(log_vector)


# If we write a vector with a diffierent values such as number,character or logical
#then the vector will converted to string.

mixed_vector <- c(1,2,'a','b',TRUE,FALSE)
mixed_vector
class(mixed_vector)
typeof(mixed_vector)


# To find the vector length length() function is used.
length(mixed_vector)


# Adding a new element to vector
x<-c(x,100)
x


# If we nest two or more c() function result will be only one vector
y<-c(1,2,3,c(100,200,300))
y
