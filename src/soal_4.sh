#Gendou
# 1. Pasang IP statis ke eth0 yang searah subnet NAT1 GNS3
ip addr add 192.168.122.100/24 dev eth0
ip link set eth0 up

# 2. Tambahkan Default Route ke NAT1
ip route add default via 192.168.122.1 dev eth0

# 3. Set DNS Server
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 1.1.1.1" >> /etc/resolv.conf

# 4. Pasang Aturan NAT (MASQUERADE) untuk prefix kelompokmu (10.73.0.0/16)
iptables -t nat -A POSTROUTING -s 10.73.0.0/16 -o eth0 -j MASQUERADE

# 5. Pengujian
ping -c 3 8.8.8.8
ping -c 3 deb.debian.org

#lilith
# IP & Gateway Sementara (Soal 3 & 4)
ip addr flush dev eth0
ip addr add 10.73.4.58/29 dev eth0
ip link set eth0 up
ip route add default via 10.73.4.57 2>/dev/null

# Set DNS
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 1.1.1.1" >> /etc/resolv.conf

# Pengujian
ping -c 3 8.8.8.8
ping -c 3 deb.debian.org

#Armisael
# IP & Gateway Sementara (Soal 3 & 4)
ip addr flush dev eth0
ip addr add 10.73.4.67/29 dev eth0
ip link set eth0 up
ip route add default via 10.73.4.65 2>/dev/null

# Set DNS
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 1.1.1.1" >> /etc/resolv.conf

# Pengujian
ping -c 3 8.8.8.8
ping -c 3 deb.debian.org

#Pembuktian
iptables -t nat -L POSTROUTING -v -n