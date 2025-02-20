import pandas as pd

# Read the CSV file into a pandas DataFrame
csv_file = 'processed4_storj_data.csv'  # Replace with the path to your CSV file
df = pd.read_csv(csv_file)

# Convert the DataFrame to an HTML table and save it to a file
html_file = 'output.html'  # Path where you want to save the HTML file
df.to_html(html_file, index=False)  # index=False avoids writing row numbers

print(f"CSV file has been converted to HTML and saved as {html_file}")

