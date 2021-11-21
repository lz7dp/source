import pandas as pd

# numpy array
df = pd.read_csv('titanic.csv')
print(df['Fare'].values)

# Numpy Shape Attribute
arr = df[['Pclass', 'Fare', 'Age']].values
print(arr.shape)

# slice / syntax within brackets, we can select single values, a whole row or a whole column
print(arr[0, 1])
print(arr[0])
print(arr[:,2])

# define the mask variable
# take first 10 values for simplicity
# mask is a boolean array (True/False values) that tells us which values from the array we’re interested in
arr = df[['Pclass', 'Fare', 'Age']].values[:10]
mask = arr[:, 2] < 18
print(arr[mask])
print(arr[arr[:, 2] < 18])

# Summing and Counting
mask = arr[:, 2] < 18
print(mask.sum())
print((arr[:, 2] < 18).sum())
