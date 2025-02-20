import pandas as pd
import numpy as np

# Loading the dataset
file_path = 'output.csv'
df = pd.read_csv(file_path)

df.describe()

df['Percent Change'] = df['price'].pct_change() * 100

# Droping the first row as it will have NaN value for percent change
df = df.dropna(subset=['Percent Change'])

# Setting the date column as the index
df.set_index('price_id', inplace=True)

threshold = 10

bullish_days = df[df['Percent Change'] > threshold]
bullish_days


for index, row in bullish_days.tail(96).iterrows():
    print(f"ID: {index}")
    print(f"Date: {row['price_date']}")
    print(f"Time: {row['price_time']}")
    print(f"Price: {row['price']}")
    print(f"Percent Change: {row['Percent Change']:.2f}%")
    print()


# Printing out the dates for cross-referencing with historical news articles
print("Significant Bullish Days for Manual Research:")
for date in bullish_days.index[:10]:
    print(date)


from statsmodels.tsa.arima_model import ARIMA
df = df.sort_index()
ts_data = df['price']

train_size = int(len(ts_data) * 0.8)
train, test = ts_data[:train_size], ts_data[train_size:]
print(f"Training set length: {len(train)}")
print(f"Test set length: {len(test)}")

# Import necessary libraries
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report, accuracy_score

# features and target
df['Target'] = (df['Percent Change'] > 0).astype(int)
features = ['price']
X = df[features]
y = df['Target']

#training and test sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# shapes of the datasets
print(X_train.shape, X_test.shape, y_train.shape, y_test.shape)

# Initializing the Random Forest Classifier
rf = RandomForestClassifier(n_estimators=100, random_state=42)

# Training the model
rf.fit(X_train, y_train)

# Predicting on the test set
y_pred = rf.predict(X_test)

# classification report and accuracy score
print("Classification Report:\n", classification_report(y_test, y_pred))
print("Accuracy Score:", accuracy_score(y_test, y_pred))

#predictions for the entire dataset
df['Signal'] = rf.predict(X)

# few rows for verifying
df[['price', 'Percent Change', 'Target', 'Signal']].tail(96)

# Plot the closing price with buy/sell signals

df.to_csv('processed5_storj_data.csv')
df2 = df.tail(96)
df2.to_csv('processed4_storj_data.csv')


