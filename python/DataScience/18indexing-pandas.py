import pandas as pd

presidents_df = pd.read_csv('president_heights_party.csv', index_col='name')
                                  
print(presidents_df.loc['Abraham Lincoln'])

print(type(presidents_df.loc['Abraham Lincoln']))
print(presidents_df.loc['Abraham Lincoln'].shape)

print(presidents_df.loc['Abraham Lincoln':'Ulysses S. Grant'])

print(presidents_df.iloc[15])

print(presidents_df.iloc[15:18])

print(presidents_df.columns)

print(presidents_df['height'])
print(presidents_df['height'].shape)

print(presidents_df[['height','age']].head(n=3))

print(presidents_df.loc[:, 'order':'height'].head(n=3))

