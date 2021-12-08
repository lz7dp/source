import numpy_financial as npf

cashflow = [-5000, 500, 700, 1000, 3000]
print(npf.irr(cashflow))

#Numpy Financial has an irr() function, used to calculate the IRR (Internal Rate of Return).
#Let's assume we invested 5000 and got the following payments back: 500, 700, 1000, 3000.
#To calculate the IRR, we first need to declare an array with the values, with the first value being our initial investment.