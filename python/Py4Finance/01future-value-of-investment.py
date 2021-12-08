import numpy_financial as npf
res = npf.fv(rate=0.08, nper=5, pmt=0, pv=-1000)
print(res)