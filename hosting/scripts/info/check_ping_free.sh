#!/bin/bash

# Return list of IPs not responding to ping
# Compare to un-allocated list and look for anomolies
# Author: Amro Diab
# Date: 18/09/2010

function check_ip() {

ping -c1 $1 &>/dev/null
return $?
}


for i in `./disp_freeIPs.sh |awk {'print $2'}|grep -vi free`; do 
printf "$i: ";
if `check_ip $i`; then
  echo "yes!!!";
else
  echo "no ping";
fi;
done
