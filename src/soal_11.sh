#!/bin/bash
# ============================================================
# SOAL 11 - Casper harus jadi hantu
# Tujuan: tidak ada yang boleh ping Casper (termasuk satu switch),
#         Casper tetap boleh ping keluar, TCP 5000 tetap hidup.
# ============================================================

# ------------------------------------------------------------
# BAGIAN A - PEMULIHAN PRASYARAT
# Hanya dijalankan jika lab pernah di-restart (rute/NAT hilang).
# "ip route replace" dipakai agar aman dijalankan berulang kali
# (tidak error "File exists").
# ------------------------------------------------------------

# --- Fuyutsuki ---
ip route replace default via 10.73.4.101
ip route replace 10.73.4.56/29 via 10.73.4.130
ip route replace 10.73.3.192/27 via 10.73.4.134

# --- Toji ---
ip route replace default via 10.73.4.129

# --- Misato ---
ip route replace default via 10.73.4.113

# --- Gendou (rute cabang Fuyutsuki & Misato + NAT) ---
ip route replace 10.73.4.40/29 via 10.73.4.102
ip route replace 10.73.4.56/29 via 10.73.4.102
ip route replace 10.73.3.192/27 via 10.73.4.102
ip route replace 10.73.4.128/29 via 10.73.4.102
ip route replace 10.73.4.48/29 via 10.73.4.114
iptables -t nat -C POSTROUTING -s 10.73.0.0/16 -o eth0 -j MASQUERADE 2>/dev/null || \
iptables -t nat -A POSTROUTING -s 10.73.0.0/16 -o eth0 -j MASQUERADE

# ------------------------------------------------------------
# BAGIAN B - KONFIGURASI UTAMA SOAL 11 (di Magi-Casper)
# ------------------------------------------------------------

# --- Magi-Casper ---
# 1. DNS (resolv.conf sempat kosong)
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 1.1.1.1" >> /etc/resolv.conf

# 2. Pasang netcat-traditional (nc.traditional)
apt-get update
apt-get install -y netcat-traditional

# 3. Listener TCP 5000 (loop agar hidup lagi setelah tiap koneksi)
pkill -f "nc.traditional -l -p 5000" 2>/dev/null
while true; do nc.traditional -l -p 5000; done &

# 4. Aturan hantu: buang HANYA permintaan ping yang masuk.
#    Ping keluar dari Casper tetap jalan karena balasannya echo-reply.
iptables -C INPUT -p icmp --icmp-type echo-request -j DROP 2>/dev/null || \
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

# ------------------------------------------------------------
# PENGUJIAN
# ------------------------------------------------------------
# Magi-Casper:
iptables -S
ss -tln
# Magi-Balthasar (harus GAGAL, 100% packet loss):
ping -c 3 10.73.4.42
# Lilith (harus GAGAL, 100% packet loss):
ping -c 3 10.73.4.42
# Lilith (TCP 5000 harus berhasil, exit code 0):
echo "Casper masih hidup di port 5000" | nc -w 3 10.73.4.42 5000
echo "exit code: $?"
# Magi-Casper (harus BERHASIL, 3 received):
ping -c 3 10.73.4.43
ping -c 3 10.73.4.58
# Magi-Casper (counter DROP harus naik setelah ada ping dari luar):
iptables -L INPUT -n -v