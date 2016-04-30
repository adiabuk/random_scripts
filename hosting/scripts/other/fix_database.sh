#!/bin/bash

# Clean up invalid data in the DB
# Author: Amro Diab

source /var/amrox/etc/VPS-config
file=`mktemp`
sqlo "select products_options_values_id, products_options_values_name from \
  products_options_values" > $file
sed -i 's/\t/,/g' $file

cat $file| while read a; do
  id=`echo $a|awk -F, {'print $1'}`;
  data=`echo $a|awk -F, {'print $2'}`;

  sqlo "update orders_products_attributes set products_options_values_id=$id \
    where products_options_values='$data' and \
    products_options_values_id is null";

done

sqlo "update products set product_options='fixed' where products_id=54;";
sqlo "delete from products_description where products_id=68";
