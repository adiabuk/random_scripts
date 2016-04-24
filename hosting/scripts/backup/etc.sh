#!/bin/bash

# Backup host config
# Author: Amro Diab
# Date: 04/02/2011

configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi

backup "/etc/cron* /etc/sysctl*" "etc"

