import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.datasets import load_boston
boston_dataset = load_boston()

boston = pd.DataFrame(boston_dataset.data,columns=boston_dataset.feature_names)
boston['MEDV'] = boston_dataset.target
boston.plot(kind = 'scatter',
  x = 'RM',
  y = 'MEDV',
  figsize=(8,6))
plt.savefig("plot1.png")
plt.show()

boston.plot(kind = 'scatter',
  x = 'LSTAT',
  y = 'MEDV',
  figsize=(8,6))
plt.savefig("plot1.png")
plt.show()

boston['MEDV'] = boston_dataset.target
X = boston[['RM']]
print(X.shape)

boston['MEDV'] = boston_dataset.target
Y = boston['MEDV']
print(Y.shape)