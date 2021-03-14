
# rep() function create a vector with replicated values.
# we need to sepecify the value and number of times we want to replicate it.

x<-rep(5,3)
x

str_rep<-rep('abdullah',6)
str_rep


logi_rep=rep(TRUE,5)
logi_rep


# We can combine rep() with the c() funcion

rep_c <- rep(c(1,2,3),5)
rep_c


# We can also combine the rep() with the colon operators.
rep_colon <- rep(10:-2,5)
rep_colon


# To replicate the vector element wise we can use 'each' argument.
rep_element <- rep(5:2,each=5)
rep_element


# Other functions that replicate values.
# numeric() replicate with zeros(0)
zeros_numeric <- numeric(5)
zeros_numeric


#Character() replicate with empty string.
empty_character <- character(5)
empty_character


# logical() vector replicate with FALSE values
log_false <- logical(4)
log_false
