import numpy_financial as npf

#future
res = npf.fv(rate=0.08, nper=5, pmt=0, pv=-1000)
print(res)

#present
res = npf.pv(rate = 0.10, nper=8, pmt=0, fv=1000)
print(res)