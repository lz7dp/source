def f(n:int):
    assert n >= 0, "unrecognized Factorial"
    if n == 0 or n == 1:
        return 1
    return f(n-1)*n

print(f(5))

################
# second way:

n = int(input("Enter a number: ")
f = 1
for i in range(1,n+1):
    f *= i
print(f)
