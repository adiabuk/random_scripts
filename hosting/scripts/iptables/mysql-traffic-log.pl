#!/usr/bin/perl


# Script called from vz-generate-traffic-log
# Purpose is to retrieve entries in log file (vz-traffic.log)
# and insert them into mysql traffic table
#
# Author: Amro Diab
# Date: 03/04/09

use strict;
use warnings;
use DBI;
use Sys::Hostname;

$hostname = hostname;

my $plat=$ENV{'PLAT'};
my $user=$ENV{'MYSQLUSER'}
my $pass=$ENV{'MYSQLPASSWD'}

my $dbh = DBI->connect("DBI:mysql:Amrox_${plat}:78.47.5.73",
  $MYSQLUSER, $MYSQLPASSWD) or die "Could not connect to database: "
  . $DBI->errstr;

$filename="/var/amrox/scripts/iptables/$hostname-traffic.log";

open (LOG, $filename);
@data=<LOG>;

foreach $line( @data) {
  @elements = split(/ /, $line);
  $date=shift(@elements);
  $time=shift(@elements);
  $ipaddress=shift(@elements);
  $bytes=shift(@elements);
  $myquery = "INSERT INTO traffic (ipaddress,bytes,measuringtime)
    VALUES ('$ipaddress','$bytes','$date $time')";
  $results = $dbh->do($myquery);
}

close LOG;
$dbh->disconnect();
