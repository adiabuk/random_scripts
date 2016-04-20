<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>


<style type="text/css">


/* ------------------
 styling for the tables 
   ------------------   */


body
{
	line-height: 1.6em;
}

#hor-minimalist-a
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	background: #fff;
	margin: 45px;
	width: 480px;
	border-collapse: collapse;
	text-align: left;
}
#hor-minimalist-a th
{
	font-size: 14px;
	font-weight: normal;
	color: #039;
	padding: 10px 8px;
	border-bottom: 2px solid #6678b1;
}
#hor-minimalist-a td
{
	color: #669;
	padding: 9px 8px 0px 8px;
}
#hor-minimalist-a tbody tr:hover td
{
	color: #009;
}


#hor-minimalist-b
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	background: #fff;
	margin: 45px;
	width: 480px;
	border-collapse: collapse;
	text-align: left;
}
#hor-minimalist-b th
{
	font-size: 14px;
	font-weight: normal;
	color: #039;
	padding: 10px 8px;
	border-bottom: 2px solid #6678b1;
}
#hor-minimalist-b td
{
	border-bottom: 1px solid #ccc;
	color: #669;
	padding: 6px 8px;
}
#hor-minimalist-b tbody tr:hover td
{
	color: #009;
}


#ver-minimalist
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	margin: 45px;
	width: 480px;
	text-align: left;
	border-collapse: collapse;
}
#ver-minimalist th
{
	padding: 8px 2px;
	font-weight: normal;
	font-size: 14px;
	border-bottom: 2px solid #6678b1;
	border-right: 30px solid #fff;
	border-left: 30px solid #fff;
	color: #039;
}
#ver-minimalist td
{
	padding: 12px 2px 0px 2px;
	border-right: 30px solid #fff;
	border-left: 30px solid #fff;
	color: #669;
}


#box-table-a
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	margin: 45px;
	width: 480px;
	text-align: left;
	border-collapse: collapse;
}
#box-table-a th
{
	font-size: 13px;
	font-weight: normal;
	padding: 8px;
	background: #b9c9fe;
	border-top: 4px solid #aabcfe;
	border-bottom: 1px solid #fff;
	color: #039;
}
#box-table-a td
{
	padding: 8px;
	background: #e8edff; 
	border-bottom: 1px solid #fff;
	color: #669;
	border-top: 1px solid transparent;
}
#box-table-a tr:hover td
{
	background: #d0dafd;
	color: #339;
}


#box-table-b
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	margin: 45px;
	width: 480px;
	text-align: center;
	border-collapse: collapse;
	border-top: 7px solid #9baff1;
	border-bottom: 7px solid #9baff1;
}
#box-table-b th
{
	font-size: 13px;
	font-weight: normal;
	padding: 8px;
	background: #e8edff;
	border-right: 1px solid #9baff1;
	border-left: 1px solid #9baff1;
	color: #039;
}
#box-table-b td
{
	padding: 8px;
	background: #e8edff; 
	border-right: 1px solid #aabcfe;
	border-left: 1px solid #aabcfe;
	color: #669;
}


#hor-zebra
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	margin: 45px;
	width: 480px;
	text-align: left;
	border-collapse: collapse;
}
#hor-zebra th
{
	font-size: 14px;
	font-weight: normal;
	padding: 10px 8px;
	color: #039;
}
#hor-zebra td
{
	padding: 8px;
	color: #669;
}
#hor-zebra .odd
{
	background: #e8edff; 
}


#ver-zebra
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	margin: 45px;
	width: 480px;
	text-align: left;
	border-collapse: collapse;
}
#ver-zebra th
{
	font-size: 14px;
	font-weight: normal;
	padding: 12px 15px;
	border-right: 1px solid #fff;
	border-left: 1px solid #fff;
	color: #039;
}
#ver-zebra td
{
	padding: 8px 15px;
	border-right: 1px solid #fff;
	border-left: 1px solid #fff;
	color: #669;
}
.vzebra-odd
{
	background: #eff2ff;
}
.vzebra-even
{
	background: #e8edff;
}
#ver-zebra #vzebra-adventure, #ver-zebra #vzebra-children
{
	background: #d0dafd;
	border-bottom: 1px solid #c8d4fd;
}
#ver-zebra #vzebra-comedy, #ver-zebra #vzebra-action
{
	background: #dce4ff;
	border-bottom: 1px solid #d6dfff;
}


#one-column-emphasis
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	margin: 45px;
	width: 480px;
	text-align: left;
	border-collapse: collapse;
}
#one-column-emphasis th
{
	font-size: 14px;
	font-weight: normal;
	padding: 12px 15px;
	color: #039;
}
#one-column-emphasis td
{
	padding: 10px 15px;
	color: #669;
	border-top: 1px solid #e8edff;
}
.oce-first
{
	background: #d0dafd;
	border-right: 10px solid transparent;
	border-left: 10px solid transparent;
}
#one-column-emphasis tr:hover td
{
	color: #339;
	background: #eff2ff;
}


#newspaper-a
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	margin: 45px;
	width: 480px;
	text-align: left;
	border-collapse: collapse;
	border: 1px solid #69c;
}
#newspaper-a th
{
	padding: 12px 17px 12px 17px;
	font-weight: normal;
	font-size: 14px;
	color: #039;
	border-bottom: 1px dashed #69c;
}
#newspaper-a td
{
	padding: 7px 17px 7px 17px;
	color: #669;
}
#newspaper-a tbody tr:hover td
{
	color: #339;
	background: #d0dafd;
}


#newspaper-b
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	margin: 45px;
	width: 480px;
	text-align: left;
	border-collapse: collapse;
	border: 1px solid #69c;
}
#newspaper-b th
{
	padding: 15px 10px 10px 10px;
	font-weight: normal;
	font-size: 14px;
	color: #039;
}
#newspaper-b tbody
{
	background: #e8edff;
}
#newspaper-b td
{
	padding: 10px;
	color: #669;
	border-top: 1px dashed #fff;
}
#newspaper-b tbody tr:hover td
{
	color: #339;
	background: #d0dafd;
}


#newspaper-c
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	margin: 45px;
	width: 480px;
	text-align: left;
	border-collapse: collapse;
	border: 1px solid #6cf;
}
#newspaper-c th
{
	padding: 20px;
	font-weight: normal;
	font-size: 13px;
	color: #039;
	text-transform: uppercase;
	border-right: 1px solid #0865c2;
	border-top: 1px solid #0865c2;
	border-left: 1px solid #0865c2;
	border-bottom: 1px solid #fff;
}
#newspaper-c td
{
	padding: 10px 20px;
	color: #669;
	border-right: 1px dashed #6cf;
}


#rounded-corner
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	margin: 45px;
	width: 480px;
	text-align: left;
	border-collapse: collapse;
}
#rounded-corner thead th.rounded-company
{
	background: #b9c9fe url('table-images/left.png') left -1px no-repeat;
}
#rounded-corner thead th.rounded-q4
{
	background: #b9c9fe url('table-images/right.png') right -1px no-repeat;
}
#rounded-corner th
{
	padding: 8px;
	font-weight: normal;
	font-size: 13px;
	color: #039;
	background: #b9c9fe;
}
#rounded-corner td
{
	padding: 8px;
	background: #e8edff;
	border-top: 1px solid #fff;
	color: #669;
}
#rounded-corner tfoot td.rounded-foot-left
{
	background: #e8edff url('table-images/botleft.png') left bottom no-repeat;
}
#rounded-corner tfoot td.rounded-foot-right
{
	background: #e8edff url('table-images/botright.png') right bottom no-repeat;
}
#rounded-corner tbody tr:hover td
{
	background: #d0dafd;
}


#background-image
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	margin: 4px;
	width: 100%;
	text-align: left;
	border-collapse: collapse;
	background: url('table-images/mycentos.pngxxx') 330px 59px no-repeat;
}
#background-image th
{
	padding: 12px;
	font-weight: normal;
	font-size: 14px;
	color: #339;
}
#background-image td
{
	padding: 9px 12px;
	color: #669;
	border-top: 1px solid #fff;
}
#background-image tfoot td
{
	font-size: 11px;
}
#background-image tbody td
{
	background: url('table-images/back.png');
}
* html #background-image tbody td
{
	/* 
	   ----------------------------
		PUT THIS ON IE6 ONLY STYLE 
		AS THE RULE INVALIDATES
		YOUR STYLESHEET
	   ----------------------------
	*/
	filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='table-images/back.png',sizingMethod='crop');
	background: none;
}	
#background-image tbody tr:hover td
{
	color: #339;
	background: none;
}


#gradient-style
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	margin: 45px;
	width: 480px;
	text-align: left;
	border-collapse: collapse;
}
#gradient-style th
{
	font-size: 13px;
	font-weight: normal;
	padding: 8px;
	background: #b9c9fe url('table-images/gradhead.png') repeat-x;
	border-top: 2px solid #d3ddff;
	border-bottom: 1px solid #fff;
	color: #039;
}
#gradient-style td
{
	padding: 8px; 
	border-bottom: 1px solid #fff;
	color: #669;
	border-top: 1px solid #fff;
	background: #e8edff url('table-images/gradback.png') repeat-x;
}
#gradient-style tfoot tr td
{
	background: #e8edff;
	font-size: 12px;
	color: #99c;
}
#gradient-style tbody tr:hover td
{
	background: #d0dafd url('table-images/gradhover.png') repeat-x;
	color: #339;
}


#pattern-style-a
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	margin: 45px;
	width: 480px;
	text-align: left;
	border-collapse: collapse;
	background: url('table-images/pattern.png');
}
#pattern-style-a thead tr
{
	background: url('table-images/pattern-head.png');
}
#pattern-style-a th
{
	font-size: 13px;
	font-weight: normal;
	padding: 8px;
	border-bottom: 1px solid #fff;
	color: #039;
}
#pattern-style-a td
{
	padding: 8px; 
	border-bottom: 1px solid #fff;
	color: #669;
	border-top: 1px solid transparent;
}
#pattern-style-a tbody tr:hover td
{
	color: #339;
	background: #fff;
}


#pattern-style-b
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	margin: 45px;
	width: 480px;
	text-align: left;
	border-collapse: collapse;
	background: url('table-images/patternb.png');
}
#pattern-style-b thead tr
{
	background: url('table-images/patternb-head.png');
}
#pattern-style-b th
{
	font-size: 13px;
	font-weight: normal;
	padding: 8px;
	border-bottom: 1px solid #fff;
	color: #039;
}
#pattern-style-b td
{
	padding: 8px; 
	border-bottom: 1px solid #fff;
	color: #669;
	border-top: 1px solid transparent;
}
#pattern-style-b tbody tr:hover td
{
	color: #339;
	background: #cdcdee;
}
<?php
  require('includes/application_top.php');

  #require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_CENTOS);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_CENTOS));
?>

<?php
$catid= $_REQUEST['cPath'];
#echo $_REQUEST['cPath'];

$image_query="select categories_background,categories_banner from categories where categories_id=" .$catid;
$myimages=mysql_query($image_query) or die(mysql_error());
$banner_array=mysql_fetch_array($myimages);
$mybanner=$banner_array['categories_banner'];
$myback=$banner_array['categories_background'];
?>


#background-image2
{
        font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
        font-size: 12px;
        margin: 4px;
        width: 100%;
        text-align: left;
        border-collapse: collapse;
        background: url('table-images/<?php echo $myback; ?>') 330px 59px no-repeat;
}



</style>


<link rel="shortcut icon" href="images/logo.ico" type="image/x-icon" >
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<?php include(DIR_WS_INCLUDES . 'easy_meta_tags.php'); ?>
<base href="<?php echo (($request_type == 'SSL') ? HTTPS_SERVER : HTTP_SERVER) . DIR_WS_CATALOG; ?>">
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<link rel="stylesheet" type="text/css" href="style.css">

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


        <td class="content_width_td">
<?php
#$catid= $_REQUEST['cPath'];
#echo $_REQUEST['cPath'];

#$image_query="select categories_banner from categories where categories_id=" .$catid;
#$myimages=mysql_query($image_query) or die(mysql_error());
#$banner_array=mysql_fetch_array($myimages);
#$mybanner=$banner_array['categories_banner'];
?>



<img src="images/<?php echo $mybanner?>" width="712" height="150" alt="" ><br>
<br>

        <table border="0" width="100%" cellspacing="0" cellpadding="0" >
        
          <tr>
<!--            <td class="bodytexb"><?php echo ABOUT_TEXT; ?></td>-->
<td class="bodytexb">
<H3>Our Centos VPS products, at a glance...</H3>
<?php
#$catid= $_REQUEST['cPath'];
$quey1="select fixed_name, cost,arch, traffic, bandwidth, harddrive, ram, root, support, contract,buy from fixed_options where category_id=".$catid;

$result=mysql_query($quey1) or die(mysql_error());
$heading = array("","Cost","Architecture","Traffic","Bandwidth","Hard Drive", "RAM","Root Access", "Support","Contract","");

$i=0;
while($row=mysql_fetch_row($result)) $array[$i++]=$row;
echo "<table id='background-image2' >";
for ($x=0;$x<count($array[0]);$x++){
        echo"<tr>";
        echo "<th>" . $heading[$x] . "</th>";
        for ($y=0;$y<count($array);$y++){
                #echo"<td>".$array[$y][$x]."</td>";
if ( $x == 0 ) {
echo"<th>".$array[$y][$x]."</th>";	
} elseif ($x == 10) {
$myval=$array[$y][$x];
$button='<a href="'.tep_href_link("products_new.php","action=buy_now&products_id=".$myval).'">'.tep_image_button('button_buy_now1.gif', '', ' class="btn1"').'</a>';
$button='<a href="'.tep_href_link("product_info.php?products_id=".$myval).'">'.tep_image_button('button_buy_now1.gif', '', ' class="btn1"').'</a>';
#http://www-stag.amroxonline.com/product_info.php?cPath=21_22&products_id=28

    echo "<td><center>$button</center></td>";
} else {
echo"<td>".$array[$y][$x]."</td>";
}


        }
        echo"</tr>";

}
echo"</table>";
echo "FFDSFDSFSDFSDFS";
echo getenv('PATH');
#echo $_REQUEST['cPath'];

######################################
  if (isset($cPath) && tep_not_null($cPath)) {
    $categories_products_query = tep_db_query("select count(*) as total from " . TABLE_PRODUCTS_TO_CATEGORIES . " where categories_id = '" . (int)$current_category_id . "'");
echo  "start" . $categories_products_query . "finish";
    $cateqories_products = tep_db_fetch_array($categories_products_query);
    if ($cateqories_products['total'] > 0) {
      $category_depth = 'products'; // display products
    } else {
      $category_parent_query = tep_db_query("select count(*) as total from " . TABLE_CATEGORIES . " where parent_id = '" . (int)$current_category_id . "'");
      $category_parent = tep_db_fetch_array($category_parent_query);
      if ($category_parent['total'] > 0) {
        $category_depth = 'nested'; // navigate through the categories
      } else {
        $category_depth = 'products'; // category has no products, but display the 'no products' message
      }
    }
  }

s#echo  "poopoo" . $categories_products_query;
####################################echo $_REQUEST['cPath'];


?>



          </tr>
          
        </table></td>
      </tr>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td>
      </tr>
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="2"></td></tr>
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
