#!/bin/bash

# Display amount of bandwidth remaining for current IP associated with a
# container for the current month - bytes usage and percent
#
# Author: Amro Diab

configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi

ipaddress=$1
#ipaddress="192.168.1.104"
ipid=`sqlc "SELECT ip_ID from ip where ip_address='$ipaddress'"`
var=`sqlc "select live_datemodified from master_live where ip_id='$ipid'"`
now=`sqlc "select date_sub(now(),interval 4 hour)"`

echo "now=$now, then=$var"

current=`sqlc "select sum(bytes) from traffic where ipaddress='$ipaddress'
  and measuringtime BETWEEN '$var' and '$now'"`
maximum=`sqlc "select  bandwidth.bandwidth_bytes from bandwidth right join
  master_live on bandwidth.bandwidth_ID=master_live.bandwidth_id where
  ip_id=$ipid"`
percent=$(echo  " scale=2; $current*100/$maximum" | bc)

echo "byte usage=${current}/${maximum}:${percent}%"

