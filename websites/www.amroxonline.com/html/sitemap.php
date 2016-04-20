<?php

header('Content-type: application/xml');

require("includes/configure.php");

require(DIR_WS_INCLUDES . 'database_tables.php');

require(DIR_WS_FUNCTIONS . 'database.php');

function sitemap($parent_id=0,$parent_string=''){

	$result = tep_db_query("SELECT categories_id FROM ". TABLE_CATEGORIES." WHERE parent_id='".$parent_id."' ORDER BY `categories_id`");

	while ($row=tep_db_fetch_array($result)) {

//		print_r($row);

		echo '<url><loc>http://'.$_SERVER['HTTP_HOST'].'/index.php?cPath='.$parent_string.$row['categories_id'].'</loc><priority>0.5</priority><lastmod>'.date("Y-m-d").'T00:00:00+00:00</lastmod><changefreq>monthly</changefreq></url>'."\n";

		$rsl = tep_db_query("SELECT products_id FROM ".TABLE_PRODUCTS_TO_CATEGORIES." WHERE categories_id='".$row['categories_id']."'");

		while ($rw=tep_db_fetch_array($rsl)) {

			echo '<url><loc>http://'.$_SERVER['HTTP_HOST'].'/product_info.php?cPath='.$parent_string.$row['categories_id'].'&amp;products_id='.$rw['products_id'].'</loc><priority>0.5</priority><lastmod>'.date("Y-m-d").'T00:00:00+00:00</lastmod><changefreq>monthly</changefreq></url>'."\n";

		}

		sitemap($row['categories_id'],$parent_string.$row['categories_id'].'_');

	}

}

tep_db_connect() or die('Unable to connect to database server!');

echo '<?xml version="1.0" encoding="UTF-8"?>

<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/09/sitemap.xsd">

<url><loc>http://'.$_SERVER['HTTP_HOST'].'/</loc><priority>0.5</priority><lastmod>2007-02-01T04:27:55+00:00</lastmod><changefreq>monthly</changefreq></url>';

sitemap();

echo '</urlset>';

?>
