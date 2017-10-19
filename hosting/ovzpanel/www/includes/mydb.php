<?php

function compare_pass($plain,$encrypted) {

  if (!tep_validate_password(tep_db_prepare_input($plain),tep_db_prepare_input($encrypted))) {

echo "notvalid<br>";
return false;
}
else {
return true;
}



}

function getpassword($username) {
  $connect = mysql_connect(DB_SERVER, DB_SERVER_USERNAME, DB_SERVER_PASSWORD) or die ("Hey loser, check your server connection.");
  if (!$connect) {
    die ("connected");
  }
  $db_selected = mysql_select_db(DB_DATABASE, $connect);

  if (!$db_selected) {
      die ('Can\'t use foo : ' . mysql_error());
  }
  $query="select customers_id, customers_firstname, customers_password, customers_email_address, customers_default_address_id from customers  where customers_email_address='adiab@hotmail.co.uk'";

  $result=mysql_query($query) or die("dead");

  while ($row = mysql_fetch_assoc($result)) {
    $encry=$row['customers_password']."\n";
  }

return $encry;
}


  function tep_not_null($value) {
    if (is_array($value)) {
      if (sizeof($value) > 0) {
        return true;
      } else {
        return false;
      }
    } else {
      if (($value != '') && (strtolower($value) != 'null') && (strlen(trim($value)) > 0)) {
        return true;
      } else {
        return false;
      }
    }
  }

  function tep_sanitize_string($string) {
    $string = ereg_replace(' +', ' ', trim($string));

    return preg_replace("/[<>]/", '_', $string);
  }



  function tep_db_prepare_input($string) {
    if (is_string($string)) {
      return trim(tep_sanitize_string(stripslashes($string)));
    } elseif (is_array($string)) {
      reset($string);
      while (list($key, $value) = each($string)) {
        $string[$key] = tep_db_prepare_input($value);
      }
      return $string;
    } else {
      return $string;
    }
  }


////
// This funstion validates a plain text password with an
// encrpyted password
  function tep_validate_password($plain, $encrypted) {
    if (tep_not_null($plain) && tep_not_null($encrypted)) {
// split apart the hash / salt
      $stack = explode(':', $encrypted);

      if (sizeof($stack) != 2) return false;
    #  echo "comp1:" . "xxx$stack[1]xxx" . $plain . "\n\n";
    #  echo "comp2:" . $stack[0] . "\n\n";
      if (md5($stack[1] . $plain) == $stack[0]) {
        return true;
      }
    }
    return false;
  }
?>
