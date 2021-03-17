
# The comparisn between vectors is done element wise.

x <-c(7,10,3,9,6)
x

y<-c(2,14,5,15,6)
y

# returns true for the pairs of components where x is greater than y.
# returns false for the pairs of components where y is greater than x.
x>y

# similarly
x<y

 
# It will return true when both x and y are equal
x==y

# similarly
x !=y


# all() function
all(x==y)
all(x!=y)


# any() function

any(x==y)
any(x!=y)



# identical() function return true if vectors are identical
identical(x,y)


# all.equal() function return true if all are equal.
# if not returns the mean difference between the components.
all.equal(x,y)

