#!/bin/bash

# Display allocated IPs
# Author: Amro Diab
# Date: 20/08/2010

configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi

mysql --user=$MYSQLUSER --password=$MYSQLPASSWD -h $MYSQLHOST  $VPSTABLE -e "select live_name as 'Name', ip_address as 'Used IPs' from master_live right join ip ON master_live.ip_id = ip.ip_ID where master_live.ip_id = ip.ip_ID and master_live.live='yes';"

