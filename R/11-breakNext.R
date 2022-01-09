i <- 8
while(i > 0) {
    print(i)
    i <- i - 1
    if(i == 4) {
        break
    }
} 

###

for(x in 1:15) {
    if(x == 13) {
        next
    }
    print(x)
} 

