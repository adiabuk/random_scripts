use strict;
use warnings;
use Time::HiRes qw(sleep);
use Test::WWW::Selenium;
use Test::More "no_plan";
use Test::Exception;

# 141 Petros 24.00

my $vps=$ARGV[0];
my $name=$ARGV[1];
my $amount=$ARGV[2];

my $sel = Test::WWW::Selenium->new( host => "localhost", 
                                    port => 4444, 
                                    browser => "*chrome", 
                                    browser_url => "http://www.amroxonline.com/" );

print "####### start $vps #######\n";

$sel->open_ok("/resume_$vps.php");
$sel->is_text_present_ok("Please enter VPS");
$sel->type_ok("//html/body/table/tbody/tr/td/table/tbody/tr[2]/td/table/tbody/tr/td[2]/table/tbody/tr[6]/td/center/form/table/tbody/tr[2]/td/input", "hello123");
$sel->click_ok("css=form > table");
$sel->click_ok("name=submit");
$sel->wait_for_page_to_load_ok("30000");
$sel->is_text_present_ok("hello123");
$sel->title_is("Billing Information - PayPal");
$sel->is_text_present_ok("$name");
$sel->is_text_present_ok("$amount GBP");
$sel->click_ok("id=cnt");
$sel->wait_for_page_to_load_ok("30000");
print "####### end $vps #######\n\n\n\n";
