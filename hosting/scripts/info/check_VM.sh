#!/usr/bin/env bash

# Display report for range of containers
# provide CTID lower and upper range values as params
# Output will display memory/disk usage, distro + release
# All information is extracted from the container itself except
# for the bandwidth usage which is collected into the DB
#
# Author: Amro Diab

configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi

echo "-----------------------------------------------------------------"
for i in `seq $1 $2`; do

  free=`vzctl exec $i free -m|grep Mem| awk {'print $2'}`
  df=`vzctl exec $i df -h / |awk {'print $2'}|tail -1`
  version=`vzctl exec $i 'cat /etc/*release* || cat /etc/*version* ' 2>/dev/null`
  bwidth_cmd="select bandwidth.bandwidth_hr from bandwidth,master_live where "
  bwidth_cmd+="master_live.vm_id=( select master_live.vm_id from master_live,vm"
  bwidth_cnd+="where vm.CTID='$i' and vm.vm_ID=master_live.vm_id) and "
  bwidth_cmd+="master_live.bandwidth_id=bandwidth.bandwidth_id"
  bandwidth=`sqlc $bandwidth`
  arch=`vzctl exec $i 'file /sbin/init|cut -c 1-50'`

  echo "CTID=$i"
  echo "MEMORY=$free"
  echo "HARDDRIVE=$df"
  echo "VERSION=$version"
  echo "BANDWIDTH=$bandwidth"
  echo "ARCH=$arch"
  unset free df version bandwidth arch
  echo "-----------------------------------------------------------------"
done
