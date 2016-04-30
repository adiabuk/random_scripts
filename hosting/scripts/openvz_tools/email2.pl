#!/usr/bin/perl


# Sends the second email to the customer with VPS details
# Needs to be run manually after VPS has been created and checks have been made.
# Input is env followed by list of CTIDs
# eg. ./email2 prod 101 102 103
#
# Look out for section at the bottom to stop automation
#
# Author: Amro Diab

use strict;
use warnings;

$numArgs = $#ARGV + 1;
print "thanks, you gave me $numArgs command-line arguments.\n";

my $plat=$ARGV[0];
my $domain="";

foreach $argnum (1 .. $#ARGV) {

  $start="\n----------------------------------------\n";
     print "$ARGV[$argnum]\n";

  print "PLAT::::::$plat";
  use DBI;
  my $user = $ENV{'MYSQLUSER'}
  my $pass = $ENV{'MYSQLPASS'}
  my $host = $ENV{'MYSQLHOST'}
  my $dbh = DBI->connect("DBI:mysql:Amrox_$plat:$MYSQLHOST, $MYSQLUSER,
                         $MYSQLPASS) or die "Could not connect to database: " . $DBI->errstr;
  $lol=$ARGV[$argnum];

  $results = $dbh->selectall_hashref('select duration_days, memory, firstname, ',
    'lastname, email,CTID,ip_address, ip_hostname, harddrive_hr,password from ',
    'master_live, harddrive, vm, memory, customer,ip where vm.vm_id=i',
    'master_live.vm_ID and master_live.memory_id=memory.memory_id and ',
    'master_live.harddrive_id=harddrive.harddrive_id and master_live.ip_id='
    'ip.ip_ID and customer.customer_ID=master_live.customer_id and CTID=' \
    .$lol, 'CTID');

  foreach my $id (keys %$results) {

    $memory = "Memory is $results->{$id}->{memory}\n";
    $ip = "IP addresss:  $results->{$id}->{ip_address}\n";
    $hostname = "Hostname: $results->{$id}->{ip_hostname}\n";
    $harddrive = "Harddrive size:  $results->{$id}->{harddrive_hr}\n";
    $email = $results->{$id}->{email};
    $duration = "Contract length:  $results->{$id}->{duration_days} days\n";
    $firstnamel = "$results->{$id}->{firstname}";
    $firstname = "firstname is  $results->{$id}->{firstname}\n";
    $lastname = "lastname is  $results->{$id}->{lastname}\n";
    $password = "Root Password:  $results->{$id}->{password}\n";
    $CTID = "Machine ID is $results->{$id}->{CTID}\n";
    $webmin = "Webmin: https://$results->{$id}->{ip_hostname}:10000";

    $emailcontent=$emailcontent . $start . $CTID . $memory . $ip .$hostname . \
      $harddrive . $duration  . $password . $webmin;
  }

}
$emailcontent=$emailcontent . $start;
# email setup

$top="Dear $firstnamel,\nThe following VPS is now ready for use:\n\n";
$bottom="\n\nYou can start using your new systems straight away by logging in ",
  "via ssh or using the Webmin console.\n\nIf you have any problems accessing ",
  "your system please do not hesitate to contact us.\n\nBest Regards,",
  "\nAmrox Online";

my $to=$email;
my $from='"VPS SUPPORT" <support@amroxonline.com>';
my $bcc='"VPS SUPPORT" <support@amroxonline.com>';
my $subject='Your Virtual Machines are ready';

print "the following email will be sent:\n";
print "To: $to\n";
print "From: $from\n";
print "Subject: $subject\n";
print $top . $emailcontent . $bottom;

# Uncomment below to disable automation
# TODO: use --auto flag to script

#print "\n\nDo you wish to proceed? [y/n]";
#print "answer:" . $answer;
#$answer='y';
#$answer = <STDIN>; #Enable this to wait for user input
#if ($answer =~ /y/){


  print "sending email to: $to \n";

  open(MAIL, "|/usr/sbin/sendmail -t");
  ## Mail Header
  print MAIL "To: $to\n";
  print MAIL "BCC: $bcc\n";
  print MAIL "From: $from\n";
  print MAIL "Subject: $subject\n";


  ## Mail Body
  print MAIL $top . $emailcontent . $bottom;

#}
