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

$sel->open_ok("/create_account_success.php");
$sel->click_ok("css=u");
$sel->wait_for_page_to_load_ok("30000");
$sel->type_ok("name=email_address", "amro_diab\@yahoo.com");
$sel->type_ok("name=password", "password");
$sel->click_ok("xpath=(//input[\@type='image'])[2]");
$sel->wait_for_page_to_load_ok("30000");
