def fib(n):
    if n <= 1:        
        return n    
    return(fib(n-1) + fib(n-2))


def fib2(n):
    F = [0, 1] + [0]*(n-1)
    for i in range(2, n+1):
        F[i] = F[i-1] + F[i-2]
    print(F)
    

x = int(input())
print(fib(x))
fib2(x)

