#!/bin/bash

# Instance level tests (debian based)
# This runs inside an instance to prepare the environment
# for testing from the outside

# Author: Amro Diab
# Date: 05/06/2012

function onhost() {
  echo
  echo "Looks like you are trying to run this script on a host machine."
  echo "This can only be run on openvz machines"
  echo "exiting..."
  exit 3
}



cd /boot
number=`find|wc -l`
[[ $number -gt 1 ]] && onhost

apt-get -y purge resolvconf
find /var/log -type f | grep -e 1$ -e gz$ -e 3$ |xargs rm

for i in `find /var/log -type f`; do
  cat /dev/null > $i;
done

cat /dev/null > /etc/resolv.conf
apt-get clean
apt-get autoclean

