# Helper functions & common variables for my Client/Server
SERVER_ADDR = '127.0.0.1'
SERVER_BIND_ADDR = '0.0.0.0'
PORT = 1066

TERMINATOR = '\n'
BUFFER_SIZE = 512

# Send a message from a socket
def send_text(sending_socket, text):
    text += TERMINATOR
    data = text.encode()
    sending_socket.send(data)

# Receive a message on a socket
def get_text(receiving_socket):
    buffer = ''

    socket_open = True
    while socket_open:
        # Read any data from the socket
        data = receiving_socket.recv(BUFFER_SIZE)
        # Close socket if no data available
        if not data:
            socket_open = False
        # Add any data to the buffer
        buffer += data.decode()
        # Check for the terminator
        terminator_pos = buffer.find(TERMINATOR)
        while terminator_pos > -1:
            # Get the message
            message = buffer[:terminator_pos]
            # Remove message from the buffer
            buffer = buffer[terminator_pos+1:]
            # To do - Investigate 'yield' ...
            yield(message)
            # Check for another message
            terminator_pos = buffer.find(TERMINATOR)