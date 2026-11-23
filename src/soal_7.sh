#Magi-Casper (/root/casper.sh)
#!/bin/bash
# Install paket iptables & netcat-traditional
apt-get update
apt-get install -y iptables netcat-traditional

# Jalankan listener netcat pada port 5000 di background
nc.traditional -l -p 5000 -k &

#Magi-Balthasar (/root/balthasar.sh)
#!/bin/bash
# Install paket iptables & netcat-traditional
apt-get update
apt-get install -y iptables netcat-traditional

# Jalankan listener netcat pada port 5000 dan 5001 di background
nc.traditional -l -p 5000 -k &
nc.traditional -l -p 5001 -k &

#Magi-Melchior (/root.melchior.sh)
#!/bin/bash
# Install paket iptables & netcat-traditional
apt-get update
apt-get install -y iptables netcat-traditional

# Jalankan listener netcat pada port 5000 di background
nc.traditional -l -p 5000 -k &

#Lilith (/root/lilith.sh)
#!/bin/bash
# Install paket iptables & netcat-traditional
apt-get update
apt-get install -y iptables netcat-traditional

#Testing
# Kirim pesan ke Magi-Casper (port 5000)
echo "Pesan dari Lilith untuk Casper" | nc 10.73.4.42 5000

# Kirim pesan ke Magi-Balthasar (port 5000 & 5001)
echo "Pesan dari Lilith untuk Balthasar (5000)" | nc 10.73.4.43 5000
echo "Pesan dari Lilith untuk Balthasar (5001)" | nc 10.73.4.43 5001

# Kirim pesan ke Magi-Melchior (port 5000)
echo "Pesan dari Lilith untuk Melchior" | nc 10.73.4.44 5000