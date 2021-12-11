import pandas as pd
iris = pd.read_csv('iris.csv')

X = iris[['petal_len', 'petal_wd']]
y = iris['species']

from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.30, random_state=1,stratify=y)

print(y_train.value_counts())
print(y_test.value_counts())

#####

# import pandas as pd
iris = pd.read_csv('iris.csv')

X = iris[['petal_len', 'petal_wd']]
y = iris['species']

from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.30, random_state=1, stratify=y)

from sklearn.neighbors import KNeighborsClassifier
## instantiate 
knn = KNeighborsClassifier(n_neighbors=5)
## fit 
print(knn.fit(X_train, y_train))