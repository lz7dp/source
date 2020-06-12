from machine import UART

uart = UART(1, 115200)                         # init with given baudrate
uart.init(115200, bits=8, parity=None, stop=1) # init with given parameters


uart.read()
uart.write('abc')





