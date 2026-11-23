#Perbaikan Shigeru (shigeru.sh)
#!/bin/bash
# 1. Aktifkan kembali IP forwarding
sysctl -w net.ipv4.ip_forward=1

# 2. Hapus ip rule dan tabel 100 yang memblokir trafik
ip rule del iif eth0 lookup 100 priority 90 2>/dev/null
ip route flush table 100 2>/dev/null

# 3. Hapus blackhole route yang dibuat script sabotase
ip route del blackhole 10.73.4.72/29 2>/dev/null
ip route del blackhole 10.73.4.64/29 2>/dev/null

# 4. Kembalikan default route Shigeru ke Gendo (eth2: 10.73.4.93)
ip route replace default via 10.73.4.93 dev eth2

# 5. Pastikan rute statis ke bawah (Makoto / Radar) tetap ada
ip route add 10.73.4.72/29 via 10.73.4.154 dev eth1 2>/dev/null

#Testing Lilith -> Armisael
ping -c 4 10.73.4.67