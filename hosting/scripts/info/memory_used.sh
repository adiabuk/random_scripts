#!/bin/bash

# Display total memory allocated to instances
# Author: Amro Diab
# Date: 19/08/2010

configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi


# Host ID as param


for i in `sqlc "select memory_values from memory_used where host_id=$1"`; do
  total=$(($total+$i))
done

echo "total:$total"
