<?php
/*
  $Id: header.php,v 1.42 2003/06/10 18:20:38 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

// check if the 'install' directory exists, and warn of its existence
  if (WARN_INSTALL_EXISTENCE == 'true') {
    if (file_exists(dirname($HTTP_SERVER_VARS['SCRIPT_FILENAME']) . '/install')) {
  $messageStack->add('header', WARNING_INSTALL_DIRECTORY_EXISTS, 'warning');   
    }
  }

// check if the configure.php file is writeable
  if (WARN_CONFIG_WRITEABLE == 'true') {
    if ( (file_exists(dirname($HTTP_SERVER_VARS['SCRIPT_FILENAME']) . '/includes/configure.php')) && (is_writeable(dirname($HTTP_SERVER_VARS['SCRIPT_FILENAME']) . '/includes/configure.php')) ) {
   $messageStack->add('header', WARNING_CONFIG_FILE_WRITEABLE, 'warning');   
    }
  }

// check if the session folder is writeable
  if (WARN_SESSION_DIRECTORY_NOT_WRITEABLE == 'true') {
    if (STORE_SESSIONS == '') {
      if (!is_dir(tep_session_save_path())) {
        $messageStack->add('header', WARNING_SESSION_DIRECTORY_NON_EXISTENT, 'warning');
      } elseif (!is_writeable(tep_session_save_path())) {
        $messageStack->add('header', WARNING_SESSION_DIRECTORY_NOT_WRITEABLE, 'warning');
      }
    }
  }

// check session.auto_start is disabled
  if ( (function_exists('ini_get')) && (WARN_SESSION_AUTO_START == 'true') ) {
    if (ini_get('session.auto_start') == '1') {
      $messageStack->add('header', WARNING_SESSION_AUTO_START, 'warning');
    }
  }

  if ( (WARN_DOWNLOAD_DIRECTORY_NOT_READABLE == 'true') && (DOWNLOAD_ENABLED == 'true') ) {
    if (!is_dir(DIR_FS_DOWNLOAD)) {
      $messageStack->add('header', WARNING_DOWNLOAD_DIRECTORY_NON_EXISTENT, 'warning');
    }
  }

  if ($messageStack->size('header') > 0) {
    echo $messageStack->output('header');
  }
?>

<!-- start -->
<?php
  if (isset($HTTP_GET_VARS['error_message']) && tep_not_null($HTTP_GET_VARS['error_message'])) {
?>

<table border="0" width="100%" cellspacing="0" cellpadding="2">
  <tr class="headerError">
    <td class="headerError"><?php echo htmlspecialchars(stripslashes(urldecode($HTTP_GET_VARS['error_message']))); ?></td>
  </tr>
</table>
<?php
  }

  if (isset($HTTP_GET_VARS['info_message']) && tep_not_null($HTTP_GET_VARS['info_message'])) {
?>
<table border="0" width="100%" cellspacing="0" cellpadding="2">
  <tr class="headerInfo">
    <td class="headerInfo"><?php echo htmlspecialchars(stripslashes(urldecode($HTTP_GET_VARS['info_message']))); ?></td>
  </tr>
</table>
<?php
  }
?>

<?php

if ($_SERVER['HTTPS'] !="on") {
echo '<div class="addthis_toolbox addthis_default_style "><a class="addthis_button_preferred_1"></a><a class="addthis_button_preferred_2"></a><a class="addthis_button_preferred_3"></a><a class="addthis_button_preferred_4"></a><a class="addthis_button_compact"></a><a class="addthis_counter addthis_bubble_style"></a></div><script type="text/javascript">var addthis_config ={"data_track_clickback":true};</script><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4e0cadb5520aa123"></script>';
}
?>

<!-- start -->
<table cellpadding="0" cellspacing="0" border="0" align="center" class="width_table">
<tr>
  <td class="width_td"><table cellpadding="0" cellspacing="0" border="0" align="center" style="height:100%;">
    <tr>
      <td class="row_1"><table cellpadding="0" cellspacing="0" border="0">
          <tr>
            <td><table cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td class="logo"><a href="<?php echo tep_href_link('index.php')?>"><?php echo tep_image(DIR_WS_IMAGES.'logo.gif');?></a></td>
                  <td class="header"><table cellpadding="0" cellspacing="0" border="0" class="header_wrapper_table">
                      <tr>
                        <td></td>
                        <td ></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td ></td>
                        <td class="header_wrapper_c"><table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                              <td style="width:49%;"><table border="0" cellspacing="0" cellpadding="0" align="center" style="width:154px;">
                                  <tr>
                                    <td class="infoBoxHeading7_td" style="width:100%;height:28px;">Already Registered? &nbsp;&nbsp;<?php echo TEXT_GREETING_LOGIN ?></td>
                                  </tr>
                                </table></td>
                              <td><?php echo tep_image(DIR_WS_IMAGES.'part.gif')?></td>
                              <td style="width:1%;"><table border="0" cellspacing="0" cellpadding="0" align="center" style="width:161px;">
                                  <tr>
                                    <td class="infoBoxHeading7_td"><?php echo TEXT_GREETING_SIGNUP ?> </td>
                                  </tr>
                                </table></td>
                            </tr>
                          </table></td>
                        <td class="header_wrapper_r"></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td class="header_wrapper_b"></td>
                        <td></td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td><table cellpadding="0" cellspacing="0" border="0" class="menu">
                <tr>
                  <td class="td"><table cellpadding="0" cellspacing="0" border="0" class="table">
                      <tr>
                        <td><table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                              <?php          
  switch($tab_sel){
   case 2:
	$item_menu_01 = 'id="over_m1" onMouseOut="this.id=\'over_m1\';" onMouseOver="this.id=\'over_m1\';"';
	$item_menu_02 = 'id="m2" onMouseOut="this.id=\'m2\';" onMouseOver="this.id=\'over_m2\';"';
	$item_menu_03 = 'id="m3" onMouseOut="this.id=\'m3\';" onMouseOver="this.id=\'over_m3\';"';
	$item_menu_04 = 'id="m4" onMouseOut="this.id=\'m4\';" onMouseOver="this.id=\'over_m4\';"';
	$item_menu_05 = 'id="m5" onMouseOut="this.id=\'m5\';" onMouseOver="this.id=\'over_m5\';"';
	$item_menu_06 = 'id="m6" onMouseOut="this.id=\'m6\';" onMouseOver="this.id=\'over_m6\';"';	
	break;

   case 3:
	$item_menu_01 = 'id="m1" onMouseOut="this.id=\'m1\';" onMouseOver="this.id=\'over_m1\';"';
	$item_menu_02 = 'id="over_m2" onMouseOut="this.id=\'over_m2\';" onMouseOver="this.id=\'over_m2\';"';
	$item_menu_03 = 'id="m3" onMouseOut="this.id=\'m3\';" onMouseOver="this.id=\'over_m3\';"';
	$item_menu_04 = 'id="m4" onMouseOut="this.id=\'m4\';" onMouseOver="this.id=\'over_m4\';"';
	$item_menu_05 = 'id="m5" onMouseOut="this.id=\'m5\';" onMouseOver="this.id=\'over_m5\';"';
	$item_menu_06 = 'id="m6" onMouseOut="this.id=\'m6\';" onMouseOver="this.id=\'over_m6\';"';	
	break;

   case 4:
	$item_menu_01 = 'id="m1" onMouseOut="this.id=\'m1\';" onMouseOver="this.id=\'over_m1\';"';
	$item_menu_02 = 'id="m2" onMouseOut="this.id=\'m2\';" onMouseOver="this.id=\'over_m2\';"';
	$item_menu_03 = 'id="over_m3" onMouseOut="this.id=\'over_m3\';" onMouseOver="this.id=\'over_m3\';"';
	$item_menu_04 = 'id="m4" onMouseOut="this.id=\'m4\';" onMouseOver="this.id=\'over_m4\';"';
	$item_menu_05 = 'id="m5" onMouseOut="this.id=\'m5\';" onMouseOver="this.id=\'over_m5\';"';
	$item_menu_06 = 'id="m6" onMouseOut="this.id=\'m6\';" onMouseOver="this.id=\'over_m6\';"';	
	break;

   case 5:
	$item_menu_01 = 'id="m1" onMouseOut="this.id=\'m1\';" onMouseOver="this.id=\'over_m1\';"';
	$item_menu_02 = 'id="m2" onMouseOut="this.id=\'m2\';" onMouseOver="this.id=\'over_m2\';"';
	$item_menu_03 = 'id="m3" onMouseOut="this.id=\'m3\';" onMouseOver="this.id=\'over_m3\';"';
	$item_menu_04 = 'id="over_m4" onMouseOut="this.id=\'over_m4\';" onMouseOver="this.id=\'over_m4\';"';
	$item_menu_05 = 'id="m5" onMouseOut="this.id=\'m5\';" onMouseOver="this.id=\'over_m5\';"';
	$item_menu_06 = 'id="m6" onMouseOut="this.id=\'m6\';" onMouseOver="this.id=\'over_m6\';"';	
	break;

   case 6:
	$item_menu_01 = 'id="m1" onMouseOut="this.id=\'m1\';" onMouseOver="this.id=\'over_m1\';"';
	$item_menu_02 = 'id="m2" onMouseOut="this.id=\'m2\';" onMouseOver="this.id=\'over_m2\';"';
	$item_menu_03 = 'id="m3" onMouseOut="this.id=\'m3\';" onMouseOver="this.id=\'over_m3\';"';
	$item_menu_04 = 'id="m4" onMouseOut="this.id=\'m4\';" onMouseOver="this.id=\'over_m4\';"';
	$item_menu_05 = 'id="over_m5" onMouseOut="this.id=\'over_m5\';" onMouseOver="this.id=\'over_m5\';"';
	$item_menu_06 = 'id="m6" onMouseOut="this.id=\'m6\';" onMouseOver="this.id=\'over_m6\';"';	
	break;

   case 7:
	$item_menu_01 = 'id="m1" onMouseOut="this.id=\'m1\';" onMouseOver="this.id=\'over_m1\';"';
	$item_menu_02 = 'id="m2" onMouseOut="this.id=\'m2\';" onMouseOver="this.id=\'over_m2\';"';
	$item_menu_03 = 'id="m3" onMouseOut="this.id=\'m3\';" onMouseOver="this.id=\'over_m3\';"';
	$item_menu_04 = 'id="m4" onMouseOut="this.id=\'m4\';" onMouseOver="this.id=\'over_m4\';"';
	$item_menu_05 = 'id="m5" onMouseOut="this.id=\'m5\';" onMouseOver="this.id=\'over_m5\';"';
	$item_menu_06 = 'id="over_m6" onMouseOut="this.id=\'over_m6\';" onMouseOver="this.id=\'over_m6\';"';
	break;

   default:
	$item_menu_01 = 'id="m1" onMouseOut="this.id=\'m1\';" onMouseOver="this.id=\'over_m1\';"';
	$item_menu_02 = 'id="m2" onMouseOut="this.id=\'m2\';" onMouseOver="this.id=\'over_m2\';"';
	$item_menu_03 = 'id="m3" onMouseOut="this.id=\'m3\';" onMouseOver="this.id=\'over_m3\';"';
	$item_menu_04 = 'id="m4" onMouseOut="this.id=\'m4\';" onMouseOver="this.id=\'over_m4\';"';
	$item_menu_05 = 'id="m5" onMouseOut="this.id=\'m5\';" onMouseOver="this.id=\'over_m5\';"';
	$item_menu_06 = 'id="m6" onMouseOut="this.id=\'m6\';" onMouseOver="this.id=\'over_m6\';"';
  }
?>
                            <tr>
                              <td <?php echo $item_menu_01;?> onClick="document.location='<?php echo tep_href_link('index.php')?>'" nowrap="nowrap"><? printf(BOX_MANUFACTURER_INFO_HOMEPAGE,"")?></td>
                              <td class="menu_separator"><?php echo tep_image(DIR_WS_IMAGES.'menu_separator.gif')?></td>
                              <td <?php echo $item_menu_02;?> onClick="document.location='<?php echo tep_href_link('about.php')?>'" nowrap="nowrap"><? printf(BOX_HEADING_ABOUT,"")?></td>
                              <td class="menu_separator"><?php echo tep_image(DIR_WS_IMAGES.'menu_separator.gif')?></td>
                              <td <?php echo $item_menu_03;?> onClick="document.location='<?php echo tep_href_link('index.php?cPath=21')?>'"><?php echo "Linux VPS" ?></td>
                              <!--<td class="menu_separator"><?php echo tep_image(DIR_WS_IMAGES.'menu_separator.gif')?></td>
                              <td <?php echo $item_menu_04;?> onClick="document.location='<?php echo tep_href_link('index.php?cPath=32')?>'"><?php echo "Web Desktop" ?></td>-->
                              <td class="menu_separator"><?php echo tep_image(DIR_WS_IMAGES.'menu_separator.gif')?></td>
                              <?php if (tep_session_is_registered('customer_id')) {

                         $acc_link = tep_href_link('account.php');
                         $acc_title= HEADER_TITLE_MY_ACCOUNT;
                        } else{
                         $acc_link = tep_href_link('login.php');
                         $acc_title= HEADER_TITLE_LOGIN;
                        }
                ?>
                              <td <?php echo $item_menu_05;?> onClick="document.location='<?php echo $acc_link;?>'" nowrap="nowrap"><?php echo $acc_title;?></td>
                              <td class="menu_separator"><?php echo tep_image(DIR_WS_IMAGES.'menu_separator.gif')?></td>
                              <td <?php echo $item_menu_06;?> onClick="document.location='<?php echo tep_href_link('contact_us.php')?>'"><?php echo BOX_INFORMATION_CONTACT?></td>
                              <td class="menu_separator"><?php echo tep_image(DIR_WS_IMAGES.'menu_separator.gif')?></td>
                              <td <?php echo $item_menu_06;?> onClick="document.location='<?php echo tep_href_link('faq.php')?>'"><?php echo "faq"?></td>
                              <td class="menu_separator"><?php echo tep_image(DIR_WS_IMAGES.'menu_separator.gif')?></td>
                            </tr>
                          </table></td>
                        <td style="padding:7px 19px 0px 175px; vertical-align:top;"><table cellpadding="0" cellspacing="0" border="0" align="right" style="width:184px;">
                            <tr>
                              <td class="z1"><strong><?php echo BOX_HEADING_SHOPPING_CART;?>:</strong>&nbsp;&nbsp;<a href="<?php echo tep_href_link('shopping_cart.php')?>"><?php echo $cart->count_contents()?> item(s)</a></td>
                            </tr>
                          </table>
                          </form>
                        </td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td class="row_2">
