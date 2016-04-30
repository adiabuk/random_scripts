#!/bin/bash

# Script called from PHP webside once returned from successful Paypal API call
# Creates an alert for new purchase, and generates the config
# script is called with the orderID which is passed from the session in PHP.
# The CDID in this case denotes the container ID of the webserver.  There are
# typically 2 webserver instances running on different physical hosts and
# traffic distributed via round robin DNS.  The DBs are multi-master sessions
# with 2-way replication and odd/even row numbering
#
# Author: Amro Diab
# Date: 29/09/08

ctid=`cat /proc/user_beancounters |grep kmemsize|awk {'print $1'}|cut -c1-3`
/var/amrox/scripts/nagios_nsca.sh "New_Purchase" \
  "New Purchase occured on `date`" 1 $ctid
/var/amrox/scripts/auto2.sh $1 &>> /var/log/amrox/create_configs.log 

