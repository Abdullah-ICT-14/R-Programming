
# a vector is a sequence of elements of same type: numeric,character or logical
# The elements of vectors are called components.

# Create a vector using the colon operators.

x <- 1:5  # numeric vector in ascending order
x
class(x)
typeof(x)

# Note that the typeof vector created using c() function and colon operators are not same.
# c() function type double and : type integer.

y<-c(1,2,3,4,5)
y

typeof(y) # double type.

d <- 5:1  # numeric vector in descending order
d


# use variables to colon operators.
a <- 10
b<-3

c <- a:b
c


# we can concatenate colon operators with c().
e<-c(a:b,100)
e

