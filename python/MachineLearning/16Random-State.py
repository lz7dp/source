################################ random state
from sklearn.model_selection import train_test_split

X = [[1, 1], [2, 2], [3, 3], [4, 4]]
y = [0, 0, 1, 1]

X_train, X_test, y_train, y_test = train_test_split(X, y)
print('X_train', X_train)
print('X_test', X_test)

################################ equal random state

from sklearn.model_selection import train_test_split

X = [[1, 1], [2, 2], [3, 3], [4, 4]]
y = [0, 0, 1, 1]

X_train, X_test, y_train, y_test = train_test_split(X, y, random_state=27)
print('X_train', X_train)
print('X_test', X_test)