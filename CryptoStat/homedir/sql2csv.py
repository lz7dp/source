import mysql.connector
import csv

# Database connection details
db_config = {
    'host': 'localhost',  # Your MySQL server address
    'user': '***',  # Your MySQL username
    'password': '***',  # Your MySQL password
    'database': 'cryptodb'  # Your database name
}

# Establish connection to the database
conn = mysql.connector.connect(**db_config)
cursor = conn.cursor()

# Query to fetch data from the table (adjust table name and columns)
table_name = 'STORJ'  # Replace with your table name
query = f"SELECT * FROM {table_name}"

# Execute the query
cursor.execute(query)

# Get the column names
columns = [column[0] for column in cursor.description]

# Write data to CSV
csv_filename = 'output.csv'
with open(csv_filename, 'w', newline='', encoding='utf-8') as csv_file:
    csv_writer = csv.writer(csv_file)
    
    # Write the header (column names)
    csv_writer.writerow(columns)
    
    # Write the data
    for row in cursor:
        csv_writer.writerow(row)

# Close the database connection
cursor.close()
conn.close()

print(f"Data has been written to {csv_filename}")

