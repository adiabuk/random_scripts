<?php
/*
  $Id: paypal_express.php 1798 2008-01-11 15:40:58Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2008 osCommerce

  Released under the GNU General Public License
*/

  define('MODULE_PAYMENT_PAYPAL_EXPRESS_TEXT_TITLE', 'PayPal Express Checkout');
  //define('MODULE_PAYMENT_PAYPAL_EXPRESS_TEXT_PUBLIC_TITLE', 'PayPal Express (including Credit Cards and Debit Cards)');
  // changed per paypal
  define('MODULE_PAYMENT_PAYPAL_EXPRESS_TEXT_PUBLIC_TITLE', '<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr VALIGN="top" ALIGN="left"><td VALIGN="top" height="34" width="50"><img src="https://www.paypal.com/en_US/i/logo/PayPal_mark_50x34.gif" border="0" alt="PayPal"></td><td VALIGN="middle" ALIGN="left" height="34">&nbsp;<font size="1"></b><i>The safer, easier way to pay</i><b></font></td></tr></table>');
  define('MODULE_PAYMENT_PAYPAL_EXPRESS_TEXT_DESCRIPTION', '<img src="images/icon_popup.gif" border="0">&nbsp;<a href="https://www.paypal.com/mrb/pal=PS2X9Q773CKG4" target="_blank" style="text-decoration: underline; font-weight: bold;">Visit PayPal Website</a>&nbsp;<a href="javascript:toggleDivBlock(\'paypalExpressInfo\');">(info)</a><span id="paypalExpressInfo" style="display: none;"><br><i>Using the above link to signup at PayPal grants osCommerce a small financial bonus for referring a customer.</i></span>');
  define('MODULE_PAYMENT_PAYPAL_EXPRESS_TEXT_BUTTON', 'Checkout with PayPal');
  define('MODULE_PAYMENT_PAYPAL_EXPRESS_TEXT_COMMENTS', 'Comments:');

  define('MODULE_PAYMENT_PAYPAL_EXPRESS_RP_TEXT_TITLE', 'Paypal Recurring Payments');
  define('MODULE_PAYMENT_PAYPAL_EXPRESS_RP_TEXT_PUBLIC_TITLE', 'Paypal Recurring Payments for Express Checkout');
?>