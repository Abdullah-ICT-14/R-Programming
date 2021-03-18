
# Using the dimnames option in the matrix() function we can name rows and columns.

m <- matrix(c(1:12),nrow = 4,dimnames = list(c('r1','r2','r3','r4'),c('c1','c2','c3')))
m

# We can also name rows and columns at any time using rownames and colnames()

x<-matrix(1:8,nrow=2)
x

rownames(x)<-c('r1','r2')
x

colnames(x) <- c('c1','c2','c3','c4')
x
