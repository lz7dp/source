#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Feb 26 23:13:20 2020
@author: beppe
Networking Python: Import the API and create a socket for communicate over a
network. Server side part.
"""
import socket

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind(("0.0.0.0", 8081))
server_socket.listen()
print("Waiting for connection.")
connection_socket, address = server_socket.accept()

print("Client connected.")
message = "Hello, thanks for connecting."
data = message.encode()         # encode data before sending
connection_socket.send(data)
print("Send:", message)

data_in = connection_socket.recv(1024)
request = data_in.decode()
print("Received:", request)

print("End of service, closing server.")
connection_socket.close()
server_socket.close()