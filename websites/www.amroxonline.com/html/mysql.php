<?php

$connect = mysql_connect("1.1.1.1", "user", "password") or

die ("Hey loser, check your server connection.");

mysql_select_db("OSC2_stag");

$quey1="select * from fixed_options";

$result=mysql_query($quey1) or die(mysql_error());

?>

<table border=1 style="background-color:#F0F8FF;" >
<tr>
<td></td>

<?php

$arr = array("fixed_name","arch",cost,traffic, bandwidth ,harddrive ,ram,root,support,contract);

foreach ($arr as &$field) {
  while ($col$field=mysql_fetch_array($result)){
    echo "<td>";
    echo $col$field[$field];
    echo "</td>";
  }

  echo "</tr><tr>";

}
echo "</table>"
?>




