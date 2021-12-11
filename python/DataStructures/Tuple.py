#
words = ("spam", "eggs", "sausages",)
print(words[0])

words = ("spam", "eggs", "sausages",)
words[1] = "cheese"

# used as keys for dictionaries (because they are immutable)
dict = {
    ("David", 42): "red",
    ("Bob", 24): "green"
}
print(dict[("Bob", 24)]) 

### unpacking
numbers = (1, 2, 3)
a, b, c = numbers
print(a)
print(b)
print(c)

#
a, b, *c, d = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print(a)
print(b)
print(c)
print(d)