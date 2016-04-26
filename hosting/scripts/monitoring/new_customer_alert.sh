#!/bin/bash

# Send informational alert when new customer has regstered

# source platform file available on each host to get host id
. /etc/plat
/var/amrox/scripts/nagios_nsca.sh New_Customer \
  "New Customer Registered on $CTID" 1 $CTID;
