<?php
/*
  $Id: products_new.php 1739 2007-12-20 00:52:16Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_PRODUCTS_NEW);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_PRODUCTS_NEW));
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>

<link rel="shortcut icon" href="images/logo.ico" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE . " - New Products"; ?></title>
<base href="<?php echo (($request_type == 'SSL') ? HTTPS_SERVER : HTTP_SERVER) . DIR_WS_CATALOG; ?>">
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<script type="text/javascript" src="iepngfix_tilebg.js"></script>
<style type="text/css">
.ie6_png 			{behavior: url("iepngfix.htc") }
.ie6_png img		{behavior: url("iepngfix.htc") }
.ie6_png input		{behavior: url("iepngfix.htc") }
</style>
<!--[if IE]>
   <script type="text/javascript" src="ie_png.js"></script>
   <script type="text/javascript">
       ie_png.fix('.png');
   </script>
<![endif]-->
</head>
<body>
<!-- header //-->
<?php $tab_sel = 3; ?>
<?php require(DIR_WS_INCLUDES . 'header.php'); ?>
<!-- header_eof //-->

<!-- body //-->
<table border="0" class="<?php echo MAIN_TABLE; ?>" cellspacing="0" cellpadding="0">
<tr>
    <td class="<?php echo BOX_WIDTH_TD_LEFT; ?>"><table border="0" class="<?php echo BOX_WIDTH_LEFT; ?>" cellspacing="0" cellpadding="0">
<!-- left_navigation //-->
<?php require(DIR_WS_INCLUDES . 'column_left.php'); ?>
<!-- left_navigation_eof //-->
    </table></td>
<!-- body_text //-->
    <td class="<?php echo CONTENT_WIDTH_TD; ?>">
	
<?php
  $products_new_array = array();

  //$products_new_query_raw = "select p.products_id, pd.products_name, p.products_image, p.products_price, p.products_tax_class_id, p.products_date_added, m.manufacturers_name from " . TABLE_PRODUCTS . " p left join " . TABLE_MANUFACTURERS . " m on (p.manufacturers_id = m.manufacturers_id), " . TABLE_PRODUCTS_DESCRIPTION . " pd where p.products_status = '1' and p.products_id = pd.products_id and pd.language_id = '" . (int)$languages_id . "' order by p.products_date_added DESC, pd.products_name";

  // BOF Enable & Disable Categories
    $products_new_query_raw = "select p.products_id, pd.products_name, p.products_image, p.products_price, p.products_tax_class_id, p.products_date_added, m.manufacturers_name from " . TABLE_PRODUCTS . " p left join " . TABLE_MANUFACTURERS . " m on p.manufacturers_id = m.manufacturers_id left join " . TABLE_PRODUCTS_DESCRIPTION . " pd on p.products_id = pd.products_id and pd.language_id = '" . (int)$languages_id . "' left join " . TABLE_SPECIALS . " s on p.products_id = s.products_id, " . TABLE_PRODUCTS_TO_CATEGORIES . " p2c, " . TABLE_CATEGORIES . " c where p.products_id = p2c.products_id and c.categories_id = p2c.categories_id and c.categories_status = '1' and p.products_status='1' order by p.products_date_added DESC, pd.products_name";
  // EOF Enable & Disable Categories

  $products_new_split = new splitPageResults($products_new_query_raw, MAX_DISPLAY_PRODUCTS_NEW);

  if (($products_new_split->number_of_rows > 0) && ((PREV_NEXT_BAR_LOCATION == '1') || (PREV_NEXT_BAR_LOCATION == '3'))) {
?>

<?php echo tep_draw_result1_top(); ?> 
       <img src="images/whats_banner.png" width="712" height="150" alt=""><br>
<br>

		<table border="0" cellspacing="0" cellpadding="0" class="result result_top_padd">
          <tr>
          
            <td><?php echo $products_new_split->display_count(TEXT_DISPLAY_NUMBER_OF_PRODUCTS_NEW); ?></td>
            <td class="result_right"><?php echo TEXT_RESULT_PAGE . ' ' . $products_new_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info', 'x', 'y'))); ?></td>
          </tr>
        </table>

<?php echo tep_draw_result1_bottom(); ?> 

<?php
  }
?>



<?php
  if ($products_new_split->number_of_rows > 0) {
  $products_new_query = tep_db_query($products_new_split->sql_query);
  $row = 0;
  $col = 0;
  $info_box_contents = array();
  while ($products_new = tep_db_fetch_array($products_new_query)) {
 
 $product_query = tep_db_query("select products_description, products_id from " . TABLE_PRODUCTS_DESCRIPTION . " where products_id = '" . (int)$products_new['products_id'] . "' and language_id = '" . (int)$languages_id . "'");
      $product = tep_db_fetch_array($product_query);

       	$p_desc = substr(strip_tags($product['products_description']), 0, MAX_DESCR_2).'...';
        $p_id = $product['products_id'];
		$p_pic = '<a href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $products_new['products_id']) . '">' . tep_image(DIR_WS_IMAGES . $products_new['products_image'], $products_new['products_name'], SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT) . '</a>';
		$p_name = '<a href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $products_new['products_id']) . '">' .$products_new['products_name'] . '</a>';
		

 
   if ($new_price = tep_get_products_special_price($products_new['products_id'])) {
        $products_price = '<s>' . $currencies->display_price($products_new['products_price'], tep_get_tax_rate($products_new['products_tax_class_id'])) . '</s> <span class="productSpecialPrice">' . $currencies->display_price($new_price, tep_get_tax_rate($products_new['products_tax_class_id'])) . '</span>';
      } else {
        $products_price = '<span class="productSpecialPrice">'.$currencies->display_price($products_new['products_price'], tep_get_tax_rate($products_new['products_tax_class_id']).'</span>');
      }
	  
	$p_price = $products_price;
	
  $p_details = '<a href="' . tep_href_link('product_info.php?products_id='.$p_id) . '">'.tep_image_button("button_details.gif").'</a>';
  $p_buy_now = '<a href="'.tep_href_link("products_new.php","action=buy_now&products_id=".$p_id).'">'.tep_image_button('button_add_to_cart1.gif').'</a>';
	
   if ($row %2){	
    $products_new['products_name'] = tep_get_products_name($products_new['products_id']);
    $info_box_contents[$row][$col] = array('align' => 'left',
                                           'params' => ' class="right"',
                                           'text' => ''.tep_draw_prod2_top().'
	<div  class="pic_padd">'.tep_draw_prod_pic_top().''.$p_pic.''.tep_draw_prod_pic_bottom().'</div>
	<div>
			<div class="name name_padd">'.$p_name.'</div>
			
			<div class="ofh"> 
					<div class="listing data_padd"><em>' . TEXT_DATE_ADDED . ' ' . tep_date_long($products_new['products_date_added']) . '<br>' . TEXT_MANUFACTURER . ' ' . $products_new['manufacturers_name'] . '</em></div>	
									
					<div class="price_padd vam">&nbsp;&nbsp;'.$p_price.'</div>
			</div>

			<div class="desc desc_padd">'.$p_desc.'</div>

			<div class="button_padd ofh">
				<div class="fl_right">'.$p_details.'</div>
				<div class="fl_left">'.$p_buy_now .'</div> 
				
			</div>

	</div><br class="cl_both">'.tep_draw_prod2_bottom().'');
}else{
    $products_new['products_name'] = tep_get_products_name($products_new['products_id']);
    $info_box_contents[$row][$col] = array('align' => 'left',
                                           'params' => ' class="left"',
                                           'text' => ''.tep_draw_prod2_top().'
	<div  class="pic_padd">'.tep_draw_prod_pic_top().''.$p_pic.''.tep_draw_prod_pic_bottom().'</div>
	<div>
			<div class="name name_padd">'.$p_name.'</div>
			
			<div class="ofh"> 
					<div class="price_padd vam">&nbsp;&nbsp;'.$p_price.'</div>
					
					<div class="listing data_padd"><em>' . TEXT_DATE_ADDED . ' ' . tep_date_long($products_new['products_date_added']) . '<br>' . TEXT_MANUFACTURER . ' ' . $products_new['manufacturers_name'] . '</em></div>
				  
			</div>
			
			<div class="desc desc_padd">'.$p_desc.'</div>
			
			<div class="button_padd ofh">
				<div class="fl_right">'.$p_buy_now.'</div>
				<div class="fl_left">'.$p_details .'</div> 
				
			</div>

	</div><br class="cl_both">'.tep_draw_prod2_bottom().'');
}
    $col ++;
    if ($col > 0) {
      $col = 0;
      $row ++;
    }
  }
     new contentBox($info_box_contents);
   
  } else  {
?>
		<table cellpadding="0" cellspacing="0" border="0">       
		  <tr><td class="main"><?php echo TEXT_NO_NEW_PRODUCTS; ?></td></tr>
		</table>
		
<?php echo tep_pixel_trans();?>
		 
<?php
  }
?>

<?php
  if (($products_new_split->number_of_rows > 0) && ((PREV_NEXT_BAR_LOCATION == '2') || (PREV_NEXT_BAR_LOCATION == '3'))) {
?>

<?php /*  echo tep_draw_result2_top();  */ ?> 
       
        <table border="0" width="100%" cellspacing="0" cellpadding="0" class="result result_bottom_padd">
          <tr>
            <td><?php echo $products_new_split->display_count(TEXT_DISPLAY_NUMBER_OF_PRODUCTS_NEW); ?></td>
            <td class="result_right"><?php echo TEXT_RESULT_PAGE . ' ' . $products_new_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info', 'x', 'y'))); ?></td>
          </tr>
        </table>
		
<?php echo tep_draw_result2_bottom(); ?>        

<?php
  }
?>

<?php echo tep_draw3_bottom();?>
      		
<?php echo tep_draw_bottom();?>

	</td>
<!-- body_text_eof //-->
  </tr>
</table>
<!-- body_eof //-->

<!-- footer //-->
<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
<!-- footer_eof //-->
</body>
</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
