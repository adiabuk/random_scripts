<?
 $MySQL_Host="1.1.1.1";
 $MySQL_User="user";
 $MySQL_Passw="password";
 
 mysql_connect("$MySQL_Host","$MySQL_User","$MySQL_Passw","$Amrox_Stag")
   or die ("Couldn't connect to server $Host");
 echo "hello"; 
 $HN=trim(addslashes($_GET["HN"])); // Hardware Node
 
 $handle = fopen ("/var/amrox/stag/scripts/iptables/vz-traffic.log","r");
 while (!feof($handle)) {
   $line = fgets($handle, 4096);
   list($date,$time,$ip,$traffic)=explode(" ",$line);
   if($traffic>0) {mysql($db,"insert into traffic (ip,measuringtime,bytes) values('$ip','$date $time','$traffic')");}
 } 
 fclose($handle);
?>
