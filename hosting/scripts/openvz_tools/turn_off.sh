#!/bin/bash

# Backups up, turns off, and deletes VM
# Input is CTID
# Also sets live flag to 'no' in master_live
#
# Author: Amro Diab
# Date: 01/2009

configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi

ctid=$1

echo $ctid

# Stop, backup, and delete container
vzctl stop $ctid
/var/amrox/scripts/backup/vz.sh $ctid
vzctl destroy $ctid

# update allocation in database
sqlc "update master_live as m left join vm as v on m.vm_id=v.vm_ID set m.live='no' where v.CTID=$ctid"


