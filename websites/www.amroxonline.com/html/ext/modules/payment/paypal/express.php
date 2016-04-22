<?php
/*
  $Id: express.php 1803 2008-01-11 18:16:37Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2007 osCommerce

  Released under the GNU General Public License
*/

  chdir('../../../../');
  require('includes/application_top.php');

// if there is nothing in the customers cart, redirect them to the shopping cart page
  if ($cart->count_contents() < 1) {
    tep_redirect(tep_href_link(FILENAME_SHOPPING_CART));
  }

  require('includes/modules/payment/paypal_express.php');

  $paypal_express = new paypal_express();

  if (!$paypal_express->check() || !$paypal_express->enabled) {
    tep_redirect(tep_href_link(FILENAME_SHOPPING_CART));
  }

  if (MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER == 'Live') {
    $api_url = $paypal_express->nvp_api_url;
    $paypal_url = 'https://www.paypal.com/cgi-bin/webscr?cmd=_express-checkout';
  } else {
    $api_url = $paypal_express->nvp_api_url_sandbox;
    $paypal_url = 'https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout';
  }

  if (!tep_session_is_registered('sendto')) {
    tep_session_register('sendto');
    $sendto = $customer_default_address_id;
  }

  if (!tep_session_is_registered('billto')) {
    tep_session_register('billto');
    $billto = $customer_default_address_id;
  }

// register a random ID in the session to check throughout the checkout procedure
// against alterations in the shopping cart contents
  if (!tep_session_is_registered('cartID')) tep_session_register('cartID');
  $cartID = $cart->cartID;

  $params = array('USER' => MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME,
                  'PWD' => MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD,
                  'VERSION' => $paypal_express->api_version,
                  'SIGNATURE' => MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE);

  switch ($HTTP_GET_VARS['osC_Action']) {
    case 'retrieve':
      $params['METHOD'] = 'GetExpressCheckoutDetails';
      $params['TOKEN'] = $HTTP_GET_VARS['token'];

      $post_string = '';

      foreach ($params as $key => $value) {
        $post_string .= $key . '=' . urlencode(trim($value)) . '&';
      }

      $post_string = substr($post_string, 0, -1);

      $response = $paypal_express->sendTransactionToGateway($api_url, $post_string);
      $response_array = array();
      parse_str($response, $response_array);

      if (($response_array['ACK'] == 'Success') || ($response_array['ACK'] == 'SuccessWithWarning')) {
        include(DIR_WS_CLASSES . 'order.php');
        /**
         * country state zone_id's
         */
        // Get the customer's country ID.
        $country_query = tep_db_query("SELECT countries_id, countries_name, address_format_id
            FROM " . TABLE_COUNTRIES . "
            WHERE countries_iso_code_2 = '".$response_array['SHIPTOCOUNTRYCODE']."'
            LIMIT 1");

        // see if we found a record, if not default to American format
        if (tep_db_num_rows($country_query) > 0) {
            $country = tep_db_fetch_array($country_query);
            // grab the country id and address format
            $country_id = $country['countries_id'];
            $country_name = $country['countries_name'];
            $address_format_id = $country['address_format_id'];
        } else {
            // default
            $country_id = '223';
            $country_name = 'United States';
            $address_format_id = '2'; // 2 is the American format
        }
        // get the state id
        $states_query = tep_db_query("SELECT zone_id FROM ".TABLE_ZONES." WHERE zone_code = '".$response_array['SHIPTOSTATE']."' AND zone_country_id = '".$country_id."' LIMIT 1");
        // see if we found a record
        if (tep_db_num_rows($states_query) > 0) {
            $states = tep_db_fetch_array($states_query);
            // grab the state zone_id
            $state_id = $states['zone_id'];
        } else {
            // default
            $state_id = 0;
        }
        /**
         * See if the user is logged in
         * if not
         *  check email for exisiting account, log them in under that account, then check address book for entry, if not same add it
         *  if email not found, create user, add address book entry
         *  log in user
         */
        if (!tep_session_is_registered('customer_id')) {
            $check_customer_query = tep_db_query("SELECT customers_id,
                customers_firstname, customers_lastname, customers_paypal_payerid,
                customers_paypal_ec
                FROM " . TABLE_CUSTOMERS . "
                WHERE customers_email_address = '" . tep_db_input($response_array['EMAIL']) . "'");
            $check_customer = tep_db_fetch_array($check_customer_query);

            // see if we found an account that matches the email address given
            // back from paypal
            $acct_exists = false;
            if (tep_db_num_rows($check_customer_query) > 0) {
                $acct_exists = true;
                // see if this was only a temp account if so remove it
                if ($check_customer['customers_paypal_ec'] == '1') {
                    // Delete the existing temporary account
                    $paypal_express->ec_delete_user($check_customer['customers_id']);
                    $acct_exists = false;
                }
            }
            // Create an account, if the account does not exist
            if (!$acct_exists) {
                // Generate a random 8-char password
                $salt = '46z3haZzegmn676PA3rUw2vrkhcLEn2p1c6gf7vp2ny4u3qqfqBh5j6kDhuLmyv9xf';
                srand((double)microtime() * 1000000);
                $password = '';
                for ($x = 0; $x < 7; $x++) {
                    $num = rand() % 33;
                    $tmp = substr($salt, $num, 1);
                    $password = $password . $tmp;
                }

                // set the customer information in the array for the table insertion
                $sql_data_array = array('customers_firstname'       => $response_array['FIRSTNAME'],
                                        'customers_lastname'            => $response_array['LASTNAME'],
                                        'customers_email_address'       => $response_array['EMAIL'],
                                        'customers_telephone'           => '0',
                                        'customers_fax'                 => '',
                                        'customers_gender'              => '',
                                        'customers_newsletter'          => '0',
                                        'customers_password'            => tep_encrypt_password($password),
                                        'customers_paypal_payerid'      => $response_array['PAYERID']);
                // insert the data
                $result = tep_db_perform(TABLE_CUSTOMERS, $sql_data_array);
                // grab the customer_id (last insert id)
                $customer_id = tep_db_insert_id();
                // set the customer address information in the array for the table insertion
                $sql_data_array = array('customers_id'              => $customer_id,
                                        'entry_gender'              => '',
                                        'entry_firstname'           => $response_array['FIRSTNAME'],
                                        'entry_lastname'            => $response_array['LASTNAME'],
                                        'entry_street_address'      => $response_array['SHIPTOSTREET'],
                                        'entry_suburb'              => '',
                                        'entry_city'                => $response_array['SHIPTOCITY'],
                                        'entry_zone_id'             => $state_id,
                                        'entry_postcode'            => $response_array['SHIPTOZIP'],
                                        'entry_country_id'          => $country_id);

                // insert the data
                tep_db_perform(TABLE_ADDRESS_BOOK, $sql_data_array);
                // grab the address_id (last insert id)
                $address_id = tep_db_insert_id();
                // set the address id lookup for the customer
                tep_db_query("update " . TABLE_CUSTOMERS . " set customers_default_address_id = '" . (int)$address_id . "' where customers_id = '" . (int)$customer_id . "'");
                // insert into the customers info table, the new customer_id
                tep_db_query("insert into " . TABLE_CUSTOMERS_INFO . " (customers_info_id, customers_info_number_of_logons, customers_info_date_account_created) values ('" . (int)$customer_id . "', '0', now())");
                // notify or not
                if ($paypal_express->new_account_notify) {
                    // require the language file
                    require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_CREATE_ACCOUNT);

                    // set the mail text
                    $email_text = sprintf(EMAIL_GREET_NONE, $response_array['FIRSTNAME']) . EMAIL_WELCOME . EMAIL_TEXT;
                    $email_text .= EMAIL_EC_ACCOUNT_INFORMATION . "Username: " . $response_array['EMAIL'] . "\nPassword: " . $password . "\n\n";
                    $email_text .= EMAIL_CONTACT;

                    // send the mail
                    tep_mail($response_array['FIRSTNAME'] . " " . $response_array['LASTNAME'], $response_array['EMAIL'], EMAIL_SUBJECT, $email_text, STORE_OWNER, STORE_OWNER_EMAIL_ADDRESS);

                    // set session var
                    $_SESSION['paypal_ec_temp'] = false;
                }else{
                    // Make it a temporary account that'll be deleted once they've checked out
                    tep_db_query("UPDATE " . TABLE_CUSTOMERS . "
                        SET customers_paypal_ec = '1'
                        WHERE customers_id = '" . (int)$customer_id . "'");

                    // set the boolean ec temp value
                    $_SESSION['paypal_ec_temp'] = True;
                }

            }else{
                // we already have the account, if we user temp accounts - make sure account not deleted here
            }
            // log the user in with the email sent back from paypal response
            $paypal_express->user_login($response_array['EMAIL'], false);
        }

        if ($cart->get_content_type() != 'virtual') {
          $country_iso_code_2 = tep_db_prepare_input($response_array['SHIPTOCOUNTRYCODE']);
          $zone_code = tep_db_prepare_input($response_array['SHIPTOSTATE']);

          $country_query = tep_db_query("select countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id from " . TABLE_COUNTRIES . " where countries_iso_code_2 = '" . tep_db_input($country_iso_code_2) . "'");
          $country = tep_db_fetch_array($country_query);

          $zone_name = $response_array['SHIPTOSTATE'];
          $zone_id = 0;

          $zone_query = tep_db_query("select zone_id, zone_name from " . TABLE_ZONES . " where zone_country_id = '" . (int)$country['countries_id'] . "' and zone_code = '" . tep_db_input($zone_code) . "'");
          if (tep_db_num_rows($zone_query)) {
            $zone = tep_db_fetch_array($zone_query);

            $zone_name = $zone['zone_name'];
            $zone_id = $zone['zone_id'];
          }

          $sendto = array('firstname' => substr($response_array['SHIPTONAME'], 0, strpos($response_array['SHIPTONAME'], ' ')),
                          'lastname' => substr($response_array['SHIPTONAME'], strpos($response_array['SHIPTONAME'], ' ')+1),
                          'company' => '',
                          'street_address' => $response_array['SHIPTOSTREET'],
                          'suburb' => '',
                          'postcode' => $response_array['SHIPTOZIP'],
                          'city' => $response_array['SHIPTOCITY'],
                          'zone_id' => $zone_id,
                          'zone_name' => $zone_name,
                          'country_id' => $country['countries_id'],
                          'country_name' => $country['countries_name'],
                          'country_iso_code_2' => $country['countries_iso_code_2'],
                          'country_iso_code_3' => $country['countries_iso_code_3'],
                          'address_format_id' => ($country['address_format_id'] > 0 ? $country['address_format_id'] : '1'));

          $billto = $sendto;

          $order = new order;

          $total_weight = $cart->show_weight();
          $total_count = $cart->count_contents();

// load all enabled shipping modules
          include(DIR_WS_CLASSES . 'shipping.php');
          $shipping_modules = new shipping;

          $free_shipping = false;

          if ( defined('MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING') && (MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING == 'true') ) {
            $pass = false;

            switch (MODULE_ORDER_TOTAL_SHIPPING_DESTINATION) {
              case 'national':
                if ($order->delivery['country_id'] == STORE_COUNTRY) {
                  $pass = true;
                }
                break;

              case 'international':
                if ($order->delivery['country_id'] != STORE_COUNTRY) {
                  $pass = true;
                }
                break;

              case 'both':
                $pass = true;
                break;
            }

            if ( ($pass == true) && ($order->info['total'] >= MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER) ) {
              $free_shipping = true;

              include(DIR_WS_LANGUAGES . $language . '/modules/order_total/ot_shipping.php');
            }
          }

          if (!tep_session_is_registered('shipping')) tep_session_register('shipping');
          $shipping = false;

          if ( (tep_count_shipping_modules() > 0) || ($free_shipping == true) ) {
            if ($free_shipping == true) {
              $shipping = 'free_free';
            } else {
// get all available shipping quotes
              $quotes = $shipping_modules->quote();

// select cheapest shipping method
              $shipping = $shipping_modules->cheapest();
              $shipping = $shipping['id'];
            }
          }

          if (strpos($shipping, '_')) {
            list($module, $method) = explode('_', $shipping);

            if ( is_object($$module) || ($shipping == 'free_free') ) {
              if ($shipping == 'free_free') {
                $quote[0]['methods'][0]['title'] = FREE_SHIPPING_TITLE;
                $quote[0]['methods'][0]['cost'] = '0';
              } else {
                $quote = $shipping_modules->quote($method, $module);
              }

              if (isset($quote['error'])) {
                tep_session_unregister('shipping');

                tep_redirect(tep_href_link(FILENAME_CHECKOUT_SHIPPING, '', 'SSL'));
              } else {
                if ( (isset($quote[0]['methods'][0]['title'])) && (isset($quote[0]['methods'][0]['cost'])) ) {
                  $shipping = array('id' => $shipping,
                                    'title' => (($free_shipping == true) ?  $quote[0]['methods'][0]['title'] : $quote[0]['module'] . ' (' . $quote[0]['methods'][0]['title'] . ')'),
                                    'cost' => $quote[0]['methods'][0]['cost']);
                }
              }
            }
          }

          if (!tep_session_is_registered('payment')) tep_session_register('payment');
          $payment = $paypal_express->code;

          if (!tep_session_is_registered('ppe_token')) tep_session_register('ppe_token');
          $ppe_token = $response_array['TOKEN'];

          if (!tep_session_is_registered('ppe_payerid')) tep_session_register('ppe_payerid');
          $ppe_payerid = $response_array['PAYERID'];

          tep_redirect(tep_href_link(FILENAME_CHECKOUT_CONFIRMATION, '', 'SSL'));
        } else {
          if (!tep_session_is_registered('shipping')) tep_session_register('shipping');
          $shipping = false;

          $sendto = false;

          if (!tep_session_is_registered('payment')) tep_session_register('payment');
          $payment = $paypal_express->code;

          if (!tep_session_is_registered('ppe_token')) tep_session_register('ppe_token');
          $ppe_token = $response_array['TOKEN'];

          if (!tep_session_is_registered('ppe_payerid')) tep_session_register('ppe_payerid');
          $ppe_payerid = $response_array['PAYERID'];

          tep_redirect(tep_href_link(FILENAME_CHECKOUT_CONFIRMATION, '', 'SSL'));
        }
      } else {
        tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, 'error_message=' . stripslashes($response_array['L_LONGMESSAGE0']), 'SSL'));
      }

      break;

    default:
      include(DIR_WS_CLASSES . 'order.php');
      $order = new order;

      $params['METHOD'] = 'SetExpressCheckout';
      $params['PAYMENTACTION'] = ((MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD == 'Sale') ? 'Sale' : 'Authorization');
      $params['RETURNURL'] = tep_href_link('ext/modules/payment/paypal/express.php', 'osC_Action=retrieve', 'SSL', true, false);
      $params['CANCELURL'] = tep_href_link(FILENAME_SHOPPING_CART, '', 'SSL', true, false);
      $params['AMT'] = $paypal_express->format_raw($order->info['total']);
      $params['CURRENCYCODE'] = $order->info['currency'];

      if ($order->content_type == 'virtual') {
        $params['NOSHIPPING'] = '1';
      }
      /**
       * START
       * PayPal Recurring Payments
       *
       * check the cart for rp and set the description
       */
      $o = 0;
	  
	  //kgt - discount coupons
				  global $coupon;
				
				  if( tep_session_is_registered( 'coupon' ) && tep_not_null( $coupon ) ) {
					require_once( DIR_WS_CLASSES.'discount_coupon.php' );
					$order_coupon = new discount_coupon( $coupon, $order_delivery );
					$order_coupon->total_valid_products( $cart->get_products(false) );
					$valid_products_count = 0;
				  }
				  //end kgt - discount coupons
	  
      foreach ($order->products as $key => $arr){
        if(count($arr['rp']) == 0){
            continue;
        }
        include_once(DIR_WS_CLASSES . '/paypal_rp_product_info.php');
		
		//kgt - discount coupons
						if( is_object( $order_coupon ) ) {
						  $applied_discount = 0;
						  $discount = $order_coupon->calculate_discount( $arr, $valid_products_count );
					if( $discount['applied_discount'] > 0 ) $valid_products_count++;
					  $shown_price = $order_coupon->calculate_shown_price( $discount, $arr );
					  $final_price = $shown_price['shown_price'];
					  $shown_price = $shown_price['actual_shown_price'];
					  $trial_price = $shown_price['shown_price_trial'];
					} else {
					  $shown_price = tep_add_tax($arr['final_price'], $arr['tax']) * $arr['qty'];
					  $final_price = $shown_price;
					  $trial_price = $arr['rp']['trialAmt'];
					}

						
						//end kgt - discount coupons
						
        $rpPprice = $currencies->display_price($final_price,$arr['tax_class_id']);
        $rpPinfo = new paypal_rp_product_info($arr, $arr['rp'], $rpPprice);
        $rpPInfoArr = $rpPinfo->getProductInfoFull();
        // build the description
        
        $nvrChunks = explode(" Every", $rpPInfoArr['normal']);
        $text_after=$nvrChunks[1];
        $subtotal_cat=$currencies->display_price($final_price,$arr['tax_class_id']);
        $text_fin_prod=$subtotal_cat.' Every'.$text_after;
        //$products_desc .= '<br><small><i>' .$text_fin_prod. '</i></small>';
        
        
        $params['L_BILLINGAGREEMENTDESCRIPTION'.$o] = $arr['name'] . ' ';
        if(strlen($arr['rp']['trialBillingPeriod'])>0){
            $params['L_BILLINGAGREEMENTDESCRIPTION'.$o] .= $rpPInfoArr['trial'] . ', and ';
        }
        $params['L_BILLINGAGREEMENTDESCRIPTION'.$o] .= $text_fin_prod;
        $params['L_BILLINGAGREEMENTDESCRIPTION'.$o] = substr($params['L_BILLINGAGREEMENTDESCRIPTION'.$o], 0, 127);
        // add the params
        $params['L_BILLINGTYPE'.$o] = 'RecurringPayments';
        // inc the count
        $o++;
      }
      /**
       * END
       * PayPal Recurring Payments
       */

      $post_string = '';

      foreach ($params as $key => $value) {
        $post_string .= $key . '=' . urlencode(trim($value)) . '&';
      }
      $post_string = substr($post_string, 0, -1);

      $response = $paypal_express->sendTransactionToGateway($api_url, $post_string);
      $response_array = array();
      parse_str($response, $response_array);

      if (($response_array['ACK'] == 'Success') || ($response_array['ACK'] == 'SuccessWithWarning')) {
        tep_redirect($paypal_url . '&token=' . $response_array['TOKEN']);
      } else {
        tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, 'error_message=' . stripslashes($response_array['L_LONGMESSAGE0']), 'SSL'));
      }
      break;
  }

  tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, '', 'SSL'));

  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>