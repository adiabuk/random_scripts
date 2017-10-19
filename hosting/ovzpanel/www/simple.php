<?php
$xml = simplexml_load_file("adiab@hotmail.co.uk.xml");

echo $xml->getName() . "<br />";
echo $xml->ctid . "fuckfuckfuck<br />";
foreach($xml->children() as $child)
  {
  echo $child->getName() . ": " . $child . "<br />";
  }
?> 
