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

