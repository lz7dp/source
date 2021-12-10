import pandas as pd
import numpy as np

presidents_df = pd.read_csv('president_heights_party.csv', index_col='name')
                                  
print(presidents_df.min())

print(presidents_df.max())

print(presidents_df.mean())

print(presidents_df['age'].quantile([0.25, 0.5, 0.75, 1]))

#statistics
print(presidents_df['age'].mean())
print(presidents_df['age'].median())
print(presidents_df.std())
print(presidents_df['age'].describe())
print(presidents_df.describe())
print(presidents_df['party'].value_counts())
print(presidents_df['party'].describe())

#Groupby and Aggregations
print(presidents_df.groupby('party').mean())
print(presidents_df.groupby('party')['height'].agg(['min', np.median, max]))

print(presidents_df.groupby('party')\
    .agg({'height': [np.median, np.mean],
        'age':    [min, max]}))
        
##################################

const = pd.Series([2, 2, 2])

print(const.var())
print(const.std())

dat = pd.Series([2, 3, 4])

print(dat.mean())
print(dat.var())

print(dat.std())
 
print(presidents_df['age'].var())
print(presidents_df['age'].std())

