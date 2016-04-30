<?

/*
Insert trafic information for host into database
use in test environment only - not PROD

Author: Amro Diab
Date: 20/11/08
*/

$MySQL_Host="test-host";
$MySQL_User="root";
$MySQL_Passw="password";

mysql_connect("$MySQL_Host","$MySQL_User","$MySQL_Passw");

$HN=trim(addslashes($_GET["HN"])); // Hardware Node

$handle = fopen ("tmp/$HN-traffic","r");
while (!feof($handle)) {
  $line = fgets($handle, 4096);
  list($date, $time, $ip, $traffic) = explode(" ",$line);
  if($traffic>0) {
    mysql($db,
      "insert into Traffic (ip,measuringtime,bytes)
      values('$ip','$date $time','$traffic')");
  }
}

fclose($handle);
?>
