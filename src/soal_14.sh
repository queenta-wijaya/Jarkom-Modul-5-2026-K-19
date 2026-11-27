#!/bin/bash
# ============================================================
# SOAL 14 - Jam kunjungan sang pinguin
# Mesin utama: Pen-Pen
#
# Pilot:
#   08.00-16.00 WIB
#   Senin-Jumat
#
# Staf Geofront:
#   17.00-23.00 WIB
#   Setiap hari
#
# iptables menggunakan UTC.
# WIB = UTC+7.
# ============================================================

# ============================================================
# BAGIAN A - PEMULIHAN PRASYARAT
# Jalankan hanya jika lab restart dan rute hilang.
# ============================================================

# --- Gendou ---
ip route replace 10.73.4.48/29 via 10.73.4.114
ip route replace 10.73.4.56/29 via 10.73.4.102
ip route replace 10.73.3.192/27 via 10.73.4.102
ip route replace 10.73.4.84/30 via 10.73.4.106

# --- Misato ---
ip route replace 10.73.4.48/29 dev eth0 scope link src 10.73.4.49
ip route replace default via 10.73.4.113

# --- Toji ---
ip route replace default via 10.73.4.129

# --- Fuyutsuki ---
ip route replace default via 10.73.4.101
ip route replace 10.73.4.56/29 via 10.73.4.130
ip route replace default via 10.73.4.101 dev eth1
ip route replace 10.73.3.192/27 via 10.73.4.134 dev eth3
ip route replace 10.73.4.56/29 via 10.73.4.130 dev eth2

# --- Kaji ---
ip route replace default via 10.73.4.105

# --- Maya ---
ip route replace default via 10.73.4.133 dev eth1


# ============================================================
# BAGIAN B - SCRIPT UTAMA PEN-PEN
# Jalankan di Pen-Pen.
# ============================================================

PILOT_START="01:00:00"
PILOT_STOP="09:00:00"
PILOT_DAYS="Mon,Tue,Wed,Thu,Fri"

STAF_START="10:00:00"
STAF_STOP="16:00:00"

echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 1.1.1.1" >> /etc/resolv.conf

apt-get update
apt-get install -y netcat-traditional iptables

pkill -9 nc 2>/dev/null

# Listener port 80
while true; do
    echo "Welcome to Pen-Pen" | nc -l -p 80 -q 1
done &

# Chain khusus Pen-Pen
iptables -N PENPEN_VISITS 2>/dev/null || true
iptables -F PENPEN_VISITS

iptables -C INPUT -j PENPEN_VISITS 2>/dev/null || \
iptables -I INPUT 1 -j PENPEN_VISITS

# Pilot: Unit-01, Unit-02, Unit-00
iptables -A PENPEN_VISITS -s 10.73.4.48/29 \
    -p icmp --icmp-type echo-request \
    -m time --timestart "$PILOT_START" \
    --timestop "$PILOT_STOP" \
    --weekdays "$PILOT_DAYS" -j ACCEPT

iptables -A PENPEN_VISITS -s 10.73.4.48/29 \
    -p icmp --icmp-type echo-request -j REJECT

iptables -A PENPEN_VISITS -s 10.73.4.48/29 \
    -p tcp --dport 80 \
    -m time --timestart "$PILOT_START" \
    --timestop "$PILOT_STOP" \
    --weekdays "$PILOT_DAYS" -j ACCEPT

iptables -A PENPEN_VISITS -s 10.73.4.48/29 \
    -p tcp --dport 80 -j REJECT

# Staf Geofront: Lilith dan Adam
iptables -A PENPEN_VISITS -s 10.73.4.58/31 \
    -p icmp --icmp-type echo-request \
    -m time --timestart "$STAF_START" \
    --timestop "$STAF_STOP" -j ACCEPT

iptables -A PENPEN_VISITS -s 10.73.4.58/31 \
    -p icmp --icmp-type echo-request -j REJECT

iptables -A PENPEN_VISITS -s 10.73.4.58/31 \
    -p tcp --dport 80 \
    -m time --timestart "$STAF_START" \
    --timestop "$STAF_STOP" -j ACCEPT

iptables -A PENPEN_VISITS -s 10.73.4.58/31 \
    -p tcp --dport 80 -j REJECT

# Dummy System: Dummy-Plug, Entry-Plug, Spy
for IP in 10.73.4.37 10.73.4.34 10.73.4.86; do
    iptables -A PENPEN_VISITS -s "$IP" \
        -p icmp --icmp-type echo-request -j REJECT

    iptables -A PENPEN_VISITS -s "$IP" \
        -p tcp --dport 80 -j REJECT
done

# Node lain bebas
iptables -A PENPEN_VISITS -j RETURN

# ============================================================
# BAGIAN C - PEMBUKTIAN PEN-PEN
# ============================================================

# --- Pen-Pen ---
date -u
ss -tln
iptables -L PENPEN_VISITS -n -v --line-numbers

# ============================================================
# BAGIAN D - UJI JADWAL COCOK
# Untuk uji, ubah variabel sementara agar mencakup jam sekarang.
# ============================================================

# --- Unit-01, Pilot: harus berhasil saat jadwal cocok ---
ping -c 2 10.73.3.194
nc -w 3 10.73.3.194 80

# --- Lilith, Staf: harus berhasil saat jadwal cocok ---
ping -c 2 10.73.3.194
nc -w 3 10.73.3.194 80

# --- Spy, Dummy System: harus selalu ditolak ---
ping -c 2 10.73.3.194
nc -v -w 3 10.73.3.194 80
echo "exit code: $?"

# ============================================================
# BAGIAN E - UJI DI LUAR JADWAL
# Di Pen-Pen, ubah sementara jadwal menjadi 19.00-20.00 UTC.
# ============================================================

# Jalankan di Pen-Pen:
# sed -i \
#   -e 's/^PILOT_START=.*/PILOT_START="19:00:00"/' \
#   -e 's/^PILOT_STOP=.*/PILOT_STOP="20:00:00"/' \
#   -e 's/^STAF_START=.*/STAF_START="19:00:00"/' \
#   -e 's/^STAF_STOP=.*/STAF_STOP="20:00:00"/' \
#   /root/penpen.sh
#
# source <(sed -n '2,6p; /^# Chain khusus Pen-Pen/,$p' /root/penpen.sh)

# --- Unit-01 di luar jadwal ---
# ping -c 2 10.73.3.194
# nc -v -w 3 10.73.3.194 80
# echo "exit code: $?"

# --- Lilith di luar jadwal ---
# ping -c 2 10.73.3.194
# nc -v -w 3 10.73.3.194 80
# echo "exit code: $?"

# ============================================================
# BAGIAN F - KEMBALIKAN JADWAL RESMI
# ============================================================

# Jalankan kembali di Pen-Pen:
# PILOT_START="01:00:00"
# PILOT_STOP="09:00:00"
# PILOT_DAYS="Mon,Tue,Wed,Thu,Fri"
# STAF_START="10:00:00"
# STAF_STOP="16:00:00"