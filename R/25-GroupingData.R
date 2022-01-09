
#grouping data
###
by(mtcars$hp, mtcars$am, mean) 

###

tapply(mtcars$hp, mtcars$am, mean) 
