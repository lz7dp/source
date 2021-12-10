import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.datasets import load_boston

boston_dataset = load_boston()
## build a DataFrame
boston = pd.DataFrame(boston_dataset.data, 
                      columns=boston_dataset.feature_names)
boston['MEDV'] = boston_dataset.target

print(boston.shape)
print(boston.columns)

#Head
print(boston[['CHAS', 'RM', 'AGE', 'RAD', 'MEDV']].head())

#Summary Statistics
print(boston.describe().round(2))

#Visualization
boston.hist(column='CHAS')
plt.savefig("plot1.png")
plt.show()

boston.hist(column='RM', bins=20)
plt.savefig("plot1.png")
plt.show()