import sqlite3

conn = sqlite3.connect("computer_cards.db")

def create(name, cores, cpu_speed, ram, cost):
    insert_sql = "INSERT INTO computer(name, cores, cpu_speed, ram, cost) VALUES ('{}', {}, {}, {}, {})".format(name, cores, cpu_speed, ram, cost)

    conn.execute(insert_sql)

    conn.commit()

def read(name):
    select_sql = "SELECT * FROM computer WHERE name = '{}'".format(name)

    result = conn.execute(select_sql)

    return result.fetchone()

def update(name, cores, cpu_speed, ram, cost):
    update_sql = "UPDATE computer SET cores = {}, cpu_speed = {}, ram = {}, cost = {} WHERE name = '{}'".format(cores, cpu_speed, ram, cost, name)

    conn.execute(update_sql)

    conn.commit()

def delete(name):
    delete_sql = "DELETE FROM computer WHERE name = '{}'".format(name)

    conn.execute(delete_sql)

    conn.commit()

command = input("(C)reate (R)ead, (U)pdate, (D)elete card >")

if command == "C":
    name = input("Name >")
    cores = input("Cores >")
    cpu_speed = input("CPU speed (GHz) >")
    ram = input("RAM (MB) >")
    cost = input("Cost ($) >")

    create(name, cores, cpu_speed, ram, cost)

elif command == "R":
    name = input("Name >")

    card = read(name)

    print(card)

elif command == "U":
    name = input("Name >")
    cores = input("Cores >")
    cpu_speed = input("CPU speed (GHz) >")
    ram = input("RAM (MB) >")
    cost = input("Cost ($) >")

    update(name, cores, cpu_speed, ram, cost)

elif command == "D":
    name = input("Name >")
    
    delete(name)

conn.close()
