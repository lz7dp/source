import numpy_financial as npf

cf1 = [-50000, 10000, 25000, 25000, 35000, 42000]
cf2 = [-30000, 10000, 13000, 18000, 25000, 20000]

print("Option 1: ", npf.irr(cf1))
print("Option 2: ", npf.irr(cf2)) 