#!/bin/bash

# Backup offsite configs
# Author: Amro Diab
# Date: 04/02/2011

USER=$1
PASS=$2
EXTRA=$3
DIR=$4

cd /var/backups/01p

/usr/bin/lftp -c "set ftp:passive-mode off net:limit-rate 5120 -a; open ftp://$USER:$PASS@home.amroxservices.com:10021;
mirror --depth-first --use-cache --verbose --allow-chown --allow-suid --no-umask --parallel=1 $EXTRA --exclude-glob .svn"




