
x<-c(10:50)
x

# Filtering
x[x>40] # x is greater than 40

x[x<40] # x is less than 40


x[x<40 & x>30] #x is less than 40 and greater than 30

random_number <-sample(100,20)
random_number

x=random_number[random_number>20]
x

y<-random_number[random_number<20]
y


z <- random_number[random_number>30 & random_number<40]
z

random_number[random_number !=30]


# To find the indices of the components that meet a condition we can use which()
which(x>40)

which(x<40)
