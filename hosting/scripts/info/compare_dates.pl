#!/usr/bin/perl
#use strict;
#use warnings;

# Reset the date monified to today if > 30 days
# This is required to enable the 30 day auditing of the bandwidth
# The dateadded field is not touched as this is required for lenght of contract
# Author: Amro Diab

use Date::Calc qw(Delta_DHMS);
use DateTime;
use DBI;
use Date::Calc qw(Delta_Days);


$plat="prod";
my $dbh = DBI->connect("DBI:mysql:Amrox_$plat:78.47.5.73", 'adiab', '167233') or die "Could not connect to database: " . $DBI->errstr;
$lol=$ARGV[$argnum];


# Get information from master_live for all live cells
#(specifically requiring dates)
# Insure dates are not all 0's otherwise script will fail
$results = $dbh->prepare('select live_ID, live_dateadded, live_datemodified from master_live where live=?');
$live="yes";
$results->execute($live);

# Read the matching records and store in vars
while (@data = $results->fetchrow_array()) {
  my $live_id = $data[0];
  my $live_dateadded = $data[1];
  my $live_datemodified=$data[2];

  # Split out Date and time from date modified var
  @datetime = split(/ / , $live_datemodified);

  $date=shift(@datetime);
  $time=shift(@datetime);

  $datetime=$date ."T" . $time;

  # This is the original format: 2010-02-03T18:35:12
  # Split out date into year/month/day
  @date= split(/-/ , $date);
  $year=shift(@date);
  $month=shift(@date);
  $day=shift(@date);

  # Split Time into hour/minute/second
  @time=split(/:/,$time);
  $hour=shift(@time);
  $minute=shift(@time);
  $second=shift(@time);
  $dt1=DateTime->new( year      => $year,
                     month      => $month,
                     day        => $day,
                     hour       => $hour,
                     minute     => $minute,
                     second     => $second,
                     nanosecond => 0,
                     time_zone  => "floating",
                    );

  $now=DateTime->now;
  my $days = $dt1->delta_days($now)->delta_days;

  # Compare days between extracted modifieddate to current date

  if ($days > 30){
    @newdatetime=split(/T/ , $now);
    $newdate=shift(@newdatetime);
    $newtime=shift(@newdatetime);

    # Update datemofied with current date if difference is greater that 30 days
    $myquery = "UPDATE master_live SET live_datemodified='$newdate $newtime' WHERE live_ID='$live_id'";
    $results2 = $dbh->do($myquery);
  }

}
