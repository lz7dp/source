n = int(input("Enter a number: ")
b = bin(n)[2:]
r = b[::-1]
if b == r:
    print(n, "is a binary palindrome number")
else:
    print(n, "is not a binary palindrome number")