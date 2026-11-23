#Pen-Pen (/root/penpen.sh)
#!/bin/bash
# Set DNS Resolver
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Install netcat-traditional
apt-get update
apt-get install -y netcat-traditional iptables

# Hentikan netcat lama jika ada
pkill -9 nc 2>/dev/null

# Listener Loop Port 80 (Welcome to Pen-Pen)
while true; do
    echo "Welcome to Pen-Pen" | nc -l -p 80 -q 1
done &

#Tokyo3-Core (/root/tokyo.sh)
#!/bin/bash
# Set DNS Resolver
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Install netcat-traditional
apt-get update
apt-get install -y netcat-traditional iptables

# Hentikan netcat lama jika ada
pkill -9 nc 2>/dev/null

# Listener Loop Port 80 (Welcome to Tokyo3-Core)
while true; do
    echo "Welcome to Tokyo3-Core" | nc -l -p 80 -q 1
done &

# Listener Loop Port 8080 (syifa imutz)
while true; do
    echo "syifa imutz" | nc -l -p 8080 -q 1
done &

#Testing
# 1. Tes Port 80 ke Pen-Pen
nc 10.73.3.194 80

# 2. Tes Port 80 ke Tokyo3-Core
nc 10.73.4.90 80

# 3. Tes Port 8080 ke Tokyo3-Core
nc 10.73.4.90 8080

# 4. Tes Port 22 (Tidak dilayani) ke Pen-Pen & Tokyo3-Core
nc -zv 10.73.3.194 22
nc -zv 10.73.4.90 22