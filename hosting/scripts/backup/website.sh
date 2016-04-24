#!/bin/bash

# Backup websites
# Author: Amro Diab
# Date: 04/02/2011

configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi

i=1;

for var in `ls /var/www/`; do
  echo $i $var;
  dir[$i]=$var;
  let i++;
done

if [ -z "$1" ]; then
  read -p "Which Directory do you want to backup? " number
  echo "you chose $number"
else
  number=$1;
  purpose=$2
fi

cd /var/www/${dir[$number]}

if [ -z "$1" ]; then
  backup "*" "web-${dir[$number]}"
else
  echo $purpose|backup "*" "web-${dir[$number]}"
fi
