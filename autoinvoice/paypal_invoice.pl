#!/usr/bin/env perl

# This script automatically creates Openoffce/LibreOffice invoices based on a template image and renames as appropriate using paypal csv output with invoice numbers added

# Author: Amro Diab
# Email: support@amroxservices.com

# Modified 15/06/2012

use strict;
use warnings;
use Text::CSV;

my $file=$ARGV[0] or die "ERROR: Supply filename as 1st argument";

sub makeGross {   # Calculate Gross from Net at 20%
  my $mynet=shift(@_);
  my $float=$mynet/1.4;
  my $mygross = sprintf "%.2f",$float;

  return $mygross;

}

sub makeVat { # Calculate different between net and gross to get VAT (20%)

  my $value = shift(@_)-shift(@_);
  my $myvat = sprintf "%.2f",$value;

return $myvat;

}


sub checkEmpty {   # Check if variable is empty

  # This function checks if the variable (field in csv file) is nothing but white space
  # If so it returns REMOVELINE string so that the line can be deleted later
  # Otherwise the original variable is returned back to be substituted as normal

  my $passedvar=shift(@_);  #using shift() but there should only be one entry in the list
  
  if ($passedvar =~ /^\s*$/) {  #If there is nothing but white space
    return "REMOVELINE";        
  } # End If

  else { 
    return $passedvar; 
  } End Else

}  #End checkEmpty sub

sub main {

  my $template = "amroxonlinepaypal"; 
  my $csv = Text::CSV->new();
  $csv->setDelimiter(';');
 
  `rm -rf tmp/*`;

  open (CSV, "<", $file) or die "ERROR: Unable to open file $file";
  my $counter = 0; # Initialize counter - number of invoices

  while (<CSV>) {
    if ($csv->parse($_)) {   # if parsing csv...
    my @columns = $csv->fields();
	
    my $invoiceno = shift(@columns);
    my $description = shift(@columns);
    my $date = shift(@columns);

    shift(@columns); # skip time
    shift(@columns); # skip timezone
    my $name = shift(@columns);

    my $type;
    
    if (shift(@columns) =~ /Standing Order/i) {   #type
      $type = "Standing Order";
    }
    else {
      $type = "Paypal";
    }
  
    shift(@columns); # skip Status
    shift(@columns); # skip Currency
    my $net = shift(@columns); # gross becomes net here - need to calculate
    shift(@columns); # skip fee
    shift(@columns); # skip net
    my $email = shift(@columns);
    shift(@columns); # skip to-email address
    shift(@columns); # skip transaction id
    shift(@columns); # skip counterparty status
    my $address = shift(@columns); # address needs chopping
    $address =~ s/, /\<text\:line-break\/\>/g;
    # Various more columns, but skipping all

  

    if($invoiceno !~ m/Inv/i) { # If the first column contains INV - case insensitive
      # The first field (A1) in the csv needs to have Invoice in it so that the whole
      # row is ignored - any other rows with that word in the first column will also be ignored


      $counter+=1;
      
      my $gross = makeGross($net);
      my $vat = makeVat($net,$gross);
        

      # Extract the template odt (zip file) and rename the content.xml to .old, so it can be outputted back to the original name after substitution
      `mkdir tmp/$invoiceno; cd tmp/$invoiceno;unzip ../../$template.odt;mv content.xml content.xml.old`;

      # $old is the input file, $new is the output file
      my $old="tmp/$invoiceno/content.xml.old";
      my $new="tmp/$invoiceno/content.xml";


     

      ### Open file
      print "Creating $invoiceno.odt...";
      open INPUTFILE, "<", $old or die $!;   #input
      open OUTPUTFILE, ">", $new or die $!;  #output

      while (<INPUTFILE>) {

        #substitute values
        $_ =~ s/INVOICENO/$invoiceno/g;
        $_ =~ s/NAME1/$name/g;
        $_ =~ s/DATE/$date/g;
        $_ =~ s/VATAM/$vat/g;
        $_ =~ s/GROSS/$gross/g;
        $_ =~ s/TOTAL/$net/g;
        $_ =~ s/ADDRESS/$address/g;
        $_ =~ s/METHOD/$type/g;
        $_ =~ s/DESCRIPTION/$description/g;
        $_ =~ s/\<text\:line-break\/\>REMOVELINE//g;  #Remove empty address line
        
        print OUTPUTFILE $_;  # Print substitued output
      } # end of while <INPUTFILE>

      #close both files
      close INPUTFILE;   #input
      close OUTPUTFILE;  #output
      print "done\n";
  
      #remove the old input file, as we already have the new one outputted
      # zip up new odt file with correct name in output directory
      # delete the extracted files
 
      `rm tmp/$invoiceno/content.xml.old;cd tmp/$invoiceno; zip -r ../../output/$invoiceno.odt *;cd ..;rm -rf tmp/$invoiceno/`


      } # End if clause (if line contains Invoice)?
    else {
      print "Skipping Line as row begins with INV\n";
    }

  } # End $csv->parse($_... from top

  else {  #unable to read cvs, or particular lines
    my $err = $csv->error_input;
    print "ERROR: Failed to parse line: $err";
  }
    
} #end while <CVS> from top

#At this stage we have finished parsing the CSV for all entries and can close the file

    close CSV;
print "\n\nCreated $counter invoices in output directory\n\n";
`rm -rf tmp/*`;

}

main();
