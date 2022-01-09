#Filtering Data
x <- mtcars[mtcars$am == 0, ]

x[x$qsec == min(x$qsec), ]


###
#Correlation

res <- cor(mtcars)
res <- round(res, 2)
print(res) 

