#!/usr/bin/perl


# Create EYE login from available XML data
# Do not create a new instance, only a loging to the desktop UI for any
# existing eyeOS container which has available slots
# TODO: merge with existing create VPS scripts
#
# Author: Amro Diab
# Date: 20/03/11

use strict;
use warnings;

use File::Copy;
use XML::Simple;
use Sys::Hostname;
use Digest::MD5 qw(md5_hex);

my $ctids;
my $hostraw = hostname();
my @host = split('\.',$hostraw);
my $ctids="";
my $plat=$ARGV[0];
my $host=$host[0];

print "hostname:$host,plat:$plat\n\n";

unless($plat){
print "Please specify platform as commandline argument\n";
exit;
}

my @files = </var/amrox/configs/new/$host[0]/$plat/*>;
foreach my $file (@files) {
  print $file . "\n";


    # Parse the input XML document 
    my $root = XMLin("$file", forcearray=>1);  
    
    for my $dbs (@{$root->{product}}) {
      print "UserID: $dbs->{UserID}->[0]\n";
      print "Email: $dbs->{Email}->[0]\n";
      print "Password: $dbs->{Password}->[0]\n";
      print "Quota: $dbs->{Quota}->[0]\n";
      print "Filename: $dbs->{Filename}->[0]\n";
      print "Duration: $dbs->{Duration}->[0]\n";
      print "IPAddress: $dbs->{IPAddress}->[0]\n";
      print "Hostname: $dbs->{Hostname}->[0]\n";
      print "CustomerID: $dbs->{CustomerID}->[0]\n";
      print "----------------------------\n";


      my $UserID="$dbs->{UserID}->[0]"; 
      my $Email="$dbs->{Email}->[0]";
      my $Password="$dbs->{Password}->[0]";
      my $Quota="$dbs->{Quota}->[0]";
      my $Filename="$dbs->{Filename}->[0]";
      my $Duration="$dbs->{Duration}->[0]";
      my $IpAddress="$dbs->{IPAddress}->[0]";
      my $Hostname="$dbs->{Hostname}->[0]";
      my $CustomerID="$dbs->{CustomerID}->[0]";

print "got here";

my $length=length($UserID);
my $first=substr($UserID,0,1);
my $last=substr($UserID,-1,1);
my $acronym="$first$last$length";

my $eyeosroot="/var/www/eyeOSef3e2ecd94";
my $xmlinput="/var/amrox/etc/eyeos.xml";
my $xmloutput="$eyeosroot/accounts/$acronym/$UserID.xml";
my $homeinput="/var/amrox/etc/eyeoshome.tgz";
my $homeoutput="$eyeosroot/users/$acronym/$UserID";
my $passwordhash=md5_hex($Password.md5_hex($Password));
my $start=time;
my $finish=$start+($Duration*86400);

mkdir("$eyeosroot/users/$acronym",0755);
mkdir("$eyeosroot/accounts/$acronym",0755);
mkdir("$homeoutput",0755);
#copy("$homeinput/*","$homeoutput/") or die "Unable to create home dir";
`cd $homeoutput/;tar zxvf $homeinput`;

print "xmlout=$xmloutput\n";
#### Apply Customizations to apache config and move to new location/rename
open INPUTFILE, "<", $xmlinput or die $!;
open OUTPUTFILE, ">", $xmloutput or die $!;
while (<INPUTFILE>) {

  $_ =~ s/%%%USER%%%/$UserID/g;
  $_ =~ s/%%%EMAIL%%%/$Email/g;
  $_ =~ s/%%%HOSTNAME%%%/$Hostname/g;
  $_ =~ s/%%%START%%%/$start/g;
  $_ =~ s/%%%FINISH%%%/$finish/g;
  $_ =~ s/%%%PASSHASH%%%/$passwordhash/g;
  print OUTPUTFILE $_; 
}

close INPUTFILE;
close OUTPUTFILE;


my $newfile="/var/amrox/configs/used/$plat/";
#move($file,$newfile) or die "File cannot be moved to used directory.";

}
}
print "Sending notification email...\n";
#`/var/amrox/scripts/email2.pl $plat $ctids` or die "Unable to send emails";
print "Script Complete\n";
