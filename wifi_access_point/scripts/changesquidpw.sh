#!/bin/bash

# Create new random password for squid and send it in an email
# restart squid so changes take affect
# Use daily from cron job
# Author: Amro Diab
# Date: July 2011

mypasswd=`/var/amrox/scripts/passwdamrox.sh`
/usr/bin/htpasswd -b /etc/squid3/squid_passwd www $mypasswd
echo $mypasswd
/etc/init.d/squid3 restart

echo "Your Password for today is $mypasswd"|mail -s "Today's Password" adiab@hotmail.co.uk || exit 1


