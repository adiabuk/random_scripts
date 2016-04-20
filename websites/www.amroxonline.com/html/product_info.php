<?php
/*
  $Id: product_info.php 1739 2007-12-20 00:52:16Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_PRODUCT_INFO);


$meta_query = tep_db_query("select p.products_id, p.products_tax_class_id, p.products_model, p.products_price, pd.products_name, pd.products_id,
pd.products_description from " . TABLE_PRODUCTS . " p, " .
TABLE_PRODUCTS_DESCRIPTION . " pd where p.products_id = '" . (int)$HTTP_GET_VARS['products_id'] . "' and pd.products_id = p.products_id and
pd.language_id ='" . (int)$languages_id . "'");


$meta_check = tep_db_fetch_array($meta_query);
$meta_normal_price = $meta_check['products_price'];

$meta_special_price = tep_get_products_special_price($meta_check['products_id']);

if (tep_not_null($meta_special_price)) {
$meta_price = $currencies->display_price($meta_special_price, tep_get_tax_rate($meta_check['products_tax_class_id']));
} else {
$meta_price = $currencies->display_price($meta_normal_price, tep_get_tax_rate($meta_check['products_tax_class_id']));
}


$meta_n = $meta_check['products_name'];
$meta_name = strip_tags($meta_n);
$meta_desc = $meta_check['products_description'];
$meta_description = strip_tags($meta_desc);
$meta_mod = $meta_check['products_model'];
$meta_model = strip_tags($meta_mod);


 // $product_check_query = tep_db_query("select count(*) as total from " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd where p.products_status = '1' and p.products_id = '" . (int)$HTTP_GET_VARS['products_id'] . "' and pd.products_id = p.products_id and pd.language_id = '" . (int)$languages_id . "'");

 // BOF Enable & Disable Categories
 $product_check_query = tep_db_query("select count(*) as total from " . TABLE_PRODUCTS . " p left join " . TABLE_PRODUCTS_TO_CATEGORIES . " p2c on p.products_id = p2c.products_id left join " . TABLE_CATEGORIES . " c on p2c.categories_id = c.categories_id, " . TABLE_PRODUCTS_DESCRIPTION . "  pd where c.categories_status = '1' and p.products_status = '1' and p.products_id = '" . (int)$HTTP_GET_VARS['products_id'] . "' and pd.products_id = p.products_id and pd.language_id = '" . (int)$languages_id . "'");
  // EOF Enable & Disable Categories


  $product_check = tep_db_fetch_array($product_check_query);
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<link rel="shortcut icon" href="images/logo.ico" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">



<title><?php echo TITLE; ?>: <?php echo $meta_name; ?>: <?php echo $meta_price; ?></title>
<meta name="description" content="<?php echo TITLE; ?>: <?php echo $meta_name; ?>:  <?php echo $meta_model; ?> :<?php echo $meta_description; ?>">
<meta neme="keywords" content="<?php echo TITLE; ?>: <?php echo $meta_name; ?>: <?php echo $meta_model; ?> : <?php echo $meta_description; ?>">
<meta name="google-site-verification" content="nGZAIIgKIVYL5JWUSSmaMP1XU_X5RrfbNDLa2TlwfiU">

<base href="<?php echo (($request_type == 'SSL') ? HTTPS_SERVER : HTTP_SERVER) . DIR_WS_CATALOG; ?>">
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-16118454-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

<!-- Attrib price update  //-->

<script language="javascript">

<!--

function FormatNumber(num)

{

if(isNaN(num)) { num = "0"; }

sign = (num == (num = Math.abs(num)));

num = Math.floor(num*100+0.50000000001);

cents = num%100;

num = Math.floor(num/100).toString();

if(cents<10) { cents = "0" + cents; }

for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)

{

num = num.substring(0,num.length-(4*i+3))+','+ num.substring(num.length-(4*i+3));

}

return (((sign)?'':'-') + num + '.' + cents);

}



function FormatNumber1(num)

{

if(isNaN(num)) { num = "0"; }

sign = (num == (num = Math.abs(num)));

num = Math.floor(num*1+0.50000000001);

cents = num%100;

num = Math.floor(num/100).toString();

if(cents<10) { cents = "0" + cents; }

for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)

{

num = num.substring(0,num.length-(4*i+3))+','+ num.substring(num.length-(4*i+3));

}

return (((sign)?'':'-') + num + ',' + cents);

}



function showPrice(form)

{
	var currencysymbol1 = "";

	var currencysymbol2 = "";

	var myTotalPrice = 0;

	var showUP = 0;

	var myMathProblem = "";

	myItemPrice = parseFloat(form.nuPrice.value);

	myDollarSign2 = form.nuPrice.value.indexOf("EUR",0)

	if ( myDollarSign2 != "-1" )
	{
		currencysymbol1 = "";

		currencysymbol2 = " EUR";

	} else {

		currencysymbol1 = "£";

		currencysymbol2 = "";

	}

	for (var i = 0; i < form.elements.length; i++)

	{

		var e = form.elements[i];
		var myAttributePrice = 0;

		if ( e.type == 'radio' && e.checked)

		{

			showUP = 1;

			//Item = e.selectedIndex;

			//myPrice = e.options[Item].text;

			myPrice = document.getElementById('option'+e.value).innerHTML;
			myDollarSign = myPrice.indexOf("£",0);
 
			if ( myDollarSign != "-1" )

			{

				currencysymbol1 = "£";

				currencysymbol2 = "";

				myParSign = myPrice.indexOf(")", myDollarSign);

				myAttributeString = myPrice.substring(myDollarSign+1, myParSign);
 
				myAttributeString = myAttributeString.replace(/,/,"");
  
				myAttributePrice = parseFloat(myAttributeString);
 
				myMathProblem = myPrice.charAt(myDollarSign - 1);
	 
			} else {

				myDollarSign1 = myPrice.indexOf("(",0)

				if ( myDollarSign1 != "-1" )

				{

		//			currencysymbol1 = "";

			//		currencysymbol2 = " EUR";

					currencysymbol1 = "£";

					currencysymbol2 = "";

					myParSign = myPrice.indexOf(")", myDollarSign1);

					myAttributeString = myPrice.substring(myDollarSign1+2, myParSign);

					myAttributeString = myAttributeString.replace(/,/,"");

					myAttributePrice = parseFloat(myAttributeString);

					myMathProblem = myPrice.charAt(myDollarSign1 - 1);

				} else {

					myAttributePrice = 0;

				}

			}

			if (myMathProblem == "-"){
			    myTotalPrice = myTotalPrice - myAttributePrice;
			}
			else if (myMathProblem == "+"){
			    myTotalPrice = myTotalPrice + myAttributePrice;
			}
			else if (myMathProblem == "*"){

				if ( myTotalPrice == "0"){
					myTotalPrice = myItemPrice;
				}
				if ( myAttributePrice == "0" || myAttributePrice == "NaN" ||  isNaN(myAttributePrice) ==  true  ||  isNaN(myAttributePrice) ==  1  ){ 
					myTotalPrice=myTotalPrice;			 
				} else {			 
					myTotalPrice = myTotalPrice * myAttributePrice;
				}
		 

			} else {
    
			    if (myTotalPrice == "0")
				{myTotalPrice = myItemPrice;}

				if ( myAttributePrice == "0" || myAttributePrice == "NaN" ||  isNaN(myAttributePrice) ==  true  ||  isNaN(myAttributePrice) ==  1  ){ 
					myTotalPrice=myTotalPrice;			 
				} else {			 
					myTotalPrice = myTotalPrice + myAttributePrice;
				}

			}

		}

	}


	if ( showUP )

	{

		myDollarSign3 = form.nuPrice.value.indexOf(".",0)

		if ( myDollarSign3 != "-1" )

		{

			myTotalPrice = FormatNumber(myTotalPrice );

		} else {

			myTotalPrice = FormatNumber1(myTotalPrice );

		}

		document.getElementById("productNEWprice").innerHTML = currencysymbol1 + myTotalPrice + currencysymbol2 + "/month";
		document.getElementById("productNEWpricebot").innerHTML = currencysymbol1 + myTotalPrice + currencysymbol2 + "/month";
	}

}



function showPrice1(form)

{

var currencysymbol1 = "";

var currencysymbol2 = "";

var myTotalPrice = 0;

var showUP = 0;

var myMathProblem = "";

myItemPrice = parseFloat(form.nuPrice1.value);



myDollarSign2 = form.nuPrice1.value.indexOf("EUR",0)

if ( myDollarSign2 != "-1" )

{

currencysymbol1 = "";

currencysymbol2 = " EUR";

} else {

currencysymbol1 = "£";

currencysymbol2 = "";

}



for (var i = 0; i < form.elements.length; i++)

{

var e = form.elements[i];

if ( e.type == 'select-one' )

{

showUP = 1;

Item = e.selectedIndex;

myPrice = e.options[Item].text;

myDollarSign = myPrice.indexOf("£",0)

if ( myDollarSign != "-1" )

{

currencysymbol1 = "£";

currencysymbol2 = "";

  myParSign = myPrice.indexOf(")", myDollarSign);

  myAttributeString = myPrice.substring(myDollarSign+1, myParSign);

  myAttributeString = myAttributeString.replace(/,/,"");

  myAttributePrice = parseFloat(myAttributeString);

  myMathProblem = myPrice.charAt(myDollarSign - 1);

} else {

 myDollarSign1 = myPrice.indexOf("(",0)

 if ( myDollarSign1 != "-1" )

 {

 currencysymbol1 = "";

  currencysymbol2 = " EUR";

 myParSign = myPrice.indexOf(")", myDollarSign1);

 myAttributeString = myPrice.substring(myDollarSign1+1, myParSign);

 myAttributeString = myAttributeString.replace(/,/,"");

 myAttributePrice = parseFloat(myAttributeString);

 myMathProblem = myPrice.charAt(myDollarSign1 - 1);

 } else {

 myAttributePrice = 0;

 }



}
myTotalPrice='5';
  if (myMathProblem == "-")

  {

    myTotalPrice = myTotalPrice - myAttributePrice;

  } else {

    myTotalPrice = myTotalPrice + myAttributePrice;

  }

}

}

if ( showUP )

{

myDollarSign3 = form.nuPrice1.value.indexOf(".",0)

if ( myDollarSign3 != "-1" )

{

myTotalPrice = FormatNumber(myTotalPrice);

} else {

myTotalPrice = FormatNumber1(myTotalPrice);

}

document.getElementById("productNEWprice1").innerHTML = currencysymbol1 + myTotalPrice + currencysymbol2 + "/month";

document.getElementById("productNEWprice1bot").innerHTML = currencysymbol1 + myTotalPrice + currencysymbol2 +"/month";
}

}

//-->

</script>

<!-- Attrib price update Fin //-->


<script language="javascript"><!--
function popupWindow(url) {
window.open(url,'popupWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no,width=100,height=100,screenX=150,screenY=150,top=150,left=150')
}
//--></script>
</head>
<body marginwidth="0" marginheight="0" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
<!-- header //-->
<?php require(DIR_WS_INCLUDES . 'header.php'); ?>
<!-- header_eof //-->

<!-- body //-->


<table border="0" width="10%" cellspacing="3" cellpadding="3">
<tr>
<td width="<?php echo BOX_WIDTH; ?>" valign="top"><table border="0" width="<?php echo BOX_WIDTH; ?>" cellspacing="0" cellpadding="2">
<!-- left_navigation //-->
<?php require(DIR_WS_INCLUDES . 'column_left.php'); ?>
<!-- left_navigation_eof //-->
</table></td>
<!-- body_text //-->
<td width="100%" valign="top"><?php echo tep_draw_form('cart_quantity', tep_href_link(FILENAME_PRODUCT_INFO, tep_get_all_get_params(array('action')) . 'action=add_product')); ?><table border="0" width="100%" cellspacing="10" cellpadding="0">
<?php
if ($product_check['total'] < 1) {
?>
<tr>
<td><?php new infoBox(array(array('text' => TEXT_PRODUCT_NOT_FOUND))); ?></td>
</tr>
<tr>
<td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
</tr>
<tr>
<td><table border="0" width="100%" cellspacing="1" cellpadding="2" class="infoBox">
  <tr class="infoBoxContents">
    <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
      <tr>
	<td width="10"><?php echo tep_draw_separator('pixel_trans.gif', '10', '1'); ?></td>
	<td align="right"><?php echo '<a href="' . tep_href_link(FILENAME_DEFAULT) . '">' . tep_image_button('button_continue.gif', IMAGE_BUTTON_CONTINUE) . '</a>'; ?></td>
	<td width="10"><?php echo tep_draw_separator('pixel_trans.gif', '10', '1'); ?></td>
      </tr>
    </table></td>
  </tr>
</table></td>
</tr>
<?php
} else {
      // added products_type
    $product_info_query = tep_db_query("select p.products_id, pd.products_name, pd.products_description, p.products_model, p.products_quantity, p.products_image, pd.products_url, p.products_price, p.products_tax_class_id, p.products_date_added, p.products_date_available, p.manufacturers_id, p.products_type from " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd where p.products_status = '1' and p.products_id = '" . (int)$HTTP_GET_VARS['products_id'] . "' and pd.products_id = p.products_id and pd.language_id = '" . (int)$languages_id . "'");

#$product_info_query = tep_db_query("select p.products_id, pd.products_name, pd.products_description, p.products_model, p.products_quantity, p.products_image, pd.products_url, p.products_price, p.products_tax_class_id, p.products_date_added, p.products_date_available, p.manufacturers_id from " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd where p.products_status = '1' and p.products_id = '" . (int)$HTTP_GET_VARS['products_id'] . "' and pd.products_id = p.products_id and pd.language_id = '" . (int)$languages_id . "'");
$product_info = tep_db_fetch_array($product_info_query);

tep_db_query("update " . TABLE_PRODUCTS_DESCRIPTION . " set products_viewed = products_viewed+1 where products_id = '" . (int)$HTTP_GET_VARS['products_id'] . "' and language_id = '" . (int)$languages_id . "'");
    // see if rp product
    $rp_has_trial = false;
    if($product_info['products_type'] == 'recurring'){
        // recurring product
      $rp_array = array();
      $rp_product_query = tep_db_query('SELECT billingPeriod, billingFrequency, totalBillingCycles, trialBillingPeriod, trialBillingFrequency, trialTotalBillingCycles, trialAmt FROM ' . TABLE_RP_PAYPAL_PRODUCT_PROFILE . ' WHERE products_id=' . (int)$HTTP_GET_VARS['products_id']);
      if($rp_product = tep_db_fetch_array($rp_product_query)){
        // recurring data
         $rp_array = $rp_product;
         if(strlen($rp_product['trialBillingPeriod'])>0){
             $rp_has_trial = true;
         }
      }
    }

if ($new_price = tep_get_products_special_price($product_info['products_id'])) {
$products_price = '<s>' . $currencies->display_price($product_info['products_price'], tep_get_tax_rate($product_info['products_tax_class_id'])) . '</s> <span class="productSpecialPrice">' . $currencies->display_price($new_price, tep_get_tax_rate($product_info['products_tax_class_id'])) . '</span>';

//Attrib price update

$nuPrice1 =  $currencies->display_price($product_info['products_price'], tep_get_tax_rate($product_info['products_tax_class_id']));
$nuPrice =  $currencies->display_price($new_price, tep_get_tax_rate($product_info_values['products_tax_class_id']));

$nuPricebot1 =  $currencies->display_price($product_info['products_price'], tep_get_tax_rate($product_info['products_tax_class_id']));
$nuPricebot =  $currencies->display_price($new_price, tep_get_tax_rate($product_info_values['products_tax_class_id']));
//Attrib price update Fin


} else {
//Attrib price update

$products_price = $currencies->display_price($product_info['products_price'], tep_get_tax_rate($product_info['products_tax_class_id']));
$products_month = $products_price . "/month";
$nuPrice = $products_price;
$nuPricebot = $products_price;


}

$nuPrice = str_replace(",", "", $nuPrice);
$nuPrice1 = str_replace(",", "", $nuPrice1);

$nuPricebot = str_replace(",", "", $nuPricebot);
$nuPrice1bot = str_replace(",", "", $nuPrice1bot);



//Attrib price update Fin

if (tep_not_null($product_info['products_model'])) {
$products_name = $product_info['products_name'] . '<br><span class="smallText">[' . $product_info['products_model'] . ']</span>';
} else {
$products_name = $product_info['products_name'];
}
   //rp addition here
if(count($rp_array)>0){
         include_once(DIR_WS_CLASSES . '/paypal_rp_product_info.php');
         $rpPinfo = new paypal_rp_product_info($product_info, $rp_array, $products_price);
         $rpPinfoHeaderArr = $rpPinfo->getProductInfoHeader();
         $rpPInfoArr = $rpPinfo->getProductInfoFull();
    }


?>
<tr>
<td><table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
<?php echo tep_draw_top();?>

<?php echo tep_draw_title_top();?>

                                <div class="left_part"><?php echo $breadcrumb->trail(' &raquo; ')?> &raquo;  <?php echo $products_name; ?></div><div class="right_part">
<!-- price update attributes begin -->
<?php 

if(tep_has_product_attributes($product_info['products_id'])){ 

if ($new_price = tep_get_products_special_price($product_info['products_id'])) {

?> 

<script type="text/javascript">document.write('<s><div id="productNEWprice1"><?php echo $products_month; ?></div>\n</s>');</script>hello10

<script type="text/javascript">document.write('<span class="productSpecialPrice"><div id="productNEWprice"><?php echo $products_month; ?></div>\n</span>');</script>hello11

<noscript><?php echo $products_month; ?></noscript>hello13

<?php } else { ?>
<script type="text/javascript">document.write('<div id="productNEWprice"><?php echo $products_month; ?></div>\n</span>');</script>
 
<noscript><?php echo $products_month; ?></noscript>

<?php } 

} else { 

echo $products_month; } 
?>
</td>
<input type="hidden" name="nuPrice" value="<?php echo str_replace("£","",$nuPrice); ?>">
 <input type="hidden" name="nuPrice1" value="<?php echo str_replace("£","",$nuPrice1); ?>"> 
<!-- price update attributes ent -->


</div>

<?php echo tep_draw_title_bottom();?>

<?php echo tep_draw1_amro();?>

  </tr>
</table></td><!--monthly price from paypal module
            <?php
            if(count($rp_array)>0 and $rp_has_trial){
            // rp with trial
            ?>
            <td class="pageHeading" align="right" valign="top"><?php echo $rpPinfoHeaderArr['trial']; ?><br><?php print $rpPinfoHeaderArr['normal'];?></td>
            <?php
            // rp no trial
            }elseif (count($rp_array)>0){
            ?>
            <td class="pageHeading" align="right" valign="top"><?php print $rpPinfoHeaderArr['normal']; ?></td>
            <?php
            }else{
            // standard product
            ?>
<td class="pageHeading" align="right" valign="top"><?php echo $products_price; ?></td>
            <?php
            }
            ?>-->

</tr>
<td class="main">
<?php
if (tep_not_null($product_info['products_image'])) {
?>

<div class="main"><div class="desc2"><?php echo $meta_check['products_description']; ?></div><br>

</div>

<?php
    }
?>
<?php
    $products_attributes_query = tep_db_query("select count(*) as total from " . TABLE_PRODUCTS_OPTIONS . " popt, " . TABLE_PRODUCTS_ATTRIBUTES . " patrib where patrib.products_id='" . (int)$HTTP_GET_VARS['products_id'] . "' and patrib.options_id = popt.products_options_id and popt.language_id = '" . (int)$languages_id . "'");
    $products_attributes = tep_db_fetch_array($products_attributes_query);
    if ($products_attributes['total'] > 0) {
?>
<br>
          <table border="0" cellspacing="0" cellpadding="2" >
            <tr>
              <td class="main" colspan="2"><?php echo '<b>'.TEXT_PRODUCT_OPTIONS.'</b>'; ?><br><br></td>
            </tr>
<?php
      $products_options_name_query = tep_db_query("select distinct popt.products_options_id, popt.products_options_name from " . TABLE_PRODUCTS_OPTIONS . " popt, " . TABLE_PRODUCTS_ATTRIBUTES . " patrib where patrib.products_id='" . (int)$HTTP_GET_VARS['products_id'] . "' and patrib.options_id = popt.products_options_id and popt.language_id = '" . (int)$languages_id . "' order by popt.products_options_name");
      while ($products_options_name = tep_db_fetch_array($products_options_name_query)) {
        $products_options_array = array();
$products_options_query = tep_db_query("select pov.products_options_values_id, pov.products_options_values_name, pa.options_values_price, pa.price_prefix, pa.products_attributes_id from " . TABLE_PRODUCTS_ATTRIBUTES . " pa, " . TABLE_PRODUCTS_OPTIONS_VALUES . " pov where pa.products_id = '" . (int)$HTTP_GET_VARS['products_id'] . "' and pa.options_id = '" . (int)$products_options_name['products_options_id'] . "' and pa.options_values_id = pov.products_options_values_id and pov.language_id = '" . (int)$languages_id . "'" . " order by pa.options_values_price, pa.products_attributes_id");
while ($products_options = tep_db_fetch_array($products_options_query)) {
          $products_options_array[] = array('id' => $products_options['products_options_values_id'], 'text' => $products_options['products_options_values_name']);
          if ($products_options['options_values_price'] != '0') {

            $products_options_array[sizeof($products_options_array)-1]['text'] .= ' (' . $products_options['price_prefix'] . $currencies->display_price($products_options['options_values_price'], tep_get_tax_rate($product_info['products_tax_class_id'])) .') ';
$myvar=$products_options_array[sizeof($products_options_array)-1]['text'];


          }
        }
$myvar=$products_options_array[sizeof($products_options_array)-1]['text'];

        if (isset($cart->contents[$HTTP_GET_VARS['products_id']]['attributes'][$products_options_name['products_options_id']])) {
          $selected_attribute = $cart->contents[$HTTP_GET_VARS['products_id']]['attributes'][$products_options_name['products_options_id']];
        } else {
          $selected_attribute = false;
        }
?>
            <tr>
              <td class="main" style="text-align:center;vertical-align:middle;"><?php echo $products_options_name['products_options_name'] . ':'; ?></td>
<!-- tep_draw_radio_menu-->
<td class="main"><?php 
if ($new_price = tep_get_products_special_price($product_info['products_id'])) {
	echo tep_draw_radio_menu('id[' . $products_options_name['products_options_id'] . ']', $products_options_array, $selected_attribute, "onClick='showPrice(this.form);showPrice1(this.form);'"); 
}else{
$mymenu=$selected_attribute;

	echo tep_draw_radio_menu('id[' . $products_options_name['products_options_id'] . ']', $products_options_array, $selected_attribute, "onClick='showPrice(this.form); '");
}
?><hr></td>
            </tr>

<?php
      }
?>
          </table>
<?php
    }
?>
        </td>
      </tr>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr>


<!-- start bottom price banner -->
<tr>
<td>

<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
<?php echo tep_draw_top();?>

<?php echo tep_draw_title_top();?>

                                <div class="left_part"><?php echo $breadcrumb->trail(' &raquo; ')?> &raquo;  <?php echo $products_name; ?></div><div class="right_part">

<!-- price update attributes begin -->
<?php

if(tep_has_product_attributes($product_info['products_id'])){

if ($new_price = tep_get_products_special_price($product_info['products_id'])) {

?>

<script type="text/javascript">document.write('<s><div id="productNEWprice1bot"><?php echo $products_price; ?></div>\n</s>');</script>

<script type="text/javascript">document.write('<span class="productSpecialPrice"><div id="productNEWpricebot"><?php echo $products_price; ?></div>\n</span>');</script>

<noscript><?php echo $products_price; ?></noscript>

<?php } else { ?>

<script type="text/javascript">document.write('<div id="productNEWpricebot"><?php echo $products_price; ?></div>\n</span>');</script>

<noscript><?php echo $products_price; ?></noscript>

<?php }

} else {

echo $products_price; }
?>
</td>
<input type="hidden" name="nuPricebot" value="<?php echo str_replace("£","",$nuPricebot); ?>">
 <input type="hidden" name="nuPrice1bot" value="<?php echo str_replace("£","",$nuPrice1bot); ?>">
<!-- price update attributes ent -->


</div>

<?php echo tep_draw_title_bottom();?>
<?php echo tep_draw1_top();?>


</td>
</tr>
<!--  end bottom price banner -->

<?php
    $reviews_query = tep_db_query("select count(*) as count from " . TABLE_REVIEWS . " where products_id = '" . (int)$HTTP_GET_VARS['products_id'] . "'");
    $reviews = tep_db_fetch_array($reviews_query);
    if ($reviews['count'] > 0) {
?>
      <tr>
        <td class="main"><?php echo TEXT_CURRENT_REVIEWS . ' ' . $reviews['count']; ?></td>
      </tr>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr>
<?php
    }

    if (tep_not_null($product_info['products_url'])) {
?>
      <tr>
        <td class="main"><?php echo sprintf(TEXT_MORE_INFORMATION, tep_href_link(FILENAME_REDIRECT, 'action=url&goto=' . urlencode($product_info['products_url']), 'NONSSL', true, false)); ?></td>
      </tr>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr>


<?php
    }

    if ($product_info['products_date_available'] > date('Y-m-d H:i:s')) {
?>

      <tr>



        <td align="center" class="smallText"><?php echo sprintf(TEXT_DATE_AVAILABLE, tep_date_long($product_info['products_date_available'])); ?></td>
      </tr>
<?php
    } else {
?>
  <!--#Product added on......<removed>
    <tr>
        <td align="center" class="smallText"><?php echo sprintf(TEXT_DATE_ADDED, tep_date_long($product_info['products_date_added'])); ?></td>

      </tr>-->
<?php
    }
?>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr>
      <tr>
        
</tr>


</td>
      </tr>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr>
      <tr>
        <td>
<?php
    if ((USE_CACHE == 'true') && empty($SID)) {
      echo tep_cache_also_purchased(3600);
    } else {   #Customers also purchased....<removed>
      #include(DIR_WS_MODULES . FILENAME_ALSO_PURCHASED_PRODUCTS);
    }
  }
?>
        </td>
      </tr>
    </table>
<?php
    if(count($rp_array)>0){
         include_once(DIR_WS_CLASSES . '/paypal_rp_product_info.php');
         $rpPinfo = new paypal_rp_product_info($product_info, $rp_array, $products_price);
         $rpPinfoHeaderArr = $rpPinfo->getProductInfoHeader();
         $rpPInfoArr = $rpPinfo->getProductInfoFull();
    }?>
             <table border="0" width="100%" cellspacing="0" cellpadding="0"><tr>
                <td class="main button_marg"><?php echo '<a href="' . tep_href_link(FILENAME_PRODUCT_REVIEWS, tep_get_all_get_params()) . '">' . tep_image_button('button_reviews.gif', IMAGE_BUTTON_REVIEWS) . '</a>'; ?></td>
                <td class="main button_marg" align="right"><?php echo tep_draw_hidden_field('products_id', $product_info['products_id']) . tep_image_submit('button_add_to_cart1.gif', IMAGE_BUTTON_IN_CART); ?></td>
              </tr>
            </table>



</form></td>
<!-- body_text_eof //-->
  </tr>
</table>
<!-- body_eof //-->

<!-- footer //-->
<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
<!-- footer_eof //-->
<br>
</body>

<!-- Attrib price update  //-->

<script language="javascript">

<!--

  showPrice(cart_quantity);
<?php
if ($new_price = tep_get_products_special_price($product_info['products_id'])) {
?>
  showPrice1(cart_quantity);
<?php 
 } 
?>
//-->

</script>

<!-- Attrib price update Fin //-->

</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
