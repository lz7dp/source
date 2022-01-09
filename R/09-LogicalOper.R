x <- 6
y <- 2
if(x>y & x < 10) {
  print("Yes")
}

###

x <- 6
y <- 2
if(x>y | x > 100) {
  print("Yes")
} 

###

x <- TRUE
print(!x)  

###

num <- 3
result <- switch(
  num,
  "One",
  "Two",
  "Three",
  "Four"
)
print(result) 

###

x <- "c"
result <- switch(
  x,
  "a" = "One",
  "b" = "Two",
  "c" = "Three",
  "d" = "Four"
)
print(result)  

###

