<?php

$connect = mysql_connect("1.1.1.1", "user", "password") or

die ("Hey loser, check your server connection.");

mysql_select_db("OSC2_stag");

$quey1="select fixed_name, cost,arch, traffic, bandwidth, harddrive, ram, root, support, contract from fixed_options";

$result=mysql_query($quey1) or die(mysql_error());
$heading = array("","Cost","Architecture","Traffic","Bandwidth","Hard Drive", "RAM","Root Access", "Support","Contract");

$i=0;
while($row=mysql_fetch_row($result)) $array[$i++]=$row;
echo "<table border=1>";
for ($x=0;$x<count($array[0]);$x++){
	echo"<tr>";
        echo "<td>" . $heading[$x] . "</td>";
	for ($y=0;$y<count($array);$y++){
		echo"<td>".$array[$y][$x]."</td>";
	}
	echo"</tr>";
}
echo"</table>";

?>
