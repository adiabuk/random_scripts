#!/bin/bash

# returns the next IP used for VPS
# Note: This is dependent on environment of host/vps
# host id as argument, or it will use available host from config file
#
# Author: Amro Diab
# Date: 09/07/2010

configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi
host=$1
[[ -z $1 ]] && host=$AVAILABLEHOSTID

sqlc "select  ip_address, master_live.host_id from ip left join master_live on master_live.ip_id=ip.ip_ID where ip.host_id=$host and master_live.live_ID is null or master_live.live='no' LIMIT 5"
