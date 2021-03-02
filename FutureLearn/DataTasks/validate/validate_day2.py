## validate a date

def valid_date():
    flag = False
    while flag is not True:
        year = input("Enter a year > ")
        try:
            year = int(year)
            if year < 0 or year > 2021:
                print("This is not a valid year. Try again.")
            else:
                flag = True
        except ValueError:
            print("This is not a valid year. Try again.")


    flag = False
    months = {
        "January": 31,
        "February": 28,
        "March": 31,
        "April": 30,
        "May": 31,
        "June": 30,
        "July": 31,
        "August": 31,
        "September": 30,
        "October": 31,
        "November": 30,
        "December": 31
        }

    # print(months)
    # print(type(months["January"]))
    while flag is not True:
        month = input("Enter a month > ")
        month = month.capitalize()
        # print(month)
        # print(type(month))
        if month in months:
            high_number = months[month]
            # print(type(high_number))
            flag = True
        else:
            print("This is not a valid month. Try again.")

    # print(high_number)
    flag = False
    while flag is not True:
        day = input("Enter a day > ")
        try:
            day = int(day)
            if day < 1 or day > high_number:
                print("This is not a valid day. Try again.")
            else:
                flag = True
        except ValueError:
            print("This is not a valid day. Try again.")

    if day == 1:
        day_1 = "1st"
    elif day == 2:
        day_1 = "2nd"
    elif day == 3:
        day_1 = "3rd"
    else:
        day_1 = str(day) + "th"
    valid = day_1 + " " + month + " " + str(year)
    return valid
        

date = valid_date()
print(date)
