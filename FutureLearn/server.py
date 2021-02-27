import socket
from my_helper import *

# Start server
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind((SERVER_BIND_ADDR, PORT))
server_socket.listen()

print('Waiting for connection ...')

connection_socket, address = server_socket.accept()

print(f'Got a connection on address: {address}')

# Send a message to the client
lines = []
lines.append('Hi Ya Timmi !!')
lines.append("G'Day Sal :)")
lines.append('Morning Tim ...')
# Add a line count to the start of the message
lines.insert(0, str(len(lines)))
message = TERMINATOR.join(lines)

send_text(connection_socket, message)

# Wait on client response
data = connection_socket.recv(BUFFER_SIZE)
message = data.decode()

print(f'Received: {message}')

# All done ...
connection_socket.close()
server_socket.close()