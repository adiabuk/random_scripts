#!/bin/bash

# Manual method of purchasing a container without using the WEBUI
# Assumptions: customer has already been created, and is present in the DB
# Output is a config file which the automation will use to create the instance
# and notify the appropriate customer.  DB is also updated with the relevent
# entries
# Useful for creating test instances, or for special customers with different
# needs

# Author: Amro Diab
# Date: 22/09/08

set -e

configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
   exit 1
fi


hostid=$AVAILABLEHOSTID

function sqlc() {
  mysql -h $MYSQLHOST -B --skip-column-names --user=$MYSQLUSER \
    --password=$MYSQLPASSWD $VPSTABLE -e "$1;"
}

function sqld() {
  mysql -h $MYSQLHOST -B --skip-column-names --user=$MYSQLUSER \
    --password=$MYSQLPASSWD OSC2_$PLAT -e "$1;"
}

# Get list of customers
sqld "select customers_id, customers_firstname, customers_lastname, \
  customers_email_address from customers"
read -p "Please Chose Customer ID and press [ENTER]:" customerid
export customerid
num=1

# Get list of images
for i in `ls /var/lib/vz/template/cache | awk -F ".tar.gz" {'print $1'}`; do
  list[$num]=$i
  echo $num. $i
  let num++ 
done

read  -p "Please enter number of distro to install and press [ENTER]: " input

type=${list[$input]}


case $type in
  *[Ss]use* | *[sS]les*)
    Base=suse
  ;;

  *[rR]edhat* | *[fF]edora*| *[cC]entos*)
    Base=redhat
  ;;
  *[sS]lack*)
    Base=slackware
  ;;

  *[Dd]ebian*|*[Uu]buntu*)
    Base=debian
  ;;

  *)
    Base=unknown
  ;;
esac


echo -n "\nYou Chose ${list[$input]}"
export Distros=$input

export filename=${list[$input]}

sqlc "select  host_ID, host_name from host"
read -p "\n\nPlease Choose Host ID and press [ENTER]:" ServerHostID
export ServerHostName=`sqlc "select host_name from host where
  host_id='$ServerHostID';"`


# prompt for duration
read -p "\nPlease enter number of days: " duration
export duration


sqlc "select memory_id as id, memory from memory order by memory_id"
read -p "\nSelect memory: " memoryid
export memory=`sqlc "select memory_values from memory where memory_id=$memoryid"`

# Set Disk quota
sqlc "select harddrive_ID as id, harddrive_hr from harddrive"
read -p "\nPlease choose Disk Quota and press [ENTER]" harddriveid
export harddriveid
export harddrive=`sqlc "select harddrive_hard from harddrive
  where harddrive_ID=$harddriveid"`

# prompt for bandwidth
sqlc "select bandwidth_ID, bandwidth_hr from bandwidth"
read -p "Choose bandwidth: " bandwidthid
export bandwidthid
export bandwidth=`sqlc "select bandwidth_bytes from bandwidth where
  bandwidth_ID=$bandwidthid"`

export ctid=`sqlc "select vm.CTID from master_live right join vm ON
  master_live.vm_id=vm.vm_ID where live_id is NULL LIMIT 1"`
export vmid=`sqlc "select vm.vm_ID from master_live right join vm ON
  master_live.vm_id=vm.vm_ID where live_id is NULL LIMIT 1"`


# reserve ip and gather network/hostname details
export ipid=`sqlc "select ip.ip_ID from master_live right join ip ON
  master_live.ip_id = ip.ip_ID where ip.host_id=$AVAILABLEHOSTID and
  live_id is NULL or live='no' LIMIT 1"`
export ipaddress=`sqlc "select ip_address from ip where ip_ID='$ipid'"`
export gateway=`sqlc "select gateway from ip where ip_ID='$ipid'"`
export nameserver1=`sqlc "select nameserver1 from ip where ip_ID='$ipid'"`
export hostname=`sqlc "select ip_hostname from ip where ip_ID='$ipid'"`
export password=$($PASSBIN)
export ctid=`sqlc "select vm.CTID from master_live right join vm ON
  master_live.vm_id=vm.vm_ID where live_id is NULL or live='no' LIMIT 1"`
export vmid=`sqlc "select vm.vm_ID from master_live right join vm ON 
  master_live.vm_id=vm.vm_ID where live_id is NULL or live='no' LIMIT 1"`
echo "Done setting IP"

# Create Config file
echo "<order id=\"$orderid\" customerid=\"$customerid\">" \
  >> /var/amrox/configs/tmp/xx${vmid}.xml

perl -e '

use XML::Writer;
use IO::File;
my $output = new IO::File(">>/var/amrox/configs/tmp/xx$ENV{'vmid'}.xml");

my $writer = new XML::Writer(OUTPUT => $output);
# print the open tag, including the attribute
#$writer->startTag("order", orderid => "$ENV{'orderid'}", customerid => "customerid");

$writer->startTag("product", productid => "$ENV{'ordersproductsid'}");

# print an element containing only text
$writer->dataElement( Duration => "$ENV{'duration'}");
$writer->dataElement( Memory => "$ENV{'memory'}");
$writer->dataElement( Maxmemory => "$ENV{'memory'}");
$writer->dataElement( CustomerID => "$ENV{'customerid'}");
$writer->dataElement( SoftHD => "$ENV{'harddrive'}");
$writer->dataElement( HardHD => "$ENV{'harddrive'}");
$writer->dataElement( Filename => "$ENV{'filename'}");
$writer->dataElement( IPID => "$ENV{'ipid'}");
$writer->dataElement( Gateway => "$ENV{'gateway'}");
$writer->dataElement( IPAddress => "$ENV{'ipaddress'}");
$writer->dataElement( NameServer1 => "$ENV{'nameserver1'}");
$writer->dataElement( bandwidth => "$ENV{'bandwidth'}");
$writer->dataElement( support => "$ENV{'support'}");
$writer->dataElement( bandwidthid => "$ENV{'bandwidthid'}");
$writer->dataElement( Password => "$ENV{'password'}");
$writer->dataElement( hostname => "$ENV{'hostname'}");
$writer->dataElement( CTID => "$ENV{'ctid'}");
$writer->dataElement( VMID => "$ENV{'vmid'}");
  $writer->endTag(); # close writer
$writer->endTag(); # final checks
$writer->end(); # final checks

$output->close();

'

filepath=new
mydate=`sqlc "select date_sub(now(),interval 4 hour)"`

# Moved from Create_VPS.sh - write DB entries
sqlc "INSERT INTO master_live (customer_id, live_dateadded, \
  live_datemodified, duration_days, bandwidth_id, cpu_id, memory_id, \
  host_id, live, ip_id, live_name, vm_id, password, harddrive_id) VALUES \
  ( '$customerid', '$mydate', '$mydate', '$duration', '$bandwidthid', \
  '$CPUXX', '$memoryid', '$hostid', 'yes', '$ipid', '$hostname', '$vmid', \
  '$password','$harddriveid')"

# create new config and cleanup tmp files
rm /var/amrox/configs/$filepath/$ServerHostName/xx${vmid}.xml &>/dev/null
echo "</order>" >> /var/amrox/configs/tmp/xx${vmid}.xml
xmllint --format /var/amrox/configs/tmp/xx${vmid}.xml  1> \
  /var/amrox/configs/$filepath/$ServerHostName/$PLAT/xx${vmid}.xml
filename="/var/amrox/configs/$filepath/$ServerHostName/$PLAT/$vmid.xml"
echo "File written to $filename"
rm /var/amrox/configs/tmp/$vmid.xml
