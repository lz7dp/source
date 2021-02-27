count = 1
guess = input("guess my name ")
while guess != "Martin":
    guess = input("wrong - guess again ")
    count = count + 1
print("Well done!")
print("You took to guess the name", count, "times!")