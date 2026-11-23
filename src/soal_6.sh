#Misato
sysctl -w net.ipv4.ip_forward=1
ip addr add 10.73.4.114/30 dev eth1 2>/dev/null
ip link set eth1 up

ip addr flush dev eth0
ip link set eth0 down
ip link set eth0 up
ip addr add 10.73.4.49/29 dev eth0

#UNIT-01
ip neigh flush all
arping -c 3 -I eth0 10.73.4.49
ip addr flush dev eth0
ip link set eth0 down
ip link set eth0 up
ip addr add 10.73.4.50/29 dev eth0
ip route replace default via 10.73.4.49

ping -c 4 10.73.4.49
ip -br a