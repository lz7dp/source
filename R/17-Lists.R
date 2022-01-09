x <- list("James", "Bob", c(2, 4, 8), 42)

print(x[[3]])

###

x <- list("name"="James", "age"=42, "gender"=1, "married"=FALSE)

x[["country"]] <- "Australia"
print(x)

###

list1 <- list("A", "B", "C")
list2 <- list("D", "E")
x <- c(list1, list2)

print(x) 

###

x <- list(4, 2, 11)
y <- unlist(x)

print(sort(y))
print(mean(y)) 