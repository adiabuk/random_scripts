#!/usr/bin/perl -w

#
# memcache_new_ - Munin plugin
#
#
# Copyright (C) 2011 Amro Diab
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
#
#
# Report bugs to: amro.diab@amroxonline.com
#
# 28.09.2011 v.1.0 - First Draft
# 29.09.2011 v.1.1 - Changed system graph to COUNTER
# 29.09.2011 v.1.2 - Close TCP port after gathering data to avoid mupltiple
#                    connections in TIME_WAIT


use IO::Socket;
use strict;

my $ports = $ENV{ports};
my @ports = split(/\s/,$ports);

my $size = scalar(@ports);
my $host = $ENV{host};

my $value;
my $total;
my $args;
my $info;
my $port;
my $search;
my $title;
my $type;
my %values;
my $vlabel;


$0 =~ /memcache_new_(.+)*/;
my $plugin = $1;


if ($plugin eq "memory") {
  $search = "bytes";
  $args = "--base 1024 -l 0 --vertical-label Bytes";
  $info = "This graph shows the memory used by memcache for different ports";
  $vlabel = "bytes";
  $title = "Memcache Memory";
  $type = "GAUGE";
}

elsif ($plugin eq "system") {
  $search = "rusage_system";
  $args = "--base 1024 -l 0 --vertical-label seconds";
  $info = "This graph shows the seconds the cpu has devoted to memcache for different ports";
  $vlabel = "seconds";
  $title = "Memcache CPU";
  $type = "COUNTER";
}

  elsif ($plugin eq "connections") {
  $search = "curr_connections";
  $info = "This graph shows the number of connections used by memcache for different ports";
  $args = "--base 1024 -l 0";
  $vlabel = "connections";
  $title = "Memcache Connections";
  $type = "GAUGE";
}

elsif ($plugin eq "threads") {
  $search = $plugin;
  $info = "This graph shows the number of threads used by memcache for different ports";
  $args = "--base 1024 -l 0";
  $vlabel = "threads";
  $title = "Memcache Threads";
  $type = "GAUGE";
}

elsif ($plugin eq "items") {
  $search = "curr_items";
  $info = "This graph shows the number of current items in memcache for different ports";
  $vlabel = "items";
  $args = "--base 1024 -l 0";
  $title = "Memcache Items";
  $type = "GAUGE";
}

elsif ($plugin eq "hits") {
  $search = "get_hits";
  $info = "This graph shows the number of get hits in memcache for different ports";
  $vlabel = "hits";
  $args = "--base 1024 -l 0";
  $title = "Memcache GET hits";
  $type = "COUNTER";
}

elsif ($plugin eq "misses") {
  $search = "get_misses";
  $info = "This graph shows the number of get misses in memcache for different ports";
  $vlabel = "misses";
  $args = "--base 1024 -l 0";
  $title = "Memcache GET misses";
  $type = "COUNTER";
}

elsif ($plugin eq "evictions") {
  $search = "evictions";
  $info = "This graph shows the number of evictions in memcache for different ports";
  $vlabel = "evictions";
  $args = "--base 1024 -l 0";
  $title = "Memcache Evictions";
  $type = "COUNTER";
}

elsif ($plugin eq "get") {
  $search = "cmd_get";
  $info = "This graph shows the number GET commands issued to memcache for different ports";
  $vlabel = "get";
  $args = "--base 1024 -l 0";
  $title = "Memcache GET Issued";
  $type = "COUNTER";
}

elsif ($plugin eq "set") {
  $search = "cmd_set";
  $info = "This graph shows the number SET commands issued to memcache for different ports";
  $vlabel = "set";
  $args = "--base 1024 -l 0";
  $title = "Memcache SET Issued";
  $type = "COUNTER";
}

elsif ($plugin eq "read") {
  $search = "bytes_read";
  $info = "This graph shows the data read by memcache for different ports";
  $vlabel = "bytes_read";
  $args = "--base 1024 -l 0";
  $title = "Memcache read data";
  $type = "COUNTER";
}

elsif ($plugin eq "written") {
  $search = "bytes_written";
  $info = "This graph shows the data written by memcache for different ports";
  $vlabel = "bytes_written";
  $args = "--base 1024 -l 0";
  $title = "Memcache written data";
  $type = "COUNTER";
}

if (defined $ARGV[0] && $ARGV[0] eq 'config') {
  print "graph_scale yes\n";
  print "average.label average\n";
  print "average.draw LINE3\n";
  print "average.type $type\n";

  foreach my $port (@ports) {
    print "$port.label $port\n";
    print "$port.draw LINE2\n";
    print "$port.type $type\n";
  }

  print "graph_info $info\n";
  print "graph_args $args\n";
  print "graph_vlabel $vlabel\n";
  print "graph_category memcache\n";
  print "graph_title $title\n";
  exit 0;
}


get_stats($search) or die "unknown plugin\n";


sub get_stats {
  my $plugin = $_[0];

  foreach $port (@ports)
  {
     my $s = IO::Socket::INET->new(
       Proto    => "tcp",
       PeerAddr => $host,
       PeerPort => $port,
     );


    print $s "stats\r\n";

    while (my $line = <$s>) {
        if ($line =~ /STAT\s$search\s(\d+)/) {
           $value = $1;
           $total += $value;
           $values{$port} = $value;
        }
        last if $line =~ /^END/;
    }
  close $s;
}

my $average = $total/$size;

foreach $port (@ports) {
  print "$port.value $values{$port}\n";
}

print "average.value $average\n";

}
