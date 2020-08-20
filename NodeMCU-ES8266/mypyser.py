import serial
 
ser = serial.Serial()
ser.baudrate = 115200
ser.port = '/dev/ttyUSB0'
ser.open()
 
values = 'pong' 
ser.write(values)
 
total = 0
 
while total < len(values):
    print ord(ser.read(1))
    total=total+1
 
ser.close()

