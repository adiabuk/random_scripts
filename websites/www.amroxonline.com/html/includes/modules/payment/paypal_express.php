<?php
/*
  $Id: paypal_express.php 1803 2008-01-11 18:16:37Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2008 osCommerce

  Released under the GNU General Public License
*/
require_once dirname(__FILE__) . '/paypal/paypal_base.php';

  class paypal_express extends paypal_base {

// class constructor
    function paypal_express() {
      global $order;

      $this->signature = 'paypal|paypal_express|1.0|2.2';
      $this->code = 'paypal_express';
      $this->title = MODULE_PAYMENT_PAYPAL_EXPRESS_TEXT_TITLE;
      $this->public_title = MODULE_PAYMENT_PAYPAL_EXPRESS_TEXT_PUBLIC_TITLE;
      $this->description = MODULE_PAYMENT_PAYPAL_EXPRESS_TEXT_DESCRIPTION;
      $this->sort_order = MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER;
      $this->enabled = ((MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS == 'True') ? true : false);
      $this->rp_enabled = ((MODULE_PAYMENT_PAYPAL_EXPRESS_RP_STATUS == 'True') ? true : false);
      $this->rp_autobill = MODULE_PAYMENT_PAYPAL_EXPRESS_RP_AUTOBILLOUTAMT;
      $this->rp_maxfailedpayments = MODULE_PAYMENT_PAYPAL_EXPRESS_RP_MAXFAILEDPAYMENTS;
      $this->fmf_enabled = ((MODULE_PAYMENT_PAYPAL_EXPRESS_FMF_STATUS == 'True') ? true : false);
      $this->new_account_notify = ((MODULE_PAYMENT_PAYPAL_EXPRESS_NEW_ACCT_NOTIFY == 'Yes') ? true : false);
      $this->log_file_location = MODULE_PAYMENT_PAYPAL_EXPRESS_LOGFILE;

      if ((int)MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID > 0) {
        $this->order_status = MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID;
      }
      if (is_object($order)) $this->update_status();
    }

// class methods
    function update_status() {
      global $order;

      if ( ($this->enabled == true) && ((int)MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE > 0) ) {
        $check_flag = false;
        $check_query = tep_db_query("select zone_id from " . TABLE_ZONES_TO_GEO_ZONES . " where geo_zone_id = '" . MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE . "' and zone_country_id = '" . $order->delivery['country']['id'] . "' order by zone_id");
        while ($check = tep_db_fetch_array($check_query)) {
          if ($check['zone_id'] < 1) {
            $check_flag = true;
            break;
          } elseif ($check['zone_id'] == $order->delivery['zone_id']) {
            $check_flag = true;
            break;
          }
        }

        if ($check_flag == false) {
          $this->enabled = false;
        }
      }
    }

    function checkout_initialization_method() {
      global $language;

      if (file_exists(DIR_FS_CATALOG . 'ext/modules/payment/paypal/images/btn_express_' . basename($language) . '.gif')) {
        // todo - change this to paypal servers with better button lang switching
      	$image = 'ext/modules/payment/paypal/images/btn_express_' . basename($language) . '.gif';
      } else {
      	// say this is US
        $image = 'http://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif';
      }

      $string = '<a href="' . tep_href_link('ext/modules/payment/paypal/express.php', '', 'SSL') . '"><img src="' . $image . '" border="0" alt="" title="' . tep_output_string_protected(MODULE_PAYMENT_PAYPAL_EXPRESS_TEXT_BUTTON) . '" /></a>';

      return $string;
    }

    function javascript_validation() {
      return false;
    }

    function selection() {
      $selection = array('id' => $this->code,
                   'module' => $this->public_title);
      // paypal logo
      /**
	  $selection['fields'][0] = array('field' => '
	   <table border="0" cellpadding="1" cellspacing="1" align="center">
	   		<tr>
	   			<td align="center">
	  <a href="checkout_payment.php" onclick="javascript:window.open(\'https://www.paypal.com/cgi-bin/webscr?cmd=xpt/Marketing/popup/OLCWhatIsPayPal-outside\',\'olcwhatispaypal\',\'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=400, height=350\');"><img  src="https://www.paypal.com/en_US/i/logo/PayPal_mark_60x38.gif" border="0" alt="Acceptance Mark"></a>
	  </td>
	  </tr>
	   </table>
	  ',
       'title' => '');
       **/
	  return $selection;
    }

    function pre_confirmation_check() {
      if (!tep_session_is_registered('ppe_token')) {
        tep_redirect(tep_href_link('ext/modules/payment/paypal/express.php', '', 'SSL'));
      }
    }

    function confirmation() {
      global $comments;

      if (!isset($comments)) {
        $comments = null;
      }

      $confirmation = false;

      if (empty($comments)) {
        $confirmation = array('fields' => array(array('title' => MODULE_PAYMENT_PAYPAL_EXPRESS_TEXT_COMMENTS,
                                                      'field' => tep_draw_textarea_field('ppecomments', 'soft', '60', '5', $comments))));
      }

      return $confirmation;
    }

    function process_button() {
      return false;
    }

    function before_process() {
      global $order, $sendto, $ppe_token, $ppe_payerid, $HTTP_POST_VARS, $comments, $currencies;

      if (empty($comments)) {
        if (isset($HTTP_POST_VARS['ppecomments']) && tep_not_null($HTTP_POST_VARS['ppecomments'])) {
          $comments = tep_db_prepare_input($HTTP_POST_VARS['ppecomments']);

          $order->info['comments'] = $comments;
        }
      }

      if (MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER == 'Live') {
        $api_url = $this->nvp_api_url;
      } else {
        $api_url = $this->nvp_api_url_sandbox;
      }
      // check for rp product - enusre rp enabled
      foreach ($order->products as $key => $prodArr){
          if(count($prodArr['rp'])>0){
              // rp product
              if(!$this->rp_enabled){
                tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, 'error_message=This product type is not enabled', 'SSL'));
              }
          }
      }
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
            //die('is mixed');
        }else{
            $case_product_type = $prodTypeArr[0];
           // die('not mixed');
        }

        switch ($case_product_type){
            case 'standard':
            
              $params = array('USER' => MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME,
                              'PWD' => MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD,
                              'VERSION' => $this->api_version,
                              'SIGNATURE' => MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE,
                              'METHOD' => 'DoExpressCheckoutPayment',
                              'TOKEN' => $ppe_token,
                              'PAYMENTACTION' => ((MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD == 'Sale') ? 'Sale' : 'Authorization'),
                              'PAYERID' => $ppe_payerid,
                              'AMT' => $this->format_raw($order->info['total']),
                              'CURRENCYCODE' => $order->info['currency'],
                              'NOTIFYURL' => HTTP_SERVER . '/ext/modules/payment/paypal/rp_ipn.php',
                              'BUTTONSOURCE' => 'osCommerce22_v20180_EC'
              );

              // FMF filter use
              if($this->fmf_enabled){
                  $params['RETURNFMFDETAILS'] = '1';
              }

              if (is_numeric($sendto) && ($sendto > 0)) {
                $params['SHIPTONAME'] = $order->delivery['firstname'] . ' ' . $order->delivery['lastname'];
                $params['SHIPTOSTREET'] = $order->delivery['street_address'];
                $params['SHIPTOCITY'] = $order->delivery['city'];
                $params['SHIPTOSTATE'] = tep_get_zone_code($order->delivery['country']['id'], $order->delivery['zone_id'], $order->delivery['state']);
                $params['SHIPTOCOUNTRYCODE'] = $order->delivery['country']['iso_code_2'];
                $params['SHIPTOZIP'] = $order->delivery['postcode'];
              }
            // log the request
            $this->recordToLog($params, 'request');
              $post_string = '';

              foreach ($params as $key => $value) {
                $post_string .= $key . '=' . urlencode(trim($value)) . '&';
              }

              $post_string = substr($post_string, 0, -1);

              $response = $this->sendTransactionToGateway($api_url, $post_string);
              $response_array = array();
              parse_str($response, $response_array);
              // log the response
              $this->recordToLog($response_array, 'response');
              // fmf check
              if($this->fmf_enabled){
                if($response_array['ACK'] == 'SuccessWithWarning'){
                    $fmfErr = $this->getReturnFMFErrors($response_array, 1);
                    if($fmfErr){
                        // there was a fraud check failure
                        $i=0;
                        foreach ($fmfErr as $key => $arr){
                            $_SESSION['pp_fmf'][$i]['id'] = $arr['id'];
                            $_SESSION['pp_fmf'][$i]['fmf_status_name'] = $arr['fmf_status_name'];
                            $_SESSION['pp_fmf'][$i]['fmf_status_desc'] = $arr['fmf_status_desc'];
                            $i++;
                        }
                    }else{
                        tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, 'error_message=' . stripslashes($response_array['L_LONGMESSAGE0']), 'SSL'));
                    }

                }elseif($response_array['ACK'] != 'Success' and $response_array['ACK'] != 'SuccessWithWarning'){
                    // hard error no sale - or hard deny filter
                    tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, 'error_message=' . stripslashes($response_array['L_LONGMESSAGE0']), 'SSL'));
                }
              }else{ // no fmf
                if(($response_array['ACK'] != 'Success') && ($response_array['ACK'] != 'SuccessWithWarning')){
                  tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, 'error_message=' . stripslashes($response_array['L_LONGMESSAGE0']), 'SSL'));
                }
              }
              // PP transaction ID
              $_SESSION['pp_transaction_id'] = $response_array['TRANSACTIONID'];
            break;
            case 'recurring':
            $no=0;
            //die('recuring');
                foreach ($order->products as $key => $prodArr){
                    if(count($prodArr['rp'])>0){
                        $no++;
                    }
                }
                // get the percent of it
                $mult = ($no / count($order->products))/$no;
                  // rp - create the recurring profile(s)
                  
				  //kgt - discount coupons
				  global $coupon;
				  global $cart;
				  if( tep_session_is_registered( 'coupon' ) && tep_not_null( $coupon ) ) {
					require_once( DIR_WS_CLASSES.'discount_coupon.php' );
					$order_coupon = new discount_coupon( $coupon, $order_delivery );
					$order_coupon->total_valid_products( $cart->get_products(false) );
					$valid_products_count = 0;
				  }
				  //end kgt - discount coupons
				  
				  foreach ($order->products as $key => $prodArr){
                      
					//kgt - discount coupons
					if( is_object( $order_coupon ) ) {
					  $applied_discount = 0;
					  $discount = $order_coupon->calculate_discount( $prodArr, $valid_products_count );
					  if( $discount['applied_discount'] > 0 ) $valid_products_count++;
					  $shown_price = $order_coupon->calculate_shown_price( $discount, $prodArr );
					  $final_price = $shown_price['shown_price'];
					  $shown_price = $shown_price['actual_shown_price'];
					  $trial_price = $shown_price['shown_price_trial'];
					} else {
					  $shown_price = tep_add_tax($prodArr['final_price'], $prodArr['tax']) * $prodArr['qty'];
					  $final_price = $shown_price;
					  $trial_price = $prodArr['rp']['trialAmt'];
					}
					
					//end kgt - discount coupons
					  
					  if(count($prodArr['rp'])>0){
                          // rp product
                          // rp params
                          if($this->rp_autobill == 'Yes'){
                              $autobill = 'AddToNextBilling';
                          }else{
                              $autobill = 'NoAutoBill';
                          }
                          // standard text
                            include_once(DIR_WS_CLASSES . '/paypal_rp_product_info.php');
                            //aici am modificat
                            //$rpPprice = $currencies->display_price($prodArr['rp']['amt'],$prodArr['tax_class_id']);
                            //$rpPprice = $currencies->display_price($prodArr['final_price'],$prodArr['tax_class_id']);
                            $rpPprice = $currencies->format($final_price);
							$newvar=substr($rpPprice,2,strlen($rpPprice)-1);
                            //die(substr($prodArr['rp']['amt'],0,strlen($prodArr['rp']['amt'])-2));
                           // die($newvar.'text');
                            $rpPinfo = new paypal_rp_product_info($prodArr, $prodArr['rp'], $rpPprice);
                            $rpPInfoArr = $rpPinfo->getProductInfoFull();
                          // build the description
                          $desc = $prodArr['name'] . ' ';
                          if(strlen($prodArr['rp']['trialBillingPeriod'])>0){
                            $desc .= $rpPInfoArr['trial'] . ', and ';
                          }
                          $desc .= $rpPInfoArr['normal'];
                          $desc = substr($desc, 0, 127); // limit on length
                            // do the profile start date
                            $profileStartDate = $this->getSubscriptionStartDate($prodArr['rp']);
                          // rp the params
                          //'AMT'                 => substr($prodArr['rp']['amt'],0,strlen($prodArr['rp']['amt'])-2),
                          $params = array('USER'                => MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME,
                                          'PWD'                 => MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD,
                                          'VERSION'             => $this->api_version,
                                          'SIGNATURE'           => MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE,
                                          'METHOD'              => 'CreateRecurringPaymentsProfile',
                                          'TOKEN'               => $ppe_token,
                                          //'SUBSCRIBERNAME'      =>'',
                                          'PROFILESTARTDATE'    => $profileStartDate,
                                          //'PROFILEREFERENCE'    => '',
                                          'DESC'                => $desc,
                                          'MAXFAILEDPAYMENTS'   => $this->rp_maxfailedpayments,
                                          'AUTOBILLAMT'         => $autobill,
                                          'BILLINGPERIOD'       => ucfirst($prodArr['rp']['billingPeriod']),
                                          'BILLINGFREQUENCY'    => $prodArr['rp']['billingFrequency'],
                                          'TOTALBILLINGCYCLES'  => $prodArr['rp']['totalBillingCycles'],
                                          'AMT'                 => $newvar,
                                          'CURRENCYCODE'        => $order->info['currency'],
                                          'SHIPPINGAMT'         => $order->info['shipping_cost'],
                                          'TAXAMT'              => ($order->info['tax'] / $mult),
                                          'PAYERID'             => $ppe_payerid,
                                          'NOTIFYURL'             => HTTP_SERVER . '/ext/modules/payment/paypal/rp_ipn.php',
                                          'BUTTONSOURCE'        => 'osCommerce22_v20180_EC');
                        // rp check for init amount
                        if($prodArr['rp']['initAmt'] > 0){
                            $params['INITAMT'] = $prodArr['rp']['initAmt'];
                            if(!in_array($prodArr['rp']['failedInitAmtAction'], array('ContinueOnFailure','CancelOnFailure'))){
                                $params['FAILEDINITAMTACTION'] = 'ContinueOnFailure';
                            }else{
                                $params['FAILEDINITAMTACTION'] = $prodArr['rp']['failedInitAmtAction'];
                            }
                        }

                        // rp check for trial period
                        if(strlen($prodArr['rp']['trialBillingPeriod'])>0) {
                            if($prodArr['rp']['trialBillingPeriod'] == 'semimonth'){
                                $prodArr['rp']['trialBillingPeriod'] = 'semiMonth';
                            }
                            $params['TRIALBILLINGPERIOD']       = ucfirst($prodArr['rp']['trialBillingPeriod']);
                            $params['TRIALBILLINGFREQUENCY']    = $prodArr['rp']['trialBillingFrequency'];
                            $params['TRIALAMT']                 = $trial_price;
                            $params['TRIALTOTALBILLINGCYCLES']  = $prodArr['rp']['trialTotalBillingCycles'];
                            $params['TRIALTAXAMT']              = round(($order->info['tax'] / $mult)*($trial_price/$$final_price),2);
                            $params['TRIALSHIPPINGAMT']         = $order->info['shipping_cost'];
                        }

                      // FMF filter use
                      if($this->fmf_enabled){
                          $params['RETURNFMFDETAILS'] = '1';
                      }
                      // log the request
                    $this->recordToLog($params, 'request');
                      $post_string = '';

                      foreach ($params as $key => $value) {
                        $post_string .= $key . '=' . urlencode(trim($value)) . '&';
                      }

                      $post_string = substr($post_string, 0, -1);

                      $response = $this->sendTransactionToGateway($api_url, $post_string);

                      $response_array = array();
                      parse_str($response, $response_array);
                    // log the response
                    $this->recordToLog($response_array, 'response');
                      if($response_array['ACK'] == 'SuccessWithWarning'){
                        // fmf check
                        if($this->fmf_enabled){
                            // fmf check - lang id hardcode here to 1
                            /**
                             * @todo grab proper language id if nessacary
                             */
                            $fmfErr = $this->getReturnFMFErrors($response_array, 1);
                            if($fmfErr){
                                // there was a fraud check failure
                                $i=0;
                                foreach ($fmfErr as $key => $arr){
                                    $_SESSION['pp_fmf'][$i]['id'] = $arr['id'];
                                    $_SESSION['pp_fmf'][$i]['fmf_status_name'] = $arr['fmf_status_name'];
                                    $_SESSION['pp_fmf'][$i]['fmf_status_desc'] = $arr['fmf_status_desc'];
                                    $i++;
                                }
                            }else{
                                // no faud check failure
                                tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, 'error_message=' . stripslashes($response_array['L_LONGMESSAGE0']), 'SSL'));
                            }
                        }else{
                            tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, 'error_message=' . stripslashes($response_array['L_LONGMESSAGE0']), 'SSL'));
                        }
                      }elseif(($response_array['ACK'] != 'Success') && ($response_array['ACK'] != 'SuccessWithWarning')) {
                          tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, 'error_message=' . stripslashes($response_array['L_LONGMESSAGE0']), 'SSL'));
                      }
                      // grab the payeeeeid
                      // get product ID from a product ID with attributes -- Elan Marikit
                      $this->rp_profile[tep_get_prid($prodArr['id'])] = $response_array['PROFILEID'];
                    }
                  }
            break;
            case 'mixed':
                foreach ($order->products as $key => $prodArr){
                    if(count($prodArr['rp'])>0){
                        // recurring item - done one at time anyway skip
                        continue;
                    }else{
                        // standard tax total add
                        $standardTotal[$prodArr['id']]['total'] = ($prodArr['price'] * $prodArr['qty']);
                        $standardTotal[$prodArr['id']]['taxable'] = $prodArr['taxable'];
                        if($prodArr['taxable']){
                            $standardTotal[$prodArr['id']]['tax'] = $order->getTax($client, ($prodArr['price'] * $prodArr['qty']));
                        }
                    }
                }
                // add standards
                $amt=0;
                foreach ($standardTotal as $prodId => $arr){
                    if(array_key_exists('tax', $arr)){
                        $amt = $amt + ($arr['total'] + $arr['tax']);
                    }else{
                        $amt = $amt + ($arr['total']);
                    }
                }
                // standard first
              $params = array('USER' => MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME,
                              'PWD' => MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD,
                              'VERSION' => $this->api_version,
                              'SIGNATURE' => MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE,
                              'METHOD' => 'DoExpressCheckoutPayment',
                              'TOKEN' => $ppe_token,
                              'PAYMENTACTION' => ((MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD == 'Sale') ? 'Sale' : 'Authorization'),
                              'PAYERID' => $ppe_payerid,
                              'AMT' => $amt,
                              'CURRENCYCODE' => $order->info['currency'],
                              'NOTIFYURL' => HTTP_SERVER . '/ext/modules/payment/paypal/rp_ipn.php',
                              'BUTTONSOURCE' => 'osCommerce22_v20180_EC'
              );

              // FMF filter use
              if($this->fmf_enabled){
                  $params['RETURNFMFDETAILS'] = '1';
              }

              if (is_numeric($sendto) && ($sendto > 0)) {
                $params['SHIPTONAME'] = $order->delivery['firstname'] . ' ' . $order->delivery['lastname'];
                $params['SHIPTOSTREET'] = $order->delivery['street_address'];
                $params['SHIPTOCITY'] = $order->delivery['city'];
                $params['SHIPTOSTATE'] = tep_get_zone_code($order->delivery['country']['id'], $order->delivery['zone_id'], $order->delivery['state']);
                $params['SHIPTOCOUNTRYCODE'] = $order->delivery['country']['iso_code_2'];
                $params['SHIPTOZIP'] = $order->delivery['postcode'];
              }
                // log the request
                $this->recordToLog($params, 'request');
              $post_string = '';

              foreach ($params as $key => $value) {
                $post_string .= $key . '=' . urlencode(trim($value)) . '&';
              }

              $post_string = substr($post_string, 0, -1);

              $response = $this->sendTransactionToGateway($api_url, $post_string);
              $response_array = array();
              parse_str($response, $response_array);
                // log the response
                $this->recordToLog($response_array, 'response');
                if($response_array['ACK'] == 'SuccessWithWarning'){
                // fmf check
                if($this->fmf_enabled){
                    // fmf check - lang id hardcode here to 1
                    /**
                     * @todo grab proper language id if nessacary
                     */
                    $fmfErr = $this->getReturnFMFErrors($response_array, 1);
                    if($fmfErr){
                        // there was a fraud check failure
                        $i=0;
                        foreach ($fmfErr as $key => $arr){
                            $_SESSION['pp_fmf'][$i]['id'] = $arr['id'];
                            $_SESSION['pp_fmf'][$i]['fmf_status_name'] = $arr['fmf_status_name'];
                            $_SESSION['pp_fmf'][$i]['fmf_status_desc'] = $arr['fmf_status_desc'];
                            $i++;
                        }
                    }else{
                        // no faud check failure
                        tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, 'error_message=' . stripslashes($response_array['L_LONGMESSAGE0']), 'SSL'));
                    }
                }else{
                    tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, 'error_message=' . stripslashes($response_array['L_LONGMESSAGE0']), 'SSL'));
                }
              }elseif(($response_array['ACK'] != 'Success') && ($response_array['ACK'] != 'SuccessWithWarning')) {
                  tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, 'error_message=' . stripslashes($response_array['L_LONGMESSAGE0']), 'SSL'));
              }
              // PP transaction ID
              $_SESSION['pp_transaction_id'] = $response_array['TRANSACTIONID'];
              // recurring profiles
                $no=0;
                foreach ($order->products as $key => $prodArr){
                    if(count($prodArr['rp'])>0){
                        $no++;
                    }
                }
                // get the percent of it
                $mult = ($no / count($order->products))/$no;
                  // rp - create the recurring profile(s)
				  
				  //kgt - discount coupons
				  global $coupon;
				  global $cart;
				  if( tep_session_is_registered( 'coupon' ) && tep_not_null( $coupon ) ) {
					require_once( DIR_WS_CLASSES.'discount_coupon.php' );
					$order_coupon = new discount_coupon( $coupon, $order_delivery );
					$order_coupon->total_valid_products( $cart->get_products(false) );
					$valid_products_count = 0;
				  }
				  //end kgt - discount coupons
				  
                  foreach ($order->products as $key => $prodArr){
                      
					  if(count($prodArr['rp'])>0){
					  
					  	//kgt - discount coupons
						if( is_object( $order_coupon ) ) {
						  $applied_discount = 0;
						  $discount = $order_coupon->calculate_discount( $prodArr, $valid_products_count );
					if( $discount['applied_discount'] > 0 ) $valid_products_count++;
					  $shown_price = $order_coupon->calculate_shown_price( $discount, $prodArr );
					  $final_price = $shown_price['shown_price'];
					  $shown_price = $shown_price['actual_shown_price'];
					  $trial_price = $shown_price['shown_price_trial'];
					} else {
					  $shown_price = tep_add_tax($prodArr['final_price'], $prodArr['tax']) * $prodArr['qty'];
					  $final_price = $shown_price;
					  $trial_price = $prodArr['rp']['trialAmt'];
					}

						
						//end kgt - discount coupons
						
                          // rp product
                          // rp params
                          if($this->rp_autobill == 'Yes'){
                              $autobill = 'AddToNextBilling';
                          }else{
                              $autobill = 'NoAutoBill';
                          }
                            include_once(DIR_WS_CLASSES . '/paypal_rp_product_info.php');
                            $rpPprice = $currencies->format($final_price);
                            $rpPinfo = new paypal_rp_product_info($prodArr, $prodArr['rp'], $rpPprice);
                            $rpPInfoArr = $rpPinfo->getProductInfoFull();
                          // build the description
                          $desc = $prodArr['name'] . ' ';
                          if(strlen($prodArr['rp']['trialBillingPeriod'])>0){
                            $desc .=  $rpPInfoArr['trial'] . ', and ';
                          }
                          $desc .= $rpPInfoArr['normal'];
                          $desc = substr($desc, 0, 127); // limit on length
                            // do the profile start date
                            $profileStartDate = $this->getSubscriptionStartDate($prodArr['rp']);
                          // rp the params
                          $params = array('USER'                => MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME,
                                          'PWD'                 => MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD,
                                          'VERSION'             => $this->api_version,
                                          'SIGNATURE'           => MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE,
                                          'METHOD'              => 'CreateRecurringPaymentsProfile',
                                          'TOKEN'               => $ppe_token,
                                          //'SUBSCRIBERNAME'      =>'',
                                          'PROFILESTARTDATE'    => $profileStartDate,
                                          //'PROFILEREFERENCE'    => '',
                                          'DESC'                => $desc,
                                          'MAXFAILEDPAYMENTS'   => $this->rp_maxfailedpayments,
                                          'AUTOBILLAMT'         => $autobill,
                                          'BILLINGPERIOD'       => ucfirst($prodArr['rp']['billingPeriod']),
                                          'BILLINGFREQUENCY'    => $prodArr['rp']['billingFrequency'],
                                          'TOTALBILLINGCYCLES'  => $prodArr['rp']['totalBillingCycles'],
                                          'AMT'                 => $final_price,
                                          'CURRENCYCODE'        => $order->info['currency'],
                                          'SHIPPINGAMT'         => $order->info['shipping_cost'],
                                          'TAXAMT'              => ($order->info['tax'] / $mult),
                                          'PAYERID'             => $ppe_payerid,
                                          'NOTIFYURL'           => HTTP_SERVER . '/ext/modules/payment/paypal/rp_ipn.php',
                                          'BUTTONSOURCE'        => 'osCommerce22_v20180_EC');

                        // rp check for init amount
                        if($prodArr['rp']['initAmt'] > 0){
                            $params['INITAMT'] = $prodArr['rp']['initAmt'];
                            if(!in_array($prodArr['rp']['failedInitAmtAction'], array('ContinueOnFailure','CancelOnFailure'))){
                                $params['FAILEDINITAMTACTION'] = 'ContinueOnFailure';
                            }else{
                                $params['FAILEDINITAMTACTION'] = $prodArr['rp']['failedInitAmtAction'];
                            }
                        }

                        // rp check for trial period
                        if(strlen($prodArr['rp']['trialBillingPeriod'])>0) {
                            if($prodArr['rp']['trialBillingPeriod'] == 'semimonth'){
                                $prodArr['rp']['trialBillingPeriod'] = 'semiMonth';
                            }
                            $params['TRIALBILLINGPERIOD']       = ucfirst($prodArr['rp']['trialBillingPeriod']);
                            $params['TRIALBILLINGFREQUENCY']    = $prodArr['rp']['trialBillingFrequency'];
                            $params['TRIALAMT']                 = $trial_price;
                            $params['TRIALTOTALBILLINGCYCLES']  = $prodArr['rp']['trialTotalBillingCycles'];
                            $params['TRIALTAXAMT']              = round(($order->info['tax'] / $mult)*($trial_price/$final_price),2);
                            $params['TRIALSHIPPINGAMT']         = $order->info['shipping_cost'];
                        }

                      // FMF filter use
                      if($this->fmf_enabled){
                          $params['RETURNFMFDETAILS'] = '1';
                      }
                      // log the request
                    $this->recordToLog($params, 'request');
                      $post_string = '';

                      foreach ($params as $key => $value) {
                        $post_string .= $key . '=' . urlencode(trim($value)) . '&';
                      }

                      $post_string = substr($post_string, 0, -1);

                      $response = $this->sendTransactionToGateway($api_url, $post_string);

                      $response_array = array();
                      parse_str($response, $response_array);
                        // log the response
                    $this->recordToLog($response_array, 'response');
                      if($response_array['ACK'] == 'SuccessWithWarning'){
                        // fmf check
                        if($this->fmf_enabled){
                            // fmf check - lang id hardcode here to 1
                            /**
                             * @todo grab proper language id if nessacary
                             */
                            $fmfErr = $this->getReturnFMFErrors($response_array, 1);
                            if($fmfErr){
                                // there was a fraud check failure
                                $i=0;
                                foreach ($fmfErr as $key => $arr){
                                    $_SESSION['pp_fmf'][$i]['id'] = $arr['id'];
                                    $_SESSION['pp_fmf'][$i]['fmf_status_name'] = $arr['fmf_status_name'];
                                    $_SESSION['pp_fmf'][$i]['fmf_status_desc'] = $arr['fmf_status_desc'];
                                    $i++;
                                }
                            }else{
                                // no faud check failure
                                tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, 'error_message=' . stripslashes($response_array['L_LONGMESSAGE0']), 'SSL'));
                            }
                        }else{
                            tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, 'error_message=' . stripslashes($response_array['L_LONGMESSAGE0']), 'SSL'));
                        }
                      }elseif(($response_array['ACK'] != 'Success') && ($response_array['ACK'] != 'SuccessWithWarning')) {
                          tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, 'error_message=' . stripslashes($response_array['L_LONGMESSAGE0']), 'SSL'));
                      }
                      // grab the payeeeeid
                      // get product ID from a product ID with attributes -- Elan Marikit
                      $this->rp_profile[tep_get_prid($prodArr['id'])] = $response_array['PROFILEID'];
                    }
                  }
            break;
        }

      return $this->rp_profile;
    }

    function after_process() {
        if($_SESSION['paypal_ec_temp'] == 'True'){
            $this->ec_delete_user($_SESSION['customer_id']);
        }
      tep_session_unregister('ppe_token');
      tep_session_unregister('ppe_payerid');
      // fmf remove
      tep_session_unregister('pp_fmf');
      tep_session_unregister('pp_transaction_id');
    }

    function get_error() {
      return false;
    }

    function check() {
      if (!isset($this->_check)) {
        $check_query = tep_db_query("select configuration_value from " . TABLE_CONFIGURATION . " where configuration_key = 'MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS'");
        $this->_check = tep_db_num_rows($check_query);
      }
      return $this->_check;
    }

    function install() {
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable PayPal Express Checkout', 'MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS', 'True', 'Do you want to accept PayPal Express Checkout payments?', '6', '1', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      // rp items
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable PayPal Recurring Payments', 'MODULE_PAYMENT_PAYPAL_EXPRESS_RP_STATUS', 'False', 'Do you want to use PayPal Recurring Payments?', '6', '0', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Recurring Payments Autobill', 'MODULE_PAYMENT_PAYPAL_EXPRESS_RP_AUTOBILLOUTAMT', 'No', 'With PayPal Recurring Payments would you like any outstanding amounts automatically attempted to be collected?', '6', '0', 'tep_cfg_select_option(array(\'Yes\', \'No\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Recurring Payments Maximum Failed Payments', 'MODULE_PAYMENT_PAYPAL_EXPRESS_RP_MAXFAILEDPAYMENTS', '0', 'Enter the max number of of scheduled payments that can fail before the profile is automatically suspended.', '6', '0', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable PayPal Fraud Managment Filters Check', 'MODULE_PAYMENT_PAYPAL_EXPRESS_FMF_STATUS', 'False', 'Are your Paypal Fraud Management Filters Enabled in your Paypal Merchant Admin?', '6', '0', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      // -- end rp items
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('API Username', 'MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME', '', 'The username to use for the PayPal API service', '6', '0', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('API Password', 'MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD', '', 'The password to use for the PayPal API service', '6', '0', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('API Signature', 'MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE', '', 'The signature to use for the PayPal API service', '6', '0', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Transaction Server', 'MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER', 'Sandbox', 'Use the live or testing (sandbox) gateway server to process transactions?', '6', '0', 'tep_cfg_select_option(array(\'Live\', \'Sandbox\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Transaction Method', 'MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD', 'Sale', 'The processing method to use for each transaction.', '6', '0', 'tep_cfg_select_option(array(\'Authorization\', \'Sale\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) values ('Payment Zone', 'MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', '6', '2', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Sort order of display.', 'MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, use_function, date_added) values ('Set Order Status', 'MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', '6', '0', 'tep_cfg_pull_down_order_statuses(', 'tep_get_order_status_name', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Automatic Account Creation', 'MODULE_PAYMENT_PAYPAL_EXPRESS_NEW_ACCT_NOTIFY', 'Yes', 'If a visitor is not an existing customer, an account is created for them.  Would you like make it a permanent account and send them an email containing their login information?', '6', '9', 'tep_cfg_select_option(array(\'Yes\', \'No\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('cURL Program Location', 'MODULE_PAYMENT_PAYPAL_EXPRESS_CURL', '/usr/bin/curl', 'The location to the cURL program application.', '6', '0' , now())");
      // log file location
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Log File Location', 'MODULE_PAYMENT_PAYPAL_EXPRESS_LOGFILE', '/tmp/paypal_express.log', 'The location for the log file, verify that there are write permission given to the file.', '6', '0', now())");
      // base structure install
      $this->baseStructureInstall();
   }

    function remove() {
      tep_db_query("delete from " . TABLE_CONFIGURATION . " where configuration_key in ('" . implode("', '", $this->keys()) . "')");
    }

    function keys() {
      return array('MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS', 'MODULE_PAYMENT_PAYPAL_EXPRESS_RP_STATUS', 'MODULE_PAYMENT_PAYPAL_EXPRESS_RP_AUTOBILLOUTAMT','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_MAXFAILEDPAYMENTS','MODULE_PAYMENT_PAYPAL_EXPRESS_FMF_STATUS', 'MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME', 'MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD', 'MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE', 'MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER', 'MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD', 'MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE', 'MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID', 'MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER', 'MODULE_PAYMENT_PAYPAL_EXPRESS_NEW_ACCT_NOTIFY', 'MODULE_PAYMENT_PAYPAL_EXPRESS_CURL', 'MODULE_PAYMENT_PAYPAL_EXPRESS_LOGFILE');
    }

    function sendTransactionToGateway($url, $parameters) {
      $server = parse_url($url);

      if (!isset($server['port'])) {
        $server['port'] = ($server['scheme'] == 'https') ? 443 : 80;
      }

      if (!isset($server['path'])) {
        $server['path'] = '/';
      }

      if (isset($server['user']) && isset($server['pass'])) {
        $header[] = 'Authorization: Basic ' . base64_encode($server['user'] . ':' . $server['pass']);
      }

      if (function_exists('curl_init')) {
        $curl = curl_init($server['scheme'] . '://' . $server['host'] . $server['path'] . (isset($server['query']) ? '?' . $server['query'] : ''));
        curl_setopt($curl, CURLOPT_PORT, $server['port']);
        curl_setopt($curl, CURLOPT_HEADER, 0);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_FORBID_REUSE, 1);
        curl_setopt($curl, CURLOPT_FRESH_CONNECT, 1);
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $parameters);

        $result = curl_exec($curl);

        curl_close($curl);
      } else {
        exec(escapeshellarg(MODULE_PAYMENT_PAYPAL_EXPRESS_CURL) . ' -d ' . escapeshellarg($parameters) . ' "' . $server['scheme'] . '://' . $server['host'] . $server['path'] . (isset($server['query']) ? '?' . $server['query'] : '') . '" -P ' . $server['port'] . ' -k', $result);
        $result = implode("\n", $result);
      }

      return $result;
    }

// format prices without currency formatting
    function format_raw($number, $currency_code = '', $currency_value = '') {
      global $currencies, $currency;

      if (empty($currency_code) || !$this->is_set($currency_code)) {
        $currency_code = $currency;
      }

      if (empty($currency_value) || !is_numeric($currency_value)) {
        $currency_value = $currencies->currencies[$currency_code]['value'];
      }

      return number_format(tep_round($number * $currency_value, $currencies->currencies[$currency_code]['decimal_places']), $currencies->currencies[$currency_code]['decimal_places'], '.', '');
    }
  }
?>
