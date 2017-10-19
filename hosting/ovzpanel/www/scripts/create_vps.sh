#!/bin/bash -x -x
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


sudo /usr/sbin/vzctl create $1 --hostname $2 --ostemplate $9
sudo /usr/sbin/vzctl set $1 --nameserver $7 --nameserver $8 --userpasswd root:$3 --diskspace $6G:$6G --onboot yes --save
sudo /usr/sbin/vzctl set $1 --vmguarpages $4 --save
sudo /usr/sbin/vzctl set $1 --privvmpages $5 --save
sudo /usr/sbin/vzctl start $1
) 2>&1 | tee /var/log/panel.log
