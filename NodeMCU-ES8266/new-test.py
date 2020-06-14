
import time

#detach
#import uos
#uos.dupterm(None, 1)

#attach web
import uos, machine
#uart = machine.UART(0, 115200)
#uos.dupterm(uart, 1)

from machine import Pin
pin13 = Pin(13, Pin.IN)
pin15 = Pin(15, Pin.OUT)

from machine import UART
#uart = UART(0, baudrate=115200)
uart.init(baudrate=115200, bits=8, parity=None, stop=1, tx=pin15, rx=pin13)
while TRUE:
    uart.write('hello')
    stt1 = uart.read(5) # read up to 5 bytes
    print(str1)
