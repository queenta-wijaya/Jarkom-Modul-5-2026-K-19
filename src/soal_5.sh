#Gendou
# 1. Pastikan IP forwarding tetap aktif (Soal 2)
sysctl -w net.ipv4.ip_forward=1

# 2. Reset / Flush aturan filter lama agar bersih
iptables -F
iptables -X

# 3. Ubah Default Policy INPUT dan FORWARD menjadi DROP
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# 4. Izinkan Interface Loopback (lo)
iptables -A INPUT -i lo -j ACCEPT

# 5. Izinkan DHCP dari NAT1 (UDP port 67/68 di eth0)
iptables -A INPUT -i eth0 -p udp --dport 68 --sport 67 -j ACCEPT

# 6. Poin (a): Izinkan balasan koneksi yang sudah ada (ESTABLISHED, RELATED)
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# 7. Poin (b): Izinkan trafik dari jaringan internal ke internet (outward via eth0)
iptables -A FORWARD -s 10.73.0.0/16 -o eth0 -j ACCEPT

# 8. Poin (c): Izinkan trafik antar-LAN internal
iptables -A FORWARD -s 10.73.0.0/16 -d 10.73.0.0/16 -j ACCEPT

# 9. Poin (d): Izinkan trafik dari jaringan internal ke Gendo sendiri
iptables -A INPUT -s 10.73.0.0/16 -j ACCEPT

# 10. Pastikan NAT MASQUERADE tetap terpasang (Soal 4)
iptables -t nat -F POSTROUTING
iptables -t nat -A POSTROUTING -s 10.73.0.0/16 -o eth0 -j MASQUERADE

#Testing
#Gendou
iptables -S
#Armisael
ping -c 4 8.8.8.8
ping -c 2 10.73.4.58