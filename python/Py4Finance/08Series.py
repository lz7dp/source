import pandas as pd

prices = [42.8, 102.03, 240.38, 80.9] 
s = pd.Series(prices) 
print(s)

print(s.describe()) 