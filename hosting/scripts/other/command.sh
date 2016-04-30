#!/usr/bin/env bash

# simple apache log analyser
# search for pages viewed by IP

for i in `cat bounce.txt`; do
  printf $i;
  grep $i access.log | head -1 |awk -F"rct" {'print $2'} | \
    awk -F"\"" {'print $1'} | sed 's/%20/_/g' | awk -F"'print $2'};
done

