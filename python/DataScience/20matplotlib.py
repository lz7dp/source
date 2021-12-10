import numpy as np
import matplotlib.pyplot as plt
fig = plt.figure()
ax = plt.axes()
plt.savefig('fig.png')
plt.show()

#
x = np.linspace(0,10,1000) # x is a 1000 evenly spaced numbers from 0 to 10
y = np.sin(x)
fig = plt.figure()
ax = plt.axes()
ax.plot(x, y)
plt.savefig("plot.png")
plt.show()

#
plt.plot(x, y)
plt.xlabel('x')
plt.ylabel('y')
plt.title('function sin(x)')
plt.savefig("plot.png")
plt.show()

#
x = np.linspace(0,10,1000) # 1darray of length 1000
y = np.sin(x)
plt.plot(x, np.sin(x))
plt.plot(x, np.cos(x))
plt.savefig("plot.png")
plt.show()

#
x = np.linspace(0,10,1000) # 1darray of length 1000
y = np.sin(x)
plt.plot(x, np.sin(x), color='k')
plt.plot(x, np.cos(x), color='r', linestyle ='--')
plt.savefig("plot.png")
plt.show()

#
x = np.linspace(0,10,1000) # 1darray of length 1000
y = np.sin(x)
plt.plot(x, np.sin(x), 'k:', label='sin(x)')
plt.plot(x, np.cos(x), 'r--', label='cos(x)')
plt.legend()
plt.savefig("plot.png")
plt.show()
