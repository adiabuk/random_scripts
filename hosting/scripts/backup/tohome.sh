#!/bin/bash

USER=$1
PASS=$2
EXTRA=$3
DIR=$4

function dobackup(){

  /usr/bin/lftp -c "set ftp:passive-mode off net:limit-rate 5120 -a; open ftp://$USER:$PASS@home.amroxservices.com:10021;
  mirror --reverse --depth-first --use-cache --verbose --allow-chown --allow-suid --no-umask --parallel=1 $EXTRA --exclude-glob .svn"
}

if [[  "$DIR" == "backup" ]]; then
  cd /var/backups/amrox && dobackup
  cd /var/backups/mysqlbackups && dobackup
else
  dobackup
fi
