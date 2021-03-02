import sqlite3
conn = sqlite3.connect("computer_cards.db")

def create(name, cores,cpu_speed,ram,cost):
    insert_sql = "INSERT INTO computer(name, cores, cpu_speed,ram,cost) VALUES ('{}', {}, {}, {}, {})".format(name, cores, cpu_speed, ram, cost)
    conn.execute(insert_sql)
    conn.commit()
 
print("Enter the details:")

name = input("Name > ")
cores = input("Cores > ")
cpu_speed = input("Speed > ")
ram= input("Ram > ")
cost= input ("Cost > ")

create(name, cores,cpu_speed,ram,cost)
   
result = conn.execute("SELECT * FROM computer")
computers = result.fetchall()
print(computers)
    
conn.close() 
