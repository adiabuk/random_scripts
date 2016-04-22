#!/usr/bin/perl
use strict;

# Process incoming emails from multiple externel sources
# Determine if from webform/automated newsletter/junk/payments/non-payments/
# purchase etc. based on to/from/subject fields
# Logs can then be used to raise alerts or perform some other action
# such as matching up with actions performed on website
# automated emails sent/received can be matched to events to ensure end-to-end
# process has completed successfully
#
# Author: Amro Diab
# Date: 06/07/2010

sub check_email_list
{
  # get list_of external email addresses we are interested in
  # from emails.txt and return boolean if matched against
  # provided argument

  my $fromline=$_;  # from failed received as arg to compare
  my $return=0;  # default return value (unless match found)
  my $infile='./emails.txt';  # list of email addresses
  open INPUTFILE, "<", $infile or die $!; #input

  my @emails;

  while(<INPUTFILE>) {
    push(@emails, $_);  # read addresses into list
  }

  foreach (@emails){  # loop through all email addresses in list
    chomp $_;  # remove trailing whitespace

    if ( $fromline =~ /$_/i ) { # compare argument with current line
      $return=1;  # match found
    }
  }
  return ($return);  # no match found
}

sub print_output {
  # output to log
  my $myoutput=$_[0];
  my $log = "/var/log/amrox/email.log";
  chomp $myoutput;
  print $myoutput;
  open OUTPUTFILE, ">>", $log or die $!; # output
  print OUTPUTFILE $myoutput . "\n";
  close OUTPUTFILE ;
}

print_output "script called";                         # Called from procmail
my $email1 = 'amro_diab@yahoo.com';                   # from1 - eg paypal
my $email2 = 'hello@localhost';                       # to email
my $email3 = 'hello@avsweb01.amroxonline.com';        # from2

while(<>) {
  my $output;

  # Save the fields we need to identify emails
  ( $_ =~ /^To:/ ) and my $to = $_;
  ( $_ =~ /^From:/ ) and my $from = $_;
  ( $_ =~ /^Subject:/ ) and my $subject = $_;

  # log item if matches found
  if ($to =~ /$email1/i) {
    $output="mail from $email1";
    print_output "fetchmail: $output";
  } elsif ($to =~ /$email3/i) {
    $output="mail to $to";
    print_output "web form: $output";
  } elsif ($from =~ /$email3/i) {
    $output="mail from $email3";
    print_output  "$output";

  } elsif ($_ =~ /^From:/ ) {
      my $out=$_;
      if ( check_email_list $out ) {
        print "got here too\n";
        print_output "External email: $out";
      }
 }

}

print_output "script ended";
