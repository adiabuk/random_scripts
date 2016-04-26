#!/bin/bash

# Creates all the OpenVZ symlinks in /etc/munin/plugins
# Author: Unknown

FILE=`mktemp /tmp/ln-vebc-XXXXXX`

cd /etc/munin/plugins

for resources in kmemsize \
    lockedpages_privvmpages_shmpages_physpages_vmguarpages_oomguarpages \
    numproc \
    numtcpsock_numflock_numpty_numsiginfo_numothersock_numiptent \
    tcpsndbuf_tcprcvbuf_othersockbuf_dgramrcvbuf \
    dcachesize \
    numfile
do
    for VE in 0 `/usr/sbin/vzlist | sed "s/^ *//" |grep '^[0-9]' | cut -f 1 -d " "` ; do
        ln -sf /usr/share/munin/plugins/vebc_ "vebc_"$resources"_"$VE
        echo "vebc_"$resources"_"$VE >> $FILE
    done
done

# remove no longer deserved links (ie. links pointing to machines
# which were destroyed or stopped)

find -type l -name vebc_\* | sed "s/\.\///" | while read LN; do
    if grep ^$LN$ $FILE >/dev/null; then
        true
    else
        rm $LN
    fi
done

rm $FILE
