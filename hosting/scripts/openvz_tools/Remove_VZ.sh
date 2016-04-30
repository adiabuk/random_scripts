#!/bin/bash

# Wrapper script to call all removal scripts for end of container lifetime.
# Calling with secret code, which is a poor-man's check to ensure we are 
# not calling by accident
#
# Author: Amro Diab
# Date: 04/02/10

read -p "Are you sure you wish to remove $1? {y/n}: " $response

[[ "$response" -ne "y" ]] && echo "Exiting..." && exit 5

./Remove_VZ_iptables.sh `vzlist |grep $1| awk {'print $4'}`
./Remove_VZ_VZ.sh $1 "secret_code"
./Remove_VZ_Nagios.sh $1 "secret_code"
