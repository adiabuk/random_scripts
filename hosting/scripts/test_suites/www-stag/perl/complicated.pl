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

$sel->open_ok("/index.php");
$sel->click_ok("link=Ubuntu VPS Customize");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("xpath=(//input[\@name='id[11]'])[3]");
$sel->click_ok("xpath=(//input[\@name='id[6]'])[5]");
$sel->click_ok("xpath=(//input[\@name='id[4]'])[4]");
$sel->click_ok("xpath=(//input[\@name='id[7]'])[3]");
$sel->click_ok("css=td.main.button_marg > input[type=\"image\"]");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("css=img[alt=\"Checkout\"]");
$sel->wait_for_page_to_load_ok("30000");
$sel->type_ok("name=comments", "thank you");
$sel->click_ok("css=td.main.vam > input[type=\"image\"]");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("css=td.main.vam > input[type=\"image\"]");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("//*[\@id=\"m1\"]");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("link=Slackware VPS Customize!");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("css=td.main.button_marg > input[type=\"image\"]");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("name=cart_delete[]");
$sel->click_ok("xpath=(//input[\@type='image'])[2]");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("css=img[alt=\"Checkout\"]");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("css=td.main.vam > input[type=\"image\"]");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("css=td.main.vam > input[type=\"image\"]");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("css=img[alt=\"Checkout\"]");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("css=td.main.vam > input[type=\"image\"]");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("name=payment");
$sel->click_ok("css=td.main.vam > input[type=\"image\"]");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("name=agree");
$sel->click_ok("css=td.main.bg_input > input[type=\"image\"]");
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("css=td.main > input[type=\"image\"]");
$sel->wait_for_page_to_load_ok("30000");
