x <- data.frame("id" = 1:2, "name" = c("James", "Amy"),  "age" = c(42,18)) 
print(x)

###

x <- data.frame("id" = 1:2, "name" = c("James", "Amy"), "age" = c(42,18))

#second column
print(x[[2]])

#the name column
print(x[["name"]])

#the same as
print(x$name) 

###

print(x[2])

###

print(x[[2, 3]]) 

###

x$country <- c("USA","Italy")

print(x)

###

print(x[x$age>21, ])

print(subset(x, age>21))

print(mean(x$age))

summary(x)

###

x <- data.frame("id" = 1:3, "name" = c("James", "Amy", "Bob"), "age" = c(42,18, 33))

gender <- factor(c("Male", "Female", "Male"))

print(levels(gender)) 

###

gender <- factor(c("Male", "Female", "Male"))

print(table(gender))

###

x$gender <- gender
print(x)
