import socket

choice = input("1) start the server, 2) connect with client >")

if choice == '1':
    #Create socket object
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    #Bind it to an address
    server_socket.bind(('0.0.0.0', 8086))
    print("Waiting for connection...")
    server_socket.listen()
    connection, address = server_socket.accept()
    print("Connection detected at... " + str(address))
else:
    address = input("What is the servers IP address? >")
    connection = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    connection.connect((address, 8086))
    name = input("What should we call you?")
    connection.send(bytes(name + " connected to the server", 'utf-8'))

while True:
    message = connection.recv(1024)
    print(message.decode())
    new_message = input("Type a message >")
    connection.send(new_message.encode())