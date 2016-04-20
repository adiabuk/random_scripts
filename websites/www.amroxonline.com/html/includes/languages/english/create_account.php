<?php
/*
  $Id: create_account.php 1739 2007-12-20 00:52:16Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

define('NAVBAR_TITLE', 'Create an Account');

define('HEADING_TITLE', 'My Account Information');

define('TEXT_ORIGIN_LOGIN', '<font color="#FF0000"><small><b>NOTE:</b></font></small> If you already have an account with us, please login at the <a href="%s"><u>login page</u></a>.');
define('EMAIL_STYLE', '<div style="display: inline-block;  font-family: \'Lucida Grande\', Verdana, Arial, Sans-Serif; color: #337099;  background-color: #eef3f6;">

<center><a href="http://www.amroxonline.com"><img src="http://www.amroxonline.com/images/logo.gif" border="0" alt="Amrox Online - Custom Online Solutions"></a></center>');
define('EMAIL_SUBJECT', 'Welcome to ' . STORE_NAME);
define('EMAIL_GREET_MR', EMAIL_STYLE . 'Dear Mr. %s,' . "\n\n");
define('EMAIL_GREET_MS', EMAIL_STYLE . 'Dear Ms. %s,' . "\n\n");
define('EMAIL_GREET_NONE', EMAIL_STYLE . 'Dear %s' . "\n\n");
define('EMAIL_WELCOME', 'We welcome you to <b>' . STORE_NAME . '</b>.' . "\n\n");
define('EMAIL_TEXT', 'Your account is now active and you can now take part in the various services we have to offer you. Some of these services include: <br><br><li><b>Linux VPS</b> - offering a range of different Linux distributions and giving you full control of architecture, bandwidth, hard drive, memory, support options, and length of contract.  Your requirements, therefore your choice.  We currently offer you a choice of Debian, Slackware, Centos, Fedora Core, and Ubuntu, including several different versions of each.</li><li><b>Cloud Solutions</b> - coming soon, web desktops, online applications, web tools, and much much more...</li><li><b>Unix VPS</b> - Coming soon, Virtualized Unix solutions.  Just like with the Linux VPS solutions we will give you full control of every aspect of the VPS.  OSs to be made available: FreeBSD, OpenSolaris</li><br><br> To get started now login to our website at <a href="http://www.amroxonline.com">http://www.amroxonline.com</a><br><br>');

define('EMAIL_CONTACT', 'For help with any of our online services, please email us at: <a href="mailto:' . STORE_OWNER_EMAIL_ADDRESS . '">'. STORE_OWNER_EMAIL_ADDRESS . '</a>' . "\n\n" . '</div>');
define('EMAIL_WARNING', '<b>Note:</b> This email address was given to us by one of our customers. If you did not signup to be a member, please send an email to ' . STORE_OWNER_EMAIL_ADDRESS . '.' . "\n");
?>
