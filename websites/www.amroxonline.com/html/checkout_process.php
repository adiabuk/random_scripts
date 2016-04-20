<?php


/*
  $Id: checkout_process.php 1750 2007-12-21 05:20:28Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2007 osCommerce

  Released under the GNU General Public License
*/

  include('includes/application_top.php');

// if the customer is not logged on, redirect them to the login page
  if (!tep_session_is_registered('customer_id')) {
    $navigation->set_snapshot(array('mode' => 'SSL', 'page' => FILENAME_CHECKOUT_PAYMENT));
     
    tep_redirect(tep_href_link(FILENAME_LOGIN, '', 'SSL'));
  }
//die ('got here2');
// if there is nothing in the customers cart, redirect them to the shopping cart page
  if ($cart->count_contents() < 1) {
 
    tep_redirect(tep_href_link(FILENAME_SHOPPING_CART));
    
  }

// if no shipping method has been selected, redirect the customer to the shipping method selection page
  if (!tep_session_is_registered('shipping') || !tep_session_is_registered('sendto')) {
    tep_redirect(tep_href_link(FILENAME_CHECKOUT_SHIPPING, '', 'SSL'));
  }

  if ( (tep_not_null(MODULE_PAYMENT_INSTALLED)) && (!tep_session_is_registered('payment')) ) {
     tep_redirect(tep_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL'));
 }

// avoid hack attempts during the checkout procedure by checking the internal cartID
  if (isset($cart->cartID) && tep_session_is_registered('cartID')) {
    if ($cart->cartID != $cartID) {
    
      tep_redirect(tep_href_link(FILENAME_CHECKOUT_SHIPPING, '', 'SSL'));
    }
  }

  include(DIR_WS_LANGUAGES . $language . '/' . FILENAME_CHECKOUT_PROCESS);

// load selected payment module
  require(DIR_WS_CLASSES . 'payment.php');
  $payment_modules = new payment($payment);

// load the selected shipping module
  require(DIR_WS_CLASSES . 'shipping.php');
  $shipping_modules = new shipping($shipping);

  require(DIR_WS_CLASSES . 'order.php');
  $order = new order;

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
 
  $payment_modules->update_status();

  if ( ( is_array($payment_modules->modules) && (sizeof($payment_modules->modules) > 1) && !is_object($$payment) ) || (is_object($$payment) && ($$payment->enabled == false)) ) {
    tep_redirect(tep_href_link(FILENAME_CHECKOUT_PAYMENT, 'error_message=' . urlencode(ERROR_NO_PAYMENT_MODULE_SELECTED), 'SSL'));
  }
/**
 * START
 * PayPal 3d Secure
 *
 * see if this is enabled, also if it is the right CC type for this,
 * as well as if the user is enrolled or not.
 */
$case_product_type = 'standard';
$prodTypeArr = array();
foreach ($order->products as $key => $prodArr){
    if(count($prodArr['rp'])>0){
        $prodTypeArr[] = 'recurring';
    }else{
        $prodTypeArr[] = 'standard';
    }
}
$prodTypeArr = array_unique($prodTypeArr);
$prodTypeArr = array_values($prodTypeArr); // to ensure key 0 is the first element

if(count($prodTypeArr)>1){
    $case_product_type = 'mixed';
}else{
    $case_product_type = $prodTypeArr[0];
}
if($payment_modules->selected_module == 'paypal_direct' and $case_product_type != 'recurring'){
    $paymentDirect = new paypal_direct();
    if($paymentDirect->secure_enabled){
        // only for VISA, MASTERCARD, MAESTRO
        if(in_array($HTTP_POST_VARS['cc_type'], array('VISA', 'MASTERCARD', 'MAESTRO'))){
            $havePayload = false;
            if(isset($_SESSION['auth_status']) and isset($_SESSION['auth_xid'])){
                if($_SESSION['auth_status'] == 'Y' or $_SESSION['auth_status'] == 'A'){
                    $havePayload = true;
                }
            }
            // check to see if they are not enrolled
            $chargeBackProtectNoneAuth = false;
            if($paymentDirect->secure_chargeBackProtection == 'No'){
                if($_SESSION['enroll_lookup_attempted'] == 'Y' and in_array($_SESSION['enrolled'], array( 'N', 'U'))){
                    $chargeBackProtectNoneAuth = true;
                }
            }

            if(!$havePayload and !$chargeBackProtectNoneAuth){
            // see if their enrolled
            $dataArr = array(
                'user_agent'        =>  $_SERVER["HTTP_USER_AGENT"],
                'browser_header'    =>  $_SERVER["HTTP_ACCEPT"],
                'order_number'      =>  tep_session_id(),
                'order_desc'        => 'osCommerce Order',
                'cc_type'           =>  $HTTP_POST_VARS['cc_type'],
                'cc_number'         =>  $HTTP_POST_VARS['cc_number_nh-dns'],
                'cc_expires_month'  =>  $HTTP_POST_VARS['cc_expires_month'],
                'cc_expires_year'   =>  $HTTP_POST_VARS['cc_expires_year'],
                'cc_cvv2'           =>  $HTTP_POST_VARS['cc_cvc_nh-dns'],
                'cc_name'           =>  $HTTP_POST_VARS['cc_owner'],
                'currency'          =>  $order->info['currency'],
                'txn_amount'        =>  $order->info['total'],
            );
            $lookup_resp_array = $paymentDirect->lookup($dataArr);

        	$shouldContinue = $lookup_resp_array['continue_flag'];
        	$errorNo = $lookup_resp_array['error_no'];
        	$errorDesc = $lookup_resp_array['error_desc'];
        	$enrolled = $lookup_resp_array['enrolled'];
        	$transactionId = $lookup_resp_array['transaction_id'];
        	$requestXML = $lookup_resp_array['requestXML'];
        	$rawXML = $lookup_resp_array['rawXML'];

            tep_session_register('transactionId');
            tep_session_register('enrolled');
            $_SESSION['serialized_post_vars'] = serialize($HTTP_POST_VARS);
            if (strcasecmp('0', $errorNo) == 0 && strcasecmp('Y', $enrolled) == 0){

                // Card is enrolled, continue to payer authentication

                $acsURL= $lookup_resp_array['acs_url'];
                $payload = $lookup_resp_array['payload'];

                tep_session_register('acsURL');
                tep_session_register('payload');
                tep_redirect(tep_href_link('payer_auth_frame.php', '', 'SSL'));

            } else {

                if (strcasecmp('Y', $shouldContinue) == 0) {
                    // Not enrolled or error, determine the ECI value for the card
                    // number, and make it available to the payment module.
                    if (strcasecmp('N', $enrolled) == 0) {
                        global $auth_eci;
                        if (strcasecmp("VISA", $HTTP_POST_VARS['cc_type']) == 0 ) {
                            $auth_eci = "06";
                            tep_session_register('auth_eci');
                        }else if (strcasecmp("MASTERCARD", $HTTP_POST_VARS['cc_type']) == 0 ) {
                            $auth_eci = "01";
                            tep_session_register('auth_eci');
                        }else if (strcasecmp("JCB", $HTTP_POST_VARS['cc_type']) == 0) {
                            $auth_eci = "06";
                            tep_session_register('auth_eci');
                        }
                    } else if (strcasecmp('U', $enrolled) == 0 ||
                               strcasecmp('0', $errorNo) != 0) {
                        global $auth_eci;
                        if (strcasecmp("VISA", $HTTP_POST_VARS['cc_type']) == 0 ) {
                            $auth_eci = "07";
                            tep_session_register('auth_eci');
                        }else if (strcasecmp("MASTERCARD", $HTTP_POST_VARS['cc_type']) == 0 ) {
                            $auth_eci = "01";
                            tep_session_register('auth_eci');
                        }else if (strcasecmp("JCB", $HTTP_POST_VARS['cc_type']) == 0) {
                            $auth_eci = "07";
                            tep_session_register('auth_eci');
                        }
                    }
                    //redirect
                    // if we are timing out, don't move on here, unless we have charge back protection on
                    if($error_no != '8030' and $paymentDirect->secure_chargeBackProtection != 'No'){
                        tep_redirect(tep_href_link('payer_auth_verifier.php', '', 'SSL'));
                    }

                } else {
                    // nope get another form of payment
                    $payment_error_return =     'error_message=This%20card%20cannot%20be%20used%20to%20complete%20your%20purchase.%20You%20may%20complete%20the%20purchase%20by%20selecting%20another%20form%20of%20payment&';
                    $payment_error_return .=    'payment_error=' . $paymentDirect->code . '&error=' . urlencode($paymentDirect->get_authentication_error());
                    tep_redirect(tep_href_link(FILENAME_CHECKOUT_PAYMENT, $payment_error_return, 'SSL', true, false));
                }
            }
            } // have payload
        }// in only visa mastercard
    }
}
/**
 * END
 * PayPal 3d Secure
 */
  require(DIR_WS_CLASSES . 'order_total.php');
  $order_total_modules = new order_total;

  $order_totals = $order_total_modules->process();
 // print_r($order_totals);die('got here5');
  //die();
  // die('got here6');
  /**
   * START
   * PayPal Recurring Profile
   *
   * load the before_process function from the payment modules
   * return value added (line replacement)
   */
 
 $rp_profile_id_arr = $payment_modules->before_process();
  //die('if got here');
 
  /**
   * END
   * PayPal Recurring Profile
   */
  $sql_data_array = array('customers_id' => $customer_id,
                          'customers_name' => $order->customer['firstname'] . ' ' . $order->customer['lastname'],
                          'customers_company' => $order->customer['company'],
                          'customers_street_address' => $order->customer['street_address'],
                          'customers_suburb' => $order->customer['suburb'],
                          'customers_city' => $order->customer['city'],
                          'customers_postcode' => $order->customer['postcode'],
                          'customers_state' => $order->customer['state'],
                          'customers_country' => $order->customer['country']['title'],
                          'customers_telephone' => $order->customer['telephone'],
                          'customers_email_address' => $order->customer['email_address'],
                          'customers_address_format_id' => $order->customer['format_id'],
                          'delivery_name' => trim($order->delivery['firstname'] . ' ' . $order->delivery['lastname']),
                          'delivery_company' => $order->delivery['company'],
                          'delivery_street_address' => $order->delivery['street_address'],
                          'delivery_suburb' => $order->delivery['suburb'],
                          'delivery_city' => $order->delivery['city'],
                          'delivery_postcode' => $order->delivery['postcode'],
                          'delivery_state' => $order->delivery['state'],
                          'delivery_country' => $order->delivery['country']['title'],
                          'delivery_address_format_id' => $order->delivery['format_id'],
                          'billing_name' => $order->billing['firstname'] . ' ' . $order->billing['lastname'],
                          'billing_company' => $order->billing['company'],
                          'billing_street_address' => $order->billing['street_address'],
                          'billing_suburb' => $order->billing['suburb'],
                          'billing_city' => $order->billing['city'],
                          'billing_postcode' => $order->billing['postcode'],
                          'billing_state' => $order->billing['state'],
                          'billing_country' => $order->billing['country']['title'],
                          'billing_address_format_id' => $order->billing['format_id'],
                          'payment_method' => $order->info['payment_method'],
                          'cc_type' => $order->info['cc_type'],
                          'cc_owner' => $order->info['cc_owner'],
                          'cc_number' => $order->info['cc_number'],
                          'cc_expires' => $order->info['cc_expires'],
                          'date_purchased' => 'now()',
                          'orders_status' => $order->info['order_status'],
                          'currency' => $order->info['currency'],
                          'currency_value' => $order->info['currency_value']);
  /**
   * START
   * PayPal ALL
   *
   * added the selected module to the insert
   * added PP transaction ID to db, all new features need this action
   */
  $sql_data_array['payment_module'] = $payment_modules->selected_module;
  if(array_key_exists('pp_transaction_id', $_SESSION)){
      if(strlen($_SESSION['pp_transaction_id'])>0){
          $sql_data_array['paypal_transaction_id'] = $_SESSION['pp_transaction_id'];
      }
  }
  /**
   * END
   * PayPal ALL
   */
  tep_db_perform(TABLE_ORDERS, $sql_data_array);
  $insert_id = tep_db_insert_id();
  for ($i=0, $n=sizeof($order_totals); $i<$n; $i++) {
    $sql_data_array = array('orders_id' => $insert_id,
                            'title' => $order_totals[$i]['title'],
                            'text' => $order_totals[$i]['text'],
                            'value' => $order_totals[$i]['value'],
                            'class' => $order_totals[$i]['code'],
                            'sort_order' => $order_totals[$i]['sort_order']);
    tep_db_perform(TABLE_ORDERS_TOTAL, $sql_data_array);
  }
    /**
     * START
     * PayPal Fraud Management Filters
     *
     * fmf check for FMF details in the session, then add them to
     * the order status lookup
     */
    if(array_key_exists('pp_fmf', $_SESSION)){
        if(count($_SESSION['pp_fmf'])>0){
            // record the FMF status
            foreach ($_SESSION['pp_fmf'] as $key => $arr){
                $sql = 'INSERT INTO ' . TABLE_FMF_PAYPAL_ORDERS_STATUS . ' (orders_id, paypal_fmf_status_id) VALUES (' . $insert_id . ', ' . $arr['id'] . ')';
                tep_db_query($sql);
            }
            // update the status - FMF
            tep_db_query('update ' . TABLE_ORDERS . ' SET orders_status = 5 WHERE orders_id = ' . $insert_id);
            $order->info['order_status'] = 5;
        }
    }
    /**
     * END
     * PayPal Fraud Management Filters
     */
  $customer_notification = (SEND_EMAILS == 'true') ? '1' : '0';
  $sql_data_array = array('orders_id' => $insert_id,
                          'orders_status_id' => $order->info['order_status'],
                          'date_added' => 'now()',
                          'customer_notified' => $customer_notification,
                          'comments' => $order->info['comments']);
  tep_db_perform(TABLE_ORDERS_STATUS_HISTORY, $sql_data_array);						  
  //kgt - discount coupons
  if( tep_session_is_registered( 'coupon' ) && is_object( $order->coupon ) ) {
	  $sql_data_array = array( 'coupons_id' => $order->coupon->coupon['coupons_id'],
                             'orders_id' => $insert_id );
	  tep_db_perform( TABLE_DISCOUNT_COUPONS_TO_ORDERS, $sql_data_array );
  }
  //end kgt - discount coupons						  
    /**
     * START
     * PayPal 3d Secure
     *
     * Adds auth info to comments of the order information, see
     * if we need to add 3d secure to the order status history
     */
    if($payment_modules->selected_module == 'paypal_direct'){
        // object set above if this is true $paymentDirect
        if($paymentDirect->secure_enabled){
            // only for VISA and MASTERCARD
            if(in_array($HTTP_POST_VARS['cc_type'], array('VISA', 'MASTERCARD'))){
                include(DIR_WS_FUNCTIONS . 'paypal3dSecure.php');
                $auth_proc_status = determineProtection($_SESSION['cc_number'], $_SESSION['auth_eci']);
                $sql_data_array['comments'] .=  "\n" . $auth_proc_status . "\n" . 'ECI Value = ' . $_SESSION['auth_eci'] . "\n" . 'CAVV Value = ' . $_SESSION['auth_cavv'];
            }
        }
    }
    /**
     * END
     * PayPal 3d Secure
     */
    /**
    * START
    * PayPal Fraud Management Filters
    *
    * add the FMF details to the comments on the order
    */
    if($order->info['order_status'] == 5){
      if(array_key_exists('pp_fmf', $_SESSION)){
          if(count($_SESSION['pp_fmf'])>0){
              foreach ($_SESSION['pp_fmf'] as $arr){
                  if(strlen($sql_data_array['comments'])>0){
                      $sql_data_array['comments'] .= " \n" . $arr['fmf_status_desc'];
                  }else{
                      $sql_data_array['comments'] .= $arr['fmf_status_desc'];
                  }
              }
          }
      }
    }
    /**
    * END
    * PayPal Fraud Management Filters
    */
  // sql
  

// initialized for the email confirmation
  $products_ordered = '';
  $subtotal = 0;
  $total_tax = 0;

  for ($i=0, $n=sizeof($order->products); $i<$n; $i++) {
// Stock Update - Joao Correia
    if (STOCK_LIMITED == 'true') {
      if (DOWNLOAD_ENABLED == 'true') {
        $stock_query_raw = "SELECT products_quantity, pad.products_attributes_filename
                            FROM " . TABLE_PRODUCTS . " p
                            LEFT JOIN " . TABLE_PRODUCTS_ATTRIBUTES . " pa
                             ON p.products_id=pa.products_id
                            LEFT JOIN " . TABLE_PRODUCTS_ATTRIBUTES_DOWNLOAD . " pad
                             ON pa.products_attributes_id=pad.products_attributes_id
                            WHERE p.products_id = '" . tep_get_prid($order->products[$i]['id']) . "'";
// Will work with only one option for downloadable products
// otherwise, we have to build the query dynamically with a loop
        $products_attributes = $order->products[$i]['attributes'];
        if (is_array($products_attributes)) {
          $stock_query_raw .= " AND pa.options_id = '" . $products_attributes[0]['option_id'] . "' AND pa.options_values_id = '" . $products_attributes[0]['value_id'] . "'";
        }
        $stock_query = tep_db_query($stock_query_raw);
      } else {
        $stock_query = tep_db_query("select products_quantity from " . TABLE_PRODUCTS . " where products_id = '" . tep_get_prid($order->products[$i]['id']) . "'");
      }
      if (tep_db_num_rows($stock_query) > 0) {
        $stock_values = tep_db_fetch_array($stock_query);
// do not decrement quantities if products_attributes_filename exists
        if ((DOWNLOAD_ENABLED != 'true') || (!$stock_values['products_attributes_filename'])) {
          $stock_left = $stock_values['products_quantity'] - $order->products[$i]['qty'];
        } else {
          $stock_left = $stock_values['products_quantity'];
        }
        tep_db_query("update " . TABLE_PRODUCTS . " set products_quantity = '" . $stock_left . "' where products_id = '" . tep_get_prid($order->products[$i]['id']) . "'");
        if ( ($stock_left < 1) && (STOCK_ALLOW_CHECKOUT == 'false') ) {
          tep_db_query("update " . TABLE_PRODUCTS . " set products_status = '0' where products_id = '" . tep_get_prid($order->products[$i]['id']) . "'");
        }
      }
    }

// Update products_ordered (for bestsellers list)
    tep_db_query("update " . TABLE_PRODUCTS . " set products_ordered = products_ordered + " . sprintf('%d', $order->products[$i]['qty']) . " where products_id = '" . tep_get_prid($order->products[$i]['id']) . "'");
    $sql_data_array = array('orders_id' => $insert_id,
                            'products_id' => tep_get_prid($order->products[$i]['id']),
                            'products_model' => $order->products[$i]['model'],
                            'products_name' => $order->products[$i]['name'],
                            'products_price' => $order->products[$i]['price'],
                            'final_price' => $order->products[$i]['final_price'],
                            'products_tax' => $order->products[$i]['tax'],
                            'products_quantity' => $order->products[$i]['qty']);
    /**
     * START
     * PayPal Recurring Payments
     *
     * Add the profile id to the insert
     */
    if(is_array($rp_profile_id_arr) and array_key_exists(tep_get_prid($order->products[$i]['id']), $rp_profile_id_arr)){
        $sql_data_array['rp_profile_id'] = $rp_profile_id_arr[tep_get_prid($order->products[$i]['id'])];
    }
    /**
     * END
     * PayPal Recurring Payments
     */
    tep_db_perform(TABLE_ORDERS_PRODUCTS, $sql_data_array);
    $order_products_id = tep_db_insert_id();


//------insert customer choosen option to order--------
    $attributes_exist = '0';
    $products_ordered_attributes = '';
    if (isset($order->products[$i]['attributes'])) {
      $attributes_exist = '1';
      for ($j=0, $n2=sizeof($order->products[$i]['attributes']); $j<$n2; $j++) {
        if (DOWNLOAD_ENABLED == 'true') {
          $attributes_query = "select popt.products_options_name, poval.products_options_values_name, pa.options_values_price, pa.price_prefix, pad.products_attributes_maxdays, pad.products_attributes_maxcount , pad.products_attributes_filename
                               from " . TABLE_PRODUCTS_OPTIONS . " popt, " . TABLE_PRODUCTS_OPTIONS_VALUES . " poval, " . TABLE_PRODUCTS_ATTRIBUTES . " pa
                               left join " . TABLE_PRODUCTS_ATTRIBUTES_DOWNLOAD . " pad
                                on pa.products_attributes_id=pad.products_attributes_id
                               where pa.products_id = '" . $order->products[$i]['id'] . "'
                                and pa.options_id = '" . $order->products[$i]['attributes'][$j]['option_id'] . "'
                                and pa.options_id = popt.products_options_id
                                and pa.options_values_id = '" . $order->products[$i]['attributes'][$j]['value_id'] . "'
                                and pa.options_values_id = poval.products_options_values_id
                                and popt.language_id = '" . $languages_id . "'
                                and poval.language_id = '" . $languages_id . "'";
          $attributes = tep_db_query($attributes_query);
        } else {
          $attributes = tep_db_query("select popt.products_options_name, poval.products_options_values_name, pa.options_values_price, pa.price_prefix from " . TABLE_PRODUCTS_OPTIONS . " popt, " . TABLE_PRODUCTS_OPTIONS_VALUES . " poval, " . TABLE_PRODUCTS_ATTRIBUTES . " pa where pa.products_id = '" . $order->products[$i]['id'] . "' and pa.options_id = '" . $order->products[$i]['attributes'][$j]['option_id'] . "' and pa.options_id = popt.products_options_id and pa.options_values_id = '" . $order->products[$i]['attributes'][$j]['value_id'] . "' and pa.options_values_id = poval.products_options_values_id and popt.language_id = '" . $languages_id . "' and poval.language_id = '" . $languages_id . "'");
        }
        $attributes_values = tep_db_fetch_array($attributes);

        $sql_data_array = array('orders_id' => $insert_id,
                                'orders_products_id' => $order_products_id,
                                'products_options' => $attributes_values['products_options_name'],
                                'products_options_values' => $attributes_values['products_options_values_name'],
                                'options_values_price' => $attributes_values['options_values_price'],
                                'price_prefix' => $attributes_values['price_prefix']);
        tep_db_perform(TABLE_ORDERS_PRODUCTS_ATTRIBUTES, $sql_data_array);
        if ((DOWNLOAD_ENABLED == 'true') && isset($attributes_values['products_attributes_filename']) && tep_not_null($attributes_values['products_attributes_filename'])) {
          $sql_data_array = array('orders_id' => $insert_id,
                                  'orders_products_id' => $order_products_id,
                                  'orders_products_filename' => $attributes_values['products_attributes_filename'],
                                  'download_maxdays' => $attributes_values['products_attributes_maxdays'],
                                  'download_count' => $attributes_values['products_attributes_maxcount']);
          tep_db_perform(TABLE_ORDERS_PRODUCTS_DOWNLOAD, $sql_data_array);
        }
        $products_ordered_attributes .= "\n\t" . $attributes_values['products_options_name'] . ' ' . $attributes_values['products_options_values_name'];
      }
    }

//------insert customer choosen option eof ----
    $total_weight += ($order->products[$i]['qty'] * $order->products[$i]['weight']);
    $total_tax += tep_calculate_tax($total_products_price, $products_tax) * $order->products[$i]['qty'];
    $total_cost += $total_products_price;

    $products_ordered .= $order->products[$i]['qty'] . ' x ' . $order->products[$i]['name'] . ' (' . $order->products[$i]['model'] . ') = ' . $currencies->display_price($order->products[$i]['final_price'], $order->products[$i]['tax'], $order->products[$i]['qty']) . $products_ordered_attributes . "\n";
  }

// lets start with the email confirmation
  $email_order = STORE_NAME . "\n" .
                 EMAIL_SEPARATOR . "\n" .
                 EMAIL_TEXT_ORDER_NUMBER . ' ' . $insert_id . "\n" .
                 EMAIL_TEXT_INVOICE_URL . ' ' . tep_href_link(FILENAME_ACCOUNT_HISTORY_INFO, 'order_id=' . $insert_id, 'SSL', false) . "\n" .
                 EMAIL_TEXT_DATE_ORDERED . ' ' . strftime(DATE_FORMAT_LONG) . "\n\n";
  if ($order->info['comments']) {
    $email_order .= tep_db_output($order->info['comments']) . "\n\n";
  }
  $email_order .= EMAIL_TEXT_PRODUCTS . "\n" .
                  EMAIL_SEPARATOR . "\n" .
                  $products_ordered .
                  EMAIL_SEPARATOR . "\n";

  for ($i=0, $n=sizeof($order_totals); $i<$n; $i++) {
    $email_order .= strip_tags($order_totals[$i]['title']) . ' ' . strip_tags($order_totals[$i]['text']) . "\n";
  }

  if ($order->content_type != 'virtual') {
    $email_order .= "\n" . EMAIL_TEXT_DELIVERY_ADDRESS . "\n" .
                    EMAIL_SEPARATOR . "\n" .
                    tep_address_label($customer_id, $sendto, 0, '', "\n") . "\n";
  }

  $email_order .= "\n" . EMAIL_TEXT_BILLING_ADDRESS . "\n" .
                  EMAIL_SEPARATOR . "\n" .
                  tep_address_label($customer_id, $billto, 0, '', "\n") . "\n\n";
  if (is_object($$payment)) {
    $email_order .= EMAIL_TEXT_PAYMENT_METHOD . "\n" .
                    EMAIL_SEPARATOR . "\n";
    $payment_class = $$payment;
    $email_order .= $order->info['payment_method'] . "\n\n";
    if ($payment_class->email_footer) {
      $email_order .= $payment_class->email_footer . "\n\n";
    }
  }
  tep_mail($order->customer['firstname'] . ' ' . $order->customer['lastname'], $order->customer['email_address'], EMAIL_TEXT_SUBJECT, $email_order, STORE_OWNER, STORE_OWNER_EMAIL_ADDRESS);

// send emails to other people
  if (SEND_EXTRA_ORDER_EMAILS_TO != '') {
    tep_mail('', SEND_EXTRA_ORDER_EMAILS_TO, EMAIL_TEXT_SUBJECT, $email_order, STORE_OWNER, STORE_OWNER_EMAIL_ADDRESS);
  }
//execute script
exec(". /etc/profile; /var/amrox/scripts/create_config.sh $insert_id");

// load the after_process function from the payment modules
  $payment_modules->after_process();

  $cart->reset(true);

// unregister session variables used during checkout
  tep_session_unregister('sendto');
  tep_session_unregister('billto');
  tep_session_unregister('shipping');
  tep_session_unregister('payment');
  tep_session_unregister('comments');
  //kgt - discount coupons
  tep_session_unregister('coupon');
  //end kgt - discount coupons 
  
  tep_redirect(tep_href_link(FILENAME_CHECKOUT_SUCCESS, '', 'SSL'));

  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
