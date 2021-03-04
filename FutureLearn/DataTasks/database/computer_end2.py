# Import modules

import sqlite3


# Establish connection

conn = sqlite3.connect("Data/computer_cards.db")


# Main Functions

def get_input():
    global name, cores, cpu_speed, ram, cost

    name = input("Name > ")
    cores = int(input("Cores > "))
    cpu_speed = float(input("CPU Speed [GHz] > "))
    ram = float(input("RAM [MB] > "))
    cost = float(input("Price [€] > "))


# Defining functions CRUD

def create():
    sql_insert = f"INSERT INTO computer(name,cores, cpu_speed, ram, cost) " \
                 f"VALUES ('{name}',{cores},{cpu_speed},{ram},{cost})"
    conn.execute(sql_insert)
    conn.commit()


def read(name):
    sql_select = f"SELECT * FROM computer WHERE name = '{name}'"
    result = conn.execute(sql_select)
    return result.fetchone()


def update(old_name):
    get_input()
    sql_update = f"UPDATE computer SET cores = {cores}, cpu_speed = {cpu_speed}," \
                 f"ram = {ram}, cost = {cost} WHERE name = '{old_name}'"
    conn.execute(sql_update)
    conn.commit()

def delete(name):
    sql_delete = f"DELETE FROM computer WHERE name = '{name}'"
    conn.execute(sql_delete)
    conn.commit()


# Main program

while True:
    print("What would you like to do?")
    action = input("create | read | update | delete | quit > ")
    if action == "create":
        while True:
            get_input()
            create()
            print("Would you like to add another computer?")
            answer = input("yes | no > ").lower()
            if answer == "yes":
                continue
            elif answer == "no":
                break
            else:
                print(f"I don't understand '{answer}'.\nPlease stick to the "
                      f"correct answers.")
    elif action == "read":
        while True:
            print("Which computer would you like to see?")
            name = input("computer name | quit > ")
            if name == "quit":
                print("Thank you.")
                break
            else:
                card = read(name)

            if card is None:
                print("The computer you were looking for is not included.")
                print("Please enter the proper name!")
            else:
                print(card)
    elif action == "update":
        while True:
            print("Which computer would you like to update?")
            name = input("computer name | quit > ")
            if name == "quit":
                print("Thank you.")
                break
            check = read(name)

            if check is None:
                print(f"{name} is not in this database.")
                print("Please enter the proper name!")
            else:
                update(name)
                print(f"{name} has been updated.")
    elif action == "delete":
        while True:
            print("Which computer would you like to delete?")
            name = input("computer name | quit > ")
            if name == "quit":
                print("Thank you.")
                break
            check = read(name)

            if check is None:
                print(f"{name} is not in this database.")
                print("Please enter the proper name!")
            else:
                delete(name)
                print(f"{name} has been deleted from database.")

    elif action == "quit":
        print("Thank you. Have a nice day!")
        break

    else:
        print(f"I don't understand '{action}'.\nPlease stick to the "
              f"correct answers.")

conn.close()
