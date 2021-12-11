import numpy as numpy 
import pandas as pd
from sklearn.datasets import load_wine

data = load_wine()
wine = pd.DataFrame(data.data, columns=data.feature_names)
print(wine.shape)
print(wine.columns)

print(wine.iloc[:,:3].describe())

#plotting data
scatter_matrix(wine.iloc[:,[0,5]])
plt.savefig("plot.png")
plt.show()

### Pre-processing: Standardization
X = wine[['alcohol', 'total_phenols']] 

from sklearn.preprocessing import StandardScaler
scale = StandardScaler()
scale.fit(X)

print(scale.mean_)
print(scale.scale_)

###
X_scaled = scale.transform(X)
print(X_scaled.mean(axis=0))
print(X_scaled.std(axis=0))