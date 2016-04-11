#!/usr/bin/env bash

#
# Autoscan.sh
# Scans document currently in scanner, and uploads to dropbox
#
# Requirements:
# Connected Sane compatible scanner
# Internet access
# ppmtojpeg: Arch: extra/netpbm  Debian: netpbm
# scanimage: Arch: extra/sane Debian: sane-util
# expect: Arch: extra/expect Debian: expect
# ftp server or dropbox account

set -e  # fail script at first failed command
set -o pipefail

working=`echo "${0%/*}"`  # working dir
NOW=$(date +"%d%m%y%H%M") # current date for use in filename
echo $1

if [[ "$1" == "--test" ]]; then
  # don't actually scan scan anything, just use the test image
  echo "Fake scanning image..."
  convert -caption "`date`" test.ppm -gravity center -background black +polaroid /tmp/${NOW}.ppm;
else
  # if --test parameter not passed as arg1...
  echo "Scanning Image..."
  # scan image to /tmp directory as ppm
  scanimage > /tmp/${NOW}.ppm || echo "Failed to scan, ensure your scanner is connected" 
fi

echo "Converting to jpeg..."
# convert to jpeg
ppmtojpeg /tmp/${NOW}.ppm > /tmp/${NOW}.jpg

# transfer to online storage
echo "Transferring file"

# uncomment one of the two options below for ftp or dropbox upload
$working/dropbox_uploader.sh upload /tmp/${NOW}.jpg ${NOW}.jpg
#$working/ftp.exp my.ftp.server ${NOW}.jpg password


echo "Deleting /tmp/${NOW}.jpg and /tmp/${NOW}.ppm"
# delete image from /tmp dir
rm /tmp/${NOW}*

echo "Done..."
read -p "Press <Enter> to exit" 
