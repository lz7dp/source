import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Loading the dataset
file_path = 'storj-usd-max.csv'
df = pd.read_csv(file_path)

df.head()

# Checking for missing values
print(df.isnull().sum())

df.describe()

df['Percent Change'] = df['price'].pct_change() * 100
df.head()

# Droping the first row as it will have NaN value for percent change
df = df.dropna(subset=['Percent Change'])
df.head()

# Ensuring the date column is in datetime format
df['snapped_at'] = pd.to_datetime(df['snapped_at'])

# Setting the date column as the index
df.set_index('snapped_at', inplace=True)

plt.figure(figsize=(14, 7))
plt.plot(df['price'], label='price', color='g')
plt.title('STORJ High and Low Values Across Years')
plt.xlabel('Year')
plt.ylabel('Price (USD)')
plt.legend()
plt.grid(True)
plt.show()


# Extracting day of the week from the date
df['Day of Week'] = df.index.dayofweek
# Mapping day of the week numbers to actual names
day_of_week_mapping = {0: 'Monday', 1: 'Tuesday', 2: 'Wednesday', 3: 'Thursday', 4: 'Friday', 5: 'Saturday', 6: 'Sunday'}
df['Day of Week Name'] = df['Day of Week'].map(day_of_week_mapping)

# Calculating average percent change for each day of the week
avg_percent_change_by_day = df.groupby('Day of Week Name')['Percent Change'].mean()
# Sorting the days of the week for better visualization
avg_percent_change_by_day = avg_percent_change_by_day.loc[['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']]

plt.figure(figsize=(10, 5))
avg_percent_change_by_day.plot(kind='bar', color='skyblue')
plt.title('Average Percent Change by Day of the Week')
plt.xlabel('Day of the Week')
plt.ylabel('Average Percent Change (%)')
plt.grid(True)
plt.show()


uptrend_frequency = df[df['Percent Change'] > 0].groupby('Day of Week Name')['Percent Change'].count()
downtrend_frequency = df[df['Percent Change'] < 0].groupby('Day of Week Name')['Percent Change'].count()

uptrend_frequency = uptrend_frequency.reindex(['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'])
downtrend_frequency = downtrend_frequency.reindex(['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'])


# Plotting the frequency of uptrends and downtrends
plt.figure(figsize=(10, 5))
uptrend_frequency.plot(kind='bar', color='green', alpha=0.6, position=0, width=0.4, label='Uptrend')
downtrend_frequency.plot(kind='bar', color='red', alpha=0.6, position=1, width=0.4, label='Downtrend')
plt.title('Frequency of Uptrends and Downtrends by Day of the Week')
plt.xlabel('Day of the Week')
plt.ylabel('Frequency')
plt.legend()
plt.grid(True)
plt.show()


threshold = 10

bullish_days = df[df['Percent Change'] > threshold]
bullish_days


for index, row in bullish_days.head(5).iterrows():
    print(f"Date: {index}")
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


# Fiting the ARIMA model
#model = ARIMA(train, order=(5, 1, 0))
#model_fit = model.fit(disp=0)
#print(model_fit.summary())


# Forecasting the next steps in the test set
#forecast, stderr, conf_int = model_fit.forecast(steps=len(test))
#forecast_series = pd.Series(forecast, index=test.index)

#plt.figure(figsize=(14, 7))
#plt.plot(train, label='Training Data')
#plt.plot(test, label='Actual Prices')
#plt.plot(forecast_series, label='Forecasted Prices')
#plt.fill_between(forecast_series.index, conf_int[:, 0], conf_int[:, 1], color='k', alpha=0.1)
#plt.title('Bitcoin Price Forecast')
#plt.xlabel('Date')
#plt.ylabel('Price (USD)')
#plt.legend()
#plt.grid(True)
#plt.show()


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

# the first few rows for verifying
df[['price', 'Percent Change', 'Target', 'Signal']].head()

# Plot the closing price with buy/sell signals
plt.figure(figsize=(14, 7))
plt.plot(df['price'], label='Price')
plt.plot(df[df['Signal'] == 1].index, df[df['Signal'] == 1]['price'], '^', markersize=10, color='g', label='Buy Signal')
plt.plot(df[df['Signal'] == 0].index, df[df['Signal'] == 0]['price'], 'v', markersize=10, color='r', label='Sell Signal')
plt.title('STORJ Buy/Sell Signals')
plt.xlabel('Date')
plt.ylabel('Price (USD)')
plt.legend()
plt.grid(True)
plt.show()









