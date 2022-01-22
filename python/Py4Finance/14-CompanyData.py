import yfinance as yf

data = yf.Ticker("TSLA")

print(data.major_holders)

###

print(data.institutional_holders)

###

import yfinance as yf

def RoE(ticker):
    data = yf.Ticker(ticker)
    roe = data.info['returnOnEquity']
    name = data.info['shortName']
    print(name, ":", roe)

RoE('AAPL')
RoE('MSFT')