<?php
/*
  $Id: paypal_direct.php 1803 2008-01-11 18:16:37Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2008 osCommerce

  Released under the GNU General Public License
*/
require_once dirname(__FILE__) . '/paypal/paypal_base.php';
require_once dirname(__FILE__) . '/paypal/paypal_cc.php';

  class paypal_direct extends paypal_base {
      var $module_country;
// class constructor
    function paypal_direct() {
      global $order;

      $this->signature = 'paypal|paypal_direct|1.0|2.2';

      $this->code = 'paypal_direct';
      $this->title = MODULE_PAYMENT_PAYPAL_DIRECT_TEXT_TITLE;
      $this->public_title = MODULE_PAYMENT_PAYPAL_DIRECT_TEXT_PUBLIC_TITLE;
      $this->description = MODULE_PAYMENT_PAYPAL_DIRECT_TEXT_DESCRIPTION;
      $this->sort_order = MODULE_PAYMENT_PAYPAL_DIRECT_SORT_ORDER;
      $this->enabled = ((MODULE_PAYMENT_PAYPAL_DIRECT_STATUS == 'True') ? true : false);
      $this->rp_enabled = ((MODULE_PAYMENT_PAYPAL_DIRECT_RP_STATUS == 'True') ? true : false);
      $this->rp_autobill = MODULE_PAYMENT_PAYPAL_DIRECT_RP_AUTOBILLOUTAMT;
      $this->rp_maxfailedpayments = MODULE_PAYMENT_PAYPAL_DIRECT_MAXFAILEDPAYMENTS;
      $this->fmf_enabled = ((MODULE_PAYMENT_PAYPAL_DIRECT_FMF_STATUS == 'True') ? true : false);
      $this->module_country = MODULE_PAYMENT_PAYPAL_DIRECT_COUNTRY;
      $this->log_file_location = MODULE_PAYMENT_PAYPAL_DIRECT_LOGFILE;
      $this->secure_title = MODULE_PAYMENT_PAYPAL_DIRECT_3D_TEXT_TITLE;
      $this->secure_description = MODULE_PAYMENT_PAYPAL_DIRECT_3D_TEXT_DESCRIPTION;
      $this->secure_enabled = ((MODULE_PAYMENT_PAYPAL_DIRECT_3D_STATUS == 'true') ? true : false);
      $this->secure_chargeBackProtection = MODULE_PAYMENT_PAYPAL_DIRECT_3D_AUTHENTICATE_REQ;
      // default the country
      if(strlen($this->module_country)<2){
          // default hardcoded to US
          $this->module_country = 'US';
      }
      if ((int)MODULE_PAYMENT_PAYPAL_DIRECT_ORDER_STATUS_ID > 0) {
        $this->order_status = MODULE_PAYMENT_PAYPAL_DIRECT_ORDER_STATUS_ID;
      }

      if (is_object($order)) $this->update_status();
      // set the CC types array
      $obj = new paypal_cc($this->module_country);
      $this->cc_types = $obj->ccArr;
    }
    // class methods
    function update_status() {
      global $order;

      if ( ($this->enabled == true) && ((int)MODULE_PAYMENT_PAYPAL_DIRECT_ZONE > 0) ) {
        $check_flag = false;
        $check_query = tep_db_query("select zone_id from " . TABLE_ZONES_TO_GEO_ZONES . " where geo_zone_id = '" . MODULE_PAYMENT_PAYPAL_DIRECT_ZONE . "' and zone_country_id = '" . $order->delivery['country']['id'] . "' order by zone_id");
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

    function javascript_validation() {
      return false;
    }

    function selection() {
      // selection
      $selection = array('id' => $this->code,
                   'module' => $this->public_title);
      // add the paypal logo
      /**
      $selection['fields'][0] = array('title' => '',
       'field' => '
       <!-- PayPal Logo -->
       <table border="0" cellpadding="0" cellspacing="0" align="center">
	   		<tr>
	   			<td align="center"><a href="#" onclick="javascript:window.open(\'https://www.paypal.com/cgi-bin/webscr?cmd=xpt/Marketing/popup/OLCWhatIsPayPal-outside\',\'olcwhatispaypal\',\'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=400, height=350\');"><img  src="https://www.paypal.com/en_US/i/logo/PayPal_mark_37x23.gif" border="0" alt="Acceptance Mark"></a></td>
	   		</tr>
	   </table>
	   <!-- PayPal Logo -->
       ');
       **/
      // 3ds for UK secure only
      if($this->module_country == 'UK' and $this->secure_enabled === true){
            $selection['fields'][0] = array('title' =>  '',
                'field' => '<table width="310" cellspacing="1" cellpadding="2" class="infoBox"><tr bgcolor="FFFFFF" valign="top">' .
                '<td><table width="310" bgcolor="FFFFFF" cellpadding="3">' .
                '<tr><td width="50%" align="center"><a href="javascript:void window.open(\'vbv_service_popup.html\',\'vbv_service\',\'width=390,height=480\')">' .
                tep_image(DIR_WS_IMAGES.'vbv_learn_more.gif') . '</a></td>' .
                '<td width="50%" align="center"><a href="javascript:void window.open(\'http://www.mastercardbusiness.com/mcbiz/index.jsp?template=/orphans&content=securecodepopup\',\'mcsc_service\',\'width=550,height=400\')">' .
                tep_image(DIR_WS_IMAGES.'mcsc_learn_more.gif') . '</a></td>' .
                '</tr><tr><td colspan="2" class="smallText">' .
                '<font color="F00000"><b>Your card may be eligible or enrolled in Verified by Visa&#153; or MasterCard&#174; ' .
                'SecureCode&#153; payer authentication programs. After you have confirmed this order, your Card Issuer may ' .
                'prompt you for your payer authentication password to complete your purchase.</b></font></td></tr></table></td></tr></table>'
            );
      }

      return $selection;
    }

    function pre_confirmation_check() {
      return false;
    }

    function confirmation() {
      global $order;

      $types_array = array();
      while (list($key, $value) = each($this->cc_types)) {
        $types_array[] = array('id' => $key,
                               'text' => $value);
      }

      $today = getdate();

      $months_array = array();
      for ($i=1; $i<13; $i++) {
        $months_array[] = array('id' => sprintf('%02d', $i), 'text' => strftime('%B',mktime(0,0,0,$i,1,2000)));
      }

      $year_valid_from_array = array();
      for ($i=$today['year']-10; $i < $today['year']+1; $i++) {
        $year_valid_from_array[] = array('id' => strftime('%Y',mktime(0,0,0,1,1,$i)), 'text' => strftime('%Y',mktime(0,0,0,1,1,$i)));
      }

      $year_expires_array = array();
      for ($i=$today['year']; $i < $today['year']+10; $i++) {
        $year_expires_array[] = array('id' => strftime('%Y',mktime(0,0,0,1,1,$i)), 'text' => strftime('%Y',mktime(0,0,0,1,1,$i)));
      }

      $confirmation = array('fields' => array(array('title' => MODULE_PAYMENT_PAYPAL_DIRECT_CARD_OWNER,
                                                    'field' => tep_draw_input_field('cc_owner', $order->billing['firstname'] . ' ' . $order->billing['lastname'])),
                                              array('title' => MODULE_PAYMENT_PAYPAL_DIRECT_CARD_TYPE,
                                                    'field' => tep_draw_pull_down_menu('cc_type', $types_array)),
                                              array('title' => MODULE_PAYMENT_PAYPAL_DIRECT_CARD_NUMBER,
                                                    'field' => tep_draw_input_field('cc_number_nh-dns')),
                                              array('title' => MODULE_PAYMENT_PAYPAL_DIRECT_CARD_VALID_FROM,
                                                    'field' => tep_draw_pull_down_menu('cc_starts_month', $months_array) . '&nbsp;' . tep_draw_pull_down_menu('cc_starts_year', $year_valid_from_array) . ' ' . MODULE_PAYMENT_PAYPAL_DIRECT_CARD_VALID_FROM_INFO),
                                              array('title' => MODULE_PAYMENT_PAYPAL_DIRECT_CARD_EXPIRES,
                                                    'field' => tep_draw_pull_down_menu('cc_expires_month', $months_array) . '&nbsp;' . tep_draw_pull_down_menu('cc_expires_year', $year_expires_array)),
                                              array('title' => MODULE_PAYMENT_PAYPAL_DIRECT_CARD_CVC,
                                                    'field' => tep_draw_input_field('cc_cvc_nh-dns', '', 'size="5" maxlength="4"')),
                                              array('title' => MODULE_PAYMENT_PAYPAL_DIRECT_CARD_ISSUE_NUMBER,
                                                    'field' => tep_draw_input_field('cc_issue_nh-dns', '', 'size="3" maxlength="2"') . ' ' . MODULE_PAYMENT_PAYPAL_DIRECT_CARD_ISSUE_NUMBER_INFO)));

      return $confirmation;
    }

    function process_button() {
        if($this->secure_enabled and $this->module_country == 'UK'){
            global $serialized_post_vars;
            $serialized_post_vars = serialize($HTTP_POST_VARS);
            tep_session_register('serialized_post_vars');
            $process_button_string = tep_draw_hidden_field(tep_session_name(), tep_session_id());

            if ($this->requiresLookup($HTTP_POST_VARS['cc_number']) == true) {
                print 'requers lookup';
              $process_button_string = '<table cellspacing="1" cellpadding="4" class="infoBox"><tr class="infoBoxContents"><td class="smallText">' .
                                       '<font color="F00000"><b>Your card may be eligible or enrolled in Verified by Visa or ' .
                                       'MasterCard&#174; SecureCode&#153;. When you click \'Confirm Order\' ' .
                                       'below, you may be prompted for further information before your ' .
                                       'purchase can be completed.</b></font>' .
                                       '</td></tr>' .
                                       '</table><br>' . $process_button_string;
            }

            return $process_button_string;
        }else{
            // reg return
            return false;
        }
    }

    function before_process() {
      global $HTTP_POST_VARS, $order, $sendto, $currencies;

      if (isset($HTTP_POST_VARS['cc_owner']) && !empty($HTTP_POST_VARS['cc_owner']) && isset($HTTP_POST_VARS['cc_type']) && isset($this->cc_types[$HTTP_POST_VARS['cc_type']]) && isset($HTTP_POST_VARS['cc_number_nh-dns']) && !empty($HTTP_POST_VARS['cc_number_nh-dns'])) {
        if (MODULE_PAYMENT_PAYPAL_DIRECT_TRANSACTION_SERVER == 'Live') {
          $api_url = $this->nvp_api_url;
        } else {
          $api_url = $this->nvp_api_url_sandbox;
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
        }else{
            $case_product_type = $prodTypeArr[0];
        }
        // switch
        switch ($case_product_type){
            // standard
            case 'standard':
                $params = array('USER' => MODULE_PAYMENT_PAYPAL_DIRECT_API_USERNAME,
                                'PWD' => MODULE_PAYMENT_PAYPAL_DIRECT_API_PASSWORD,
                                'VERSION' => $this->api_version,
                                'SIGNATURE' => MODULE_PAYMENT_PAYPAL_DIRECT_API_SIGNATURE,
                                'METHOD' => 'DoDirectPayment',
                                'PAYMENTACTION' => ((MODULE_PAYMENT_PAYPAL_DIRECT_TRANSACTION_METHOD == 'Sale') ? 'Sale' : 'Authorization'),
                                'IPADDRESS' => tep_get_ip_address(),
                                'AMT' => $this->format_raw($order->info['total']),
                                'CREDITCARDTYPE' => $HTTP_POST_VARS['cc_type'],
                                'ACCT' => $HTTP_POST_VARS['cc_number_nh-dns'],
                                'STARTDATE' => $HTTP_POST_VARS['cc_starts_month'] . $HTTP_POST_VARS['cc_starts_year'],
                                'EXPDATE' => $HTTP_POST_VARS['cc_expires_month'] . $HTTP_POST_VARS['cc_expires_year'],
                                'CVV2' => $HTTP_POST_VARS['cc_cvc_nh-dns'],
                                'FIRSTNAME' => substr($HTTP_POST_VARS['cc_owner'], 0, strpos($HTTP_POST_VARS['cc_owner'], ' ')),
                                'LASTNAME' => substr($HTTP_POST_VARS['cc_owner'], strpos($HTTP_POST_VARS['cc_owner'], ' ')+1),
                                'STREET' => $order->billing['street_address'],
                                'CITY' => $order->billing['city'],
                                'STATE' => tep_get_zone_code($order->billing['country']['id'], $order->billing['zone_id'], $order->billing['state']),
                                'COUNTRYCODE' => $order->billing['country']['iso_code_2'],
                                'ZIP' => $order->billing['postcode'],
                                'EMAIL' => $order->customer['email_address'],
                                'PHONENUM' => $order->customer['telephone'],
                                'CURRENCYCODE' => $order->info['currency'],
                                'NOTIFYURL' => HTTP_SERVER . '/ext/modules/payment/paypal/rp_ipn.php',
                                'BUTTONSOURCE' => 'osCommerce22_v20180_DP');

                if ( ($HTTP_POST_VARS['cc_type'] == 'SWITCH') || ($HTTP_POST_VARS['cc_type'] == 'MAESTRO') ) {
                    $params['ISSUENUMBER'] = $HTTP_POST_VARS['cc_issue_nh-dns'];
                }

                if (is_numeric($sendto) && ($sendto > 0)) {
                    $params['SHIPTONAME'] = $order->delivery['firstname'] . ' ' . $order->delivery['lastname'];
                    $params['SHIPTOSTREET'] = $order->delivery['street_address'];
                    $params['SHIPTOCITY'] = $order->delivery['city'];
                    $params['SHIPTOSTATE'] = tep_get_zone_code($order->delivery['country']['id'], $order->delivery['zone_id'], $order->delivery['state']);
                    $params['SHIPTOCOUNTRYCODE'] = $order->delivery['country']['iso_code_2'];
                    $params['SHIPTOZIP'] = $order->delivery['postcode'];
                }
              // FMF filter use
              if($this->fmf_enabled){
                  $params['RETURNFMFDETAILS'] = '1';
              }
              // see if 3ds was used
              if($this->secure_enabled and $this->module_country == 'UK'){
                  if(isset($_SESSION['auth_xid']) and strlen($_SESSION['auth_xid'])>0){
                      $params['ECI3DS']         = $_SESSION['auth_eci'];
                      $params['CAVV']           = $_SESSION['auth_cavv'];
                      $params['XID']            = $_SESSION['auth_xid'];
                      $params['AUTHSTATUS3DS']  = $_SESSION['auth_status'];
                      $params['MPIVENDOR3DS']   = 'Cardinal';
                  }
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
                if (($response_array['ACK'] != 'Success') && ($response_array['ACK'] != 'SuccessWithWarning')) {
                    tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, 'error_message=' . stripslashes($response_array['L_LONGMESSAGE0']), 'SSL'));
                }
                // PP transaction ID
                $_SESSION['pp_transaction_id'] = $response_array['TRANSACTIONID'];
            break;
            // recurring only
            case 'recurring':
                $no=0;
                foreach ($order->products as $key => $prodArr){
                    $no++;
                }
                foreach ($order->products as $key => $prodArr){
                    // rp params
                    if($this->rp_autobill == 'Yes'){
                        $autobill = 'AddToNextBilling';
                    }else{
                        $autobill = 'NoAutoBill';
                    }
                    // build the description
                    $desc = $prodArr['name'] . ' ';
                    if(strlen($prodArr['rp']['trialBillingPeriod'])>0){
                        $desc .= 'Trial at: ' . $currencies->display_price($prodArr['rp']['trialAmt'],$prodArr['tax_class_id']) . ' every ' . $prodArr['rp']['trialBillingPeriod'] . ' for ' . $prodArr['rp']['trialTotalBillingCycles'] . ' ' . $prodArr['rp']['trialBillingPeriod'] . 's ,and ';
                    }
                    $desc .= 'Recurring at: ' . $currencies->display_price($prodArr['rp']['amt'],$prodArr['tax_class_id']). ' every ' . $prodArr['rp']['billingPeriod'] . ' for ' . $prodArr['rp']['totalBillingCycles'] . ' ' . $prodArr['rp']['billingPeriod'] . 's';
                    $desc = substr($desc, 0, 127); // limit on length
                    if($prodArr['rp']['billingPeriod'] == 'semimonth'){
                        $prodArr['rp']['billingPeriod'] = 'semiMonth';
                    }
                    // do the profile start date
                    $profileStartDate = $this->getSubscriptionStartDate($prodArr['rp']);
                    //
                    $params = array('USER'                  => MODULE_PAYMENT_PAYPAL_DIRECT_API_USERNAME,
                                    'PWD'                   => MODULE_PAYMENT_PAYPAL_DIRECT_API_PASSWORD,
                                    'VERSION'               => $this->api_version,
                                    'SIGNATURE'             => MODULE_PAYMENT_PAYPAL_DIRECT_API_SIGNATURE,
                                    'METHOD'                => 'CreateRecurringPaymentsProfile',
                                    'IPADDRESS'             => tep_get_ip_address(),
                                    'AMT'                   => substr($prodArr['rp']['amt'], 0, strlen($prodArr['rp']['amt'])-2),
                                    'CREDITCARDTYPE'        => $HTTP_POST_VARS['cc_type'],
                                    'ACCT'                  => $HTTP_POST_VARS['cc_number_nh-dns'],
                                    'EXPDATE'               => $HTTP_POST_VARS['cc_expires_month'] . $HTTP_POST_VARS['cc_expires_year'],
                                    'CVV2'                  => $HTTP_POST_VARS['cc_cvc_nh-dns'],
                                    'FIRSTNAME'             => substr($HTTP_POST_VARS['cc_owner'], 0, strpos($HTTP_POST_VARS['cc_owner'], ' ')),
                                    'LASTNAME'              => substr($HTTP_POST_VARS['cc_owner'], strpos($HTTP_POST_VARS['cc_owner'], ' ')+1),
                                    'STREET'                => $order->billing['street_address'],
                                    'CITY'                  => $order->billing['city'],
                                    'STATE'                 => tep_get_zone_code($order->billing['country']['id'], $order->billing['zone_id'], $order->billing['state']),
                                    'COUNTRYCODE'           => $order->billing['country']['iso_code_2'],
                                    'ZIP'                   => $order->billing['postcode'],
                                    'EMAIL'                 => $order->customer['email_address'],
                                    'PHONENUM'              => $order->customer['telephone'],
                                    'CURRENCYCODE'          => $order->info['currency'],
                                    'PROFILESTARTDATE'      => $profileStartDate,
                                    'DESC'                  => $desc,
                                    'MAXFAILEDPAYMENTS'     => $this->rp_maxfailedpayments,
                                    'AUTOBILLAMT'           => $autobill,
                                    'BILLINGPERIOD'         => ucfirst($prodArr['rp']['billingPeriod']),
                                    'BILLINGFREQUENCY'      => $prodArr['rp']['billingFrequency'],
                                    'TOTALBILLINGCYCLES'    => $prodArr['rp']['totalBillingCycles'],
                                    'SHIPPINGAMT'           => ($order->info['shipping_cost']/$no),
                                    'TAXAMT'                => ($order->info['tax'] / $no),
                                    'NOTIFYURL'             => HTTP_SERVER . '/ext/modules/payment/paypal/rp_ipn.php',
                                    'BUTTONSOURCE'          => 'osCommerce22_v20180_DP',
                                    );
                    // switch / solo
                    if ( ($HTTP_POST_VARS['cc_type'] == 'SWITCH') || ($HTTP_POST_VARS['cc_type'] == 'SOLO') ) {
                        $params['ISSUENUMBER'] = $HTTP_POST_VARS['cc_issue_nh-dns'];
                    }
                    // shipping
                    if (is_numeric($sendto) && ($sendto > 0)) {
                        $params['SHIPTONAME'] = $order->delivery['firstname'] . ' ' . $order->delivery['lastname'];
                        $params['SHIPTOSTREET'] = $order->delivery['street_address'];
                        $params['SHIPTOCITY'] = $order->delivery['city'];
                        $params['SHIPTOSTATE'] = tep_get_zone_code($order->delivery['country']['id'], $order->delivery['zone_id'], $order->delivery['state']);
                        $params['SHIPTOCOUNTRYCODE'] = $order->delivery['country']['iso_code_2'];
                        $params['SHIPTOZIP'] = $order->delivery['postcode'];
                    }
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
                        $params['TRIALAMT']                 = substr($prodArr['rp']['trialAmt'],0,strlen($prodArr['rp']['trialAmt'])-2);
                        $params['TRIALTOTALBILLINGCYCLES']  = $prodArr['rp']['trialTotalBillingCycles'];
                        $params['TRIALTAXAMT']              = round(($order->info['tax'] / $no)*($prodArr['rp']['trialAmt']/$prodArr['rp']['amt']),2);
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
                    if (($response_array['ACK'] != 'Success') && ($response_array['ACK'] != 'SuccessWithWarning')) {
                        tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, 'error_message=' . stripslashes($response_array['L_LONGMESSAGE0']), 'SSL'));
                    }
                    // get product ID from a product ID with attributes -- Elan Marikit
                    $this->rp_profile[tep_get_prid($prodArr['id'])] = $response_array['PROFILEID'];
                }

            break;
            // both standard and recurring
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
                $params = array('USER' => MODULE_PAYMENT_PAYPAL_DIRECT_API_USERNAME,
                                'PWD' => MODULE_PAYMENT_PAYPAL_DIRECT_API_PASSWORD,
                                'VERSION' => $this->api_version,
                                'SIGNATURE' => MODULE_PAYMENT_PAYPAL_DIRECT_API_SIGNATURE,
                                'METHOD' => 'DoDirectPayment',
                                'PAYMENTACTION' => ((MODULE_PAYMENT_PAYPAL_DIRECT_TRANSACTION_METHOD == 'Sale') ? 'Sale' : 'Authorization'),
                                'IPADDRESS' => tep_get_ip_address(),
                                'AMT' => $amt,
                                'CREDITCARDTYPE' => $HTTP_POST_VARS['cc_type'],
                                'ACCT' => $HTTP_POST_VARS['cc_number_nh-dns'],
                                'STARTDATE' => $HTTP_POST_VARS['cc_starts_month'] . $HTTP_POST_VARS['cc_starts_year'],
                                'EXPDATE' => $HTTP_POST_VARS['cc_expires_month'] . $HTTP_POST_VARS['cc_expires_year'],
                                'CVV2' => $HTTP_POST_VARS['cc_cvc_nh-dns'],
                                'FIRSTNAME' => substr($HTTP_POST_VARS['cc_owner'], 0, strpos($HTTP_POST_VARS['cc_owner'], ' ')),
                                'LASTNAME' => substr($HTTP_POST_VARS['cc_owner'], strpos($HTTP_POST_VARS['cc_owner'], ' ')+1),
                                'STREET' => $order->billing['street_address'],
                                'CITY' => $order->billing['city'],
                                'STATE' => tep_get_zone_code($order->billing['country']['id'], $order->billing['zone_id'], $order->billing['state']),
                                'COUNTRYCODE' => $order->billing['country']['iso_code_2'],
                                'ZIP' => $order->billing['postcode'],
                                'EMAIL' => $order->customer['email_address'],
                                'PHONENUM' => $order->customer['telephone'],
                                'CURRENCYCODE' => $order->info['currency'],
                                'NOTIFYURL' => HTTP_SERVER . '/ext/modules/payment/paypal/rp_ipn.php',
                                'BUTTONSOURCE' => 'osCommerce22_v20180_DP');

                if ( ($HTTP_POST_VARS['cc_type'] == 'SWITCH') || ($HTTP_POST_VARS['cc_type'] == 'SOLO') ) {
                    $params['ISSUENUMBER'] = $HTTP_POST_VARS['cc_issue_nh-dns'];
                }

                if (is_numeric($sendto) && ($sendto > 0)) {
                    $params['SHIPTONAME'] = $order->delivery['firstname'] . ' ' . $order->delivery['lastname'];
                    $params['SHIPTOSTREET'] = $order->delivery['street_address'];
                    $params['SHIPTOCITY'] = $order->delivery['city'];
                    $params['SHIPTOSTATE'] = tep_get_zone_code($order->delivery['country']['id'], $order->delivery['zone_id'], $order->delivery['state']);
                    $params['SHIPTOCOUNTRYCODE'] = $order->delivery['country']['iso_code_2'];
                    $params['SHIPTOZIP'] = $order->delivery['postcode'];
                }
              // see if 3ds was used
              if($this->secure_enabled and $this->module_country == 'UK'){
                  if(isset($_SESSION['auth_xid']) and strlen($_SESSION['auth_xid'])>0){
                      $params['ECI3DS']         = $_SESSION['auth_eci'];
                      $params['CAVV']           = $_SESSION['auth_cavv'];
                      $params['XID']            = $_SESSION['auth_xid'];
                      $params['AUTHSTATUS3DS']  = $_SESSION['auth_status'];
                      $params['MPIVENDOR3DS']   = 'Cardinal';
                  }
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
                if (($response_array['ACK'] != 'Success') && ($response_array['ACK'] != 'SuccessWithWarning')) {
                    tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, 'error_message=' . stripslashes($response_array['L_LONGMESSAGE0']), 'SSL'));
                }

                // PP transaction ID
                $_SESSION['pp_transaction_id'] = $response_array['TRANSACTIONID'];
                // recurring next
                $no=0;
                foreach ($order->products as $key => $prodArr){
                    if(count($prodArr['rp'])>0){
                        $no++;
                    }
                }
                foreach ($order->products as $key => $prodArr){
                    if(count($prodArr['rp'])>0){
                    // rp params
                    if($this->rp_autobill == 'Yes'){
                        $autobill = 'AddToNextBilling';
                    }else{
                        $autobill = 'NoAutoBill';
                    }
                    // build the description
                    $desc = $prodArr['name'] . ' ';
                    if(strlen($prodArr['rp']['trialBillingPeriod'])>0){
                        $desc .= 'Trial at: ' . $currencies->display_price($prodArr['rp']['trialAmt'],$prodArr['tax_class_id']) . ' every ' . $prodArr['rp']['trialBillingPeriod'] . ' for ' . $prodArr['rp']['trialTotalBillingCycles'] . ' ' . $prodArr['rp']['trialBillingPeriod'] . 's ,and ';
                    }
                    $desc .= 'Recurring at: ' . $currencies->display_price($prodArr['rp']['amt'],$prodArr['tax_class_id']). ' every ' . $prodArr['rp']['billingPeriod'] . ' for ' . $prodArr['rp']['totalBillingCycles'] . ' ' . $prodArr['rp']['billingPeriod'] . 's';
                    $desc = substr($desc, 0, 127); // limit on length
                    if($prodArr['rp']['billingPeriod'] == 'semimonth'){
                        $prodArr['rp']['billingPeriod'] = 'semiMonth';
                    }
                    // do the profile start date
                    $profileStartDate = $this->getSubscriptionStartDate($prodArr['rp']);
                    //
                    $params = array('USER'                  => MODULE_PAYMENT_PAYPAL_DIRECT_API_USERNAME,
                                    'PWD'                   => MODULE_PAYMENT_PAYPAL_DIRECT_API_PASSWORD,
                                    'VERSION'               => $this->api_version,
                                    'SIGNATURE'             => MODULE_PAYMENT_PAYPAL_DIRECT_API_SIGNATURE,
                                    'METHOD'                => 'CreateRecurringPaymentsProfile',
                                    'IPADDRESS'             => tep_get_ip_address(),
                                    'AMT'                   => substr($prodArr['rp']['amt'], 0, strlen($prodArr['rp']['amt'])-2),
                                    'CREDITCARDTYPE'        => $HTTP_POST_VARS['cc_type'],
                                    'ACCT'                  => $HTTP_POST_VARS['cc_number_nh-dns'],
                                    'EXPDATE'               => $HTTP_POST_VARS['cc_expires_month'] . $HTTP_POST_VARS['cc_expires_year'],
                                    'CVV2'                  => $HTTP_POST_VARS['cc_cvc_nh-dns'],
                                    'FIRSTNAME'             => substr($HTTP_POST_VARS['cc_owner'], 0, strpos($HTTP_POST_VARS['cc_owner'], ' ')),
                                    'LASTNAME'              => substr($HTTP_POST_VARS['cc_owner'], strpos($HTTP_POST_VARS['cc_owner'], ' ')+1),
                                    'STREET'                => $order->billing['street_address'],
                                    'CITY'                  => $order->billing['city'],
                                    'STATE'                 => tep_get_zone_code($order->billing['country']['id'], $order->billing['zone_id'], $order->billing['state']),
                                    'COUNTRYCODE'           => $order->billing['country']['iso_code_2'],
                                    'ZIP'                   => $order->billing['postcode'],
                                    'EMAIL'                 => $order->customer['email_address'],
                                    'PHONENUM'              => $order->customer['telephone'],
                                    'CURRENCYCODE'          => $order->info['currency'],
                                    'PROFILESTARTDATE'      => $profileStartDate,
                                    'DESC'                  => $desc,
                                    'MAXFAILEDPAYMENTS'     => $this->rp_maxfailedpayments,
                                    'AUTOBILLAMT'           => $autobill,
                                    'BILLINGPERIOD'         => ucfirst($prodArr['rp']['billingPeriod']),
                                    'BILLINGFREQUENCY'      => $prodArr['rp']['billingFrequency'],
                                    'TOTALBILLINGCYCLES'    => $prodArr['rp']['totalBillingCycles'],
                                    'SHIPPINGAMT'           => ($order->info['shipping_cost']/$no),
                                    'TAXAMT'                => ($order->info['tax'] / $no),
                                    'NOTIFYURL'             => HTTP_SERVER . '/ext/modules/payment/paypal/rp_ipn.php',
                                    'BUTTONSOURCE'          => 'osCommerce22_v20180_DP',
                                    );
                    // switch / solo
                    if ( ($HTTP_POST_VARS['cc_type'] == 'SWITCH') || ($HTTP_POST_VARS['cc_type'] == 'SOLO') ) {
                        $params['ISSUENUMBER'] = $HTTP_POST_VARS['cc_issue_nh-dns'];
                    }
                    // shipping
                    if (is_numeric($sendto) && ($sendto > 0)) {
                        $params['SHIPTONAME'] = $order->delivery['firstname'] . ' ' . $order->delivery['lastname'];
                        $params['SHIPTOSTREET'] = $order->delivery['street_address'];
                        $params['SHIPTOCITY'] = $order->delivery['city'];
                        $params['SHIPTOSTATE'] = tep_get_zone_code($order->delivery['country']['id'], $order->delivery['zone_id'], $order->delivery['state']);
                        $params['SHIPTOCOUNTRYCODE'] = $order->delivery['country']['iso_code_2'];
                        $params['SHIPTOZIP'] = $order->delivery['postcode'];
                    }
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
                        $params['TRIALAMT']                 = substr($prodArr['rp']['trialAmt'],0,strlen($prodArr['rp']['trialAmt'])-2);
                        $params['TRIALTOTALBILLINGCYCLES']  = $prodArr['rp']['trialTotalBillingCycles'];
                        $params['TRIALTAXAMT']              = round(($order->info['tax'] / $no)*($prodArr['rp']['trialAmt']/$prodArr['rp']['amt']),2);
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
                    if (($response_array['ACK'] != 'Success') && ($response_array['ACK'] != 'SuccessWithWarning')) {
                        tep_redirect(tep_href_link(FILENAME_SHOPPING_CART, 'error_message=' . stripslashes($response_array['L_LONGMESSAGE0']), 'SSL'));
                    }
                    // get product ID from a product ID with attributes -- Elan Marikit
                    $this->rp_profile[tep_get_prid($prodArr['id'])] = $response_array['PROFILEID'];
                }
                }
            break;
        }
      } else {
        tep_redirect(tep_href_link(FILENAME_CHECKOUT_CONFIRMATION, 'error_message=' . MODULE_PAYMENT_PAYPAL_DIRECT_ERROR_ALL_FIELDS_REQUIRED, 'SSL'));
      }
      return $this->rp_profile;
    }

    function after_process() {
      // fmf remove
      tep_session_unregister('pp_fmf');
      tep_session_unregister('pp_transaction_id');
	  // remove 3dsecure
	  $this->remove3dSecureSession();
      return false;
    }

    function remove3dSecureSession(){
      // 3dsecure remove
      tep_session_unregister('cc_card_type');
      tep_session_unregister('cc_number');
      tep_session_unregister('cc_expiry_month');
      tep_session_unregister('cc_expiry_year');
      tep_session_unregister('enroll_lookup_attempted');
      tep_session_unregister('authentication_attempted');
      tep_session_unregister('transactionId');
      tep_session_unregister('enrolled');
      tep_session_unregister('acsURL');
      tep_session_unregister('payload');
      tep_session_unregister('auth_status');
      tep_session_unregister('sig_status');
      tep_session_unregister('auth_xid');
      tep_session_unregister('auth_cavv');
      tep_session_unregister('auth_eci');
    }

    function get_error() {
      return false;
    }

    function check() {
      if (!isset($this->_check)) {
        $check_query = tep_db_query("select configuration_value from " . TABLE_CONFIGURATION . " where configuration_key = 'MODULE_PAYMENT_PAYPAL_DIRECT_STATUS'");
        $this->_check = tep_db_num_rows($check_query);
      }
      return $this->_check;
    }

    function install() {
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable PayPal Direct', 'MODULE_PAYMENT_PAYPAL_DIRECT_STATUS', 'True', 'Do you want to accept PayPal Direct payments?', '6', '1', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      // set the country
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) values ('Country Module', 'MODULE_PAYMENT_PAYPAL_DIRECT_COUNTRY', 'US', 'Set the country for this module', '6', '2', 'tep_get_paypal_dp_country', 'tep_cfg_pull_down_paypal_dp_country(', now())");
      // rp items
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable PayPal Recurring Payments', 'MODULE_PAYMENT_PAYPAL_DIRECT_RP_STATUS', 'False', 'Do you want to use PayPal Recurring Payments?', '6', '0', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('PayPal Recurring Payments Autobill', 'MODULE_PAYMENT_PAYPAL_DIRECT_RP_AUTOBILLOUTAMT', 'No', 'With PayPal Recurring Payments would you like any outstanding amounts automatically attempted to be collected?', '6', '0', 'tep_cfg_select_option(array(\'Yes\', \'No\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Recurring Payments Maximum Failed Payments', 'MODULE_PAYMENT_PAYPAL_DIRECT_MAXFAILEDPAYMENTS', '0', 'Enter the max number of scheduled payments that can fail before the profile is automatically suspended.', '6', '0', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Fraud Management Filters Check', 'MODULE_PAYMENT_PAYPAL_DIRECT_FMF_STATUS', 'False', 'Are your Paypal Fraud Management Filters Enabled in your Paypal Merchant Admin?', '6', '0', 'tep_cfg_select_option(array(\'True\', \'False\'), ', now())");
      // -- end rp items
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('API Username', 'MODULE_PAYMENT_PAYPAL_DIRECT_API_USERNAME', '', 'The username to use for the PayPal API service.', '6', '0', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('API Password', 'MODULE_PAYMENT_PAYPAL_DIRECT_API_PASSWORD', '', 'The password to use for the PayPal API service.', '6', '0', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('API Signature', 'MODULE_PAYMENT_PAYPAL_DIRECT_API_SIGNATURE', '', 'The signature to use for the PayPal API service.', '6', '0', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Transaction Server', 'MODULE_PAYMENT_PAYPAL_DIRECT_TRANSACTION_SERVER', 'Sandbox', 'Use the live or testing (sandbox) gateway server to process transactions?', '6', '0', 'tep_cfg_select_option(array(\'Live\', \'Sandbox\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Transaction Method', 'MODULE_PAYMENT_PAYPAL_DIRECT_TRANSACTION_METHOD', 'Sale', 'The processing method to use for each transaction.', '6', '0', 'tep_cfg_select_option(array(\'Authorization\', \'Sale\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) values ('Payment Zone', 'MODULE_PAYMENT_PAYPAL_DIRECT_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', '6', '2', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(', now())");

      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Sort order of display.', 'MODULE_PAYMENT_PAYPAL_DIRECT_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, use_function, date_added) values ('Set Order Status', 'MODULE_PAYMENT_PAYPAL_DIRECT_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value.', '6', '0', 'tep_cfg_pull_down_order_statuses(', 'tep_get_order_status_name', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('cURL Program Location', 'MODULE_PAYMENT_PAYPAL_DIRECT_CURL', '/usr/bin/curl', 'The location to the cURL program application.', '6', '0' , now())");
      // log file location
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Log File Location', 'MODULE_PAYMENT_PAYPAL_DIRECT_LOGFILE', '/tmp/paypal_direct.log', 'The location for the log file, verify that there are write permission given to the file.', '6', '0', now())");
      // cardinal 3d secure
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Cardinal Centinel Module', 'MODULE_PAYMENT_PAYPAL_DIRECT_3D_STATUS', 'false', 'Do you want to enable 3d Secure Payer Authentication?', '6', '0', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Debug Logging to Error Log', 'MODULE_PAYMENT_PAYPAL_DIRECT_3D_DEBUGGING', 'true', 'Do you want to enable debug logging to the error log?', '6', '0', 'tep_cfg_select_option(array(\'true\', \'false\'), ', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Transaction URL', 'MODULE_PAYMENT_PAYPAL_DIRECT_3D_TXN_URL', 'https://centineltest.cardinalcommerce.com/maps/txns.asp', 'The transaction URL for the 3d Secure (Cardinal Centinel) service.', '6', '0', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Processor Id', 'MODULE_PAYMENT_PAYPAL_DIRECT_3D_PROCESSOR', '', 'The processor id for the 3d Secure (Cardinal Centinel) service.', '6', '0', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Merchant Id', 'MODULE_PAYMENT_PAYPAL_DIRECT_3D_MERCHANT', '', 'The merchant id for the 3d Secure (Cardinal Centinel) service.', '6', '0', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Transaction Password', 'MODULE_PAYMENT_PAYPAL_DIRECT_3D_PASSWORD', '', 'Password to secure and verify the transaction originated from merchant.', '6', '0', now())");
      tep_db_query("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Only Accept Chargeback Protected Orders', 'MODULE_PAYMENT_PAYPAL_DIRECT_3D_AUTHENTICATE_REQ', 'No', 'Only proceed with authorization when the authentication result provides chargeback protection?', '6', '0', 'tep_cfg_select_option(array(\'Yes\',\'No\'), ', now())");
      // base structure install
      $this->baseStructureInstall();
   }

    function remove() {
      tep_db_query("delete from " . TABLE_CONFIGURATION . " where configuration_key in ('" . implode("', '", $this->keys()) . "')");
    }

    function keys() {
      return array('MODULE_PAYMENT_PAYPAL_DIRECT_STATUS', 'MODULE_PAYMENT_PAYPAL_DIRECT_COUNTRY', 'MODULE_PAYMENT_PAYPAL_DIRECT_RP_STATUS', 'MODULE_PAYMENT_PAYPAL_DIRECT_RP_AUTOBILLOUTAMT','MODULE_PAYMENT_PAYPAL_DIRECT_MAXFAILEDPAYMENTS', 'MODULE_PAYMENT_PAYPAL_DIRECT_FMF_STATUS','MODULE_PAYMENT_PAYPAL_DIRECT_API_USERNAME', 'MODULE_PAYMENT_PAYPAL_DIRECT_API_PASSWORD', 'MODULE_PAYMENT_PAYPAL_DIRECT_API_SIGNATURE', 'MODULE_PAYMENT_PAYPAL_DIRECT_TRANSACTION_SERVER', 'MODULE_PAYMENT_PAYPAL_DIRECT_TRANSACTION_METHOD', 'MODULE_PAYMENT_PAYPAL_DIRECT_ZONE', 'MODULE_PAYMENT_PAYPAL_DIRECT_ORDER_STATUS_ID', 'MODULE_PAYMENT_PAYPAL_DIRECT_SORT_ORDER', 'MODULE_PAYMENT_PAYPAL_DIRECT_CURL', 'MODULE_PAYMENT_PAYPAL_DIRECT_LOGFILE',
      'MODULE_PAYMENT_PAYPAL_DIRECT_3D_STATUS', 'MODULE_PAYMENT_PAYPAL_DIRECT_3D_DEBUGGING', 'MODULE_PAYMENT_PAYPAL_DIRECT_3D_TXN_URL', 'MODULE_PAYMENT_PAYPAL_DIRECT_3D_PROCESSOR', 'MODULE_PAYMENT_PAYPAL_DIRECT_3D_MERCHANT', 'MODULE_PAYMENT_PAYPAL_DIRECT_3D_PASSWORD', 'MODULE_PAYMENT_PAYPAL_DIRECT_3D_AUTHENTICATE_REQ');
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
        exec(escapeshellarg(MODULE_PAYMENT_PAYPAL_DIRECT_CURL) . ' -d ' . escapeshellarg($parameters) . ' "' . $server['scheme'] . '://' . $server['host'] . $server['path'] . (isset($server['query']) ? '?' . $server['query'] : '') . '" -P ' . $server['port'] . ' -k', $result);
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
