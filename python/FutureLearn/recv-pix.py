from fl_networking_tools import ImageViewer
import socket
import pickle

def get_pixel_data():
  lost_pixels = 0
  last_pixel_updated = (-1, -1)
  while True:
    data, client_address = udp_server.recvfrom(1024)
    message = pickle.loads(data)
    pos  = message[0]
    rgba = message[1]
    viewer.put_pixel(pos,rgba)
    if (pos[0] - last_pixel_updated[0] > 1) or (pos[1] - last_pixel_updated[1] > 1):
      lost_pixels += 1
      viewer.text = lost_pixels
      print(lost_pixels)
    print(lost_pixels)
    last_pixel_updated = pos



viewer = ImageViewer()

udp_server = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
udp_server.bind(("0.0.0.0",20001))

viewer.start(get_pixel_data)