from machine import UART
import time

uart = UART(0, 115200)                         # init with given baudrate
uart.init(115200, bits=8, parity=None, stop=1) # init with given parameters

#def myser():
    #uart.read()
    mybyte = 134
    while TRUE
        uart.write(mybyte)
        time.sleep(100)




