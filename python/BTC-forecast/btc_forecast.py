# btc_forecast_to_html.py
import os
import sys
import io
import json
import math
import base64
import warnings
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from datetime import datetime, timedelta
from statsmodels.tsa.stattools import adfuller
from statsmodels.tsa.seasonal import seasonal_decompose
from statsmodels.tsa.arima.model import ARIMA
from pmdarima.arima import auto_arima
from sklearn.metrics import mean_squared_error, mean_absolute_error
from sklearn.preprocessing import MinMaxScaler
from keras.models import Sequential
from keras.layers import LSTM, Dense, Dropout
from keras.models import save_model
from IPython.display import HTML
import requests

warnings.filterwarnings('ignore')
plt.style.use('seaborn')

config = {
    'data_path': 'btc_converted.csv',
    'output_dir': './',
    'test_size': 0.1,
    'validation_size': 0.15,
    'look_back': 7,
    'epochs': 10,
    'batch_size': 32,
    'forecast_days': 3
}

os.makedirs(config['output_dir'], exist_ok=True)

def scrapping_data(url):
    # URL of the file you want to download
    #url = 'https://www.coingecko.com/price_charts/export/bitcoin/usd.csv'

    # Send a GET request to the server
    response = requests.get(url)

    # Check if the request was successful (status code 200)
    if response.status_code == 200:
        # Open a file to write the content locally (binary mode)
        with open('btc-usd-max.csv', 'wb') as file:
            file.write(response.content)  # Write the content to the file
        print('File downloaded successfully!')
    else:
        print('Failed to download the file. Status code:', response.status_code)

def convert_csv():
    # Read the original CSV
    df = pd.read_csv('btc-usd-max.csv')

    # Process the data
    output_data = []
    for idx, row in enumerate(df.itertuples(), start=1):
        # Parse the original timestamp
        dt = datetime.strptime(row.snapped_at, "%Y-%m-%d %H:%M:%S UTC")
        
        # Create the output row
        output_row = {
            'price_id': idx,
            'price_date': dt.strftime("%Y-%m-%d"),
            'price_time': dt.strftime("%H:%M:%S"),
            'price': row.price,
            'pred_price': 0.0  # Default value as shown in example
        }
        output_data.append(output_row)

    # Create new DataFrame
    output_df = pd.DataFrame(output_data)
    output_df = output_df.tail(30)    # days

    # Save to new CSV
    output_df.to_csv('btc_converted.csv', index=False)

    print("Conversion complete. Output saved to btc_converted.csv")

class CryptoPredictor:
    def __init__(self, config):
        required_keys = ['data_path', 'output_dir', 'test_size', 'validation_size', 
                        'look_back', 'epochs', 'batch_size', 'forecast_days']
        if not all(k in config for k in required_keys):
            raise ValueError(f"Config must contain all keys: {required_keys}")
        self.config = config
        self.load_data()
        
    def load_data(self):
        """Load and preprocess the data"""
        if not os.path.exists(self.config['data_path']):
            raise FileNotFoundError(f"Data file not found: {self.config['data_path']}")
        
        self.stock_data = pd.read_csv(
            self.config['data_path'],
            sep=',',
            index_col='price_date',
            parse_dates=['price_date'],
            date_parser=lambda dates: pd.to_datetime(dates, format='%Y-%m-%d')
        ).fillna(method='ffill').fillna(method='bfill')  # forward fill then backward fill
        
        if 'price' not in self.stock_data.columns:
            raise ValueError("Data file must contain 'price' column")
        
        # Basic preprocessing
        self.df_close = self.stock_data['price'].dropna()
        self.df_log = np.log(self.df_close)
        
        # Data validation checks
        html.append("<p>Data Summary: </p>")
        html.append("<p>Total data points: ")
        html.append(str(len(self.df_close)))
        html.append("</p>")

        # Plot raw data for visual inspection
        plt.figure(figsize=(12,6))
        plt.plot(self.stock_data['price'])
        plt.title('Raw BTC Price Data')
        plt.savefig(os.path.join(self.config['output_dir'], 'raw_data_check.png'))
        plt.close()
        html.append("<img src='raw_data_check.png' style='max-width:100%;'>")
        # html.append("<hr>")        
    
    def visualize_data(self):
        """Create initial visualizations of the raw data"""
        # Plot close price
        plt.figure(figsize=(12, 7))
        plt.grid(True)
        plt.xlabel('Date', fontsize=12)
        plt.ylabel('BTC Prices (log scale)', fontsize=12)
        plt.plot(self.df_log)
        plt.title('BTC Price History (Log Scale)', fontsize=14)
        plt.savefig(os.path.join(self.config['output_dir'], 'price_history.png'))
        plt.close()
        html.append("<img src='price_history.png' style='max-width:100%;'>")
        # html.append("<hr>")
        
        # Distribution of the dataset
        plt.figure(figsize=(10, 6))
        self.df_close.plot(kind='kde')
        plt.title('BTC Price Distribution')
        plt.savefig(os.path.join(self.config['output_dir'], 'price_distribution.png'))
        plt.close()
        html.append("<img src='price_distribution.png' style='max-width:100%;'>")
        # html.append("<hr>")
    
    def test_stationarity(self, timeseries):
        """Test for stationarity and plot rolling statistics"""
        ts = timeseries.copy().dropna()
        
        rolmean = ts.rolling(12).mean()
        rolstd = ts.rolling(12).std()
        
        plt.figure(figsize=(12, 7))
        plt.plot(ts, color='blue', label='Original')
        plt.plot(rolmean, color='red', label='Rolling Mean')
        plt.plot(rolstd, color='black', label='Rolling Std')
        plt.legend(loc='best')
        plt.title('Rolling Mean and Standard Deviation', fontsize=14)
        plt.savefig(os.path.join(self.config['output_dir'], 'rolling_stats.png'))
        plt.close()
        html.append("<img src='rolling_stats.png' style='max-width:100%;'>")
        html.append("<hr><br>")
        
        html.append("<p>Results of Dickey-Fuller Test: </p>")
        adft = adfuller(ts, autolag='AIC')
        output = pd.Series(adft[0:4], index=['Test Statistic', 'p-value', 'No. of lags used', 'Number of observations used'])
        for key, values in adft[4].items():
            output[f'critical value ({key})'] = values
        html.append("<p><center>")
        html.append(pd.DataFrame(output).to_html())
        html.append("</center></p>")
        html.append("<br><hr>")
        return adft[1]  # return p-value
    
    def decompose_series(self):
        """Decompose the time series into trend, seasonality and residuals"""
        try:
            result = seasonal_decompose(self.df_close.dropna(), model='additive', period=7)  # Weekly seasonality
            fig = result.plot()
            fig.set_size_inches(16, 9)
            fig.savefig(os.path.join(self.config['output_dir'], 'decomposition.png'))
            plt.close()
            html.append("<img src='decomposition.png' style='max-width:100%;'>")
            html.append("<hr>")
        except ValueError as e:
            html.append("<p>Could not decompose series: ")
            html.append(str(e))
            html.append("</p>")
    
    def prepare_data(self):
        """Split data into train, validation and test sets"""
        train_size = int(len(self.df_log) * (1 - self.config['test_size'] - self.config['validation_size']))
        val_size = int(len(self.df_log) * self.config['validation_size'])
        
        self.train_data = self.df_log[:train_size]
        self.val_data = self.df_log[train_size:train_size+val_size]
        self.test_data = self.df_log[train_size+val_size:]
        
        # Data validation
        html.append("<p>Data Split Summary:</p>")
        html.append("<p>Training data size: ")
        html.append(str(len(self.train_data)))
        html.append("<p>")
        html.append("<p>Validation data size: ")
        html.append(str(len(self.val_data)))
        html.append("<p>")
        html.append("<p>Test data size: ")
        html.append(str(len(self.test_data)))
        html.append("<p>")
        
        # Plot the split
        plt.figure(figsize=(12, 7))
        plt.grid(True)
        plt.xlabel('Dates', fontsize=12)
        plt.ylabel('Closing Prices (log scale)', fontsize=12)
        plt.plot(self.train_data, 'green', label='Train data')
        plt.plot(self.val_data, 'yellow', label='Validation data')
        plt.plot(self.test_data, 'blue', label='Test data')
        plt.legend(loc='upper left')
        plt.title('Train/Validation/Test Split', fontsize=14)
        plt.savefig(os.path.join(self.config['output_dir'], 'data_split.png'))
        plt.close()
        html.append("<img src='data_split.png' style='max-width:100%;'>")
        html.append("<hr>")
    
    def build_arima_model(self):
        """Build and evaluate ARIMA model"""
        html.append("<p>Building ARIMA Model...</p>")
        
        try:
            # Auto ARIMA to find best parameters
            model_autoARIMA = auto_arima(
                self.train_data.dropna(),
                start_p=0, start_q=0,
                test='adf',
                max_p=3, max_q=3,
                m=1, d=None, seasonal=False,
                start_P=0, D=0, trace=True,
                error_action='ignore',
                suppress_warnings=True,
                stepwise=True
            )
            
            html.append("<p><center>")            
            html.append(model_autoARIMA.summary().as_html())
            html.append("</center></p>")
            model_autoARIMA.plot_diagnostics(figsize=(15, 8))
            plt.savefig(os.path.join(self.config['output_dir'], 'arima_diagnostics.png'))
            plt.close()
            html.append("<img src='arima_diagnostics.png' style='max-width:100%;'>")
            html.append("<hr>")
            
            if not hasattr(model_autoARIMA, 'order'):
                html.append("<p>auto_arima failed to find optimal parameters</p>")
                return None
            
            # Build ARIMA model with best parameters
            order = model_autoARIMA.order
            html.append("<p>Using ARIMA order: ")
            html.append(str(order))
            html.append("</p>")
            
            self.arima_model = ARIMA(self.train_data.dropna(), order=order)
            self.arima_fitted = self.arima_model.fit()
            html.append("<p><center>")
            html.append(self.arima_fitted.summary().as_html())
            html.append("</center></p>")

            return order
            
        except Exception as e:
            html.append("<p>Failed to build ARIMA model: ")
            html.append(str(e))
            html.append("</p>")
            self.arima_fitted = None
            return None
    
    def evaluate_arima(self):
        """Evaluate ARIMA model on validation and test data"""
        if not hasattr(self, 'arima_fitted') or self.arima_fitted is None:
            html.append("<p>ARIMA model not fitted - skipping evaluation</p>")
            return {
                'val_rmse': None,
                'val_mae': None,
                'test_rmse': None,
                'test_mae': None
            }
        
        html.append("<p>Evaluating ARIMA Model...</p>")
        
        try:
            # Forecast on validation data
            val_forecast = self.arima_fitted.get_forecast(steps=len(self.val_data))
            val_fc = val_forecast.predicted_mean
            val_conf = val_forecast.conf_int()
            
            # Forecast on test data
            test_forecast = self.arima_fitted.get_forecast(steps=len(self.test_data))
            test_fc = test_forecast.predicted_mean
            test_conf = test_forecast.conf_int()
            
            # Calculate metrics
            val_rmse = math.sqrt(mean_squared_error(self.val_data, val_fc))
            val_mae = mean_absolute_error(self.val_data, val_fc)
            test_rmse = math.sqrt(mean_squared_error(self.test_data, test_fc))
            test_mae = mean_absolute_error(self.test_data, test_fc)
            
            html.append("<p>ARIMA Model Evaluation:</p>")
            html.append("<p>Validation RMSE: ")
            html.append(str(val_rmse))
            html.append("</p>")
            html.append("<p>Validation MAE: ")
            html.append(str(val_mae))
            html.append("</p>")
            html.append("<p>Test RMSE: ")
            html.append(str(test_rmse))
            html.append("</p>")
            html.append("<p>Test MAE: ")
            html.append(str(test_mae))
            html.append("</p>")
            
            # Plot forecasts
            plt.figure(figsize=(14, 8))
            plt.plot(self.train_data, label='Training Data')
            plt.plot(self.val_data, color='blue', label='Actual Validation Prices')
            plt.plot(val_fc, color='orange', label='Predicted Validation Prices')
            plt.fill_between(val_conf.index, val_conf.iloc[:, 0], val_conf.iloc[:, 1], color='k', alpha=.1)
            
            plt.plot(self.test_data, color='green', label='Actual Test Prices')
            plt.plot(test_fc, color='red', label='Predicted Test Prices')
            plt.fill_between(test_conf.index, test_conf.iloc[:, 0], test_conf.iloc[:, 1], color='k', alpha=.1)
            
            plt.title('ARIMA Model: Price Predictions', fontsize=16)
            plt.xlabel('Time', fontsize=12)
            plt.ylabel('Stock Price (log scale)', fontsize=12)
            plt.legend(loc='upper left', fontsize=10)
            plt.savefig(os.path.join(self.config['output_dir'], 'arima_predictions.png'))
            plt.close()
            html.append("<img src='arima_predictions.png' style='max-width:100%;'>")
            html.append("<hr>")

            return {
                'val_rmse': val_rmse,
                'val_mae': val_mae,
                'test_rmse': test_rmse,
                'test_mae': test_mae
            }
            
        except Exception as e:
            html.append("<p>Error in ARIMA evaluation: ")
            html.append(str(e))
            html.append("</p>")
            return {
                'val_rmse': None,
                'val_mae': None,
                'test_rmse': None,
                'test_mae': None
            }
    
    def prepare_lstm_data(self):
        """Prepare data for LSTM model"""
        # Scale the data
        self.scaler = MinMaxScaler(feature_range=(0, 1))
        scaled_data = self.scaler.fit_transform(self.df_close.values.reshape(-1, 1))
        
        # Create sequences for LSTM
        X, y = [], []
        for i in range(self.config['look_back'], len(scaled_data)):
            X.append(scaled_data[i-self.config['look_back']:i, 0])
            y.append(scaled_data[i, 0])
        
        X, y = np.array(X), np.array(y)
        X = np.reshape(X, (X.shape[0], X.shape[1], 1))
        
        # Split into train, validation, test
        train_size = int(len(X) * (1 - self.config['test_size'] - self.config['validation_size']))
        val_size = int(len(X) * self.config['validation_size'])
        
        self.X_train, self.y_train = X[:train_size], y[:train_size]
        self.X_val, self.y_val = X[train_size:train_size+val_size], y[train_size:train_size+val_size]
        self.X_test, self.y_test = X[train_size+val_size:], y[train_size+val_size:]
        
        html.append("<p>LSTM Data Shapes: </p>")
        html.append("<p>X_train: ")
        html.append(str(self.X_train.shape))
        html.append(", y_train: ")
        html.append(str(self.y_train.shape))
        html.append("</p>")
        html.append("<p>X_val: ")
        html.append(str(self.X_val.shape))
        html.append(", y_val: ")
        html.append(str(self.y_val.shape))
        html.append("</p>")
        html.append("<p>X_test: ")
        html.append(str(self.X_test.shape))
        html.append(", y_test: ")
        html.append(str(self.y_test.shape))
        html.append("</p>")
    
    def build_lstm_model(self):
        """Build and train LSTM model"""
        html.append("<p>Building LSTM Model...</>")
        
        try:
            self.lstm_model = Sequential()
            self.lstm_model.add(LSTM(units=50, return_sequences=True, input_shape=(self.X_train.shape[1], 1)))
            self.lstm_model.add(Dropout(0.2))
            self.lstm_model.add(LSTM(units=50, return_sequences=True))
            self.lstm_model.add(Dropout(0.2))
            self.lstm_model.add(LSTM(units=50))
            self.lstm_model.add(Dropout(0.2))
            self.lstm_model.add(Dense(units=1))
            
            self.lstm_model.compile(optimizer='adam', loss='mean_squared_error')
            
            history = self.lstm_model.fit(
                self.X_train, self.y_train,
                epochs=self.config['epochs'],
                batch_size=self.config['batch_size'],
                validation_data=(self.X_val, self.y_val),
                verbose=1
            )
            
            # Save the LSTM model
            self.lstm_model.save(os.path.join(self.config['output_dir'], 'lstm_model.h5'))
            
            # Plot training history
            plt.figure(figsize=(12, 6))
            plt.plot(history.history['loss'], label='Training Loss')
            plt.plot(history.history['val_loss'], label='Validation Loss')
            plt.title('LSTM Model Training History', fontsize=14)
            plt.xlabel('Epoch', fontsize=12)
            plt.ylabel('Loss', fontsize=12)
            plt.legend()
            plt.savefig(os.path.join(self.config['output_dir'], 'lstm_training.png'))
            plt.close()
            html.append("<img src='lstm_training.png' style='max-width:100%;'>")
            html.append("<hr>")

            return True
            
        except Exception as e:
            html.append("<p>Error building LSTM model: ")
            html.append(str(e))
            html.append("</p>")
            return False
    
    def evaluate_lstm(self):
        """Evaluate LSTM model"""
        if not hasattr(self, 'lstm_model'):
            html.append("<p>LSTM model not built - skipping evaluation</p>")
            return {
                'val_rmse': None,
                'val_mae': None,
                'test_rmse': None,
                'test_mae': None
            }
        
        html.append("<p>Evaluating LSTM Model...</p>")
        
        try:
            # Predict on validation and test sets
            val_predictions = self.lstm_model.predict(self.X_val)
            test_predictions = self.lstm_model.predict(self.X_test)
            
            # Inverse transform to original scale
            val_predictions = self.scaler.inverse_transform(val_predictions)
            y_val_actual = self.scaler.inverse_transform(self.y_val.reshape(-1, 1))
            test_predictions = self.scaler.inverse_transform(test_predictions)
            y_test_actual = self.scaler.inverse_transform(self.y_test.reshape(-1, 1))
            
            # Calculate metrics
            val_rmse = math.sqrt(mean_squared_error(y_val_actual, val_predictions))
            val_mae = mean_absolute_error(y_val_actual, val_predictions)
            test_rmse = math.sqrt(mean_squared_error(y_test_actual, test_predictions))
            test_mae = mean_absolute_error(y_test_actual, test_predictions)
            
            html.append("<p>LSTM Model Evaluation: </p>")
            html.append("<p>Validation RMSE: ")
            html.append(str(val_rmse))
            html.append("</p>")
            html.append("<p>Validation MAE: ")
            html.append(str(val_mae))
            html.append("</p>")
            html.append("<p>Test RMSE: ")
            html.append(str(test_rmse))
            html.append("</p>")
            html.append("<p>Test MAE: ")
            html.append(str(test_mae))
            html.append("</p>")
            
            # Plot predictions
            train_predict = self.lstm_model.predict(self.X_train)
            train_predict = self.scaler.inverse_transform(train_predict)
            train_actual = self.scaler.inverse_transform(self.y_train.reshape(-1, 1))
            
            # Prepare data for plotting
            train_plot = np.empty_like(self.df_close)
            train_plot[:] = np.nan
            train_plot[self.config['look_back']:self.config['look_back']+len(train_predict)] = train_predict.flatten()
            
            val_plot = np.empty_like(self.df_close)
            val_plot[:] = np.nan
            val_plot[len(train_actual)+self.config['look_back']:len(train_actual)+self.config['look_back']+len(val_predictions)] = val_predictions.flatten()
            
            test_plot = np.empty_like(self.df_close)
            test_plot[:] = np.nan
            test_plot[len(train_actual)+len(y_val_actual)+self.config['look_back']:len(train_actual)+len(y_val_actual)+self.config['look_back']+len(test_predictions)] = test_predictions.flatten()
            
            # Plot
            plt.figure(figsize=(14, 8))
            plt.plot(self.df_close, label='Actual Price')
            plt.plot(train_plot, label='Training Predictions')
            plt.plot(val_plot, label='Validation Predictions')
            plt.plot(test_plot, label='Test Predictions')
            plt.title('LSTM Model: Price Predictions', fontsize=16)
            plt.xlabel('Time', fontsize=12)
            plt.ylabel('Price', fontsize=12)
            plt.legend(loc='upper left')
            plt.savefig(os.path.join(self.config['output_dir'], 'lstm_predictions.png'))
            plt.close()
            html.append("<img src='lstm_predictions.png' style='max-width:100%;'>")
            html.append("<hr>")

            return {
                'val_rmse': val_rmse,
                'val_mae': val_mae,
                'test_rmse': test_rmse,
                'test_mae': test_mae
            }
            
        except Exception as e:
            html.append("<p>Error evaluating LSTM model: </p>")
            return {
                'val_rmse': None,
                'val_mae': None,
                'test_rmse': None,
                'test_mae': None
            }
    
    def forecast_future(self, days=30):
        """Forecast future prices using both models"""
        html.append("<p>Forecasting next 3 days...</p>")
        
        # Create future dates
        last_date = self.df_close.index[-1]
        future_dates = [last_date + timedelta(days=x) for x in range(1, days+1)]
        
        forecast_results = {}
        
        # ARIMA forecast if model exists
        if hasattr(self, 'arima_fitted') and self.arima_fitted is not None:
            try:
                arima_forecast = self.arima_fitted.get_forecast(steps=days)
                arima_fc = arima_forecast.predicted_mean
                arima_conf = arima_forecast.conf_int()
                
                forecast_results['ARIMA_Forecast'] = np.exp(arima_fc)
                forecast_results['ARIMA_Lower'] = np.exp(arima_conf.iloc[:, 0])
                forecast_results['ARIMA_Upper'] = np.exp(arima_conf.iloc[:, 1])
            except Exception as e:
                html.append("<p>ARIMA forecast failed: ")
                html.append(str(e))
                html.append("</p>")
                forecast_results['ARIMA_Forecast'] = [None] * days
                forecast_results['ARIMA_Lower'] = [None] * days
                forecast_results['ARIMA_Upper'] = [None] * days
        else:
            html.append("<p>ARIMA model not available for forecasting</p>")
            forecast_results['ARIMA_Forecast'] = [None] * days
            forecast_results['ARIMA_Lower'] = [None] * days
            forecast_results['ARIMA_Upper'] = [None] * days
        
        # LSTM forecast if model exists
        if hasattr(self, 'lstm_model'):
            try:
                lstm_input = self.df_close.values[-self.config['look_back']:]
                lstm_input = self.scaler.transform(lstm_input.reshape(-1, 1))
                
                lstm_predictions = []
                for _ in range(days):
                    x = lstm_input[-self.config['look_back']:].reshape(1, self.config['look_back'], 1)
                    pred = self.lstm_model.predict(x, verbose=0)
                    lstm_predictions.append(pred[0,0])
                    lstm_input = np.append(lstm_input, pred).reshape(-1, 1)
                
                lstm_predictions = self.scaler.inverse_transform(np.array(lstm_predictions).reshape(-1, 1))
                forecast_results['LSTM_Forecast'] = lstm_predictions.flatten()
            except Exception as e:
                html.append("<p>LSTM forecast failed: {str(e)}</p>")
                forecast_results['LSTM_Forecast'] = [None] * days
        else:
            html.append("<p>LSTM model not available for forecasting</p>")
            forecast_results['LSTM_Forecast'] = [None] * days
        
        # Plot forecasts
        plt.figure(figsize=(14, 8))
        plt.plot(self.df_close[-100:], label='Historical Prices')  # last 100 days
        
        # ARIMA plot if available
        if 'ARIMA_Forecast' in forecast_results and None not in forecast_results['ARIMA_Forecast']:
            plt.plot(future_dates, forecast_results['ARIMA_Forecast'], 'orange', label='ARIMA Forecast')
            plt.fill_between(
                future_dates,
                forecast_results['ARIMA_Lower'],
                forecast_results['ARIMA_Upper'],
                color='orange', alpha=0.1
            )
        
        # LSTM plot if available
        if 'LSTM_Forecast' in forecast_results and None not in forecast_results['LSTM_Forecast']:
            plt.plot(future_dates, forecast_results['LSTM_Forecast'], 'green', label='LSTM Forecast')
        
        plt.title(f'Future Price Forecast ({days} days)', fontsize=16)
        plt.xlabel('Date', fontsize=12)
        plt.ylabel('Price', fontsize=12)
        plt.legend(loc='upper left')
        plt.grid(True)
        plt.savefig(os.path.join(self.config['output_dir'], 'future_forecast.png'))
        plt.close()
        html.append("<img src='future_forecast.png' style='max-width:100%;'>")
        html.append("<hr>")

        # Create forecast DataFrame
        forecast_df = pd.DataFrame({
            'Date': future_dates,
            **forecast_results
        }).set_index('Date')
        
        # Save forecast to CSV
        forecast_df.to_csv(os.path.join(self.config['output_dir'], 'forecast_results.csv'))
        
        return forecast_df

    def run(self):
        """Execute the full pipeline"""
        html.append("<p>Starting cryptocurrency price prediction...</p>")
        
        # Step 1: Data visualization and analysis
        self.visualize_data()
        
        # Ensure no NaN values
        self.df_close = self.df_close.dropna()
        self.df_log = self.df_log.dropna()
        
        p_value = self.test_stationarity(self.df_close)
        html.append("<p>ADF test p-value:")
        html.append(str(p_value))
        html.append("</p>")
        
        if p_value > 0.05:
            html.append("<p>ADF test p-value great than 0.05</p>")
            html.append("<p>Series is not stationary - applying differencing: </p>")
            self.df_log = self.df_log.diff().dropna()
            p_value = self.test_stationarity(self.df_log.dropna())
        
        self.decompose_series()
        self.prepare_data()
        
        # Step 2: ARIMA modeling
        arima_success = self.build_arima_model() is not None
        arima_metrics = self.evaluate_arima() if arima_success else None
        
        # Step 3: LSTM modeling
        self.prepare_lstm_data()
        lstm_success = self.build_lstm_model()
        lstm_metrics = self.evaluate_lstm() if lstm_success else None
        
        # Step 4: Future forecasting
        forecast = self.forecast_future(self.config['forecast_days'])
        
        # Save metrics
        metrics = {
            'arima': arima_metrics,
            'lstm': lstm_metrics,
            'last_training_date': str(self.df_close.index[-1]),
            'forecast_days': self.config['forecast_days']
        }
        
        with open(os.path.join(self.config['output_dir'], 'metrics.json'), 'w') as f:
            json.dump(metrics, f, indent=4)
        
        html.append("<p>Prediction completed successfully!</p>")
        return forecast


# Execute the program
if __name__ == "__main__":
    try:
        scr_url = 'https://www.coingecko.com/price_charts/export/bitcoin/usd.csv'
        scrapping_data(scr_url)
        convert_csv()
        html_path = os.path.join(config['output_dir'], 'report.txt')
        html = [""]   # doc type <html><body> Initialize HTML page doc type html ... if standalone
        html.append("<h1>BTC CryptoCurrency Forecasting Report</h1>")
        html.append("<p>Report generated on: ")
        html.append(str(datetime.now()))
        html.append("</p>")
        predictor = CryptoPredictor(config)
        results = predictor.run()
        html.append("<p>Forecast Results: </p>")
        html.append("<p><center>")
        html.append(results.head().to_html())
        html.append("</center></p>")
        html.append("<br><br>")
        # html.append("</body></html>")
        with open(html_path, 'w') as f:
            f.write('\n'.join(html))
        print(f"HTML report saved to: {html_path}")
        
        concat = ""
        with open('report.html', 'w') as fout:
            for file in ('report1top.txt',html_path,'report2bottom.txt'):
                concat += open(file).read()
            fout.write(concat)
        fout.close()

    except Exception as e:
        print(f"\nError in main execution: {str(e)}")