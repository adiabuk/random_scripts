<?php
  require('includes/application_top.php');

  #require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_CENTOS);

  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_CENTOS));
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>


<style type="text/css">

<?php
$cpath=$_REQUEST['cPath'];
$catid = substr($cpath, -2);
#echo $_REQUEST['cPath'];

$image_query="select categories_background,categories_banner from categories where categories_id=" .$catid;
$myimages=mysql_query($image_query) or die(mysql_error());
$banner_array=mysql_fetch_array($myimages);
$mybanner=$banner_array['categories_banner'];
$myback=$banner_array['categories_background'];

$name_query="select categories_name from categories_description where categories_id=" .$catid;
$mynamequery=mysql_query($name_query) or die(mysql_error());
$name_array=mysql_fetch_array($mynamequery);
$myname=$name_array['categories_name'];

?>


.background-image_th
{
        font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
        font-size: 14px;
        margin: 4px;
        text-align: left;
        border-collapse: collapse;
        padding: 12px;
        font-weight: normal;
        font-size: 14px;
        color: #339;
}
.background-image_td
{
        font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
        margin: 4px;
        text-align: left;
        border-collapse: collapse;
		background:url('table-images/back.png');
        padding: 9px 12px;
        color: #669;
        border-top: 1px solid #fff;
        font-size: 11px;
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
	
	function _mouseover(x){
		i =0;
		td = document.getElementById(String(x) + String(i));
		while(td){
			td.style.background='none';
			td.style.color='#339';
			i++;
			td = document.getElementById(String(x) + String(i));
		}
	}
	function _mouseout(x){
		i =0;
		td = document.getElementById(String(x) + String(i));
		while(td){
			td.style.background='url(\'table-images/back.png\')';
			td.style.color='#669';
			i++;
			td = document.getElementById(String(x) + String(i));
		}
	}
</script>
<TITLE><?php echo "Amrox Online: Compare our " .$myname . " products"; ?></TITLE>
<meta name="google-site-verification" content="nGZAIIgKIVYL5JWUSSmaMP1XU_X5RrfbNDLa2TlwfiU">

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
<H3>Our <?php echo $myname ?> products, at a glance...</H3><a href=index.php?cPath=<?php echo $cpath;?>>Category View</a>
<?php

$cat_query="select parent_id from categories where categories_id=".$catid;
$cat_parent=mysql_query($cat_query) or die(mysql_error());
$my_cp=@mysql_result($cat_parent,0);

$quey1="select fixed_name, cost,arch, traffic, bandwidth, harddrive, ram, root, support, contract,buy from fixed_options where category_id=".$catid. " and fixed_name NOT LIKE '%Custom%'";
;
$result=mysql_query($quey1) or die(mysql_error());
$heading = array("","Cost","Architecture","Traffic","Bandwidth","Hard Drive", "RAM","Root Access", "Support","Contract","");
$quey_top="select compare_name,cost, versions,repo,harddrive,ram,root,target_cat_id from compare_root where category_id=".$catid . " and compare_name NOT LIKE '%Custom%'";
$result_top=mysql_query($quey_top) or die(mysql_error());

$heading_top = array("","Cost","Versions","Repo","Harddrive", "RAM", "Root","Benifits","");


if ( $my_cp == 0 ) {

######################start no parent ########################
$i=0;
while($row=mysql_fetch_row($result_top)) $array[$i++]=$row;
echo "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background: url('images/".$myback."') 200px 40px no-repeat;\">";
for ($x=0;$x<count($array[0]);$x++){
        echo"<tr>";
        echo "<th class=\"background-image_th\">" . $heading_top[$x] . "</th>";
        for ($y=0;$y<count($array);$y++){
if ( $x == 0 ) {
echo"<th class=\"background-image_th\">".$array[$y][$x]."</th>";
} elseif ($x == 7) {     #x=row number
$myval=$array[$y][$x];
$button='<a href="'.tep_href_link("index.php?cPath=".$myval).'">'.tep_image_button('button_buy_now.gif', '', ' class="btn1"').'</a>';
    echo "<td class=\"background-image_td\" id='".$x.$y."' onMouseover=\"_mouseover(".$x.");\"
 onMouseout=\"_mouseout(".$x.");\"><center>$button</center></td>";
} else {
echo"<td class=\"background-image_td\" id='".$x.$y."' onMouseover=\"_mouseover(".$x.");\"
 onMouseout=\"_mouseout(".$x.");\">".$array[$y][$x]."</td>";
}


        }
        echo"</tr>";

}
echo"</table>";
##############################end no parent ###############################



}
else
{


$i=0;
while($row=mysql_fetch_row($result)) $array[$i++]=$row;
echo "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background: url('images/".$myback."') 200px 40px no-repeat;\">";
for ($x=0;$x<count($array[0]);$x++){
        echo"<tr>";
        echo "<th class=\"background-image_th\">" . $heading[$x] . "</th>";
        for ($y=0;$y<count($array);$y++){
if ( $x == 0 ) {
echo"<th class=\"background-image_th\">".$array[$y][$x]."</th>";	
} elseif ($x == 10) {
$myval=$array[$y][$x];
$button='<a href="'.tep_href_link("product_info.php?products_id=".$myval).'">'.tep_image_button('button_buy_now.gif', '', ' class="btn1"').'</a>';
    echo "<td class=\"background-image_td\" id='".$x.$y."' onMouseover=\"_mouseover(".$x.");\"
 onMouseout=\"_mouseout(".$x.");\"><center>$button</center></td>";
} else {
echo"<td class=\"background-image_td\" id='".$x.$y."' onMouseover=\"_mouseover(".$x.");\"
 onMouseout=\"_mouseout(".$x.");\">".$array[$y][$x]."</td>";
}


        }
        echo"</tr>";

}
echo"</table>";

}
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
