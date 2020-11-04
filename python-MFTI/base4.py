base=7
x=int(input())
while x>0:
    digit = x%base
    print(digit, end="")
    x //= base
