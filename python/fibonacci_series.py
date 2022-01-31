n = int(input("Enter a number: ")
a = 0
b = 1
print(a,b,end=" ")
for i in range(2,n):
    temp = a + b
    a = b
    b = temp
    print(temp,end=" ")
    