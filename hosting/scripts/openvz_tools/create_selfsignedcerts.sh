#!/bin/bash

# Create certs for staging and test environments
# Author: Amro Diab
# Date: 15/01/10

path="/tmp"
read -p "Enter SubDomain:" subdom
read -p "Enter Passphrase:" pass
echo ${subdom}

openssl genrsa -passout pass:$pass -des3 -rand file1:file2:file3:file4:file5 \
  -out ${path}/${subdom}.key 1024
openssl rsa -passin pass:$pass -in ${path}/${subdom}.key -out ${path}/${subdom}.pem
openssl req -passin pass:$pass -new -key ${path}/${subdom}.key -subj \
  '/C=UK/ST=Swindon/L=Wiltshire/CN=www.amroxonline.com' -out ${path}/${subdom}.csr
openssl x509 -passin pass:$pass -req -days 60 -in ${path}/${subdom}.csr \
  -signkey ${path}/${subdom}.key -out ${path}/${subdom}.crt


echo;echo
echo "PEM FILE:`ls ${path}/${subdom}.pem`"
echo "CRT FILE:`ls ${path}/${subdom}.crt`"
echo "KEY FILE:`ls ${path}/${subdom}.key`"
echo "CSR FILE:`ls ${path}/${subdom}.csr`"
echo;
echo "Please move files to proper locations"
