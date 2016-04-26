#!/usr/bin/ env bash

# Wrapper script for NSCA to push alerts to nagios
# These are mainly informational alerts which will silently fire and
# will not wake anyone up in the middle of the night
# Such alerts will need to be cleared manually (see clear_nsca script)
# as they indicate an even occurance, not a boolean state change
# Arguments: description, output, exit_code, hostname
# Use quotes for strings with spaces to encapsulate
#
# This script is only for formatting of event data
# we are still seding everything to the send_nsca binary in the expected way
#
# Author: Amro Diab
#


function usage() {

echo "Usage: $0 DESCRIPTION OUTPUT ERROR_CODE HOSTNAME"
exit 3

}


[[ -z $4 ]] && usage  # if not at least 4 arguments, then exit

description=$1
output=$2
return_code=$3
MY_HOSTNAME=$4

NAGIOS_SERVER_IP=avpnag02.amroxonline.com
SEND_NSCA=/usr/sbin/send_nsca  # nsca binary
SEND_NSCA_CFG=/etc/send_nsca.cfg

printf "%s\t%s\t%s\t%s\n" "$MY_HOSTNAME" "$description" "$return_code" "$output" | $SEND_NSCA -H $NAGIOS_SERVER_IP -c $SEND_NSCA_CFG
