#!/bin/bash

# remove iptables rule for an IP
# script called with IP as an argument.  After running this, bandwidth usage
# will no longer be collected
#
# Author: Amro Diab
# Date: 02/02/10

iptables -D FORWARD -s $1
iptables -D FORWARD -d $1


