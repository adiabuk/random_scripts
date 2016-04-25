#!/bin/bash -x

# Stress test
# runs tests of a given distro repeatedly
# Used to ensure that startup/shutdown and cleanup will not affect
# instance performance over time
# Author: Amro Diab
# Date: 07/06/2012

cd /var/lib/vz/template/cache/

x=100;

for i in `ls ubuntu*`; do

(
   echo $x
)2>&1 | tee /var/log/amrox/$x.log 

((x++))

done

