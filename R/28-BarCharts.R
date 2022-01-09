png(file = "chart.png")
 
barplot(mtcars$hp) 

###

png(file = "chart.png")
 
barplot(mtcars$hp, names.arg = rownames(mtcars))

###

png(file = "chart.png")
 
barplot(mtcars$hp, horiz = TRUE, names.arg=rownames(mtcars)) 

