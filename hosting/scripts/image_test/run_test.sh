#!/bin/bash

# Main test script
# Spins up instances for each available distro image and runs
# a series of tests inclduing network connectivitiy
# and basic functionality
# Author: Amro Diab
# Date: 05/06/2012

distro=$1;
x=$2;
export mode=$3;
export basepath=`pwd`
export subnet="192.168.1"
mydate=$(date +"%d-%b-%H-%M")

function usage() {

  echo
  echo "Please specifiy distro and starting octet"
  echo " eg. $0 debian 100 fresh"
  echo "exiting..."
  echo
  exit 3
}

function check_vps() {

  until `vzlist $1|grep -q running`; do
    echo "Machine not yet active, waiting for 5secs...";
    sleep 5;
    /usr/share/vzctl/scripts/vpsreboot
    vzctl start $1
  done
}

function check_port() {
  ip=$1
  port=$2
 
  for i in {1..5}; do
    if `nc -z $ip $port`; then break;fi;
    echo "Port $port not yet active, waiting for 5secs...";
    sleep 5;
  done
  if ! `nc -z $ip $port`;then echo "FAILED - Port still not open, giving up...";fi;
}

function run_external_script() {
  echo
  #vzctl start $x
  #vzctl exec $1 cat /etc/apt/sources.list > /tmp/$2.sources.list
  #$basepath/prepare_image.sh $x $2
  #vzctl stop $x
}

function check_flavor {
ctid=$1
  if `vzctl exec $ctid [ -a /etc/redhat-release ]`; then
    echo "redhat"

  elif `vzctl exec $ctid [ -a /etc/debian_version ]`; then
    echo "debian"
  else
    echo "slackware"
  fi


}

function cleanup() {
  echo "Cleaing up Stale instances..."

  for i in {100..999}; do
    vzctl stop $i &>/dev/null
    vzctl destroy $i &>/dev/null
    rm /etc/vz/conf/$i.conf.* &>/dev/null
  done
  rm /var/lib/vz/lock/*
  rm -rvf /var/log/amrox/*
 
}

function pkg_tool() {

ctid=$1
function=$2
package=$3


  if [[ `check_flavor $ctid` == "redhat" ]]; then
    command="yum"
    update="check-update"
    install="install -y"

  elif [[ `check_flavor $ctid` == "debian" ]]; then
    check_apt_usage $ctid
    command="apt-get"
    update="update"
    install="install -y"
  else
    echo # slackware?
  fi

  if [[ "$function" = "update" ]]; then
    dofunction=$update
  else
    dofunction=$install
  fi

   echo "$command $dofunction $package"


}

function check_apt_usage {
  ctid=$1
  vzctl exec $ctid lsof /var/lib/apt/lists/lock
  var=$?
  if [ $? -eq 0 ];  then
    for j in `lsof /var/lib/apt/lists/lock|grep -v COMMAND|awk {'print $2'}`;do kill -9 $j; killall -9 apt-get; rm /var/lib/apt/lists/lock ;done
    vzctl exec $ctid rm /var/lib/apt/lists/lock
  elif [ $var -eq 1 ]; then
    vzctl exec $ctid rm /var/lib/lists/lock
  else
    echo "Unknown exit code"
  fi

  vzctl exec $ctid lsof /var/lib/dpkg


}

function check_ping {
  ip=$1
  attempt=$2
  sleep 5;
  ping -c5 $ip || echo "FAILED: Unable to ping $ip attept $2"
 
}

function check_ssh {
  ip=$1
  command=$2
  rm ~/.ssh/known_hosts
  $basepath/ssh.exp password $ip $command || echo "FAILED: Running $command though SSH"

}

function vz_exec {
  ctid=$1
  command=$2
  vzctl exec $ctid $command || echo "FAILED: Running $command on $ctid with vzctl"

}

function vz_funcs(){
  command=$1
  ctid=$2
  vzctl $1 $2 || echo "FAILED to $1 $2"

}


function create_vps {
  x=$1
  file=$2
 
  echo "Creating VPS from $file"
  vz_funcs stop $x &>/dev/null
  vz_funcs destroy $x &>/dev/null
  vz_funcs create "$x --ostemplate=$(echo $file|awk -F'.tar.gz' {'print $1'}) --ipadd $subnet.$x"
  vz_funcs set "$x --privvmpages $(( 512 * 256 )) --save"
  vz_funcs start $x
  check_vps $x
  vz_funcs set "$x --nameserver 192.168.1.85"
  hostname=`host -l 192.168.1.$x|awk {'print $5'}|sed '$s/.$//'||echo "test"`
  vz_funcs set "$x --hostname $hostname --save"
  vz_funcs set "$x --userpasswd root:password --save"
  vz_funcs stop $x

}


function test_vps() {

  x=$1
  i=$2
  echo "Testing VPS... $i"
  vz_funcs start $x
  check_vps $x
  check_ping $subnet.$x 1

  vz_exec $x "`pkg_tool $x update`"
  vz_exec $x "`pkg_tool $x install htop`"
  vz_funcs restart $x
  check_vps $x
  check_ping $subnet.$x 2
  vz_exec $x "touch /reboot"
  vz_exec $x reboot
  check_vps $x
  check_ping $subnet.$x 3
  vz_funcs stop $x
  vz_funcs start $x
  check_vps $x
  check_ping $subnet.$x 4
  /etc/init.d/vz restart
  check_vps $x
  check_ping $subnet.$x 5
  vz_exec $x 'ping -c1  www.google.com'
  vzctl stop $x
  vzctl start $x

  check_vps $x
  check_port $subnet.$x 22
  check_ssh $subnet.$x ls
  check_port $subnet.$x 22
  check_ssh $subnet.$x `pkg_tool $x update`
  check_port $subnet.$x 10000
  check_port $subnet.$x 80

  vzctl stop $x
  run_external_script $x $i
  vz_funcs set "$x --onboot=no --save"

}

###############################################################################

[[ $# -lt 3 ]] && usage

set -x
[[ "$mode" == "fresh" ]] && cleanup

mkdir /var/log/amrox/${distro}_${mydate}
cd /var/lib/vz/template/cache/

for i in `ls $distro*`; do
(
  echo "CTID:$x, IP: $subnet.$x"

  [[ "$mode" == "fresh" ]] && create_vps $x $i
  test_vps $x $i

)2>&1 |tee  /var/log/amrox/${distro}_${mydate}/$x-$i.log
((x++))
done
