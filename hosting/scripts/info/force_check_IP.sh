#!/bin/bash

# Force check free IPs from database,
# FAIL=not really free
# Author:Amro Diab
# Date: 22/08/2010

for i in `./disp_freeIPs.sh |cat|grep ^4|grep -v 202|awk {'print $2'}`; do 

ping -c1 -t10 $i &>/dev/null; 
result=$?;

[[ "$result" -ne 0 ]] && var="OK";
[[ "$result" -eq 0 ]] && var="FAIL";

echo "$var: $i result: $result";


done

