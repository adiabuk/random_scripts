#!/bin/bash

# Drop port on host
# argument is port number
# Author: Amro Diab
# Date: 17/02/2009

iptables -A OUTPUT -p tcp --dport $1 -j DROP
