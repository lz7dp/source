#sender
from PIL import Image
from random import randint
import pickle
import socket

udp_client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

image = Image.open("image.bmp")

width, height = image.size

print(width,height)
pixels_lost = 0
for y in range(height):
    for x in range(width):
        pos = (x,y)
        rgba = image.getpixel(pos)
        print(pos,rgba)
        message = (pos,rgba)
        data = pickle.dumps(message)
        if randint(0,10)>0:
          udp_client.sendto(data,("127.0.0.1",20001))
        else:
          pixels_lost += 1
print(pixels_lost)