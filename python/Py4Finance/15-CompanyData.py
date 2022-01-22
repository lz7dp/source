import yfinance as yf

data = yf.Ticker("TSLA")

x = data.recommendations
x = x[x.index > '2021-06-01']
print(x)