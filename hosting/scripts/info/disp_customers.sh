#!/bin/bash

# display VPS and customer details for all CTID present on current system
# Author: Amro Diab
# Date: 09/08/2011

configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi

for i in `vzlist -a|awk {'print $1'}|grep -v CTID`;do
#for i in 132; do
echo "$i start";

# Get VM details
echo "-vm-"
sqlc "select duration_days, memory, firstname, lastname, email,CTID,ip_address, live_name, harddrive_hr,password from master_live, harddrive, vm, memory, customer,ip where vm.vm_id=master_live.vm_ID and master_live.memory_id=memory.memory_id and master_live.harddrive_id=harddrive.harddrive_id and master_live.ip_id=ip.ip_ID and customer.customer_ID=master_live.customer_id and CTID=$i and live='yes'";
echo "---"

# Get Customer details
echo "-customer-"
sqlo "select customers_name, customers_email_address, billing_name from orders where orders_id=(select orders_id from Amrox_prod.master_live where vm_id=(select vm_ID from Amrox_prod.vm where CTID=$i LIMIT 1)LIMIT 1)";
echo "---"

# Get Product Name
echo "-product-"
sqlo "select products_name from orders_products where orders_id=(select orders_id from Amrox_prod.master_live where vm_id=(select vm_ID from Amrox_prod.vm where CTID=$i LIMIT 1)LIMIT 1)";


echo "$i end";

echo "------------------------------";
done
