shopping = []
how_many = input("how many items of shopping do you have? ")
how_many = int(how_many)

for item_number in range(how_many):
    item = input("what is item number " + str(item_number) + "? ")
    shopping.append(item)

print(shopping)
print("you have", count, "items in your shopping list")

for number in range(how_many):
    print(shopping[number])