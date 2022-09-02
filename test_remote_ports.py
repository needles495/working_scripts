import socket

TEST_IP = "127.0.0.1"
#UDP_PORT = 65001
TEST_PORTs = [8443, 80, 443]
MESSAGE = b"Hello, World!"

#Main:
#print("UDP target IP: %s" % UDP_IP)
#print("UDP target port: %s" % UDP_PORT)
#print("message: %s" % MESSAGE)
#sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
#sock.sendto(MESSAGE, (UDP_IP, UDP_PORT))

for TEST_PORT in TEST_PORTs:
    #TCP:
    print("TCP target IP: %s" % TEST_IP)
    print("TCP target port: %s" % TEST_PORT)
    sock_tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock_tcp.connect_ex((TEST_IP, TEST_PORT))
    #UDP:
    print("UDP target IP: %s" % TEST_IP)
    print("UDP target port: %s" % TEST_PORT)
    sock_udp = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock_udp.sendto(MESSAGE, (TEST_IP, TEST_PORT))
