use strict;
use warnings;
use Time::HiRes qw(sleep);
use Test::WWW::Selenium;
use Test::More "no_plan";
use Test::Exception;

my $sel = Test::WWW::Selenium->new( host => "localhost", 
                                    port => 4444, 
                                    browser => "*chrome", 
                                    browser_url => "https://www-stag.amroxonline.com/" );

$sel->open_ok("/contact_us.php");
$sel->type_ok("name=name", "First Last");
$sel->type_ok("name=email", "amro_diab\@yahoo.com");
$sel->type_ok("name=enquiry", "hello this is a test message.\nPlease respond");
$sel->click_ok("css=td > input[type=\"image\"]");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("id=over_m6");
$sel->wait_for_page_to_load_ok("30000");
