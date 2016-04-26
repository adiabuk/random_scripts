#!/bin/bash

# Check Hosts and IPs are in DNS and match reverse DNS
# hostnames/ips = arg1
# Host ID: 4 or 5 = arg2
# Author: Amro Diab
# Date: 21/11/2010

[[ $1 == "hostnames" ]] &&column1=4 &&column2=5 && column0=2
[[ $1 == "ips" ]] && column1=5 &&column2=4 && column0=1

while read line; do
  i=$(echo -e "$line"|awk {'print $'$column0''});
  host=`host $i|awk {'print $'$column1''}|grep -v alias` 2>/dev/null;
  reverse=`host $host|awk {'print $'$column2''}|grep -v alias` 2>/dev/null;
  original=$i;

  [[ $1 == "hostnames" ]] && original="$i."

  if [[ "$original" == "$reverse" ]]; then
    var="OK"
  else
    var="FAIL"
  fi

  echo -e "${var}:\t original=$i\t\thost=$host\t\t\treverse=$reverse"

  done < /var/amrox/etc/hosts.$2
