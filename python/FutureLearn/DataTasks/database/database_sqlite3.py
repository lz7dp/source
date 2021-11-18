import sqlite3

def create(name, cores):
    insert_sql = "INSERT INTO computer(name, cores) VALUES ('{}', {})".format(name, cores)
    conn.execute(insert_sql)
    conn.commit()

### start
conn = sqlite3.connect("computer_cards.db")
result = conn.execute("SELECT * FROM computer")
computers = result.fetchall()

for computer in computers:
    print(computer)

for computer in computers:
    name = computer[0]
    print(name)

INSERT INTO table(field_a, field_b) VALUES (value_a, value_b)

print("Enter the details:")
name = input("Name > ")
cores = input("Cores > ")
create(name, cores)

conn.close()

