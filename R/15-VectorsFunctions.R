names <- c("James", "Amy", "John")
print(names[2]) 

###

ages <- c("James"=18, "Amy"=14, "John"=64) 
print(ages["James"])

###

names <- c("James", "Amy", "John")
print(names[-3]) 

###

names <- c("James", "Amy", "John", "Dave", "Bob")
print(names[2:4]) 

###

names <- c("James", "Amy", "John")
print(length(names)) 

###

x <- c(4, 8, 42, 1, 6)
print(sum(x)) 

###

x <- c(4, 8, 42, 1, 6)
print(sort(x))  

###

x <- 3:9
print(x)

###

x <- seq(1, 10, by=2)
print(x)
# 1, 3, 5, 7, 9

###

x <- 1:5
x[2] <- 42
print(x)

###

