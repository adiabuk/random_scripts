#!/bin/bash

#######################################
# Queries different tables in OSC2 and Amrox databases
# and extracts fields based on CTID
# Can be run on any host with access to the central mysql db
# Author: Amro Diab
# Date: 10/07/2010
##########################################


configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi

function die() {

  echo $1
  exit 1

}

date2stamp() {
  date --utc --date "$1" +%s 

}


function dateDiff() {

  case $1 in  
    -s) sec=1; shift;;
    -m) sec=60; shift;;
    -h) sec=3600; shift;;
    -d) sec=86400; shift;;
     *)  sec=86400;;
  esac

  date1=`date2stamp $1`
  date2=`date2stamp $2`
  diffsec=$(($date1-$date2))
  echo $(($diffsec/$sec))
}

function verify_variable() {

  [[ -z $1 ]] && die "Empty field or missing column"
  echo $1 |grep -iq null && die "Null field found "
  echo "$1 $2 $3 $4 $5"

}

function usage() {

  die "Usage $0 [name|email|start_date|days_demaining|comments|product] CTID"

}

function search_orders() {

  verify_variable `sqlo "select $1 from orders where orders_id=(select orders_id from Amrox_prod.master_live where vm_id=(select vm_ID from Amrox_prod.vm where CTID=$2 LIMIT 1)LIMIT 1)"`

}

function search_products(){

  verify_variable `sqlo "select products_name from orders_products where orders_id=(select orders_id from Amrox_prod.master_live where vm_id=(select vm_ID from Amrox_prod.vm where CTID=$2))"`;
}

function search_vm {

  verify_variable `sqlc "select $1 from master_live, harddrive, vm, memory, customer,ip where vm.vm_id=master_live.vm_ID and master_live.memory_id=memory.memory_id and master_live.harddrive_id=harddrive.harddrive_id and master_live.ip_id=ip.ip_ID and customer.customer_ID=master_live.customer_id and CTID=$2 and live='yes'"`


}

[[ -z $2 ]] && usage
search=$1
ctid=$2

case $1 in 

name)

  search_orders "customers_name,billing_name" $2||die "unable to connect to server";;

email)

  search_orders customers_email_address $2||die "unable to connect to server";;

start_date)

  search_vm live_dateadded $2 || die "unable to connect to server";;

product)
  search_products "hello " $2;;

comments)

  search_vm comments $2||die "no comments";;

days_remaining)

  max_days=$(search_vm duration_days $2);
  start_date=$(search_vm live_dateadded $2);
  newdate=$(date "+%Y-%m-%d %T" --date "$start_date ${max_days} days");
  now=$(date "+%Y-%m-%d %T");

  echo $(dateDiff ${newdate} ${now});;

*)

  usage;;

esac

