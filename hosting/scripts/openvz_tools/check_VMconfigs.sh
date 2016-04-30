#!/bin/bash

# Check if new files exist for this machine, if so, create VM
# This script will run periodically via cron and create a newe instance
# if one exists, otherwise it will send an alert if instance not created
# successfully
#
# Author: Amro Diab
# Date: 19/12/08

plat=$1

function die(){
  output="FAILED: $1"
  /var/amrox/scripts/nagios_nsca.sh "Create_VPS" "$output" 1 `hostname -s`
  echo $output

  exit 1
}


if  ls /var/amrox/configs/new/$HOSTNAME/$plat/*.xml &>/dev/null; then
  /var/amrox/scripts/Create_VPS.pl $plat >> /var/log/amrox/check_configs.log \
    2>>/var/log/amrox/check_configs.log || die "Unable to Create VPS for stag"
fi
