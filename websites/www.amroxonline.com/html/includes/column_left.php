<?php
/*
  $Id: column_left.php 1739 2007-12-20 00:52:16Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http:www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/
echo tep_draw_column_top();
/*  -------------------------------------------------------  */
    require(DIR_WS_BOXES . 'search.php');  
/*  -------------------------------------------------------  */  
  if ((USE_CACHE == 'true') && empty($SID)) {
    echo tep_cache_manufacturers_box();
  } else {
  include(DIR_WS_BOXES . 'manufacturers.php');
  }
echo tep_draw_column_bottom();
echo '<tr><td>'.tep_draw_separator('spacer.gif', '1', '1').'</td></tr>';
/*  -------------------------------------------------------  */
  if ((USE_CACHE == 'true') && empty($SID)) {
    echo tep_cache_categories_box();
  } else {
    include(DIR_WS_BOXES . 'categories.php');
	}
/*  -------------------------------------------------------  */
   require(DIR_WS_BOXES . 'information.php'); 		 		       
/*  -------------------------------------------------------  */
/*  -------------------------------------------------------  */
  if (isset($HTTP_GET_VARS['products_id'])) {
    if (tep_session_is_registered('customer_id')) {
      $check_query = tep_db_query("select count(*) as count from " . TABLE_CUSTOMERS_INFO . " where customers_info_id = '" . (int)$customer_id . "' and global_product_notifications = '1'");
      $check = tep_db_fetch_array($check_query);
      if ($check['count'] > 0) {
     include(DIR_WS_BOXES . 'best_sellers.php');
      } else {
       include(DIR_WS_BOXES . 'product_notifications.php');
      }
    } else {
  include(DIR_WS_BOXES . 'product_notifications.php');
    }
  } else {
   include(DIR_WS_BOXES . 'best_sellers.php');
  }
  /**
   * START
   * PayPal Logo
   *
   * This will put the paypal logo in the left column
   */
  require(DIR_WS_BOXES . 'paypalLogo.php');
  /**
   * END
   * PayPal Logo
   */


/*  -------------------------------------------------------  */


  //  require(DIR_WS_BOXES . 'shopping_cart.php');   
/*  -------------------------------------------------------  */ 
  //  if (isset($HTTP_GET_VARS['products_id'])) include(DIR_WS_BOXES . 'manufacturer_info.php');
/*  -------------------------------------------------------  */  
  //  if (tep_session_is_registered('customer_id')) include(DIR_WS_BOXES . 'order_history.php');  
/*  -------------------------------------------------------  */
  #if (substr(basename($PHP_SELF), 0, 8) != 'checkout') {
  # //  include(DIR_WS_BOXES . 'languages.php');
  # //   include(DIR_WS_BOXES . 'currencies.php');
  #}
/*  -------------------------------------------------------  */
  //  require(DIR_WS_BOXES . 'whats_new.php');      
/*  -------------------------------------------------------  */
?>