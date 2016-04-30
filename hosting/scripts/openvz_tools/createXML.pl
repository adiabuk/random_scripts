#!/usr/bin/perl

# Raw XML Writer for config
#
# Author: Amro Diab
# Date: 09/10/08

use XML::Writer;
use IO::File;

my $output = new IO::File(">output.xml");
my $writer = new XML::Writer(OUTPUT => $output);
# print the open tag, including the attribute
$writer->startTag("order", id => "orderid", customerid => "customerid");

$writer->startTag("product", id => "productid");

# print an element containing only text
$writer->dataElement( Duration => "Simple Doc");
$writer->dataElement( Memory => "Simple Doc");
$writer->dataElement( Maxmemory => "Simple Doc");
$writer->dataElement( CustomerID => "Simple Doc");
$writer->dataElement( SoftHD => "Simple Doc");
$writer->dataElement( HardID => "Simple Doc");
$writer->dataElement( Filename => "Simple Doc");
$writer->dataElement( IPID => "Simple Doc");
$writer->dataElement( Gateway => "Simple Doc");
$writer->dataElement( NameServer1 => "Simple Doc");
$writer->dataElement( Password => "Simple Doc");
$writer->dataElement( CTID => "Simple Doc");
$writer->dataElement( VMID => "Simple Doc");
  $writer->startTag( "section");
    $writer->dataElement( title => "Introduction", no => 1, type => "intro");
    $writer->endTag(); # close section
  $writer->endTag(); # close writer
$writer->endTag(); # final checks
$writer->end(); # final checks

$output->close();


