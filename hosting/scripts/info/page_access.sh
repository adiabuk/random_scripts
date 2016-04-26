#!/bin/bash

# Return list of web pages accessed by an IP
# IP is an argument
# Author: Amro Diab
# Date: 03/06/2011

grep $1 access.log|awk -F"GET" {'print $2'}|awk {'print $1'}|grep php
