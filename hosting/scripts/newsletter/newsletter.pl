#!/usr/bin/perl

# Automated newsletter, and reminder email tool
# Author: Amro Diab
# Date: 17/05/2010

use strict;
use warnings;

print $ARGV[0];

open (MYFILE, 'letter');
while(<MYFILE>) {
  $emailcontent .= $_;
}
$email=$ARGV[0];
my $to=$email;
my $from='"VPS SUPPORT" <support@amroxonline.com>';
my $bcc='"VPS SUPPORT" <support@amroxonline.com>';
my $subject='All VPS and webservices have resumed';

print "the following email will be sent:\n";
print "To: $to\n";
print "From: $from\n";
print "Subject: $subject\n";
print "$emailcontent";

print "\n\nDo you wish to proceed? [y/n]";

print "answer:" . $answer;
$answer='y';
$answer = <STDIN>; #Enable this to wait for user input
if ($answer =~ /y/){


  print "sending email to: $to \n";

  open(MAIL, "|/usr/sbin/sendmail -t"); 
  ## Mail Header
  print MAIL "To: $to\n";
  print MAIL "BCC: $bcc\n";
  print MAIL "From: $from\n";
  print MAIL "Subject: $subject\n";


  ## Mail Body
  print MAIL $emailcontent;

  close(MAIL);

}
