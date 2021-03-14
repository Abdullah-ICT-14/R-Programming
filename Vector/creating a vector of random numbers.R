
# the vector of random numbers are important in simulation and other statistical application.
# the sample() function create a vector of discrete random numbers.
# sample() takes three arguments one is population, sample and the replace.
# If replace is False it will generate unique random numbers
# If replace is True it will generate a values with replacement.

random_vector <- sample(100,20) # population is 1 to 100 and sample is 20.By default replace is false

random_vector

x<-sample(1:100,12)
x

# the population can be any vector
h<-100:300
h
y<-sample(h,50)
y

# When the replace is true.
replace_true <- sample(100,30,replace = TRUE)
replace_true

# If sample is greater than population then replace option need to set true.
f<-sample(10,50,replace = TRUE)
f
# Otherwise it will generate errors.
g<-sample(10,50)



# rnorm() function is used to genreate a random numbers witha normal distribution.
# We need to specify number of values,mean and standard deviations as parameters.
# By default mean is 0 and standard deviations is 1.

random_normal<-rnorm(10,5,10)
random_normal

p<- rnorm(100,10,0.7)
p


# runif() function is used to generate uniform random numbers.
# we need to sepecify the number of trials ,and the range(lower and upper)
# By deafult range is 0-1.

uniform_random<-runif(100,1,5)
uniform_random


# rexp() function is used to generate exponential random numbers.
# we need to sepecify the number of trials ,and rate(1/mean)

expo_random<-rexp(100,1/5)
expo_random
