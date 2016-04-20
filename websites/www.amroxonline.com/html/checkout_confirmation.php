<?php
/*
  $Id: checkout_confirmation.php 1739 2007-12-20 00:52:16Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
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
  
  //kgt - discount coupons
  if (!tep_session_is_registered('coupon')) tep_session_register('coupon');
  //this needs to be set before the order object is created, but we must process it after
  if(isset($HTTP_POST_VARS['coupon']))$coupon = tep_db_prepare_input($HTTP_POST_VARS['coupon']);
  //end kgt - discount coupons

// load the selected payment module
  require(DIR_WS_CLASSES . 'payment.php');
  $payment_modules = new payment($payment);
  /**
   * START
   * PayPal 3d Secure
   *
   * see if the module is paypal_direct if so check secure
   * enabled or not
   */
  if($payment_modules->selected_module == 'paypal_direct'){
            $paymentDirect = new paypal_direct();
        if($paymentDirect->secure_enabled){
                // clear any previous session settings
                $paymentDirect->remove3dSecureSession();
        }
  }
  /**
   * END
   * PayPal 3d Secure
   */

  require(DIR_WS_CLASSES . 'order.php');
  $order = new order;

  $payment_modules->update_status();

  if ( ( is_array($payment_modules->modules) && (sizeof($payment_modules->modules) > 1) && !is_object($$payment) ) || (is_object($$payment) && ($$payment->enabled == false)) ) {
    tep_redirect(tep_href_link(FILENAME_CHECKOUT_PAYMENT, 'error_message=' . urlencode(ERROR_NO_PAYMENT_MODULE_SELECTED), 'SSL'));
  }

  //kgt - discount coupons
  if( tep_not_null( $coupon ) && is_object( $order->coupon ) ) { //if they have entered something in the coupon field
    $order->coupon->verify_code();
    if( MODULE_ORDER_TOTAL_DISCOUNT_COUPON_DEBUG != 'true' ) {
		  if( !$order->coupon->is_errors() ) { //if we have passed all tests (no error message), make sure we still meet free shipping requirements, if any
			  if( $order->coupon->is_recalc_shipping() ) tep_redirect( tep_href_link( FILENAME_CHECKOUT_SHIPPING, 'error_message=' . urlencode( ENTRY_DISCOUNT_COUPON_SHIPPING_CALC_ERROR ), 'SSL' ) ); //redirect to the shipping page to reselect the shipping method
		  } else {
			  if( tep_session_is_registered('coupon') ) tep_session_unregister('coupon'); //remove the coupon from the session
			  tep_redirect( tep_href_link( FILENAME_CHECKOUT_PAYMENT, 'error_message=' . urlencode( implode( ' ', $order->coupon->get_messages() ) ), 'SSL' ) ); //redirect to the payment page
		  }
    }
	} else { //if the coupon field is empty, unregister the coupon from the session
		if( tep_session_is_registered('coupon') ) { //we had a coupon entered before, so we need to unregister it
      tep_session_unregister('coupon');
      //now check to see if we need to recalculate shipping:
      require_once( DIR_WS_CLASSES.'discount_coupon.php' );
      if( discount_coupon::is_recalc_shipping() ) tep_redirect( tep_href_link( FILENAME_CHECKOUT_SHIPPING, 'error_message=' . urlencode( ENTRY_DISCOUNT_COUPON_SHIPPING_CALC_ERROR ), 'SSL' ) ); //redirect to the shipping page to reselect the shipping method
    }
	}
	//end kgt - discount coupons
	
  if (is_array($payment_modules->modules)) {
    $payment_modules->pre_confirmation_check();
  }
//echo $order->info['total'];
// load the selected shipping module
  require(DIR_WS_CLASSES . 'shipping.php');
  $shipping_modules = new shipping($shipping);

  require(DIR_WS_CLASSES . 'order_total.php');
  $order_total_modules = new order_total;
  $order_total_modules->process();

// Stock Check
  $any_out_of_stock = false;
  if (STOCK_CHECK == 'true') {
    for ($i=0, $n=sizeof($order->products); $i<$n; $i++) {
      if (tep_check_stock($order->products[$i]['id'], $order->products[$i]['qty'])) {
        $any_out_of_stock = true;
      }
    }
    // Out of Stock
    if ( (STOCK_ALLOW_CHECKOUT != 'true') && ($any_out_of_stock == true) ) {
      tep_redirect(tep_href_link(FILENAME_SHOPPING_CART));
    }
  }

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_CHECKOUT_CONFIRMATION);

  $breadcrumb->add(NAVBAR_TITLE_1, tep_href_link(FILENAME_CHECKOUT_SHIPPING, '', 'SSL'));
  $breadcrumb->add(NAVBAR_TITLE_2);
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<link rel="shortcut icon" href="images/logo.ico" type="image/x-icon" >
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE; ?></title>
<base href="<?php echo (($request_type == 'SSL') ? HTTPS_SERVER : HTTP_SERVER) . DIR_WS_CATALOG; ?>">
<link rel="stylesheet" type="text/css" href="stylesheet.css">

<!-- Agree to Terms and Conditions - added by MC -->
<SCRIPT LANGUAGE="JavaScript">
function checkCheckBox(f){
if (f.agree.checked == false )
{
alert('<?php echo CONDITION_AGREEMENT_WARNING; ?>');
return false;
}else
return true;
}
</script>
<!-- End Agree to Terms and Conditions -->


<script type="text/javascript" src="iepngfix_tilebg.js"></script>
<style type="text/css">
.ie6_png 			{behavior: url("iepngfix.htc") }
.ie6_png img		{behavior: url("iepngfix.htc") }
.ie6_png input		{behavior: url("iepngfix.htc") }
</style>
<!--[if IE]>
   <script type="text/javascript" src="ie_png.js"></script>
   <script type="text/javascript">
       ie_png.fix('.png');
   </script>
<![endif]-->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-16118454-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</head>
<body>
<!-- header //-->
<?php require(DIR_WS_INCLUDES . 'header.php'); ?>
<!-- header_eof //-->

<!-- body //-->
<table border="0" class="<?php echo MAIN_TABLE; ?>" cellspacing="0" cellpadding="0">
<tr>
    <td class="<?php echo BOX_WIDTH_TD_LEFT; ?>"><table border="0" class="<?php echo BOX_WIDTH_LEFT; ?>" cellspacing="0" cellpadding="0">
<!-- left_navigation //-->
<?php require(DIR_WS_INCLUDES . 'column_left.php'); ?>
<!-- left_navigation_eof //-->
    </table></td>
<!-- body_text //-->
    <td class="<?php echo CONTENT_WIDTH_TD; ?>"><?php echo panel_top(); ?>
	
<?php
  if (isset($$payment->form_action_url)) {
    $form_action_url = $$payment->form_action_url;
  } else {
    $form_action_url = tep_href_link(FILENAME_CHECKOUT_PROCESS, '', 'SSL');
  }

  #echo tep_draw_form('checkout_confirmation', $form_action_url, 'post');
  echo '<form name="checkout_confirmation" method="post" action="' . $form_action_url . '" onsubmit="return checkCheckBox(this)">';
?>
        
<?php echo tep_draw_top();?>

<?php echo tep_draw_title_top();?>

				<?php echo HEADING_TITLE; ?>
			
<?php echo tep_draw_title_bottom();?>
								
<?php echo tep_draw1_top();?>
				
<?php echo tep_draw_infoBox_top();?>
			  		
		<table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
<?php
  if ($sendto != false) {
?>
            <td width="30%">
			<table border="0" width="100%" cellspacing="4" cellpadding="2">
              <tr>
                <td class="main"><?php echo '<b>' . HEADING_DELIVERY_ADDRESS . '</b> <a href="' . tep_href_link(FILENAME_CHECKOUT_SHIPPING_ADDRESS, '', 'SSL') . '"><span class="orderEdit">(' . TEXT_EDIT . ')</span></a>'; ?></td>
              </tr>
              <tr>
                <td class="main"><?php echo tep_address_format($order->delivery['format_id'], $order->delivery, 1, ' ', '<br>'); ?></td>
              </tr>
<?php
    if ($order->info['shipping_method']) {
?>
              <tr>
                <td class="main"><?php echo '<b>' . HEADING_SHIPPING_METHOD . '</b> <a href="' . tep_href_link(FILENAME_CHECKOUT_SHIPPING, '', 'SSL') . '"><span class="orderEdit">(' . TEXT_EDIT . ')</span></a>'; ?></td>
              </tr>
              <tr>
                <td class="main"><?php echo $order->info['shipping_method']; ?></td>
              </tr>
<?php
    }
?>
            </table>
			</td>
<?php
  }
?>
            <td class="infoBox"><?php echo tep_draw_separator('spacer.gif', '1', '1'); ?></td>
            <td width="<?php echo (($sendto != false) ? '70%' : '100%'); ?>">
			<table border="0" width="100%" cellspacing="4" cellpadding="0">
              <tr>
                <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
<?php
  if (sizeof($order->info['tax_groups']) > 1) {
?>
                  <tr>
                    <td class="main" colspan="2"><?php echo '<b>' . HEADING_PRODUCTS . '</b> <a href="' . tep_href_link(FILENAME_SHOPPING_CART) . '"><span class="orderEdit">(' . TEXT_EDIT . ')</span></a>'; ?></td>
                    <td class="stext" align="right"><b><?php echo HEADING_TAX; ?></b></td>
                    <td class="stext" align="right"><b><?php echo HEADING_TOTAL; ?></b></td>
                  </tr>
<?php
  } else {
?>
                  <tr>
                    <td class="main" colspan="3"><?php echo '<b>' . HEADING_PRODUCTS . '</b> <a href="' . tep_href_link(FILENAME_SHOPPING_CART) . '"><span class="orderEdit">(' . TEXT_EDIT . ')</span></a>'; ?></td>
                  </tr>
<?php
  }

  for ($i=0, $n=sizeof($order->products); $i<$n; $i++) {
    echo '          <tr>' . "\n" .
         '            <td class="main" align="right" width="30">' . $order->products[$i]['qty'] . '&nbsp;x</td>' . "\n" .
         '            <td class="main">' . $order->products[$i]['name'];

    if (STOCK_CHECK == 'true') {
      echo tep_check_stock($order->products[$i]['id'], $order->products[$i]['qty']);
    }

    if ( (isset($order->products[$i]['attributes'])) && (sizeof($order->products[$i]['attributes']) > 0) ) {
      for ($j=0, $n2=sizeof($order->products[$i]['attributes']); $j<$n2; $j++) {
        echo '<br><nobr><small>&nbsp;<i> - ' . $order->products[$i]['attributes'][$j]['option'] . ': ' . $order->products[$i]['attributes'][$j]['value'] . '</i></small></nobr>';
      }
    }

    echo '</td>' . "\n";

    if (sizeof($order->info['tax_groups']) > 1) echo '            <td class="main" align="right">' . tep_display_tax_value($order->products[$i]['tax']) . '%</td>' . "\n";

    echo '            <td class="main" align="right">' . $currencies->display_price($order->products[$i]['final_price'], $order->products[$i]['tax'], $order->products[$i]['qty']) . '</td>' . "\n" .
         '          </tr>' . "\n";
  }
?>
                </table></td>
              </tr>
            </table>
            </td>
          </tr>
        </table>
		
<?php echo tep_draw_infoBox_bottom();?>

			<br style="line-height:1px;"><br style="line-height:10px;">
      <table cellpadding="0" cellspacing="0" border="0"><tr>
        <td class="main indent_2"><b><?php echo HEADING_BILLING_INFORMATION; ?></b></td>
      </tr>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr></table>
            
<?php echo tep_draw_infoBox_top();?>
		
		<table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td width="30%"><table border="0" width="100%" cellspacing="4" cellpadding="2">
              <tr>
                <td class="main"><?php echo '<b>' . HEADING_BILLING_ADDRESS . '</b> <a href="' . tep_href_link(FILENAME_CHECKOUT_PAYMENT_ADDRESS, '', 'SSL') . '"><span class="orderEdit">(' . TEXT_EDIT . ')</span></a>'; ?></td>
              </tr>
              <tr>
                <td class="main"><?php echo tep_address_format($order->billing['format_id'], $order->billing, 1, ' ', '<br>'); ?></td>
              </tr>
              <tr>
                <td class="main"><?php echo '<b>' . HEADING_PAYMENT_METHOD . '</b> <a href="' . tep_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL') . '"><span class="orderEdit">(' . TEXT_EDIT . ')</span></a>'; ?></td>
              </tr>
              <tr>
                <td class="main"><?php echo $order->info['payment_method']; ?></td>
              </tr>
            </table></td>
            <td class="infoBox"><?php echo tep_draw_separator('spacer.gif', '1', '1'); ?></td>
            <td width="70%" align="right">
			<table border="0" cellspacing="4" cellpadding="2">
<?php
  if (MODULE_ORDER_TOTAL_INSTALLED) {
    echo $order_total_modules->output();
  }
?>
            </table></td>
          </tr>
        </table>
		
<?php echo tep_draw_infoBox_bottom();?>

	<?php
  if (is_array($payment_modules->modules)) {
    if ($confirmation = $payment_modules->confirmation()) {
?>
      <table cellpadding="0" cellspacing="0" border="0"><tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr>
      <tr>
        <td class="main indent_2"><b><?php echo HEADING_PAYMENT_INFORMATION; ?></b></td>
      </tr>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr></table>
		
            
<?php echo tep_draw_infoBox_top();?>
		
        <table border="0" cellspacing="0" cellpadding="2">
              <tr>
                <td class="main" colspan="4"><?php echo $confirmation['title']; ?></td>
              </tr>
<?php
      for ($i=0, $n=sizeof($confirmation['fields']); $i<$n; $i++) {
?>
              <tr>
                <td width="10"><?php echo tep_draw_separator('pixel_trans.gif', '10', '1'); ?></td>
                <td class="main"><?php echo $confirmation['fields'][$i]['title']; ?></td>
                <td width="10"><?php echo tep_draw_separator('pixel_trans.gif', '10', '1'); ?></td>
                <td class="main"><?php echo $confirmation['fields'][$i]['field']; ?></td>
              </tr>
<?php
      }
?>
         </table>
            
<?php echo tep_draw_infoBox_bottom();?>

			
<?php
    }
  }
?>
		<br style="line-height:1px;"><br style="line-height:10px;">
<?php
  if (tep_not_null($order->info['comments'])) {
?>
      <table cellpadding="0" cellspacing="0" border="0"><tr>
        <td class="main"><?php echo '<b>' . HEADING_ORDER_COMMENTS . '</b> <a href="' . tep_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL') . '"><span class="orderEdit">(' . TEXT_EDIT . ')</span></a>'; ?></td>
      </tr>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr></table>

            
<?php echo tep_draw_infoBox_top();?>
		
		<table border="0" width="100%" cellspacing="0" cellpadding="2">
              <tr>
                <td class="main"><?php echo nl2br(tep_output_string_protected($order->info['comments'])) . tep_draw_hidden_field('comments', $order->info['comments']); ?></td>
              </tr>
        </table>
		
<?php echo tep_draw_infoBox_bottom();?>

			<br style="line-height:1px;"><br style="line-height:10px;">
<?php
  }
?>
All prices include VAT at 20.0%
		
		<table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td align="right" class="main bg_input">
<?php
  if (is_array($payment_modules->modules)) {
    echo $payment_modules->process_button();
  }
  echo '<input type="checkbox" value="0" name="agree"> ' . CONDITION_AGREEMENT . '<br>';
  echo tep_image_submit('button_confirm_order.gif', IMAGE_BUTTON_CONFIRM_ORDER) . "\n";
?>
            </td>
          </tr>
        </table>
			
			<br style="line-height:1px;"><br style="line-height:10px;">		
		
		<table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25%" class="vam"><table border="0" width="100%" cellspacing="0" cellpadding="0">
              <tr>
                <td width="50%" class="vam" align="right"><?php echo tep_draw_separator('pixel_silver.gif', '1', '5'); ?></td>
                <td width="50%" class="vam"><?php echo tep_draw_separator('pixel_silver.gif', '100%', '1'); ?></td>
              </tr>
            </table></td>
            <td width="25%" class="vam"><?php echo tep_draw_separator('pixel_silver.gif', '100%', '1'); ?></td>
            <td width="25%" class="vam"><table border="0" width="100%" cellspacing="0" cellpadding="0">
              <tr>
                <td width="50%" class="vam"><?php echo tep_draw_separator('pixel_silver.gif', '100%', '1'); ?></td>
                <td><?php echo tep_image(DIR_WS_IMAGES . 'checkout_bullet.gif'); ?></td>
                <td width="50%" class="vam"><?php echo tep_draw_separator('pixel_silver.gif', '100%', '1'); ?></td>
              </tr>
            </table></td>
            <td width="25%" class="vam"><table border="0" width="100%" cellspacing="0" cellpadding="0">
              <tr>
                <td width="50%" class="vam"><?php echo tep_draw_separator('pixel_silver.gif', '100%', '1'); ?></td>
                <td width="50%" class="vam"><?php echo tep_draw_separator('pixel_silver.gif', '1', '5'); ?></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td align="center" width="25%" class="checkoutBarFrom"><?php echo '<a href="' . tep_href_link(FILENAME_CHECKOUT_SHIPPING, '', 'SSL') . '" class="checkoutBarFrom">' . CHECKOUT_BAR_DELIVERY . '</a>'; ?></td>
            <td align="center" width="25%" class="checkoutBarFrom"><?php echo '<a href="' . tep_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL') . '" class="checkoutBarFrom">' . CHECKOUT_BAR_PAYMENT . '</a>'; ?></td>
            <td align="center" width="25%" class="checkoutBarCurrent"><?php echo CHECKOUT_BAR_CONFIRMATION; ?></td>
            <td align="center" width="25%" class="checkoutBarTo"><?php echo CHECKOUT_BAR_FINISHED; ?></td>
          </tr>
        </table>
		
<?php echo tep_draw1_bottom();?>
      		
<?php echo tep_draw_bottom();?>

	</form></td>
<!-- body_text_eof //-->
  </tr>
</table>
<!-- body_eof //-->

<!-- footer //-->
<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
<!-- footer_eof //-->
</body>
</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
