import csv
name = "Portia"
food = "Steak"
with open('foods.csv', mode="a") as csvfile:
    favourites = csv.writer(csvfile, delimiter=',')
    favourites.writerow([name,food])
