import sqlite3

connection = sqlite3.connect("Data/computer_cards.db")

def get_input():
    global name, cores, cpu_speed, ram, cost

    name = input("Name > ")
    cores = int(input("Cores > "))
    cpu_speed = float(input("CPU Speed [GHz] > "))
    ram = float(input("RAM [GB] > "))
    cost = float(input("Price [€] > "))

def add_computer():
    global name, cores, cpu_speed, ram, cost
    insert_sql = f"INSERT INTO computer(name, cores, cpu_speed, ram, cost) " \
                 f"VALUES ('{name}', {cores}, {cpu_speed}, {ram}, {cost})"

    connection.execute(insert_sql)

    connection.commit()

while True:
    print("Would you like to add another computer?")
    answer = input("yes | no > ").lower()
    if answer == "yes":
        get_input()
        add_computer()
    elif answer == "no":
        print("Have a nice day!")
        break
    else:
        print("Sorry, I didn't get that!")

connection.close()
