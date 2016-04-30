#!/usr/bin/env perl


# Create WEB instances from available XML data
# Apache config is copied from tamplates into the instance and DB/FTP etc setup
# for a full LAMP environment.  Modify apache template config to include user
# information, hostname, email address etc.
#
# TODO: add this to main Create_VPS script with *web* flag to avoid duplication
# of code
#
# Author: Amro Diab
# Date: 22/04/10

use strict;
use File::Copy;
use XML::Simple;
use Sys::Hostname;

my $ctids;
my $hostraw = hostname();
my @host = split('.',$hostraw);
my $ctids="";
my $plat=$ARGV[0];

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

    copy("/var/amrox/configs/templates/$Filename","/etc/apache2/sites-enabled/$Hostname") or die "Copy failed: $!";
    my $string =~ s/regex/replacement/g;
    my $apache_cfg="/var/amrox/configs/template.txt";
    my $apache_output="/etc/apache2/sites-enabled/$Hostname";

    # Apply Customizations to apache config and move to new location/rename
    open INPUTFILE, "<", $apache_cfg or die $!;
    open OUTPUTFILE, ">", $apache_output or die $!;
    while (<INPUTFILE>) {

      $_ =~ s/%%%%USER%%%/$UserID/g;
      $_ =~ s/%%%EMAIL%%%/$Email/g;
      $_ =~ s/%%%HOSTNAME%%%/$Hostname/g;
      print OUTPUTFILE $_;
    }

    close INPUTFILE;
    close OUTPUTFILE;

    # Create User/Home Dir and extract template
    `useradd -g web -m $UserID` or die "Unable to create user $UserID";
    `cd /home/$UserID && /bin/tar xvf /var/amrox/scripts/$Filename.tar` \
      or die "Unable to extract Template for $UserID";

    my $newfile="/var/amrox/configs/used/$plat/";
    move($file,$newfile) or die "File cannot be moved to used directory.";


  }
}

`/var/amrox/scripts/email2.pl $plat $ctids` or die "Unable to send emails";
print "got to end\n";
