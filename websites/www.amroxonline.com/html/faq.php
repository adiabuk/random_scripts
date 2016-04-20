<?php
// Fimble 07/02/2009 fixed formatting out for this page
// use the forum for errors
// FAQ DESK v 2.2 
  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_FAQ);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_FAQ));
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta name="author" content="amroxonline.co.uk">
<meta name="keywords" content="amroxonline faq, vps faq, amrox questions ">
<meta name="description" content="FAQ for amroxonline.com services">
<meta name="google-site-verification" content="nGZAIIgKIVYL5JWUSSmaMP1XU_X5RrfbNDLa2TlwfiU">
<title><?php echo TITLE . " - FAQ"; ?></title>


<link rel="shortcut icon" href="images/logo.ico" type="image/x-icon" >
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<?php include(DIR_WS_INCLUDES . 'easy_meta_tags.php'); ?>
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


<script language="JavaScript">
 	function showItem(id){
			var item = document.getElementById(id);
			if (item){
					if (!item.style.display || item.style.display == '' )
					    item.style.display = 'none';
					else
					    item.style.display = '';
			}
	}
</script>
</head>
<body marginwidth="0" marginheight="0" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
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
                                
<?php echo tep_draw3_top();?>

<tr>

<img src="images/faqbanner.jpg" width="712" height="150" alt=""><br>
<br>
        <td width="100%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
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
            <td class="main"><b style="cursor:pointer;" onClick="showItem('faq_answer_<?php echo $faq['faq_id'];?>')"><?php echo $count . '. ' . $faq['faq_question'];?></b></td>
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
        </table></td>
      </tr>
    </table></td>

<!-- body_text_eof //-->
  </tr>
</table>
<!-- body_eof //-->

<!-- footer //-->
<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
<!-- footer_eof //-->
<br>
</body>
</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
