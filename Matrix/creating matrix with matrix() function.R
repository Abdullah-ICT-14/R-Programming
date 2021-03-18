
# A matrix is a collection of data elements of the same type.
# arranged in a two dimensional array.

# to create a matrix we must indicate the elements,
# as well as the number of rows and columns

m<-matrix(c(1:6),nrow=2,ncol = 3)
m

# By default,any matrix is created column-wise.
# to change that we set the byrow option to true

m<-matrix(c(1:6),nrow = 2,ncol = 3,byrow = TRUE)
m


# It is not neccessary to specify both the number of rows and columns.
# we can only indicate one of them.
# the number of elements must be a multiple of the number of rows or columns.

x <- matrix(c(1:6),ncol=3)
x


# get the matrix dimensions
dim(x)

nrow(x)
ncol(x)

#Others matrix

y<- matrix(rep(8,9),nrow=3)
y


z <- matrix(seq(1,5,length=20),nrow=4,byrow = TRUE)
z

w <- matrix(rnorm(20),nrow = 4)
w
