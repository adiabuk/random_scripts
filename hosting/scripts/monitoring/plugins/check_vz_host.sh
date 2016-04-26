#!/bin/bash

# Host level monitoring for openvz hosts - not containers
# Author: Amro Diab
# Date: 02/08/2009


# $1 = cmd string
# $2 = hostid
cmdstring=$1
hostid=$2
distro=$3

configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  #global functions for fetching data
  source $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi

case $1 in

mailq)  # check mailqueue size
  waiting=`mailq | grep Total`

  if [[ "$3" == *redhat* ]]; then
    queue=`echo $waiting|awk -F: {'print $2'}`
  else
    client=`echo $waiting|awk {'print $3'}|awk {'print $1'}`
    server=`echo $waiting|awk {'print $6'}`
    queue=`echo "scale=2; ${client}+${server}"|bc`
  fi

  echo Queue Size=$queue
  [[ "$queue" -gt 3 ]] && exit 2  # critical
  [[ "$queue" -gt 1 ]] && exit 1  # warning
  [[ ! -n $queue ]] && echo "UNKNOWN" && exit 3
  exit 0
  ;;


check_bc)  # check VPS resources
  sudo /var/amrox/scripts/check_beancounters
  ;;

vnstat-day)  # daily bandwidth usage
  metric=`vnstat |grep today|awk -F "\|" {'print $3'}|awk {'print $2'}`
  value=`vnstat |grep today|awk -F "\|" {'print $3'}|awk {'print $1'}`
  [[ "$metric" == *GB* ]] && today=`echo "$value*1024"|bc` 
  [[ "$metric" == *KB* ]] && today=`echo "scale=4; $value/1024"|bc` 
  [[ "$metric" == *MB* ]] && today=$value 
  # never raise alarm, always return OK but with data for graphs
  echo "OK: today:${today}MB |todays_usage=$today"
  ;;

vnstat-month)  # monthly bandwidth usage

  mydate=`date|awk {'print $2'}`
  metric=`vnstat --months |grep $mydate|awk -F "\|" {'print $3'}|awk {'print $2'}`
  value=`vnstat --months |grep $mydate|awk -F "\|" {'print $3'}|awk {'print $1'}`
  [[ "$metric" == *GB* ]] && month=`echo "$value*1024"|bc`
  [[ "$metric" == *KB* ]] && month=`echo "scale=4; $value/1024"|bc`
  [[ "$metric" == *MB* ]] && month=$value 
  # never raise alarm, always return OK but with data for graphs
  echo "OK: month:${month}MB |monthly_usage=$month"

  ;;

ip)  # Number of free IPs remaining

  remaining=`sqlc "select count(*) from free_ip where free_ip.host_id=$hostid"`
  [[ ! -n $remaining ]] && echo "UNKNOWN:$remaining" && exit 3
  echo "Remaing IPs on host: $remaining|remainingIPs=$remaining;;;0;100"
  # only raise alert for non-production hosts, otherwise
  # just change alert message but return OK exit code
  [[ "$remaining" -lt 1 ]] && [[ "$hostid" -ne 3 ]]  && exit 2
  [[ "$remaining" -lt 2 ]] && [[ "$hostid" -ne 3 ]] && exit 1
  exit 0
  ;;


memory)  # Amount of unallocated RAM remaining

  # get details from prod database
  for i in `sqlc "select memory_values from memory_used where host_id=$2 and live='yes'"`; do
    # sum up all the returned values from mysql
    alloc=$(($alloc+$i))

  done
  # calculate allocated usage as a percentage of actual RAM on host
  avail=`free -m|grep Mem|awk {'print $2'}`
  percent=`echo "scale=4; $alloc / $avail*100"|bc`
  echo "usage:${alloc}/${avail}: ${percent}%|'percent'=${percent}"
  percentwhole=`printf "%0.f\n" $percent`

  if [[ "$percentwhole" -gt "1000" ]]; then
    exit 2  # critical
  elif [[ "$percentwhole" -gt "600" ]]; then
    exit 1  # warning
  else
    exit 0  # OK
  fi

  ;;

harddrive) # Amount of unallocated diskspace
  for i in `sqlc "select harddrive_hard from harddrive_used where host_id=$2 and live='yes'"`; do
    alloc=$(($alloc+$i))
  done

  avail=`df /var/lib |tail -1|awk {'print $1'}`
  percent=`echo "scale=4; $alloc / $avail*100"|bc`
  echo "usage:${alloc}/${avail}: ${percent}%|'percent'=${percent}"

  percentwhole=`printf "%0.f\n" $percent`

  if [[ "$percentwhole" -gt "100" ]]; then
    exit 2  # critical
  elif [[ "$percentwhole" -gt "90" ]]; then
    exit 1  # warning
  else
    exit 0  # OK
  fi



*)
  # unknown option
  echo usage "$0 [cmd] [CTID]"
  exit 66
  ;;

esac
