png(file = "chart.png")
 
x <- c(8, 10, 42, 14)
y <- c("A", "B", "C", "D")
pie(x, label = y) 

###

x <- tapply(mtcars$hp, mtcars$gear, mean)
labels <- names(x)

png(file = "chart.png")
pie(x, label = labels, main="Average HP by Gears") 
