#!/usr/bin/env perl

# This script automatically creates Openoffce/LibreOffice invoices based on a template image and renames as appropriate
# Author: Amro Diab
# Email: support@amroxservices.com

use strict;
use warnings;
use Text::CSV;



sub checkEmpty {

  # This function checks if the variable (field in csv file) is nothing but white space
  # If so it returns REMOVELINE string so that the line can be deleted later
  # Otherwise the original variable is returned back to be substituted as normal

  my $passedvar=shift(@_);  #using shift() but there should only be one entry in the list

  if ($passedvar =~ /^\s*$/) {  #If there is nothing but white space
    return "REMOVELINE";
  }

  else {
    return $passedvar;
  }

}  #End checkEmpty sub


my $file = 'address.csv';  # CSV file containing details to be parsed
my $csv = Text::CSV->new();

# Clear tmp dir
`rm -rf tmp/*`;

open (CSV, "<", $file) or die $!;

while (<CSV>) {

  #Do not change order of shifts, this is the order given in the csv file.

  if ($csv->parse($_)) {   # if parsing csv...
  my @columns = $csv->fields();

  my $name = shift(@columns);
  my $first = shift(@columns);
  my $second = shift(@columns);

#Address fields may sometime be empty for different customers - if so, then replace with DELETELINE, so that the whole
#Line can be removed from the XML when substituting later

  my $address1 = &checkEmpty(shift(@columns));
  my $address2 = &checkEmpty(shift(@columns));
  my $postcode = &checkEmpty(shift(@columns));
  my $city = &checkEmpty(shift(@columns));
  my $region = &checkEmpty(shift(@columns));

  my $gross=shift(@columns);
  my $vat=shift(@columns);
  my $net=shift(@columns);
  my $date=shift(@columns);
  my $template=shift(@columns);
  my $description=shift(@columns);
  my $create=shift(@columns);
  my $print=shift(@columns);
  my $email=shift(@columns);

  #Easier to add new columns here (at the end of the CSV file) to avoid confusion

  if($name !~ m/Invoice/i)
  # The first field (A1) in the csv needs to have Inovice in it so that the whole
  # row is ignored - any other rows with that word in the first column will also be ignored

  {


    # Extract the odt (zip file) and rename the content.xml to .old, so it can be outputted back to the original name
    # after substitution

    `mkdir tmp/$name; cd tmp/$name;unzip ../../$template.odt;mv content.xml content.xml.old`;

    # $old is the input file, $new is the output file

    my $old="tmp/$name/content.xml.old";
    my $new="tmp/$name/content.xml";

    ### Open file
    open INPUTFILE, "<", $old or die $!;   #input
    open OUTPUTFILE, ">", $new or die $!;  #output

    while (<INPUTFILE>) {


      #substitute values
      $_ =~ s/NAME1/$first/g;
      $_ =~ s/NAME2/$second/g;
      $_ =~ s/LINE1/$address1/g;
      $_ =~ s/LINE2/$address2/g;
      $_ =~ s/LINE3/$city/g;
      $_ =~ s/LINE4/$region/g;
      $_ =~ s/LINE5/$postcode/g;
      $_ =~ s/INVOICENO/$name/g;
      $_ =~ s/DATE/$date/g;
      #$_ =~ s/PAYMENT/$payment/g;			#For future use
      $_ =~ s/GROSS/$gross/g;
      $_ =~ s/VATAM/$vat/g;
      $_ =~ s/TOTAL/$net/g;
      $_ =~ s/DESCRIPTION/$description/g;
      $_ =~ s/\<text\:line-break\/\>REMOVELINE//g;  #Remove empty address line
      print OUTPUTFILE $_;
    } # end of while <INPUTFILE>

  #close both files
  close INPUTFILE;   #input
  close OUTPUTFILE;  #output

  #remove the old input file, as we already have the new one outputted
  # zip up new odt file with correct name in output directory
  # delete the extracted files

  `rm tmp/$name/content.xml.old;cd tmp/$name; zip -r ../../output/$name.odt *;cd ..;rm -rf tmp/$name/`


  } # End if clause (if line contains Invoice)?

} # End $csv->parse($_... from top

else {  #unable to read cvs, or particular lines
  my $err = $csv->error_input;
  print "Failed to parse line: $err";
}

} #end while <CVS> from top

#At this stage we have finished parsing the CSV for all entries and can close the file

    close CSV;
