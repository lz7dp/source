n = int(input("Enter a number: ")
if n<3:
    print(n-1)
else:
    a = 0
    b = 1
    for i in range(2,n):
        temp = a + b
        a = b
        b = temp
        print(temp)
    