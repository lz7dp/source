from sklearn.model_selection import KFold
import pandas as pd

df = pd.read_csv('titanic.csv')
X = df[['Age', 'Fare']].values[:6]
y = df['Survived'].values[:6]

kf = KFold(n_splits=3, shuffle=True)
print(list(kf.split(X)))