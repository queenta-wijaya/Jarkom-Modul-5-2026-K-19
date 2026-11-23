#Rei
ip route add default via 10.73.4.141
#Shinji
ip route add default via 10.73.4.137
#Mari
ip route add default via 10.73.4.145
#Kaworu
ip route add default via 10.73.4.149
#Kensuke
ip route add default via 10.73.4.121
#Ritsuko
ip route add default via 10.73.4.125
#Toji
ip route add default via 10.73.4.129
#Maya
ip route add default via 10.73.4.133
#Makoto
ip route add default via 10.73.4.153
#Kaji
ip route add default via 10.73.4.105
#Misato
ip route add default via 10.73.4.113

#Yui
ip route add default via 10.73.4.109
ip route add 10.73.0.0/23 via 10.73.4.142   # Quarters (Rei)
ip route add 10.73.4.0/28 via 10.73.4.138   # Garden-Staff (Shinji)
ip route add 10.73.4.16/28 via 10.73.4.146  # Dock-Crew (Mari)
#Hikari
ip route add default via 10.73.4.117
ip route add 10.73.3.224/27 via 10.73.4.150 # Relay-Node (Kaworu)
#Asuka
ip route add default via 10.73.4.101
ip route add 10.73.4.56/29 via 10.73.4.130  # Dogma/Lilith/Adam (Toji)
ip route add 10.73.3.192/27 via 10.73.4.134 # Medic/Pen-Pen/Medic-Bay (Maya)
#Shigeru
ip route add default via 10.73.4.93
ip route add 10.73.4.72/29 via 10.73.4.154  # Radar/Radar-Array (Makoto)

#Gendo
# Cabang Shigeru (eth2)
ip route add 10.73.4.64/29 via 10.73.4.94   # Monolith
ip route add 10.73.4.72/29 via 10.73.4.94   # Radar
ip route add 10.73.4.152/30 via 10.73.4.94  # Link Shigeru-Makoto

# Cabang Asuka (eth3)
ip route add 10.73.4.80/29 via 10.73.4.98   # Archive
ip route add 10.73.3.128/26 via 10.73.4.98  # Bunker (Sachiel)
ip route add 10.73.4.32/29 via 10.73.4.98   # Lab
ip route add 10.73.4.120/29 via 10.73.4.98  # Link p2p Asuka ke Kensuke & Ritsuko

# Cabang Fuyutsuki (eth4)
ip route add 10.73.4.40/29 via 10.73.4.102  # Terminal
ip route add 10.73.4.56/29 via 10.73.4.102  # Dogma (Lilith)
ip route add 10.73.3.192/27 via 10.73.4.102 # Medic
ip route add 10.73.4.128/29 via 10.73.4.102 # Link p2p Fuyutsuki ke Toji & Maya

# Cabang Kaji (eth5)
ip route add 10.73.4.84/30 via 10.73.4.106  # Intel (Spy)

# Cabang Yui (eth6)
ip route add 10.73.0.0/23 via 10.73.4.110   # Quarters
ip route add 10.73.4.0/28 via 10.73.4.110    # Garden
ip route add 10.73.4.16/28 via 10.73.4.110   # Dock
ip route add 10.73.4.136/29 via 10.73.4.110  # Link p2p Yui ke Shinji, Rei, Mari

# Cabang Misato (eth7)
ip route add 10.73.4.48/29 via 10.73.4.114  # Cage

# Cabang Hikari (eth8)
ip route add 10.73.2.0/24 via 10.73.4.118   # Comm-Net
ip route add 10.73.3.224/27 via 10.73.4.118 # Relay
ip route add 10.73.4.148/30 via 10.73.4.118 # Link Hikari-Kaworu

#Testing
# 1. Tes Ping ke Lilith (10.73.4.58)
Armisael:~# ping -c 4 10.73.4.58

# 2. Tes Ping ke Sachiel (10.73.3.130)
Armisael:~# ping -c 4 10.73.3.130

# 3. Tes Ping ke Comm-Net (10.73.2.2)
Armisael:~# ping -c 4 10.73.2.2