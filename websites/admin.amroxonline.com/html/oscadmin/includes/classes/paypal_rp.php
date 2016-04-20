<?php
/**
 * paypal_rp.php
 *
 * This class does admin recurring profile data manipulation for the paypal
 * nvp api
 *
 *
 * @package    admin/includes/classes/paypal_rp.php
 * @author     Rock Mutchler <rock@drivedev.com>
 * @copyright  2009
 * @version    $Id:
 */
class paypal_rp
{
    /**
     * holds current rp id in question
     *
     * @var str
     */
    var $rp_id;
    /**
     * array that holds the get data
     *
     * @var array
     */
    var $rp_arr;
    /**
     * set if rp data ran and data was found.
     *
     * @var boolean
     */
    var $getRpDataRan = false;
    /**
     * Holds the apiUrl, not set until getRpData is called
     *
     * @var str
     */
    var $apiUrl;
    /**
     * Holds the payment module name, not set until getRpData
     * is called
     *
     * @var str
     */
    var $paymentModule;
    /**
     * holds tranlations of paypal keys to human text
     *
     * @var array
     */
    var $keyFieldTranslateArr = array(
        'english'    =>  array(
            'PROFILEID'                     =>  'Profile Id',
            'STATUS'                        =>  'Status',
            'AUTOBILLOUTAMT'                =>  'Auto Bill Out Amount',
            'DESC'                          =>  'Description',
            'MAXFAILEDPAYMENTS'             =>  'Max Failed Payments',
            'SUBSCRIBERNAME'                =>  'Subscriber Name',
            'PROFILESTARTDATE'              =>  'Profile Start Date',
            'NEXTBILLINGDATE'               =>  'Next Billing Date',
            'NUMCYCLESCOMPLETED'            =>  'Number of Cycles Completed',
            'NUMCYCLESREMAINING'            =>  'Number of Cycles Remaining',
            'OUTSTANDINGBALANCE'            =>  'Outstanding Balance',
            'FAILEDPAYMENTCOUNT'            =>  'Failed Payment Count',
            'LASTPAYMENTDATE'               =>  'Last Payment Date',
            'LASTPAYMENTAMT'                =>  'Last Payment Amount',
            'TRIALAMTPAID'                  =>  'Trial Amount Paid',
            'REGULARAMTPAID'                =>  'Regular Amount Paid',
            'AGGREGATEAMT'                  =>  'Aggergated Amount',
            'AGGREGATEOPTIONALAMT'          =>  'Aggergated Optional Amount',
            'FINALPAYMENTDUEDATE'           =>  'Finial Payment Due Date',
            'TIMESTAMP'                     =>  'Time Stamp',
            'CORRELATIONID'                 =>  'Correlation Id',
            'ACK'                           =>  'Response',
            'VERSION'                       =>  'API Version',
            'BUILD'                         =>  'Build',
            'SHIPTOSTREET'                  =>  'Ship To Street',
            'SHIPTOSTREET2'                 =>  'Ship To Street 2',
            'SHIPTOCITY'                    =>  'Ship To City',
            'SHIPTOSTATE'                   =>  'Ship To State',
            'SHIPTOZIP'                     =>  'Ship To Zip',
            'SHIPTOCOUNTRYCODE'             =>  'Ship To Country Code (2 charater ISO)',
            'SHIPTOCOUNTRY'                 =>  'Ship To Code (2 charater ISO)',
            'SHIPTOCOUNTRYNAME'             =>  'Ship To Country Name',
            'SHIPADDRESSOWNER'              =>  'Ship To Address Owner',
            'SHIPADDRESSSTATUS'             =>  'Ship To Address Status',
            'BILLINGPERIOD'                 =>  'Billing Period',
            'BILLINGFREQUENCY'              =>  'Billing Frequency',
            'TOTALBILLINGCYCLES'            =>  'Total Billing Cycles',
            'CURRENCYCODE'                  =>  'Currency Code',
            'AMT'                           =>  'Amount',
            'SHIPPINGAMT'                   =>  'Shipping Amount',
            'TAXAMT'                        =>  'Tax Amount',
            'REGULARBILLINGPERIOD'          =>  'Regular Billing Period',
            'REGULARBILLINGFREQUENCY'       =>  'Regular Billing Frequency',
            'REGULARTOTALBILLINGCYCLES'     =>  'Regular Total Billing Cycles',
            'REGULARCURRENCYCODE'           =>  'Regular Currency Code',
            'REGULARAMT'                    =>  'Regualr Amount',
            'REGULARSHIPPINGAMT'            =>  'Regular Shipping Amount',
            'REGULARTAXAMT'                 =>  'Regular Tax Amount',
            'ACCT'                          =>  'Account Number',
            'CREDITCARDTYPE'                =>  'Credit Card Type',
            'EXPDATE'                       =>  'Expiration Date Format: MMYYYY',
            'STARTDATE'                     =>  'Start Date',
            'EMAIL'                         =>  'Email',
            'FIRSTNAME'                     =>  'First Name',
            'LASTNAME'                      =>  'Last Name',
            'STREET'                        =>  'Street',
            'STREET2'                       =>  'Street 2',
            'CITY'                          =>  'City',
            'STATE'                         =>  'State',
            'ZIP'                           =>  'Zip',
            'COUNTRYCODE'                   =>  'Country Code (2 charater ISO)',
            'COUNTRY'                       =>  'Country',
            'ADDRESSOWNER'                  =>  'Address Owner',
            'ADDRESSSTATUS'                 =>  'Address Status',
            'PAYERSTATUS'                   =>  'Payer Status',
            'TRIALBILLINGPERIOD'            =>  'Trial Billing Period',
            'TRIALBILLINGFREQUENCY'         =>  'Trial Billing Frequency',
            'TRIALTOTALBILLINGCYCLES'       =>  'Trail Total Billing Cycles',
            'TRIALCURRENCYCODE'             =>  'Trial Currency Code',
            'TRIALAMT'                      =>  'Trial Amount',
            'TRIALSHIPPINGAMT'              =>  'Trial Shipping Amount',
            'TRIALTAXAMT'                   =>  'Trial Tax Amount'
        ),
    );
    /**
     * init
     *
     * @param str $rp_id
     * @return rp
     */
    function paypal_rp($rp_id){
        $this->rp_id = $rp_id;
        $this->getRpDataRan = false;
    }
    /**
     * gets the data associated with rp profile
     *
     * @param str $rp_id
     * @return array | boolean
     * @todo direct / express decision
     * @todo live / sandbox decision
     */
    function getRpData($rp_id=false){
        if($rp_id){
            $this->rp_id = $rp_id;
        }
        $sql = 'SELECT a.payment_module FROM ' . TABLE_ORDERS . ' a, ' . TABLE_ORDERS_PRODUCTS . ' b WHERE a.orders_id = b.orders_id AND b.rp_profile_id = \'' . $this->rp_id .'\' order by a.orders_id asc limit 1';
        $rs = tep_db_query($sql);
        if(!$row = tep_db_fetch_array($rs)){
            return false;
        }
        $this->paymentModule = $row['payment_module'];
        // todo need to find which auth to use for this rp_id
        require_once(DIR_WS_MODULES . 'payment/paypal/paypal_base.php');
        #require_once('../' . DIR_WS_MODULES . 'payment/paypal/paypal_base.php');
        $paypal_base = new paypal_base();
        // payment type
        switch ($this->paymentModule){
            case 'paypal_express':
                // live or sandbox guess
                $sql = 'select configuration_value from configuration where configuration_key = \'MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER\'';
                $rs = tep_db_query($sql);
                if(!$row = tep_db_fetch_array($rs)){
                    $api = 'Live';
                }else{
                    $api = $row['configuration_value'];
                }
                $params = array('USER'                  => MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME,
                                'PWD'                   => MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD,
                                'VERSION'               => $paypal_base->api_version,
                                'SIGNATURE'             => MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE,
                                'METHOD'                => 'GetRecurringPaymentsProfileDetails',
                                'PROFILEID'             => $this->rp_id);
            break;
            default: // dp
                // live or sandbox guess
                $sql = 'select configuration_value from configuration where configuration_key = \'MODULE_PAYMENT_PAYPAL_DIRECT_TRANSACTION_SERVER\'';
                $rs = tep_db_query($sql);
                if(!$row = tep_db_fetch_array($rs)){
                    $api = 'Live';
                }else{
                    $api = $row['configuration_value'];
                }
                $params = array('USER'                  => MODULE_PAYMENT_PAYPAL_DIRECT_API_USERNAME,
                                'PWD'                   => MODULE_PAYMENT_PAYPAL_DIRECT_API_PASSWORD,
                                'VERSION'               => $paypal_base->api_version,
                                'SIGNATURE'             => MODULE_PAYMENT_PAYPAL_DIRECT_API_SIGNATURE,
                                'METHOD'                => 'GetRecurringPaymentsProfileDetails',
                                'PROFILEID'             => $this->rp_id);
            break;

        }
        // get the sandbox / live url
        switch ($api){
            case 'Sandbox':
                $this->apiUrl = $paypal_base->nvp_api_url_sandbox;
            break;
            default:
                $this->apiUrl = $paypal_base->nvp_api_url;
            break;

        }
        foreach ($params as $key => $value) {
            $post_string .= $key . '=' . urlencode(trim($value)) . '&';
        }
        $post_string = substr($post_string, 0, -1);
        $response = $this->sendTransactionToGateway($this->apiUrl, $post_string);
        $response_array = array();
        parse_str($response, $response_array);
        if (($response_array['ACK'] == 'Success') or ($response_array['ACK'] == 'SuccessWithWarning')) {
            $this->getRpDataRan = true;
            return $response_array;
        }
        // fail
        return false;
    }
    /**
     * Manage the Recurring Payments Profile Statuses
     *
     * The actions maybe one of the following
     *   Cancel - Only profiles in Active or Suspended state can be canceled.
     *   Suspend - Only profiles in Active state can be suspended.
     *   Reactivate - Only profiles in a suspended state can be reactivated.
     *
     * Note (optinoal) desc
     *   For profiles created using Express Checkout, this message will be
     * included in the email notification to the buyer when the status of the
     * profile is successfully changed, and can also be seen by both you and
     * the buyer on the Status History page of the PayPal account
     *
     * @param str $rp_id
     * @param enum(Cancel, Suspend, Reactivate) $action
     * @param str $note
     * @return boolean | array
     */
    function manageRecurringPaymentsProfileStatus($rp_id, $action, $note=false){
        // check that the $rp_id has some data
        $this->rp_arr = $this->getRpData($rp_id);
        if(!$this->rp_arr){
            // the profile was not found
            return false;
        }
        // check the action
        $allowedArr = array('Cancel', 'Suspend', 'Reactivate');
        if(!in_array($action, $allowedArr)){
            // not a known action
            return false;
        }

        // check that the status is not already the same
        switch ($this->rp_arr['STATUS']){
            case 'ActiveProfile':
                if($action == 'Reactivate'){
                    // profile is already active
                    return true;
                }
            break;
            case 'CancelledProfile':
                if($action == 'Cancel'){
                    // profile is already canceld
                    return true;
                }
            break;
            case 'SuspendedProfile':
                if($action == 'Suspend'){
                    // profile is already suspended
                    return true;
                }
            break;
        }
        // base version info
        require_once('../' . DIR_WS_MODULES . 'payment/paypal/paypal_base.php');
        $paypal_base = new paypal_base();
        // set the params
        switch ($this->paymentModule){
            case 'paypal_express':
                $params = array('USER'                  => MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME,
                                'PWD'                   => MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD,
                                'VERSION'               => $paypal_base->api_version,
                                'SIGNATURE'             => MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE,
                                'METHOD'                => 'ManageRecurringPaymentsProfileStatus',
                                'PROFILEID'             => $this->rp_id);
            break;
            default:
                $params = array('USER'                  => MODULE_PAYMENT_PAYPAL_DIRECT_API_USERNAME,
                                'PWD'                   => MODULE_PAYMENT_PAYPAL_DIRECT_API_PASSWORD,
                                'VERSION'               => $paypal_base->api_version,
                                'SIGNATURE'             => MODULE_PAYMENT_PAYPAL_DIRECT_API_SIGNATURE,
                                'METHOD'                => 'ManageRecurringPaymentsProfileStatus',
                                'PROFILEID'             => $this->rp_id);
            break;
        }
        // set the action
        $params['ACTION'] = $action;
        // set the note if there is one
        if($note){
            $params['NOTE'] = $note;
        }
        foreach ($params as $key => $value) {
            $post_string .= $key . '=' . urlencode(trim($value)) . '&';
        }
        $post_string = substr($post_string, 0, -1);
        $response = $this->sendTransactionToGateway($this->apiUrl, $post_string);
        $response_array = array();
        parse_str($response, $response_array);
        if (($response_array['ACK'] == 'Success') or ($response_array['ACK'] == 'SuccessWithWarning')) {
            // change in return array - so have to repull to get data
            $this->getRpDataRan = false;
            // changed
            return true;
        }
        // fail
        return $response_array;
    }
    /**
     * This method is to update values in the Recurring Paymetns Profile
     * by the rp profile id
     *
     * @param str $rp_id
     * @param array $updateArr
     * @param str $note
     * @return array (error array) | boolean (success)
     */
    function updateRecurringPaymentsProfile($rp_id, $updateArr, $note=false){
        // check that the $rp_id has some data
        if(!$this->checkRpRun() or $rp_id != $this->rp_id){
            $this->rp_arr = $this->getRpData($rp_id);
        }
        if(!$this->rp_arr){
            // the profile was not found
            return array('the profile was not found');
        }
        $updateFieldArr = array(
            'DESC',
            'SUBSCRIBERNAME',
            'PROFILEREFERENCE',
            'ADDITIONALBILLINGCYCLES',
            'AMT',
            'SHIPPINGAMT',
            'TAXAMT',
            'OUTSTANDINGAMT',
            'AUTOBILLOUTAMT',
            'MAXFAILEDPAYMENTS',
            'SHIPTONAME',
            'SHIPTOSTREET',
            'SHIPTOSTREET2',
            'SHIPTOCITY',
            'SHIPTOSTATE',
            'SHIPTOZIP',
            'SHIPTOCOUNTRYCODE',
            'SHIPTOPHONENUM',
            'CREDITCARDTYPE',
            'ACCT',
            'EXPDATE',
            'CVV2',
            'STARTDATE',
            'ISSUENUMBER',
            'FIRSTNAME',
            'LASTNAME',
            'STREET',
            'STREET2',
            'CITY',
            'STATE',
            'COUNTRYCODE',
            'ZIP',
            'PHONENUM'
        );
        // base version info
        require_once('../' . DIR_WS_MODULES . 'payment/paypal/paypal_base.php');
        $paypal_base = new paypal_base();
        // set the params
        switch ($this->paymentModule){
            case 'paypal_express':
                $params = array('USER'                  => MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME,
                                'PWD'                   => MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD,
                                'VERSION'               => $paypal_base->api_version,
                                'SIGNATURE'             => MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE,
                                'METHOD'                => 'UpdateRecurringPaymentsProfile',
                                'PROFILEID'             => $this->rp_id);
            break;
            default:
                $params = array('USER'                  => MODULE_PAYMENT_PAYPAL_DIRECT_API_USERNAME,
                                'PWD'                   => MODULE_PAYMENT_PAYPAL_DIRECT_API_PASSWORD,
                                'VERSION'               => $paypal_base->api_version,
                                'SIGNATURE'             => MODULE_PAYMENT_PAYPAL_DIRECT_API_SIGNATURE,
                                'METHOD'                => 'UpdateRecurringPaymentsProfile',
                                'PROFILEID'             => $this->rp_id);
            break;
        }
        $ccKeyArr = array(
            'CREDITCARDTYPE',
            'ACCT',
            'EXPDATE',
            'CVV2',
        );
        // check the CC data
        $ccFound = false;
        foreach ($updateArr as $key => $value){
            if(in_array($key, $ccKeyArr)){
                $ccFound = true;
            }
        }
        $ccDiff = false;
        if($ccFound){
            foreach ($ccKeyArr as $ccKey){
                if(!array_key_exists($ccKey, $this->rp_arr)){

                    continue;
                }elseif ($updateArr[$ccKey] != $this->rp_arr[$ccKey]){
                    $ccDiff = true;
                }
            }
        }
        if($ccFound and !$ccDiff){
            foreach ($ccKeyArr as $ccKey){
                unset($updateArr[$ccKey]);
            }
        }
        // add the params to update
        foreach ($updateArr as $key => $value){
            if(!in_array($key, $updateFieldArr)){
                continue;
            }
            $params[$key] = $value;
        }
        if($note){
            $params['NOTE'] = $note;
        }
        foreach ($params as $key => $value) {
            $post_string .= $key . '=' . urlencode(trim($value)) . '&';
        }
        $post_string = substr($post_string, 0, -1);
        $response = $this->sendTransactionToGateway($this->apiUrl, $post_string);
        $response_array = array();
        parse_str($response, $response_array);
        if (($response_array['ACK'] == 'Success') or ($response_array['ACK'] == 'SuccessWithWarning')) {
            // change in return array - so have to repull to get data
            $this->getRpDataRan = false;
            // updated
            return true;
        }
        // fail
        return $response_array;
    }

    function billOutstandingAmount($rp_id, $amount=false, $note=false){
        // repull / pull the data
        $this->rp_arr = $this->getRpData($rp_id);
        if(!$this->rp_arr){
            // the profile was not found
            return array('the profile was not found');
        }
        // base version info
        require_once('../' . DIR_WS_MODULES . 'payment/paypal/paypal_base.php');
        $paypal_base = new paypal_base();
        // set the params
        switch ($this->paymentModule){
            case 'paypal_express':
                $params = array('USER'                  => MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME,
                                'PWD'                   => MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD,
                                'VERSION'               => $paypal_base->api_version,
                                'SIGNATURE'             => MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE,
                                'METHOD'                => 'BillOutstandingAmount',
                                'PROFILEID'             => $this->rp_id);
            break;
            default:
                $params = array('USER'                  => MODULE_PAYMENT_PAYPAL_DIRECT_API_USERNAME,
                                'PWD'                   => MODULE_PAYMENT_PAYPAL_DIRECT_API_PASSWORD,
                                'VERSION'               => $paypal_base->api_version,
                                'SIGNATURE'             => MODULE_PAYMENT_PAYPAL_DIRECT_API_SIGNATURE,
                                'METHOD'                => 'BillOutstandingAmount',
                                'PROFILEID'             => $this->rp_id);
            break;
        }
        // check for an amount
        if($amount){
            $params['AMT'] = $amount;
        }
        if($note){
            $params['NOTE'] = $note;
        }
        foreach ($params as $key => $value) {
            $post_string .= $key . '=' . urlencode(trim($value)) . '&';
        }
        $post_string = substr($post_string, 0, -1);
        $response = $this->sendTransactionToGateway($this->apiUrl, $post_string);
        $response_array = array();
        parse_str($response, $response_array);
        if (($response_array['ACK'] == 'Success') or ($response_array['ACK'] == 'SuccessWithWarning')) {
            // change in return array - so have to repull to get data
            $this->getRpDataRan = false;
            // updated
            return true;
        }
        // fail
        return $response_array;
    }

    function checkRpRun(){
        if($this->getRpDataRan){
            return true;
        }
        return false;
    }
    /**
     * return a translated field from paypal, if possiable
     *
     * @param str $field
     * @param str $lang
     * @return str
     */
    function fieldTranslate($field, $lang='english'){
        if(array_key_exists($field, $this->keyFieldTranslateArr[$lang])){
            return $this->keyFieldTranslateArr[$lang][$field];
        }
        return $field;
    }

    /**
     * post the data to the gateway
     *
     * @param str $url
     * @param str $parameters
     * @return str
     */
    function sendTransactionToGateway($url, $parameters) {
        $server = parse_url($url);
        // set the port
        if (!isset($server['port'])) {
            $server['port'] = ($server['scheme'] == 'https') ? 443 : 80;
        }
        // path
        if (!isset($server['path'])) {
            $server['path'] = '/';
        }
        // auth
        if (isset($server['user']) && isset($server['pass'])) {
            $header[] = 'Authorization: Basic ' . base64_encode($server['user'] . ':' . $server['pass']);
        }
        // curl
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
        // return the result
        return $result;
    }
}
