
## f = open("names.txt", "w") ## open file to rewrite (clear and new)
f = open("names.txt", "a")
name = input("Hello, what is your name? ")
print("Hello " + name)
f.write(name + "\n")
f.write(name + "\n")
f.write(name + "\n")
f.close()
