import pandas as pd
df = pd.read_csv('titanic.csv')
print(df.head())

pd.options.display.max_columns = 6
df = pd.read_csv('titanic.csv')
print(df.describe())