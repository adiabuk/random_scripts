#!/bin/bash

# wrapper script used for all automated scripts via cron etc.
# to log output of functions with logger
# Author: Amro Diab
# Date: 2011

function=$1
param=$2


function logit(){
  echo "first arg=$1"
  echo "second arg=$2"
  echo "third arg=$3"
  function=$1
  filename=$2
  param=$3
  input=`/var/amrox/scripts/$filename $param 2>&1`
  echo "input=$input"

  if [[ "$input" == "" ]]; then
    exit 66
  fi

  logger -p local6.info -t $function $input 
}


case $1 in

create_config)
  ls
  ;;

create_vps)
  filename="Create_VPS.pl"
  ;;
esac


logit $function $filename $param
