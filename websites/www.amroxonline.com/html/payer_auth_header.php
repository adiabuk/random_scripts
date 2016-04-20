<?php
  /*
  payer_auth_header.php
  Version 1.4 11/21/2005

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2004 osCommerce

  Released under the GNU General Public License

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  Contributed by CardinalCommerce
  http://www.cardinalcommerce.com

  Purpose
    The top portion of a frame display so the the customer can complete payer
    authentication but still have the experience that they have not left the
    online store.

    This page will also display a message to the customer that their order is
    being processed. This is recommended in case the authentication form does
    not display immediately.

  */


  require('includes/application_top.php');

?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE; ?></title>
<base target="_top" href="<?php echo (($request_type == 'SSL') ? HTTPS_SERVER : HTTP_SERVER) . DIR_WS_CATALOG; ?>">
<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>
<body marginwidth="0" marginheight="0" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">

<?php require(DIR_WS_INCLUDES . 'header.php'); ?>

<div class="boxText"><font color="red">
<b>Processing your order, please wait...
<br/><br/>
For your security, your bank's authentication screen will appear below. Enter your information and click "Submit" to complete the purchase.</b>
</font></div><br>

</body>
</html>
