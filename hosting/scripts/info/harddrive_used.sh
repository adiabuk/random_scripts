#!/bin/bash

# Display total harddisk space allocated to containers for a particular host
# Author: Amro Diab

configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi


for i in `sqlc "select harddrive_hard from harddrive_used where host_id=2"`; do
  total=$(($total+$i))
done

echo "total:$total"
