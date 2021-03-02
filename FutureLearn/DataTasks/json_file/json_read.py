import json

with open("neil.json", "r") as f:
    data2 = json.load(f)

print(data2)

age = data2["Age"]

print(age)

