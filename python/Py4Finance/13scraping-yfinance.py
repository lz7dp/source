import yfinance as yf

#
data = yf.Ticker("TSLA")
print(data.info)

#
print(data.info['profitMargins'])
print(data.info['returnOnEquity'])

#
# show dividends
print(data.dividends)

# show splits
print(data.splits)

# show balance sheet
print(data.balance_sheet)

# show cashflow
print(data.cashflow)

# show earnings
print(data.earnings)

#
x = data.earnings
print(x)

x.plot(kind="bar")
plt.savefig('plot.png')

