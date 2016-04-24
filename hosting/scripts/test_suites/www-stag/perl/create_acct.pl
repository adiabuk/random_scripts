use strict;
use warnings;
use Time::HiRes qw(sleep);
use Test::WWW::Selenium;
use Test::More "no_plan";
use Test::Exception;

my $sel = Test::WWW::Selenium->new( host => "localhost", 
                                    port => 4444, 
                                    browser => "*chrome", 
                                    browser_url => "http://www-stag.amroxonline.com/" );

$sel->open_ok("/create_account.php");
$sel->click_ok("name=gender");
$sel->click_ok("name=gender");
$sel->type_ok("name=firstname", "Test1");
$sel->type_ok("name=firstname", "Test1");
$sel->type_ok("name=firstname", "First");
$sel->type_ok("name=firstname", "First");
$sel->type_ok("name=lastname", "Last");
$sel->type_ok("name=lastname", "Last");
$sel->type_ok("name=dob", "04/01/1982");
$sel->type_ok("name=dob", "04/01/1982");
$sel->type_ok("name=email_address", "amro_diab\@yahoo.com");
$sel->type_ok("name=email_address", "amro_diab\@yahoo.com");
$sel->type_ok("name=company", "Company");
$sel->type_ok("name=company", "Company");
$sel->type_ok("name=street_address", "8 Somestreet Close");
$sel->type_ok("name=street_address", "8 Somestreet Close");
$sel->type_ok("name=suburb", "Suburb");
$sel->type_ok("name=suburb", "Suburb");
$sel->type_ok("name=postcode", "FU2 FU2");
$sel->type_ok("name=postcode", "FU2 FU2");
$sel->type_ok("name=city", "Some City");
$sel->type_ok("name=city", "Some City");
$sel->type_ok("name=state", "Some State");
$sel->type_ok("name=state", "Some State");
$sel->select_ok("name=country", "label=United Kingdom");
$sel->select_ok("name=country", "label=United Kingdom");
$sel->type_ok("name=telephone", "01234567890");
$sel->type_ok("name=telephone", "01234567890");
$sel->type_ok("name=fax", "01234567898");
$sel->type_ok("name=fax", "01234567898");
$sel->type_ok("name=password", "password");
$sel->type_ok("name=password", "password");
$sel->type_ok("name=confirmation", "password");
$sel->type_ok("name=confirmation", "password");
$sel->click_ok("css=td > input[type=\"image\"]");
$sel->click_ok("css=td > input[type=\"image\"]");
$sel->wait_for_page_to_load_ok("30000");
