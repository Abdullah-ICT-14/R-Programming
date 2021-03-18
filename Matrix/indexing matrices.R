
# We must use two indices ;one for the row
# and the one for the column

p <- matrix(1:16,nrow = 4,byrow = TRUE)
p


# access the element on row 2 , column 3
p[2,3]
p[4,1]


# accessing the entire row

p[2,]
p[,3]
p[3,]


p[2,2:4]


## access the elements on column3,rows 1 and 4
p[c(1,4),3]

p[c(2,4),c(4,2)]
