x<- c(1,2,3,4,5)
x

# Adding vector with scalar.
y<- x+10
y

# multiply vector with scalar.
y<- x*7
y

#subtract vector with scalar.
y<- x-10
y

# find modulus.
z<- x%%2
z

# Find power

e<-x^3
e

# Exponent of each components
exp(x)


# sqrt
sqrt(x)

log(x)
sin(x)
cos(x)
abs(x)


# Round the vector components
y<-c(1.3,2.7,1.6,9.5)
y
round(y)

## round to the closest lower integer.
floor(y)

## round to the closest higher integer.
ceiling(y)


## round to the specified number of significant digits.
## using the signif() function.

w <-c(2.71356,2.965,3.4567)

signif(w,1)
signif(w,2)

# Compute the factorial.
factorial(x)
