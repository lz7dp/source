n = int(input("Enter a number: ")
flag = True
for i in range(2,(n//2)+1):
    if (n/i).is_integer():
        flag = False
if flag:
    print(n,"is a prime number")
else:
    print(n,"is not a prime number")
    