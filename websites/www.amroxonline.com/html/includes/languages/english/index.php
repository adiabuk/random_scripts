<?php
/*
  $Id: index.php 1739 2007-12-20 00:52:16Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2007 osCommerce

  Released under the GNU General Public License
*/

#define('TEXT_MAIN', 'Amrox Online is dedicated to provied the best and most diverse choise of Linux VPS solutions.  We strongly believe that everybody\'s requirements are different and therefore package deals are not suitable and simply force customers to make sacrifices on certain aspects of their requirements.  <br>  All of our solutions allow you to custom build, choosing from various options.  Why buy features that you do not actually need, or be forced to comprise on key features when you can have a solution customised to you unique requirements.<br>  We offer a wide range of Linux distributions and versions.  So whether you\re an application tester wanting to try a product on a different platform, or a Linux enthuiast we are certain we have a product suited to your needs.  <br><br>We are constantly testing out new products to offer you, so if you do not immedietly see what you require please feel free to <a href=contact_us.php>contact us</a> and let us know your requirements. ');



define('TABLE_HEADING_NEW_PRODUCTS', 'New Products For %s');
define('TABLE_HEADING_UPCOMING_PRODUCTS', 'Upcoming Products');
define('TABLE_HEADING_DATE_EXPECTED', 'Date Expected');

if ( ($category_depth == 'products') || (isset($HTTP_GET_VARS['manufacturers_id'])) ) {
  define('HEADING_TITLE', '');
  define('TABLE_HEADING_IMAGE', '');
  define('TABLE_HEADING_MODEL', 'Model');
  define('TABLE_HEADING_PRODUCTS', 'Product Name');
  define('TABLE_HEADING_MANUFACTURER', 'Manufacturer');
  define('TABLE_HEADING_QUANTITY', 'Quantity');
  define('TABLE_HEADING_PRICE', 'Price');
  define('TABLE_HEADING_WEIGHT', 'Weight');
  define('TABLE_HEADING_BUY_NOW', 'Buy Now');
  define('TEXT_NO_PRODUCTS', 'Please select from one of the sub categories below:');
  define('TEXT_NO_PRODUCTS2', 'There is no product available from this manufacturer.');
  define('TEXT_NUMBER_OF_PRODUCTS', 'Number of Products: ');
  define('TEXT_SHOW', '<b>Show:</b>');
  define('TEXT_BUY', 'Buy 1 \'');
  define('TEXT_NOW', '\' now');
  define('TEXT_ALL_CATEGORIES', 'All Categories');
  define('TEXT_ALL_MANUFACTURERS', 'All Manufacturers');
} elseif ($category_depth == 'top') {
  define('HEADING_TITLE', STORE_NAME);
} elseif ($category_depth == 'nested') {
  define('HEADING_TITLE', '');
}
?>
