png(file = "chart.png")
plot(1:10, main="My Chart", xlab="The x-axis", ylab="The y-axis") 

###

x <- mtcars$wt
y <- mtcars$drat

png(file = "chart.png")
plot(x, y, xlab="weight", ylab="rear axle ratio")  

