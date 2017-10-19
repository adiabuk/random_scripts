<?php


require("includes/configure.php");
require("includes/mydb.php");

$encrypted=getpassword("adiab@hotmail.co.uk");
$plain="password";
compare_pass($plain,$encrypted)

?>
