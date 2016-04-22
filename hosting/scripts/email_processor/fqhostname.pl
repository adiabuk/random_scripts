#!/usr/bin/perl

use Net::Domain qw(hostname hostfqdn hostdomain domainname);

    $host = hostfqdn();

print "$host \n"
