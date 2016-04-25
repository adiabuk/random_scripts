#!/bin/bash

# Simple test
# Spin up an image and send bootstrap script to prepare environment
# Author: Amro Diab
# Date: 03/06/2012
ctid=$1
distro=$2

vzctl start $ctid
vzctl exec $ctid 'bash -s' < local_script.sh
vzctl stop $ctid

rm -rf /var/lib/vz/dump/*
vzdump --compress $ctid
vzctl stop $ctid
