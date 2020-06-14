
import time

#detach
#import uos
#uos.dupterm(None, 1)

#attach web
import uos, machine
#uart = machine.UART(0, 115200)
#uos.dupterm(uart, 1)

from machine import Pin
#pin4 = Pin(4, Pin.IN)
#pin5 = Pin(5, Pin.OUT)

from machine import UART
uart = UART(0, baudrate=115200)
uart.write('hello')
uart.read(5) # read up to 5 bytes

