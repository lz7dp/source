import socket
from my_helper import *

# Start client
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((SERVER_ADDR, PORT))

print(f'Connected to server ({SERVER_ADDR})')

# Get a message from the server
line = 0
for message in (get_text(client_socket)):
    if line == 0:
        # The message starts with the line count
        lines = int(message)
    else:
        print(f'Received: {message}')
        if line == lines:
            # Stop getting lines when the line count is reached
            break
    line += 1

# Tell the server we've got the message
message = 'Client got all lines & now closing'
data = message.encode()
send_text(client_socket, message)

# All done ...
client_socket.close()