import numpy_financial as npf

# loan of 100,000 in 5 years. The yearly interest rate is 7%, and is calculated monthly.
# set the rate and periods (nper) in months. The pv parameter shows the present value of the loan,
# while the fv shows the future value we want to achieve. 
res = npf.pmt(rate=0.07/12, nper=5*12, pv=100000, fv=0) 
print(res)

# monthly mortgage payment, the pmt()
# The code will return the monthly deposits needed to achieve 50000 in 5 years with 10% annual interest. 
res = npf.pmt(rate=0.10/12, nper=5*12, pv=0, fv=50000) 
print(res)
