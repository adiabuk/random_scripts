#!/usr/bin/perl

# Create VMs from available XML data
# Called whenever new config has been detcted with plat (STAG|PROD) as arg
# Re-write of Create_VPS.sh in perl, to avoid mixing bash and perl in the same
# file and to allow future expanstion of other instance types.
#
# Author: Amro Diab
# Date: 18/12/08

use strict;
use File::Copy;
use XML::Simple;
use Sys::Hostname;

sub diehard {
  # fail with error, and generate alarm for host with details.
  my $output="FAILED: @_";
  print "$output\n";
  `/var/amrox/scripts/nagios_nsca.sh "Create_VPS" "$output" 1 $(hostname -s)`;
  exit 1;
}

my $ctids;
my $host = hostname();
my $ctids="";
my $plat=$ARGV[0];

my @files = </var/amrox/configs/new/$host/$plat/*>;
foreach my $file (@files) {
  print $file . "\n";
  # Parse the input XML document
  my $root = XMLin("$file", forcearray=>1);

  for my $dbs (@{$root->{product}}) {
    print "Memory: $dbs->{Memory}->[0]\n";
    print "Duration: $dbs->{Duration}->[0]\n";
    print "Memory: $dbs->{Memory}->[0]\n";
    print "MaxMemory: $dbs->{Maxmemory}->[0]\n";
    print "CustomerID: $dbs->{CustomerID}->[0]\n";
    print "SoftHD: $dbs->{SoftHD}->[0]\n";
    print "HardHD: $dbs->{HardHD}->[0]\n";
    print "Filename: $dbs->{Filename}->[0]\n";
    print "IPID: $dbs->{IPID}->[0]\n";
    print "Gateway: $dbs->{Gateway}->[0]\n";
    print "IPAddress: $dbs->{IPAddress}->[0]\n";
    print "NameServer1: $dbs->{NameServer1}->[0]\n";
    print "Password: $dbs->{Password}->[0]\n";
    print "hostname: $dbs->{hostname}->[0]\n";
    print "CTID: $dbs->{CTID}->[0]\n";
    print "VMID: $dbs->{VMID}->[0]\n";
    print "----------------------------\n";


    my $Memory="$dbs->{Memory}->[0]";
    my $Duration="$dbs->{Duration}->[0]";
    my $Memory="$dbs->{Memory}->[0]";
    my $MaxMemory="$dbs->{Maxmemory}->[0]";
    my $CustomerID="$dbs->{CustomerID}->[0]";
    my $SoftHD="$dbs->{SoftHD}->[0]";
    my $HardHD="$dbs->{HardHD}->[0]";
    my $Filename="$dbs->{Filename}->[0]";
    my $IPID="$dbs->{IPID}->[0]";
    my $Gateway="$dbs->{Gateway}->[0]";
    my $IPAddress="$dbs->{IPAddress}->[0]";
    my $NameServer1="$dbs->{NameServer1}->[0]";
    my $Password="$dbs->{Password}->[0]";
    my $hostname="$dbs->{hostname}->[0]";
    my $CTID="$dbs->{CTID}->[0]";
    my $VMID="$dbs->{VMID}->[0]";
    my $RealMemory=$Memory * 256;
    my $Inodes=$SoftHD * 2;
    print "/usr/sbin/vzctl create ${CTID} --ostemplate ${Filename}";
    `/usr/sbin/vzctl create ${CTID} --ostemplate ${Filename}`
      or diehard "Unable to create VPS: $CTID:$Filename";
    print "\nfinished creating vm $CTID: ${Filename}\n\n";
    `/usr/sbin/vzctl set ${CTID} --ipadd $IPAddress --save `
      or diehard "Unable to set IP address:$CTID:IPAddress";
    `/usr/sbin/vzctl set ${CTID} --hostname ${hostname} --save`
      or diehard "Unable to configure VPS:CTID:$hostname";
    `/usr/sbin/vzctl set ${CTID} --nameserver $NameServer1 --save`
      or diehard "Unable to configure VPS:$CTID:$NameServer1";
    `/usr/sbin/vzctl set ${CTID} --vmguarpages $RealMemory --save`
      or diehard "Unable to configure VPS:$CTID:RealMemory:attempt1";
    `/usr/sbin/vzctl set ${CTID} --privvmpages $RealMemory --save`
      or diehard "Unable to configure VPS:$CTID:RealMemory:attempt2";
    `/usr/sbin/vzctl set ${CTID} --userpasswd root:\"$Password\" --save`
      or diehard "Unable to configure VPS:$CTID:Password";
    `/usr/sbin/vzctl set ${CTID} --diskspace $SoftHD:$HardHD --save`
      or diehard "Unable to configure VPS:$CTID:HD:$SoftHD:$HardHD";
    `/usr/sbin/vzctl start ${CTID} `or diehard "Unable to start VPS:$CTID";
    `/sbin/iptables -A FORWARD -s $IPAddress`
      or diehard "Unable to create Source Iptables rules: $IPAddress";
    `/sbin/iptables -A FORWARD -d $IPAddress `
      or diehard "Unable to create Destination Iptables rules: IPAddress";
    $ctids="$ctids $CTID";

    # Set Additional ovz vars
    `/usr/sbin/vzctl set ${CTID} --kmemsize=40372700 --save`
      or diehard "Unable to set kmemsize:$CTID:IPAddress";
    `/usr/sbin/vzctl set ${CTID} --tcpsndbuf=2803360 --save`
      or diehard "Unable to set tcpsndbuf:$CTID:IPAddress";
    `/usr/sbin/vzctl set ${CTID} --tcprcvbuf=2803360 --save`
      or diehard "Unable to set tcprcvbuf:$CTID:IPAddress";
    `/usr/sbin/vzctl set ${CTID} --othersockbuf=3397152`
      or diehard "Unable to set othersockbuf:$CTID:IPAddress";
    `/usr/sbin/vzctl set ${CTID} --numothersock=1024 --save`
      or diehard "Unable to set numothersock:$CTID:IPAddress";
    `/usr/sbin/vzctl set ${CTID} --lockedpages=768 --save`
      or diehard "Unable to set lockedpages:$CTID:IPAddress";
    `/usr/sbin/vzctl set ${CTID} --numproc=400 --save`
      or diehard "Unable to set numproc:$CTID:IPAddress";
    `/usr/sbin/vzctl set ${CTID} --diskinodes=$Inodes --save`
      or diehard "Unable to set inodes:$Inodes";
    `/usr/sbin/vzctl set ${CTID} --tcprcvbuf=20000000 --save`
      or diehard "Unable to set tcprcvbuf";
    `/usr/sbin/vzctl set ${CTID} --tcpsndbuf=20000000 --save`
      or diehard "Unable to set tcpsndbuf";
    `/usr/sbin/vzctl set ${CTID} --iptables iptable_filter
      --iptables ipt_length --tables ipt_limit --iptables iptable_mangle
      --iptables ipt_REJECT -save` or diehard "Unable to add iptables module";
  }
  my $newfile="/var/amrox/configs/used/$plat/";
  move($file,$newfile) or diehard "File cannot be moved to used directory.";

}

# send email
`/var/amrox/scripts/email2.pl $plat $ctids` or diehard "Unable to send emails";
print "got to end";
