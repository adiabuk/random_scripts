#!/bin/bash
#
# chkconfig: 2345 85 15
# description: Rotates the IP address of eth0 \
# processname: iprot
# pidfile: /var/run/iprot.pid
# config: /etc/sysconfig/iprot-config
# source: /etc/sysconfig/ipaddresses
# source function library

if test -e /etc/sysconfig/iprot-config ; then
  . /etc/sysconfig/iprot-config
fi

for i in `cat ipaddresses`; do
  echo $i
  logger -t "rotation[$$]" IP address changed to: $i
  sleep 5;
done

