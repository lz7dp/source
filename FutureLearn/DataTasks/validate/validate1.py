def enter_an_integer():

    number = input("Enter a number > ")
    valid_integer = False

    while not valid_integer:
        try:
            number = int(number)
            valid_integer = True
        except ValueError:
            number = input("Invalid. Enter a number > ")

    return number

valid_number = enter_an_integer()

print("Thank you")


days_of_the_week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

day = input("What day is it? ")

if day not in days_of_the_week:
    print("This is incorrect")

