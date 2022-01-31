n = int(input("Enter a number: ")
r = 0
o = n
while n:
    r*=10
    r+=n%10
    n//=10
if o == r:
    print(o,"is a palindrome number")
else:
    print(o,"is not a palindrome number")
    