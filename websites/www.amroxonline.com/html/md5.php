<?php
$str = 'password';
$salt = '1d';

$encr = md5($salt . $str); 


echo "password=$str\n";
echo "salt=$salt\n";
echo "md5=$encr:$salt\n";

?> 
