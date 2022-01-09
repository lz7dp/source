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

