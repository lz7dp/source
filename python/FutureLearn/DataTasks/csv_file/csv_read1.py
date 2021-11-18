import csv
with open('foods.csv') as csvfile:
    favourites = csv.reader(csvfile, delimiter=',')
    for row in favourites:
        print(row)
