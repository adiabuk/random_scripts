#!/bin/bash

# Create interface on host for routing and forwarding to veth containers
# Author: Amro Diab
# Date: 11/2012

ipaddr=$1
gateway=$2

cat > /etc/network/interfaces.tail << EOF
auto eth0
iface eth0 inet static
address $ipaddr
netmask 255.255.255.0
up /sbin/ip route add $gateway dev eth0
up /sbin/ip route add default via $gateway
up sysctl -w net.ipv4.conf.eth0.proxy_arp=1
up sysctl -w net.ipv4.conf.eth0.forwarding=1
EOF

