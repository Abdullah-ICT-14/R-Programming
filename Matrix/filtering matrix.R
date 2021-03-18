

x <- sample(100,16)
x

m<-matrix(x,nrow=4,byrow = TRUE)
m

# select element that greater than 50
m[m>50]

# select element that less than 50
m[m<50]


# select element that greater than 50 and lss than 70

m[m>50 & m<70]


# select element that greater than 50 or lss than 70

m[m>50 | m<70]

# which() function is used to find the indices.
which(m>50)
