#!/bin/bash

# Takes order ID as command line argument and outputs VPS details as XML file
# This script is called from the checkout_process.php file to kick off the
# automated process.  This works with both staging & prod, depending on the
# $PLAT variable which is exported in the env.  This can be overridden by
# specifically specifying it at the commandline: eg. PLAT=STAG ./auto2.sh
#
# Author: Amro Diab
# Date: 20/09/08
set -E

configfile="/var/amrox/etc/VPS-config"

[ -f $configfile ] || die "FAILED: $configfile: No Such File or Directory"
  . $configfile


function cleanup() {
  # Cleanup tmp config created during this process

  echo -e "Cleaning up tmp files\n"
  # mv /var/amrox/configs/tmp/${orderid}.xml /tmp
  }


  function init_vars(){

  # Need to pupulate vars with non-null value so that XML is polulated
  # Init each time trhough the loop(s) to ensure no incorrect data
  # is left over from previous run

  export  duration=0
  export  memory=0
  export  customerid=0
  export  harddrive=0
  export  filename=0
  export  ipid=0
  export  gateway=0
  export  ipaddress=0
  export  nameserver1=0
  export  bandwidth=0
  export  support=0
  export  bandwidthid=0
  export  password=0
  export  hostname=0
  export  ctid=0
  export  vmid=0

}


function die() {
  # What to do if we encounter an error
  # Cleanup tmp files; output error and date/time; raise alert

  cleanup
  output="FAILED: $1,OrderID: $orderid"
  echo "$output `date`"
  /var/amrox/scripts/nagios_nsca.sh "Create_XML" "$output" 1 `hostname -s`
  exit 1

}


function check_empty() {
  # Helper function to check that a variable is populated
  # with more than just whitespace

  check=`echo $2| tr -d ' '`

  echo "checking status of $1 variable"
  [[ -z $check ]] && die "Unable to get data $1"
}


function start_xml(){
  # write XML header - top of file.  This is called once, write at the start
  # before we write anything to the config file
  echo "<order id=\"$orderid\" customerid=\"$customerid\">" >> \
    /var/amrox/configs/tmp/$orderid.xml

}


function complete_xml(){
  # write footer of xml file
  # and use xmllint to cleanup/pretty-print file
  # Then cleanup the completed tmp file
  # We do this as a seperate functions as we may be iterating through several
  # products, and/or several quantaties of the same product, and want all
  # config for a single order to go into a single file, so this is only called
  # at the end after we are sure we have written all data for this particular
  # order

  echo "</order>" >> /var/amrox/configs/tmp/$orderid.xml
  rm /var/amrox/configs/$filepath/$AVAILABLEHOST/$orderid.xml &>/dev/null
  xmllint --format /var/amrox/configs/tmp/$orderid.xml  \
    1> /var/amrox/configs/$filepath/$AVAILABLEHOST/$PLAT/$orderid.xml \
    || die "unable to format XML file"
  echo "File written to
    /var/amrox/configs/$filepath/$AVAILABLEHOST/$PLAT/$orderid.xml"
  rm /var/amrox/configs/tmp/$orderid.xml \
    || die "unable to delete tmp file /var/amrox/configs/tmp/$oriderid.xml"

}


function check_ip_count() {
  # Check number of free IPs for given host
  avail="select count(ip.ip_address) from ip left join master_live on "
  avail_str+="master_live.ip_id=ip.ip_ID where master_live.live_ID is null "
  avail_str+= "or master_live.live='no'"
  avail=`sqlc "$avail_str"`
  [[ "$avail" -eq 0 ]] &&  die "no free IPs or failed SQL connection"
}


function get_order_details {
  # get order status for
  export customerid=`sqlo "select customers_id from orders
    where orders_id=$orderid"`
  export status=`sqlo "select orders_status from orders
    where orders_id=$orderid"`
  echo "hello $customerid"
  check_empty "CustomerID" $customerid
  check_empty "Status" $status
}


function get_quantity(){
  # number of items in order
  echo "Getting Quantity"
  export quantity_str="select products_quantity from orders_products where "
  quantity_str+="orders_id=$orderid and orders_products_id=$ordersproductsid"
  quantity=`sqlo $quantity_str || echo "error getting quantity"`

}


function allocate_ip(){

  # get next available ip & associated network settings
  # and allocate - also set random IP
  echo "Allocating an IP Addr"

  export ipid=`sqlc "select ip.ip_ID from master_live right join ip
    ON master_live.ip_id = ip.ip_ID where ip.host_id=$AVAILABLEHOSTID and
    live_id is NULL or live='no' LIMIT 1"`
  export ipaddress=`sqlc "select ip_address from ip where ip_ID='$ipid'"`
  export gateway=`sqlc "select gateway from ip where ip_ID='$ipid'"`
  export nameserver1=`sqlc "select nameserver1 from ip where ip_ID='$ipid'"`
  export hostname=`sqlc "select ip_hostname from ip where ip_ID='$ipid'"`
  export password=$($PASSBIN)
  export ctid=`sqlc "select vm.CTID from master_live right join vm ON
    master_live.vm_id=vm.vm_ID where live_id is NULL or live='no'LIMIT 1"`
  export vmid=`sqlc "select vm.vm_ID from master_live right join vm ON
    master_live.vm_id=vm.vm_ID where live_id is NULL or live='no' LIMIT 1"`

  echo "Done setting IP"


}


function check_status(){
  # depending on status, move to appropriate directory
  # new: will get picked up within seconds, pending: will require manual
  # intervention after payment has been confirmed

  echo "checking status...."
  if [[ "$status" == "1" ]]; then  # not yet paid
    export filepath="pending"
    echo "status is $filepath"
  else
    export filepath="new"
    echo "status is $filepath"
  fi

}


function fixed_vps(){
  # fixed instance, means one of the pre-defined types available in the UI
  # for each distro there is a selection of different instance types,
  # small, medium, large, and x-large with increasing amount of resources.
  # Each available options has associated resources in the DB which we fetch
  # here, given the product_id (of the chosen option)
  # Duration for all are 356 days.

  echo "I am fixed"

  echo "Setting Duration"
  export duration='365'

  echo "Getting HardDrive - fixed"
  export harddriveid=`sqlo "select harddrive_id from fixed_options where
    fixed_id = (select fixed_id from products where products_id=$productid)"`
  export harddrive=`sqlc "select harddrive_soft from harddrive where
    harddrive_ID=$harddriveid"`

  echo "Getting Bandwidth - fixed"
  export bandwidthid=`sqlo "select traffic_id from fixed_options where
    fixed_id = (select fixed_id from products where products_id=$productid)"`
  export bandwidth="do we need this?"

  echo "Getting Memory - fixed"
  export memoryid=`sqlo "select memory_id from fixed_options where
    fixed_id = (select fixed_id from products where products_id=$productid)"`
  export memory=`sqlc "select memory_values from memory where
    memory_ID=$memoryid"`

  echo "Done with fixed settings"

}


function custom_vps(){
  # custom instances are those where the user has specified custom resources
  # eg. ram, bandwidth, diskspace, duration etc.
  # These are stored along with the order and fetched here.

  echo "I am custom"

  echo "getting memory - custom"
  export memory=`sqlo "select max_val from products_options_values where
    products_options_values_name=(select products_options_values from
    orders_products_attributes where orders_products_id=$ordersproductsid
    and products_options='Memory')"`
  echo "memory is $memory"

  export memoryid=`sqlo "select products_options_values_id from
    products_options_values where products_options_values_name=(select
    products_options_values from orders_products_attributes where
    orders_products_id=$ordersproductsid and products_options='Memory')"`

  echo "done getting memory-custom"
  echo "setting default duration"
  export duration=365

  echo "Getting Harddrive - custom"

  export harddrive=`sqlo "select max_val from products_options_values where
    products_options_values_name=(select products_options_values from
    orders_products_attributes where orders_products_id=$ordersproductsid and
    products_options='Hard drive')"`

  echo "getting hd id"
  export harddriveid=`sqlo "select products_options_values_id from
    products_options_values where products_options_values_name=(select
    products_options_values from orders_products_attributes where
    orders_products_id=$ordersproductsid and products_options='Hard drive')"`

  echo "Getting Bandwidth"
  export bandwidth=`sqlo "select products_options_values from
    orders_products_attributes where orders_products_id=$ordersproductsid and
    products_options='Bandwidth'"`

  echo "Getting Bandwidthid"
  export bandwidthid=`sqlo "select products_options_values_id from
    orders_products_attributes where orders_products_id=$ordersproductsid and
    products_options='Bandwidth'"`



  echo "Getting Support"
  export support=`sqlo "select products_options_values from
    orders_products_attributes where orders_products_id=$ordersproductsid
    and products_options='Support'"`

  echo "Done with Custom settings"
}


function generic_vps() {
  # determine the architecture/distro and the filename of the image to use when
  # building the instance.  This is common for both custom and fixed instances

  echo "Getting arch"

  export arch=`sqlo "select products_options_values from
    orders_products_attributes where orders_products_id=$ordersproductsid and
    products_options_values like '%bit%'"`

  if [[ "$arch" == *32* ]]; then
    export archid=1
    export archname="x86"
  else
    export archid=2
    export archname="x86_64"
  fi

  echo "done getting arch"

  echo "getting filename"
  export version=`sqlo "select str_val1 from products_options_values where
    products_options_values_name=(select products_options_values from
    orders_products_attributes where orders_products_id=$ordersproductsid and
    products_options='Version')"`

  export filename=$version$archname
  echo "done getting filename"

}


function get_product_info(){
  # from product info, determine if user chose fixed or custom instance
  # so we know which functions to run above.
  echo "getting product_id"
  export productid=`sqlo "select products_id from orders_products where
    orders_id=$orderid and orders_products_id=$ordersproductsid" ||
    echo "error getting product id"`
  check_empty "ProductID" $productid
  echo "product_id = $productid"

  check_empty "Product details" `sqlo "select * from products_description where
    products_id=$productid"`

  echo "Find out if this is fixed or customized"
  export fixed=`sqlo "select product_options from products where
    products_id=$productid"`

  if `echo ${fixed} | grep "fixed" 1>/dev/null 2>&1`; then
    fixed_vps
  elif  `echo ${fixed} | grep "custom" 1>/dev/null 2>&1`; then
    custom_vps
  else
    die "product is neither fixed nor custom"

  fi

}


function write_bulk_xml(){
  # now that we have all the data, create the bulk of the XML using perl
perl -e '

use XML::Writer;
use IO::File;

my $output = new IO::File(">>/var/amrox/configs/tmp/$ENV{'orderid'}.xml") or die "Unable to create XML file";

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

$output->close();

  '


}


function update_db(){
  # Create a record in the database with container all details
  # we only do this after container has been successfully created
  # otherwise we fail and manual intervention is required

  mydate=`sqlc "select date_sub(now(),interval 4 hour)"`
  sqlc "INSERT INTO master_live (customer_id, live_dateadded,
    live_datemodified, duration_days, bandwidth_id, cpu_id, memory_id,
    host_id, live, ip_id, live_name, vm_id, password, harddrive_id) VALUES
    ( '$customerid', '$mydate', '$mydate', '$duration', '$bandwidthid', 
    '$CPUXX', '$memoryid', '$hostid', 'yes', '$ipid', '$hostname', '$vmid',
    '$password','$harddriveid')"

}



# Start iterating through order
echo "***********************************************"
echo "Starting on `date`"
export orderid=$1
init_vars
check_ip_count
get_order_details
start_xml

# Iterate through each product in current order
for i in `sqlo "select orders_products_id from orders_products where
  orders_id=$orderid"`; do  # for each product

  export ordersproductsid=$i
  echo "Order ID = $orderid"
  echo "Order Product ID = $ordersproductsid"
  get_quantity

# There may be multiple quantities of a sinlge product, so we iterate through
# those as they are seperate instances, with the same attributes.
  for j in `seq 1 $quantity`; do   # for each quantity in current order
    echo "**"
    get_product_info
    generic_vps
    allocate_ip
    check_status
    write_bulk_xml
    update_db
    echo "******"
  done
  echo "************"

done

complete_xml
echo "SUCCESS on `date`"

echo "***********************************************"
exit 0  # success
