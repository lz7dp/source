import pandas as pd
from sklearn.linear_model import LogisticRegression

df = pd.read_csv('titanic.csv')
X = df[['Fare', 'Age']].values
y = df['Survived'].values

model = LogisticRegression()
model.fit(X, y)

print(model.coef_, model.intercept_)