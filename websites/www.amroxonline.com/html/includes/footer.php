<?php
/*
  $Id: footer.php,v 1.26 2003/02/10 22:30:54 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

  require(DIR_WS_INCLUDES . 'counter.php');
?>
		</td></tr>
		<tr><td class="row_3" colspan="3">			

<table cellpadding="0" cellspacing="0" border="0" class="footer_table">
	<tr>
		<td><?php echo tep_image(DIR_WS_IMAGES.'wrapper_footer_tl.gif')?></td>
		<td class="footer_t"><?php echo tep_draw_separator('spacer.gif', '1', '1'); ?></td>
		<td><?php echo tep_image(DIR_WS_IMAGES.'wrapper_footer_tr.gif')?></td>
	</tr>
	<tr>
		<td class="footer_l"><?php echo tep_image(DIR_WS_IMAGES.'footer_l.jpg')?></td>
		<td class="footer_c">
		
			<table cellpadding="0" cellspacing="0" border="0" align="center" class="footer">
				<tr><td><table cellpadding="0" cellspacing="0" border="0" class="footer_td"><tr><td><br />


<?php echo tep_image(DIR_WS_IMAGES.'p1.gif')?><br />
<br />

</td><td>

<?php

if ($_SERVER['HTTPS'] !="on") {

echo '<span id="siteseal"><script type="text/javascript" src="https://seal.starfieldtech.com/getSeal?sealID=8Cl5TsJ2arEGQt6CyoSCD2fH80MFfyQr7FET0htvh3nXEbFNB1QZ"></script><br/><a style="font-family: arial; font-size: 9px" href="http://www.starfieldtech.com" target="_blank">SSL Certificate</a></span>';
}
?>

</td></table></td>
                
                    <td class="footer2_td"><span><a href="<?php echo tep_href_link('advanced_search.php')?>"><?php echo BOX_SEARCH_ADVANCED_SEARCH?></a> &nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;<? if (tep_session_is_registered('customer_id')) { 
?><a href="<?php echo tep_href_link('account.php')?>"><?php echo HEADER_TITLE_MY_ACCOUNT?></a><? } else 
{ ?><a href="<?php echo tep_href_link('create_account.php')?>"><?php echo HEADER_TITLE_CREATE_ACCOUNT?></a><? } 
?> &nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;<? if (tep_session_is_registered('customer_id')) { 
?><a href="<?php echo tep_href_link('logoff.php')?>"><?php echo HEADER_TITLE_LOGOFF?></a><? } else 
{ ?><a href="<?php echo tep_href_link('login.php')?>"><?php echo HEADER_TITLE_LOGIN?></a><? } 
?> &nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp; <a href="<?php echo tep_href_link('privacy.php')?>"><?php echo BOX_INFORMATION_PRIVACY?></a> &nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;<a href="<?php echo tep_href_link('conditions.pdf')?>"><?php echo BOX_INFORMATION_CONDITIONS?></a></span><br>

<?php echo FOOTER_TEXT_BODY?>&nbsp;&nbsp;<br />
</td>
				</tr> 
			</table>
<?php
  if ($banner = tep_banner_exists('dynamic', '468x50')) {
?>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><?php echo tep_display_banner('static', $banner); ?></td>
  </tr>
</table>
<?php
  }
?>
		</td>
		<td class="footer_r"><?php echo tep_image(DIR_WS_IMAGES.'footer_r.jpg')?></td>
	</tr>
	<tr>
		<td><?php echo tep_image(DIR_WS_IMAGES.'wrapper_footer_bl.gif')?></td>
		<td class="footer_b"><?php echo tep_draw_separator('spacer.gif', '1', '1'); ?></td>
		<td><?php echo tep_image(DIR_WS_IMAGES.'wrapper_footer_br.gif')?></td>
	</tr>	
</table>

</td></tr></table>
</td></tr></table>

