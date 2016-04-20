<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>



<?php
$server="1.1.1.1";
$username="user";
$password="password";
$database="OSC2_prod";
mysql_connect($server,$username,$password);
@mysql_select_db($database) or die( "Unable to select database");

$myquery="select customers_id from customers order by customers_id desc limit 1";
$result=mysql_query($myquery);
$id=mysql_result($result,0,"customers_id");
mysql_close();
$myvalue=$myback+1;
?>
</head>
<body>
<?php

echo $result."\n";
echo $id . "\n";
#$id++;
@exec("echo id=$id >> /tmp/output.lol");

echo $id;
?>
</body>
</html>
