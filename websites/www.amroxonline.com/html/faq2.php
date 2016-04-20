<?php
/*
  $Id: specials.php 1739 2007-12-20 00:52:16Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_SPECIALS);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_SPECIALS));
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<link rel="shortcut icon" href="images/logo.ico" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo HEADING_TITLE; ?></title>
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
<?php $tab_sel = 4; ?>
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

				<?php new contentBoxHeading_ProdNew($info_box_contents);?>
											
<?php echo tep_draw3_top();?>
            <td class="main"><?php echo TEXT_CLICK_REVEAL; ?></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr>
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
<?php
  $faq_query = tep_db_query('select f.faq_id, fd.faq_question, fd.faq_answer, f.last_modified, f.sort_order, f.faq_status from '.TABLE_FAQ.' f,  '.TABLE_FAQ_DESCRIPTION.' fd where f.faq_id=fd.faq_id and f.faq_status and fd.language_id=' . (int)$languages_id . ' order by f.sort_order, fd.faq_question');
                $count = 1;
                while($faq = tep_db_fetch_array($faq_query)){
?>
          <tr>
            <td class="main"><b style="cursor:pointer;" onclick="showItem('faq_answer_<?php echo $faq['faq_id'];?>')"><?php echo $count . '. ' . $faq['faq_question'];?></b></td>
          </tr>
                                        <tr>
                                          <td style="padding-top:5px;display:none;" id="faq_answer_<?php echo $faq['faq_id'];?>">
                                          <table border="0" cellspacing="0" cellpadding="2">
                                            <tr>
                        <td class="main"><?php echo $faq['faq_answer'];?></td>
                          </tr>
                                      <tr>
                                                                <td class="smallText"><?php echo TEXT_LAST_UPDATED . $faq['last_modified'];?></td>
                                                        </tr>
                                                </table></td>
                                        </tr>
                      <tr>
                                                <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10')?></td>
                                        </tr>
<?php
        $count++;
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
