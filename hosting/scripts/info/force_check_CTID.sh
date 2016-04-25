#!/bin/bash

# Go through all free CTIDs and display those which actually exist
# Author: Amro Diab
# Date: 23/08/2010



rm /tmp/checkctid &>/dev/null
configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi




function host_list() {

echo `sqlc "select host_name from host where live='yes'"` 

}



function get_list() {

  
  for host in `host_list`; do

      ssh -p 443 $host vzlist |awk {'print $1'} >> /tmp/checkctid 2>/dev/null
       
    #done

  done

}

limit=`sqlc "select count(*) from vm"`


  get_list 2>/dev/null
for ctid in `./next_ctid.sh $limit`; do 


  grep -q $ctid /tmp/checkctid
  result=$?
  [[ $result -eq 0 ]] && printresult="FAIL: exists" && echo "$ctid $printresult "  

done


