#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Feb 27 16:13:28 2020
@author: beppe
Networking Python: Import the API and create a socket client side for
communicate over a network. Client side.
"""
import socket

client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect(("127.0.0.1", 8081))
print("Connected.")

data = client_socket.recv(1024) # max bytes readable at one time
message = data.decode()
print("Received:", message)

request = "I have a request for you."
data_out = request.encode()
client_socket.send(data_out)
print("Send:", request)

print("End of request, closing client.")
client_socket.close()