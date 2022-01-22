import yfinance as yf

data = yf.Ticker('TSLA')

print(data.history())

print(data.history(period='5d'))

print(data.history(start="2021-01-01", end="2021-06-30"))

###

import yfinance as yf
import matplotlib.pyplot as plt

data = yf.Ticker('TSLA')

x = data.history()['Close']
x.plot()

plt.savefig('plot.png')

###

import yfinance as yf
import matplotlib.pyplot as plt

data = yf.download("AAPL MSFT TSLA", start='2021-01-01') 
print(data['Close'])

###

import yfinance as yf
import matplotlib.pyplot as plt

data = yf.download("AAPL MSFT TSLA", start='2021-01-01') 
data['Close'].plot()

plt.savefig('plot.png')