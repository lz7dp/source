from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split

import pandas as pd

from sklearn.datasets import load_boston
boston_dataset = load_boston()
## build a DataFrame
boston = pd.DataFrame(boston_dataset.data, 
                      columns=boston_dataset.feature_names)
boston['MEDV'] = boston_dataset.target

X = boston[['RM']]
Y = boston['MEDV']

X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 0.3, random_state=1)

model = LinearRegression()
model.fit(X_train, Y_train)
print(model.intercept_.round(2))
print(model.coef_.round(2))