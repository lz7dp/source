import numpy as np
import pandas as pd

from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier

iris = pd.read_csv('iris.csv')

iris.drop('id', axis=1, inplace=True)

X = iris[['petal_len', 'petal_wd']]
y = iris['species']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.30, random_state=1, stratify=y)

## instantiate 
knn = KNeighborsClassifier(n_neighbors=5)
## fit 
knn.fit(X_train, y_train)

pred = knn.predict(X_test)

y_pred_prob = knn.predict_proba(X_test)
print(y_pred_prob[10:12])

###

print(pred[10:12])