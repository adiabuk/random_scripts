<?php
/*
  $Id: search.php,v 1.22 2003/02/10 22:31:05 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/
?>
<!-- search //-->
          <tr>
            <td style="border-bottom:#bdc1ae solid 1px;">
<?php
  $info_box_contents = array();
  $info_box_contents[] = array('text' => BOX_HEADING_SEARCH);

  new infoBoxHeading7($info_box_contents, false, false);

  $info_box_contents = array();
  $info_box_contents[] = array('form' => tep_draw_form('quick_find', tep_href_link(FILENAME_ADVANCED_SEARCH_RESULT, '', 'NONSSL', false), 'get'),
                               'align' => 'center',
                               'text' => '
						<div>
							<div class="ofh" style="padding:0px 0px 5px 0px;">
								<div class="fl_left text_search">'. tep_draw_input_field('keywords', '', 'size="10" maxlength="30"  class="input"') . '' . tep_hide_session_id() .  '</div>
								<div class="fl_left button_search">' . tep_hide_session_id() . tep_image_submit('button_quick_find.gif', BOX_HEADING_SEARCH,'') . '</div>
								
							</div>
						</div>
						<div align="left" style="padding:0px 0px 2px 0px;"><a href="' . tep_href_link(FILENAME_ADVANCED_SEARCH) . '"><b>' . BOX_SEARCH_ADVANCED_SEARCH . '</b></a></div>');

    new infoBox7($info_box_contents);
?>
            </td>
          </tr>
<!-- search_eof //-->

<tr>
<pre style="padding:0px;margin:0px;height:0px;">              </pre>
</tr>


