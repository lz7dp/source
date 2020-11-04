def hello(name = "World"):
    print("Hello, ", name)

def max2(x, y):
    if x>y:
        return x
    return y

def max3(x, y, z):
    return max2(x, max2(y, z))

def hello_separated(name="World", separator="-"):
    print("Hello,", name, sep=separator)

#hello()
#hello("Ivan")

print(max3("ab", "abc", "abd"))

hello_separated("Ivan", "+")
hello_separated("Ivan")
