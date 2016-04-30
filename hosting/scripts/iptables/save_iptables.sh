#!/usr/bin/env bash

# save all iptables rules
# run hourly in crontab - and re-load on @reboot, to restore most recent config
# Author: Amro Diab
# Date: 03/2009
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
iptables-save -c > /root/iptables-backup.txt
