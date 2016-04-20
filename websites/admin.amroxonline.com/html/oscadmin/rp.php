<?php
  require('includes/application_top.php');
  $detailsFound = false;
  if(isset($HTTP_GET_VARS['rpId']) and strlen($HTTP_GET_VARS['rpId'])>0){
      $rp_profile_id_arr[] = $HTTP_GET_VARS['rpId'];
  }else{
      // get all the distinct profiles
      $sql = "select distinct(rp_profile_id) from orders_products where rp_profile_id is not null order by orders_id asc";
      $rs = tep_db_query($sql);
      $rp_profile_id = array();
      while($row = tep_db_fetch_array($rs)){
          $rp_profile_id_arr[] = $row['rp_profile_id'];
      }
  }
  $filterArr = array('Active', 'Pending', 'Cancelled', 'Suspended', 'Expired');
  $filter = false;
  if(isset($HTTP_GET_VARS['filter'])){
      if(in_array($HTTP_GET_VARS['filter'], $filterArr)){
          $filter = $HTTP_GET_VARS['filter'];
      }
  }
  // rp require
  require_once(DIR_WS_CLASSES . 'paypal_rp.php');
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE; ?></title>
<link rel="stylesheet" type="text/css" href="includes/stylesheet.css">
<script language="javascript" src="includes/general.js"></script>
<script type="text/javascript">

function showMe (it) {
    var vis = "block";
    if(document.getElementById(it).style.display == "block"){
        var vis = "none";
    }
    document.getElementById(it).style.display = vis;
}

</script>
<link rel="stylesheet" type="text/css" href="includes/javascript/spiffyCal/spiffyCal_v2_1.css">
<script language="JavaScript" src="includes/javascript/spiffyCal/spiffyCal_v2_1.js"></script>
<script language="javascript"><!--
var dateFrom = new ctlSpiffyCalendarBox("dateFrom", "rp_search", "rp_from","btnDate1","",scBTNMODE_CUSTOMBLUE);
//--></script>
<script language="javascript"><!--
var dateTo = new ctlSpiffyCalendarBox("dateTo", "rp_search", "rp_to","btnDate2","",scBTNMODE_CUSTOMBLUE);
//--></script>
</head>
<div id="spiffycalendar" class="text"></div>
<body marginwidth="0" marginheight="0" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" bgcolor="#FFFFFF">
<!-- header //-->
<?php
  require(DIR_WS_INCLUDES . 'header.php');
?>
<!-- header_eof //-->

<!-- body //-->
<table border="0" width="100%" cellspacing="2" cellpadding="2">
  <tr>
    <td width="<?php echo BOX_WIDTH; ?>" valign="top"><table border="0" width="<?php echo BOX_WIDTH; ?>" cellspacing="1" cellpadding="1" class="columnLeft">
<!-- left_navigation //-->
<?php require(DIR_WS_INCLUDES . 'column_left.php'); ?>
<!-- left_navigation_eof //-->
    </table></td>
<!-- body_text //-->
    <td width="100%" valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2">

<form id='rp_search' name='rp_search' action="<?php print $_SERVER['PHP_SELF'];?>" method="GET">
<TABLE align="center" width="70%">
<tr>
<td colspan="2"><b>Search</b></td>
</tr>
<td>Profile Id:</td>
<td><?php print tep_draw_input_field('rpId', '', '');?></td>
<tr>
<td>Filter:</td>
<td><?php print tep_draw_pull_down_menu('filter', array(array('id' => 'off', 'text' => 'Off'),array('id' => 'Active', 'text' => 'Active'),array('id' => 'Pending', 'text' => 'Pending'),array('id' => 'Cancelled', 'text' => 'Cancelled'),array('id' => 'Suspended', 'text' => 'Suspended'),array('id' => 'Expired', 'text' => 'Expired')),'off');?></td>
</tr>

<?php
$filterArr = array('Active', 'Pending', 'Cancelled', 'Suspended', 'Expired');
?>
<tr>
<td>&nbsp;</td><td><INPUT type="submit" name="search"></td>
</tr>
</TABLE>
</FORM>
<?php
if(!$detailsFound){
?>
<br>
    <table align="center" bgcolor="#AAAAAA" border="0" cellpadding="0" cellspacing="0" width="80%"><tr><td><table align="center" border="0" cellpadding="5" cellspacing="1" width="100%">
<tr><td class="replicabg" colspan="11"></td></tr>

<tr bgcolor="#CCDDEE">
<td class="smallEmphasis" nowrap> Profile Id</td>
<td class="smallEmphasis" nowrap> Subscriber Name</td>
<td class="smallEmphasis" nowrap> Profile Start Date</td>
<td class="smallEmphasis" nowrap> Last Payment Date</td>
<td class="smallEmphasis" nowrap> Next Billing Date</td>
<td class="smallEmphasis" nowrap> # Cycles Completed</td>
<td class="smallEmphasis" nowrap> # Cycles Remaining</td>
<td class="smallEmphasis" nowrap> Status</td>
<td class="smallEmphasis" nowrap> Details</td>

</tr>
<?php
if(count($rp_profile_id_arr) >0){
    $color1 = '#FFFFFF';
    $color2 = '#EEEEEE';
    $i=0;
    foreach ($rp_profile_id_arr as $rpId){
        if($rpId == $HTTP_GET_VARS['rpId']){
            if($HTTP_POST_VARS['updateStatus'] == 'change'){
                if(strlen(trim($HTTP_POST_VARS['notes']))>0){
                    $note = $HTTP_POST_VARS['notes'];
                }else{
                    $note = false;
                }
                $rp = new paypal_rp(1);  // init rp class
                $stat = $rp->manageRecurringPaymentsProfileStatus($rpId, $HTTP_POST_VARS['changeSTATUS'], $note);
                if($stat and !is_array($stat)){
                    $updatedSuccess = true;
                }else{
                    $updatedSuccess = false;
                }
            }
            if($HTTP_POST_VARS['updateStatus'] == 'update'){
                if(strlen(trim($HTTP_POST_VARS['notes']))>0){
                    $note = $HTTP_POST_VARS['notes'];
                }else{
                    $note = false;
                }
                $rp = new paypal_rp(1);  // init rp class
                $stat = $rp->updateRecurringPaymentsProfile($rpId, $HTTP_POST_VARS, $note);
                if(is_array($stat)){
                    $updatedSuccess = false;
                }else{
                    $updatedSuccess = true;
                }
            }
            if($HTTP_POST_VARS['updateStatus'] == 'billoutstanding'){
                if(strlen(trim($HTTP_POST_VARS['notes']))>0){
                    $note = $HTTP_POST_VARS['notes'];
                }else{
                    $note = false;
                }
                $rp = new paypal_rp(1);  // init rp class
                $stat = $rp->billOutstandingAmount($rpId, $HTTP_POST_VARS['OUTSTANDINGBALANCE'], $note);
                if(is_array($stat)){
                    $updatedSuccess = false;
                }else{
                    $updatedSuccess = true;
                }
            }
        }
        $rp = new paypal_rp(1);  // init rp class
        $arr = $rp->getRpData($rpId);
        // outstanding bal check
        if($arr['OUTSTANDINGBALANCE'] > 0){
            $outstandingBal = true;
        }else{
            $outstandingBal = false;
        }

        if($filter){
            if($arr['STATUS'] != $filter){
                continue;
            }
        }
        $row_color = ($i % 2) ? $color1 : $color2;
        if($arr){
            if(is_array($stat)){
                $f=0;
                $messages=true;
                $errStatStr = '<font color="red"><b>Error</b></font>';
                while($messages==true){
                    if(!array_key_exists('L_LONGMESSAGE'.$f, $stat)){
                        $messages =false;
                    }
                    $errStatStr .= '<br>&nbsp;&nbsp;&nbsp;'.$stat['L_LONGMESSAGE'.$f];
                    $f++;
                }
                $errStatStr .= '<br>';
                ?>
        <tr bgcolor="<?php print $row_color;?>">
        <td class="small" nowrap colspan="9" align="left"><?php print $errStatStr;?></td>
        </tr>
                <?php
            }

    ?>
        <tr bgcolor="<?php print $row_color;?>">
        <td class="small" nowrap> <?php print $arr['PROFILEID'];?></td>
        <td class="small" nowrap> <?php print $arr['SUBSCRIBERNAME'];?></td>
        <td class="small" nowrap> <?php print substr($arr['PROFILESTARTDATE'], 0, 10);?></td>
        <td class="small" nowrap> <?php print substr($arr['LASTPAYMENTDATE'], 0 , 10);?></td>
        <td class="small" nowrap> <?php print substr($arr['NEXTBILLINGDATE'], 0, 10);?></td>
        <td class="small" nowrap> <?php print $arr['NUMCYCLESCOMPLETED'];?></td>
        <td class="small" nowrap> <?php print $arr['NUMCYCLESREMAINING'];?></td>
        <td class="small" nowrap> <?php print $arr['STATUS'];?></td>
        <td class="small" nowrap> <a href="javascript:showMe('<?php print trim(str_replace('-', '', $arr['PROFILEID']));?>')">details</a></td>
        </tr>
        <tr>
        <td nowrap colspan="9" align="center" height="1">
        <?php
        if($rpId == $HTTP_GET_VARS['rpId']){
        ?>
        <div id="<?php print trim(str_replace('-','',$arr['PROFILEID']));?>" style="display:block;">
        <?php
        }else{
        ?>
        <div id="<?php print trim(str_replace('-','',$arr['PROFILEID']));?>" style="display:none;">
        <?php
        }
        ?>
            <table align="center" bgcolor="#AAAAAA" border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                <?php
                $ccKeyArr = array(
                    'CREDITCARDTYPE',
                    'ACCT',
                    'EXPDATE',
                    'CVV2',
                    'STARTDATE',
                    'ISSUENUMBER'
                );
      foreach ($arr as $key => $value){
          $skipArr = array('PROFILEID');
          if(in_array($key, $skipArr)){
              continue;
          }
          // cc array
          if(in_array($key, $ccKeyArr)){
              continue;
          }
          // do they have an outstanding ballance
          if($outstandingBal){
              // yes they do
              ?>
              <form name='statusForm' action="<?php print $_SERVER['PHP_SELF'];?>?rpId=<?php print $arr['PROFILEID'];?>" method="POST">
              <input type="hidden" name="updateStatus" value="billoutstanding">
              <?php
              print '<tr class="dataTableRow"><td class="dataTableContent" colspan="4" class="dataTableContent">&nbsp;<br>&nbsp;</td></tr>';
              print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent" valign="top"><font color="red"><b>Outstanding Balance<b></font><td colspan="3" class="dataTableContent" align="left">&nbsp;</td></tr>';
              print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate('OUTSTANDINGBALANCE', $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_input_field('OUTSTANDINGBALANCE', $arr['OUTSTANDINGBALANCE'],'').'</td></tr>';
              print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent" valign="top">&nbsp;<td colspan="3" class="dataTableContent" align="left"><br><input type="submit" value="Bill Out Standing" name="submit"></td></tr>';
              print "</form>";
              print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent" colspan="4" align="center"><BR><hr width="90%"><br></td></tr>';
              $outstandingBal = false;
          }

          if($key == 'STATUS'){
              ?>
                <form name='statusForm' action="<?php print $_SERVER['PHP_SELF'];?>?rpId=<?php print $arr['PROFILEID'];?>" method="POST">
                <input type="hidden" name="updateStatus" value="change">
              <?php

              $update_status_arr = array(
                'Cancel',
                'Suspend',
                'Reactivate',
              );
              $updateOptionStr = '';
              foreach ($update_status_arr as $tkey => $disVal){
                  if($tkey == 0){
                    $updateOptionStr .= '<option value="'.$disVal.'" selected>'.$disVal.'</option>';
                  }else{
                    $updateOptionStr .= '<option value="'.$disVal.'">'.$disVal.'</option>';
                  }
              }
            print '<tr class="dataTableRow"><td class="dataTableContent" colspan="4" class="dataTableContent">&nbsp;<br>&nbsp;</td></tr>';
            print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent" valign="top">Change '.$rp->fieldTranslate($key, $language).'</td><td colspan="3" class="dataTableContent" align="left" valign="top"><select name="change'.$key.'">'.$updateOptionStr.'</select></td></tr>';
            print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent" valign="top">Notes (optional):</td><td colspan="3" class="dataTableContent" align="left" valign="top"<textarea name="notes"  cols="66" rows="2"></textarea></td></tr>';
            print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent" valign="top">&nbsp;<td colspan="3" class="dataTableContent" align="left"><br><input type="submit" value="Update Status" name="submit"></td></tr>';
            ?>
            </form>
            <?php
          }elseif ($key == 'AUTOBILLOUTAMT'){
              print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent" colspan="4" align="center"><BR><hr width="90%"><br></td></tr>';
              print '<form  method="POST" name="updateProfileForm" action="'.$_SERVER['PHP_SELF'].'?rpId='.$arr['PROFILEID'].'">';
              print '<input type="hidden" name="updateStatus" value="update">';
              print  '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate($key, $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_pull_down_menu($key, array(array('id' => 'NoAutoBill', 'text' => 'NoAutoBill'),array('id' => 'AddToNextBilling', 'text' => 'AddToNextBilling')),$value) .'</td></tr>';
          }elseif ($key == 'DESC'){
              print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent" valign="top">'.$rp->fieldTranslate($key, $language).'</td><td colspan="3" class="dataTableContent"><textarea name="'.$key.'" cols="66" rows="2">'.$value.'</textarea></td></tr>';
          }elseif ($key == 'MAXFAILEDPAYMENTS'){
              $numArr = range($value, 10);
              // build dropdown array
              $pullArr = array();
              foreach ($numArr as $theNum){
                  $pullArr[]['id'] = $theNum;
                  $pullArr[count($pullArr)-1]['text'] = $theNum;
              }
              print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate($key, $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_pull_down_menu($key,$pullArr, $value).'</td></tr>';
          }elseif (in_array($key, array('SUBSCRIBERNAME', 'SHIPTONAME', 'SHIPTOSTREET', 'SHIPTOSTREET2', 'SHIPTOCITY', 'SHIPTOSTATE', 'SHIPTOZIP', 'SHIPTOPHONENUM', 'SHIPTOCOUNTRYCODE', 'FIRSTNAME', 'LASTNAME', 'STREET','STREET2',
          'CITY', 'STATE', 'COUNTRYCODE', 'ZIP', 'PHONENUM', 'TAXAMT', 'SHIPPINGAMT','AMT', 'TRIALAMT', 'TRIALBILLINGFREQUENCY', 'TRIALTOTALBILLINGCYCLES', 'TOTALBILLINGCYCLES','BILLINGFREQUENCY','TRIALBILLINGFREQUENCY'))){
              print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate($key, $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_input_field($key, $value,'').'</td></tr>';
              if($key == 'SHIPTOSTREET' or $key == 'STREET'){
                  if(!array_key_exists($key.'2', $arr)){
                    print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate($key.'2', $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_input_field($key.'2', '','').'</td></tr>';
                  }
              }
          //}elseif ($key == 'TOTALBILLINGCYCLES'){
          //    print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate($key, $language).'</td><td colspan="3" class="dataTableContent">'.$value.'&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;Number of cycles to add: '.tep_draw_input_field('ADDITIONALBILLINGCYCLES', '0',' maxlength="5" size="5"').'</td></tr>';
          }elseif(in_array($key, array('BILLINGPERIOD', 'TRIALBILLINGPERIOD'))){
              $periodArr = array(
                'Day',
                'Week',
                'SemiMonth',
                'Month',
                'Year'
              );
              $periodOptArr = array();
              foreach ($periodArr as $theVal){
                  $periodOptArr[]['id']                         = $theVal;
                  $periodOptArr[count($periodOptArr)-1]['text'] = $theVal;
              }
              print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate($key, $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_pull_down_menu($key,$periodOptArr, $value).'</td></tr>';
          }else{
              print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate($key, $language).'</td><td colspan="3" class="dataTableContent">'.$value.'</td></tr>';
          }
      }  // end foreach loop
      // get the cctypes
      // set the CC types array
      $ccArr = array('VISA'         => 'Visa',
            'MASTERCARD'    => 'MasterCard',
            'DISCOVER'      => 'Discover Card',
            'AMEX'          => 'American Express'
            );
        if(array_key_exists('CREDITCARDTYPE', $arr)){
            $selectedCC = $arr['CREDITCARDTYPE'];
        }else{
            $selectedCC = 'Visa';
        }
        foreach ($ccArr as $tkey => $disVal){
           $ccOptArr[]['id']                        = $disVal;
           $ccOptArr[count($ccOptArr)-1]['text']    = $disVal;
        }
      if(array_key_exists('CREDITCARDTYPE', $arr) and $rp->paymentModule != 'paypal_express'){
          // we have cc info
          // no cc info
          print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate('CREDITCARDTYPE', $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_pull_down_menu('CREDITCARDTYPE',$ccOptArr, $selectedCC).'</td></tr>';
          print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate('ACCT', $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_input_field('ACCT', $arr['ACCT'],'').'</td></tr>';
          print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate('EXPDATE', $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_input_field('EXPDATE', $arr['EXPDATE'],'').'</td></tr>';
          print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate('CVV2', $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_input_field('CVV2', $arr['CVV'],'').'</td></tr>';
          // Maestro or Solo card
          /**
          if(array_key_exists('STARTDATE', $arr)){
            print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate('STARTDATE', $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_input_field('STARTDATE', $arr['STARTDATE'],'').'</td></tr>';
          }else{
            print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate('STARTDATE', $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_input_field('STARTDATE', '','').'</td></tr>';
          }
          if(array_key_exists('ISSUENUMBER', $arr)){
            print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate('ISSUENUMBER', $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_input_field('ISSUENUMBER', $arr['ISSUENUMBER'],'').'</td></tr>';
          }else{
            print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate('ISSUENUMBER', $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_input_field('ISSUENUMBER', '','').'</td></tr>';
          }
          **/
      }elseif($rp->paymentModule != 'paypal_express'){
          // no cc info
          print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate('CREDITCARDTYPE', $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_pull_down_menu('CREDITCARDTYPE',$ccOptArr, $selectedCC).'</td></tr>';
          print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate('ACCT', $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_input_field('ACCT', '','').'</td></tr>';
          print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate('EXPDATE', $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_input_field('EXPDATE', '','').'</td></tr>';
          print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate('CVV2', $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_input_field('CVV2', '','').'</td></tr>';
          // Maestro or Solo card
          /**
          print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate('STARTDATE', $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_input_field('STARTDATE', '','').'</td></tr>';
          print '<tr class="dataTableRow"><td class="dataTableContent" width="40">&nbsp;</td><td class="dataTableContent">'.$rp->fieldTranslate('ISSUENUMBER', $language).'</td><td colspan="3" class="dataTableContent">'.tep_draw_input_field('ISSUENUMBER', '','').'</td></tr>';
          **/
      }
      ?>
      <tr class="dataTableRow"><td class="dataTableContent" colspan="3" align="center">&nbsp</td><td><br><input type="submit" name="submit" value="Update Profile"></td></tr>
      <tr class="dataTableRow"><td class="dataTableContent" colspan="4" align="center"><br>&nbsp<br>&nbsp</td></tr>
      </form>
                </tr>
            </table>
        </div>
        </td>
        </tr>
    <?php
        }else{ // no data found
    ?>
        <tr bgcolor="<?php print $row_color;?>">
        <td class="small" nowrap colspan="9" align="center">No Data Found (<?php print $rpId;?>)</td>
        </tr>
    <?php
        }
        $i++;
    }
}else{ // rp no data
?>
    <tr bgcolor="#FFFFFF">
    <td class="small" nowrap colspan="9" align="center">No Recurring Profile Data</td>
    </tr>
<?php
}
?>
</table>
<?php
}else{
?>


<?php
}
?>
    </td>
    </tr>
    </TABLE>


<!-- footer //-->
<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
<!-- footer_eof //-->
<br>
</body>
</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>