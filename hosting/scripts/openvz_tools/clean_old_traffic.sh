#!/bin/bash

# Cleanup empty records of mysql traffic info
# Sum together entries in the same month for same IP when older than 31 days
# Author: Amro Diab
# Date: 09/2010

configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi

sqlc "delete from traffic where bytes='0'"
for i in `/var/amrox/scripts/iptables/vz-all-running-ip`; do
  previousdate=`sqlc "select master_live.live_datemodified from master_live left join ip on ip.ip_id=master_live.ip_id where ip.ip_address='$i'"`

  sum=`sqlc "select sum(bytes) from traffic where datediff('$previousdate',measuringtime)>31 and ipaddress='$i'"`

  echo "SUM=$sum"

  sqlc "delete from traffic where datediff('$previousdate', measuringtime) >31 and ipaddress='$i'"
  sqlc "insert into traffic (ipaddress, bytes, measuringtime) VALUES ('$i', 'sum',NOW())"

  echo $i;
done
