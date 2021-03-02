#asks the user to input the year (num), month (str) and date (num) and prints out the date, month and year.

months_d ={"January":31, "February":28, "March":31, "April":30, "May":31, "June":30, "July":31, "August":31, "September":31, "October":31, "November":31, "December":31}
year = input("Enter a year > ")

valid_year = False

while not valid_year:
    try:
        year = int(year)
        valid_year = True
    except ValueError:
        year = input("Invalid. Enter a number > ")

if year%4 == 0:
    months_d["February"] = 29 #This is strictly only true, in the case of whole centuries, that are divisible by 400 with no remainder.
    #print(months_d)
        
print("Thank you")

month = input("Enter a month > ")
months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
valid_month = False

while not valid_month:
    
    month = str(month)
    if month not in months:
        month = input("Invalid. Enter the month as a word > ")    
        
    valid_month = True
    
print("Thank you")

date = input("Enter a date > ")

valid_date = False

while not valid_date:
    try:
        date = int(date)
        x = months_d[month]
        if date > int(x):
            date = input("Date invalid. Enter a valid date > ")
            date =int(date)
        valid_date = True
    except ValueError:
        date = input("Invalid. Enter a date as a number > ")

    print("Thank you")

print (date, month, year)
