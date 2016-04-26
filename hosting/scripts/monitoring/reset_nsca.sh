#!/bin/bash

####################################################################
# Script to reset the status of all passive (NSCA) checks to 0 (OK)#
# Author: Amro Diab
####################################################################

# Reset create VPS/XML passive alerts on all hosts
for i in \
  appovz01p \
  appovz02p \
  appovz03p \
  appovz04p ; do

    for j in \
      Create_VPS \
      Create_XML ; do

      echo "Resetting $j for $i"
      /var/amrox/scripts/nagios_nsca.sh $j "Status reset by $0" 0 $i;

    done

done

# Reset all customer/purchase alerts on all web instances
for i in \
  104 \
  134 \
  132; do

  for j in \
    New_Customer \
    New_Purchase; do

    echo "Resetting $j for $i"
    /var/amrox/scripts/nagios_nsca.sh $j "Status reset by $0" 0 $i;

  done

done

