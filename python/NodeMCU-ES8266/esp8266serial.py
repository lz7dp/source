# my esp8266 serial communication
# 14.06.2020
#

import time

#detach
import uos
uos.dupterm(None, 1)

#attach web
import machine
#uos.dupterm(uart, 1)

from machine import Pin
pin13 = Pin(13, Pin.IN)
pin15 = Pin(15, Pin.OUT)

from machine import UART
uart = UART(1, baudrate=115200)
uart.init(baudrate=115200, bits=8, parity=None, stop=1, tx=pin15, rx=pin13)
##
#u2=machine.UART(1, baudrate=115200, rx=pin13, tx=pin15, timeout=10)
#u2.write("Hello, World!\n")
#print(u2.readline())

while True:
    uart.write('hello')
    str1 = uart.read(5) # read up to 5 bytes
    print(str1)

#EOF
