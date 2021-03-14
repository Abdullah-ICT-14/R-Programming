# the sequence function create a vectors with a real numbers.
# It take three arguments: start value,end value,and step size(difference)
# Default stop value is 1

x <-seq(from=5,to=10)
x
y <-seq(from=5,to=10,by=0.5)
y


# we don't need to write the name from,to or by if we give the value in exact order.
z<-seq(4,5,0.1)
z


# We can also create the sequence in reverse order

rev_seq <- seq(20,1,-3)
rev_seq

d<-seq(4,1,-0.5)
d


# We can use the length arguments to sequence a number.
g<-seq(5,4,length=10)
g

h<-seq(1,10,length=100)

h
