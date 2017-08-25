#!/usr/bin/bash

# From given list of arch packages, produce list of those which are not required
# by any other packages
# Author: Amro Diab
# Date: 23/08/17

in_file=$1
out_file=$2
for package in `cat $in_file`; do

  if pacman -Qi $package |grep -q "Required By     : None"; then
    echo $package >> $out_file
  fi

done

