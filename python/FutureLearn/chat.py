import threading
import time
# server_sock_03.py
import socket

socket_number = 8081
default_ip = "127.0.0.1"

def send_text(sending_socket, text):
    text = text + "\n"
    data = text.encode()
    sending_socket.send(data)

def get_text(receiving_socket):
    buffer = ""

    socket_open = True
    while socket_open:
        # read any data from the socket
        data = receiving_socket.recv(1024)

        # if no data is returned the socket must be closed
        if not data:
            socket_open = False

        # add the data to the buffer
        buffer = buffer + data.decode()

        # is there a terminator in the buffer
        terminator_pos = buffer.find("\n")
        # if the value is greater than -1, a \n must exist
        while terminator_pos > -1:
            # get the message from the buffer
            message = buffer[:terminator_pos]
            # remove the message from the buffer
            buffer = buffer[terminator_pos + 1:]
            # yield the message (see below)
            yield message
            # is there another terminator in the buffer
            terminator_pos = buffer.find("\n")

def send_thread():
    send_data = ""
    while True:
        send_data = send_data + input("-")
        print(send_data)
        send_data = ""
    return

def receive_thread():
    while True:
        message = next(get_text(client_socket))
        print(message)
        print("->", end="", flush = True)
    return
####### MAIN #######
ans = ""
while ans.casefold() not in ('c', 's'):
    ans = input("Are you server or client? (S/C): ")
if (ans.casefold() == 's'):
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind(("0.0.0.0", socket_number))
    server_socket.listen()
    print("Waiting for connection")
    client_socket, address = server_socket.accept()
    print("Client connected")
    message = "Hello, thanks for connecting"
    send_text(client_socket, message)

if (ans.casefold() == 'c'):
    ip_address = input("Enter IP address to connect to (127.0.0.1): ")
    if ip_address == "":
        ip_address = default_ip
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client_socket.connect((ip_address, socket_number))

# start threads by passing function to Thread constructor
t_receive = threading.Thread(target=receive_thread)
t_receive.start()
#tOut = threading.Thread(target=out_thread)
#tOut.start()

while True:
    send_text(client_socket, input("->"))