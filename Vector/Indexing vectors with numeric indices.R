
x<-c(10:50)
x

# Access One element.
x[2]

# Access multiple elements
x[2:20]

x[c(1,5,7,9)] # Here 1,5,7,9 are indexes.

# Access multiple elements in reverse order.
x[20:2]

x[c(1:4,7)]

# Access the last element when we don't know the length.
x[length(x)]

y<-c(10:20)
y

# To remove elements we can use negative indices.
y=y[-2] # Here the index two elements will be remove.
y


# To remove multiple elements.
y=y[c(-1,-7)]
y


x
x=x[-10:-20]
x


# We can add components to existing vectores.
y


y[length(y)]<-5
y
