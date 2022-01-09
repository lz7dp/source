res <- max(8, 3, 12, 88)
print(res)

###

pow <- function(x, y) {
result <- x^y
print(result)
}

pow(2, 5)
pow(8, 3)

###

pow <- function(x, y=2) {
result <- x^y
print(result)
}

pow(5)