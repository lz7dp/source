t1 <- "hi"
t2 <- "there"
t3 <- "!"

result <- paste(t1, t2, t3)
print(result) 

###

t1 <- "hi"
t2 <- "there"
t3 <- "!"

result <- paste(t1, t2, t3, sep="-")
print(result)

###

txt <- "hello"

txt <- toupper(txt)
print(txt)

txt <- tolower(txt)
print(txt) 

###

txt <- "hello"

print(nchar(txt)) 

###

txt <- "sololearn"
print(substr(txt, 5, 9)) 

###

