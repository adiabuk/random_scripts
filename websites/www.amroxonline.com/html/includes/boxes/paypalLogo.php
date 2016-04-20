<?php
/**
 * paypal logo on left col
 */
?>
<!-- PayPal Logo //-->
          <tr>
            <td>
<?php
  $info_box_contents = array();
  $info_box_contents[] = array('text' => '');

  //new infoBoxHeading($info_box_contents, false, false);

  $info_box_contents = array();
  $info_box_contents[] = array('text' => '
  <!-- PayPal Logo -->
  <table border="0" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td align="center"><a href="#" onclick="javascript:window.open(\'https://www.paypal.com/cgi-bin/webscr?cmd=xpt/Marketing/popup/OLCWhatIsPayPal-outside\',\'olcwhatispaypal\',\'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=400, height=350\');"><img  src="https://www.paypal.com/en_US/i/bnr/bnr_paymentsBy_150x40.gif" border="0" alt="Additional Options" width="120"></a></td>
	</tr>
  </table>
  <!-- PayPal Logo -->
  ');

  new infoBox($info_box_contents);
?>
            </td>
          </tr>
<!-- PayPal Logo_eof //-->