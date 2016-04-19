#!/usr/bin/env perl

  require Text::CSV;

  my $csv = Text::CSV->new;
  $csv = Text::CSV->setDelimiter(';');

  my $column = '';
  my $sample_input_string = '"INV";"Date";" Time";" Time Zone";" Name";" Type";" Status";" Currency";" Gross";" Fee";" Net";" From Email Address";" To Email Address";" Transaction ID";" Counterparty Status";" Postal Address";" Address Status";" Item Title";" Item ID";" Postage and Packaging Amount";" Insurance Amount";" VAT";" Option 1 Name";" Option 1 Value";" Option 2 Name";" Option 2 Value";" Auction Site";" Buyer ID";" Item URL";" Closing Date";" Escrow ID";" Invoice ID";" Reference Txn ID";" Invoice Number";" Custom Number";" Receipt ID";" Balance";" Contact Phone Number";" "';


  # By default, the delimiter is ',', you don't need to change
  if ($csv->parse($sample_input_string)) {
    my @field = $csv->fields;
    my $count = 0;
    for $column (@field) {
      print ++$count, " => ", $column, "\n";
    }
    print "\n";
  } else {
    my $err = $csv->error_input;
    print "parse() failed on argument: ", $err, "\n";
  }

  my @sample_input_fields = ('You said, "Hello!"',
                             5.67,
                             'Surely',
                             '',
                             '3.14159');
  if ($csv->combine(@sample_input_fields)) {
    my $string = $csv->string;
    print $string, "\n";
  } else {
    my $err = $csv->error_input;
    print "combine() failed on argument: ", $err, "\n";
  }

  $csv->setDelimiter(';');
  my $sample_new_input_string = '"I said; ""Hi!""";Yes;"";2.34;;"1.09"';
  if ($csv->parse($sample_new_input_string)) {
    my @fieldN = $csv->fields;
    my $countN = 0;
    for my $column (@fieldN) {
      print ++$count, " => ", $column, "\n";
    }
    print "\n";
  } else {
    my $err = $csv->error_input;
    print "parse() failed on argument: ", $err, "\n";
  }
