# Chalanges insert new data
import sqlite3

# Function to insert data to database
def create(name, cores,  cpu_speed, ram, cost):
    insert_sql = "INSERT INTO computer(name, cores, cpu_speed, ram, cost) VALUES ('{}', {},'{}','{}','{}')".format(name, cores, cpu_speed, ram, cost)
    conn.execute(insert_sql)
    conn.commit()

# Making connection to database
conn = sqlite3.connect("d:/Pystrukturdata/databasenya/computer_cards.db")

# Making input data
print("Enter the details:")
name = input("Name > ")
cores = input("Cores > ")
cpu_speed = input("CPU Speed > ")
ram = input("Total RAM > ")
cost = input("Cost Computer-$- > ")

# Call the function
create(name, cores, cpu_speed, ram, cost)

# Closing connection the database
conn.close()
