#!/bin/bash

# Backup mysql data
# Author: Amro Diab
# Date: 04/02/2011

configfile="/var/amrox/etc/VPS-config"
date=`date +"%d%m%y"`
dir=/var/backups/mysqlbackups/`hostname`/

mkdir $dir/$date 2>/dev/null
echo $dir$date

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi

for i in `sqlc "show databases"`; do
  mysqldump --user=$MYSQLUSER --password=$MYSQLPASSWD $i > $dir/$date/$i.sql
done

