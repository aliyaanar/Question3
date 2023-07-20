import socket

def main():
    server_address = "10.0.2.15"
    server_port = 8080

    # Create a TCP socket
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # Connect to the server
    client_socket.connect((server_address, server_port))

    # Get pressure value from user in bar
    pressure_bar = float(input("Enter pressure value in bar: "))

    # Send the pressure value to the server
    client_socket.send(str(pressure_bar).encode())

    # Receive converted value from the server
    atmosphere_standard = float(client_socket.recv(1024).decode())
    print("Atmosphere-standard value received:", atmosphere_standard)

    # Close the client socket
    client_socket.close()

if __name__ == "__main__":
    main()
