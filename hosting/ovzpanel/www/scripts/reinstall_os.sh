#!/bin/bash -x
(
echo "d1 = $1"
echo "d2 = $2"
echo "d3 = $3"
echo "d4 = $4"
echo "d5 = $5"
echo "d6 = $6"
echo "d7 = $7"
echo "d8 = $8"
echo "d9 = $9"


sudo /usr/sbin/vzctl stop $1
sudo cp /etc/vz/conf/$1.conf /etc/vz/conf/$1.conf.REINSTALL
sudo /usr/sbin/vzctl destroy $1
sudo /usr/sbin/vzctl create $1 --ostemplate $2
sudo cp -f /etc/vz/conf/$1.conf.REINSTALL /etc/vz/conf/$1.conf
sudo /usr/sbin/vzctl start $1
sudo /usr/sbin/vzctl set $1 --userpasswd root:$3 --save

) 2>&1 | tee /var/log/panel.log
