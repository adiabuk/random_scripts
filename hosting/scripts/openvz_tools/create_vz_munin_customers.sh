#!/usr/bin/env bash

# Create munin graphs for all openvz resource properties by
# symlinking to a new file with the container id, and resource name
# Will silently fail if simlink already exists, as we are trying to create
# for all, whether they have already been done, or not - incase some are
# missing
#
# Author: Amro Diab
# Date: 05/10/08

for i in `cat /var/amrox/scripts/info/customers.lst`; do

  for x in dcachesize kmemsize lockedpages privvmpages shmpages physpages \
    vmguarpages oomguarpages numfile numproc numtcpsock numflock numpty \
    numsiginfo_numothersock numiptent ndbuf tcprcvbuf othersockbuf \
    dgramrcvbuf; do

    ln -s /usr/share/munin/plugins/vebc_ ./vebc_${x}_${i};
  done

done
