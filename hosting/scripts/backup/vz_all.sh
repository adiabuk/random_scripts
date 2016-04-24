#!/bin/bash

# Backup all containers
# Author: Amro Diab
# Date: 04/02/2011

ownership=$1
for i in `cat /var/amrox/scripts/info/${ownership}.lst`; do
  /var/amrox/scripts/backup/vz.sh $i;
  sleep 360
done

