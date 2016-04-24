#!/bin/bash

function=$1
param=$2


function logit(){
  echo "dollar1=$1"
  echo "dollar2=$2"
  echo "dollar3=$3"
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
