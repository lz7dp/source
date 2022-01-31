n = int(input("Enter a number: ")
r = 0
while n:
    r *= 10
    r += n%10
    n//=10
print(n)