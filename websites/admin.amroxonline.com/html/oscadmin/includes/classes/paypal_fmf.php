<?php
/**
 * paypal_fmf.php
 *
 * Paypal FMF admin interactions
 *
 * @package    admin/includes/classes/paypal_fmf.php
 * @author     Rock Mutchler <rock@drivedev.com>
 * @copyright  2009
 * @version    $Id:
 */
class paypal_fmf
{
    var $trans_id;

    var $payment_module;

    var $allowed_action_arr = array('accept', 'deny');

    function paypal_fmf($order_id){
        $rs = tep_db_query('SELECT payment_module, paypal_transaction_id FROM ' . TABLE_ORDERS . ' WHERE orders_id = ' . $order_id);
        if($row = tep_db_fetch_array($rs)){
            $this->payment_module = $row['payment_module'];
            $this->trans_id = $row['paypal_transaction_id'];
        }
    }

    function set_status($action){
        // some basic error checking
        if(!in_array($action, $this->allowed_action_arr)){
            return false;
        }
        if(strlen($this->trans_id)<1){
            return false;
        }
        // get the nvp api urls, and default settings
        require_once('../' . DIR_WS_MODULES . 'payment/paypal/paypal_base.php');
        $paypal_base = new paypal_base();
        // check module
        switch ($this->payment_module){
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
                                'METHOD'                => 'ManagePendingTransactionStatus',
                                'TRANSACTIONID'         => $this->trans_id,
                                'ACTION'                => ucfirst($action));

            break;
            default: // paypal_direct
                // live or sandbox guess
                $sql = 'select configuration_value from configuration where configuration_key = \'MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER\'';
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
                                'METHOD'                => 'ManagePendingTransactionStatus',
                                'TRANSACTIONID'         => $this->trans_id,
                                'ACTION'                => ucfirst($action));
            break;
        }
        // get the sandbox / live url
        switch ($api){
            case 'Sandbox':
                $api_url = $paypal_base->nvp_api_url_sandbox;
            break;
            default:
                $api_url = $paypal_base->nvp_api_url;
            break;

        }
        foreach ($params as $key => $value) {
            $post_string .= $key . '=' . urlencode(trim($value)) . '&';
        }
        $post_string = substr($post_string, 0, -1);
        $response = $this->sendTransactionToGateway($api_url, $post_string);
        $response_array = array();
        parse_str($response, $response_array);
        if (($response_array['ACK'] == 'Success') or ($response_array['ACK'] == 'SuccessWithWarning')) {
            return $response_array;
        }
        // fail
        return false;
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