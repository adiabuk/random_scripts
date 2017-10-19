<?php
$username='adiab@hotmail.co.uk';
$movies = new SimpleXMLElement('users/' . $username . '.xml', 0,     true);

echo $movies->movie[0]->plot;
?>

