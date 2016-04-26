#!/bin/bash

# Display unallocated IP addresses
# Author: Amro Diab
# Date: 20/08/2010

configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi

mysql --user=$MYSQLUSER --password=$MYSQLPASSWD -h $MYSQLHOST  $VPSTABLE -e "select ip.host_id as 'Host', ip_address as 'Free IPs' from master_live right join ip ON master_live.ip_id = ip.ip_ID where live_id is NULL or live='no';"

