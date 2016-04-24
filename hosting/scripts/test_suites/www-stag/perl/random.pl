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

$sel->choose_ok_on_next_confirmation_ok();
$sel->open_ok("/index.php");
$sel->type_ok("css=input[name=\"keywords\"]", "Linux");
$sel->click_ok("css=input[type=\"image\"]");
$sel->type_ok("name=keywords", "redhat");
$sel->click_ok("css=input[type=\"image\"]");
$sel->wait_for_page_to_load_ok("30000");
$sel->type_ok("name=keywords", "centos");
$sel->click_ok("css=input[type=\"image\"]");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("link=FAQ");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("//b[\@onclick=\"showItem('faq_answer_7')\"]");
$sel->click_ok("//b[\@onclick=\"showItem('faq_answer_10')\"]");
$sel->click_ok("//b[\@onclick=\"showItem('faq_answer_13')\"]");
$sel->click_ok("link=Privacy Notice");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("link=Linux VPS-> (20)");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("css=img[alt=\"Ubuntu VPS\"]");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("link=Ubuntu VPS Customize");
$sel->wait_for_page_to_load_ok("30000");
