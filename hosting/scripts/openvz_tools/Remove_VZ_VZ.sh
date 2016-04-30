#!/bin/bash

# Backup and delete a running container.  Call script with CTID as argument.
# Also mark the container as no longer being live in the DB, but don't delete
# the entry - then free up the IP so it can be reallocated
# Secret Code is to ensure that we run this from the wrapper script, and not
# manually
#
# Author: Amro Diab
# Date: 04/04/10

configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi


if [[ "$2" -ne "secret_code" ]]; then
  echo "Please start using main application:"
  echo "Usage: Remove_VZ.sh <ctid>"
  exit 666
fi

echo "Backing up VM...."

vzctl stop $1

tar zcvf /root/backups/${1}.tgz /var/lib/vz/private/${1}
echo "Removing VM"
vzctl destroy $1
echo "Setting Live field to No"
mysql -A --user=$MYSQLUSER --password=$MYSQLPASSWD -h $MYSQLHOST $VPSTABLE \
  -e "UPDATE master_live SET live='No' where CTID=${1};"
echo "Removing IP Address Allocation"
mysql -A --user=$MYSQLUSER --password=$MYSQLPASSWD -h $MYSQLHOST $VPSTABLE \
  -e "UPDATE live_CTID_ipID SET ip_id='',live='no' where CTID=${1};"


