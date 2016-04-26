#!/bin/bash

# Reset modified date to track time left in current month
# Used to calculate monthly bandwidth and overall resources
# used in billing cycle (not calendar month)
# Author: Amro Diab

configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi


sqlc "update master_live set live_datemodified=now() where datediff(NOW(), live_datemodified) >='30'"
