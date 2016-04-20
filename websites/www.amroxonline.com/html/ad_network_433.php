433'http://ads.digitalpoint.com/network.php?c=' . $_SERVER['SERVER_NAME'] . '&type=text'5<br />	if (substr (@$_SERVER['DOCUMENT_NAME'], -6) == '.shtml') {
		ini_set ('zlib.output_compression', 0);
		echo $ad_network;
	}

?>
