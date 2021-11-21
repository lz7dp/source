import matplotlib.pyplot as plt

plt.scatter(df['Age'], df['Fare'])
plt.xlabel('Age')
plt.ylabel('Fare')
plt.scatter(df['Age'], df['Fare'], c=df['Pclass'])
plt.plot([0, 80], [85, 5])
