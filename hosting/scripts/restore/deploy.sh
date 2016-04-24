#!/bin/bash

# Restore web environment from backups
# Author: Amro Diab
# Date: 07/02/2011


configfile="/var/amrox/etc/VPS-config"

if [ -f $configfile ]; then
  . $configfile

else
  echo "$configfile:No Such File or Directory"
  exit 1
fi


i=1;

for var in `ls  /var/amrox/backups|grep web`; do
  echo "$i $var";
  dir[$i]=$var;
  let i++;
done

read -p "Which backup do you want to restore? " number
echo "you chose $number"

g=1
for var2 in `ls  /var/www`; do
  echo "$g $var2";
  dir2[$g]=$var2;
  let g++;
done

read -p "Where do you want to restore to? " number2
echo "you chose $number2"



from=/var/amrox/backups/${dir[$number]}
to=/var/www/${dir2[$number2]}
folder=html

echo from: $from
echo to: $to
echo restoring: $folder

rm -rf $to/$folder
tar zxvf $from -C $to/ $folder
echo $from -C $to/ $folder

clear
echo "Copying over configure.php"

h=1
for var3 in `ls  /var/amrox/etc/*configure*`; do
  echo "$h $var3";
  dir3[$h]=$var3;
  let h++;
done

read -p "Which environement are you restoring? " number3
echo Copying ${dir3[$number3]} to $to/html/includes/configure.php ...
cat ${dir3[$number3]} > $to/html/includes/configure.php
echo;echo;echo
echo Done...
