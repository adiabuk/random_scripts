#!/bin/bash

################################################

# This script checks for config in /etc/vz/conf 
# which is not associated with any running instance
# Author: Amro Diab
# Date: 07/03/2012

###############################################
config_dir=/etc/vz/conf

cd $config_dir
for i in `ls *.conf|grep -v ^0|awk -F. {'print $1'}`; do

  printf "Checking $i..."
  vzlist $i 2>&1 | grep -q $i && echo OK || echo "FAILED: $i does not exist: please rename ${i}.conf"

done

echo "Done checking config";echo
