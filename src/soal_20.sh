#!/bin/bash
# ============================================================
# BABAK FINAL NOMOR 2 - Uji kebakaran Geofront
# Tiga node: Gendou (router), Shigeru (router), Magi-Balthasar (host).
# Per node: simpan rule (iptables-save) ke /root/<nama>.rules,
# simpan rute buatan sendiri di /root/<nama>.sh, hapus semuanya
# ("kebakaran"), lalu pulihkan DUA KALI berturut-turut.
# Hasil: jumlah baris iptables -S dan iptables -t nat -S sama,
# rule/rute tidak dobel, node berfungsi lagi.
#
# CATATAN: script ini berisi perintah untuk BEBERAPA mesin.
# Jalankan tiap bagian di terminal mesin yang tertulis di judulnya
# (jangan dijalankan sekaligus di satu mesin).
# Rute yang dihapus hanya rute buatan sendiri (tanpa "proto kernel"
# dan bukan default DHCP 192.168.122.1 di Gendou).
# ============================================================

# ------------------------------------------------------------
# BAGIAN 0 - PRASYARAT (hanya jika lab pernah di-restart)
# ------------------------------------------------------------
# --- Misato (supaya Unit-01 bisa keluar lewat Gendou) ---
ip route replace 10.73.4.48/29 dev eth0 scope link src 10.73.4.49
ip route replace default via 10.73.4.113

# --- Magi-Balthasar: aturan soal 13 harus sudah ada sebelum iptables-save ---
nc -lk 5000 >/dev/null 2>&1 &
nc -lk 5001 >/dev/null 2>&1 &
iptables -A INPUT -p tcp -s 10.73.4.42 -m multiport --dports 5000,5001 -j ACCEPT
iptables -A INPUT -p tcp -s 10.73.4.48/29 -m multiport --dports 5000,5001 -j ACCEPT
iptables -A INPUT -p tcp -m multiport --dports 5000,5001 -j REJECT --reject-with tcp-reset

# ============================================================
# NODE 1 - GENDOU (router)
# ============================================================
# --- Gendou: skrip rute (12 rute buatan sendiri) ---
cat > /root/gendou.sh <<'EOF'
#!/bin/bash
# Pemulihan rute buatan sendiri di Gendou (aman dijalankan berulang)
ip route replace 10.73.3.128/26 via 10.73.4.98
ip route replace 10.73.3.192/27 via 10.73.4.102
ip route replace 10.73.4.32/29 via 10.73.4.98
ip route replace 10.73.4.40/29 via 10.73.4.102
ip route replace 10.73.4.48/29 via 10.73.4.114
ip route replace 10.73.4.56/29 via 10.73.4.102
ip route replace 10.73.4.64/29 via 10.73.4.94
ip route replace 10.73.4.72/29 via 10.73.4.94
ip route replace 10.73.4.80/29 via 10.73.4.98
ip route replace 10.73.4.120/29 via 10.73.4.98
ip route replace 10.73.4.128/29 via 10.73.4.102
ip route replace 10.73.4.152/30 via 10.73.4.94
EOF
chmod +x /root/gendou.sh
bash -n /root/gendou.sh && echo "Sintaks OK"

# --- Gendou: simpan rule (filter + nat) ---
iptables-save > /root/gendou.rules

# --- Gendou: KEBAKARAN, PEMULIHAN 1, PEMULIHAN 2 ---
echo "AWAL        -> filter: $(iptables -S | wc -l)  nat: $(iptables -t nat -S | wc -l)  rute-via: $(ip route | grep -c ' via 10.73')"
iptables -F; iptables -X
iptables -t nat -F; iptables -t nat -X
for R in $(grep "ip route replace" /root/gendou.sh | awk '{print $4}'); do ip route del $R; done
echo "KEBAKARAN   -> filter: $(iptables -S | wc -l)  nat: $(iptables -t nat -S | wc -l)  rute-via: $(ip route | grep -c ' via 10.73')"
iptables-restore < /root/gendou.rules
/root/gendou.sh
echo "PEMULIHAN 1 -> filter: $(iptables -S | wc -l)  nat: $(iptables -t nat -S | wc -l)  rute-via: $(ip route | grep -c ' via 10.73')"
iptables-restore < /root/gendou.rules
/root/gendou.sh
echo "PEMULIHAN 2 -> filter: $(iptables -S | wc -l)  nat: $(iptables -t nat -S | wc -l)  rute-via: $(ip route | grep -c ' via 10.73')"
iptables -t nat -S

# --- Unit-01: bukti Gendou berfungsi (harus 3 received) ---
ping -c 3 8.8.8.8
# --- Gendou: counter MASQUERADE harus > 0 ---
iptables -t nat -L POSTROUTING -n -v

# ============================================================
# NODE 2 - SHIGERU (router)
# ============================================================
# --- Shigeru: skrip rute (2 rute buatan sendiri) ---
cat > /root/shigeru.sh <<'EOF'
#!/bin/bash
# Pemulihan rute buatan sendiri di Shigeru (aman dijalankan berulang)
ip route replace default via 10.73.4.93
ip route replace 10.73.4.72/29 via 10.73.4.154
EOF
chmod +x /root/shigeru.sh
bash -n /root/shigeru.sh && echo "Sintaks OK"

# --- Shigeru: simpan rule ---
iptables-save > /root/shigeru.rules

# --- Shigeru: KEBAKARAN, PEMULIHAN 1, PEMULIHAN 2 ---
echo "AWAL        -> filter: $(iptables -S | wc -l)  nat: $(iptables -t nat -S | wc -l)  rute-buatan: $(ip route | grep -c -E '^default| via ')"
iptables -F; iptables -X
iptables -t nat -F; iptables -t nat -X
for R in $(grep "ip route replace" /root/shigeru.sh | awk '{print $4}'); do ip route del $R; done
echo "KEBAKARAN   -> filter: $(iptables -S | wc -l)  nat: $(iptables -t nat -S | wc -l)  rute-buatan: $(ip route | grep -c -E '^default| via ')"
iptables-restore < /root/shigeru.rules
/root/shigeru.sh
echo "PEMULIHAN 1 -> filter: $(iptables -S | wc -l)  nat: $(iptables -t nat -S | wc -l)  rute-buatan: $(ip route | grep -c -E '^default| via ')"
iptables-restore < /root/shigeru.rules
/root/shigeru.sh
echo "PEMULIHAN 2 -> filter: $(iptables -S | wc -l)  nat: $(iptables -t nat -S | wc -l)  rute-buatan: $(ip route | grep -c -E '^default| via ')"
iptables -S
ip route

# --- Magi-Casper: harus BERHASIL (3 received) ---
ping -c 3 10.73.4.66
# --- Lilith: harus GAGAL (100% loss, tanpa "Unreachable") ---
ping -c 3 -W 2 10.73.4.66
# --- Shigeru: counter DROP naik ---
iptables -L ZONA_GATE -n -v --line-numbers

# ============================================================
# NODE 3 - MAGI-BALTHASAR (host)
# ============================================================
# --- Magi-Balthasar: skrip rute (1 rute buatan sendiri) ---
cat > /root/balthasar.sh <<'EOF'
#!/bin/bash
# Pemulihan rute buatan sendiri di Balthasar (aman dijalankan berulang)
ip route replace default via 10.73.4.41
EOF
chmod +x /root/balthasar.sh
bash -n /root/balthasar.sh && echo "Sintaks OK"

# --- Magi-Balthasar: simpan rule ---
iptables-save > /root/balthasar.rules

# --- Magi-Balthasar: KEBAKARAN, PEMULIHAN 1, PEMULIHAN 2 ---
echo "AWAL        -> filter: $(iptables -S | wc -l)  nat: $(iptables -t nat -S | wc -l)  rute-buatan: $(ip route | grep -c -E '^default| via ')"
iptables -F; iptables -X
iptables -t nat -F; iptables -t nat -X
for R in $(grep "ip route replace" /root/balthasar.sh | awk '{print $4}'); do ip route del $R; done
echo "KEBAKARAN   -> filter: $(iptables -S | wc -l)  nat: $(iptables -t nat -S | wc -l)  rute-buatan: $(ip route | grep -c -E '^default| via ')"
iptables-restore < /root/balthasar.rules
/root/balthasar.sh
echo "PEMULIHAN 1 -> filter: $(iptables -S | wc -l)  nat: $(iptables -t nat -S | wc -l)  rute-buatan: $(ip route | grep -c -E '^default| via ')"
iptables-restore < /root/balthasar.rules
/root/balthasar.sh
echo "PEMULIHAN 2 -> filter: $(iptables -S | wc -l)  nat: $(iptables -t nat -S | wc -l)  rute-buatan: $(ip route | grep -c -E '^default| via ')"
iptables -S
ip route

# --- Magi-Balthasar: berfungsi (3 received + dua baris LISTEN) ---
ping -c 3 8.8.8.8
ss -tln | grep -E ':5000|:5001'
# --- Unit-01: harus BERHASIL (succeeded!) ---
nc -zv -w 3 10.73.4.43 5000
nc -zv -w 3 10.73.4.43 5001
# --- Lilith: harus DITOLAK seketika (Connection refused) ---
time nc -zv -w 3 10.73.4.43 5000
time nc -zv -w 3 10.73.4.43 5001