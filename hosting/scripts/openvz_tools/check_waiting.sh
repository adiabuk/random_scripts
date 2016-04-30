#!/bin/bash

# Check if new files exist for this machine, if so, create VM
# ROLE = VPS/WEB/etc
#
# Author: Amro Diab
# Date: 20/09/08

ROLE="WEB"
plat="prod"
myhost=`echo $HOSTNAME|awk -F. {'print $1'}`

if [  -f /var/amrox/configs/new/$myhost/$plat/*.xml ]; then
  /var/amrox/scripts/Create_$ROLE.pl $plat 2>&1 >> /var/log/amrox.log
  echo "exists"
fi
