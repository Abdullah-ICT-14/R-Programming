# First create a vector with id values.
id<-c(15,45,57,60)
id

# To add the person name with each id we can use names() function.
names(id)<-c('Abdullah','Shourob','zaber','sohag')
id


# we can access the components using the names
id['Abdullah']


# To remove the names we can use the null value to the names().
names(id)<-NULL
id
