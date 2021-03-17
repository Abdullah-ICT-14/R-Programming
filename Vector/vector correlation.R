
# Vectors must be same length

sal <- c(80,66,42,40,75,82)
sal

edu <- c(15,18,12,16,20,16)
edu

# to compute the correlation we use the cor.test() function.
cor.test(sal,edu)
