n = int(input("Enter a number: ")
o = n
sum = 0
while n:
    sum += (n%10) **3
    n//=10
if sum == 0:
    print(o, "is a armstrong number")
else:
    print(o, "is not a armstrong number")