#Perbaikan Misato (fix_nat.sh)
cat > /root/fix_nat.sh << 'EOF'
#!/bin/bash
while iptables -t nat -D POSTROUTING -s 10.73.4.48/29 ! -d 10.73.0.0/16 -o eth1 -j SNAT --to-source 172.31.99.1 2>/dev/null; do :; done
echo "=== NAT Misato setelah perbaikan ==="
iptables -t nat -L POSTROUTING -n -v --line-numbers
EOF
chmod +x /root/fix_nat.sh
/root/fix_nat.sh

#Perbaikan Gendou (fix_nat.sh)
cat > /root/fix_nat.sh << 'EOF'
#!/bin/bash
while iptables -t nat -D POSTROUTING -s 10.73.4.48/29 -o eth0 -j RETURN 2>/dev/null; do :; done
iptables -t nat -C POSTROUTING -s 10.73.0.0/16 -o eth0 -j MASQUERADE 2>/dev/null || \
iptables -t nat -A POSTROUTING -s 10.73.0.0/16 -o eth0 -j MASQUERADE
echo "=== NAT Gendo setelah perbaikan ==="
iptables -t nat -L POSTROUTING -n -v --line-numbers
EOF
chmod +x /root/fix_nat.sh
/root/fix_nat.sh

#Testing di Unit-01 dan Spy
ping -c 3 8.8.8.8
#Ping Lilith dari Unit-01
ping 10.73.4.58