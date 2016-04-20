<?php
  /*
  payer_auth_verifier.php
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
    This is the page that the Card Issuer's Access Control Server (ACS) will
    return the customer to. The Card Issuer will post the results of the
    authentication to this page. The authentication data will be verified using
    the Cardinal Centinel payment module. The response will contain the XID,
    CAVV, ECI, Authentication Status and Signature values.

    Checking these values will determine what the next step in the flow should
    be. If the authentication is successful, then the CAVV, ECI, and XID values
    are made available to the underlying payment module.

    If the authentication was unsuccessful or resulted in an error, the business
    rules ('Proceed without Chargeback Protection') in the module configuration
    will be used to determine if the transaction should continue.

    A configuration value of 'Yes', will allow both authenticated and
    transactions that are unable to be authenticated to complete and proceed to
    authorization. This will result in liability protection for only those
    transactions that were authenticated.

    A configuration value of 'No', will require all consumers to successfully
    authenticate themselves prior to completing the purchase. This will result
    in liability protection granted by the Verified by Visa, MasterCard
    SecureCode, and JCB J/Secure programs on all completed transactions. By
    using this configuration value, you may prevent consumers from using credit
    cards (commercial credit cards, prepaid credit cards) that are simply not
    eligible for the program. In the event that a consumer attempts to use a
    credit card that is not eligible for authentication, they will be
    redirected to the payment details page and prompted for another form of
    payment.

  */


// Get the MD back and set it as the session id
  if (isset($_REQUEST["MD"]) && $_REQUEST["MD"] != null && strlen($_REQUEST["MD"]) != 0) {
    session_id($_REQUEST["MD"]);
  }

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

  $payment_module = $payer_auth_modules->selected_module;
    if($payment_module == 'paypal_direct'){
        $payment_module = new paypal_direct();
    }
  tep_session_unregister('acsURL');
  tep_session_unregister('payload');

  require(DIR_WS_CLASSES . 'order.php');
  $order = new order;


  require(DIR_WS_CLASSES . 'order_total.php');
  $order_total_modules = new order_total;

  $order_totals = $order_total_modules->process();

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

    $recreate_form = false;

    if ($transactionId == null || strcasecmp("", $transactionId) == 0) {

        // validate if the card enrolled lookup requirements have been met
		if ($payer_auth_module->requiresLookup($cc_card_number) == true &&
			strcasecmp('Y', $enroll_lookup_attempted) != 0) {

            // enrollment lookup was required for the card type, but was not completed
            $payment_error_return = 'payment_error=' . $payer_auth_module->code . '&error=' . urlencode('Unable to complete payment, please enter another form of payment.');

            $recreate_form = false;
            $redirectPage = tep_href_link(FILENAME_CHECKOUT_PAYMENT, $payment_error_return, 'SSL', true, false);

        } else {

            // enrollment lookup was either not required for the card type or
            // was required for the card type and completed
            $recreate_form = true;
            $redirectPage = tep_href_link(FILENAME_CHECKOUT_PROCESS, $payment_error_return, 'SSL');
        }

    } else {

        /////////////////////////////////////////////////////////////////////////////////////////
        // Retrieve the PaRes and MD values from the Card Issuer's Form POST to this Term URL page.
        // If you like, the MD data passed to the Card Issuer could contain the TransactionId
        // that would enable you to reestablish the transaction session. This would be the
        // alternative to using the Client Session Cookies
        /////////////////////////////////////////////////////////////////////////////////////////


        $pares = $_POST["PaRes"];

        /////////////////////////////////////////////////////////////////////////////////////////
        // If the PaRes is Not Empty then process the cmpi_authenticate message
        /////////////////////////////////////////////////////////////////////////////////////////

        if (strcasecmp("", $pares )!= 0 && $pares != null) {
            $authenticate_data_array = array('transaction_id' => $transactionId,
                                             'payload' => $pares);

            if (is_object($payer_auth_module)) {
                $payer_auth_class = $payer_auth_module;
                $authenticate_resp_array = $payer_auth_class->authenticate($authenticate_data_array);
            }
            $shouldContinue = $authenticate_resp_array['continue_flag'];
            $auth_status = $authenticate_resp_array['auth_status'];
            $sig_status = $authenticate_resp_array['sig_status'];
            $error_no = $authenticate_resp_array['error_no'];
            $error_desc = $authenticate_resp_array['error_desc'];
            $auth_xid = $authenticate_resp_array['auth_xid'];
            $auth_cavv = $authenticate_resp_array['auth_cavv'];
            $auth_eci = $authenticate_resp_array['auth_eci'];

            tep_session_register('auth_status');
            tep_session_register('auth_xid');
            tep_session_register('auth_cavv');
            tep_session_register('auth_eci');

            tep_session_unregister('transactionId');

            /////////////////////////////////////////////////////////////////////////////////////////
            // Determine if the result was Successful or Error
            //
            // If the Authentication results (PAResStatus) is a Y or A, and the SignatureVerification is Y, then
            // the Payer Authentication was successful. The Authorization Message should be processed,
            // and the User taken to a Order Confirmation location.
            //

            /////////////////////////////////////////////////////////////////////////////////////////
            // If the following condition is met, then the authentication result was acceptable.
            /////////////////////////////////////////////////////////////////////////////////////////

            if (strcasecmp("Y", $shouldContinue) == 0) {
                ////////////////////////////////////////////////////////////////////
                // Business rules are set to continue to authorization
                ////////////////////////////////////////////////////////////////////
                $recreate_form = true;
                $redirectPage = tep_href_link(FILENAME_CHECKOUT_PROCESS, '', 'SSL');

            } else {
                ////////////////////////////////////////////////////////////////////
                // Business rules are set to prompt for another form of payment
                ////////////////////////////////////////////////////////////////////
                $payment_error_return = 'error_message=' . rawurlencode($payer_auth_module->get_authentication_error()) . '&payment_error=' 
                . $payer_auth_module->code . '&error=' . urlencode($payer_auth_module->get_authentication_error());

                $recreate_form = false;

                $redirectPage = tep_href_link(FILENAME_CHECKOUT_PAYMENT, $payment_error_return, 'SSL', true, false);
            }

        } else {
            ////////////////////////////////////////////////////////////////////
            // Business rules are set to continue to authorization
            ////////////////////////////////////////////////////////////////////
            $recreate_form = true;
            $redirectPage = tep_href_link(FILENAME_CHECKOUT_PROCESS, '', 'SSL');
        }
    }

?>
<HTML>
<HEAD>
<title>Payer Authentication Window</title>
<script language="Javascript">

function onLoadHandler(){

	 document.frmResultPage.submit();
}

</script>
</Head>
<body onLoad="onLoadHandler();"></body>

<FORM name="frmResultPage" target="_top" method="Post" action="<?php echo $redirectPage ?>">
<?
    ////////////////////////////////////////////////////////////////////////////
    // Recreate the hidden form fields that the underlying payment module
    // generated for the process order button.
    ////////////////////////////////////////////////////////////////////////////
    $post_vars = unserialize($_SESSION['serialized_post_vars']);

    foreach ($post_vars as $key => $value) {
        $HTTP_POST_VARS[$key] = $value;
    }
    foreach ($HTTP_POST_VARS as $key => $value){
        print '<input type="hidden" name="'.$key.'" value="'.$value.'">'."\n";
    }
    // Call pre_confirmation_check on the underlying payment module.
    // $payment_module->pre_confirmation_check();

    echo $payment_module->process_button();
?>
<noscript>
	<br><br>
	<center>
	<font color="red">
	<h1>Processing your Payer Authentication Transaction</h1>
	<h2>JavaScript is currently disabled or is not supported by your browser.<br></h2>
	<h3>Please click Submit to continue the processing of your transaction.</h3>
	</font>
    <input type="submit" value="Submit">
	</center>
</noscript>
</FORM>
</HTML>
