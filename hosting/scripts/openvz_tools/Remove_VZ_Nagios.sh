#!/bin/bash

# Find config file created for given container and remove it.  Also find
# references to it in other files, eg. adding to the various hostgroups etc.
# and remove them.  Then restart nagios.  This script may sometimes fail if the
# container to be removed is the last item in the host group, as nagios will
# faill to restart due to a syntax error.  As a workaround, a dummy host has
# been placed into all hostgroups to ensure that one is never empty
# Needs to be run with root access from within monitoring container
#
# Author: Amro Diab
# Date: 03/02/10

if [[ "$2" -ne "secret_code" ]]; then
  echo "Please start using main application:"
  echo "Usage: Remove_VZ.sh <ctid>"
  exit 3
fi

path=/etc/nagios3/conf.d
for file1 in `grep -l $1 $path/*_nagios2.cfg`; do
  vz=$1
  echo "vz=$vz file1=$file1, file2=${file1}.tmp"

  sed -e '/./{H;$!d;}' -e "x;/#start$1/d;/$1/d;/#end$1/d" $file1 \
    > ${file1}.tmp && mv ${file1}.tmp $file1
done

sed -i s/${1},//g $path/myhostgroups.cfg
sed -i s/,${1}\;/\;/g $path/myhostgroups.cfg
sed -i s/${1}\;//g $path/myhostgroups.cfg

/etc/init.d/nagios3 restart
