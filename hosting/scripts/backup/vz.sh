#!/bin/bash

# Backup individual container
# Author: Amro Diab
# Date: 04/02/2011

date=`date +"%d%m%y"`
dir=/var/backups/amrox/vz

/usr/sbin/vzdump --dumpdir $dir --snapshot $1 --maxfiles 3

