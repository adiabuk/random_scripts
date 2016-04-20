<?php
  /*
  payer_auth_frame.php
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
    Creates a frame display so the the customer can complete payer authentication
    but still have the experience that they have not left the online store.

    Please note, you may need to adjust the height of the frame containing the
    payer_auth_header.php page. It includes the header of your site which can
    vary. The default setting is 150 pixels, this should be the minimum.

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

  require(DIR_WS_CLASSES . 'order.php');
  $order = new order;

  require(DIR_WS_CLASSES . 'order_total.php');
  $order_total_modules = new order_total;

// load all enabled payer auth modules
  require(DIR_WS_CLASSES . 'payment.php');
  $payer_auth_modules = new payment($payment);
  $payer_auth_module = $GLOBALS[$payment];

//  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_PAYER_AUTHENTICATION);

  $breadcrumb->add(NAVBAR_TITLE_1, tep_href_link(FILENAME_CHECKOUT_CONFIRMATION, '', 'SSL'));
  $breadcrumb->add(NAVBAR_TITLE_2);


	/////////////////////////////////////////////////////////////////////////////////////////////
	// Check the transaction Id value to verify that this transaction has not already
	// been processed. This attempts to block the user from using the back button.
	/////////////////////////////////////////////////////////////////////////////////////////////

	if (!isset($transactionId)) {

        tep_redirect(tep_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL', true, false));

	}
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE; ?></title>
<base href="<?php echo (($request_type == 'SSL') ? HTTPS_SERVER : HTTP_SERVER) . DIR_WS_CATALOG; ?>">
<link rel="stylesheet" type="text/css" href="stylesheet.css">

<?php

    $queryString = '';
    if ( ($session_started == true) && (SESSION_FORCE_COOKIE_USE == 'False') ) {
      if (tep_not_null($SID)) {
        $queryString = '?' . $SID;
      } elseif ( ( ($request_type == 'NONSSL') && ($connection == 'SSL') && (ENABLE_SSL == true) ) || ( ($request_type == 'SSL') && ($connection == 'NONSSL') ) ) {
        if (HTTP_COOKIE_DOMAIN != HTTPS_COOKIE_DOMAIN) {
          $queryString = '?' . tep_session_name() . '=' . tep_session_id();
        }
      }
    }

    $term_url = tep_href_link('payer_auth_verifier.php', $queryString, 'SSL', true, false);
    $header_url = tep_href_link('payer_auth_header.php', $queryString, 'SSL', true, false);
    $auth_url = tep_href_link('payer_auth_auth.php', $queryString, 'SSL', true, false);

    tep_session_register('term_url');
?>
<SCRIPT Language="Javascript">


	function displayJavascriptEnabledForm(){
		document.write('<FRAMESET ROWS=\"150, *\" frameborder=\"NO\" border=\"0\" framespacing=\"0\">');
			document.write('<FRAME SRC=\"<?php echo $header_url ?>\" NAME=header SCROLLING=NO noresize>');
            document.write('<FRAME SRC=\"<?php echo $auth_url ?>\" NAME=WINDOW scrolling=auto noresize>');
		document.write('</FRAMESET>');
	}

	displayJavascriptEnabledForm();

</Script>
</head>

<noscript>
	<FORM name="frmLaunchACS" method="Post" action="<?php echo $acsURL ?>">
		<input type=hidden name="PaReq" value="<?php echo $payload ?>">
		<input type=hidden name="TermUrl" value="<?php echo $term_url ?>">
		<input type=hidden name="MD" value="<? echo tep_session_id() ?>">
		<br><br>
		<center>
		<font color="red">
		<h1>Processing your Payer Authentication Transaction</h1>
		<h2>JavaScript is currently disabled or is not supported by your browser.<br></h2>
		<h3>Please click Submit to continue	the processing of your transaction.</h3>
		</font>
		<input type="submit" value="Submit">
		</center>
	</FORM>
</noscript>
</HTML>
