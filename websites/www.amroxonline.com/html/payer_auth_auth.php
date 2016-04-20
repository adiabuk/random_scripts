<?php
  /*
  payer_auth_auth.php
  Version 1.4 11/21/2005

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2004 osCommerce

  Released under the GNU General Public License

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  Contributed by CardinalCommerce
  http://www.cardinalcommerce.com

  Purpose
    Form used to POST the payer authentication request to the Card Issuer's
    Access Control Server (ACS). The ACS will in-turn display the payer
    authentication window to the consumer within this area.

    Note that the form field names below are CASE SENSITIVE, and all form
    fields listed below are required.

  */


  require('includes/application_top.php');

// if the customer is not logged on, redirect them to the login page
  if (!tep_session_is_registered('customer_id')) {
    $navigation->set_snapshot(array('mode' => 'SSL', 'page' => FILENAME_CHECKOUT_PAYMENT));
    tep_redirect(tep_href_link(FILENAME_LOGIN, '', 'SSL'));
  }

// if there is nothing in the customers cart, redirect them to the shopping cart page
  if ($cart->count_contents() < 1) {
    tep_redirect(tep_href_link(FILENAME_SHOPPING_CART));
  }

// avoid hack attempts during the checkout procedure by checking the internal cartID
  if (isset($cart->cartID) && tep_session_is_registered('cartID')) {
    if ($cart->cartID != $cartID) {
      tep_redirect(tep_href_link(FILENAME_CHECKOUT_SHIPPING, '', 'SSL'));
    }
  }

// if no shipping method has been selected, redirect the customer to the shipping method selection page
  if (!tep_session_is_registered('shipping')) {
    tep_redirect(tep_href_link(FILENAME_CHECKOUT_SHIPPING, '', 'SSL'));
  }

  if (!tep_session_is_registered('payment')) tep_session_register('payment');
  if (isset($HTTP_POST_VARS['payment'])) $payment = $HTTP_POST_VARS['payment'];

  if (!tep_session_is_registered('comments')) tep_session_register('comments');
  if (tep_not_null($HTTP_POST_VARS['comments'])) {
    $comments = tep_db_prepare_input($HTTP_POST_VARS['comments']);
  }

// load all enabled payer auth modules
  require(DIR_WS_CLASSES . 'payment.php');
  $payer_auth_modules = new payment($payment);
  $payer_auth_module = $GLOBALS[$payment];

/////////////////////////////////////////////////////////////////////////////////////////////
// Note that the MD value is available for session management if required. Any value that is
// passed thru the MD form field will be available from the TermUrl to re-establish session.
/////////////////////////////////////////////////////////////////////////////////////////////
?>
<HTML>
<HEAD>
<SCRIPT Language="Javascript">
	function onLoadHandler(){
		document.frmLaunchACS.submit();
	}
</SCRIPT>
</HEAD>
<body onLoad="onLoadHandler();">
<br><br><br><br>
<center>
<FORM name="frmLaunchACS" method="Post" action="<? echo $acsURL ?>">
<input type=hidden name="PaReq" value="<? echo $payload ?>">
<input type=hidden name="TermUrl" value="<? echo $term_url ?>">
<input type=hidden name="MD" value="<? echo tep_session_id() ?>">
<noscript>
	<br><br>
	<center>
	<font color="red">
	<h1>Processing your Payer Authentication Transaction</h1>
	<h2>JavaScript is currently disabled or is not supported by your browser.<br></h2>
	<h3>Please click Submit to continue	the processing of your transaction.</h3>
	</font>
	<input type="submit" value="Submit">
	</center>
</noscript>
</FORM>
</center>
</BODY>
</HTML>