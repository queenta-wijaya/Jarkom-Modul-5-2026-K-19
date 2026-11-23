# Gendou
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
    address 10.73.4.89
    netmask 255.255.255.252

auto eth2
iface eth2 inet static
    address 10.73.4.93
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    address 10.73.4.97
    netmask 255.255.255.252

auto eth4
iface eth4 inet static
    address 10.73.4.101
    netmask 255.255.255.252

auto eth5
iface eth5 inet static
    address 10.73.4.105
    netmask 255.255.255.252

auto eth6
iface eth6 inet static
    address 10.73.4.109
    netmask 255.255.255.252

auto eth7
iface eth7 inet static
    address 10.73.4.113
    netmask 255.255.255.252

auto eth8
iface eth8 inet static
    address 10.73.4.117
    netmask 255.255.255.252

up sysctl -w net.ipv4.ip_forward=1

# Shigeru
auto eth0
iface eth0 inet static
    address 10.73.4.65
    netmask 255.255.255.248

auto eth1
iface eth1 inet static
    address 10.73.4.153
    netmask 255.255.255.252

auto eth2
iface eth2 inet static
    address 10.73.4.94
    netmask 255.255.255.252

up sysctl -w net.ipv4.ip_forward=1

#Makoto
auto eth0
iface eth0 inet static
    address 10.73.4.73
    netmask 255.255.255.248

auto eth1
iface eth1 inet static
    address 10.73.4.154
    netmask 255.255.255.252

up sysctl -w net.ipv4.ip_forward=1

#Asuka
auto eth0
iface eth0 inet static
    address 10.73.4.81
    netmask 255.255.255.252

auto eth1
iface eth1 inet static
    address 10.73.4.98
    netmask 255.255.255.252

auto eth2
iface eth2 inet static
    address 10.73.4.121
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    address 10.73.4.125
    netmask 255.255.255.252

up sysctl -w net.ipv4.ip_forward=1

#Kensuke
auto eth0
iface eth0 inet static
    address 10.73.3.129
    netmask 255.255.255.192

auto eth1
iface eth1 inet static
    address 10.73.4.122
    netmask 255.255.255.252

up sysctl -w net.ipv4.ip_forward=1

#Ritsuko
auto eth0
iface eth0 inet static
    address 10.73.4.33
    netmask 255.255.255.248

auto eth1
iface eth1 inet static
    address 10.73.4.126
    netmask 255.255.255.252

up sysctl -w net.ipv4.ip_forward=1

#Fuyutsuki
auto eth0
iface eth0 inet static
    address 10.73.4.41
    netmask 255.255.255.248

auto eth1
iface eth1 inet static
    address 10.73.4.102
    netmask 255.255.255.252

auto eth2
iface eth2 inet static
    address 10.73.4.129
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    address 10.73.4.133
    netmask 255.255.255.252

up sysctl -w net.ipv4.ip_forward=1

#Toji
auto eth0
iface eth0 inet static
    address 10.73.4.57
    netmask 255.255.255.248

auto eth1
iface eth1 inet static
    address 10.73.4.130
    netmask 255.255.255.252

up sysctl -w net.ipv4.ip_forward=1

#Maya
auto eth0
iface eth0 inet static
    address 10.73.3.193
    netmask 255.255.255.224

auto eth1
iface eth1 inet static
    address 10.73.4.134
    netmask 255.255.255.252

up sysctl -w net.ipv4.ip_forward=1

#Kaji
auto eth0
iface eth0 inet static
    address 10.73.4.85
    netmask 255.255.255.252

auto eth1
iface eth1 inet static
    address 10.73.4.106
    netmask 255.255.255.252

up sysctl -w net.ipv4.ip_forward=1

#Yui
auto eth0
iface eth0 inet static
    address 10.73.3.1
    netmask 255.255.255.128

auto eth1
iface eth1 inet static
    address 10.73.4.110
    netmask 255.255.255.252

auto eth2
iface eth2 inet static
    address 10.73.4.137
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    address 10.73.4.141
    netmask 255.255.255.252

auto eth4
iface eth4 inet static
    address 10.73.4.145
    netmask 255.255.255.252

up sysctl -w net.ipv4.ip_forward=1

#Shinji
auto eth0
iface eth0 inet static
    address 10.73.4.1
    netmask 255.255.255.240

auto eth1
iface eth1 inet static
    address 10.73.4.138
    netmask 255.255.255.252

up sysctl -w net.ipv4.ip_forward=1

#Rei
auto eth0
iface eth0 inet static
    address 10.73.0.1
    netmask 255.255.254.0

auto eth1
iface eth1 inet static
    address 10.73.4.142
    netmask 255.255.255.252

up sysctl -w net.ipv4.ip_forward=1

#Mari
auto eth0
iface eth0 inet static
    address 10.73.4.17
    netmask 255.255.255.240

auto eth1
iface eth1 inet static
    address 10.73.4.146
    netmask 255.255.255.252

up sysctl -w net.ipv4.ip_forward=1

#Misato
auto eth0
iface eth0 inet static
    address 10.73.4.17
    netmask 255.255.255.240

auto eth1
iface eth1 inet static
    address 10.73.4.146
    netmask 255.255.255.252

up sysctl -w net.ipv4.ip_forward=1

#Hikari
auto eth0
iface eth0 inet static
    address 10.73.2.1
    netmask 255.255.255.0

auto eth1
iface eth1 inet static
    address 10.73.4.118
    netmask 255.255.255.252

auto eth2
iface eth2 inet static
    address 10.73.4.149
    netmask 255.255.255.252

up sysctl -w net.ipv4.ip_forward=1

#Kaworu
auto eth0
iface eth0 inet static
    address 10.73.3.225
    netmask 255.255.255.224

auto eth1
iface eth1 inet static
    address 10.73.4.150
    netmask 255.255.255.252

up sysctl -w net.ipv4.ip_forward=1

# --- Quarters ---
auto eth0
iface eth0 inet static
    address 10.73.0.2
    netmask 255.255.254.0
    gateway 10.73.0.1

# --- Comm-Net ---
auto eth0
iface eth0 inet static
    address 10.73.2.2
    netmask 255.255.255.0
    gateway 10.73.2.1

# --- Hangar-Crew ---
auto eth0
iface eth0 inet static
    address 10.73.3.2
    netmask 255.255.255.128
    gateway 10.73.3.1

# --- Sachiel ---
auto eth0
iface eth0 inet static
    address 10.73.3.130
    netmask 255.255.255.192
    gateway 10.73.3.129

# --- Pen-Pen ---
auto eth0
iface eth0 inet static
    address 10.73.3.194
    netmask 255.255.255.224
    gateway 10.73.3.193

# --- Medic-Bay ---
auto eth0
iface eth0 inet static
    address 10.73.3.195
    netmask 255.255.255.224
    gateway 10.73.3.193

# --- Relay-Node ---
auto eth0
iface eth0 inet static
    address 10.73.3.226
    netmask 255.255.255.224
    gateway 10.73.3.225

# --- Garden-Staff ---
auto eth0
iface eth0 inet static
    address 10.73.4.2
    netmask 255.255.255.240
    gateway 10.73.4.1

# --- Dock-Crew ---
auto eth0
iface eth0 inet static
    address 10.73.4.18
    netmask 255.255.255.240
    gateway 10.73.4.17

# --- Entry-Plug ---
auto eth0
iface eth0 inet static
    address 10.73.4.34
    netmask 255.255.255.248
    gateway 10.73.4.33

# --- Dummy-Plug ---
auto eth0
iface eth0 inet static
    address 10.73.4.37
    netmask 255.255.255.248
    gateway 10.73.4.33

# --- Magi-Casper ---
auto eth0
iface eth0 inet static
    address 10.73.4.42
    netmask 255.255.255.248
    gateway 10.73.4.41

# --- Magi-Balthasar ---
auto eth0
iface eth0 inet static
    address 10.73.4.43
    netmask 255.255.255.248
    gateway 10.73.4.41

# --- Magi-Melchior ---
auto eth0
iface eth0 inet static
    address 10.73.4.44
    netmask 255.255.255.248
    gateway 10.73.4.41

# --- Unit-01 ---
auto eth0
iface eth0 inet static
    address 10.73.4.50
    netmask 255.255.255.248
    gateway 10.73.4.49

# --- Unit-02 ---
auto eth0
iface eth0 inet static
    address 10.73.4.51
    netmask 255.255.255.248
    gateway 10.73.4.49

# --- Unit-00 ---
auto eth0
iface eth0 inet static
    address 10.73.4.52
    netmask 255.255.255.248
    gateway 10.73.4.49

# --- Lilith ---
auto eth0
iface eth0 inet static
    address 10.73.4.58
    netmask 255.255.255.248
    gateway 10.73.4.57

# --- Adam ---
auto eth0
iface eth0 inet static
    address 10.73.4.59
    netmask 255.255.255.248
    gateway 10.73.4.57

# --- Zeruel ---
auto eth0
iface eth0 inet static
    address 10.73.4.66
    netmask 255.255.255.248
    gateway 10.73.4.65

# --- Armisael ---
auto eth0
iface eth0 inet static
    address 10.73.4.67
    netmask 255.255.255.248
    gateway 10.73.4.65

# --- Radar-Array ---
auto eth0
iface eth0 inet static
    address 10.73.4.74
    netmask 255.255.255.248
    gateway 10.73.4.73

# --- Archive-Vault ---
auto eth0
iface eth0 inet static
    address 10.73.4.82
    netmask 255.255.255.252
    gateway 10.73.4.81

# --- Spy ---
auto eth0
iface eth0 inet static
    address 10.73.4.86
    netmask 255.255.255.252
    gateway 10.73.4.85

# --- Tokyo3-Core ---
auto eth0
iface eth0 inet static
    address 10.73.4.90
    netmask 255.255.255.252
    gateway 10.73.4.89

#Testing
Gendou:~# ping -c 2 10.73.4.94    # Ping ke Router Shigeru (eth2)
Gendou:~# ping -c 2 10.73.4.98    # Ping ke Router Asuka (eth1)
Gendou:~# ping -c 2 10.73.4.102   # Ping ke Router Fuyutsuki (eth1)
Gendou:~# ping -c 2 10.73.4.106   # Ping ke Router Kaji (eth1)
Gendou:~# ping -c 2 10.73.4.110   # Ping ke Router Yui (eth1)
Gendou:~# ping -c 2 10.73.4.114   # Ping ke Router Misato (eth1)
Gendou:~# ping -c 2 10.73.4.118   # Ping ke Router Hikari (eth1)
Gendou:~# ping -c 2 10.73.4.90    # Ping ke Server Tokyo3-Core

Shigeru:~# ping -c 2 10.73.4.154   # Ping ke Router Makoto (eth1)
Asuka:~# ping -c 2 10.73.4.122     # Ping ke Router Kensuke (eth1)
Asuka:~# ping -c 2 10.73.4.126     # Ping ke Router Ritsuko (eth1)
Fuyutsuki:~# ping -c 2 10.73.4.130 # Ping ke Router Toji (eth1)
Fuyutsuki:~# ping -c 2 10.73.4.134 # Ping ke Router Maya (eth1)
Yui:~# ping -c 2 10.73.4.138       # Ping ke Router Shinji (eth1)
Yui:~# ping -c 2 10.73.4.142       # Ping ke Router Rei (eth1)
Yui:~# ping -c 2 10.73.4.146       # Ping ke Router Mari (eth1)
Hikari:~# ping -c 2 10.73.4.150    # Ping ke Router Kaworu (eth1)

Quarters:~# ping -c 2 10.73.0.1      # Ping ke Gateway Rei (eth0)
Comm-Net:~# ping -c 2 10.73.2.1      # Ping ke Gateway Hikari (eth0)
Hangar-Crew:~# ping -c 2 10.73.3.1   # Ping ke Gateway Yui (eth0)
Sachiel:~# ping -c 2 10.73.3.129     # Ping ke Gateway Kensuke (eth0)
Dummy-Plug:~# ping -c 2 10.73.4.33   # Ping ke Gateway Ritsuko (eth0)
Armisael:~# ping -c 2 10.73.4.65     # Ping ke Gateway Shigeru (eth0)
Relay-Node:~# ping -c 2 10.73.3.225  # Ping ke Gateway Kaworu (eth0)