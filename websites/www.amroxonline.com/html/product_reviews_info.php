<?php
/*
  $Id: product_reviews_info.php 1739 2007-12-20 00:52:16Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  if (isset($HTTP_GET_VARS['reviews_id']) && tep_not_null($HTTP_GET_VARS['reviews_id']) && isset($HTTP_GET_VARS['products_id']) && tep_not_null($HTTP_GET_VARS['products_id'])) {
    $review_check_query = tep_db_query("select count(*) as total from " . TABLE_REVIEWS . " r, " . TABLE_REVIEWS_DESCRIPTION . " rd where r.reviews_id = '" . (int)$HTTP_GET_VARS['reviews_id'] . "' and r.products_id = '" . (int)$HTTP_GET_VARS['products_id'] . "' and r.reviews_id = rd.reviews_id and rd.languages_id = '" . (int)$languages_id . "'");
    $review_check = tep_db_fetch_array($review_check_query);

    if ($review_check['total'] < 1) {
      tep_redirect(tep_href_link(FILENAME_PRODUCT_REVIEWS, tep_get_all_get_params(array('reviews_id'))));
    }
  } else {
    tep_redirect(tep_href_link(FILENAME_PRODUCT_REVIEWS, tep_get_all_get_params(array('reviews_id'))));
  }

  tep_db_query("update " . TABLE_REVIEWS . " set reviews_read = reviews_read+1 where reviews_id = '" . (int)$HTTP_GET_VARS['reviews_id'] . "'");

  $review_query = tep_db_query("select rd.reviews_text, r.reviews_rating, r.reviews_id, r.customers_name, r.date_added, r.reviews_read, p.products_id, p.products_price, p.products_tax_class_id, p.products_image, p.products_model, pd.products_name from " . TABLE_REVIEWS . " r, " . TABLE_REVIEWS_DESCRIPTION . " rd, " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd where r.reviews_id = '" . (int)$HTTP_GET_VARS['reviews_id'] . "' and r.reviews_id = rd.reviews_id and rd.languages_id = '" . (int)$languages_id . "' and r.products_id = p.products_id and p.products_status = '1' and p.products_id = pd.products_id and pd.language_id = '". (int)$languages_id . "'");
  $review = tep_db_fetch_array($review_query);

  if ($new_price = tep_get_products_special_price($review['products_id'])) {
    $products_price = '<s>' . $currencies->display_price($review['products_price'], tep_get_tax_rate($review['products_tax_class_id'])) . '</s><br> <span class="productSpecialPrice">' . $currencies->display_price($new_price, tep_get_tax_rate($review['products_tax_class_id'])) . '</span>';
  } else {
    $products_price = $currencies->display_price($review['products_price'], tep_get_tax_rate($review['products_tax_class_id']));
  }

  if (tep_not_null($review['products_model'])) {
    $products_name = $review['products_name'] . '<br><span class="smallText">[' . $review['products_model'] . ']</span>';
  } else {
    $products_name = $review['products_name'];
  }

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_PRODUCT_REVIEWS_INFO);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_PRODUCT_REVIEWS, tep_get_all_get_params()));
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<link rel="shortcut icon" href="images/logo.ico" type="image/x-icon" >
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE; ?></title>
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
<script language="javascript"><!--
function popupWindow(url) {
  window.open(url,'popupWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no,width=100,height=100,screenX=150,screenY=150,top=150,left=150')
}
//--></script>
</head>
<body>
<!-- header //-->
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
    <td class="<?php echo CONTENT_WIDTH_TD; ?>"><?php echo panel_top(); ?>

<?php echo tep_draw_top();?>

<?php echo tep_draw_title_top();?>

				<div class="left_part"><?php echo $products_name; ?></div><div class="right_part"><?php echo $products_price; ?></div>
			
<?php echo tep_draw_title_bottom();?>
								
<?php echo tep_draw1_top();?>
			
				<table border="0" width="100%" cellspacing="0" cellpadding="2">
                  <tr>
                    <td class="main indent_2"><?php echo '<b>' . sprintf(TEXT_REVIEW_BY, tep_output_string_protected($review['customers_name'])) . '</b>'; ?></td>
                    <td class="smallText vam" align="right"><?php echo sprintf(TEXT_REVIEW_DATE_ADDED, tep_date_long($review['date_added'])); ?></td>
                  </tr>
                </table>
            <?php echo tep_pixel_trans();?>
            <table border="0" width="100%" cellspacing="0" cellpadding="2">
				<tr><td>
			
				<table border="0" cellspacing="0" cellpadding="0">
				  <tr><td align="center" class="smallText">
<?php
  if (tep_not_null($review['products_image'])) {
?>
<div class="main" style="float:left;padding:1px 1px 1px 1px;margin-right:15px; text-align:center; width:<?php echo (SMALL_IMAGE_WIDTH +23);?>px;">

<?php echo tep_draw_prod_pic_top();?>

<script language="javascript"><!--
document.write('<?php echo '<a href="javascript:popupWindow(\\\'' . tep_href_link(FILENAME_POPUP_IMAGE, 'pID=' . $review['products_id']) . '\\\')">' . tep_image(DIR_WS_IMAGES . $review['products_image'], addslashes($review['products_name']), SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT, '') . '</a>'; ?>');
//--></script>
<noscript>
<?php echo '<a href="' . tep_href_link(DIR_WS_IMAGES . $review['products_image']) . '" target="_blank">' . tep_image(DIR_WS_IMAGES . $review['products_image'], $review['products_name'], SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT, 'hspace="5" vspace="5"') . '</a>'; ?>
</noscript>

<?php echo tep_draw_prod_pic_bottom();?>

<script language="javascript"><!--
document.write('<?php echo '<a class="enlarge" href="javascript:popupWindow(\\\'' . tep_href_link(FILENAME_POPUP_IMAGE, 'pID=' . $review['products_id']) . '\\\')">' . TEXT_CLICK_TO_ENLARGE . '</a>'; ?>');
//--></script>
<noscript>
<?php echo '<a class="enlarge" href="' . tep_href_link(DIR_WS_IMAGES . $review['products_image']) . '" target="_blank">' .  TEXT_CLICK_TO_ENLARGE . '</a>'; ?>
</noscript>

</div>	

<?php
  }

  echo '<td style="width:100%;" align="right"><br><a href="' . tep_href_link(basename($PHP_SELF), tep_get_all_get_params(array('action')) . 'action=buy_now') . '">' . tep_image_button('button_add_to_cart1.gif', IMAGE_BUTTON_IN_CART) . '</a>';
?>
                </td></tr>
            </table>
              
<?php echo tep_pixel_trans();?>				
								
<?php echo tep_draw_infoBox_top();?>

					<table border="0" width="100%" cellspacing="0" cellpadding="2"><tr>
                        <td width="10"><?php echo tep_draw_separator('pixel_trans.gif', '10', '1'); ?></td>
                        <td class="main"><?php echo tep_break_string(nl2br(tep_output_string_protected($review['reviews_text'])), 60, '-<br>') . '<br><br><i>' . sprintf(TEXT_REVIEW_RATING, tep_image(DIR_WS_IMAGES . 'stars_' . $review['reviews_rating'] . '.gif', sprintf(TEXT_OF_5_STARS, $review['reviews_rating'])), sprintf(TEXT_OF_5_STARS, $review['reviews_rating'])) . '</i>'; ?></td>
                        <td width="10" align="right"><?php echo tep_draw_separator('pixel_trans.gif', '10', '1'); ?></td>
                      </tr>
                    </table>
				
<?php echo tep_draw_infoBox_bottom();?>

<?php echo tep_pixel_trans();?>
				
<?php echo tep_draw_infoBox2_top();?>

					<table border="0" width="100%" cellspacing="0" cellpadding="2">
						<tr><td class="main"><?php echo '<a href="' . tep_href_link(FILENAME_PRODUCT_REVIEWS, tep_get_all_get_params(array('reviews_id'))) . '">' . tep_image_button('button_back1.gif', IMAGE_BUTTON_BACK) . '</a>'; ?></td>
                        <td class="main" align="right"><?php echo '<a href="' . tep_href_link(FILENAME_PRODUCT_REVIEWS_WRITE, tep_get_all_get_params(array('reviews_id'))) . '">' . tep_image_button('button_write_review.gif', IMAGE_BUTTON_WRITE_REVIEW) . '</a>'; ?></td></tr>
                    </table>
				
<?php echo tep_draw_infoBox2_bottom();?>
			
			</td></tr>
            </table>
		

<?php echo tep_draw1_bottom();?>
      		
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
