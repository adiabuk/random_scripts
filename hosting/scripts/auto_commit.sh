#!/bin/bash

# auto commit new configs to svn

dir=$1
name=$2

cd $dir
if `svn status |grep -q ^?` || `svn status | grep -q ^M`|| `svn status |grep -q ^!`; then
  /var/amrox/scripts/adddelsvn.sh
  svn commit -m "auto commit from $name"
fi

