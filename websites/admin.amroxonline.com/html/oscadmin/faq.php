<?php
/*
  $Id: FAQDesk 2.1

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');
  
  $fID = (!empty($HTTP_GET_VARS['fID']) ? (int)$HTTP_GET_VARS['fID'] : 0 );
  $action = (!empty($HTTP_GET_VARS['action']) ? $HTTP_GET_VARS['action'] : '' );
  $languages = tep_get_languages();  
  switch($action){
      case 'setflag':
          if( !empty($fID) && isset($HTTP_GET_VARS['flag']) && ( $HTTP_GET_VARS['flag'] == '1' || $HTTP_GET_VARS['flag'] == '0' ) ){
              tep_db_query('update '.TABLE_FAQ.' set faq_status='.$HTTP_GET_VARS['flag'].' where faq_id='.$fID.'');
					}
	        tep_redirect(tep_href_link(FILENAME_FAQ, (isset($HTTP_GET_VARS['page']) ? 'page='.$HTTP_GET_VARS['page'].'&' : '' ).'iID='.$fID));
        break;
      case 'insert':
      case 'update':
        $sort_order = (int)$HTTP_POST_VARS['sort_order']; 
		//echo $sort_order .'<br>'; 
        $faq_status = !empty($HTTP_POST_VARS['faq_status']) ? '1' : '0';

        $sql_data_array = array('sort_order' => $sort_order,
																'last_modified' => 'now()',
																'faq_status' => $faq_status);

        if ($action == 'insert') {
          tep_db_perform(TABLE_FAQ, $sql_data_array);
          $fID = tep_db_insert_id();
        } elseif ($action == 'update') {
          tep_db_perform(TABLE_FAQ, $sql_data_array, 'update', "faq_id = '".(int)$fID."'");
        }

        for ($i=0,$n=sizeof($languages);$i<$n;$i++) {
          $faq_question_array = $HTTP_POST_VARS['faq_question'];
          $faq_answer_array = $HTTP_POST_VARS['faq_answer'];
          $language_id = $languages[$i]['id'];

          $sql_data_array = array('faq_question' => tep_db_prepare_input($faq_question_array[$language_id]),
																	'faq_answer' => tep_db_prepare_input($faq_answer_array[$language_id]),
																	);

          if ($action == 'insert') {
            $insert_sql_data = array('faq_id' => (int)$fID,
                                     'language_id' => (int)$language_id);
            $sql_data_array = array_merge($sql_data_array, $insert_sql_data);

            tep_db_perform(TABLE_FAQ_DESCRIPTION, $sql_data_array);
          } elseif ($action == 'update') {
            tep_db_perform(TABLE_FAQ_DESCRIPTION, $sql_data_array, 'update', "faq_id = '".(int)$fID."' and language_id = '".(int)$language_id . "'");
          }
        }

        tep_redirect(tep_href_link(FILENAME_FAQ, (isset($HTTP_GET_VARS['page']) ? 'page='.$HTTP_GET_VARS['page'].'&' : '') . 'fID=' . $fID));
        break;
      case 'deleteconfirm':
        $faq_id = tep_db_prepare_input($HTTP_GET_VARS['fID']);

        tep_db_query("delete from " . TABLE_FAQ . " where faq_id = '".(int)$fID."'");
        tep_db_query("delete from " . TABLE_FAQ_DESCRIPTION . " where faq_id = '".(int)$fID."'");

        tep_redirect(tep_href_link(FILENAME_FAQ, 'page=' . $HTTP_GET_VARS['page']));
        break;

	}
  

?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE; ?></title>
<link rel="stylesheet" type="text/css" href="includes/stylesheet.css">
<script language="javascript" src="includes/general.js"></script>
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
<body marginwidth="0" marginheight="0" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" bgcolor="#FFFFFF" onload="SetFocus();">
<!-- header //-->
<?php require(DIR_WS_INCLUDES . 'header.php'); ?>
<!-- header_eof //-->

<!-- body //-->
<table border="0" width="100%" height="80%" cellspacing="2" cellpadding="2">
  <tr>
   <td width="<?php echo BOX_WIDTH; ?>" valign="top"><table border="0" width="<?php echo BOX_WIDTH; ?>" cellspacing="1" cellpadding="1" class="columnLeft">
 <!-- left_navigation //-->
<?php  require(DIR_WS_INCLUDES . 'column_left.php'); ?>
<!-- left_navigation_eof //-->
    </table></td>
<!-- body_text //-->
    <td width="100%" valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2">
      <tr>
        <td width="100%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="pageHeading"><?php echo HEADING_TITLE; ?></td>
          </tr>
        </table></td>
      </tr>
      <tr>
				<td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10')?></td>
			</tr>
<?php
		if ( $action == 'new_faq' || $action == 'edit_faq' ){
		
		  $faq_info_query = tep_db_query('select f.faq_id, fd.language_id,  fd.faq_question, fd.faq_answer, f.last_modified, f.sort_order, f.faq_status from '.TABLE_FAQ.' f,  '.TABLE_FAQ_DESCRIPTION.' fd where f.faq_id=fd.faq_id and f.faq_id='.(int)$fID);
      $faq_info = array();
      $faq_info['faq_question'] = array();
      $faq_info['faq_answer'] = array();

		  while($faq = tep_db_fetch_array($faq_info_query)){
		      $faq_info['status'] = $faq['faq_status'];
		      $faq_info['question'][$faq['language_id']] = $faq['faq_question'];
		      $faq_info['answer'][$faq['language_id']] = $faq['faq_answer'];
		      $faq_info['sort_order'] = $faq['sort_order'];

			}
      $submit = ($action == 'edit_faq' ? tep_image_submit('button_update.gif', IMAGE_UPDATE) : tep_image_submit('button_insert.gif', IMAGE_INSERT));
?>
      <tr>
        <td>
        <?php echo tep_draw_form('new_faq', FILENAME_FAQ, ( empty($fID) ? 'action=insert' : 'action=update&fID='.$fID) );?>
				<table border="0" width="100%" cellspacing="0" cellpadding="2">
          <tr>
						<td class="main" align="right" colspan="2"><?php echo $submit . ' <a href="'.tep_href_link(FILENAME_FAQ, tep_get_all_get_params(array('action'))).'">'.tep_image_button('button_cancel.gif', IMAGE_CANCEL).'</a>' ;?></td>
					</tr>
          <tr>
						<td class="main" valign="top"><?php echo TITLE_STATUS;?></td>
						<td class="main" valign="top"><?php echo TEXT_ON.tep_draw_radio_field('faq_status', '1', ($faq_info['status'] ? true : false) ).'&nbsp;&nbsp;&nbsp;'.TEXT_OFF.tep_draw_radio_field('faq_status', '0', ($faq_info['status'] ? false : true) );?></td>
					</tr>
          <tr>
						<td class="main" valign="top"><?php echo TITLE_SORT;?></td>
						<td class="main" valign="top"><?php echo tep_draw_input_field('sort_order', ( !empty($faq_info['sort_order']) ? $faq_info['sort_order'] : 0 ), ' size="4" ');?></td>
					</tr>
          <tr>
						<td class="main" valign="top"><?php echo TITLE_ADD_QUESTION;?></td>
						<td class="main" valign="top"><table border="0" cellspacing="0" cellpadding="2"><?php
						for($i=0,$x=count($languages);$i<$x;$i++){
								if ( !empty($faq_info['question'][$languages[$i]['id']]) ){
									$faq_question = $faq_info['question'][$languages[$i]['id']];
								} else {
									$faq_question = '';
								}

								echo '<tr>
												<td class="main" valign="top">' . tep_image(DIR_WS_CATALOG_LANGUAGES . $languages[$i]['directory'] . '/images/' . $languages[$i]['image'], $languages[$i]['name'], '', '', '', false).'</td>
												<td class="main" valign="top">' . tep_draw_textarea_field('faq_question['.$languages[$i]['id'].']','soft','70','3',$faq_question) . '</td>
											</tr>';
						}
						?></table></td>
					</tr>
          <tr>
						<td class="main" valign="top"><?php echo TITLE_ADD_ANSWER;?></td>
						<td class="main" valign="top"><table border="0" cellspacing="0" cellpadding="2"><?php
						for($i=0,$x=count($languages);$i<$x;$i++){
								if ( !empty($faq_info['answer'][$languages[$i]['id']]) ){
									$faq_answer = $faq_info['answer'][$languages[$i]['id']];
								} else {
									$faq_answer = '';
								}
						
								echo '<tr>
												<td class="main" valign="top">'.tep_image(DIR_WS_CATALOG_LANGUAGES . $languages[$i]['directory'] . '/images/' . $languages[$i]['image'], $languages[$i]['name'], '', '', '', false).'</td>
												<td class="main" valign="top">'.tep_draw_textarea_field('faq_answer['.$languages[$i]['id'].']','soft','70','10',$faq_answer).'</td>
											</tr>';
						}
						?></table></td>
					</tr>
          <tr>
						<td class="main" align="right" colspan="2"><?php echo $submit . ' <a href="'.tep_href_link(FILENAME_FAQ, tep_get_all_get_params(array('action'))).'">'.tep_image_button('button_cancel.gif', IMAGE_CANCEL).'</a>' ;?></td>
					</tr>
        </table>
				</form>
				</td>
      </tr>
<?php

		} elseif ($action == 'preview_faq'){
		  $plid = (isset($HTTP_GET_VARS['prevlang']) ? $HTTP_GET_VARS['prevlang'] : $languages_id);
      $faq_query = tep_db_query('select f.faq_id, fd.faq_question, fd.faq_answer, f.last_modified, f.sort_order, f.faq_status from '.TABLE_FAQ.' f,  '.TABLE_FAQ_DESCRIPTION.' fd where f.faq_id=fd.faq_id and f.faq_status and fd.language_id=' . (int)$plid . ' order by f.sort_order, fd.faq_id');
?>
			<tr>
			  <td class="main"><?php echo TEXT_CLICK_REVEAL; ?></td>
				<td class="main" align="right"><?php echo '<a href="'.tep_href_link(FILENAME_FAQ, tep_get_all_get_params(array('action'))).'">'.tep_image_button('button_back.gif', IMAGE_BACK).'</a>';?></td>
			</tr>
			<tr>
        <td style="padding-left:20px;"><table border="0" cellspacing="0" cellpadding="0">
<?php
		while($faq = tep_db_fetch_array($faq_query)){
?>
          <tr>
            <td  colspan="2" class="main"><b style="cursor:pointer;" onclick="showItem('faq_answer_<?php echo $faq['faq_id'];?>')"><?php echo $faq['faq_question'];?></b><br><small><?php echo TEXT_LAST_UPDATED.$faq['last_modified'];?></small></td>
          </tr>
		      <tr>
						<td colspan="2"><?php echo tep_draw_separator('pixel_trans.gif', '100%', '5')?></td>
					</tr>
					<tr>
            <td colspan="2" class="main" style="display:none;" id="faq_answer_<?php echo $faq['faq_id'];?>"><?php echo $faq['faq_answer'];?></td>
          </tr>
		      <tr>
						<td colspan="2"><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10')?></td>
					</tr>
<?php
		}
?>
        </td></table>
			</tr>


<?php
		} else {
?>

      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2">
              <tr class="dataTableHeadingRow">
                <td class="dataTableHeadingContent" align="center"><?php echo TABLE_HEADING_FAQ_ID; ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_FAQ_QUESTION; ?></td>
                <td class="dataTableHeadingContent" align="center"><?php echo TABLE_HEADING_FAQ_STATUS; ?></td>
                <td class="dataTableHeadingContent" align="center"><?php echo TABLE_HEADING_FAQ_LAST_MODIFIED; ?></td>
              </tr>
<?php
  $faq_query_numrows = 0;
  $faq_query_raw = 'select f.faq_id, fd.faq_question, fd.faq_answer, f.last_modified, f.sort_order, f.faq_status from '.TABLE_FAQ.' f,  '.TABLE_FAQ_DESCRIPTION.' fd where f.faq_id=fd.faq_id and fd.language_id=' . (int)$languages_id . ' order by f.sort_order, fd.faq_id';
  $faq_split = new splitPageResults($HTTP_GET_VARS['page'], MAX_DISPLAY_SEARCH_RESULTS, $faq_query_raw, $faq_query_numrows);
  $faq_query = tep_db_query($faq_query_raw);
  while ($faq = tep_db_fetch_array($faq_query)) {
    if ((!isset($HTTP_GET_VARS['fID']) || (isset($HTTP_GET_VARS['fID']) && ($HTTP_GET_VARS['fID'] == $faq['faq_id']))) && !isset($fInfo)) {
      $fInfo = new objectInfo($faq);
    }

    if (isset($fInfo) && is_object($fInfo) && ($faq['faq_id'] == $fInfo->faq_id)) {
      echo '              <tr id="defaultSelected" class="dataTableRowSelected" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)" onclick="document.location.href=\'' . tep_href_link(FILENAME_FAQ, 'page=' . $HTTP_GET_VARS['page'] . '&fID=' . $faq['faq_id'] . '&action=edit_faq') . '\'">' . "\n";
    } else {
      echo '              <tr class="dataTableRow" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)" onclick="document.location.href=\'' . tep_href_link(FILENAME_FAQ, 'page=' . $HTTP_GET_VARS['page'] . '&fID=' . $faq['faq_id']) . '\'">' . "\n";
    }
?>
                <td class="dataTableContent" align="center"><?php echo $faq['faq_id']; ?></td>
                <td class="dataTableContent" width="70%"><?php echo $faq['faq_question']; ?></td>
                <td class="dataTableContent" align="center"><?php
      if ($faq['faq_status'] == '1') {
        echo tep_image( DIR_WS_IMAGES . 'icon_status_green.gif', IMAGE_ICON_STATUS_GREEN, 10, 10) . '&nbsp;&nbsp;<a href="' . tep_href_link(FILENAME_FAQ, 'action=setflag&flag=0&fID=' . $faq['faq_id'] ) . '">' . tep_image( DIR_WS_IMAGES . 'icon_status_red_light.gif', IMAGE_ICON_STATUS_RED_LIGHT, 10, 10) . '</a>';
      } else {
        echo '<a href="' . tep_href_link(FILENAME_FAQ, 'action=setflag&flag=1&fID=' . $faq['faq_id']) . '">' . tep_image( DIR_WS_IMAGES . 'icon_status_green_light.gif', IMAGE_ICON_STATUS_GREEN_LIGHT, 10, 10) . '</a>&nbsp;&nbsp;' . tep_image( DIR_WS_IMAGES . 'icon_status_red.gif', IMAGE_ICON_STATUS_RED, 10, 10);
      }
								?></td>
                <td class="dataTableContent" align="center"><?php echo $faq['last_modified']; ?></td>
              </tr>
<?php
  }
?>
              <tr>
                <td colspan="4"><table border="0" width="100%" cellspacing="0" cellpadding="2">
                  <tr>
                    <td class="smallText" valign="top"><?php echo $faq_split->display_count($faq_query_numrows, MAX_DISPLAY_SEARCH_RESULTS, $HTTP_GET_VARS['page'], TEXT_DISPLAY_NUMBER_OF_QUESTIONS); ?></td>
                    <td class="smallText" align="right"><?php echo $faq_split->display_links($faq_query_numrows, MAX_DISPLAY_SEARCH_RESULTS, MAX_DISPLAY_PAGE_LINKS, $HTTP_GET_VARS['page']); ?></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td align="right" colspan="4" class="smallText"><?php echo '<a href="' . tep_href_link(FILENAME_FAQ, 'page='.$HTTP_GET_VARS['page'].'&action=new_faq') . '">' . tep_image_button('button_insert.gif', IMAGE_INSERT) . '</a><br>';
                for($i=0,$x=count($languages);$i<$x;$i++){
                  echo '<a href="' . tep_href_link(FILENAME_FAQ, 'page='.$HTTP_GET_VARS['page'].'&action=preview_faq&prevlang=' . $languages[$i]['id']) . '">' . tep_image_button('button_preview.gif', IMAGE_PREVIEW) . ' ' . tep_image(DIR_WS_CATALOG_LANGUAGES . $languages[$i]['directory'] . '/images/' . $languages[$i]['image'], $languages[$i]['name'], '', '', '', false) . '</a><br>';
                }
                 ?>
                </td>
              </tr>
            </table></td>
<?php
  $heading = array();
  $contents = array();

  switch ($action) {
    case 'delete':
      $heading[] = array('text' => '<b>' . sprintf(TEXT_HEADING_DELETE_INTRO, $fInfo->faq_id) . '</b>');

      $contents = array('form' => tep_draw_form('faq', FILENAME_FAQ, 'page=' . $HTTP_GET_VARS['page'] . '&fID=' . $fInfo->faq_id . '&action=deleteconfirm'));
        $contents[] = array('text' => '<br /><b>'.TEXT_QUESTION.'</b><br />' . $fInfo->faq_question );
        $contents[] = array('text' => '<br /><b>'.TEXT_ANSWER.'</b><br>' . $fInfo->faq_answer );

      if ($fInfo->products_count > 0) {
        $contents[] = array('text' => '<br>' . tep_draw_checkbox_field('delete_products') . ' ' . TEXT_DELETE_PRODUCTS);
        $contents[] = array('text' => '<br>' . sprintf(TEXT_DELETE_WARNING_PRODUCTS, $fInfo->products_count));
      }

      $contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_delete.gif', IMAGE_DELETE) . ' <a href="' . tep_href_link(FILENAME_FAQ, 'page=' . $HTTP_GET_VARS['page'] . '&fID=' . $fInfo->faq_id) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
      break;
    default:
      if (isset($fInfo) && is_object($fInfo)) {
        $heading[] = array('text' => '<b> #' . $fInfo->faq_id . '</b>');

        $contents[] = array('align' => 'center', 'text' => '<a href="' . tep_href_link(FILENAME_FAQ, 'page=' . $HTTP_GET_VARS['page'] . '&fID=' . $fInfo->faq_id . '&action=edit_faq') . '">' . tep_image_button('button_edit.gif', IMAGE_EDIT) . '</a> <a href="' . tep_href_link(FILENAME_FAQ, 'page=' . $HTTP_GET_VARS['page'] . '&fID=' . $fInfo->faq_id . '&action=delete') . '">' . tep_image_button('button_delete.gif', IMAGE_DELETE) . '</a>');

        $contents[] = array('text' => '<br /><b>'.TEXT_QUESTION.'</b><br />' . $fInfo->faq_question );
        $contents[] = array('text' => '<br /><b>'.TEXT_ANSWER.'</b><br>' . $fInfo->faq_answer );
      }
      break;
  }

  if ( (tep_not_null($heading)) && (tep_not_null($contents)) ) {
    echo '            <td width="25%" valign="top">' . "\n";

    $box = new box;
    echo $box->infoBox($heading, $contents);

    echo '            </td>' . "\n";
  }
?>
          </tr>

<?php
		}
?>
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