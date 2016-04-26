#!/bin/bash

# Next CTID to be allocated
# Author: Amro Diab
# Date: 09/07/2010

limit=$1

[[ -z $limit ]] && limit=5

configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi


sqlc "select vm.CTID from master_live right join vm ON master_live.vm_id=vm.vm_ID where live_id is NULL or live='no' LIMIT $limit"
