names = ["James", "Tom", "Amy"]
print(names[1])

###
m = [
    [1,2,3],
    [4,5,6]
    ]
print(m[1][2]) 

###
words = ["spam", "egg", "spam", "sausage"]
print("spam" in words)
print("egg" in words)
print("tomato" in words)

###
x = [2, 4, 6, 8]
for n in x:
   print(n)
   
###
x = [2, 4, 6]
x.append(8)
x.remove(4)
x.insert(0, 8)
print(x)
print(x.count(8))

###
x = [2, 4, 6, 8]
x.reverse()
print(x)
x.sort()
print(x)
print(min(x))
print(max(x))

###
# a list comprehension
cubes = [i**3 for i in range(5)]
print(cubes)

###
evens=[i**2 for i in range(10) if i**2 % 2 == 0]
print(evens)
