#!/usr/bin/perl
# This is a sample program written in Perl that does the same thing as the
# java program ODBCServer.java
#
# This program needs DBI and DBD installed to works
#
# Author: Daniel Savard <daniel.savard@gespro.com>
# Modifed by Amro Diab 22/04/2010
#
use DBI;
use IO::Socket;
use Sys::Hostname;

# Main program
my $buffer = "";
my $bufLength = 1514;
my $DBDServer = "DBI:mysql:NTOP";
my $socket = null;
my $rv;

# Listen to the udp port
$socket = IO::Socket::INET->new(
				LocalAddr => 'localhost',
				LocalPort => 3000,
				Proto     => 'udp',
				Type      => SOCK_DGRAM);

# Open the database connection
my $dbh = DBI->connect('DBI:mysql:NTOP:$ENV{"MYSQLHOST"}', $ENV{"MYSQLUSER"},
  $ENV{"MYSQLPASSWD"}) or die "Couldn't connect to databas: " .

  DBI->errstr;

# Infinite loop
while(1) {

  # Receive the SQL statement
  recv($socket, $buffer, $bufLength, 0) || die "recv: $!";

  # Print the SQL statement
  print "$buffer\n";

  # Correct the SQL if needed
  $buffer =~ s/^DELETE \*/DELETE/; # Change 'DELETE *' for 'DELETE'

# Correct dates, not needed if ntop gives us yyyy-mm-dd, ntop up
# to 1.2a12 gives mm/dd/yy . 06.02.00 Ralf Amandi
#  @dates= ($buffer =~ m!'../../.. ..:..:..'!g);
#  foreach $date (@dates) {
#    # mm/dd/yy -> yy-mm-dd
#    @items=split("[/ ']",$date,6);
#    $new="'$items[3]-$items[1]-$items[2] $items[4]'";
#    $buffer =~ s/$date/$new/g;
#  }

# Correct insert into host (in the mdb database the default
# for FirstSeen is set to now(). mySQL can not handle this). 06.02.00 Ralf Amandi
  if (substr($buffer,0,59) eq 'INSERT INTO Hosts (IPaddress, MACaddress, NICvendor) VALUES' ) {
      $buffer='INSERT INTO Hosts (IPaddress, MACaddress, NICvendor, FirstSeen) VALUES '.substr($buffer,59,length($buffer)-60).',now())';
  }

  # Execute the SQL statement
  $rv = $dbh -> do($buffer);

  # Print a blank line
  print "\n";
}

