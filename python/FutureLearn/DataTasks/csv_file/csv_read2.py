import csv
with open('foods2.csv', newline= '') as csvfile:
    favourites = csv.reader(csvfile, delimiter=',', quoting=csv.QUOTE_NONNUMERIC)
    for row in favourites:
        print(row)
        print(type(row[0]), type(row[1]))
