import pandas as pd

presidents_df = pd.read_csv('president_heights_party.csv', index_col='name')
                                  
print(presidents_df.size)

print(presidents_df.shape[0])

