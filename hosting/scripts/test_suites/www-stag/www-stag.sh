#!/bin/bash

function die() {
  echo $1
  exit 1

}

function clear_db() {
  PASS=$1
  ssh root@78.47.5.73  "mysql -p$PASS OSC2_stag < /root/OSC2_stag.sql"

}

function apache_allow {

ssh root@www-stag.amroxonline.com /var/amrox/scripts/test_suites/apache_allow.sh $1

}

function start_server {

java -jar ~/*.jar -log  /var/log/amrox/selenium.log &

}

function stop_server {

  killall -9 java

}

function run_tests {
  for i in \
    create_acct.pl \
    login.pl \
    random.pl \
    complicated.pl \
    email.pl ;
  do
    echo "***** $i starting *****" 
    perl perl/$i || die "Failed to run $i";
    echo "***** $i finished *****";echo;echo;echo
  done

}
(

apache_allow allow
#start_server || die "Failed to start Selenium Server"
clear_db password|| die "Unable to reset db"
run_tests
#stop_server || die "Failed to stop Selenium server"
apache_allow deny
)| tee /var/log/amrox/www-stag.log
