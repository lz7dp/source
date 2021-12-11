import pandas as pd
iris = pd.read_csv('iris.csv')

print(iris.shape)
print(iris.describe())
print(iris.groupby('species').size())
print(iris['species'].value_counts())