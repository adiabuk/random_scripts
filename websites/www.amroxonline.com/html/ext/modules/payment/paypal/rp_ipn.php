<?php
chdir('../../../../');
require('includes/application_top.php');
/**
 * rp_ipn.php
 *
 * IPN txn_types reconized by this class:
 *  express_checkout: Payment received for a single item; source is Express Checkout
 *  merch_pmt: Monthly subscription paid for Website Payments Pro
 *  recurring_payment: Recurring payment received
 *  recurring_payment_profile_created:  Recurring payment profile created
 *
 * @package    ext/modules/payment/paypal/rp_ipn.php
 * @author     Rock Mutchler <rock@drivedev.com>
 * @copyright  2009
 * @version    $Id;
 */
$rp_ipn = new rp_ipn();
$method_call = $rp_ipn->txn_type;
$rp_ipn->$method_call();

class rp_ipn
{
    var $logLocation = '/tmp/rp_ipn.log';
    /**
     * type of IPN message recieved
     *
     * @var str
     */
    var $txn_type;
    /**
     * type of IPN messages this class can handle
     *
     * @var array
     */
    var $accepted_txn_type_arr = array(
            // 'express_checkout',                  // not implimented at this time
            // 'merch_pmt',                         // not implimented at this time
            'recurring_payment',
            // 'recurring_payment_profile_created'  // not implimented at this time
    );
    /**
     * constructor
     *
     */
    function rp_ipn(){
        // set the incomming TXN type
        if(isset($_POST['txn_type'])){
            $this->txn_type = $_POST['txn_type'];
        }else{
            $this->txn_type = 'unknown';
        }
        if(!in_array($this->txn_type, $this->accepted_txn_type_arr)){
            $this->txn_type = 'unknown';
        }
    }
    /**
     * not currently implimented
     *
     */
    function express_checkout(){
        return ;
    }
    /**
     * not currently implimented
     *
     */
    function merch_pmt(){
        return ;
    }

    function recurring_payment(){
        // log it
        $fp = fopen($this->logLocation, 'a+');
        fwrite($fp, $this->txn_type);
        foreach ($_POST as $key => $value){
            fwrite($fp, "\t".$key."::".$value);
        }
        fwrite($fp, "\n");
        fclose($fp);
        // create another order
        // get the product_orders by rp_profile_id
        $rs = tep_db_query('SELECT * FROM ' . TABLE_ORDERS_PRODUCTS . ' WHERE rp_profile_id = \'' . $_POST['recurring_payment_id'] .'\'');
        $numR = tep_db_num_rows($rs);
        if($numR < 1){
            // nada
            exit();
        }
        $rowOrdersProducts = tep_db_fetch_array($rs);
        // get the orders
        $rs = tep_db_query('SELECT * FROM ' . TABLE_ORDERS . ' WHERE orders_id = ' . $rowOrdersProducts['orders_id']);
        $numR = tep_db_num_rows($rs);
        if($numR < 1){
            // can not locate order
            exit();
        }
        $rowOrders = tep_db_fetch_array($rs);
        // load the payment module
        require(DIR_WS_CLASSES . 'payment.php');
        $payment_modules = new payment($rowOrders['payment_module']);
        // verify this - verify_sign
        $api_sig = 'none';
        switch ($rowOrders['payment_module']){
            case 'paypal_direct':
                $api_sig = MODULE_PAYMENT_PAYPAL_DIRECT_API_SIGNATURE;
            break;
            case 'paypal_express':
                $api_sig = MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE;
            break;
        }
        if($api_sig != $_POST['verify_sign']){
            // no sig match
            exit();
        }
        // copy / create
        $oldOrderId = $rowOrders['orders_id'];
        unset($rowOrders['orders_id']);
        $rowOrders['date_purchased']    = date('Y-m-d H:i:s');
        $rowOrders['orders_status']     = 1;
        tep_db_perform(TABLE_ORDERS, $rowOrders);
        $rowOrdersProducts['orders_id'] = tep_db_insert_id();
        unset($rowOrdersProducts['orders_products_id']);
        tep_db_perform(TABLE_ORDERS_PRODUCTS, $rowOrdersProducts);
        // order total
        $rs = tep_db_query('SELECT * FROM ' . TABLE_ORDERS_TOTAL . ' WHERE orders_id = ' . $oldOrderId);
        while ($rowOrdersTotal = tep_db_fetch_array($rs)){
            $rowOrdersTotal['orders_id'] = $rowOrdersProducts['orders_id'];
            unset($rowOrdersTotal['orders_total_id']);
            tep_db_perform(TABLE_ORDERS_TOTAL, $rowOrdersTotal);
        }
        // stock query - only if new order made success
        $stock_query = tep_db_query("select products_quantity from " . TABLE_PRODUCTS . " where products_id = '" . $rowOrdersProducts['products_id'] . "'");
        if (tep_db_num_rows($stock_query) > 0) {
            $stock_values = tep_db_fetch_array($stock_query);
        }
        $stock_left = $stock_values['products_quantity'] - $rowOrdersProducts['products_quantity'];
        // update it
        if (($stock_left < 1)) {
            tep_db_query("update " . TABLE_PRODUCTS . " set products_status = '0' where products_id = '" . $rowOrdersProducts['products_id'] . "'");
        }else{
            tep_db_query("update " . TABLE_PRODUCTS . " set products_quantity = '" . $stock_left . "' where products_id = '" . $rowOrdersProducts['products_id'] . "'");
        }
    }
    /**
     * vars
     * recurring_payment_id
     *
     * not yet implimented as of this version a profile has to be
     * associated with an order in the system, a profile can not be
     * created then later associated with a new order
     *
     */
    function recurring_payment_profile_created(){
        return ;
    }

    function unknown(){
        // log it
        $fp = fopen($this->logLocation, 'a+');
        fwrite($fp, $this->txn_type);
        foreach ($_POST as $key => $value){
            fwrite($fp, "\t".$key."::".$value);
        }
        fwrite($fp, "\n");
        fclose($fp);
    }
}
