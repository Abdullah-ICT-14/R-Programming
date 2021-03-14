
# There are three types of variables on R such as numeric,character(string) and logical
# Rules for Variable names:
#   Start with a letters.
#   Variables names are case sensitive.
#   It can contain letters,figures and underscores.
#   It can contain dashes and other special characters such as #,$,%,&,*,\,/ etc.
#   In R we can use the equal sign(=) to assign values to the variables.
#   We can also use the symbol (<-) to assign values to the variables.

x<-5
y<-7
x+y
x-y
x/y
x*y

# storing the results in new variables
add=x+y
add


# String variables
str<- "string variables"
str

#Logical variables

xx=TRUE
xx

yy <- FALSE
yy


# Find the class of the variables using class()
# Class represents the abtract type of the object.

class(x) # numeric class

class(str) # Character class


class(xx) # logical class

# Find the type of the variables using typeof()
# The type reresents how the objects is stored in the memory.

typeof(x)  # double type

typeof(str) # character type

typeof(xx)  # logical


# We can perform mathematical operations in logical variables.
# TRUE=1,FALSE=0
# Here xx=TRUE,yy=FALSE 
xx
yy

xx+yy

xx-yy

xx/yy
 
xx*yy



# To find all of the variables we already use we can using ls()
ls()

# For removing the variables rm() functions are used.
rm(x)
ls()


# remove multiple variables
rm(xx,yy)
ls()

# TO remove all the variables
rm(list = ls())
ls()
