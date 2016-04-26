#!/bin/bash

# Add virtual interface to container
# Arguments are container id, ip adddress to use, and interface
# Author: Amro Diab
# Date: 11/2012

ctid=$1
ipaddr=$2
iface=$3   #0, 1, 2 etc....for eth0 eth1 eth2
#vzeth > /etc/modules
modprobe veth

vzctl set $ctid --ipdel $ipaddr --save

vzctl set $ctid --netif_add eth${iface} --save
ifconfig veth${ctid}.0 0
echo "/sbin/ip route add $ipaddr dev veth${ctid}.${iface}" >> /etc/init.d/rc.local

#on host /etc/sysctl.conf
echo "net.ipv4.conf.veth${ctid}/${iface}.proxy_arp=1" >> /etc/sysctl.conf
#echo "sysctl -w net.ipv4.conf.veth${ctid}/${iface}.forwarding=1">> /etc/sysctl.conf

#on guest /etc/network/interfaces

vzctl exec $ctid ifconfig eth${iface} 0
gateway=`ifconfig eth0|grep "inet "|awk {'print $2'}|awk -F: {'print $2'}`

vzctl exec $ctid 'bash -s' < add_interfaces.sh $ipaddr $gateway
vzctl exec $ctid /etc/init.d/networking restart

vzctl restart $ctid
/etc/init.d/rc.local start
sysctl -p
