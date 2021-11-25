from sklearn.model_selection import KFold
import pandas as pd
df = pd.read_csv('titanic.csv')
X = df[['Age', 'Fare']].values[:6]
y = df['Survived'].values[:6]

kf = KFold(n_splits=3, shuffle=True)

splits = list(kf.split(X))
first_split = splits[0]
train_indices, test_indices = first_split
print("training set indices:", train_indices)
print("test set indices:", test_indices)

X_train = X[train_indices]
X_test = X[test_indices]
y_train = y[train_indices]
y_test = y[test_indices]
print("X_train")
print(X_train)
print("y_train", y_train)
print("X_test")
print(X_test)
print("y_test", y_test)