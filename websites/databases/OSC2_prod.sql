-- MySQL dump 10.13  Distrib 5.7.11-4, for Linux (x86_64)
--
-- Host: localhost    Database: osc2
-- ------------------------------------------------------
-- Server version	5.6.30-0ubuntu0.15.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_book` (
  `address_book_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `entry_gender` char(1) NOT NULL,
  `entry_company` varchar(32) DEFAULT NULL,
  `entry_firstname` varchar(32) NOT NULL,
  `entry_lastname` varchar(32) NOT NULL,
  `entry_street_address` varchar(64) NOT NULL,
  `entry_suburb` varchar(32) DEFAULT NULL,
  `entry_postcode` varchar(10) NOT NULL,
  `entry_city` varchar(32) NOT NULL,
  `entry_state` varchar(32) DEFAULT NULL,
  `entry_country_id` int(11) NOT NULL DEFAULT '0',
  `entry_zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_book_id`),
  KEY `idx_address_book_customers_id` (`customers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
INSERT INTO `address_book` VALUES (1,1,'m','ACME Inc.','John','Doe','1 Way Street','','12345','NeverNever','',223,12),(8,8,'m','Amrox Ltd','Amro','Diab','5 Warrener Close','','SN25 4AH','Swindon','Wiltshire',222,0),(9,9,'m','nccc','jessie','portulan','camia','aaasfde','8000','davao city','manila',80,0),(4,4,'m','dx','mohameed','btatah','sabaa','','00967','sanaa','nome',235,0),(5,5,'m','','qqq','yyy','å¤§è¥¿è¡—2å·','','611730','æˆéƒ½å¸‚','å››å·',44,0),(6,6,'m','','Raymond','C Ploof|','41 college farm','','85207','Warren','',223,13),(10,10,'m','Amrox Ltd','Amro','Diab','5 Warrener Close','','SN25 4AH','Swindon','Wiltshire',222,0),(11,11,'m','dashjldhaskjh','Amro','Diab','5 Warrener Close','','SN25 4AH','Swindon','Wiltshire',1,0),(12,12,'m','dasdasdas','dsfsdfdas','fdsafdas','asduasdjkhasklj','jkhfdskjhfkj','hkjhkljdhs','fhgdskjfgdsjkgfj','bghfkjdshfkjlsd',4,0),(13,13,'m','TnT Incorporated','Tylor','Richards','1 Melrose Close','Old st mellons','CF63 2NT','Cardiff','Wales',222,0),(14,14,'f','Taptu','lynsey','tucker','140 Science Park Milton Road','','CB4 0GF','Cambridge','Cambridgeshire',222,0),(15,15,'m','','Stanislav','Demchenko','Zakharivska 10, ap. 81','','04073','Kiev','Kiev',220,0),(16,16,'m','','Nathan','Moynihan','104 Cortis Road','','SW15 3AQ','London','London',222,0),(17,17,'m','','Jon','Burgess','Jacobs Close','','L21 6PU','Liverpool','Merseyside',222,0),(18,18,'m','','Mark','Honman','Bulstrode','Oxford Road','SL9 8SZ','Gerrards Cross','Buckinghamshire',222,0),(19,19,'m','','Tom','Housley','84 High','','St14 7jd','Uttoxeter','Staffordshhire',222,0),(20,20,'m','YLD Online','Robert','Wylde','The Link, Park Lane Centre, Park Lane','','BD5 0LN','Bradford','West Yorkshire',222,0),(21,21,'m','','Piers','Heriot-Walker','63 Pursers Cross Road','','SW6 4QZ','London','England',222,0),(22,22,'m','dasdas','dasdas','asdasdas','dasdas','dasdas','asdfsdfsd','fsdfsdfsd','sdffsdfsd',167,0),(23,23,'',NULL,'Test','User','1 Main Terrace','','W12 4LQ','Wolverhampton',NULL,222,0),(24,24,'',NULL,'Amro','Diab','8 Fitzwarren Close','','SN15 3UF','Chippenham',NULL,222,0),(25,25,'m','','Daniel','Lawrence','21 Trafalgar road','Lexden','CO3 9AS','Colchester','Essex',222,0),(26,26,'',NULL,'Kunle','Campbell','Suite 213','','OX2 7DL','Oxford',NULL,222,0),(27,27,'m','','Jason','Grange','Tri-Acre','','PL12 5AA','Plymouth','Cornwall',222,0),(28,28,'m','na','ant','smith','11 kentmere avenue','','ls14 6et','leeds','uk',222,0),(29,29,'',NULL,'paul','murray','2473 dumbarton road','','g14 0nt','glasgow',NULL,222,0),(30,30,'',NULL,'Ron','Rogerson','Sunnyside Cottage, Brane','','TR208RD','Penzance',NULL,222,0),(31,31,'m','mine','murat','KarabaÅŸ','kadikoy','','34213','istanbul','turkey',215,0),(32,32,'',NULL,'EARL','ADAMS','50 NEW FARM ROAD','','DY9 7PQ','STOURBRIDGE',NULL,222,0),(33,33,'m','Alain Charles Publishing Ltd','Nick','Fordham','11-13 University House','Lower Grosvenor Place','SW1W 0EX','London','London',222,0),(34,34,'m','swinkler','sam','winkler','Delin House','Down Thomas','PL90AQ','Plymouth','Devon',222,0),(35,35,'m','','Venu','kumar','Plot no:98,S2,Sri Sai Towers-2,Near DAV Public School,Chandragir','','500056','Secunderabad','Andhra Pradesh',99,0),(36,36,'m','Perfect','Ahmed','Shahine','el-gomhorya St.','','35111','Mansoura','Dakahlia',63,0),(37,37,'m','Exa Information Technology','Mostafa','Saraya','10 mohamed mahmoud st','','0002','Cairo','Cairo',63,0),(38,38,'m','mqtv','Ali','Khan','charminar','','500023','hyderabad','Andhra Pradesh',99,0),(39,39,'m','Moore1995','matt','newn','Brighton Road','','Pr8 4dd','goml','uk',222,0);
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_format`
--

DROP TABLE IF EXISTS `address_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_format` (
  `address_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_format` varchar(128) NOT NULL,
  `address_summary` varchar(48) NOT NULL,
  PRIMARY KEY (`address_format_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_format`
--

LOCK TABLES `address_format` WRITE;
/*!40000 ALTER TABLE `address_format` DISABLE KEYS */;
INSERT INTO `address_format` VALUES (1,'$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country','$city / $country'),(2,'$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country','$city, $state / $country'),(3,'$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country','$state / $country'),(4,'$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country','$postcode / $country'),(5,'$firstname $lastname$cr$streets$cr$postcode $city$cr$country','$city / $country');
/*!40000 ALTER TABLE `address_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_password` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` VALUES (1,'adiab','e7a976b40098992c7dd97b6a363cc1dc:0f');
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `banners_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_title` varchar(64) NOT NULL,
  `banners_url` varchar(255) NOT NULL,
  `banners_image` varchar(64) NOT NULL,
  `banners_group` varchar(10) NOT NULL,
  `banners_html_text` text,
  `expires_impressions` int(7) DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `date_scheduled` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`banners_id`),
  KEY `idx_banners_group` (`banners_group`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'osCommerce','http://www.oscommerce.com','banners/oscommerce.gif','468x50','',0,NULL,NULL,'2010-01-02 12:26:44','2010-02-21 02:16:39',0);
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners_history`
--

DROP TABLE IF EXISTS `banners_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners_history` (
  `banners_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_id` int(11) NOT NULL,
  `banners_shown` int(5) NOT NULL DEFAULT '0',
  `banners_clicked` int(5) NOT NULL DEFAULT '0',
  `banners_history_date` datetime NOT NULL,
  PRIMARY KEY (`banners_history_id`),
  KEY `idx_banners_history_banners_id` (`banners_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners_history`
--

LOCK TABLES `banners_history` WRITE;
/*!40000 ALTER TABLE `banners_history` DISABLE KEYS */;
INSERT INTO `banners_history` VALUES (1,1,114,0,'2010-01-02 12:34:16'),(2,1,302,0,'2010-01-03 12:00:26'),(3,1,215,0,'2010-01-04 00:15:42'),(4,1,29,0,'2010-01-05 11:42:32'),(5,1,26,0,'2010-01-27 15:59:56'),(6,1,32,0,'2010-01-28 00:33:21'),(7,1,30,0,'2010-01-30 22:36:22'),(8,1,22,0,'2010-01-31 14:23:58'),(9,1,97,0,'2010-02-01 12:47:04'),(10,1,1,0,'2010-02-02 08:33:20'),(11,1,25,0,'2010-02-04 15:52:43'),(12,1,1,0,'2010-02-05 06:17:12'),(13,1,40,0,'2010-02-08 12:27:21'),(14,1,3,0,'2010-02-14 16:05:29'),(15,1,77,0,'2010-02-15 01:03:14'),(16,1,67,0,'2010-02-16 01:09:11'),(17,1,63,0,'2010-02-17 19:22:25'),(18,1,86,0,'2010-02-18 01:32:17'),(19,1,167,0,'2010-02-19 01:49:21'),(20,1,302,0,'2010-02-20 13:45:55'),(21,1,43,0,'2010-02-21 00:11:59');
/*!40000 ALTER TABLE `banners_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL DEFAULT '0',
  `categories_image` varchar(64) DEFAULT NULL,
  `categories_banner` varchar(64) DEFAULT NULL,
  `categories_background` varchar(64) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `categories_status` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (26,'fedora.gif','fedoracore_banner_1.jpg','myfedora.png',21,0,'2010-01-04 01:38:59','2010-10-17 12:16:20',1),(27,'slackware.gif','slackware_banner.jpg','myslack.png',21,0,'2010-01-04 01:39:22','2010-09-01 14:24:24',1),(28,'alt.gif',NULL,NULL,21,0,'2010-01-04 01:39:53','2010-02-15 02:35:40',0),(29,'arch.gif',NULL,NULL,21,0,'2010-01-04 15:08:53','2010-02-15 02:35:43',0),(30,'gentoo.gif',NULL,NULL,21,0,'2010-01-04 15:09:35','2010-02-15 02:35:49',0),(31,'suse.gif',NULL,NULL,21,0,'2010-01-04 15:09:57','2010-02-21 01:26:39',0),(32,'eyeos.gif','eyeos_banner.jpg',NULL,0,0,'2010-01-04 15:11:38','2010-05-20 20:04:24',0),(23,'ubuntu.gif','ubuntu_banner.jpg','myubuntu.png',21,0,'2010-01-02 15:32:04','2010-08-31 16:12:06',1),(24,'centos.gif','centos_banner.jpg','mycentos.png',21,0,'2010-01-02 15:32:12','2010-08-31 16:11:42',1),(22,'debian.gif','debian_banner.jpg','mydebian.png',21,0,'2010-01-02 15:31:54','2010-08-31 16:11:50',1),(21,'O.gif','linux-vps.jpg','mytux.png',0,0,'2010-01-02 13:10:31','2010-06-02 18:00:23',1),(33,NULL,NULL,NULL,21,0,'2010-02-15 03:07:09',NULL,0),(35,NULL,NULL,NULL,21,0,'2010-06-25 04:15:21','2010-06-25 04:16:41',0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_description`
--

DROP TABLE IF EXISTS `categories_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_description` (
  `categories_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `categories_name` varchar(32) NOT NULL DEFAULT '',
  `categories_description` text NOT NULL,
  `categories_heading_title` varchar(32) DEFAULT NULL,
  UNIQUE KEY `categories_id` (`categories_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_description`
--

LOCK TABLES `categories_description` WRITE;
/*!40000 ALTER TABLE `categories_description` DISABLE KEYS */;
INSERT INTO `categories_description` VALUES (32,1,'EyeOS Web Desktop','<h4>\nEyeOS is an opensouce web desktop which includes applications normally found on desktop machines.  This allows you to perform the following tasks:<ul>\n<li>Viewing of pdf documents,\n<li>Editing of office documents\n<li>Creating and extracting compressed files\n<li>Upload and download your documents\n<li>Storage and archiving of files and documents\n<li>Connecting to remote hosts using ftp, ssh etc.\n<li> Simple modifications of pictures and graphics work.\n<li>Chatting and instant messaging\n<li>Keeping tract of your contacts and address book\n<li>Managing your daily schedule\n</ul>\n\nOfcource you are still able to continue you usual web browsing and other activities alongside.\n\nMost of us have been in the situation where we are on the road, only to realize that we need to email an important document to a client only to remember that the document is on the office computer which is inaccessible remotely due to company regulations, and security policies, and in any case is turned off.  Other solutions enable you connect to your office or home computer using specific software.  These solutions would not work in this scenario, and is often infected with trogans and other malware.  Additionally they do not allow you tto have access to your data, files, and resources 24/7.  We are offing you a solution which does. \nWith our EyeOS solution you can reduce the need to carry USB hard drives with you, or install specific software for one time use\n\n\n <br><br>\n\nTake a look at our screenshots below for an idea of the power of our solutions<br><br>\nScreenshots: (click to zoom)<br>\n<table>\n<tr>\n<td>Login Screen</td>\n<td>Desktop</td>\n<td>Extract Document</td>\n<td>Spreadsheet</td>\n</tr>\n<tr>\n<td><A HREF=\"http://www-stag.amroxonline.com/images/login.jpg\" target=\"_blank\"><img src=\"http://www-stag.amroxonline.com/images/login-thumb.jpg\"></a></td>\n<td><A HREF=\"http://www-stag.amroxonline.com/images/desktop2.jpg\" target=\"_blank\"><img src=\"http://www-stag.amroxonline.com/images/desktop2-thumb.jpg\"></a></td>\n<td><A HREF=\"http://www-stag.amroxonline.com/images/wordzip.jpg\" target=\"_blank\"><img src=\"http://www-stag.amroxonline.com/images/wordzip-thumb.jpg\"></a></td>\n<td><A HREF=\"http://www-stag.amroxonline.com/images/spreadsheet.jpg\" target=\"_blank\"><img src=\"http://www-stag.amroxonline.com/images/spreadsheet-thumb.jpg\"></a></td>\n</table>\n</tr>\n</h4>',NULL),(28,1,'Alt Linux','<table><tr><td><img src=\"http://www.amroxonline.com/images/about_us.png\"></td></tr></table>\n<p><p/><div class=\"bodytexb\">\nALT Linux is a set of RPM-based operating systems built on top of the Linux kernel and Sisyphus packages repository. ALT Linux is developed jointly by ALT Linux Team developers community and ALT Linux LLC.\n<br>\nDistribution web page:<a href=\"http://www.altlinux.com/\">http://www.altlinux.com</a>\n<br>\nMore Information at <a href=\"http://en.wikipedia.org/wiki/ALT_Linux\" target=\"_new\">Wikipedia</a></div>',NULL),(29,1,'Arch Linux','<table><tr><td><img src=\"http://www.amroxonline.com/images/banner_3.jpg\"></td></tr></table>\n<p><p/><div class=\"bodytexb\">\nArch is a Linux distribution intended to be lightweight and simple. The design approach of the development team focuses on simplicity, elegance, code correctness and minimalism. \"Simplicity\", according to Arch, is defined as \"...without unnecessary additions, modifications, or complications..\" and is defined from a developer standpoint, rather than a user standpoint.\n<br>\nDistribution web page:<a href=\"http://www.archlinux.org/\">http://www.archlinux.org</a>\n<br>\nMore Information at <a href=\"http://en.wikipedia.org/wiki/Arch_Linux\" target=\"_new\">Wikipedia</a></div>',NULL),(30,1,'Gentoo','<table><tr><td><img src=\"http://www.amroxonline.com/images/banner_3.jpg\"></td></tr></table>\n<p><p/><div class=\"bodytexb\">\nGentoo Linux is a Linux distribution based on the Portage package management system and is distributed as free and open source software. Unlike a conventional software distribution, the user compiles the source code locally according to their chosen configuration. There are normally no precompiled binaries for software, continuing the tradition of the ports collection, although for convenience, some software packages (such as Mozilla Firefox and OpenOffice) are also available as precompiled binaries for various architectures where compiling would otherwise be very time consuming.\n\n<br>\nDistribution web page:<a href=\"http://www.gentoo.org/\">http://www.gentoo.org/</a>\n<br>\nMore Information at <a href=\"http://en.wikipedia.org/wiki/Gentoo_Linux\" target=\"_new\">Wikipedia</a></div>',NULL),(31,1,'Suse/OpenSuse','<table><tr><td><img src=\"http://www.amroxonline.com/images/banner_3.jpg\"></td></tr></table>\n<p><p/><div class=\"bodytexb\">\nSUSE Linux is a commercial distribution by Novell containing system and application software from various projects. It is of German origin and mainly developed in Europe. The first version of this distribution appeared in early 1994, making SUSE the oldest existing commercial distribution. It is known for its YaST configuration tool. The openSUSE Project is a community program sponsored by Novell, AMD and IP Exchange which  aims to create a simple and easy to use distribution aimed at both new and experienced users.\n<br>\nDistribution web page:<a href=\"http://www.opensuse.org/\">http://www.opensuse.org/</a>\n<br>\nMore Information at <a href=\"http://en.wikipedia.org/wiki/SUSE_Linux_distributions\" target=\"_new\">Wikipedia</a></div>',NULL),(24,1,'CentOS VPS','<table><tr><td><img src=\"http://www.amroxonline.com/images/centos_banner.jpg\"></td></tr></table><br>\n<p><p/><div class=\"bodytexb\">\n<h3>Centos </h3>Centos (or Community Enterprise Operating System) is a distribution which aims to be 100% binary compatible with its equivenent version of RedHat Enterprise Linux.  As Redhat is currently the market leader in Linux, Centos tends to be popular for staging environments to mimic live systems without the high overhead costs.  There is also a high popularity for educational and training needs.\n<br><br>Our Debian VPS Systems come with a minimal install including and apache webserver, webmin (for web administration) and openssh (for command line connectivity).  Additionally you are able to install additional software using the already configured yum repositories.<br>You will have full root access with any system chosen from here.  \n<br><br>To begin choose below from either Centos 4.0 or Centos 5.0 systems from the options below.<br>  As usual you will have the choice to customize all attributes on your system in the next screen.<br><br>\nDistribution web page:<a href=\"http://www.centos.org/\">http://www.centos.org</a><br>\nMore Information at <a href=\"http://en.wikipedia.org/wiki/CentOS\" target=\"_new\">Wikipedia</a></div>',NULL),(26,1,'Fedora VPS','<table><tr><td><img src=\"http://www.amroxonline.com/images/fedoracore_banner_1.jpg\"></td></tr></table>\n<p><p/><div class=\"bodytexb\">\n<h3>Fedora</h3> is an RPM-based Linux distribution which aims to be high in the Linux cutting edge arena.  It benefits from having a short release cycle and therefore containing many of the latest software and features enjoyed by the Linux community.<br><br>\n\nDue to Fedora\'s sponsorship by Redhat, many of the features are eventually incorporated into Redhat\'s RHEL Server Operating system and subsequently Centos.  There are also dozens of other Linux distributions which use Fedora Core as a base for their product.  Fedora is mainly used for Desktop/Laptop use due to its ease of use, and compatibility.  There is also a market for server use where the higher package versions are required for certain functionality.\n\nUbuntu is designed to be user friendly.  Recently it has become a popular choice for desktop and laptop users due to the large list of hardware supported, and the large amount of software it provides making it easily suited to fit a wide range of uses with minimal effort.<br><br>\n\n\nOur Fedora VPS servers all come with a minimal install, default configuration of the yum repositories for downloading new packages, and upgrading.\n<br>The following services will be available to get you started: <br>\n<ul>\n<li>Apache webserver, \n<li>Webmin (for web administration) \n<li>openssh (for command line connectivity). \n</ul>\nYou will have full root access with any system chosen from here. \n\nTo begin choose below from our range of available Ubuntu versions - You will then be prompted to customize your various options based on your requirements. <br><br>  \n\n\nDistribution web page:<a href=\"http://fedoraproject.org/\">http://fedoraproject.org/</a>\n<br>\nMore Information at <a href=\"http://en.wikipedia.org/wiki/Fedora_%28operating_system%29\" target=\"_new\">Wikipedia</a></div>',NULL),(27,1,'Slackware VPS','<table><tr><td><img src=\"http://www.amroxonline.com/images/slackware_banner.jpg\"></td></tr></table>\n<p><p/><div class=\"bodytexb\">\n<h3>Slackware</h3> is arguably the oldest Linux distributions still supported.  Its main goals are to be simple, light weight, and robust.  Slackware aims to closely follow the conventions set out by Unix as well as being fully compliant with the Linux standards.<br><br>\n\nSlackware is generally enjoyed by companies and individuals who prefer stability and performance over user-friendliness and those who need full control over systems.<br><br>\n\n\nOur Slackware VPS Systems come with a minimal install including the apache webserver, webmin (for web administration) and openssh (for command line connectivity). Additionally you are able to install additional software using the already configured slackware repositories using the slapt-get tool.<br>\nYou will have full root access with any system chosen from here.<br><br>\n\nCurrently we only have one version of slackware available.  Click on the image below to begin customisation of your VPS.<br><br>  \nDistribution web page:<a href=\"http://www.slackware.org/\">http://www.slackware.org/</a>\n<br>\nMore Information at <a href=\"http://en.wikipedia.org/wiki/Slackware\" target=\"_new\">Wikipedia</a></div>',NULL),(23,1,'Ubuntu VPS','<table><tr><td><img src=\"http://www.amroxonline.com/images/ubuntu_banner.jpg\"></td></tr></table>\n<p><p/><div class=\"bodytexb\">\n<h3>Ubuntu</h3> is a Linux distribution based upon Debian.  As such it benefits from a large selection of software being available from the apt repositories, and the stability that Debian users have become accustomed to.<br><br>\n\nUbuntu is designed to be user friendly.  Recently it has become a popular choice for desktop and laptop users due to the large list of hardware supported, and the large amount of software it provides making it easily suited to fit a wide range of uses with minimal effort.<br><br>\n\n\nOur Ubuntu VPS servers all come with a minimal install, default apt repositories and the following services running to get you started: <br>\n<ul>\n<li>Apache webserver, \n<li>Webmin (for web administration) \n<li>openssh (for command line connectivity). \n</ul>\nYou will have full root access with any system chosen from here. \n\nTo begin choose below from our range of available Ubuntu versions - You will then be prompted to customize your various options based on your requirements. <br><br>  \n\nDistribution web page:<a href=\"http://www.ubuntu.com/\">http://www.ubuntu.com/</a>\n<br>\nMore Information at <a href=\"http://en.wikipedia.org/wiki/Ubuntu_%28operating_system%29\" target=\"_new\">Wikipedia</a></div>',NULL),(22,1,'Debian VPS','<table><tr><td><img src=\"http://www.amroxonline.com/images/debian_banner.jpg\"></td></tr></table>\n<p><p/><div class=\"bodytexb\">\n<h3>Debian</h3> GNU/Linux is the ideal system for for serious use.<br><br>\nDebian is known for its stability, close ties with its Unix roots, and its package management system, allowing literally thousands of packages to installed with minimal effort.  \n<br><br>Our Debian VPS Systems come with a minimal install including and apache webserver, webmin (for web administration) and openssh (for command line connectivity).  You will have full root access with any system chosen from here. \nTo begin choose below from either Debian 4.0 Etch or the latest Debian 5.0 Lenny systems.  As usual you will have the choice to customize all attributes on your system in the next screen.\n\n<br><br>\nDistribution web page:<a href=\"http://www.debian.org/\">http://www.debian.org</a>\n<br>\nMore Information at <a href=\"http://en.wikipedia.org/wiki/Debian\" target=\"_new\">Wikipedia</a></div>',NULL),(21,1,'Linux VPS','<table><tr><td><img src=\"http://www.amroxonline.com/images/linux-vps.jpg\"></td></tr></table>\n<p><p/><div class=\"bodytexb\">\nOur VPS solutions give you complete freedom on each of the aspects of your system including memory, diskspace, and bandwidth as well as a wide choice of different distributions and versions for both 32-bit and 64-bit.  Every aspect of your system can be modified to suit your needs, just as you may mix and match the spec of you hardware server or desktop.  This enables you to have a cheap, yet practical system\n<br><br>\nTo begin, choose the distribution of your choice from the list below and customize from the list given. After finalizing you choices you will be able to return to this menu to choose additional VPS systems if you require.<br.<br>\n\n\nThe options selected by default are the cheapest, but you may wish to customize your VPS by adding more memory, or extending the duration of the contract.</div>',NULL),(33,1,'Mandriva','',NULL),(35,1,'Upgrades','',NULL);
/*!40000 ALTER TABLE `categories_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compare_root`
--

DROP TABLE IF EXISTS `compare_root`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compare_root` (
  `root_id` int(11) NOT NULL DEFAULT '0',
  `compare_name` varchar(65) DEFAULT NULL,
  `cost` varchar(30) DEFAULT NULL,
  `versions` varchar(30) DEFAULT NULL,
  `repo` varchar(30) DEFAULT NULL,
  `harddrive` varchar(30) DEFAULT NULL,
  `ram` varchar(30) DEFAULT NULL,
  `root` varchar(30) DEFAULT NULL,
  `category_id` tinyint(4) DEFAULT NULL,
  `target_cat_id` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compare_root`
--

LOCK TABLES `compare_root` WRITE;
/*!40000 ALTER TABLE `compare_root` DISABLE KEYS */;
INSERT INTO `compare_root` VALUES (1,'CentOS','from &pound;5 per month','4, and 5','Yum','up to 100G','up to 1G','yes',21,24),(2,'Debian','from &pound;5 per month','4(etch), 5(lenny)','APT','up to 100G','up to 1G','yes',21,22),(3,'Fedora','from &pound;5 per month','12,13,14','YUM','up to 100G','up to 1G','yes',21,26),(4,'Slackware','from &pound;5 per month','11','SWARET','up to 100G','up to 1G','yes',21,27),(5,'Ubuntu','from &pound;5 per month','8.04 to 10.10','APT','up to 100G','up to 1G','yes',21,23);
/*!40000 ALTER TABLE `compare_root` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` varchar(255) NOT NULL,
  `configuration_key` varchar(255) NOT NULL,
  `configuration_value` varchar(255) NOT NULL,
  `configuration_description` varchar(255) NOT NULL,
  `configuration_group_id` int(11) NOT NULL,
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `use_function` varchar(255) DEFAULT NULL,
  `set_function` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`configuration_id`)
) ENGINE=MyISAM AUTO_INCREMENT=481 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (1,'Store Name','STORE_NAME','Amrox Online','The name of my store',1,1,'2010-10-31 19:37:39','2010-01-02 12:26:44',NULL,NULL),(2,'Store Owner','STORE_OWNER','Amrox Ltd','The name of my store owner',1,2,'2010-01-02 15:12:00','2010-01-02 12:26:44',NULL,NULL),(3,'E-Mail Address','STORE_OWNER_EMAIL_ADDRESS','support@amroxonline.com','The e-mail address of my store owner',1,3,'2010-04-13 15:02:43','2010-01-02 12:26:44',NULL,NULL),(4,'E-Mail From','EMAIL_FROM','\"Amrox Support\" <support@amroxonline.com>','The e-mail address used in (sent) e-mails',1,4,'2010-04-13 15:03:02','2010-01-02 12:26:44',NULL,NULL),(5,'Country','STORE_COUNTRY','222','The country my store is located in <br><br><b>Note: Please remember to update the store zone.</b>',1,6,'2010-01-02 15:13:09','2010-01-02 12:26:44','tep_get_country_name','tep_cfg_pull_down_country_list('),(6,'Zone','STORE_ZONE','','The zone my store is located in',1,7,'2010-01-02 15:13:17','2010-01-02 12:26:44','tep_cfg_get_zone_name','tep_cfg_pull_down_zone_list('),(7,'Expected Sort Order','EXPECTED_PRODUCTS_SORT','desc','This is the sort order used in the expected products box.',1,8,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'asc\', \'desc\'), '),(8,'Expected Sort Field','EXPECTED_PRODUCTS_FIELD','date_expected','The column to sort by in the expected products box.',1,9,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'products_name\', \'date_expected\'), '),(9,'Switch To Default Language Currency','USE_DEFAULT_LANGUAGE_CURRENCY','true','Automatically switch to the language\'s currency when it is changed',1,10,'2010-01-03 13:00:01','2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(10,'Send Extra Order Emails To','SEND_EXTRA_ORDER_EMAILS_TO','amro.diab@amroxonline.com','Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',1,11,'2010-02-18 02:24:19','2010-01-02 12:26:44',NULL,NULL),(11,'Use Search-Engine Safe URLs (still in development)','SEARCH_ENGINE_FRIENDLY_URLS','false','Use search-engine safe urls for all site links',1,12,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(12,'Display Cart After Adding Product','DISPLAY_CART','true','Display the shopping cart after adding a product (or return back to their origin)',1,14,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(13,'Allow Guest To Tell A Friend','ALLOW_GUEST_TO_TELL_A_FRIEND','true','Allow guests to tell a friend about a product',1,15,'2010-01-02 15:12:35','2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(14,'Default Search Operator','ADVANCED_SEARCH_DEFAULT_OPERATOR','and','Default search operators',1,17,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'and\', \'or\'), '),(15,'Store Address and Phone','STORE_NAME_ADDRESS','Store Name\nAddress\nCountry\nPhone','This is the Store Name, Address and Phone used on printable documents and displayed online',1,18,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_textarea('),(16,'Show Category Counts','SHOW_COUNTS','true','Count recursively how many products are in each category',1,19,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(17,'Tax Decimal Places','TAX_DECIMAL_PLACES','0','Pad the tax value this amount of decimal places',1,20,NULL,'2010-01-02 12:26:44',NULL,NULL),(18,'Display Prices with Tax','DISPLAY_PRICE_WITH_TAX','true','Display prices with tax included (true) or add the tax at the end (false)',1,21,'2010-01-02 15:13:35','2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(19,'First Name','ENTRY_FIRST_NAME_MIN_LENGTH','2','Minimum length of first name',2,1,NULL,'2010-01-02 12:26:44',NULL,NULL),(20,'Last Name','ENTRY_LAST_NAME_MIN_LENGTH','2','Minimum length of last name',2,2,NULL,'2010-01-02 12:26:44',NULL,NULL),(21,'Date of Birth','ENTRY_DOB_MIN_LENGTH','10','Minimum length of date of birth',2,3,NULL,'2010-01-02 12:26:44',NULL,NULL),(22,'E-Mail Address','ENTRY_EMAIL_ADDRESS_MIN_LENGTH','6','Minimum length of e-mail address',2,4,NULL,'2010-01-02 12:26:44',NULL,NULL),(23,'Street Address','ENTRY_STREET_ADDRESS_MIN_LENGTH','5','Minimum length of street address',2,5,NULL,'2010-01-02 12:26:44',NULL,NULL),(24,'Company','ENTRY_COMPANY_MIN_LENGTH','2','Minimum length of company name',2,6,NULL,'2010-01-02 12:26:44',NULL,NULL),(25,'Post Code','ENTRY_POSTCODE_MIN_LENGTH','4','Minimum length of post code',2,7,NULL,'2010-01-02 12:26:44',NULL,NULL),(26,'City','ENTRY_CITY_MIN_LENGTH','3','Minimum length of city',2,8,NULL,'2010-01-02 12:26:44',NULL,NULL),(27,'State','ENTRY_STATE_MIN_LENGTH','2','Minimum length of state',2,9,NULL,'2010-01-02 12:26:44',NULL,NULL),(28,'Telephone Number','ENTRY_TELEPHONE_MIN_LENGTH','3','Minimum length of telephone number',2,10,NULL,'2010-01-02 12:26:44',NULL,NULL),(29,'Password','ENTRY_PASSWORD_MIN_LENGTH','5','Minimum length of password',2,11,NULL,'2010-01-02 12:26:44',NULL,NULL),(30,'Credit Card Owner Name','CC_OWNER_MIN_LENGTH','3','Minimum length of credit card owner name',2,12,NULL,'2010-01-02 12:26:44',NULL,NULL),(31,'Credit Card Number','CC_NUMBER_MIN_LENGTH','10','Minimum length of credit card number',2,13,NULL,'2010-01-02 12:26:44',NULL,NULL),(32,'Review Text','REVIEW_TEXT_MIN_LENGTH','50','Minimum length of review text',2,14,NULL,'2010-01-02 12:26:44',NULL,NULL),(33,'Best Sellers','MIN_DISPLAY_BESTSELLERS','1','Minimum number of best sellers to display',2,15,NULL,'2010-01-02 12:26:44',NULL,NULL),(34,'Also Purchased','MIN_DISPLAY_ALSO_PURCHASED','1','Minimum number of products to display in the \'This Customer Also Purchased\' box',2,16,NULL,'2010-01-02 12:26:44',NULL,NULL),(35,'Address Book Entries','MAX_ADDRESS_BOOK_ENTRIES','5','Maximum address book entries a customer is allowed to have',3,1,NULL,'2010-01-02 12:26:44',NULL,NULL),(36,'Search Results','MAX_DISPLAY_SEARCH_RESULTS','20','Amount of products to list',3,2,NULL,'2010-01-02 12:26:44',NULL,NULL),(37,'Page Links','MAX_DISPLAY_PAGE_LINKS','5','Number of \'number\' links use for page-sets',3,3,NULL,'2010-01-02 12:26:44',NULL,NULL),(38,'Special Products','MAX_DISPLAY_SPECIAL_PRODUCTS','9','Maximum number of products on special to display',3,4,NULL,'2010-01-02 12:26:44',NULL,NULL),(39,'New Products Module','MAX_DISPLAY_NEW_PRODUCTS','9','Maximum number of new products to display in a category',3,5,NULL,'2010-01-02 12:26:44',NULL,NULL),(40,'Products Expected','MAX_DISPLAY_UPCOMING_PRODUCTS','10','Maximum number of products expected to display',3,6,NULL,'2010-01-02 12:26:44',NULL,NULL),(41,'Manufacturers List','MAX_DISPLAY_MANUFACTURERS_IN_A_LIST','0','Used in manufacturers box; when the number of manufacturers exceeds this number, a drop-down list will be displayed instead of the default list',3,7,NULL,'2010-01-02 12:26:44',NULL,NULL),(42,'Manufacturers Select Size','MAX_MANUFACTURERS_LIST','1','Used in manufacturers box; when this value is \'1\' the classic drop-down list will be used for the manufacturers box. Otherwise, a list-box with the specified number of rows will be displayed.',3,7,NULL,'2010-01-02 12:26:44',NULL,NULL),(43,'Length of Manufacturers Name','MAX_DISPLAY_MANUFACTURER_NAME_LEN','15','Used in manufacturers box; maximum length of manufacturers name to display',3,8,NULL,'2010-01-02 12:26:44',NULL,NULL),(44,'New Reviews','MAX_DISPLAY_NEW_REVIEWS','6','Maximum number of new reviews to display',3,9,NULL,'2010-01-02 12:26:44',NULL,NULL),(45,'Selection of Random Reviews','MAX_RANDOM_SELECT_REVIEWS','10','How many records to select from to choose one random product review',3,10,NULL,'2010-01-02 12:26:44',NULL,NULL),(46,'Selection of Random New Products','MAX_RANDOM_SELECT_NEW','10','How many records to select from to choose one random new product to display',3,11,NULL,'2010-01-02 12:26:44',NULL,NULL),(47,'Selection of Products on Special','MAX_RANDOM_SELECT_SPECIALS','10','How many records to select from to choose one random product special to display',3,12,NULL,'2010-01-02 12:26:44',NULL,NULL),(48,'Categories To List Per Row','MAX_DISPLAY_CATEGORIES_PER_ROW','3','How many categories to list per row',3,13,NULL,'2010-01-02 12:26:44',NULL,NULL),(49,'New Products Listing','MAX_DISPLAY_PRODUCTS_NEW','10','Maximum number of new products to display in new products page',3,14,NULL,'2010-01-02 12:26:44',NULL,NULL),(50,'Best Sellers','MAX_DISPLAY_BESTSELLERS','10','Maximum number of best sellers to display',3,15,NULL,'2010-01-02 12:26:44',NULL,NULL),(51,'Also Purchased','MAX_DISPLAY_ALSO_PURCHASED','6','Maximum number of products to display in the \'This Customer Also Purchased\' box',3,16,NULL,'2010-01-02 12:26:44',NULL,NULL),(52,'Customer Order History Box','MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX','6','Maximum number of products to display in the customer order history box',3,17,NULL,'2010-01-02 12:26:44',NULL,NULL),(53,'Order History','MAX_DISPLAY_ORDER_HISTORY','10','Maximum number of orders to display in the order history page',3,18,NULL,'2010-01-02 12:26:44',NULL,NULL),(54,'Product Quantities In Shopping Cart','MAX_QTY_IN_CART','99','Maximum number of product quantities that can be added to the shopping cart (0 for no limit)',3,19,NULL,'2010-01-02 12:26:44',NULL,NULL),(55,'Small Image Width','SMALL_IMAGE_WIDTH','100','The pixel width of small images',4,1,NULL,'2010-01-02 12:26:44',NULL,NULL),(56,'Small Image Height','SMALL_IMAGE_HEIGHT','80','The pixel height of small images',4,2,NULL,'2010-01-02 12:26:44',NULL,NULL),(57,'Heading Image Width','HEADING_IMAGE_WIDTH','57','The pixel width of heading images',4,3,NULL,'2010-01-02 12:26:44',NULL,NULL),(58,'Heading Image Height','HEADING_IMAGE_HEIGHT','40','The pixel height of heading images',4,4,NULL,'2010-01-02 12:26:44',NULL,NULL),(59,'Subcategory Image Width','SUBCATEGORY_IMAGE_WIDTH','100','The pixel width of subcategory images',4,5,NULL,'2010-01-02 12:26:44',NULL,NULL),(60,'Subcategory Image Height','SUBCATEGORY_IMAGE_HEIGHT','57','The pixel height of subcategory images',4,6,NULL,'2010-01-02 12:26:44',NULL,NULL),(61,'Calculate Image Size','CONFIG_CALCULATE_IMAGE_SIZE','true','Calculate the size of images?',4,7,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(62,'Image Required','IMAGE_REQUIRED','true','Enable to display broken images. Good for development.',4,8,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(63,'Gender','ACCOUNT_GENDER','true','Display gender in the customers account',5,1,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(64,'Date of Birth','ACCOUNT_DOB','true','Display date of birth in the customers account',5,2,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(65,'Company','ACCOUNT_COMPANY','true','Display company in the customers account',5,3,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(66,'Suburb','ACCOUNT_SUBURB','true','Display suburb in the customers account',5,4,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(67,'State','ACCOUNT_STATE','true','Display state in the customers account',5,5,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(68,'Installed Modules','MODULE_PAYMENT_INSTALLED','paypal_express.php','List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cc.php;cod.php;paypal.php)',6,0,'2010-10-26 11:20:49','2010-01-02 12:26:44',NULL,NULL),(69,'Installed Modules','MODULE_ORDER_TOTAL_INSTALLED','ot_discount_coupon.php;ot_subtotal.php;ot_tax.php;ot_total.php','List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)',6,0,'2010-12-26 20:53:34','2010-01-02 12:26:44',NULL,NULL),(70,'Installed Modules','MODULE_SHIPPING_INSTALLED','','List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)',6,0,'2010-01-02 16:56:29','2010-01-02 12:26:44',NULL,NULL),(85,'Default Currency','DEFAULT_CURRENCY','GBP','Default Currency',6,0,NULL,'2010-01-02 12:26:44',NULL,NULL),(86,'Default Language','DEFAULT_LANGUAGE','en','Default Language',6,0,NULL,'2010-01-02 12:26:44',NULL,NULL),(87,'Default Order Status For New Orders','DEFAULT_ORDERS_STATUS_ID','1','When a new order is created, this order status will be assigned to it.',6,0,NULL,'2010-01-02 12:26:44',NULL,NULL),(93,'Display Sub-Total','MODULE_ORDER_TOTAL_SUBTOTAL_STATUS','true','Do you want to display the order sub-total cost?',6,1,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(94,'Sort Order','MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER','1','Sort order of display.',6,2,NULL,'2010-01-02 12:26:44',NULL,NULL),(95,'Display Tax','MODULE_ORDER_TOTAL_TAX_STATUS','true','Do you want to display the order tax value?',6,1,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(96,'Sort Order','MODULE_ORDER_TOTAL_TAX_SORT_ORDER','3','Sort order of display.',6,2,NULL,'2010-01-02 12:26:44',NULL,NULL),(97,'Display Total','MODULE_ORDER_TOTAL_TOTAL_STATUS','true','Do you want to display the total order value?',6,1,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(98,'Sort Order','MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER','4','Sort order of display.',6,2,NULL,'2010-01-02 12:26:44',NULL,NULL),(99,'Country of Origin','SHIPPING_ORIGIN_COUNTRY','222','Select the country of origin to be used in shipping quotes.',7,1,'2010-01-02 15:14:15','2010-01-02 12:26:44','tep_get_country_name','tep_cfg_pull_down_country_list('),(100,'Postal Code','SHIPPING_ORIGIN_ZIP','NONE','Enter the Postal Code (ZIP) of the Store to be used in shipping quotes.',7,2,NULL,'2010-01-02 12:26:44',NULL,NULL),(101,'Enter the Maximum Package Weight you will ship','SHIPPING_MAX_WEIGHT','50','Carriers have a max weight limit for a single package. This is a common one for all.',7,3,NULL,'2010-01-02 12:26:44',NULL,NULL),(102,'Package Tare weight.','SHIPPING_BOX_WEIGHT','3','What is the weight of typical packaging of small to medium packages?',7,4,NULL,'2010-01-02 12:26:44',NULL,NULL),(103,'Larger packages - percentage increase.','SHIPPING_BOX_PADDING','10','For 10% enter 10',7,5,NULL,'2010-01-02 12:26:44',NULL,NULL),(104,'Display Product Image','PRODUCT_LIST_IMAGE','1','Do you want to display the Product Image?',8,1,NULL,'2010-01-02 12:26:44',NULL,NULL),(105,'Display Product Manufaturer Name','PRODUCT_LIST_MANUFACTURER','0','Do you want to display the Product Manufacturer Name?',8,2,NULL,'2010-01-02 12:26:44',NULL,NULL),(106,'Display Product Model','PRODUCT_LIST_MODEL','0','Do you want to display the Product Model?',8,3,NULL,'2010-01-02 12:26:44',NULL,NULL),(107,'Display Product Name','PRODUCT_LIST_NAME','2','Do you want to display the Product Name?',8,4,NULL,'2010-01-02 12:26:44',NULL,NULL),(108,'Display Product Price','PRODUCT_LIST_PRICE','3','Do you want to display the Product Price',8,5,NULL,'2010-01-02 12:26:44',NULL,NULL),(109,'Display Product Quantity','PRODUCT_LIST_QUANTITY','0','Do you want to display the Product Quantity?',8,6,NULL,'2010-01-02 12:26:44',NULL,NULL),(110,'Display Product Weight','PRODUCT_LIST_WEIGHT','0','Do you want to display the Product Weight?',8,7,NULL,'2010-01-02 12:26:44',NULL,NULL),(111,'Display Buy Now column','PRODUCT_LIST_BUY_NOW','4','Do you want to display the Buy Now column?',8,8,NULL,'2010-01-02 12:26:44',NULL,NULL),(112,'Display Category/Manufacturer Filter (0=disable; 1=enable)','PRODUCT_LIST_FILTER','0','Do you want to display the Category/Manufacturer Filter?',8,9,'2010-01-02 15:15:17','2010-01-02 12:26:44',NULL,NULL),(113,'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)','PREV_NEXT_BAR_LOCATION','3','Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)',8,10,'2010-01-03 12:30:49','2010-01-02 12:26:44',NULL,NULL),(114,'Check stock level','STOCK_CHECK','false','Check to see if sufficent stock is available',9,1,'2010-01-02 15:15:28','2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(115,'Subtract stock','STOCK_LIMITED','false','Subtract product in stock by product orders',9,2,'2010-01-02 15:15:35','2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(116,'Allow Checkout','STOCK_ALLOW_CHECKOUT','true','Allow customer to checkout even if there is insufficient stock',9,3,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(117,'Mark product out of stock','STOCK_MARK_PRODUCT_OUT_OF_STOCK','***','Display something on screen so customer can see which product has insufficient stock',9,4,NULL,'2010-01-02 12:26:44',NULL,NULL),(118,'Stock Re-order level','STOCK_REORDER_LEVEL','5','Define when stock needs to be re-ordered',9,5,NULL,'2010-01-02 12:26:44',NULL,NULL),(119,'Store Page Parse Time','STORE_PAGE_PARSE_TIME','false','Store the time it takes to parse a page',10,1,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(120,'Log Destination','STORE_PAGE_PARSE_TIME_LOG','/var/log/www/tep/page_parse_time.log','Directory and filename of the page parse time log',10,2,NULL,'2010-01-02 12:26:44',NULL,NULL),(121,'Log Date Format','STORE_PARSE_DATE_TIME_FORMAT','%d/%m/%Y %H:%M:%S','The date format',10,3,NULL,'2010-01-02 12:26:44',NULL,NULL),(122,'Display The Page Parse Time','DISPLAY_PAGE_PARSE_TIME','true','Display the page parse time (store page parse time must be enabled)',10,4,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(123,'Store Database Queries','STORE_DB_TRANSACTIONS','false','Store the database queries in the page parse time log (PHP4 only)',10,5,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(124,'Use Cache','USE_CACHE','false','Use caching features',11,1,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(125,'Cache Directory','DIR_FS_CACHE','/tmp/','The directory where the cached files are saved',11,2,NULL,'2010-01-02 12:26:44',NULL,NULL),(126,'E-Mail Transport Method','EMAIL_TRANSPORT','sendmail','Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.',12,1,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'sendmail\', \'smtp\'),'),(127,'E-Mail Linefeeds','EMAIL_LINEFEED','LF','Defines the character sequence used to separate mail headers.',12,2,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'LF\', \'CRLF\'),'),(128,'Use MIME HTML When Sending Emails','EMAIL_USE_HTML','true','Send e-mails in HTML format',12,3,'2010-05-13 19:11:11','2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(129,'Verify E-Mail Addresses Through DNS','ENTRY_EMAIL_ADDRESS_CHECK','false','Verify e-mail address through a DNS server',12,4,'2010-10-06 19:32:09','2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(130,'Send E-Mails','SEND_EMAILS','true','Send out e-mails',12,5,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(131,'Enable download','DOWNLOAD_ENABLED','false','Enable the products download functions.',13,1,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(132,'Download by redirect','DOWNLOAD_BY_REDIRECT','false','Use browser redirection for download. Disable on non-Unix systems.',13,2,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(133,'Expiry delay (days)','DOWNLOAD_MAX_DAYS','7','Set number of days before the download link expires. 0 means no limit.',13,3,NULL,'2010-01-02 12:26:44',NULL,''),(134,'Maximum number of downloads','DOWNLOAD_MAX_COUNT','5','Set the maximum number of downloads. 0 means no download authorized.',13,4,NULL,'2010-01-02 12:26:44',NULL,''),(135,'Enable GZip Compression','GZIP_COMPRESSION','true','Enable HTTP GZip compression.',14,1,'2010-05-13 23:56:03','2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(136,'Compression Level','GZIP_LEVEL','9','Use this compression level 0-9 (0 = minimum, 9 = maximum).',14,2,'2010-05-14 01:06:15','2010-01-02 12:26:44',NULL,NULL),(137,'Session Directory','SESSION_WRITE_DIRECTORY','/tmp','If sessions are file based, store them in this directory.',15,1,NULL,'2010-01-02 12:26:44',NULL,NULL),(138,'Force Cookie Use','SESSION_FORCE_COOKIE_USE','False','Force the use of sessions when cookies are only enabled.',15,2,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(139,'Check SSL Session ID','SESSION_CHECK_SSL_SESSION_ID','False','Validate the SSL_SESSION_ID on every secure HTTPS page request.',15,3,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(140,'Check User Agent','SESSION_CHECK_USER_AGENT','False','Validate the clients browser user agent on every page request.',15,4,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(141,'Check IP Address','SESSION_CHECK_IP_ADDRESS','False','Validate the clients IP address on every page request.',15,5,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(142,'Prevent Spider Sessions','SESSION_BLOCK_SPIDERS','True','Prevent known spiders from starting a session.',15,6,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(143,'Recreate Session','SESSION_RECREATE','False','Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).',15,7,NULL,'2010-01-02 12:26:44',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(303,'Payment Zone','MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2010-10-26 11:20:49','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(302,'Transaction Method','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD','Sale','The processing method to use for each transaction.',6,0,NULL,'2010-10-26 11:20:49',NULL,'tep_cfg_select_option(array(\'Authorization\', \'Sale\'), '),(301,'Transaction Server','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER','Live','Use the live or testing (sandbox) gateway server to process transactions?',6,0,NULL,'2010-10-26 11:20:49',NULL,'tep_cfg_select_option(array(\'Live\', \'Sandbox\'), '),(299,'API Password','MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD','BEDTLHQ7H7DVYGA3','The password to use for the PayPal API service',6,0,NULL,'2010-10-26 11:20:49',NULL,NULL),(300,'API Signature','MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE','AIeO4GaYiEN1yEIfmN1wLCtlOijqA.eVpLSYqOHelaeLVW.6qyoS0jMB','The signature to use for the PayPal API service',6,0,NULL,'2010-10-26 11:20:49',NULL,NULL),(298,'API Username','MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME','adiab_api1.linuxmail.org','The username to use for the PayPal API service',6,0,NULL,'2010-10-26 11:20:49',NULL,NULL),(297,'Enable PayPal Fraud Managment Filters Check','MODULE_PAYMENT_PAYPAL_EXPRESS_FMF_STATUS','False','Are your Paypal Fraud Management Filters Enabled in your Paypal Merchant Admin?',6,0,NULL,'2010-10-26 11:20:49',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(296,'Recurring Payments Maximum Failed Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_MAXFAILEDPAYMENTS','0','Enter the max number of of scheduled payments that can fail before the profile is automatically suspended.',6,0,NULL,'2010-10-26 11:20:49',NULL,NULL),(295,'Recurring Payments Autobill','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_AUTOBILLOUTAMT','No','With PayPal Recurring Payments would you like any outstanding amounts automatically attempted to be collected?',6,0,NULL,'2010-10-26 11:20:49',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(294,'Enable PayPal Recurring Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_STATUS','True','Do you want to use PayPal Recurring Payments?',6,0,NULL,'2010-10-26 11:20:49',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(292,'Log File Location','MODULE_PAYMENT_PAYPAL_EXPRESS_LOGFILE','/tmp/paypal_express.log','The location for the log file, verify that there are write permission given to the file.',6,0,NULL,'2010-10-26 11:19:32',NULL,NULL),(293,'Enable PayPal Express Checkout','MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS','True','Do you want to accept PayPal Express Checkout payments?',6,1,NULL,'2010-10-26 11:20:49',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(291,'cURL Program Location','MODULE_PAYMENT_PAYPAL_EXPRESS_CURL','/usr/bin/curl','The location to the cURL program application.',6,0,NULL,'2010-10-26 11:19:32',NULL,NULL),(290,'Automatic Account Creation','MODULE_PAYMENT_PAYPAL_EXPRESS_NEW_ACCT_NOTIFY','Yes','If a visitor is not an existing customer, an account is created for them.  Would you like make it a permanent account and send them an email containing their login information?',6,9,NULL,'2010-10-26 11:19:32',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(288,'Sort order of display.','MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2010-10-26 11:19:32',NULL,NULL),(289,'Set Order Status','MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID','3','Set the status of orders made with this payment module to this value',6,0,NULL,'2010-10-26 11:19:32','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(287,'Payment Zone','MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2010-10-26 11:19:32','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(286,'Transaction Method','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD','Sale','The processing method to use for each transaction.',6,0,NULL,'2010-10-26 11:19:32',NULL,'tep_cfg_select_option(array(\'Authorization\', \'Sale\'), '),(285,'Transaction Server','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER','Live','Use the live or testing (sandbox) gateway server to process transactions?',6,0,NULL,'2010-10-26 11:19:32',NULL,'tep_cfg_select_option(array(\'Live\', \'Sandbox\'), '),(283,'API Password','MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD','BEDTLHQ7H7DVYGA3','The password to use for the PayPal API service',6,0,NULL,'2010-10-26 11:19:32',NULL,NULL),(284,'API Signature','MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE','AIeO4GaYiEN1yEIfmN1wLCtlOijqA.eVpLSYqOHelaeLVW.6qyoS0jMB','The signature to use for the PayPal API service',6,0,NULL,'2010-10-26 11:19:32',NULL,NULL),(282,'API Username','MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME','adiab_api1.linuxmail.org','The username to use for the PayPal API service',6,0,NULL,'2010-10-26 11:19:32',NULL,NULL),(277,'Enable PayPal Express Checkout','MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS','True','Do you want to accept PayPal Express Checkout payments?',6,1,NULL,'2010-10-26 11:19:32',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(281,'Enable PayPal Fraud Managment Filters Check','MODULE_PAYMENT_PAYPAL_EXPRESS_FMF_STATUS','False','Are your Paypal Fraud Management Filters Enabled in your Paypal Merchant Admin?',6,0,NULL,'2010-10-26 11:19:32',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(278,'Enable PayPal Recurring Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_STATUS','True','Do you want to use PayPal Recurring Payments?',6,0,NULL,'2010-10-26 11:19:32',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(279,'Recurring Payments Autobill','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_AUTOBILLOUTAMT','No','With PayPal Recurring Payments would you like any outstanding amounts automatically attempted to be collected?',6,0,NULL,'2010-10-26 11:19:32',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(280,'Recurring Payments Maximum Failed Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_MAXFAILEDPAYMENTS','0','Enter the max number of of scheduled payments that can fail before the profile is automatically suspended.',6,0,NULL,'2010-10-26 11:19:32',NULL,NULL),(304,'Sort order of display.','MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2010-10-26 11:20:49',NULL,NULL),(305,'Set Order Status','MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID','3','Set the status of orders made with this payment module to this value',6,0,NULL,'2010-10-26 11:20:49','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(306,'Automatic Account Creation','MODULE_PAYMENT_PAYPAL_EXPRESS_NEW_ACCT_NOTIFY','Yes','If a visitor is not an existing customer, an account is created for them.  Would you like make it a permanent account and send them an email containing their login information?',6,9,NULL,'2010-10-26 11:20:49',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(307,'cURL Program Location','MODULE_PAYMENT_PAYPAL_EXPRESS_CURL','/usr/bin/curl','The location to the cURL program application.',6,0,NULL,'2010-10-26 11:20:49',NULL,NULL),(308,'Log File Location','MODULE_PAYMENT_PAYPAL_EXPRESS_LOGFILE','/tmp/paypal_express.log','The location for the log file, verify that there are write permission given to the file.',6,0,NULL,'2010-10-26 11:20:49',NULL,NULL),(309,'Enable PayPal Express Checkout','MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS','True','Do you want to accept PayPal Express Checkout payments?',6,1,NULL,'2010-10-26 11:20:52',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(310,'Enable PayPal Recurring Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_STATUS','True','Do you want to use PayPal Recurring Payments?',6,0,NULL,'2010-10-26 11:20:52',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(311,'Recurring Payments Autobill','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_AUTOBILLOUTAMT','No','With PayPal Recurring Payments would you like any outstanding amounts automatically attempted to be collected?',6,0,NULL,'2010-10-26 11:20:52',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(312,'Recurring Payments Maximum Failed Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_MAXFAILEDPAYMENTS','0','Enter the max number of of scheduled payments that can fail before the profile is automatically suspended.',6,0,NULL,'2010-10-26 11:20:52',NULL,NULL),(313,'Enable PayPal Fraud Managment Filters Check','MODULE_PAYMENT_PAYPAL_EXPRESS_FMF_STATUS','False','Are your Paypal Fraud Management Filters Enabled in your Paypal Merchant Admin?',6,0,NULL,'2010-10-26 11:20:52',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(314,'API Username','MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME','adiab_api1.linuxmail.org','The username to use for the PayPal API service',6,0,NULL,'2010-10-26 11:20:52',NULL,NULL),(315,'API Password','MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD','BEDTLHQ7H7DVYGA3','The password to use for the PayPal API service',6,0,NULL,'2010-10-26 11:20:52',NULL,NULL),(316,'API Signature','MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE','AIeO4GaYiEN1yEIfmN1wLCtlOijqA.eVpLSYqOHelaeLVW.6qyoS0jMB','The signature to use for the PayPal API service',6,0,NULL,'2010-10-26 11:20:52',NULL,NULL),(317,'Transaction Server','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER','Live','Use the live or testing (sandbox) gateway server to process transactions?',6,0,NULL,'2010-10-26 11:20:52',NULL,'tep_cfg_select_option(array(\'Live\', \'Sandbox\'), '),(318,'Transaction Method','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD','Sale','The processing method to use for each transaction.',6,0,NULL,'2010-10-26 11:20:52',NULL,'tep_cfg_select_option(array(\'Authorization\', \'Sale\'), '),(319,'Payment Zone','MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2010-10-26 11:20:52','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(320,'Sort order of display.','MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2010-10-26 11:20:52',NULL,NULL),(321,'Set Order Status','MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID','3','Set the status of orders made with this payment module to this value',6,0,NULL,'2010-10-26 11:20:52','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(322,'Automatic Account Creation','MODULE_PAYMENT_PAYPAL_EXPRESS_NEW_ACCT_NOTIFY','Yes','If a visitor is not an existing customer, an account is created for them.  Would you like make it a permanent account and send them an email containing their login information?',6,9,NULL,'2010-10-26 11:20:52',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(323,'cURL Program Location','MODULE_PAYMENT_PAYPAL_EXPRESS_CURL','/usr/bin/curl','The location to the cURL program application.',6,0,NULL,'2010-10-26 11:20:52',NULL,NULL),(324,'Log File Location','MODULE_PAYMENT_PAYPAL_EXPRESS_LOGFILE','/tmp/paypal_express.log','The location for the log file, verify that there are write permission given to the file.',6,0,NULL,'2010-10-26 11:20:52',NULL,NULL),(325,'Enable PayPal Express Checkout','MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS','True','Do you want to accept PayPal Express Checkout payments?',6,1,NULL,'2010-10-26 11:20:57',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(326,'Enable PayPal Recurring Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_STATUS','True','Do you want to use PayPal Recurring Payments?',6,0,NULL,'2010-10-26 11:20:57',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(327,'Recurring Payments Autobill','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_AUTOBILLOUTAMT','No','With PayPal Recurring Payments would you like any outstanding amounts automatically attempted to be collected?',6,0,NULL,'2010-10-26 11:20:57',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(328,'Recurring Payments Maximum Failed Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_MAXFAILEDPAYMENTS','0','Enter the max number of of scheduled payments that can fail before the profile is automatically suspended.',6,0,NULL,'2010-10-26 11:20:57',NULL,NULL),(329,'Enable PayPal Fraud Managment Filters Check','MODULE_PAYMENT_PAYPAL_EXPRESS_FMF_STATUS','False','Are your Paypal Fraud Management Filters Enabled in your Paypal Merchant Admin?',6,0,NULL,'2010-10-26 11:20:57',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(330,'API Username','MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME','adiab_api1.linuxmail.org','The username to use for the PayPal API service',6,0,NULL,'2010-10-26 11:20:57',NULL,NULL),(331,'API Password','MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD','BEDTLHQ7H7DVYGA3','The password to use for the PayPal API service',6,0,NULL,'2010-10-26 11:20:57',NULL,NULL),(332,'API Signature','MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE','AIeO4GaYiEN1yEIfmN1wLCtlOijqA.eVpLSYqOHelaeLVW.6qyoS0jMB','The signature to use for the PayPal API service',6,0,NULL,'2010-10-26 11:20:57',NULL,NULL),(333,'Transaction Server','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER','Live','Use the live or testing (sandbox) gateway server to process transactions?',6,0,NULL,'2010-10-26 11:20:57',NULL,'tep_cfg_select_option(array(\'Live\', \'Sandbox\'), '),(334,'Transaction Method','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD','Sale','The processing method to use for each transaction.',6,0,NULL,'2010-10-26 11:20:57',NULL,'tep_cfg_select_option(array(\'Authorization\', \'Sale\'), '),(335,'Payment Zone','MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2010-10-26 11:20:57','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(336,'Sort order of display.','MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2010-10-26 11:20:57',NULL,NULL),(337,'Set Order Status','MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID','3','Set the status of orders made with this payment module to this value',6,0,NULL,'2010-10-26 11:20:57','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(338,'Automatic Account Creation','MODULE_PAYMENT_PAYPAL_EXPRESS_NEW_ACCT_NOTIFY','Yes','If a visitor is not an existing customer, an account is created for them.  Would you like make it a permanent account and send them an email containing their login information?',6,9,NULL,'2010-10-26 11:20:57',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(339,'cURL Program Location','MODULE_PAYMENT_PAYPAL_EXPRESS_CURL','/usr/bin/curl','The location to the cURL program application.',6,0,NULL,'2010-10-26 11:20:57',NULL,NULL),(340,'Log File Location','MODULE_PAYMENT_PAYPAL_EXPRESS_LOGFILE','/tmp/paypal_express.log','The location for the log file, verify that there are write permission given to the file.',6,0,NULL,'2010-10-26 11:20:57',NULL,NULL),(341,'Enable PayPal Express Checkout','MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS','True','Do you want to accept PayPal Express Checkout payments?',6,1,NULL,'2010-10-26 11:20:59',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(342,'Enable PayPal Recurring Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_STATUS','True','Do you want to use PayPal Recurring Payments?',6,0,NULL,'2010-10-26 11:20:59',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(343,'Recurring Payments Autobill','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_AUTOBILLOUTAMT','No','With PayPal Recurring Payments would you like any outstanding amounts automatically attempted to be collected?',6,0,NULL,'2010-10-26 11:20:59',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(344,'Recurring Payments Maximum Failed Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_MAXFAILEDPAYMENTS','0','Enter the max number of of scheduled payments that can fail before the profile is automatically suspended.',6,0,NULL,'2010-10-26 11:20:59',NULL,NULL),(345,'Enable PayPal Fraud Managment Filters Check','MODULE_PAYMENT_PAYPAL_EXPRESS_FMF_STATUS','False','Are your Paypal Fraud Management Filters Enabled in your Paypal Merchant Admin?',6,0,NULL,'2010-10-26 11:20:59',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(346,'API Username','MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME','adiab_api1.linuxmail.org','The username to use for the PayPal API service',6,0,NULL,'2010-10-26 11:20:59',NULL,NULL),(347,'API Password','MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD','BEDTLHQ7H7DVYGA3','The password to use for the PayPal API service',6,0,NULL,'2010-10-26 11:20:59',NULL,NULL),(348,'API Signature','MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE','AIeO4GaYiEN1yEIfmN1wLCtlOijqA.eVpLSYqOHelaeLVW.6qyoS0jMB','The signature to use for the PayPal API service',6,0,NULL,'2010-10-26 11:20:59',NULL,NULL),(349,'Transaction Server','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER','Live','Use the live or testing (sandbox) gateway server to process transactions?',6,0,NULL,'2010-10-26 11:20:59',NULL,'tep_cfg_select_option(array(\'Live\', \'Sandbox\'), '),(350,'Transaction Method','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD','Sale','The processing method to use for each transaction.',6,0,NULL,'2010-10-26 11:20:59',NULL,'tep_cfg_select_option(array(\'Authorization\', \'Sale\'), '),(351,'Payment Zone','MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2010-10-26 11:20:59','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(352,'Sort order of display.','MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2010-10-26 11:20:59',NULL,NULL),(353,'Set Order Status','MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID','3','Set the status of orders made with this payment module to this value',6,0,NULL,'2010-10-26 11:20:59','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(354,'Automatic Account Creation','MODULE_PAYMENT_PAYPAL_EXPRESS_NEW_ACCT_NOTIFY','Yes','If a visitor is not an existing customer, an account is created for them.  Would you like make it a permanent account and send them an email containing their login information?',6,9,NULL,'2010-10-26 11:20:59',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(355,'cURL Program Location','MODULE_PAYMENT_PAYPAL_EXPRESS_CURL','/usr/bin/curl','The location to the cURL program application.',6,0,NULL,'2010-10-26 11:20:59',NULL,NULL),(356,'Log File Location','MODULE_PAYMENT_PAYPAL_EXPRESS_LOGFILE','/tmp/paypal_express.log','The location for the log file, verify that there are write permission given to the file.',6,0,NULL,'2010-10-26 11:20:59',NULL,NULL),(357,'Enable PayPal Express Checkout','MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS','True','Do you want to accept PayPal Express Checkout payments?',6,1,NULL,'2010-10-26 11:21:00',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(358,'Enable PayPal Recurring Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_STATUS','True','Do you want to use PayPal Recurring Payments?',6,0,NULL,'2010-10-26 11:21:00',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(359,'Recurring Payments Autobill','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_AUTOBILLOUTAMT','No','With PayPal Recurring Payments would you like any outstanding amounts automatically attempted to be collected?',6,0,NULL,'2010-10-26 11:21:00',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(360,'Recurring Payments Maximum Failed Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_MAXFAILEDPAYMENTS','0','Enter the max number of of scheduled payments that can fail before the profile is automatically suspended.',6,0,NULL,'2010-10-26 11:21:00',NULL,NULL),(361,'Enable PayPal Fraud Managment Filters Check','MODULE_PAYMENT_PAYPAL_EXPRESS_FMF_STATUS','False','Are your Paypal Fraud Management Filters Enabled in your Paypal Merchant Admin?',6,0,NULL,'2010-10-26 11:21:00',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(362,'API Username','MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME','adiab_api1.linuxmail.org','The username to use for the PayPal API service',6,0,NULL,'2010-10-26 11:21:00',NULL,NULL),(363,'API Password','MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD','BEDTLHQ7H7DVYGA3','The password to use for the PayPal API service',6,0,NULL,'2010-10-26 11:21:00',NULL,NULL),(364,'API Signature','MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE','AIeO4GaYiEN1yEIfmN1wLCtlOijqA.eVpLSYqOHelaeLVW.6qyoS0jMB','The signature to use for the PayPal API service',6,0,NULL,'2010-10-26 11:21:00',NULL,NULL),(365,'Transaction Server','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER','Live','Use the live or testing (sandbox) gateway server to process transactions?',6,0,NULL,'2010-10-26 11:21:00',NULL,'tep_cfg_select_option(array(\'Live\', \'Sandbox\'), '),(366,'Transaction Method','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD','Sale','The processing method to use for each transaction.',6,0,NULL,'2010-10-26 11:21:00',NULL,'tep_cfg_select_option(array(\'Authorization\', \'Sale\'), '),(367,'Payment Zone','MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2010-10-26 11:21:00','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(368,'Sort order of display.','MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2010-10-26 11:21:00',NULL,NULL),(369,'Set Order Status','MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID','3','Set the status of orders made with this payment module to this value',6,0,NULL,'2010-10-26 11:21:00','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(370,'Automatic Account Creation','MODULE_PAYMENT_PAYPAL_EXPRESS_NEW_ACCT_NOTIFY','Yes','If a visitor is not an existing customer, an account is created for them.  Would you like make it a permanent account and send them an email containing their login information?',6,9,NULL,'2010-10-26 11:21:00',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(371,'cURL Program Location','MODULE_PAYMENT_PAYPAL_EXPRESS_CURL','/usr/bin/curl','The location to the cURL program application.',6,0,NULL,'2010-10-26 11:21:00',NULL,NULL),(372,'Log File Location','MODULE_PAYMENT_PAYPAL_EXPRESS_LOGFILE','/tmp/paypal_express.log','The location for the log file, verify that there are write permission given to the file.',6,0,NULL,'2010-10-26 11:21:00',NULL,NULL),(373,'Enable PayPal Express Checkout','MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS','True','Do you want to accept PayPal Express Checkout payments?',6,1,NULL,'2010-10-26 11:21:05',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(374,'Enable PayPal Recurring Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_STATUS','True','Do you want to use PayPal Recurring Payments?',6,0,NULL,'2010-10-26 11:21:05',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(375,'Recurring Payments Autobill','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_AUTOBILLOUTAMT','No','With PayPal Recurring Payments would you like any outstanding amounts automatically attempted to be collected?',6,0,NULL,'2010-10-26 11:21:05',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(376,'Recurring Payments Maximum Failed Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_MAXFAILEDPAYMENTS','0','Enter the max number of of scheduled payments that can fail before the profile is automatically suspended.',6,0,NULL,'2010-10-26 11:21:05',NULL,NULL),(377,'Enable PayPal Fraud Managment Filters Check','MODULE_PAYMENT_PAYPAL_EXPRESS_FMF_STATUS','False','Are your Paypal Fraud Management Filters Enabled in your Paypal Merchant Admin?',6,0,NULL,'2010-10-26 11:21:05',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(378,'API Username','MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME','adiab_api1.linuxmail.org','The username to use for the PayPal API service',6,0,NULL,'2010-10-26 11:21:05',NULL,NULL),(379,'API Password','MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD','BEDTLHQ7H7DVYGA3','The password to use for the PayPal API service',6,0,NULL,'2010-10-26 11:21:05',NULL,NULL),(380,'API Signature','MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE','AIeO4GaYiEN1yEIfmN1wLCtlOijqA.eVpLSYqOHelaeLVW.6qyoS0jMB','The signature to use for the PayPal API service',6,0,NULL,'2010-10-26 11:21:05',NULL,NULL),(381,'Transaction Server','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER','Live','Use the live or testing (sandbox) gateway server to process transactions?',6,0,NULL,'2010-10-26 11:21:05',NULL,'tep_cfg_select_option(array(\'Live\', \'Sandbox\'), '),(382,'Transaction Method','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD','Sale','The processing method to use for each transaction.',6,0,NULL,'2010-10-26 11:21:05',NULL,'tep_cfg_select_option(array(\'Authorization\', \'Sale\'), '),(383,'Payment Zone','MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2010-10-26 11:21:05','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(384,'Sort order of display.','MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2010-10-26 11:21:05',NULL,NULL),(385,'Set Order Status','MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID','3','Set the status of orders made with this payment module to this value',6,0,NULL,'2010-10-26 11:21:05','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(386,'Automatic Account Creation','MODULE_PAYMENT_PAYPAL_EXPRESS_NEW_ACCT_NOTIFY','Yes','If a visitor is not an existing customer, an account is created for them.  Would you like make it a permanent account and send them an email containing their login information?',6,9,NULL,'2010-10-26 11:21:05',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(387,'cURL Program Location','MODULE_PAYMENT_PAYPAL_EXPRESS_CURL','/usr/bin/curl','The location to the cURL program application.',6,0,NULL,'2010-10-26 11:21:05',NULL,NULL),(388,'Log File Location','MODULE_PAYMENT_PAYPAL_EXPRESS_LOGFILE','/tmp/paypal_express.log','The location for the log file, verify that there are write permission given to the file.',6,0,NULL,'2010-10-26 11:21:05',NULL,NULL),(389,'Enable PayPal Express Checkout','MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS','True','Do you want to accept PayPal Express Checkout payments?',6,1,NULL,'2010-11-18 17:17:27',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(390,'Enable PayPal Recurring Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_STATUS','True','Do you want to use PayPal Recurring Payments?',6,0,NULL,'2010-11-18 17:17:27',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(391,'Recurring Payments Autobill','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_AUTOBILLOUTAMT','No','With PayPal Recurring Payments would you like any outstanding amounts automatically attempted to be collected?',6,0,NULL,'2010-11-18 17:17:27',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(392,'Recurring Payments Maximum Failed Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_MAXFAILEDPAYMENTS','0','Enter the max number of of scheduled payments that can fail before the profile is automatically suspended.',6,0,NULL,'2010-11-18 17:17:27',NULL,NULL),(393,'Enable PayPal Fraud Managment Filters Check','MODULE_PAYMENT_PAYPAL_EXPRESS_FMF_STATUS','False','Are your Paypal Fraud Management Filters Enabled in your Paypal Merchant Admin?',6,0,NULL,'2010-11-18 17:17:27',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(394,'API Username','MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME','adiab_api1.linuxmail.org','The username to use for the PayPal API service',6,0,NULL,'2010-11-18 17:17:27',NULL,NULL),(395,'API Password','MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD','BEDTLHQ7H7DVYGA3','The password to use for the PayPal API service',6,0,NULL,'2010-11-18 17:17:27',NULL,NULL),(396,'API Signature','MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE','AIeO4GaYiEN1yEIfmN1wLCtlOijqA.eVpLSYqOHelaeLVW.6qyoS0jMB','The signature to use for the PayPal API service',6,0,NULL,'2010-11-18 17:17:27',NULL,NULL),(397,'Transaction Server','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER','Live','Use the live or testing (sandbox) gateway server to process transactions?',6,0,NULL,'2010-11-18 17:17:27',NULL,'tep_cfg_select_option(array(\'Live\', \'Sandbox\'), '),(398,'Transaction Method','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD','Sale','The processing method to use for each transaction.',6,0,NULL,'2010-11-18 17:17:27',NULL,'tep_cfg_select_option(array(\'Authorization\', \'Sale\'), '),(399,'Payment Zone','MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2010-11-18 17:17:27','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(400,'Sort order of display.','MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2010-11-18 17:17:27',NULL,NULL),(401,'Set Order Status','MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID','3','Set the status of orders made with this payment module to this value',6,0,NULL,'2010-11-18 17:17:27','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(402,'Automatic Account Creation','MODULE_PAYMENT_PAYPAL_EXPRESS_NEW_ACCT_NOTIFY','Yes','If a visitor is not an existing customer, an account is created for them.  Would you like make it a permanent account and send them an email containing their login information?',6,9,NULL,'2010-11-18 17:17:27',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(403,'cURL Program Location','MODULE_PAYMENT_PAYPAL_EXPRESS_CURL','/usr/bin/curl','The location to the cURL program application.',6,0,NULL,'2010-11-18 17:17:27',NULL,NULL),(404,'Log File Location','MODULE_PAYMENT_PAYPAL_EXPRESS_LOGFILE','/tmp/paypal_express.log','The location for the log file, verify that there are write permission given to the file.',6,0,NULL,'2010-11-18 17:17:27',NULL,NULL),(405,'Enable PayPal Express Checkout','MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS','True','Do you want to accept PayPal Express Checkout payments?',6,1,NULL,'2010-11-18 17:17:30',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(406,'Enable PayPal Recurring Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_STATUS','True','Do you want to use PayPal Recurring Payments?',6,0,NULL,'2010-11-18 17:17:30',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(407,'Recurring Payments Autobill','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_AUTOBILLOUTAMT','No','With PayPal Recurring Payments would you like any outstanding amounts automatically attempted to be collected?',6,0,NULL,'2010-11-18 17:17:30',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(408,'Recurring Payments Maximum Failed Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_MAXFAILEDPAYMENTS','0','Enter the max number of of scheduled payments that can fail before the profile is automatically suspended.',6,0,NULL,'2010-11-18 17:17:30',NULL,NULL),(409,'Enable PayPal Fraud Managment Filters Check','MODULE_PAYMENT_PAYPAL_EXPRESS_FMF_STATUS','False','Are your Paypal Fraud Management Filters Enabled in your Paypal Merchant Admin?',6,0,NULL,'2010-11-18 17:17:30',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(410,'API Username','MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME','adiab_api1.linuxmail.org','The username to use for the PayPal API service',6,0,NULL,'2010-11-18 17:17:30',NULL,NULL),(411,'API Password','MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD','BEDTLHQ7H7DVYGA3','The password to use for the PayPal API service',6,0,NULL,'2010-11-18 17:17:30',NULL,NULL),(412,'API Signature','MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE','AIeO4GaYiEN1yEIfmN1wLCtlOijqA.eVpLSYqOHelaeLVW.6qyoS0jMB','The signature to use for the PayPal API service',6,0,NULL,'2010-11-18 17:17:30',NULL,NULL),(413,'Transaction Server','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER','Live','Use the live or testing (sandbox) gateway server to process transactions?',6,0,NULL,'2010-11-18 17:17:30',NULL,'tep_cfg_select_option(array(\'Live\', \'Sandbox\'), '),(414,'Transaction Method','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD','Sale','The processing method to use for each transaction.',6,0,NULL,'2010-11-18 17:17:30',NULL,'tep_cfg_select_option(array(\'Authorization\', \'Sale\'), '),(415,'Payment Zone','MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2010-11-18 17:17:30','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(416,'Sort order of display.','MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2010-11-18 17:17:30',NULL,NULL),(417,'Set Order Status','MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID','3','Set the status of orders made with this payment module to this value',6,0,NULL,'2010-11-18 17:17:30','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(418,'Automatic Account Creation','MODULE_PAYMENT_PAYPAL_EXPRESS_NEW_ACCT_NOTIFY','Yes','If a visitor is not an existing customer, an account is created for them.  Would you like make it a permanent account and send them an email containing their login information?',6,9,NULL,'2010-11-18 17:17:30',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(419,'cURL Program Location','MODULE_PAYMENT_PAYPAL_EXPRESS_CURL','/usr/bin/curl','The location to the cURL program application.',6,0,NULL,'2010-11-18 17:17:30',NULL,NULL),(420,'Log File Location','MODULE_PAYMENT_PAYPAL_EXPRESS_LOGFILE','/tmp/paypal_express.log','The location for the log file, verify that there are write permission given to the file.',6,0,NULL,'2010-11-18 17:17:30',NULL,NULL),(421,'Enable PayPal Express Checkout','MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS','True','Do you want to accept PayPal Express Checkout payments?',6,1,NULL,'2010-12-08 12:19:12',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(422,'Enable PayPal Recurring Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_STATUS','False','Do you want to use PayPal Recurring Payments?',6,0,NULL,'2010-12-08 12:19:12',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(423,'Recurring Payments Autobill','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_AUTOBILLOUTAMT','No','With PayPal Recurring Payments would you like any outstanding amounts automatically attempted to be collected?',6,0,NULL,'2010-12-08 12:19:12',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(424,'Recurring Payments Maximum Failed Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_MAXFAILEDPAYMENTS','0','Enter the max number of of scheduled payments that can fail before the profile is automatically suspended.',6,0,NULL,'2010-12-08 12:19:12',NULL,NULL),(425,'Enable PayPal Fraud Managment Filters Check','MODULE_PAYMENT_PAYPAL_EXPRESS_FMF_STATUS','False','Are your Paypal Fraud Management Filters Enabled in your Paypal Merchant Admin?',6,0,NULL,'2010-12-08 12:19:12',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(426,'API Username','MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME','','The username to use for the PayPal API service',6,0,NULL,'2010-12-08 12:19:12',NULL,NULL),(427,'API Password','MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD','','The password to use for the PayPal API service',6,0,NULL,'2010-12-08 12:19:12',NULL,NULL),(428,'API Signature','MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE','','The signature to use for the PayPal API service',6,0,NULL,'2010-12-08 12:19:12',NULL,NULL),(429,'Transaction Server','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER','Sandbox','Use the live or testing (sandbox) gateway server to process transactions?',6,0,NULL,'2010-12-08 12:19:12',NULL,'tep_cfg_select_option(array(\'Live\', \'Sandbox\'), '),(430,'Transaction Method','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD','Sale','The processing method to use for each transaction.',6,0,NULL,'2010-12-08 12:19:12',NULL,'tep_cfg_select_option(array(\'Authorization\', \'Sale\'), '),(431,'Payment Zone','MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2010-12-08 12:19:12','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(432,'Sort order of display.','MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2010-12-08 12:19:12',NULL,NULL),(433,'Set Order Status','MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID','0','Set the status of orders made with this payment module to this value',6,0,NULL,'2010-12-08 12:19:12','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(434,'Automatic Account Creation','MODULE_PAYMENT_PAYPAL_EXPRESS_NEW_ACCT_NOTIFY','Yes','If a visitor is not an existing customer, an account is created for them.  Would you like make it a permanent account and send them an email containing their login information?',6,9,NULL,'2010-12-08 12:19:12',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(435,'cURL Program Location','MODULE_PAYMENT_PAYPAL_EXPRESS_CURL','/usr/bin/curl','The location to the cURL program application.',6,0,NULL,'2010-12-08 12:19:12',NULL,NULL),(436,'Log File Location','MODULE_PAYMENT_PAYPAL_EXPRESS_LOGFILE','/tmp/paypal_express.log','The location for the log file, verify that there are write permission given to the file.',6,0,NULL,'2010-12-08 12:19:12',NULL,NULL),(437,'Enable PayPal Express Checkout','MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS','True','Do you want to accept PayPal Express Checkout payments?',6,1,NULL,'2010-12-08 12:19:55',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(438,'Enable PayPal Recurring Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_STATUS','False','Do you want to use PayPal Recurring Payments?',6,0,NULL,'2010-12-08 12:19:55',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(439,'Recurring Payments Autobill','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_AUTOBILLOUTAMT','No','With PayPal Recurring Payments would you like any outstanding amounts automatically attempted to be collected?',6,0,NULL,'2010-12-08 12:19:55',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(440,'Recurring Payments Maximum Failed Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_MAXFAILEDPAYMENTS','0','Enter the max number of of scheduled payments that can fail before the profile is automatically suspended.',6,0,NULL,'2010-12-08 12:19:55',NULL,NULL),(441,'Enable PayPal Fraud Managment Filters Check','MODULE_PAYMENT_PAYPAL_EXPRESS_FMF_STATUS','False','Are your Paypal Fraud Management Filters Enabled in your Paypal Merchant Admin?',6,0,NULL,'2010-12-08 12:19:55',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(442,'API Username','MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME','','The username to use for the PayPal API service',6,0,NULL,'2010-12-08 12:19:55',NULL,NULL),(443,'API Password','MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD','','The password to use for the PayPal API service',6,0,NULL,'2010-12-08 12:19:55',NULL,NULL),(444,'API Signature','MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE','','The signature to use for the PayPal API service',6,0,NULL,'2010-12-08 12:19:55',NULL,NULL),(445,'Transaction Server','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER','Sandbox','Use the live or testing (sandbox) gateway server to process transactions?',6,0,NULL,'2010-12-08 12:19:55',NULL,'tep_cfg_select_option(array(\'Live\', \'Sandbox\'), '),(446,'Transaction Method','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD','Sale','The processing method to use for each transaction.',6,0,NULL,'2010-12-08 12:19:55',NULL,'tep_cfg_select_option(array(\'Authorization\', \'Sale\'), '),(447,'Payment Zone','MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2010-12-08 12:19:55','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(448,'Sort order of display.','MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2010-12-08 12:19:55',NULL,NULL),(449,'Set Order Status','MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID','0','Set the status of orders made with this payment module to this value',6,0,NULL,'2010-12-08 12:19:55','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(450,'Automatic Account Creation','MODULE_PAYMENT_PAYPAL_EXPRESS_NEW_ACCT_NOTIFY','Yes','If a visitor is not an existing customer, an account is created for them.  Would you like make it a permanent account and send them an email containing their login information?',6,9,NULL,'2010-12-08 12:19:55',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(451,'cURL Program Location','MODULE_PAYMENT_PAYPAL_EXPRESS_CURL','/usr/bin/curl','The location to the cURL program application.',6,0,NULL,'2010-12-08 12:19:55',NULL,NULL),(452,'Log File Location','MODULE_PAYMENT_PAYPAL_EXPRESS_LOGFILE','/tmp/paypal_express.log','The location for the log file, verify that there are write permission given to the file.',6,0,NULL,'2010-12-08 12:19:55',NULL,NULL),(453,'Enable PayPal Express Checkout','MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS','True','Do you want to accept PayPal Express Checkout payments?',6,1,NULL,'2010-12-08 12:19:59',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(454,'Enable PayPal Recurring Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_STATUS','False','Do you want to use PayPal Recurring Payments?',6,0,NULL,'2010-12-08 12:19:59',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(455,'Recurring Payments Autobill','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_AUTOBILLOUTAMT','No','With PayPal Recurring Payments would you like any outstanding amounts automatically attempted to be collected?',6,0,NULL,'2010-12-08 12:19:59',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(456,'Recurring Payments Maximum Failed Payments','MODULE_PAYMENT_PAYPAL_EXPRESS_RP_MAXFAILEDPAYMENTS','0','Enter the max number of of scheduled payments that can fail before the profile is automatically suspended.',6,0,NULL,'2010-12-08 12:19:59',NULL,NULL),(457,'Enable PayPal Fraud Managment Filters Check','MODULE_PAYMENT_PAYPAL_EXPRESS_FMF_STATUS','False','Are your Paypal Fraud Management Filters Enabled in your Paypal Merchant Admin?',6,0,NULL,'2010-12-08 12:19:59',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(458,'API Username','MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME','','The username to use for the PayPal API service',6,0,NULL,'2010-12-08 12:19:59',NULL,NULL),(459,'API Password','MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD','','The password to use for the PayPal API service',6,0,NULL,'2010-12-08 12:19:59',NULL,NULL),(460,'API Signature','MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE','','The signature to use for the PayPal API service',6,0,NULL,'2010-12-08 12:19:59',NULL,NULL),(461,'Transaction Server','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER','Sandbox','Use the live or testing (sandbox) gateway server to process transactions?',6,0,NULL,'2010-12-08 12:19:59',NULL,'tep_cfg_select_option(array(\'Live\', \'Sandbox\'), '),(462,'Transaction Method','MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD','Sale','The processing method to use for each transaction.',6,0,NULL,'2010-12-08 12:19:59',NULL,'tep_cfg_select_option(array(\'Authorization\', \'Sale\'), '),(463,'Payment Zone','MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2010-12-08 12:19:59','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(464,'Sort order of display.','MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2010-12-08 12:19:59',NULL,NULL),(465,'Set Order Status','MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID','0','Set the status of orders made with this payment module to this value',6,0,NULL,'2010-12-08 12:19:59','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(466,'Automatic Account Creation','MODULE_PAYMENT_PAYPAL_EXPRESS_NEW_ACCT_NOTIFY','Yes','If a visitor is not an existing customer, an account is created for them.  Would you like make it a permanent account and send them an email containing their login information?',6,9,NULL,'2010-12-08 12:19:59',NULL,'tep_cfg_select_option(array(\'Yes\', \'No\'), '),(467,'cURL Program Location','MODULE_PAYMENT_PAYPAL_EXPRESS_CURL','/usr/bin/curl','The location to the cURL program application.',6,0,NULL,'2010-12-08 12:19:59',NULL,NULL),(468,'Log File Location','MODULE_PAYMENT_PAYPAL_EXPRESS_LOGFILE','/tmp/paypal_express.log','The location for the log file, verify that there are write permission given to the file.',6,0,NULL,'2010-12-08 12:19:59',NULL,NULL),(469,'Enable discount coupon?','MODULE_ORDER_TOTAL_DISCOUNT_COUPON_STATUS','true','',615,1,NULL,'2010-12-26 20:53:34',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(470,'Sort Order','MODULE_ORDER_TOTAL_DISCOUNT_COUPON_SORT_ORDER','0','Order in which the discount coupon code order total line will be displayed on order confirmation, invoice, etc.',615,2,NULL,'2010-12-26 20:53:34',NULL,''),(471,'Display discount with minus (-) sign?','MODULE_ORDER_TOTAL_DISCOUNT_COUPON_DISPLAY_TYPE','true','<b>true</b> - the discount will be displayed with a minus sign<br><b>false</b> - the discount will be displayed without a minus sign',615,3,NULL,'2010-12-26 20:53:34',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(472,'Display subtotal with applied discount?','MODULE_ORDER_TOTAL_DISCOUNT_COUPON_DISPLAY_SUBTOTAL','true','<b>true</b> - the order subtotal will be displayed with the discount applied<br><b>false</b> - the order subtotal will be displayed without the discount applied',615,4,NULL,'2010-12-26 20:53:34',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(473,'Display tax in discount line?','MODULE_ORDER_TOTAL_DISCOUNT_COUPON_DISPLAY_TAX','None','Select the method for displaying tax in the discount line.',615,5,NULL,'2010-12-26 20:53:34',NULL,'tep_cfg_select_option(array(\'None\', \'Display discounted tax in separate line\', \'Display discount with discounted tax applied\'), '),(474,'Exclude product specials?','MODULE_ORDER_TOTAL_DISCOUNT_COUPON_EXCLUDE_SPECIALS','true','<b>true</b> - products with active specials will be excluded from discounts<br><b>false</b> - products with active specials will NOT be excluded from discounts',615,6,NULL,'2010-12-26 20:53:34',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(475,'Random Code Length','MODULE_ORDER_TOTAL_DISCOUNT_COUPON_RANDOM_CODE_LENGTH','6','Length for randomly generated coupon codes.',615,7,NULL,'2010-12-26 20:53:34',NULL,''),(476,'Display discount total lines for each tax group?','MODULE_ORDER_TOTAL_DISCOUNT_COUPON_DISPLAY_LINES','false','<b>true</b> - the discount coupon order total lines will be displayed for each tax group for the order<br><b>false</b> - the discount order total lines will be combined and displayed as one line',615,8,NULL,'2010-12-26 20:53:34',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(477,'Allow negative order total?','MODULE_ORDER_TOTAL_DISCOUNT_COUPON_ALLOW_NEGATIVE','false','Set to true if you want negative order totals when the discount is greater than the order total.',615,9,NULL,'2010-12-26 20:53:34',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(478,'Use the language file to format display string?','MODULE_ORDER_TOTAL_DISCOUNT_COUPON_USE_LANGUAGE_FILE','false','<b>true</b> - use the format found in language file (used for when you have multiple languages and want the order total line to format display depending on language choice)<br><b>false</b> - use the format and language below',615,10,NULL,'2010-12-26 20:53:34',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(479,'Display Format for Order Total Line','MODULE_ORDER_TOTAL_DISCOUNT_COUPON_DISPLAY_CONFIG','Discount Coupon [code] applied','Display format for the discount coupon code order total line.<br><br>Variables:<br>[code]<br>[coupon_desc]<br>[discount_amount]<br>[min_order]<br>[number_available]<br>[tax_desc]',615,11,NULL,'2010-12-26 20:53:34',NULL,''),(480,'Debug Mode','MODULE_ORDER_TOTAL_DISCOUNT_COUPON_DEBUG','false','To use: on checkout confirmation page, View Source in browser for debug output. <b>This must be set to false for live shops or error messages will not display.</b>',615,12,NULL,'2010-12-26 20:53:34',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), ');
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_group`
--

DROP TABLE IF EXISTS `configuration_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_group` (
  `configuration_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_group_title` varchar(64) NOT NULL,
  `configuration_group_description` varchar(255) NOT NULL,
  `sort_order` int(5) DEFAULT NULL,
  `visible` int(1) DEFAULT '1',
  PRIMARY KEY (`configuration_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_group`
--

LOCK TABLES `configuration_group` WRITE;
/*!40000 ALTER TABLE `configuration_group` DISABLE KEYS */;
INSERT INTO `configuration_group` VALUES (1,'My Store','General information about my store',1,1),(2,'Minimum Values','The minimum values for functions / data',2,1),(3,'Maximum Values','The maximum values for functions / data',3,1),(4,'Images','Image parameters',4,1),(5,'Customer Details','Customer account configuration',5,1),(6,'Module Options','Hidden from configuration',6,0),(7,'Shipping/Packaging','Shipping options available at my store',7,1),(8,'Product Listing','Product Listing    configuration options',8,1),(9,'Stock','Stock configuration options',9,1),(10,'Logging','Logging configuration options',10,1),(11,'Cache','Caching configuration options',11,1),(12,'E-Mail Options','General setting for E-Mail transport and HTML E-Mails',12,1),(13,'Download','Downloadable products options',13,1),(14,'GZip Compression','GZip compression options',14,1),(15,'Sessions','Session options',15,1);
/*!40000 ALTER TABLE `configuration_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter` (
  `startdate` char(8) DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES ('20100102',256403);
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter_history`
--

DROP TABLE IF EXISTS `counter_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter_history` (
  `month` char(8) DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter_history`
--

LOCK TABLES `counter_history` WRITE;
/*!40000 ALTER TABLE `counter_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `counter_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `countries_id` int(11) NOT NULL AUTO_INCREMENT,
  `countries_name` varchar(64) NOT NULL,
  `countries_iso_code_2` char(2) NOT NULL,
  `countries_iso_code_3` char(3) NOT NULL,
  `address_format_id` int(11) NOT NULL,
  PRIMARY KEY (`countries_id`),
  KEY `IDX_COUNTRIES_NAME` (`countries_name`)
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Afghanistan','AF','AFG',1),(2,'Albania','AL','ALB',1),(3,'Algeria','DZ','DZA',1),(4,'American Samoa','AS','ASM',1),(5,'Andorra','AD','AND',1),(6,'Angola','AO','AGO',1),(7,'Anguilla','AI','AIA',1),(8,'Antarctica','AQ','ATA',1),(9,'Antigua and Barbuda','AG','ATG',1),(10,'Argentina','AR','ARG',1),(11,'Armenia','AM','ARM',1),(12,'Aruba','AW','ABW',1),(13,'Australia','AU','AUS',1),(14,'Austria','AT','AUT',5),(15,'Azerbaijan','AZ','AZE',1),(16,'Bahamas','BS','BHS',1),(17,'Bahrain','BH','BHR',1),(18,'Bangladesh','BD','BGD',1),(19,'Barbados','BB','BRB',1),(20,'Belarus','BY','BLR',1),(21,'Belgium','BE','BEL',1),(22,'Belize','BZ','BLZ',1),(23,'Benin','BJ','BEN',1),(24,'Bermuda','BM','BMU',1),(25,'Bhutan','BT','BTN',1),(26,'Bolivia','BO','BOL',1),(27,'Bosnia and Herzegowina','BA','BIH',1),(28,'Botswana','BW','BWA',1),(29,'Bouvet Island','BV','BVT',1),(30,'Brazil','BR','BRA',1),(31,'British Indian Ocean Territory','IO','IOT',1),(32,'Brunei Darussalam','BN','BRN',1),(33,'Bulgaria','BG','BGR',1),(34,'Burkina Faso','BF','BFA',1),(35,'Burundi','BI','BDI',1),(36,'Cambodia','KH','KHM',1),(37,'Cameroon','CM','CMR',1),(38,'Canada','CA','CAN',1),(39,'Cape Verde','CV','CPV',1),(40,'Cayman Islands','KY','CYM',1),(41,'Central African Republic','CF','CAF',1),(42,'Chad','TD','TCD',1),(43,'Chile','CL','CHL',1),(44,'China','CN','CHN',1),(45,'Christmas Island','CX','CXR',1),(46,'Cocos (Keeling) Islands','CC','CCK',1),(47,'Colombia','CO','COL',1),(48,'Comoros','KM','COM',1),(49,'Congo','CG','COG',1),(50,'Cook Islands','CK','COK',1),(51,'Costa Rica','CR','CRI',1),(52,'Cote D\'Ivoire','CI','CIV',1),(53,'Croatia','HR','HRV',1),(54,'Cuba','CU','CUB',1),(55,'Cyprus','CY','CYP',1),(56,'Czech Republic','CZ','CZE',1),(57,'Denmark','DK','DNK',1),(58,'Djibouti','DJ','DJI',1),(59,'Dominica','DM','DMA',1),(60,'Dominican Republic','DO','DOM',1),(61,'East Timor','TP','TMP',1),(62,'Ecuador','EC','ECU',1),(63,'Egypt','EG','EGY',1),(64,'El Salvador','SV','SLV',1),(65,'Equatorial Guinea','GQ','GNQ',1),(66,'Eritrea','ER','ERI',1),(67,'Estonia','EE','EST',1),(68,'Ethiopia','ET','ETH',1),(69,'Falkland Islands (Malvinas)','FK','FLK',1),(70,'Faroe Islands','FO','FRO',1),(71,'Fiji','FJ','FJI',1),(72,'Finland','FI','FIN',1),(73,'France','FR','FRA',1),(74,'France, Metropolitan','FX','FXX',1),(75,'French Guiana','GF','GUF',1),(76,'French Polynesia','PF','PYF',1),(77,'French Southern Territories','TF','ATF',1),(78,'Gabon','GA','GAB',1),(79,'Gambia','GM','GMB',1),(80,'Georgia','GE','GEO',1),(81,'Germany','DE','DEU',5),(82,'Ghana','GH','GHA',1),(83,'Gibraltar','GI','GIB',1),(84,'Greece','GR','GRC',1),(85,'Greenland','GL','GRL',1),(86,'Grenada','GD','GRD',1),(87,'Guadeloupe','GP','GLP',1),(88,'Guam','GU','GUM',1),(89,'Guatemala','GT','GTM',1),(90,'Guinea','GN','GIN',1),(91,'Guinea-bissau','GW','GNB',1),(92,'Guyana','GY','GUY',1),(93,'Haiti','HT','HTI',1),(94,'Heard and Mc Donald Islands','HM','HMD',1),(95,'Honduras','HN','HND',1),(96,'Hong Kong','HK','HKG',1),(97,'Hungary','HU','HUN',1),(98,'Iceland','IS','ISL',1),(99,'India','IN','IND',1),(100,'Indonesia','ID','IDN',1),(101,'Iran (Islamic Republic of)','IR','IRN',1),(102,'Iraq','IQ','IRQ',1),(103,'Ireland','IE','IRL',1),(104,'Israel','IL','ISR',1),(105,'Italy','IT','ITA',1),(106,'Jamaica','JM','JAM',1),(107,'Japan','JP','JPN',1),(108,'Jordan','JO','JOR',1),(109,'Kazakhstan','KZ','KAZ',1),(110,'Kenya','KE','KEN',1),(111,'Kiribati','KI','KIR',1),(112,'Korea, Democratic People\'s Republic of','KP','PRK',1),(113,'Korea, Republic of','KR','KOR',1),(114,'Kuwait','KW','KWT',1),(115,'Kyrgyzstan','KG','KGZ',1),(116,'Lao People\'s Democratic Republic','LA','LAO',1),(117,'Latvia','LV','LVA',1),(118,'Lebanon','LB','LBN',1),(119,'Lesotho','LS','LSO',1),(120,'Liberia','LR','LBR',1),(121,'Libyan Arab Jamahiriya','LY','LBY',1),(122,'Liechtenstein','LI','LIE',1),(123,'Lithuania','LT','LTU',1),(124,'Luxembourg','LU','LUX',1),(125,'Macau','MO','MAC',1),(126,'Macedonia, The Former Yugoslav Republic of','MK','MKD',1),(127,'Madagascar','MG','MDG',1),(128,'Malawi','MW','MWI',1),(129,'Malaysia','MY','MYS',1),(130,'Maldives','MV','MDV',1),(131,'Mali','ML','MLI',1),(132,'Malta','MT','MLT',1),(133,'Marshall Islands','MH','MHL',1),(134,'Martinique','MQ','MTQ',1),(135,'Mauritania','MR','MRT',1),(136,'Mauritius','MU','MUS',1),(137,'Mayotte','YT','MYT',1),(138,'Mexico','MX','MEX',1),(139,'Micronesia, Federated States of','FM','FSM',1),(140,'Moldova, Republic of','MD','MDA',1),(141,'Monaco','MC','MCO',1),(142,'Mongolia','MN','MNG',1),(143,'Montserrat','MS','MSR',1),(144,'Morocco','MA','MAR',1),(145,'Mozambique','MZ','MOZ',1),(146,'Myanmar','MM','MMR',1),(147,'Namibia','NA','NAM',1),(148,'Nauru','NR','NRU',1),(149,'Nepal','NP','NPL',1),(150,'Netherlands','NL','NLD',1),(151,'Netherlands Antilles','AN','ANT',1),(152,'New Caledonia','NC','NCL',1),(153,'New Zealand','NZ','NZL',1),(154,'Nicaragua','NI','NIC',1),(155,'Niger','NE','NER',1),(156,'Nigeria','NG','NGA',1),(157,'Niue','NU','NIU',1),(158,'Norfolk Island','NF','NFK',1),(159,'Northern Mariana Islands','MP','MNP',1),(160,'Norway','NO','NOR',1),(161,'Oman','OM','OMN',1),(162,'Pakistan','PK','PAK',1),(163,'Palau','PW','PLW',1),(164,'Panama','PA','PAN',1),(165,'Papua New Guinea','PG','PNG',1),(166,'Paraguay','PY','PRY',1),(167,'Peru','PE','PER',1),(168,'Philippines','PH','PHL',1),(169,'Pitcairn','PN','PCN',1),(170,'Poland','PL','POL',1),(171,'Portugal','PT','PRT',1),(172,'Puerto Rico','PR','PRI',1),(173,'Qatar','QA','QAT',1),(174,'Reunion','RE','REU',1),(175,'Romania','RO','ROM',1),(176,'Russian Federation','RU','RUS',1),(177,'Rwanda','RW','RWA',1),(178,'Saint Kitts and Nevis','KN','KNA',1),(179,'Saint Lucia','LC','LCA',1),(180,'Saint Vincent and the Grenadines','VC','VCT',1),(181,'Samoa','WS','WSM',1),(182,'San Marino','SM','SMR',1),(183,'Sao Tome and Principe','ST','STP',1),(184,'Saudi Arabia','SA','SAU',1),(185,'Senegal','SN','SEN',1),(186,'Seychelles','SC','SYC',1),(187,'Sierra Leone','SL','SLE',1),(188,'Singapore','SG','SGP',4),(189,'Slovakia (Slovak Republic)','SK','SVK',1),(190,'Slovenia','SI','SVN',1),(191,'Solomon Islands','SB','SLB',1),(192,'Somalia','SO','SOM',1),(193,'South Africa','ZA','ZAF',1),(194,'South Georgia and the South Sandwich Islands','GS','SGS',1),(195,'Spain','ES','ESP',3),(196,'Sri Lanka','LK','LKA',1),(197,'St. Helena','SH','SHN',1),(198,'St. Pierre and Miquelon','PM','SPM',1),(199,'Sudan','SD','SDN',1),(200,'Suriname','SR','SUR',1),(201,'Svalbard and Jan Mayen Islands','SJ','SJM',1),(202,'Swaziland','SZ','SWZ',1),(203,'Sweden','SE','SWE',1),(204,'Switzerland','CH','CHE',1),(205,'Syrian Arab Republic','SY','SYR',1),(206,'Taiwan','TW','TWN',1),(207,'Tajikistan','TJ','TJK',1),(208,'Tanzania, United Republic of','TZ','TZA',1),(209,'Thailand','TH','THA',1),(210,'Togo','TG','TGO',1),(211,'Tokelau','TK','TKL',1),(212,'Tonga','TO','TON',1),(213,'Trinidad and Tobago','TT','TTO',1),(214,'Tunisia','TN','TUN',1),(215,'Turkey','TR','TUR',1),(216,'Turkmenistan','TM','TKM',1),(217,'Turks and Caicos Islands','TC','TCA',1),(218,'Tuvalu','TV','TUV',1),(219,'Uganda','UG','UGA',1),(220,'Ukraine','UA','UKR',1),(221,'United Arab Emirates','AE','ARE',1),(222,'United Kingdom','GB','GBR',1),(223,'United States','US','USA',2),(224,'United States Minor Outlying Islands','UM','UMI',1),(225,'Uruguay','UY','URY',1),(226,'Uzbekistan','UZ','UZB',1),(227,'Vanuatu','VU','VUT',1),(228,'Vatican City State (Holy See)','VA','VAT',1),(229,'Venezuela','VE','VEN',1),(230,'Viet Nam','VN','VNM',1),(231,'Virgin Islands (British)','VG','VGB',1),(232,'Virgin Islands (U.S.)','VI','VIR',1),(233,'Wallis and Futuna Islands','WF','WLF',1),(234,'Western Sahara','EH','ESH',1),(235,'Yemen','YE','YEM',1),(236,'Yugoslavia','YU','YUG',1),(237,'Zaire','ZR','ZAR',1),(238,'Zambia','ZM','ZMB',1),(239,'Zimbabwe','ZW','ZWE',1);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `currencies_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` char(3) NOT NULL,
  `symbol_left` varchar(12) DEFAULT NULL,
  `symbol_right` varchar(12) DEFAULT NULL,
  `decimal_point` char(1) DEFAULT NULL,
  `thousands_point` char(1) DEFAULT NULL,
  `decimal_places` char(1) DEFAULT NULL,
  `value` float(13,8) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`currencies_id`),
  KEY `idx_currencies_code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (3,'GBP','GBP','Â£','','.',',','2',1.00000000,'2010-01-03 19:27:38');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customers_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_gender` char(1) NOT NULL,
  `customers_firstname` varchar(32) NOT NULL,
  `customers_lastname` varchar(32) NOT NULL,
  `customers_dob` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `customers_email_address` varchar(96) NOT NULL,
  `customers_default_address_id` int(11) DEFAULT NULL,
  `customers_telephone` varchar(32) NOT NULL,
  `customers_fax` varchar(32) DEFAULT NULL,
  `customers_password` varchar(40) NOT NULL,
  `customers_newsletter` char(1) DEFAULT NULL,
  `customers_paypal_payerid` varchar(20) DEFAULT NULL,
  `customers_paypal_ec` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`customers_id`),
  KEY `idx_customers_email_address` (`customers_email_address`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_basket`
--

DROP TABLE IF EXISTS `customers_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_basket` (
  `customers_basket_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext NOT NULL,
  `customers_basket_quantity` int(2) NOT NULL,
  `final_price` decimal(15,4) DEFAULT NULL,
  `customers_basket_date_added` char(8) DEFAULT NULL,
  PRIMARY KEY (`customers_basket_id`),
  KEY `idx_customers_basket_customers_id` (`customers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_basket`
--

LOCK TABLES `customers_basket` WRITE;
/*!40000 ALTER TABLE `customers_basket` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_basket_attributes`
--

DROP TABLE IF EXISTS `customers_basket_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext NOT NULL,
  `products_options_id` int(11) NOT NULL,
  `products_options_value_id` int(11) NOT NULL,
  PRIMARY KEY (`customers_basket_attributes_id`),
  KEY `idx_customers_basket_att_customers_id` (`customers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=511 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_basket_attributes`
--

LOCK TABLES `customers_basket_attributes` WRITE;
/*!40000 ALTER TABLE `customers_basket_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_basket_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_info`
--

DROP TABLE IF EXISTS `customers_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_info` (
  `customers_info_id` int(11) NOT NULL,
  `customers_info_date_of_last_logon` datetime DEFAULT NULL,
  `customers_info_number_of_logons` int(5) DEFAULT NULL,
  `customers_info_date_account_created` datetime DEFAULT NULL,
  `customers_info_date_account_last_modified` datetime DEFAULT NULL,
  `global_product_notifications` int(1) DEFAULT '0',
  PRIMARY KEY (`customers_info_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_info`
--

LOCK TABLES `customers_info` WRITE;
/*!40000 ALTER TABLE `customers_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_coupons`
--

DROP TABLE IF EXISTS `discount_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_coupons` (
  `coupons_id` varchar(32) NOT NULL DEFAULT '',
  `coupons_description` varchar(64) NOT NULL DEFAULT '',
  `coupons_discount_amount` decimal(15,2) DEFAULT NULL,
  `coupons_discount_type` varchar(35) DEFAULT NULL,
  `coupons_date_start` datetime DEFAULT NULL,
  `coupons_date_end` datetime DEFAULT NULL,
  `coupons_max_use` int(3) NOT NULL DEFAULT '0',
  `coupons_min_order` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupons_min_order_type` varchar(50) DEFAULT NULL,
  `coupons_number_available` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupons_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_coupons`
--

LOCK TABLES `discount_coupons` WRITE;
/*!40000 ALTER TABLE `discount_coupons` DISABLE KEYS */;
INSERT INTO `discount_coupons` VALUES ('testing001','testing',2.00,'percent',NULL,NULL,2,1.0000,'price',1),('hello','hello',0.10,'percent',NULL,NULL,0,0.0000,NULL,0);
/*!40000 ALTER TABLE `discount_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_coupons_to_categories`
--

DROP TABLE IF EXISTS `discount_coupons_to_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_coupons_to_categories` (
  `coupons_id` varchar(32) DEFAULT NULL,
  `categories_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_coupons_to_categories`
--

LOCK TABLES `discount_coupons_to_categories` WRITE;
/*!40000 ALTER TABLE `discount_coupons_to_categories` DISABLE KEYS */;
INSERT INTO `discount_coupons_to_categories` VALUES ('testing001',22);
/*!40000 ALTER TABLE `discount_coupons_to_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_coupons_to_customers`
--

DROP TABLE IF EXISTS `discount_coupons_to_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_coupons_to_customers` (
  `coupons_id` varchar(32) DEFAULT NULL,
  `customers_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_coupons_to_customers`
--

LOCK TABLES `discount_coupons_to_customers` WRITE;
/*!40000 ALTER TABLE `discount_coupons_to_customers` DISABLE KEYS */;
INSERT INTO `discount_coupons_to_customers` VALUES ('testing001',4);
/*!40000 ALTER TABLE `discount_coupons_to_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_coupons_to_manufacturers`
--

DROP TABLE IF EXISTS `discount_coupons_to_manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_coupons_to_manufacturers` (
  `coupons_id` varchar(32) DEFAULT NULL,
  `manufacturers_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_coupons_to_manufacturers`
--

LOCK TABLES `discount_coupons_to_manufacturers` WRITE;
/*!40000 ALTER TABLE `discount_coupons_to_manufacturers` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_coupons_to_manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_coupons_to_orders`
--

DROP TABLE IF EXISTS `discount_coupons_to_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_coupons_to_orders` (
  `discount_coupons_to_orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupons_id` varchar(32) DEFAULT NULL,
  `orders_id` int(11) DEFAULT '0',
  PRIMARY KEY (`discount_coupons_to_orders_id`),
  KEY `coupons_id` (`coupons_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_coupons_to_orders`
--

LOCK TABLES `discount_coupons_to_orders` WRITE;
/*!40000 ALTER TABLE `discount_coupons_to_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_coupons_to_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_coupons_to_products`
--

DROP TABLE IF EXISTS `discount_coupons_to_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_coupons_to_products` (
  `coupons_id` varchar(32) DEFAULT NULL,
  `products_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_coupons_to_products`
--

LOCK TABLES `discount_coupons_to_products` WRITE;
/*!40000 ALTER TABLE `discount_coupons_to_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_coupons_to_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_coupons_to_zones`
--

DROP TABLE IF EXISTS `discount_coupons_to_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_coupons_to_zones` (
  `discount_coupons_to_zones_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupons_id` varchar(32) DEFAULT NULL,
  `geo_zone_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`discount_coupons_to_zones_id`),
  UNIQUE KEY `discount_coupons_to_zones_id` (`discount_coupons_to_zones_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_coupons_to_zones`
--

LOCK TABLES `discount_coupons_to_zones` WRITE;
/*!40000 ALTER TABLE `discount_coupons_to_zones` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_coupons_to_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq` (
  `faq_id` int(11) NOT NULL DEFAULT '0',
  `faq_status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `last_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (1,0,0,'2010-05-14 15:17:55'),(2,1,1,'2010-05-14 17:23:34'),(3,1,0,'2010-05-14 17:41:06'),(4,1,0,'2010-05-14 16:19:34'),(5,1,0,'2010-05-14 16:13:16'),(6,1,2,'2010-05-14 17:39:15'),(7,1,3,'2010-10-11 12:41:44'),(8,1,4,'2010-10-11 12:42:12'),(9,1,5,'2010-10-11 13:04:32'),(10,1,10,'2010-12-12 20:05:38'),(11,1,11,'2010-12-12 20:08:02'),(14,1,14,'2010-12-12 20:15:46'),(13,1,13,'2010-12-12 20:12:53');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_description`
--

DROP TABLE IF EXISTS `faq_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq_description` (
  `faq_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `faq_question` text CHARACTER SET utf8,
  `faq_answer` text CHARACTER SET utf8
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_description`
--

LOCK TABLES `faq_description` WRITE;
/*!40000 ALTER TABLE `faq_description` DISABLE KEYS */;
INSERT INTO `faq_description` VALUES (1,1,'Why?','Because!'),(2,1,'Why Use Us?','Unlike the competition, we offer our customers full flexibility on what you get.  Rather than giving you a small choice of small, medium, and large, we offer you the ability to customize all attributes of your virtual machine including architecture, bandwidth, diskspace, memory, support options, and the duration of your contract.  This is in addition to a wide range of Linux Distributions and versions, which we are constantly updating.  We acknowledge the fact that all our customers have different requirements and one size does NOT fit all.  We put the power of customization into your hands, not ours.'),(3,1,'What do we support?','We currently have 2 support options which you can chose from on the customization page. <br>The first allows you to request that your VPS be restored to its default state when it was first provisioned to you.  You can also order manual power functions, (eg power on, power off, reboot) for when your VPS system is none responsive, or has been turned off)<br>\r\nThe second option gives you additional support request previliges, allowing you to request assistance with installing/uninstalling software and general linux help.'),(4,1,'What can I do on my VPS?','In a nut shell, you can run anything of a VPS, just as you would on a normal server, desktop, or laptop computer.  Here are some simple examples, as well as some not so obvious which can easily be run on our VPS servers.<br><br>\n<ul>\n\n<li>Hosting a website<br>\nAll our VPS solutions come with Apache2, the worlds most powerful web server according to Netcraft\'s webserver stats for August 1995-April 2010.<br><br></li>\n\n<li>File storage<br>\nWith protocols like like ftp, sftp, http, soap and many others your only a command or two away from installing file sharing capabilities.  Access your files from anywhere in the world, and even give others access as you see fit.<br><br>\n\n<li>Testing of applications<br>\nOne of the main benifits of VPS systems is that its virtually identical to the real thing, yet with less cost, and time.  If you are a software developer, or web designer, you can test your applications and scripts on our platforms for compatibility.  These days applications come in all shapes and sizes, as does the different operating systems that are available for use.  The only sure way to ensure that it will work on all the platforms is to try it on as many as possible.  Rather than spending hours, or even days, installing operating system after operating system, simply copy your code to our servers and check the results.  Ofcourse, the development of the code can also be performed on the VPS.<br><br>\n</li>\n\n<li>Games hosting<br>\nHave total control of your game server, chose what to install, configure, and serve.<br><br></li>\n\n<li>IRC with Screen<br></li>\n\n<li>Screen is a ...???<br><br></li>\n\n<li>Seedbox for bittorrent<br><br></li>\n<li>Online radio stations<br><br></li>\n \n<li>Run a nagios server<br></li>\nFor monitoring your site, or services from the outside.<br><br></li>'),(5,1,'Where is it hosted?','All of our VPS servers are hosted at out service provider\'s data center in Germany.  This is to reduce the overall costs whilst continuing to provide you with a strong reliable service.'),(6,1,'What is a VPS?','A VPS (virtual Private Server) is a hosted area of a physical machine made into a smaller \"Virtual\" environments.  These environments are allocated actual resources from the physical machine and are segregated from one another.   These virtual mahcines are practically identical to physical machines in terms of usability and the background processes are transparent to the user.'),(7,1,'What can I run on the VPS?','Its entirely up to you.  Its your system, so you can install what ever you want. '),(8,1,'What transfer speeds will I be getting?','We have created 3 files for you to download for test purposes:<br>\n<u><a href=http://78.47.5.75/1mb>1Mb</a></u><br>\n<u><a href=http://78.47.5.75/50mb>50Mb</a></u><br>\n<u><a href=http://78.47.5.75/100mb>100Mb</a></u><br>\n\nYou can also try a ping test on the above IP.'),(9,1,'Do your VPS Systems come with a Desktop environment?','By default our systems only come with a minimal install allowing you to install whatever you want.  If you are unsure how to do this you can choose our customized option which can include support where we will install the software of your choosing. '),(10,1,'I can\'t find a product that suits my needs.  What can I do?','We do offer a customized version of every product that we provide.  If you require additional capacity, please <a href=\"contract_us.php\">contact us</a> with your exact requirements for a quote.'),(11,1,'What methods of payment do you accept?','Our preferred payment option is PayPal as the transaction is done instantly.  A recurring profile with be automatically set up and you will have access to your product within 5 minutes.\r\n<br>\r\nAlternatively we also accept payment with Standing Orders, however your product will not be available until payment has cleared.\r\n<br><br>\r\nIf you would like to pay using an alternative method please <a href=\"contract_us.php\">contact us</a>'),(14,1,'How long is the contract period?','The PayPal agreement is set for monthly billing for a 1 year duration. During this time you can cancel at any time. We will then continue to provide services till the end of the end of the monthly billing period. To cancel, simply let us know, and we will discontinue the PayPal agreement - no questions asked.'),(13,1,'I would like to speak to someone in person before making a decision.  How can this be arranged?','Please use the <a href=\"contract_us.php\">contact us</a> link above which contains email and phone contract details.  If you would like use to phone you, please send us a quick message with your contact details and we shall phone you back.');
/*!40000 ALTER TABLE `faq_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixed_options`
--

DROP TABLE IF EXISTS `fixed_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fixed_options` (
  `fixed_id` int(11) NOT NULL DEFAULT '0',
  `fixed_name` varchar(65) DEFAULT NULL,
  `harddrive_id` int(11) DEFAULT NULL,
  `memory_id` int(11) DEFAULT NULL,
  `traffic_id` int(11) DEFAULT NULL,
  `arch` varchar(30) DEFAULT NULL,
  `cost` varchar(30) DEFAULT NULL,
  `traffic` varchar(30) DEFAULT NULL,
  `bandwidth` varchar(30) DEFAULT NULL,
  `harddrive` varchar(30) DEFAULT NULL,
  `ram` varchar(30) DEFAULT NULL,
  `root` varchar(30) DEFAULT NULL,
  `support` varchar(30) DEFAULT NULL,
  `contract` varchar(30) DEFAULT NULL,
  `buy` tinyint(4) DEFAULT NULL,
  `category_id` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixed_options`
--

LOCK TABLES `fixed_options` WRITE;
/*!40000 ALTER TABLE `fixed_options` DISABLE KEYS */;
INSERT INTO `fixed_options` VALUES (1,'Basic',39,19,54,'32bit or 64bit','&pound;12/month','4Gb/month','100MBit','5Gb','128Mb','full root access','no','renewed monthly',52,24),(2,'Mid Range',22,22,22,'32bit or 64bit','&pound;20/month','20Gb/month','100Mbit','50Gb','512Mb','Full Root Access','no','renewed monthly',54,24),(3,'MaxPro',17,21,58,'32bit or 64bit','&pound;27/month','50Gb/month','100Mbit','100Gb','1GB','Full Root Access','no','renewed monthly',53,24),(4,'Customize',NULL,NULL,NULL,'32bit or 64bit','From &pound;10/month','up to unlimited','100Mbit','up to 200Gb','up to 2Gb','Full Root Access','Option Available','renewed monthly',41,24),(5,'Basic',39,19,54,'32bit or 64bit','&pound;11/month','4Gb/month','100MBit','5Gb','128Mb','full root access ','no','renewed monthly',28,22),(6,'MidRange',16,20,55,'32bit or 64bit','&pound;19/month','20Gb/month','100Mbit','50Gb','512Mb','Full Root Access','no','renewed monthly',55,22),(7,'MaxPro',17,21,58,'32bit or 64bit','&pound;26/month','50Gb/month','100Mbit','100Gb','1GB','Full Root Access','no','renewed monthly',57,22),(8,'Customize',NULL,NULL,NULL,'32bit or 64bit','From &pound;9/month','up to unlimited','100Mbit','up to 200Gb','up to 2Gb','Full Root Access','Option Available','renewed monthly',30,22),(9,'Basic',39,19,54,'32bit or 64bit','&pound;13/month','4Gb/month','100MBit','5Gb','128Mb','full root access','no','renewed monthly',60,26),(10,'Mid Range',22,22,22,'32bit or 64bit','&pound;21/month','20Gb/month','100Mbit','50Gb','512Mb','Full Root Access','no','renewed monthly',59,26),(11,'MaxPro',17,21,58,'32bit or 64bit','&pound;28/month','50Gb/month','100Mbit','100Gb','1GB','Full Root Access','no','renewed monthly',58,26),(12,'Customize',NULL,NULL,NULL,'32bit or 64bit','From &pound;11/month','up to unlimited','100Mbit','up to 200Gb','up to 2Gb','Full Root Access','Option Available','renewed monthly',45,26),(13,'Basic',39,19,54,'32bit only','&pound;9.99/month','4Gb/month','100MBit','5Gb','128Mb','full root access','no','renewed monthly',61,27),(14,'Mid Range',22,22,22,'32bit only','&pound;12.50/month','20Gb/month','100Mbit','50Gb','512Mb','Full Root Access','no','renewed monthly',63,27),(15,'MaxPro',17,21,58,'32bit only','&pound;22.50/month','50Gb/month','100Mbit','100Gb','1GB','Full Root Access','no','renewed monthly',62,27),(16,'Customize',NULL,NULL,NULL,'32bit only','From &pound;8.50/month','up to unlimited','custom','up to 200Gb','up to 2Gb','Full Root Access','Option Available','renewed monthly',39,27),(17,'Basic',39,19,54,'32bit or 64bit','&pound;11.50/month','4Gb/month','100MBit','5Gb','128Mb','full root access','no','renewed monthly',66,23),(18,'Mid Range',22,22,22,'32bit or 64bit','&pound;19.00/month','20Gb/month','100Mbit','50Gb','512Mb','Full Root Access','no','renewed monthly',64,23),(19,'MaxPro',17,21,58,'32bit or 64bit','&pound;26.50/month','50Gb/month','100Mbit','100Gb','1GB','Full Root Access','no','renewed monthly',65,23),(20,'Customize',NULL,NULL,NULL,'32bit or 64bit','From &pound;9.50/month','custom','custom','custom','custom','Full Root Access','Option Available','renewed monthly',29,23),(22,'Debian',NULL,NULL,NULL,'1','for &pound;9 per month','4, and 5','up to 200Gb','Apt Repository','last week?','up to 100G HD','no benifits','9',22,21),(23,'Fedora',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,21),(24,'Slackware',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,21),(25,'Ubuntu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,21),(26,'Centos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,21);
/*!40000 ALTER TABLE `fixed_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_zones`
--

DROP TABLE IF EXISTS `geo_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_zones` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_name` varchar(32) NOT NULL,
  `geo_zone_description` varchar(255) NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_zones`
--

LOCK TABLES `geo_zones` WRITE;
/*!40000 ALTER TABLE `geo_zones` DISABLE KEYS */;
INSERT INTO `geo_zones` VALUES (2,'UK','UK TAX',NULL,'2010-01-02 15:19:25');
/*!40000 ALTER TABLE `geo_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `languages_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` char(2) NOT NULL,
  `image` varchar(64) DEFAULT NULL,
  `directory` varchar(32) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  PRIMARY KEY (`languages_id`),
  KEY `IDX_LANGUAGES_NAME` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','icon.gif','english',1);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturers` (
  `manufacturers_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturers_name` varchar(32) NOT NULL,
  `manufacturers_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`),
  KEY `IDX_MANUFACTURERS_NAME` (`manufacturers_name`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers_info`
--

DROP TABLE IF EXISTS `manufacturers_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `manufacturers_url` varchar(255) NOT NULL,
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers_info`
--

LOCK TABLES `manufacturers_info` WRITE;
/*!40000 ALTER TABLE `manufacturers_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `manufacturers_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletters` (
  `newsletters_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `module` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_sent` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `locked` int(1) DEFAULT '0',
  PRIMARY KEY (`newsletters_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
INSERT INTO `newsletters` VALUES (1,'newsletter title','newsletter content','newsletter','2010-01-02 16:35:33','2010-02-21 04:02:38',1,1),(2,'title','content','newsletter','2010-02-21 04:02:28',NULL,0,0);
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `customers_name` varchar(64) NOT NULL,
  `customers_company` varchar(32) DEFAULT NULL,
  `customers_street_address` varchar(64) NOT NULL,
  `customers_suburb` varchar(32) DEFAULT NULL,
  `customers_city` varchar(32) NOT NULL,
  `customers_postcode` varchar(10) NOT NULL,
  `customers_state` varchar(32) DEFAULT NULL,
  `customers_country` varchar(32) NOT NULL,
  `customers_telephone` varchar(32) NOT NULL,
  `customers_email_address` varchar(96) NOT NULL,
  `customers_address_format_id` int(5) NOT NULL,
  `delivery_name` varchar(64) NOT NULL,
  `delivery_company` varchar(32) DEFAULT NULL,
  `delivery_street_address` varchar(64) NOT NULL,
  `delivery_suburb` varchar(32) DEFAULT NULL,
  `delivery_city` varchar(32) NOT NULL,
  `delivery_postcode` varchar(10) NOT NULL,
  `delivery_state` varchar(32) DEFAULT NULL,
  `delivery_country` varchar(32) NOT NULL,
  `delivery_address_format_id` int(5) NOT NULL,
  `billing_name` varchar(64) NOT NULL,
  `billing_company` varchar(32) DEFAULT NULL,
  `billing_street_address` varchar(64) NOT NULL,
  `billing_suburb` varchar(32) DEFAULT NULL,
  `billing_city` varchar(32) NOT NULL,
  `billing_postcode` varchar(10) NOT NULL,
  `billing_state` varchar(32) DEFAULT NULL,
  `billing_country` varchar(32) NOT NULL,
  `billing_address_format_id` int(5) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `cc_owner` varchar(64) DEFAULT NULL,
  `cc_number` varchar(32) DEFAULT NULL,
  `cc_expires` varchar(4) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_purchased` datetime DEFAULT NULL,
  `orders_status` int(5) NOT NULL,
  `orders_date_finished` datetime DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `currency_value` decimal(14,6) DEFAULT NULL,
  `payment_module` char(35) DEFAULT NULL,
  `paypal_transaction_id` char(18) DEFAULT NULL,
  PRIMARY KEY (`orders_id`),
  KEY `idx_orders_customers_id` (`customers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products` (
  `orders_products_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `products_model` varchar(12) DEFAULT NULL,
  `products_name` varchar(64) NOT NULL,
  `products_price` decimal(15,4) NOT NULL,
  `final_price` decimal(15,4) NOT NULL,
  `products_tax` decimal(7,4) NOT NULL,
  `products_quantity` int(2) NOT NULL,
  `rp_profile_id` char(20) DEFAULT NULL,
  PRIMARY KEY (`orders_products_id`),
  KEY `idx_orders_products_orders_id` (`orders_id`),
  KEY `idx_orders_products_products_id` (`products_id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products_attributes`
--

DROP TABLE IF EXISTS `orders_products_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `orders_products_id` int(11) NOT NULL,
  `products_options` varchar(32) NOT NULL,
  `products_options_values` varchar(32) NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) NOT NULL,
  `products_options_values_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`orders_products_attributes_id`),
  KEY `idx_orders_products_att_orders_id` (`orders_id`),
  KEY `products_options_values_id` (`products_options_values_id`)
) ENGINE=MyISAM AUTO_INCREMENT=444 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products_attributes`
--

LOCK TABLES `orders_products_attributes` WRITE;
/*!40000 ALTER TABLE `orders_products_attributes` DISABLE KEYS */;
INSERT INTO `orders_products_attributes` VALUES (1,1,1,'Arch','64-bit',0.0000,'+',NULL),(2,1,1,'Hard drive','10G',0.0000,'+',NULL),(3,1,1,'Memory','32 mb',0.0000,'+',NULL),(4,1,1,'Support','Full OS Support',50.0000,'+',NULL),(5,1,1,'Version','5.0 Lenny',0.0000,'+',NULL),(6,2,2,'Arch','32-bit',0.0000,'+',NULL),(7,2,2,'Hard drive','500Mb',0.0000,'+',NULL),(8,2,2,'Memory','64 mb',0.0000,'+',NULL),(9,2,2,'Support','Full OS Support',0.0000,'+',NULL),(10,2,2,'Version','5.0 Lenny',0.0000,'+',NULL),(11,2,3,'Arch','64-bit',0.0000,'+',NULL),(12,2,3,'Hard drive','1G',0.0000,'+',NULL),(13,2,3,'Memory','1024 mb',0.0000,'+',NULL),(14,2,3,'Support','reboot/reinstall',0.0000,'+',NULL),(15,2,3,'Version','4.0 Etch',0.0000,'+',NULL),(16,3,4,'Version','4.0 Etch',0.0000,'+',NULL),(17,3,4,'Support','reboot/reinstall',0.0000,'+',NULL),(18,3,4,'Memory','64 mb',0.0000,'+',NULL),(19,3,4,'Hard drive','500Mb',0.0000,'+',NULL),(20,3,4,'Arch','32-bit',0.0000,'+',NULL),(21,4,5,'Version','4.0 Etch',0.0000,'+',NULL),(22,4,5,'Support','reboot/reinstall',0.0000,'+',NULL),(23,4,5,'Memory','64 mb',0.0000,'+',NULL),(24,4,5,'Hard drive','500Mb',0.0000,'+',NULL),(25,4,5,'Arch','32-bit',0.0000,'+',NULL),(26,5,6,'Version','4.0 Etch',0.0000,'+',NULL),(27,5,6,'Support','reboot/reinstall',0.0000,'+',NULL),(28,5,6,'Memory','64 mb',0.0000,'+',NULL),(29,5,6,'Hard drive','500Mb',0.0000,'+',NULL),(30,5,6,'Arch','32-bit',0.0000,'+',NULL),(31,6,7,'Version','4.0 Etch',0.0000,'+',NULL),(32,6,7,'Support','reboot/reinstall',0.0000,'+',NULL),(33,6,7,'Memory','64 mb',0.0000,'+',NULL),(34,6,7,'Hard drive','500Mb',0.0000,'+',NULL),(35,6,7,'Arch','32-bit',0.0000,'+',NULL),(36,7,8,'Version','4.0 Etch',0.0000,'+',NULL),(37,7,8,'Support','reboot/reinstall',0.0000,'+',NULL),(38,7,8,'Memory','64 mb',0.0000,'+',NULL),(39,7,8,'Hard drive','500Mb',0.0000,'+',NULL),(40,7,8,'Arch','32-bit',0.0000,'+',NULL),(41,8,9,'Version','4.0 Etch',0.0000,'+',NULL),(42,8,9,'Support','reboot/reinstall',0.0000,'+',NULL),(43,8,9,'Memory','64 mb',0.0000,'+',NULL),(44,8,9,'Hard drive','500Mb',0.0000,'+',NULL),(45,8,9,'Arch','32-bit',0.0000,'+',NULL),(46,9,10,'Arch','32-bit',0.0000,'+',NULL),(47,9,10,'Hard drive','500Mb',0.0000,'+',NULL),(48,9,10,'Memory','64 mb',0.0000,'+',NULL),(49,9,10,'Support','reboot/reinstall',0.0000,'+',NULL),(50,9,10,'Version','4.0 Etch',0.0000,'+',NULL),(51,10,11,'Arch','32-bit',0.0000,'+',NULL),(52,10,11,'Hard drive','500Mb',0.0000,'+',NULL),(53,10,11,'Memory','64 mb',0.0000,'+',NULL),(54,10,11,'Support','reboot/reinstall',0.0000,'+',NULL),(55,10,11,'Version','4.0 Etch',0.0000,'+',NULL),(56,11,12,'Arch','32-bit',0.0000,'+',NULL),(57,11,12,'Hard drive','500Mb',0.0000,'+',NULL),(58,11,12,'Memory','64 mb',0.0000,'+',NULL),(59,11,12,'Support','reboot/reinstall',0.0000,'+',NULL),(60,11,12,'Version','4.0 Etch',0.0000,'+',NULL),(61,12,13,'Arch','32-bit',0.0000,'+',NULL),(62,12,13,'Hard drive','500Mb',0.0000,'+',NULL),(63,12,13,'Memory','64 mb',0.0000,'+',NULL),(64,12,13,'Support','reboot/reinstall',0.0000,'+',NULL),(65,12,13,'Version','Fedora Core 9',0.0000,'+',NULL),(66,13,14,'Version','4.0 Etch',0.0000,'+',NULL),(67,13,14,'Support','reboot/reinstall',0.0000,'+',NULL),(68,13,14,'Memory','64 mb',0.0000,'+',NULL),(69,13,14,'Arch','32-bit',0.0000,'+',NULL),(70,13,14,'Hard drive','500Mb',0.0000,'+',NULL),(71,14,15,'Arch','32-bit',0.0000,'+',NULL),(72,14,15,'Hard drive','500Mb',0.0000,'+',NULL),(73,14,15,'Memory','64 mb',0.0000,'+',NULL),(74,14,15,'Support','reboot/reinstall',0.0000,'+',NULL),(75,14,15,'Version','4.0 Etch',0.0000,'+',NULL),(76,15,16,'Arch','32-bit',0.0000,'+',NULL),(77,15,16,'Hard drive','500Mb',0.0000,'+',NULL),(78,15,16,'Memory','64 mb',0.0000,'+',NULL),(79,15,16,'Support','reboot/reinstall',0.0000,'+',NULL),(80,15,16,'Version','4.0 Etch',0.0000,'+',NULL),(225,17,46,'Support','reboot/reinstall',0.0000,'+',NULL),(224,17,46,'VPS Duration','1 month (1 week free)',3.0000,'*',NULL),(223,16,45,'Arch','32-bit',0.0000,'+',NULL),(222,16,45,'Bandwidth','10Gb/week',0.0000,'+',NULL),(86,17,18,'Arch','32-bit',0.0000,'+',33),(87,17,18,'Hard drive','500Mb',0.0000,'+',37),(88,17,18,'Memory','64 mb',0.0000,'+',18),(89,17,18,'Support','reboot/reinstall',0.0000,'+',35),(90,17,18,'Version','4.0 Etch',0.0000,'+',32),(91,2,19,'Arch','64-bit',0.0000,'+',34),(92,2,19,'Hard drive','20G',0.0000,'+',15),(93,2,19,'Memory','768 mb',0.0000,'+',40),(94,2,19,'Support','Full OS Support',0.0000,'+',36),(95,2,19,'Version','Debian 5.0 Lenny',0.0000,'+',31),(96,3,20,'Arch','32-bit',0.0000,'+',33),(97,3,20,'Bandwidth','B10G',0.0000,'',54),(98,3,20,'Hard drive','10G',0.0000,'+',14),(99,3,20,'Memory','768 mb',0.0000,'+',40),(100,3,20,'Support','Full OS Support',0.0000,'+',36),(101,3,20,'Version','Debian 4.0 Etch',0.0000,'+',32),(102,3,21,'Arch','32-bit',0.0000,'+',33),(103,3,21,'Bandwidth','B10G',0.0000,'',54),(104,3,21,'Hard drive','10G',0.0000,'+',14),(105,3,21,'Memory','1024 mb',0.0000,'+',41),(106,3,21,'Support','Full OS Support',0.0000,'+',36),(107,3,21,'Version','Debian 5.0 Lenny',0.0000,'+',31),(108,4,22,'Arch','64-bit',0.0000,'+',34),(109,4,22,'Bandwidth','B10G',0.0000,'',54),(110,4,22,'Hard drive','100G',0.0000,'+',17),(111,4,22,'Memory','1024 mb',0.0000,'+',41),(112,4,22,'Support','Full OS Support',0.0000,'+',36),(113,4,22,'Version','Debian 5.0 Lenny',0.0000,'+',31),(114,4,23,'Arch','32-bit',0.0000,'+',33),(115,4,23,'Bandwidth','B10G',0.0000,'',54),(116,4,23,'Hard drive','500Mb',0.0000,'+',37),(117,4,23,'Memory','64 mb',0.0000,'+',18),(118,4,23,'Support','reboot/reinstall',0.0000,'+',35),(119,4,23,'Version','Debian 4.0 Etch',0.0000,'+',32),(120,5,24,'Hard drive','10G',0.0000,'+',14),(121,5,24,'Bandwidth','B100G',0.0000,'',57),(122,5,24,'Arch','32-bit',0.0000,'+',33),(123,5,24,'Version','Debian 4.0 Etch',0.0000,'+',32),(124,5,24,'Support','reboot/reinstall',0.0000,'+',35),(125,5,24,'Memory','512 mb',0.0000,'+',20),(126,5,25,'Version','Debian 5.0 Lenny',0.0000,'+',31),(127,5,25,'Support','Full OS Support',0.0000,'+',36),(128,5,25,'Memory','1024 mb',0.0000,'+',41),(129,5,25,'Hard drive','20G',0.0000,'+',15),(130,5,25,'Bandwidth','B100G',0.0000,'',57),(131,5,25,'Arch','64-bit',0.0000,'+',34),(132,5,26,'Version','Debian 4.0 Etch',0.0000,'+',32),(133,5,26,'Support','reboot/reinstall',0.0000,'+',35),(134,5,26,'Memory','64 mb',0.0000,'+',18),(135,5,26,'Hard drive','500Mb',0.0000,'+',37),(136,5,26,'Bandwidth','B10G',0.0000,'',54),(137,5,26,'Arch','32-bit',0.0000,'+',33),(138,6,27,'Bandwidth','B10G',0.0000,'+',54),(139,6,28,'Arch','32-bit',0.0000,'+',33),(140,6,28,'Version','Debian 5.0 Lenny',0.0000,'+',31),(141,6,28,'','',0.0000,'',0),(142,6,28,'Memory','64 mb',0.0000,'+',18),(143,6,28,'Hard drive','100G',30.0000,'+',17),(144,6,28,'Bandwidth','B10G',0.0000,'+',54),(145,6,29,'Support','reboot/reinstall',0.0000,'+',35),(146,6,29,'Memory','2048 mb',15.0000,'+',42),(147,6,29,'Hard drive','100G',30.0000,'+',17),(148,6,29,'Bandwidth','B50G',4.0000,'+',56),(149,6,29,'Arch','64-bit',0.0000,'+',34),(150,6,29,'Version','Debian 5.0 Lenny',0.0000,'+',31),(151,6,30,'Arch','32-bit',0.0000,'+',33),(152,6,30,'Bandwidth','B2TB',82.5000,'+',59),(153,6,30,'Hard drive','100G',150.0000,'+',17),(154,6,30,'Memory','1024 mb',150.0000,'+',41),(155,6,30,'Support','reboot/reinstall',0.0000,'+',35),(156,6,30,'Version','Debian 5.0 Lenny',0.0000,'+',31),(157,7,31,'Bandwidth','B10G',0.0000,'+',54),(158,7,32,'Arch','32-bit',0.0000,'+',33),(159,7,32,'Version','Debian 5.0 Lenny',0.0000,'+',31),(160,7,32,'','',0.0000,'',0),(161,7,32,'Memory','64 mb',0.0000,'+',18),(162,7,32,'Hard drive','100G',30.0000,'+',17),(163,7,32,'Bandwidth','B10G',0.0000,'+',54),(164,7,33,'Support','reboot/reinstall',0.0000,'+',35),(165,7,33,'Memory','2048 mb',15.0000,'+',42),(166,7,33,'Hard drive','100G',30.0000,'+',17),(167,7,33,'Bandwidth','B50G',4.0000,'+',56),(168,7,33,'Arch','64-bit',0.0000,'+',34),(169,7,33,'Version','Debian 5.0 Lenny',0.0000,'+',31),(170,7,34,'Arch','32-bit',0.0000,'+',33),(171,7,34,'Bandwidth','B2TB',82.5000,'+',59),(172,7,34,'Hard drive','100G',150.0000,'+',17),(173,7,34,'Memory','1024 mb',150.0000,'+',41),(174,7,34,'Support','reboot/reinstall',0.0000,'+',35),(175,7,34,'Version','Debian 5.0 Lenny',0.0000,'+',31),(176,8,35,'Bandwidth','B10G',0.0000,'+',54),(177,9,36,'Bandwidth','B10G',0.0000,'+',54),(178,10,37,'Bandwidth','B10G',0.0000,'+',54),(179,11,38,'Version','Debian 4.0 Etch',0.0000,'+',32),(180,11,38,'Support','reboot/reinstall',0.0000,'+',35),(181,11,38,'Memory','64 mb',0.0000,'+',18),(182,11,38,'Hard drive','500Mb',0.0000,'+',37),(183,11,38,'Arch','32-bit',0.0000,'+',33),(184,11,39,'Version','Debian 5.0 Lenny',0.0000,'+',31),(185,11,39,'Support','reboot/reinstall',0.0000,'+',35),(186,11,39,'Memory','2048 mb',5.0000,'+',42),(187,11,39,'Hard drive','100G',10.0000,'+',17),(188,11,39,'Arch','64-bit',0.0000,'+',34),(189,12,40,'Arch','64-bit',0.0000,'+',34),(190,12,40,'Duration','6 months (7 weeks free)',17.0000,'*',29),(191,12,40,'Hard drive','20G',120.0000,'+',15),(192,12,40,'Memory','1024 mb',135.0000,'+',21),(193,12,40,'Support','reboot/reinstall',0.0000,'+',35),(194,13,41,'Support','reboot/reinstall',0.0000,'+',35),(195,13,41,'Memory','64 mb',0.0000,'+',18),(196,13,41,'Hard drive','500Mb',0.0000,'+',37),(197,13,41,'Duration','1 week (Basic)',0.0000,'+',27),(198,13,41,'Bandwidth','B10G',21.0000,'+',54),(199,13,41,'Arch','64-bit',0.0000,'+',34),(200,14,42,'Support','reboot/reinstall',0.0000,'+',35),(201,14,42,'Memory','768 mb',120.0000,'+',40),(202,14,42,'Hard drive','10G',105.0000,'+',14),(203,14,42,'Duration','6 months (7 weeks free)',17.0000,'*',29),(204,14,42,'Bandwidth','B1TB',25.0000,'+',58),(205,14,42,'Arch','32-bit',0.0000,'+',33),(206,15,43,'Support','reboot/reinstall',0.0000,'+',35),(207,15,43,'Memory','512 mb',105.0000,'+',20),(208,15,43,'Hard drive','20G',120.0000,'+',15),(209,15,43,'Duration','6 months (7 weeks free)',17.0000,'*',29),(210,15,43,'Bandwidth','B50G',23.0000,'+',56),(211,15,43,'Arch','64-bit',0.0000,'+',34),(221,16,45,'Hard drive','500Mb',0.0000,'+',NULL),(220,16,45,'Memory','64Mb',0.0000,'+',NULL),(219,16,45,'Support','reboot/reinstall',0.0000,'+',NULL),(218,16,45,'VPS Duration','1 week (Basic)',0.0001,'*',NULL),(226,17,46,'Memory','1Gb',2.0000,'+',NULL),(227,17,46,'Hard drive','20Gb',1.5000,'+',NULL),(228,17,46,'Bandwidth','50Gb/week',2.5000,'+',NULL),(229,17,46,'Arch','64-bit',0.0000,'+',NULL),(230,18,47,'VPS Duration','1 month (1 week free)',3.0000,'*',28),(231,18,47,'Support','reboot/reinstall',0.0000,'+',35),(232,18,47,'Memory','1Gb',2.0000,'+',21),(233,18,47,'Hard drive','50Gb',2.0000,'+',16),(234,18,47,'Bandwidth','50Gb/week',2.5000,'+',58),(235,18,47,'Arch','64-bit',0.0000,'+',34),(236,19,48,'Arch','32-bit',0.0000,'+',NULL),(237,19,48,'Bandwidth','1Gb/week',0.0000,'+',NULL),(238,19,48,'Hard drive','1Gb',0.0000,'+',NULL),(239,19,48,'Memory','128Mb',0.0000,'+',NULL),(240,19,48,'Support','reboot/reinstall',0.0000,'+',NULL),(241,19,48,'VPS Duration','1 week (Basic)',0.0001,'*',NULL),(242,20,49,'Arch','32-bit',0.0000,'+',NULL),(243,20,49,'Bandwidth','1Gb/week',0.0000,'+',NULL),(244,20,49,'Hard drive','1Gb',0.0000,'+',NULL),(245,20,49,'Memory','128Mb',0.0000,'+',NULL),(246,20,49,'Support','reboot/reinstall',0.0000,'+',NULL),(247,20,49,'VPS Duration','1 week (Basic)',0.0001,'*',NULL),(248,21,50,'Arch','32-bit',0.0000,'+',33),(249,21,50,'Bandwidth','1Gb/week',0.0000,'+',54),(250,21,50,'Hard drive','1Gb',0.0000,'+',38),(251,21,50,'Memory','128Mb',0.0000,'+',19),(252,21,50,'Support','reboot/reinstall',0.0000,'+',35),(253,21,50,'VPS Duration','1 week (Basic)',0.0001,'*',27),(264,22,52,'Support','reboot/reinstall',0.0000,'+',NULL),(263,22,52,'Memory','768Mb',1.5000,'+',NULL),(262,22,52,'Hard drive','5Gb',0.5000,'+',NULL),(261,22,52,'Bandwidth','5Gb/week',1.0000,'+',NULL),(260,22,52,'Arch','64-bit',0.0000,'+',NULL),(265,22,52,'VPS Duration','1 week (Basic)',0.0001,'*',NULL),(266,23,53,'Arch','64-bit',0.0000,'+',34),(267,23,53,'Bandwidth','5Gb/week',1.0000,'+',55),(268,23,53,'Hard drive','5Gb',0.5000,'+',39),(269,23,53,'Memory','768Mb',1.5000,'+',40),(270,23,53,'Support','reboot/reinstall',0.0000,'+',35),(271,23,53,'VPS Duration','1 week (Basic)',0.0001,'*',27),(272,24,54,'VPS Duration','1 week (Basic)',0.0001,'*',27),(273,24,54,'Support','reboot/reinstall',0.0000,'+',35),(274,24,54,'Memory','128Mb',0.0000,'+',19),(275,24,54,'Hard drive','1Gb',0.0000,'+',38),(276,24,54,'Bandwidth','1Gb/week',0.0000,'+',54),(277,24,54,'Arch','64-bit',0.0000,'+',34),(278,24,55,'VPS Duration','1 week (Basic)',0.0001,'*',27),(279,24,55,'Support','reboot/reinstall',0.0000,'+',35),(280,24,55,'','',0.0000,'',0),(281,24,55,'','',0.0000,'',0),(282,24,55,'Bandwidth','1Gb/week',0.0000,'+',54),(283,24,55,'Arch','32-bit',0.0000,'+',33),(284,24,56,'VPS Duration','1 week (Basic)',0.0001,'*',27),(285,24,56,'Support','reboot/reinstall',0.0000,'+',35),(286,24,56,'Memory','512Mb',1.0000,'+',20),(287,24,56,'Hard drive','1Gb',0.0000,'+',38),(288,24,56,'Bandwidth','10Gb/week',1.5000,'+',56),(289,24,56,'Arch','32-bit',0.0000,'+',33),(290,24,57,'Arch','64-bit',0.0000,'+',34),(291,24,57,'Bandwidth','10Gb/week',1.5000,'+',56),(292,24,57,'Hard drive','50Gb',2.0000,'+',16),(293,24,57,'Memory','512Mb',1.0000,'+',20),(294,24,57,'Support','Full Linux email support',0.5000,'+',36),(295,24,57,'VPS Duration','1 month (1 week free)',3.0000,'*',28),(296,24,58,'VPS Duration','1 week (Basic)',0.0001,'*',27),(297,24,58,'Support','reboot/reinstall',0.0000,'+',35),(298,24,58,'Memory','128Mb',0.0000,'+',19),(299,24,58,'Hard drive','1Gb',0.0000,'+',38),(300,24,58,'Bandwidth','1Gb/week',0.0000,'+',54),(301,24,58,'Arch','32-bit',0.0000,'+',33),(302,25,59,'VPS Duration','1 week (Basic)',0.0001,'*',27),(303,25,59,'Support','reboot/reinstall',0.0000,'+',35),(304,25,59,'Memory','128Mb',0.0000,'+',19),(305,25,59,'Hard drive','1Gb',0.0000,'+',38),(306,25,59,'Bandwidth','1Gb/week',0.0000,'+',54),(307,25,59,'Arch','32-bit',0.0000,'+',33),(308,26,60,'VPS Duration','1 year (20 weeks free)',32.0000,'*',30),(309,26,60,'Support','Full Linux email support',0.5000,'+',36),(310,26,60,'Memory','512Mb',1.0000,'+',20),(311,26,60,'Hard drive','20Gb',1.5000,'+',15),(312,26,60,'Bandwidth','5Gb/week',1.0000,'+',55),(313,26,60,'Arch','64-bit',0.0000,'+',34),(323,27,62,'Hard drive','1Gb',0.0000,'+',NULL),(322,27,62,'Memory','128Mb',0.0000,'+',NULL),(321,27,62,'Support','reboot/reinstall',0.0000,'+',NULL),(320,27,62,'VPS Duration','1 week (Basic)',0.0001,'*',NULL),(324,27,62,'Bandwidth','1Gb/week',0.0000,'+',NULL),(325,27,62,'Arch','32-bit',0.0000,'+',NULL),(326,28,63,'VPS Duration','1 week (Basic)',0.0001,'*',27),(327,28,63,'Support','reboot/reinstall',0.0000,'+',35),(328,28,63,'Memory','128Mb',0.0000,'+',19),(329,28,63,'Hard drive','1Gb',0.0000,'+',38),(330,28,63,'Bandwidth','1Gb/week',0.0000,'+',54),(331,28,63,'Arch','32-bit',0.0000,'+',33),(332,29,64,'VPS Duration','1 month (1 week free)',3.0000,'*',28),(333,29,64,'Support','reboot/reinstall',0.0000,'+',35),(334,29,64,'Memory','512Mb',1.0000,'+',20),(335,29,64,'Hard drive','10Gb',1.0000,'+',14),(336,29,64,'Bandwidth','1Gb/week',0.0000,'+',54),(337,29,64,'Arch','64-bit',0.0000,'+',34),(338,30,65,'VPS Duration','6 months (7 weeks free)',19.0000,'*',29),(339,30,65,'Support','reboot/reinstall',0.0000,'+',35),(340,30,65,'Memory','512Mb',1.0000,'+',20),(341,30,65,'Hard drive','20Gb',1.5000,'+',15),(342,30,65,'Bandwidth','1Gb/week',0.0000,'+',54),(343,30,65,'Arch','32-bit',0.0000,'+',33),(344,31,66,'VPS Duration','1 week (Basic)',0.0001,'*',NULL),(345,31,66,'Support','reboot/reinstall',0.0000,'+',NULL),(346,31,66,'Memory','768Mb',1.5000,'+',NULL),(347,31,66,'Hard drive','100Gb',2.5000,'+',NULL),(348,31,66,'Bandwidth','50Gb/week',2.5000,'+',NULL),(349,31,66,'Arch','32-bit',0.0000,'+',NULL),(350,32,67,'VPS Duration','1 week (Basic)',0.0001,'*',27),(351,32,67,'Support','reboot/reinstall',0.0000,'+',35),(352,32,67,'Memory','768Mb',1.5000,'+',40),(353,32,67,'Hard drive','100Gb',2.5000,'+',17),(354,32,67,'Bandwidth','50Gb/week',2.5000,'+',58),(355,32,67,'Arch','32-bit',0.0000,'+',33),(356,33,68,'VPS Duration','1 month (1 week free)',3.0000,'*',28),(357,33,68,'Support','reboot/reinstall',0.0000,'+',35),(358,33,68,'Memory','512Mb',1.0000,'+',20),(359,33,68,'Hard drive','10Gb',1.0000,'+',14),(360,33,68,'Bandwidth','1Gb/week',0.0000,'+',54),(361,33,68,'Arch','32-bit',0.0000,'+',33),(362,34,69,'VPS Duration','1 week (Basic)',0.0001,'*',27),(363,34,69,'Support','reboot/reinstall',0.0000,'+',35),(364,34,69,'Memory','1Gb',2.0000,'+',21),(365,34,69,'Hard drive','10Gb',1.0000,'+',14),(366,34,69,'Bandwidth','5Gb/week',1.0000,'+',55),(367,34,69,'Arch','64-bit',0.0000,'+',34),(368,35,70,'VPS Duration','1 month (1 week free)',3.0000,'*',NULL),(369,35,70,'Support','reboot/reinstall',0.0000,'+',NULL),(370,35,70,'Memory','1Gb',2.0000,'+',NULL),(371,35,70,'Hard drive','10Gb',1.0000,'+',NULL),(372,35,70,'Bandwidth','10Gb/week',1.5000,'+',NULL),(373,35,70,'Arch','64-bit',0.0000,'+',NULL),(374,36,71,'VPS Duration','1 month (1 week free)',3.0000,'*',28),(375,36,71,'Support','reboot/reinstall',0.0000,'+',35),(376,36,71,'Memory','1Gb',2.0000,'+',21),(377,36,71,'Hard drive','10Gb',1.0000,'+',14),(378,36,71,'Bandwidth','10Gb/week',1.5000,'+',56),(379,36,71,'Arch','64-bit',0.0000,'+',34),(380,37,72,'Arch','32-bit',0.0000,'+',NULL),(381,37,72,'Bandwidth','5Gb/month',1.0000,'+',NULL),(382,37,72,'Hard drive','100Gb',7.0000,'+',NULL),(383,37,72,'Memory','768Mb',3.0000,'+',NULL),(384,37,72,'Support','reboot/reinstall',0.0000,'+',NULL),(385,37,72,'Version','Slackware 12.0',0.0000,'+',NULL),(386,37,73,'Arch','32-bit',0.0000,'+',NULL),(387,37,73,'Version','Centos 4',0.0000,'+',NULL),(388,38,74,'Version','Ubuntu 8.04',0.0000,'+',NULL),(389,38,74,'Support','reboot/reinstall',0.0000,'+',NULL),(390,38,74,'Memory','1024Mb',4.5000,'+',NULL),(391,38,74,'Hard drive','10Gb',2.0000,'+',NULL),(392,38,74,'Bandwidth','50Gb/month',6.0000,'+',NULL),(393,38,74,'Arch','64-bit',0.0000,'+',NULL),(394,39,75,'Arch','32-bit',0.0000,'+',NULL),(395,39,75,'Version','Slackware 12.0',0.0000,'+',NULL),(396,40,76,'Arch','64-bit',0.0000,'+',NULL),(397,40,76,'Bandwidth','Unlimited',10.0000,'+',NULL),(398,40,76,'Hard drive','50Gb',4.0000,'+',NULL),(399,40,76,'Memory','256Mb',0.5000,'+',NULL),(400,40,76,'Support','reboot/reinstall',0.0000,'+',NULL),(401,40,76,'Version','Ubuntu 9.10',0.0000,'+',NULL),(402,41,77,'Arch','64-bit',0.0000,'+',NULL),(403,41,77,'Bandwidth','50Gb/month',6.0000,'+',NULL),(404,41,77,'Hard drive','20Gb',3.0000,'+',NULL),(405,41,77,'Memory','1024Mb',4.5000,'+',NULL),(406,41,77,'Support','reboot/reinstall',0.0000,'+',NULL),(407,41,77,'Version','Ubuntu 8.04',0.0000,'+',NULL),(408,42,78,'Version','Ubuntu 9.10',0.0000,'+',NULL),(409,42,78,'Support','reboot/reinstall',0.0000,'+',NULL),(410,42,78,'Memory','1024Mb',4.5000,'+',NULL),(411,42,78,'Hard drive','10Gb',2.0000,'+',NULL),(412,42,78,'Bandwidth','50Gb/month',6.0000,'+',NULL),(413,42,78,'Arch','32-bit',0.0000,'+',NULL),(414,43,79,'Version','Ubuntu 9.10',0.0000,'+',NULL),(415,43,79,'Support','reboot/reinstall',0.0000,'+',NULL),(416,43,79,'Memory','1024Mb',4.5000,'+',NULL),(417,43,79,'Hard drive','20Gb',3.0000,'+',NULL),(418,43,79,'Bandwidth','20Gb/month',3.5000,'+',NULL),(419,43,79,'Arch','32-bit',0.0000,'+',NULL),(420,44,80,'Version','Ubuntu 9.10',0.0000,'+',NULL),(421,44,80,'Support','reboot/reinstall',0.0000,'+',NULL),(422,44,80,'Memory','512Mb',2.0000,'+',NULL),(423,44,80,'Hard drive','10Gb',2.0000,'+',NULL),(424,44,80,'Bandwidth','10Gb/month',2.0000,'+',NULL),(425,44,80,'Arch','64-bit',0.0000,'+',NULL),(426,45,81,'Arch','64-bit',0.0000,'+',NULL),(427,45,81,'Bandwidth','1Gb/month',0.0000,'+',NULL),(428,45,81,'Hard drive','1Gb',0.0000,'+',NULL),(429,45,81,'Memory','128Mb',0.0000,'+',NULL),(430,45,81,'Support','reboot/reinstall',0.0000,'+',NULL),(431,45,81,'Version','Ubuntu 8.04',0.0000,'+',NULL),(432,46,82,'Version','Debian 5.0 Lenny',0.0000,'+',NULL),(433,46,82,'Support','reboot/reinstall',0.0000,'+',NULL),(434,46,82,'Memory','2048Mb',7.0000,'+',NULL),(435,46,82,'Hard drive','10Gb',2.0000,'+',NULL),(436,46,82,'Bandwidth','5Gb/month',1.0000,'+',NULL),(437,46,82,'Arch','64-bit',0.0000,'+',NULL),(438,47,83,'Arch','64-bit',0.0000,'+',NULL),(439,47,83,'Bandwidth','1Gb/month',0.0000,'+',NULL),(440,47,83,'Hard drive','1Gb',0.0000,'+',NULL),(441,47,83,'Memory','128Mb',0.0000,'+',NULL),(442,47,83,'Support','reboot/reinstall',0.0000,'+',NULL),(443,47,83,'Version','Ubuntu 9.04',0.0000,'+',NULL);
/*!40000 ALTER TABLE `orders_products_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products_download`
--

DROP TABLE IF EXISTS `orders_products_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products_download` (
  `orders_products_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_filename` varchar(255) NOT NULL DEFAULT '',
  `download_maxdays` int(2) NOT NULL DEFAULT '0',
  `download_count` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orders_products_download_id`),
  KEY `idx_orders_products_download_orders_id` (`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products_download`
--

LOCK TABLES `orders_products_download` WRITE;
/*!40000 ALTER TABLE `orders_products_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_products_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_status`
--

DROP TABLE IF EXISTS `orders_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_status` (
  `orders_status_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `orders_status_name` varchar(32) NOT NULL,
  `public_flag` int(11) DEFAULT '1',
  `downloads_flag` int(11) DEFAULT '0',
  PRIMARY KEY (`orders_status_id`,`language_id`),
  KEY `idx_orders_status_name` (`orders_status_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_status`
--

LOCK TABLES `orders_status` WRITE;
/*!40000 ALTER TABLE `orders_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_status_history`
--

DROP TABLE IF EXISTS `orders_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `orders_status_id` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  `customer_notified` int(1) DEFAULT '0',
  `comments` text,
  PRIMARY KEY (`orders_status_history_id`),
  KEY `idx_orders_status_history_orders_id` (`orders_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_status_history`
--

LOCK TABLES `orders_status_history` WRITE;
/*!40000 ALTER TABLE `orders_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_total`
--

DROP TABLE IF EXISTS `orders_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL,
  `class` varchar(32) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`orders_total_id`),
  KEY `idx_orders_total_orders_id` (`orders_id`)
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_total`
--

LOCK TABLES `orders_total` WRITE;
/*!40000 ALTER TABLE `orders_total` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_fmf_orders_status`
--

DROP TABLE IF EXISTS `paypal_fmf_orders_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_fmf_orders_status` (
  `orders_id` int(11) unsigned NOT NULL DEFAULT '0',
  `paypal_fmf_status_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action_taken` enum('None','Accepted','Denied') NOT NULL DEFAULT 'None',
  `action_date` datetime DEFAULT NULL,
  UNIQUE KEY `orderStatus` (`orders_id`,`paypal_fmf_status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_fmf_orders_status`
--

LOCK TABLES `paypal_fmf_orders_status` WRITE;
/*!40000 ALTER TABLE `paypal_fmf_orders_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_fmf_orders_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_fmf_status`
--

DROP TABLE IF EXISTS `paypal_fmf_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_fmf_status` (
  `paypal_fmf_status_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language_id` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `fmf_status_name` char(45) NOT NULL,
  PRIMARY KEY (`paypal_fmf_status_id`,`language_id`),
  KEY `fmf_status_name` (`fmf_status_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_fmf_status`
--

LOCK TABLES `paypal_fmf_status` WRITE;
/*!40000 ALTER TABLE `paypal_fmf_status` DISABLE KEYS */;
INSERT INTO `paypal_fmf_status` VALUES (1,1,'AVS No Match'),(2,1,'AVS Partial Match'),(3,1,'AVS Unavailable/Unsupported'),(4,1,'Card Security Code (CSC) Mismatch'),(5,1,'Maximum Transaction Amount'),(6,1,'Unconfirmed Address'),(7,1,'Country Monitor'),(8,1,'Large Order Number'),(9,1,'Billing/Shipping Address Mismatch'),(10,1,'Risky ZIP Code'),(11,1,'Suspected Freight Forwarder Check'),(12,1,'Total Purchase Price Minimum'),(13,1,'IP Address Velocity'),(14,1,'Risky Email Address Domain Check'),(15,1,'Risky Bank Identification Number (BIN) Check'),(16,1,'Risky IP Address Range'),(17,1,'PayPal Fraud Model');
/*!40000 ALTER TABLE `paypal_fmf_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_rp_product_lookup`
--

DROP TABLE IF EXISTS `paypal_rp_product_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_rp_product_lookup` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `products_id` int(11) unsigned NOT NULL DEFAULT '0',
  `paypal_rp_product_profile_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rpProd` (`products_id`,`paypal_rp_product_profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_rp_product_lookup`
--

LOCK TABLES `paypal_rp_product_lookup` WRITE;
/*!40000 ALTER TABLE `paypal_rp_product_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_rp_product_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_rp_product_profile`
--

DROP TABLE IF EXISTS `paypal_rp_product_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_rp_product_profile` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `products_id` int(11) unsigned NOT NULL DEFAULT '0',
  `profileStartDate` datetime DEFAULT NULL,
  `billingPeriod` enum('day','week','semimonth','month','year') DEFAULT NULL,
  `billingFrequency` smallint(5) unsigned NOT NULL DEFAULT '1',
  `totalBillingCycles` smallint(5) unsigned NOT NULL DEFAULT '0',
  `trialProfileStartDate` datetime DEFAULT NULL,
  `trialBillingPeriod` enum('day','week','semimonth','month','year') DEFAULT NULL,
  `trialBillingFrequency` smallint(5) unsigned NOT NULL DEFAULT '1',
  `trialTotalBillingCycles` smallint(5) unsigned NOT NULL DEFAULT '1',
  `trialAmt` decimal(15,4) NOT NULL,
  `initAmt` smallint(5) unsigned NOT NULL DEFAULT '0',
  `failedInitAmtAction` enum('ContinueOnFailure','CancelOnFailure') NOT NULL DEFAULT 'ContinueOnFailure'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_rp_product_profile`
--

LOCK TABLES `paypal_rp_product_profile` WRITE;
/*!40000 ALTER TABLE `paypal_rp_product_profile` DISABLE KEYS */;
INSERT INTO `paypal_rp_product_profile` VALUES (6,66,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,1,0.0000,0,'CancelOnFailure'),(7,65,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,1,0.0000,0,'CancelOnFailure'),(8,64,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,1,0.0000,0,'CancelOnFailure'),(9,29,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,1,0.0000,0,'CancelOnFailure'),(10,61,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,1,0.0000,0,'CancelOnFailure'),(11,62,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,1,0.0000,0,'CancelOnFailure'),(12,63,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,1,0.0000,0,'CancelOnFailure'),(13,69,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,0,0.0000,0,'CancelOnFailure'),(14,60,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,1,0.0000,0,'CancelOnFailure'),(15,58,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,1,0.0000,0,'CancelOnFailure'),(16,45,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,1,0.0000,0,'CancelOnFailure'),(17,59,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,1,0.0000,0,'CancelOnFailure'),(18,55,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,1,0.0000,0,'CancelOnFailure'),(19,57,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,1,0.0000,0,'CancelOnFailure'),(20,56,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,1,0.0000,0,'CancelOnFailure'),(21,30,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,1,0.0000,0,'CancelOnFailure'),(22,52,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,1,0.0000,0,'CancelOnFailure'),(23,53,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,0,0.0000,0,'CancelOnFailure'),(24,54,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,0,0.0000,0,'CancelOnFailure'),(25,41,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,1,0.0000,0,'CancelOnFailure'),(26,39,'0000-00-00 00:00:00','month',1,12,'0000-00-00 00:00:00',NULL,0,1,0.0000,0,'CancelOnFailure');
/*!40000 ALTER TABLE `paypal_rp_product_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `products_quantity` int(4) NOT NULL,
  `products_model` varchar(12) DEFAULT NULL,
  `products_image` varchar(64) DEFAULT NULL,
  `products_price` decimal(15,4) NOT NULL,
  `products_date_added` datetime NOT NULL,
  `products_last_modified` datetime DEFAULT NULL,
  `products_date_available` datetime DEFAULT NULL,
  `products_weight` decimal(5,2) NOT NULL,
  `products_status` tinyint(1) NOT NULL,
  `products_tax_class_id` int(11) NOT NULL,
  `manufacturers_id` int(11) DEFAULT NULL,
  `products_ordered` int(11) NOT NULL DEFAULT '0',
  `duration` int(4) DEFAULT NULL,
  `product_type` varchar(64) DEFAULT NULL,
  `fixed_id` int(11) DEFAULT NULL,
  `products_filename` varchar(45) DEFAULT NULL,
  `product_options` text,
  `products_type` enum('standard','recurring') NOT NULL DEFAULT 'standard'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (38,0,'','gentoo.gif',5.0000,'2010-01-04 17:04:23',NULL,NULL,0.00,1,0,0,0,NULL,'debian',NULL,NULL,'custom','standard'),(39,0,'','slackware.gif',8.5000,'2010-01-04 17:08:18','2010-10-26 13:38:21',NULL,0.00,1,0,0,3,NULL,'slackware',16,'slackware-','custom','recurring'),(40,0,'','suse.gif',5.0000,'2010-01-04 17:10:40',NULL,NULL,0.00,1,0,0,0,NULL,'suse',NULL,NULL,'custom','standard'),(41,0,'','centos-logo.png',10.0000,'2010-01-04 19:27:13','2010-10-26 13:01:21',NULL,0.00,1,0,0,8,NULL,'redhat',4,'centos-','custom','recurring'),(43,0,'','alt.gif',5.0000,'2010-01-04 19:36:48','2010-01-04 19:37:30',NULL,0.00,1,0,0,0,NULL,'redhat',NULL,NULL,'custom','standard'),(44,0,'','alt.gif',5.0000,'2010-01-04 19:36:56','2010-01-04 19:37:50',NULL,0.00,1,0,0,0,NULL,'redhat',NULL,NULL,'custom','standard'),(51,0,'',NULL,0.0000,'2010-06-25 04:08:58','2010-06-25 04:15:33',NULL,0.00,1,0,0,0,NULL,NULL,NULL,'','custom','standard'),(36,0,'','alt.gif',5.0000,'2010-01-04 16:56:09',NULL,NULL,0.00,1,0,0,0,NULL,'redhat',NULL,NULL,'custom','standard'),(34,2147483647,'','eyeos.gif',1.0000,'2010-01-03 19:42:09','2010-11-07 19:32:28',NULL,1.00,1,0,0,0,NULL,'eyeos',NULL,'','custom','recurring'),(29,0,'','ubuntu.jpeg',9.5000,'2010-01-02 14:02:44','2010-10-26 12:37:46',NULL,0.00,1,0,0,15,NULL,'debian',20,'ubuntu-','custom','recurring'),(30,2147483647,'','debian.gif',9.0000,'2010-01-02 15:28:17','2010-10-26 12:37:32',NULL,0.00,1,0,0,16,NULL,'debian',8,'debian-','custom','recurring'),(67,0,'',NULL,1.0000,'2010-10-06 16:08:44','2010-11-07 19:35:02',NULL,0.00,1,0,0,1,NULL,NULL,NULL,NULL,NULL,'recurring'),(33,0,'','centos-logo.png',0.0100,'2010-01-03 19:26:15','2010-10-17 16:16:22',NULL,0.00,0,0,0,12,NULL,'redhat',NULL,'','custom','recurring'),(45,999,'','fedora.gif',11.0000,'2010-02-19 18:34:35','2010-10-26 13:15:18',NULL,9.00,1,0,0,38,NULL,'redhat',12,'fedora-','custom','recurring'),(52,12,'','centos-logo.png',12.0000,'2010-08-24 13:36:41','2010-12-17 23:11:10',NULL,0.00,1,0,0,9,NULL,NULL,1,'centos-','fixed','recurring'),(53,0,'','centos-logo.png',27.0000,'2010-08-29 14:27:59','2010-10-17 13:31:46',NULL,0.00,1,0,0,1,NULL,'redhat',3,'centos','fixed','recurring'),(54,0,'','centos-logo.png',20.0000,'2010-08-29 14:29:27','2010-10-17 13:32:11',NULL,0.00,1,0,0,1,NULL,NULL,2,'centos-',NULL,'recurring'),(55,2147483647,'','debian.gif',11.0000,'2010-08-29 20:09:43','2010-10-17 16:42:36',NULL,1.00,1,0,0,2,NULL,'debian',5,'debian-','fixed','recurring'),(56,2147483647,'','debian.gif',19.0000,'2010-08-29 20:13:02','2010-10-17 16:42:48',NULL,1.00,1,0,0,0,NULL,'debian',6,'debian-','fixed','recurring'),(57,2147483647,'','debian.gif',26.0000,'2010-08-29 20:13:07','2010-10-17 16:42:18',NULL,1.00,1,0,0,1,NULL,'debian',7,'debian-','fixed','recurring'),(58,999,'','fedora.gif',28.0000,'2010-08-29 20:51:39','2010-10-17 16:20:38',NULL,9.00,1,0,0,0,NULL,'redhat',11,'fedora-','fixed','recurring'),(59,999,'','fedora.gif',21.0000,'2010-08-29 20:51:47','2010-10-17 16:41:31',NULL,9.00,1,0,0,0,NULL,'redhat',10,'fedora-','fixed','recurring'),(60,999,'','fedora.gif',13.0000,'2010-08-29 20:51:54','2010-10-26 13:14:48',NULL,9.00,1,0,0,1,NULL,'fedora',9,'fedora-','fixed','recurring'),(61,0,'','slackware.gif',9.9900,'2010-08-31 11:40:10','2010-10-17 16:18:13',NULL,0.00,1,0,0,3,NULL,'slackware',13,'slackware-','fixed','recurring'),(62,0,'','slackware.gif',22.5000,'2010-08-31 11:40:13','2010-10-17 16:18:57',NULL,0.00,1,0,0,0,NULL,'slackware',15,'slackware-','fixed','recurring'),(63,0,'','slackware.gif',12.5000,'2010-08-31 11:40:17','2010-10-17 16:18:43',NULL,0.00,1,0,0,0,NULL,'slackware',14,'slackware-','fixed','recurring'),(64,0,'','ubuntu.jpeg',19.0000,'2010-09-01 12:04:25','2010-10-17 16:44:27',NULL,0.00,1,0,0,0,NULL,'debian',18,'ubuntu-','fixed','recurring'),(65,0,'','ubuntu.jpeg',26.5000,'2010-09-01 12:04:46','2010-10-17 16:44:11',NULL,0.00,1,0,0,0,NULL,'debian',19,'ubuntu-','fixed','recurring'),(66,0,'','ubuntu.jpeg',11.5000,'2010-09-01 12:05:27','2010-10-17 16:43:56',NULL,0.00,1,0,0,18,NULL,'debian',17,'ubuntu-','fixed','recurring');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_attributes`
--

DROP TABLE IF EXISTS `products_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_attributes` (
  `products_attributes_id` int(11) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL,
  `options_id` int(11) NOT NULL,
  `options_values_id` int(11) NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_attributes`
--

LOCK TABLES `products_attributes` WRITE;
/*!40000 ALTER TABLE `products_attributes` DISABLE KEYS */;
INSERT INTO `products_attributes` VALUES (543,45,6,38,0.0000,'+'),(520,30,6,14,2.0000,'+'),(519,30,6,15,3.0000,'+'),(518,30,6,17,7.0000,'+'),(516,30,4,19,0.0000,'+'),(515,30,4,43,1.0000,'+'),(514,30,4,20,2.0000,'+'),(513,30,4,40,3.0000,'+'),(66,43,0,0,1.0000,'+'),(512,30,4,21,4.5000,'+'),(510,30,10,35,0.0000,'+'),(508,30,12,27,0.0001,'*'),(507,30,12,28,3.0000,'*'),(604,29,6,14,2.0000,'+'),(603,29,6,15,3.0000,'+'),(602,29,6,17,7.0000,'+'),(600,29,4,19,0.0000,'+'),(599,29,4,43,0.5000,'+'),(598,29,4,20,2.0000,'+'),(597,29,4,40,3.0000,'+'),(596,29,4,21,4.5000,'+'),(594,29,10,35,0.0000,'+'),(592,29,12,27,0.0001,'*'),(591,29,12,28,3.0000,'*'),(590,29,12,29,19.0000,'*'),(1118,29,6,65,10.0000,'+'),(1117,29,4,42,7.0000,'+'),(1116,29,11,60,10.0000,'+'),(1115,39,10,36,15.0000,'+'),(1114,39,11,60,10.0000,'+'),(1112,30,4,42,7.0000,'+'),(1111,30,11,60,10.0000,'+'),(1110,30,6,65,10.0000,'+'),(160,36,9,33,0.0000,'+'),(161,36,9,34,0.0000,'+'),(163,36,6,38,0.0000,'+'),(164,36,6,39,0.5000,'+'),(165,36,6,14,1.0000,'+'),(166,36,6,15,1.5000,'+'),(167,36,6,17,2.5000,'+'),(169,36,4,19,0.0000,'+'),(170,36,4,43,0.5000,'+'),(171,36,4,20,1.0000,'+'),(172,36,4,40,1.5000,'+'),(173,36,4,21,2.0000,'+'),(175,36,10,35,0.0000,'+'),(562,45,6,14,3.0000,'+'),(542,45,6,39,1.0000,'+'),(561,45,6,15,2.0000,'+'),(560,45,6,17,7.0000,'+'),(198,38,9,33,0.0000,'+'),(199,38,9,34,0.0000,'+'),(201,38,6,38,0.0000,'+'),(202,38,6,39,0.5000,'+'),(203,38,6,14,1.0000,'+'),(204,38,6,15,1.5000,'+'),(205,38,6,17,2.5000,'+'),(207,38,4,19,0.0000,'+'),(208,38,4,43,1.0000,'+'),(209,38,4,20,2.0000,'+'),(210,38,4,40,1.5000,'+'),(211,38,4,21,4.0000,'+'),(213,38,10,35,0.0000,'+'),(558,45,4,19,0.0000,'+'),(217,39,9,33,0.0000,'+'),(1079,39,7,50,0.0000,'+'),(220,39,6,38,0.0000,'+'),(221,39,6,39,1.0000,'+'),(222,39,6,14,2.0000,'+'),(223,39,6,15,3.0000,'+'),(224,39,6,17,7.0000,'+'),(226,39,4,19,0.0000,'+'),(227,39,4,43,1.0000,'+'),(228,39,4,20,3.0000,'+'),(229,39,4,40,3.0000,'+'),(230,39,4,21,4.5000,'+'),(232,39,10,35,0.0000,'+'),(557,45,4,43,1.0000,'+'),(556,45,4,20,2.0000,'+'),(236,40,9,33,0.0000,'+'),(237,40,9,34,0.0000,'+'),(239,40,6,38,0.0000,'+'),(240,40,6,39,1.0000,'+'),(241,40,6,14,1.0000,'+'),(242,40,6,15,1.5000,'+'),(243,40,6,17,2.5000,'+'),(245,40,4,19,0.0000,'+'),(246,40,4,43,0.5000,'+'),(247,40,4,20,1.0000,'+'),(248,40,4,40,1.5000,'+'),(249,40,4,21,4.5000,'+'),(251,40,10,35,0.0000,'+'),(555,45,4,40,3.0000,'+'),(554,45,4,21,4.5000,'+'),(552,45,10,35,0.0000,'+'),(550,45,12,27,0.0001,'*'),(549,45,12,28,3.0000,'*'),(506,30,12,29,19.0000,'*'),(505,30,12,30,32.0000,'*'),(504,30,9,33,0.0000,'+'),(503,30,9,34,0.0000,'+'),(501,30,6,38,0.0000,'+'),(500,30,6,39,1.0000,'+'),(1104,45,11,60,10.0000,'+'),(1103,45,4,42,7.0000,'+'),(280,43,9,34,0.0000,'+'),(282,43,6,38,0.0000,'+'),(283,43,6,39,0.5000,'+'),(284,43,6,14,1.0000,'+'),(285,43,6,15,1.5000,'+'),(286,43,10,35,0.0000,'+'),(287,43,6,17,2.5000,'+'),(289,43,4,19,0.0000,'+'),(290,43,4,43,0.5000,'+'),(291,43,4,20,1.0000,'+'),(292,43,4,40,1.5000,'+'),(293,43,4,21,2.0000,'+'),(548,45,12,29,19.0000,'*'),(547,45,12,30,32.0000,'*'),(297,43,11,58,2.5000,'+'),(298,43,11,54,0.0000,'+'),(299,43,11,55,1.0000,'+'),(300,43,11,56,1.5000,'+'),(301,43,11,57,2.0000,'+'),(302,43,11,58,2.5000,'+'),(303,43,11,59,1.0000,'+'),(304,36,9,33,0.0000,'+'),(305,36,9,34,0.0000,'+'),(307,36,6,38,0.0000,'+'),(308,36,6,39,0.5000,'+'),(309,36,6,14,1.0000,'+'),(310,36,6,15,1.5000,'+'),(311,36,6,17,2.5000,'+'),(313,36,4,19,0.0000,'+'),(314,36,4,43,0.5000,'+'),(315,36,4,20,1.0000,'+'),(316,36,4,40,1.5000,'+'),(317,36,4,21,2.0000,'+'),(319,36,10,35,0.0000,'+'),(546,45,9,33,0.0000,'+'),(545,45,9,34,0.0000,'+'),(329,36,11,54,0.0000,'+'),(330,36,11,55,1.0000,'+'),(331,36,11,56,1.5000,'+'),(332,36,11,57,2.0000,'+'),(333,36,11,58,2.5000,'+'),(334,36,11,59,1.0000,'+'),(341,38,11,54,0.0000,'+'),(342,38,11,55,1.0000,'+'),(343,38,11,56,1.5000,'+'),(344,38,11,57,2.0000,'+'),(345,38,11,58,2.5000,'+'),(346,38,11,59,1.0000,'+'),(347,39,11,54,0.0000,'+'),(348,39,11,55,1.0000,'+'),(349,39,11,56,2.0000,'+'),(350,39,11,57,3.5000,'+'),(351,39,11,58,6.0000,'+'),(1113,39,6,65,10.0000,'+'),(353,40,11,54,0.0000,'+'),(354,40,11,55,1.0000,'+'),(355,40,11,56,1.5000,'+'),(356,40,11,57,2.0000,'+'),(357,40,11,58,6.0000,'+'),(358,40,11,59,1.0000,'+'),(589,29,12,30,32.0000,'*'),(588,29,9,33,0.0000,'+'),(587,29,9,34,0.0000,'+'),(585,29,6,38,0.0000,'+'),(584,29,6,39,1.0000,'+'),(784,34,13,30,32.0000,'*'),(783,34,13,29,19.0000,'*'),(782,34,13,28,3.0000,'*'),(781,34,13,27,0.0001,'*'),(772,41,11,58,6.0000,'+'),(771,41,11,57,3.5000,'+'),(1109,41,4,42,7.0000,'+'),(1108,41,6,65,10.0000,'+'),(1107,41,11,60,10.0000,'+'),(1106,45,6,65,10.0000,'+'),(770,41,11,56,2.0000,'+'),(769,41,11,55,1.0000,'+'),(768,41,11,54,0.0000,'+'),(767,41,6,14,3.0000,'+'),(766,41,6,15,2.0000,'+'),(777,29,10,36,10.0000,'+'),(765,41,6,17,7.0000,'+'),(776,30,10,36,10.0000,'+'),(1016,51,11,58,3.5000,'+'),(1015,51,11,57,3.0000,'+'),(1014,51,11,56,2.5000,'+'),(763,41,4,19,0.0000,'+'),(1013,51,11,55,2.0000,'+'),(762,41,4,43,1.0000,'+'),(761,41,4,20,2.0000,'+'),(760,41,4,40,3.0000,'+'),(759,41,4,21,4.5000,'+'),(773,41,10,36,10.0000,'+'),(683,30,11,54,0.0000,'+'),(684,30,11,55,1.0000,'+'),(685,30,11,56,2.0000,'+'),(686,30,11,57,3.5000,'+'),(687,30,11,58,6.0000,'+'),(693,45,11,54,0.0000,'+'),(694,45,11,55,1.0000,'+'),(695,45,11,56,2.0000,'+'),(696,45,11,57,3.5000,'+'),(697,45,11,58,6.0000,'+'),(703,29,11,54,0.0000,'+'),(704,29,11,55,1.0000,'+'),(705,29,11,56,2.0000,'+'),(706,29,11,57,3.5000,'+'),(707,29,11,58,6.0000,'+'),(757,41,10,35,0.0000,'+'),(756,41,12,27,0.0000,''),(755,41,12,28,3.0000,'*'),(754,41,12,29,19.0000,'*'),(753,41,12,30,32.0000,'*'),(752,41,9,33,0.0000,'+'),(751,41,9,34,0.0000,'+'),(749,41,6,38,0.0000,'+'),(748,41,6,39,1.0000,'+'),(1007,41,6,16,4.0000,'+'),(1005,36,6,16,2.0000,'+'),(1004,43,6,16,2.0000,'+'),(1003,40,6,16,2.0000,'+'),(1002,39,6,16,4.0000,'+'),(1001,38,6,16,2.0000,'+'),(1000,45,6,16,4.0000,'+'),(998,36,6,16,2.0000,'+'),(1105,45,10,36,10.0000,'+'),(996,29,6,16,4.0000,'+'),(994,30,6,16,4.0000,'+'),(1017,52,9,33,0.0000,'+'),(1018,52,9,34,0.0000,'+'),(1019,52,7,61,0.0000,'+'),(1020,52,7,62,0.0000,'+'),(1021,54,9,33,0.0000,'+'),(1056,60,7,46,0.0000,'+'),(1023,54,7,61,0.0000,'+'),(1024,54,7,62,0.0000,'+'),(1025,53,9,33,0.0000,'+'),(1030,41,7,61,0.0000,'+'),(1027,53,7,61,0.0000,'+'),(1028,53,7,62,0.0000,'+'),(1029,53,9,34,0.0000,'+'),(1031,41,7,62,0.0000,'+'),(1032,55,9,33,0.0000,'+'),(1040,56,7,32,0.0000,'+'),(1034,55,7,32,0.0000,'+'),(1035,55,7,31,0.0000,'+'),(1036,56,9,33,0.0000,'+'),(1037,55,9,34,0.0000,'+'),(1039,56,9,34,0.0000,'+'),(1041,56,7,31,0.0000,'+'),(1073,61,9,33,0.0000,'+'),(1054,60,7,45,0.0000,'+'),(1044,57,7,32,0.0000,'+'),(1045,57,7,31,0.0000,'+'),(1046,30,7,32,0.0000,'+'),(1047,30,7,31,0.0000,'+'),(1048,60,9,33,0.0000,'+'),(1049,60,9,34,0.0000,'+'),(1050,59,9,33,0.0000,'+'),(1052,57,9,33,0.0000,'+'),(1053,57,9,34,0.0000,'+'),(1059,55,7,47,0.0000,'+'),(1060,60,7,47,0.0000,'+'),(1061,59,9,34,0.0000,'+'),(1062,59,7,45,0.0000,'+'),(1063,59,7,46,0.0000,'+'),(1064,59,7,47,0.0000,'+'),(1065,58,9,33,0.0000,'+'),(1066,58,9,34,0.0000,'+'),(1067,45,7,45,0.0000,'+'),(1068,58,7,45,0.0000,'+'),(1069,58,7,46,0.0000,'+'),(1070,58,7,47,0.0000,'+'),(1071,45,7,46,0.0000,'+'),(1072,45,7,47,0.0000,'+'),(1074,61,7,50,0.0000,'+'),(1075,63,9,33,0.0000,'+'),(1076,63,7,50,0.0000,'+'),(1077,58,9,33,0.0000,'+'),(1078,62,7,50,0.0000,'+'),(1080,66,9,33,0.0000,'+'),(1081,66,9,34,0.0000,'+'),(1082,66,7,24,0.0000,'+'),(1083,66,7,25,0.0000,'+'),(1084,66,7,26,0.0000,'+'),(1085,66,7,51,0.0000,'+'),(1086,64,9,33,0.0000,'+'),(1087,54,9,34,0.0000,'+'),(1088,64,7,24,0.0000,'+'),(1089,64,7,25,0.0000,'+'),(1090,64,7,26,0.0000,'+'),(1091,64,7,51,0.0000,'+'),(1092,64,9,34,0.0000,'+'),(1093,65,9,33,0.0000,'+'),(1094,65,9,34,0.0000,'+'),(1095,65,7,24,0.0000,'+'),(1096,65,7,25,0.0000,'+'),(1097,65,7,26,0.0000,'+'),(1098,65,7,51,0.0000,'+'),(1099,29,7,24,0.0000,'+'),(1100,29,7,25,0.0000,'+'),(1101,29,7,26,0.0000,'+'),(1102,29,7,51,0.0000,'+');
/*!40000 ALTER TABLE `products_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_attributes_download`
--

DROP TABLE IF EXISTS `products_attributes_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL,
  `products_attributes_filename` varchar(255) NOT NULL DEFAULT '',
  `products_attributes_maxdays` int(2) DEFAULT '0',
  `products_attributes_maxcount` int(2) DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_attributes_download`
--

LOCK TABLES `products_attributes_download` WRITE;
/*!40000 ALTER TABLE `products_attributes_download` DISABLE KEYS */;
INSERT INTO `products_attributes_download` VALUES (26,'unreal.zip',7,3);
/*!40000 ALTER TABLE `products_attributes_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_description`
--

DROP TABLE IF EXISTS `products_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_description` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_description` text,
  `products_url` varchar(255) DEFAULT NULL,
  `products_viewed` int(5) DEFAULT '0',
  `product_duration` int(11) DEFAULT NULL,
  `products_description2` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_description`
--

LOCK TABLES `products_description` WRITE;
/*!40000 ALTER TABLE `products_description` DISABLE KEYS */;
INSERT INTO `products_description` VALUES (30,1,'Debian VPS Customize!','<img src=\"images/debian_banner.jpg\"></img>\r\n\r\n<table border=\"0\" class=\"prod2_table1\">\r\n<td class=\"desc desc2_padd\"><tr>Customized Debian Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the yum command.</tr></td>\r\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3>\r\n<ul><br>\r\n<li>Choose bandwidth below</li>\r\n<li>Choose harddrive below</li>\r\n<li>ChooseRAM below</li>\r\n<li>Install whatever you want</li></ul>\r\n</td>\r\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\r\n<ul>\r\n<li>Apache webserver </li>\r\n<li>Webmin (for web administration) </li>\r\n<li>openssh (for command line connectivity)</li>\r\n<li>Full Root Access</li>\r\n </td></tr>\r\n</table>','',469,30,'	<br><ul><li>Fully Customizable system</li><li>Choose throughput</li><li>Choose Hard drive size</li><li>Choose amount of RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install what you want!</li></ul>'),(58,1,'Fedora VPS *MaxPro*','<img src=\"images/fedoracore_banner_1.jpg\"></img>\r\n\r\n<table border=\"0\" class=\"prod2_table1\">\r\n<td class=\"desc desc2_padd\"><tr>MaxPro Fedora Core Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the yum command.</tr></td>\r\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3>\r\n<ul><br>\r\n<li>50GB/month throughput</li>\r\n<li>100GB Hard drive</li>\r\n<li>1Gb RAM</li>\r\n<li>Install whatever you want</li></ul>\r\n</td>\r\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\r\n<ul>\r\n<li>Apache webserver </li>\r\n<li>Webmin (for web administration) </li>\r\n<li>openssh (for command line connectivity)</li>\r\n<li>Full Root Access</li>\r\n </td></tr>\r\n</table>','',30,NULL,'	<br><ul><li>MaxPro System</li><li>50GB/month throughput</li><li>100GB Hard drive</li><li>1Gb RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install what you want!</li></ul>'),(33,1,'new product','','',17,NULL,'<br><ul><li>Basic System</li><li>4GB/month throughput</li><li>5GB Hard drive</li><li>128Mb RAM</li><li>Full Root Access</li><li>Install what you want!</li></ul>'),(34,1,'EyeOS - Office (Basic)','<table border=\"0\">\r\n<td>\r\n\r\n<b>EyeOS Web Desktop - Office (Basic)<br>\r\n\r\nDefault features:\r\n<ul>\r\n  \r\n  <li>Max File Upload size: 20Mb</li>\r\n  <li>Upload/Download to mobile/smartphone</li>\r\n  <li>Compatible with most modern web browsers</li>\r\n  <li>Unlimited Bandwidth</li>\r\n  <li>5Gb Storage</li>\r\n  <li>Office apps pre-installed</li>\r\n  </ul>\r\n\r\n</td>\r\n</table>','',88,365,'	<br><ul><li>Basic System</li><li>Web Access</li><li>Unlimited Bandwidth</li><li>Max File Size: 10Mb</li><li>Upload/Download to mobile/smartphone</li><li>Full Root Access</li><li>Monthly Billing</li><li>Office Applications</li></ul>'),(68,1,'EyeOS - Office3','','',0,NULL,NULL),(36,1,'Alt Linux VZ - 1 year',NULL,NULL,7,365,'<br><ul><li>Basic System</li><li>4GB/month throughput</li><li>5GB Hard drive</li><li>128Mb RAM</li><li>Full Root Access</li><li>Install what you want!</li></ul>'),(38,1,'Gentoo VZ - 1 year',NULL,NULL,4,365,'<br><ul><li>Basic System</li><li>4GB/month throughput</li><li>5GB Hard drive</li><li>128Mb RAM</li><li>Full Root Access</li><li>Install what you want!</li></ul>'),(39,1,'Slackware VPS Customize!','<img src=\"images/slackware_banner.jpg\"></img>\r\n\r\n<table border=\"0\" class=\"prod2_table1\">\r\n<td class=\"desc desc2_padd\"><tr>Customized Slackware Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the swaret command.</tr></td>\r\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3>\r\n<ul><br>\r\n<li>Choose your bandwidth below</li>\r\n<li>Choose your Hard drive below</li>\r\n<li>Choose you RAM below</li>\r\n<li>Install whatever you want</li></ul>\r\n</td>\r\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\r\n<ul>\r\n<li>Apache webserver </li>\r\n<li>Webmin (for web administration) </li>\r\n<li>openssh (for command line connectivity)</li>\r\n<li>Full Root Access</li>\r\n </td></tr>\r\n</table>','',89,365,'<br><ul><li>Fully Customizable system</li><li>Choose throughput</li><li>Choose Hard drive size</li><li>Choose amount of RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install what you want!</li></ul>'),(40,1,'SuSe/OpenSuSE VZ - 1 year',NULL,NULL,17,365,'<br><ul><li>Basic System</li><li>4GB/month throughput</li><li>5GB Hard drive</li><li>128Mb RAM</li><li>Full Root Access</li><li>Install what you want!</li></ul>'),(41,1,'Centos VPS - Customize!!!','<img src=\"images/centos_banner.jpg\"></img>\r\n\r\n<table border=\"0\" class=\"prod2_table1\">\r\n<td class=\"desc desc2_padd\"><tr>Customized CentOS Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the yum command.</tr></td>\r\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3>\r\n<ul><br>\r\n<li>Choose bandwidth below</li>\r\n<li>Choose Hard drive below</li>\r\n<li>Choose RAM below</li>\r\n<li>Install whatever you want</li></ul>\r\n</td>\r\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\r\n<ul>\r\n<li>Apache webserver </li>\r\n<li>Webmin (for web administration) </li>\r\n<li>openssh (for command line connectivity)</li>\r\n<li>Full Root Access</li>\r\n </td></tr>\r\n</table>','',465,7,'<br><ul><li>Fully Customizable system</li><li>Choose throughput</li><li>Choose Hard drive size</li><li>Choose amount of RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install what you want!</li></ul>'),(67,1,'EyeOS - Office (VPS)','<table>\r\n<td>\r\n<ul>\r\n \r\n   <li>Compatible with most modern web browsers/smartphones</li>\r\n  <li>Unlimited Bandwidth</li>\r\n<li>Unlimited Accounts </li>\r\n  <li>50Gb Storage</li>\r\n  <li>Office apps pre-installed</li>\r\n  <li>Full Admin access of EyeOS<li>\r\n  <li>Full root access of VPS System(Debian)</li>\r\n  <li>Install What you want</li>\r\n  </ul>\r\n\r\n</td>\r\n</table>','',10,NULL,'<br><ul><li>EyeOS VPS System</li><li>Web Access</li><li>40GB/month throughput</li><li>Upload/Download to mobile/smartphone</li><li>Full Admin Access</li><li>Full Root Access</li><li>Monthly Billing</li><li>Office Applications</li></ul>'),(43,1,'Alt Linux VZ - 1 month',NULL,NULL,4,30,'<br><ul><li>Basic System</li><li>4GB/month throughput</li><li>5GB Hard drive</li><li>128Mb RAM</li><li>Full Root Access</li><li>Install what you want!</li></ul>'),(44,1,'Alt Linux VZ - 1 week',NULL,NULL,3,7,'<br><ul><li>Basic System</li><li>4GB/month throughput</li><li>5GB Hard drive</li><li>128Mb RAM</li><li>Full Root Access</li><li>Install what you want!</li></ul>'),(29,1,'Ubuntu VPS Customize','<img src=\"images/ubuntu_banner.jpg\"></img>\r\n\r\n<table border=\"0\" class=\"prod2_table1\">\r\n<td class=\"desc desc2_padd\"><tr>Customized Ubuntu Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the apt-get command.</tr></td>\r\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3>\r\n<ul><br>\r\n<li>Choose Bandwidth below</li>\r\n<li>Choose Harddrive below</li>\r\n<li>Choose RAM below</li>\r\n<li>Install whatever you want</li></ul>\r\n</td>\r\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\r\n<ul>\r\n<li>Apache webserver </li>\r\n<li>Webmin (for web administration) </li>\r\n<li>openssh (for command line connectivity)</li>\r\n<li>Full Root Access</li>\r\n </td></tr>\r\n</table>','',447,365,'	<br><ul><li>Fully Customizable system</li><li>Choose throughput</li><li>Choose Hard drive size</li><li>Choose amount of RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install what you want!</li></ul>'),(45,1,'Fedora VPS Customize!','<img src=\"images/fedoracore_banner_1.jpg\"></img>\r\n\r\n<table border=\"0\" class=\"prod2_table1\">\r\n<td class=\"desc desc2_padd\"><tr>Customized Fedora Core Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the yum command.</tr></td>\r\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3>\r\n<ul><br>\r\n<li>Choose bandwidth below</li>\r\n<li>Choose Hard drive below</li>\r\n<li>Choose RAM below</li>\r\n<li>Install whatever you want</li></ul>\r\n</td>\r\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\r\n<ul>\r\n<li>Apache webserver </li>\r\n<li>Webmin (for web administration) </li>\r\n<li>openssh (for command line connectivity)</li>\r\n<li>Full Root Access</li>\r\n </td></tr>\r\n</table>','',307,NULL,'	 <br><ul><li>Fully Customizable system</li><li>Choose throughput</li><li>Choose Hard drive size</li><li>Choose amount of RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install What You Want</li></ul>'),(51,1,'Bandwidth Upgrade',NULL,NULL,2,NULL,NULL),(52,1,'Centos VPS *Basic*','<img src=\"images/centos_banner.jpg\"></img>\r\n\r\n<table border=\"0\" class=\"prod2_table1\">\r\n<td class=\"desc desc2_padd\"><tr>Basic CentOS Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the yum command.</tr></td>\r\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3>\r\n<ul><br>\r\n<li>4GB/month throughput<li>\r\n<li>5GB Hard Drive</li>\r\n<li>128Mb RAM</li>\r\n<li>Install whatever you want</li></ul>\r\n</td>\r\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\r\n<ul>\r\n<li>Apache webserver </li>\r\n<li>Webmin (for web administration) </li>\r\n<li>openssh (for command line connectivity)</li>\r\n<li>Full Root Access</li>\r\n </td></tr>\r\n</table>','',126,NULL,'<ul><li>Basic System</li><li>4GB/month throughput</li><li>5GB Hard drive</li><li>128Mb RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install what you want!</li></ul>'),(53,1,'Centos VPS *MaxPro*','<img src=\"images/centos_banner.jpg\"></img>\r\n\r\n<table border=\"0\" class=\"prod2_table1\">\r\n<td class=\"desc desc2_padd\"><tr>MaxPro CentOS Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the yum command.</tr></td>\r\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3>\r\n<ul><br>\r\n<li>50Gb/month throughput</li>\r\n<li>100Gb Hard Drive</li>\r\n<li>1GB RAM</li>\r\n<li>Install whatever you want</li></ul>\r\n</td>\r\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\r\n<ul>\r\n<li>Apache webserver </li>\r\n<li>Webmin (for web administration) </li>\r\n<li>openssh (for command line connectivity)</li>\r\n<li>Full Root Access</li>\r\n </td></tr>\r\n</table>','',30,NULL,'<br><ul><li>MaxPro System</li><li>50GB/month throughput</li><li>100GB Hard drive</li><li>1Gb RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install what you want!</li></ul>'),(54,1,'Centos VPS *MidRange*','<img src=\"images/centos_banner.jpg\"></img>\r\n\r\n<table border=\"0\" class=\"prod2_table1\">\r\n<td class=\"desc desc2_padd\"><tr>MidRange CentOS Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the yum command.</tr></td>\r\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3>\r\n<ul><br>\r\n<li>20Gb/month throughput</li>\r\n<li>50Gb Hard Drive</li>\r\n<li>512Mb RAM</li>\r\n<li>Install whatever you want</li></ul>\r\n</td>\r\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\r\n<ul>\r\n<li>Apache webserver </li>\r\n<li>Webmin (for web administration) </li>\r\n<li>openssh (for command line connectivity)</li>\r\n<li>Full Root Access</li>\r\n </td></tr>\r\n</table>','',35,NULL,'<br><ul><li>Midrange System</li><li>20GB/month throughput</li><li>50GB Hard drive</li><li>512Mb RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install what you want!</li></ul>'),(55,1,'Debian VPS *Basic*','<img src=\"images/debian_banner.jpg\"></img>\r\n\r\n<table border=\"0\" class=\"prod2_table1\">\r\n<td class=\"desc desc2_padd\"><tr>Basic Debian Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the yum command.</tr></td>\r\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3>\r\n<ul><br>\r\n<li>4Gb/month throughput</li>\r\n<li>5Gb Hard Drive</li>\r\n<li>128Mb RAM</li>\r\n<li>Install whatever you want</li></ul>\r\n</td>\r\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\r\n<ul>\r\n<li>Apache webserver </li>\r\n<li>Webmin (for web administration) </li>\r\n<li>openssh (for command line connectivity)</li>\r\n<li>Full Root Access</li>\r\n </td></tr>\r\n</table>','',46,NULL,'	<br><ul><li>Basic System</li><li>4GB/month throughput</li><li>5GB Hard drive</li><li>128Mb RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install what you want!</li></ul>'),(59,1,'FedoraVPS *MidRange*','<img src=\"images/fedoracore_banner_1.jpg\"></img>\r\n\r\n<table border=\"0\" class=\"prod2_table1\">\r\n<td class=\"desc desc2_padd\"><tr>MidRange Fedora Core Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the yum command.</tr></td>\r\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3>\r\n<ul><br>\r\n<li>40GB/month throughput</li>\r\n<li>50GB Hard drive</li>\r\n<li>512 Mb RAM</li>\r\n<li>Install whatever you want</li></ul>\r\n</td>\r\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\r\n<ul>\r\n<li>Apache webserver </li>\r\n<li>Webmin (for web administration) </li>\r\n<li>openssh (for command line connectivity)</li>\r\n<li>Full Root Access</li>\r\n </td></tr>\r\n</table>','',34,NULL,'	<br><ul><li>Midrange System</li><li>40GB/month throughput</li><li>50GB Hard drive</li><li>512Mb RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install what you want!</li></ul>'),(56,1,'Debian VPS *MidRange*','<img src=\"images/debian_banner.jpg\"></img>\r\n\r\n<table border=\"0\" class=\"prod2_table1\">\r\n<td class=\"desc desc2_padd\"><tr>MidRange Debian Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the yum command.</tr></td>\r\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3>\r\n<ul><br>\r\n<li>20Gb/month throughput</li>\r\n<li>50Gb Hard Drive</li>\r\n<li>512Mb RAM</li>\r\n<li>Install whatever you want</li></ul>\r\n</td>\r\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\r\n<ul>\r\n<li>Apache webserver </li>\r\n<li>Webmin (for web administration) </li>\r\n<li>openssh (for command line connectivity)</li>\r\n<li>Full Root Access</li>\r\n </td></tr>\r\n</table>','',17,NULL,'	<br><ul><li>Midrange System</li><li>20GB/month throughput</li><li>50GB Hard drive</li><li>512Mb RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install what you want!</li></ul>'),(57,1,'Debian VPS *MaxPro*','<img src=\"images/debian_banner.jpg\"></img>\r\n\r\n<table border=\"0\" class=\"prod2_table1\">\r\n<td class=\"desc desc2_padd\"><tr>MaxPro Debian Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the yum command.</tr></td>\r\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3>\r\n<ul><br>\r\n<li>50Gb/month throughput</li>\r\n<li>100Gb Hard Drive</li>\r\n<li>1Gb RAM</li>\r\n<li>Install whatever you want</li></ul>\r\n</td>\r\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\r\n<ul>\r\n<li>Apache webserver </li>\r\n<li>Webmin (for web administration) </li>\r\n<li>openssh (for command line connectivity)</li>\r\n<li>Full Root Access</li>\r\n </td></tr>\r\n</table>','',33,NULL,'	<br><ul><li>Midrange System</li><li>50GB/month throughput</li><li>100GB Hard drive</li><li>1Gb RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install what you want!</li></ul>'),(60,1,'Fedora VPS *Basic*','<img src=\"images/fedoracore_banner_1.jpg\"></img>\r\n\r\n<table border=\"0\" class=\"prod2_table1\">\r\n<td class=\"desc desc2_padd\"><tr>Basic Fedora Core Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the yum command.</tr></td>\r\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3>\r\n<ul><br>\r\n<li>4GB/month throughput</li>\r\n<li>5GB Hard drive</li>\r\n<li>128 Mb RAM</li>\r\n<li>Install whatever you want</li></ul>\r\n</td>\r\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\r\n<ul>\r\n<li>Apache webserver </li>\r\n<li>Webmin (for web administration) </li>\r\n<li>openssh (for command line connectivity)</li>\r\n<li>Full Root Access</li>\r\n </td></tr>\r\n</table>','',52,NULL,'	<br><ul><li>Basic System</li><li>4GB/month throughput</li><li>5GB Hard drive</li><li>128Mb RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install what you want!</li></ul>'),(61,1,'Slackware VPS *Basic*','<img src=\"images/slackware_banner.jpg\"></img>\r\n\r\n<table border=\"0\" class=\"prod2_table1\">\r\n<td class=\"desc desc2_padd\"><tr>Basic Slackware Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the swaret command.</tr></td>\r\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3>\r\n<ul><br>\r\n<li>4GB/month throughput</li>\r\n<li>5GB Hard drive</li>\r\n<li>128Mb RAM</li>\r\n<li>Install whatever you want</li></ul>\r\n</td>\r\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\r\n<ul>\r\n<li>Apache webserver </li>\r\n<li>Webmin (for web administration) </li>\r\n<li>openssh (for command line connectivity)</li>\r\n<li>Full Root Access</li>\r\n </td></tr>\r\n</table>','',57,NULL,'<br><ul><li>Basic System</li><li>4GB/month throughput</li><li>5GB Hard drive</li><li>128Mb RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install what you want!</li></ul>'),(62,1,'Slackware VPS *MaxPro*','<img src=\"images/slackware_banner.jpg\"></img>\r\n\r\n<table border=\"0\" class=\"prod2_table1\">\r\n<td class=\"desc desc2_padd\"><tr>MaxPro Slackware Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the swaret command.</tr></td>\r\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3>\r\n<ul><br>\r\n<li>50GB/month throughput</li>\r\n<li>100GB Hard drive</li>\r\n<li>1Gb RAM</li>\r\n<li>Install whatever you want</li></ul>\r\n</td>\r\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\r\n<ul>\r\n<li>Apache webserver </li>\r\n<li>Webmin (for web administration) </li>\r\n<li>openssh (for command line connectivity)</li>\r\n<li>Full Root Access</li>\r\n </td></tr>\r\n</table>','',27,NULL,'<br><ul><li>MaxPro System</li><li>50GB/month throughput</li><li>50GB Hard drive</li><li>512Mb RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install what you want!</li></ul>'),(63,1,'Slackware VPS *MidRange*','<img src=\"images/slackware_banner.jpg\"></img>\r\n\r\n<table border=\"0\" class=\"prod2_table1\">\r\n<td class=\"desc desc2_padd\"><tr>Midrange Slackware Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the swaret command.</tr></td>\r\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3>\r\n<ul><br>\r\n<li>20GB/month throughput</li>\r\n<li>50GB Hard drive</li>\r\n<li>512Mb RAM</li>\r\n<li>Install whatever you want</li></ul>\r\n</td>\r\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\r\n<ul>\r\n<li>Apache webserver </li>\r\n<li>Webmin (for web administration) </li>\r\n<li>openssh (for command line connectivity)</li>\r\n<li>Full Root Access</li>\r\n </td></tr>\r\n</table>','',31,NULL,'<br><ul><li>Midrange System</li><li>20GB/month throughput</li><li>50GB Hard drive</li><li>512Mb RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install what you want!</li></ul>'),(64,1,'Ubuntu VPS *MidRange*','<img src=\"images/ubuntu_banner.jpg\"></img>\r\n\r\n<table border=\"0\" class=\"prod2_table1\">\r\n<td class=\"desc desc2_padd\"><tr>MidRange Ubuntu Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the apt-get command.</tr></td>\r\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3>\r\n<ul><br>\r\n<li>20GB/month throughput</li>\r\n<li>50GB Hard drive</li>\r\n<li>512Mb RAM</li>\r\n<li>Install whatever you want</li></ul>\r\n</td>\r\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\r\n<ul>\r\n<li>Apache webserver </li>\r\n<li>Webmin (for web administration) </li>\r\n<li>openssh (for command line connectivity)</li>\r\n<li>Full Root Access</li>\r\n </td></tr>\r\n</table>','',29,NULL,'<br><ul><li>Midrange System</li><li>20GB/month throughput</li><li>50GB Hard drive</li><li>512Mb RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install what you want!</li></ul>'),(65,1,'Ubuntu VPS *MaxPro*','<img src=\"images/ubuntu_banner.jpg\"></img>\n\n<table border=\"0\" class=\"prod2_table1\">\n<td class=\"desc desc2_padd\"><tr>Basic Ubuntu Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the apt-get command.</tr></td>\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3>\n<ul><br>\n<li>50GB/month throughput</li>\n<li>100GB Hard drive</li>\n<li>1Gb RAM</li>\n<li>Install whatever you want</li></ul>\n</td>\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\n<ul>\n<li>Apache webserver </li>\n<li>Webmin (for web administration) </li>\n<li>openssh (for command line connectivity)</li>\n<li>Full Root Access</li>\n </td></tr>\n</table>',NULL,35,NULL,'	<br><ul><li>MaxPro System</li><li>50GB/month throughput</li><li>50GB Hard drive</li><li>1Gb RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install what you want!</li></ul>'),(66,1,'Ubuntu VPS *Basic*','<img src=\"images/ubuntu_banner.jpg\"></img>\r\n\r\n<table border=\"0\" class=\"prod2_table1\">\r\n<td class=\"desc desc2_padd\"><tr>MaxPro Ubuntu Linux VPS System. SSH and Webmin is installed for first access.  GUI and other application can be installed via the apt-get command.</tr></td>\r\n<tr><td class=\"desc desc2_padd\"><h3>Configuration:</h3><ul><br><li>4GB/month throughput</li><li>5GB Hard drive</li>\r\n<li>128Mb RAM</li>\r\n<li>Install whatever you want</li>\r\n</ul></td>\r\n<td class=\"desc desc2_padd\"><h3>Default features:</h3>\r\n<ul>\r\n<li>Apache webserver </li>\r\n<li>Webmin (for web administration) </li>\r\n<li>openssh (for command line connectivity)</li>\r\n<li>Full Root Access</li>\r\n </td></tr>\r\n</table>','',147,NULL,'	<br><ul><li>Basic System</li><li>4GB/month throughput</li><li>5GB Hard drive</li><li>128Mb RAM</li><li>Full Root Access</li><li>Monthly Billing</li><li>Install what you want!</li></ul>');
/*!40000 ALTER TABLE `products_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_notifications`
--

DROP TABLE IF EXISTS `products_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_notifications` (
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`products_id`,`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_notifications`
--

LOCK TABLES `products_notifications` WRITE;
/*!40000 ALTER TABLE `products_notifications` DISABLE KEYS */;
INSERT INTO `products_notifications` VALUES (42,2,'2010-02-18 02:43:56'),(29,17,'2010-07-09 21:07:50'),(29,21,'2010-10-13 16:06:02'),(29,27,'2010-11-08 14:01:51'),(64,27,'2010-11-08 14:26:16'),(29,28,'2010-11-10 19:33:00'),(29,30,'2010-11-17 12:49:19'),(30,32,'2010-12-06 17:06:37'),(29,34,'2010-12-14 16:17:55');
/*!40000 ALTER TABLE `products_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options`
--

DROP TABLE IF EXISTS `products_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_options` (
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_name` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_options`
--

LOCK TABLES `products_options` WRITE;
/*!40000 ALTER TABLE `products_options` DISABLE KEYS */;
INSERT INTO `products_options` VALUES (4,1,'Memory'),(10,1,'Support'),(9,1,'Arch'),(7,1,'Version'),(6,1,'Hard drive'),(11,1,'Bandwidth');
/*!40000 ALTER TABLE `products_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options_values`
--

DROP TABLE IF EXISTS `products_options_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_options_values` (
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_values_name` varchar(64) NOT NULL DEFAULT '',
  `min_val` bigint(20) DEFAULT NULL,
  `max_val` int(11) DEFAULT NULL,
  `str_val1` varchar(64) DEFAULT NULL,
  `str_val2` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_options_values`
--

LOCK TABLES `products_options_values` WRITE;
/*!40000 ALTER TABLE `products_options_values` DISABLE KEYS */;
INSERT INTO `products_options_values` VALUES (1,1,'4Mb',4,4,'',NULL),(2,1,'8Mb',8,8,NULL,NULL),(3,1,'16Mb',16,16,'',NULL),(4,1,'32Mb',32,0,NULL,NULL),(26,1,'Ubuntu 9.04',0,NULL,'ubuntu-9.04-','ubuntu-9.04-'),(49,1,'Slackware 11.0',0,NULL,'slackware-11.0-',NULL),(48,1,'Slackware 10.2',0,NULL,'slackware-10.2-',NULL),(47,1,'Fedora Core 11',NULL,NULL,'fedora-11-','fedora-11-'),(46,1,'Fedora Core 10',NULL,NULL,'fedora-10-','fedora-10-'),(45,1,'Fedora Core 9',NULL,NULL,'fedora-9-','fedora-9-'),(44,1,'Fedora Core 8',NULL,NULL,'fedora-8-','fedora-8-'),(24,1,'Ubuntu 8.04',NULL,NULL,'ubuntu-8.04-','ubuntu-8.04-'),(25,1,'Ubuntu 8.10',NULL,NULL,'ubuntu-8.10-','ubuntu-8.10-'),(14,1,'10Gb',10000000,10010000,NULL,NULL),(15,1,'20Gb',20000000,20010000,NULL,NULL),(16,1,'50Gb',50000000,50010000,NULL,NULL),(17,1,'100Gb',100000000,100010000,NULL,NULL),(18,1,'64Mb',64,64,NULL,NULL),(19,1,'128Mb',128,128,NULL,NULL),(20,1,'512Mb',512,512,NULL,NULL),(21,1,'1024Mb',1024,1024,NULL,NULL),(65,1,'200Gb',209715200,209715200,NULL,NULL),(31,1,'Debian 5.0 Lenny',0,0,'debian-5.0-','debian-5.0-'),(32,1,'Debian 4.0 Etch',0,0,'debian-4.0-','debian-4.0-'),(33,1,'32-bit',NULL,32,NULL,NULL),(34,1,'64-bit',NULL,64,NULL,NULL),(35,1,'reboot/reinstall',NULL,NULL,NULL,NULL),(36,1,'Managed System',NULL,NULL,NULL,NULL),(37,1,'500Mb',500000,510000,NULL,NULL),(38,1,'1Gb',1000000,1010000,NULL,NULL),(39,1,'5Gb',5000000,5010000,NULL,NULL),(40,1,'768Mb',768,768,NULL,NULL),(42,1,'2048Mb',2048,2048,'',NULL),(43,1,'256Mb',256,256,NULL,NULL),(50,1,'Slackware 12.0',0,NULL,'slackware-12.0-',NULL),(51,1,'Ubuntu 9.10',0,0,'ubuntu-9.10-','ubuntu-9.10-'),(52,1,'SuSe 10.3',0,0,'suse-10.3-','suse-10.3-'),(53,1,'SuSe 11.1',0,0,'suse-11.1-','suse-11.1-'),(54,1,'1Gb/month',1073741824,NULL,NULL,NULL),(55,1,'5Gb/month',5368709120,NULL,NULL,NULL),(56,1,'10Gb/month',10737418240,NULL,NULL,NULL),(57,1,'20Gb/month',21474836480,NULL,NULL,NULL),(58,1,'50Gb/month',53687091200,NULL,NULL,NULL),(59,1,'100Gb/month',107374182400,NULL,NULL,NULL),(60,1,'Unlimited',999999999999999999,NULL,NULL,NULL),(61,1,'Centos 4',NULL,NULL,'4-',NULL),(62,1,'Centos 5',NULL,NULL,'5-',NULL),(63,1,'Debian 4 Etch',NULL,NULL,NULL,NULL),(64,1,'Debian 5 Lenny',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `products_options_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options_values_to_products_options`
--

DROP TABLE IF EXISTS `products_options_values_to_products_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_id` int(11) NOT NULL,
  `products_options_values_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_options_values_to_products_options`
--

LOCK TABLES `products_options_values_to_products_options` WRITE;
/*!40000 ALTER TABLE `products_options_values_to_products_options` DISABLE KEYS */;
INSERT INTO `products_options_values_to_products_options` VALUES (1,4,1),(2,4,2),(3,4,3),(4,4,4),(24,7,24),(25,7,25),(26,7,26),(14,6,14),(15,6,15),(16,6,16),(17,6,17),(18,4,18),(19,4,19),(20,4,20),(21,4,21),(31,7,31),(32,7,32),(33,9,33),(34,9,34),(35,10,35),(36,10,36),(37,6,37),(38,6,38),(39,6,39),(40,4,40),(41,4,41),(42,4,42),(43,4,43),(44,7,44),(45,7,45),(46,7,46),(47,7,47),(48,7,48),(49,7,49),(50,7,50),(51,7,51),(52,7,52),(53,7,53),(54,11,54),(55,11,55),(56,11,56),(57,11,57),(58,11,58),(59,11,59),(60,11,60),(66,7,62),(62,9,62),(69,6,65),(65,7,61),(67,7,63),(68,7,64);
/*!40000 ALTER TABLE `products_options_values_to_products_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_to_categories`
--

DROP TABLE IF EXISTS `products_to_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_to_categories` (
  `products_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_to_categories`
--

LOCK TABLES `products_to_categories` WRITE;
/*!40000 ALTER TABLE `products_to_categories` DISABLE KEYS */;
INSERT INTO `products_to_categories` VALUES (29,23),(30,22),(33,21),(34,32),(36,28),(38,30),(39,27),(40,31),(41,24),(43,28),(44,28),(45,26),(51,35),(52,24),(53,24),(54,24),(55,22),(56,22),(57,22),(58,26),(59,26),(60,26),(61,27),(62,27),(63,27),(64,23),(65,23),(66,23),(67,32);
/*!40000 ALTER TABLE `products_to_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `reviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `customers_name` varchar(64) NOT NULL,
  `reviews_rating` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reviews_read` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`reviews_id`),
  KEY `idx_reviews_products_id` (`products_id`),
  KEY `idx_reviews_customers_id` (`customers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_description`
--

DROP TABLE IF EXISTS `reviews_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews_description` (
  `reviews_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `reviews_text` text NOT NULL,
  PRIMARY KEY (`reviews_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_description`
--

LOCK TABLES `reviews_description` WRITE;
/*!40000 ALTER TABLE `reviews_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `sesskey` varchar(32) NOT NULL,
  `expiry` int(11) unsigned NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`sesskey`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('2rqlkukj7c45mg4tumnduljei6',1293370702,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('m7a64javbgvu9ppru570bs9ka5',1293370774,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('l9mcho226svvgh14vrnp8jhfe0',1293371826,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('4vksev4vhubu4u0tult6ep60i6',1293371897,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('e3uc8acbu10hqijajf4vs4vm62',1293371916,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('p5f97upj1eo9lim2puh5233cp2',1293372006,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('6ffgmbklhrdflhm9njflp1j9m7',1293372034,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('2ea2jokm5uo1hi4vduf57hba51',1293372072,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('qam75eb58ci2jlkqjts31mk0p2',1293372231,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('7utl395ipbe2lgcojm2qvil5t7',1293372202,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('omkh7upngsb2k1trhve13llf00',1293373702,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('0esc0nld57mui9rauasnaqudt7',1293375202,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('g38q84co11k88lifsuo92d3nf4',1293375462,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('503b8p38ka5onlnnatn18gvkq6',1293376702,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('30j1v7kg3q7cm09d41294gh2f6',1293376724,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('gnu36elqhjs5kua425jmudj296',1293378202,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('uibr86efsatjg29dpmdlvevpm2',1293379517,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('nctr5ljb2dbe6s1i1nbk7hhv27',1293379702,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('2dvlabulf2os6rnhbfkkgq8k66',1293380460,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('9jug9fnu9f6ikes3p8n0d0opc6',1293380519,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('jhvod6en5p1kmvpvtf4lhtjd97',1293380551,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('3g4if9tr7b29gmgg0l2idqkqb0',1293380606,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('5voj4m9n7vt35kvsfhiqgsama4',1293380772,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('59ehu9cuh44ufnhpf8gujvbl70',1293380831,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('a5qmsnvi4ktst7oisaop9oogf2',1293380933,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('da1rmjnraidvcl6t8n06brmid3',1293380934,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('qha3r87g3pg9u9es2k7s9eqmr0',1293381202,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('h4lqsqogfscun904v1h3ch7pl0',1293382702,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('aieu04vlclgblrfu2hu9jgtso0',1293382919,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('gagsujvmj4m18lect04iovf2b0',1293383481,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('45ecvgias9kemm793vqsbe1h41',1293384202,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('139u105c6kalemd9fe1rcotso4',1293384787,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('reib8nd2hthvn8t7cslfkaojl2',1293385869,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('t6v7njsk0bu1n52dsthav0ar45',1293385415,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('9jt61o9nl5p3mjtjr73ddttd87',1293385443,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('vre3n67dhjikfb2ug2h78tg7b1',1293385933,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('70q1jim6jbe66h1ocp3b8gfg66',1293385681,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('cbeihu0g5db7i9ugnmseop29b7',1293385702,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('thf6l0mk29cpqe8ejopihurng6',1293386208,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('hdpjk1shguaug8ruuquho5toq5',1293368958,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('ufvuq6ckqlgrenqtebhb3b21s0',1293367702,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('pv400si7m8e8di0shnm1gd9u52',1293368684,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('gtjka0qeep0iu0gb29nt58bi60',1293368683,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('g1pstt8fq6p69pg8kn7rph0et2',1293368706,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('3g7qce6r37v51aqur2vuknial5',1293369202,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('2qh0s8rb4n8nc05a3cb8tv5591',1293375212,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('3b72l5cbco3tglj9kv50t9a7m7',1293369039,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('4lvfb0qbs90fftds7vsith9mm5',1293388793,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('v6sc0r3nuga923mk2safug7hf6',1293388845,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('rrb44na9vktg2nk7vaeb5okei6',1293388882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('l9f7330fqtubpo96tgbqgjctb4',1293481738,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:4:{s:34:\"30{9}34{11}58{6}16{4}21{10}35{7}32\";a:2:{s:3:\"qty\";s:1:\"1\";s:10:\"attributes\";a:6:{i:9;s:2:\"34\";i:11;s:2:\"58\";i:6;s:2:\"16\";i:4;s:2:\"21\";i:10;s:2:\"35\";i:7;s:2:\"32\";}}s:12:\"52{9}33{7}61\";a:2:{s:3:\"qty\";s:1:\"1\";s:10:\"attributes\";a:2:{i:9;s:2:\"33\";i:7;s:2:\"61\";}}s:34:\"39{9}33{11}54{6}38{4}19{10}35{7}50\";a:2:{s:3:\"qty\";s:1:\"1\";s:10:\"attributes\";a:6:{i:9;s:2:\"33\";i:11;s:2:\"54\";i:6;s:2:\"38\";i:4;s:2:\"19\";i:10;s:2:\"35\";i:7;s:2:\"50\";}}s:34:\"30{9}34{11}58{6}17{4}42{10}35{7}31\";a:2:{s:3:\"qty\";s:1:\"1\";s:10:\"attributes\";a:6:{i:9;s:2:\"34\";i:11;s:2:\"58\";i:6;s:2:\"17\";i:4;s:2:\"42\";i:10;s:2:\"35\";i:7;s:2:\"31\";}}}s:5:\"total\";d:73;s:6:\"weight\";d:0;s:6:\"cartID\";N;s:12:\"content_type\";s:8:\"physical\";}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}new_products_id_in_cart|s:2:\"30\";customer_id|s:1:\"8\";customer_default_address_id|s:1:\"8\";customer_first_name|s:4:\"Amro\";customer_country_id|s:3:\"222\";customer_zone_id|s:1:\"0\";sendto|s:1:\"8\";cartID|N;comments|N;shipping|b:0;billto|s:1:\"8\";payment|s:14:\"paypal_express\";'),('h6e7p8tp7bpcn1m8hildhr4o33',1293390292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('ojnicfhk6odkijvchn5rd1dmv3',1293390382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('ak4hfc9u5c8148hsrsn8a0ens3',1293391792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('eqjri57f862a2gckpbo1jg2t95',1293391882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('b83knu8mfbe0qda3u6i5hqnm62',1293393292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('29nc3r4jj10g1phsnukan094v2',1293393382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('373v7cpdl37teoop1o5pudqjr1',1293394025,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('k17mug0lv633ovp1ke2l2p57c6',1293394792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('gtev4qhobfsfjd964q954g6rj4',1293394882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('2cjtmqhvb3jum9ul2b5u1or496',1293459802,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('qn5vgon4op5k74aah5ig9obsr3',1293477382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('v0o1p8q5gokbr4hth65qou34h4',1293398423,'language|s:7:\"english\";languages_id|s:1:\"1\";selected_box|s:7:\"catalog\";admin|a:2:{s:2:\"id\";s:1:\"1\";s:8:\"username\";s:5:\"adiab\";}'),('feta88l5gfc9qppg0h0801tbs4',1293396292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('bj9ss5giekuu78temtnjukros5',1293396382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('ep0q06ce3kb3r1o2n8en147136',1293397792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('v48qch0ka4mitkor0qli30bid5',1293397882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('43camh2797hr9gq085g1944g27',1293399292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('e6vhluau75he9v2bh5pdvfc3e4',1293399382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('eqre0ej78omfb6mfgcbi85r2t4',1293400792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('meunclsa963gnci7t5m1tovv36',1293400882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('cnai87kp7vuriigkjv6fn1cko1',1293402292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('s5gk9q9asuhil3tujjr08q36l3',1293402382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('4irqnvg0bspb3n8fc9ql10cmr6',1293403792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('4r512p13g1c7mj1udas9mffnr0',1293403882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('37p4bd10nf3se3aimkild1qph6',1293405292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('vmp9psrhovhn31fs6svm8bqlj4',1293405382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('sp5c3hplvisju0fanrun3f5g12',1293406792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('ek51nn7k8hv6p1q9bmq4q0km42',1293406882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('34mse4t8a1j2eaa6mgga2o34g7',1293408292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('ed6fog9dkc5rmh2p8grkf2nse0',1293408382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('cecuk2p1tptub37j5lejsl6q34',1293409792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('8v1vjegqlffacn21sq5dltcm26',1293409882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('i79i4qtveaubgb832nu091oti0',1293411292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('0amibsj3hjl47jj10ejnb77ir2',1293411382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('5vntfettpbfc9gf8kh7is3nb55',1293412792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('1cjv7g1foletgabkb39ng0u3c7',1293412882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('gbsp4c51l5a74r0ssvj3sdnt81',1293414292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('o4vsq79084m7si1k2h7qdedfa3',1293414382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('p1k25i6a175hbhlvfj96tndi93',1293415792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('rh0cvepec7ab9carptg2once47',1293415882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('98cc9du6m0sh86gf7k4q4tjuq3',1293417292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('fnk85d34upro4rd9c4mjtpdu14',1293417382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('f3b8sgdtoalse47u1nh6g5brq3',1293418792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('g8ie3isjootrcncd5fo6jl6m24',1293418882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('445m1j7q0ro6f1liqpduq8gs65',1293420292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('uanue3irjpre223ugfe90btsv0',1293420382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('68tvs9svmuqp1l2kqoem62i6v1',1293421792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('7t5ohib9mfsc77p77nhfijeal4',1293421882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('cb58bv5vi3kp2mp668n6qhd003',1293423292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('t6cptqhnngn9gr4dcf5sga37g3',1293423382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('t5rf1tntr72di2ro6d050air41',1293424792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('8ufni97fg07jcmrkof08ul5ko1',1293424882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('thit346tvujp95fk52unm8e046',1293426292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('ojqjdoiec3ao0l0ma191vnvgp1',1293426382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('3dk908e35teunlr4lsfsljupj7',1293427792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('n43d9d4muka6mf3b62i7k3gji2',1293427882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('d4nnfmtucpik34129k67aa5ld1',1293429292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('i1otksjk6bmtqhc8eg4n6ppum5',1293429382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('7r9cb1o1gae6ifgdj36ggkb321',1293430792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('s77erh2br69lgbfo4m5jsnqv00',1293430882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('quti8h5mhj3citgfpdpq7ij7c1',1293432292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('ou8fh1is6j4al52dubti49sli0',1293432382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('04lg5n4qkb2jlpk1ltu3oorj64',1293433792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('41i1p66ganom4mrmvu8p9m3d73',1293433882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('uki1fe7c0flrfrmo55grvh2p87',1293435292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('gjvkpp8ram712l4eahvgegccd0',1293435382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('t5m4066kcvfkcdd29bf0j0q927',1293436792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('heb70q50anjp12q1jmup1ttot2',1293436882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('e3b5df9cd4s8eceq4gnk5hba83',1293438292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('bqfvnc30h7lhmbfkp6vkcbrjr7',1293438382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('5rnmoa55stu67vhktoisi14rj5',1293439792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('bkndhh3s19qq9u1ataro1pr157',1293439882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('6hoom92trlgibitud6sqls5cg5',1293441292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('uocle4vdqlge4kacq4l9qiqrc3',1293441382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('03i6do7r6d4hqscea5729tp9i7',1293442792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('a2ejhh7f9lluvasucf2de0h4p1',1293442882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('hilo74ocpgkvkooccib8a73f31',1293444292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('3deedhsfinqqeegr0k92hg7qr7',1293444382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('7ouomg8htg91bh74uhjls1svf1',1293445792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('1gf6n3rdke80de6fnoqu8hg375',1293445882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('rh2p9en4c6ju6tl2q1q04e3mt5',1293447292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('o0n4jj0dhukqc1mhb609hvroo4',1293447382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('kdtfr9t9878rme5v7mqv99fgk3',1293448792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('etniknjnq8i3gb93cjt84afc81',1293448882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('q8dmcsr36vspc62qq68rsq4i17',1293450292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('q4kft3sht4l6lp0vtbh1vg4u80',1293450382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('dv6ohvcicts8459qapjoo1pr36',1293451792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('5gadg2cal9cbmqq6c9pljpbpk7',1293451882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('ta8k36lk8t9q3660cj2shtva96',1293453292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('8pvtift0ihtbtm6r9resd4cmj2',1293453382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('dis65pq48t2eotm9tp568jb997',1293454792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('kfhpr6jeg0ru5nr7fvmpr299d6',1293454882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('1b3tbd3l4fp5rp9r9n6lvioo55',1293456292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('30ae9frvmq0ollcmvshjpa7up4',1293456382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('7a0r2pkc2uivavakqgr8j8nv50',1293457792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('dc4lbj3p1c12lgaunfb43bt0a0',1293457882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('q5kck3tpcs3g2v3sc3743ccnq0',1293459292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('c4n40q9u8elpcibbigsqfl0ii7',1293459382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('oobblsb40psr4so66v43p7jmv0',1293459675,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:2:{s:34:\"30{9}34{11}58{6}16{4}21{10}35{7}32\";a:2:{s:3:\"qty\";s:1:\"1\";s:10:\"attributes\";a:6:{i:9;s:2:\"34\";i:11;s:2:\"58\";i:6;s:2:\"16\";i:4;s:2:\"21\";i:10;s:2:\"35\";i:7;s:2:\"32\";}}s:12:\"52{9}33{7}61\";a:2:{s:3:\"qty\";s:1:\"1\";s:10:\"attributes\";a:2:{i:9;s:2:\"33\";i:7;s:2:\"61\";}}}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}customer_id|s:1:\"8\";customer_default_address_id|s:1:\"8\";customer_first_name|s:4:\"Amro\";customer_country_id|s:3:\"222\";customer_zone_id|s:1:\"0\";'),('pu0c1lba6ub8mqobssgaovlb10',1293459530,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('ts2b3ld3kha4udbrejaecsl1s6',1293480995,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('i9ijpqskaf1cfvtgug8mc0bc83',1293476856,'language|s:7:\"english\";languages_id|s:1:\"1\";selected_box|s:7:\"catalog\";admin|a:2:{s:2:\"id\";s:1:\"1\";s:8:\"username\";s:5:\"adiab\";}'),('ahp79n03n6ja0qrd16h59enn62',1293477292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('t7msve16abglit1sv5g82etoq1',1293460174,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:2:{s:12:\"58{9}34{7}47\";a:2:{s:3:\"qty\";i:1;s:10:\"attributes\";a:2:{i:9;s:2:\"34\";i:7;s:2:\"47\";}}s:34:\"45{9}34{11}56{6}65{4}42{10}35{7}47\";a:2:{s:3:\"qty\";i:1;s:10:\"attributes\";a:6:{i:9;s:2:\"34\";i:11;s:2:\"56\";i:6;s:2:\"65\";i:4;s:2:\"42\";i:10;s:2:\"35\";i:7;s:2:\"47\";}}}s:5:\"total\";d:58;s:6:\"weight\";d:18;s:6:\"cartID\";s:5:\"18605\";s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:4:{s:4:\"page\";s:21:\"checkout_shipping.php\";s:4:\"mode\";s:3:\"SSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}}new_products_id_in_cart|s:2:\"45\";'),('nd1kd9i760mhgrlitieqsdcrp6',1293459990,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('2vb5sfk7u6l1tddp6f58tp0ue2',1293460377,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('2pmuhhromj01kkn378c0dmu8u3',1293460492,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('riqmqvmua533br3m989ch3d9d0',1293460082,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('j2ui2ms6tmt1afbn8pe222s426',1293460161,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('ihcuvma9o4asnbu8vcpfthonl7',1293460154,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('i5lvpglh7js6flcjef9i57hho7',1293460275,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('lrgapkae7hu66lm2kc4blocf81',1293460203,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('1dedbav08d966179kv9enaqh90',1293460203,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('2moshuhuihlqtm160itp45psj3',1293460204,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('dtludlio3n1430jhbj034jnti4',1293460205,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('1v47k7672p8qsac2o67hk3agd5',1293460206,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('dli1am6ns80iijdon8ddh856k2',1293460267,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('bns5dmggbakn6qalokqp6gog55',1293460792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('tt0a6rcnssvtkt7f62aad1q132',1293460882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('qg5rufma095574uvpuimnpgmd7',1293461030,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('q3lpqo0at21auf48o8orfia144',1293462292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('e2kvjnmi7iohui9g9to1382h24',1293462382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('nfoojm00hbede0ud4un7h46rl2',1293463792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('uh2niphc0va06vbv8gestsavr7',1293463882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('tg5c9r8462629i2vutortbcb26',1293465292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('q6ujhklngr841roudpgftcs8a0',1293465382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('iq8b9eagmj00gktfpg2rcu9gm1',1293466792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('113eaapl88dv1gm7qkhbsmscf6',1293466882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('vu5uhndolde348dfi876bt3m21',1293468292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('jodmj9dppfi3n8cmjcoqiqhu42',1293468382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('engp2nl2ump2025eld4ifsei45',1293469792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('04g95kc4suje2dt7h8cce6mej2',1293469882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('b4opak6fhjo6tcr56jg4o0roq6',1293471292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('ros3r45rvqm05bhv4elftav1g6',1293471382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('i4dug2pjqj6v529sagublseb56',1293472792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('95m2qdi88vnoip07me93dgsfq6',1293472882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('h4bp0si8meaa6imkcu71maqvq5',1293474292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('es3manf67qpc6ma6dq2m1u37q2',1293474382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('4as211o6iavsqs93cblvvqohe6',1293475792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('bb1pnctaoe95tv378jd1bpiru5',1293475882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('1a9hrrrpjcq25cdkp7kd25d7k3',1293478792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('nrgts4ppumrl87jqhq4uqeb4s3',1293478882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('khj32teh3btic875m92nhb7ej4',1293480292,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('vib4ub53ma50k66k0372ed0ed5',1293480382,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('6jmdmmno5icdbg896jsghu4ih7',1293481792,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}'),('015fuajv4c29hcsepm5rv8l9o6',1293481882,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"GBP\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:0:{}s:8:\"snapshot\";a:0:{}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specials`
--

DROP TABLE IF EXISTS `specials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specials` (
  `specials_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `specials_new_products_price` decimal(15,4) NOT NULL,
  `specials_date_added` datetime DEFAULT NULL,
  `specials_last_modified` datetime DEFAULT NULL,
  `expires_date` datetime DEFAULT NULL,
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`specials_id`),
  KEY `idx_specials_products_id` (`products_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specials`
--

LOCK TABLES `specials` WRITE;
/*!40000 ALTER TABLE `specials` DISABLE KEYS */;
/*!40000 ALTER TABLE `specials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_title` varchar(32) NOT NULL,
  `tax_class_description` varchar(255) NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_class`
--

LOCK TABLES `tax_class` WRITE;
/*!40000 ALTER TABLE `tax_class` DISABLE KEYS */;
INSERT INTO `tax_class` VALUES (1,'Taxable Goods','The following types of products are included non-food, services, etc','2010-01-03 12:56:15','2010-01-02 12:26:44');
/*!40000 ALTER TABLE `tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_rates` (
  `tax_rates_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_priority` int(5) DEFAULT '1',
  `tax_rate` decimal(7,4) NOT NULL,
  `tax_description` varchar(255) NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`tax_rates_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
INSERT INTO `tax_rates` VALUES (1,2,1,1,17.5000,'FL TAX 17.5%','2010-01-03 12:56:40','2010-01-02 12:26:44');
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whos_online`
--

DROP TABLE IF EXISTS `whos_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whos_online` (
  `customer_id` int(11) DEFAULT NULL,
  `full_name` varchar(64) NOT NULL,
  `session_id` varchar(128) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `time_entry` varchar(14) NOT NULL,
  `time_last_click` varchar(14) NOT NULL,
  `last_page_url` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whos_online`
--

LOCK TABLES `whos_online` WRITE;
/*!40000 ALTER TABLE `whos_online` DISABLE KEYS */;
INSERT INTO `whos_online` VALUES (0,'Guest','ts2b3ld3kha4udbrejaecsl1s6','94.193.213.100','1293479554','1293479554','/'),(8,'Amro Diab','l9f7330fqtubpo96tgbqgjctb4','94.193.213.100','1293479220','1293480298','/shopping_cart.php?token=EC-59X89865F3870852Y'),(0,'Guest','6jmdmmno5icdbg896jsghu4ih7','78.46.195.28','1293480352','1293480352','/'),(0,'Guest','015fuajv4c29hcsepm5rv8l9o6','78.46.195.28','1293480442','1293480442','/');
/*!40000 ALTER TABLE `whos_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL,
  `zone_code` varchar(32) NOT NULL,
  `zone_name` varchar(32) NOT NULL,
  PRIMARY KEY (`zone_id`),
  KEY `idx_zones_country_id` (`zone_country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` VALUES (1,223,'AL','Alabama'),(2,223,'AK','Alaska'),(3,223,'AS','American Samoa'),(4,223,'AZ','Arizona'),(5,223,'AR','Arkansas'),(6,223,'AF','Armed Forces Africa'),(7,223,'AA','Armed Forces Americas'),(8,223,'AC','Armed Forces Canada'),(9,223,'AE','Armed Forces Europe'),(10,223,'AM','Armed Forces Middle East'),(11,223,'AP','Armed Forces Pacific'),(12,223,'CA','California'),(13,223,'CO','Colorado'),(14,223,'CT','Connecticut'),(15,223,'DE','Delaware'),(16,223,'DC','District of Columbia'),(17,223,'FM','Federated States Of Micronesia'),(18,223,'FL','Florida'),(19,223,'GA','Georgia'),(20,223,'GU','Guam'),(21,223,'HI','Hawaii'),(22,223,'ID','Idaho'),(23,223,'IL','Illinois'),(24,223,'IN','Indiana'),(25,223,'IA','Iowa'),(26,223,'KS','Kansas'),(27,223,'KY','Kentucky'),(28,223,'LA','Louisiana'),(29,223,'ME','Maine'),(30,223,'MH','Marshall Islands'),(31,223,'MD','Maryland'),(32,223,'MA','Massachusetts'),(33,223,'MI','Michigan'),(34,223,'MN','Minnesota'),(35,223,'MS','Mississippi'),(36,223,'MO','Missouri'),(37,223,'MT','Montana'),(38,223,'NE','Nebraska'),(39,223,'NV','Nevada'),(40,223,'NH','New Hampshire'),(41,223,'NJ','New Jersey'),(42,223,'NM','New Mexico'),(43,223,'NY','New York'),(44,223,'NC','North Carolina'),(45,223,'ND','North Dakota'),(46,223,'MP','Northern Mariana Islands'),(47,223,'OH','Ohio'),(48,223,'OK','Oklahoma'),(49,223,'OR','Oregon'),(50,223,'PW','Palau'),(51,223,'PA','Pennsylvania'),(52,223,'PR','Puerto Rico'),(53,223,'RI','Rhode Island'),(54,223,'SC','South Carolina'),(55,223,'SD','South Dakota'),(56,223,'TN','Tennessee'),(57,223,'TX','Texas'),(58,223,'UT','Utah'),(59,223,'VT','Vermont'),(60,223,'VI','Virgin Islands'),(61,223,'VA','Virginia'),(62,223,'WA','Washington'),(63,223,'WV','West Virginia'),(64,223,'WI','Wisconsin'),(65,223,'WY','Wyoming'),(66,38,'AB','Alberta'),(67,38,'BC','British Columbia'),(68,38,'MB','Manitoba'),(69,38,'NF','Newfoundland'),(70,38,'NB','New Brunswick'),(71,38,'NS','Nova Scotia'),(72,38,'NT','Northwest Territories'),(73,38,'NU','Nunavut'),(74,38,'ON','Ontario'),(75,38,'PE','Prince Edward Island'),(76,38,'QC','Quebec'),(77,38,'SK','Saskatchewan'),(78,38,'YT','Yukon Territory'),(79,81,'NDS','Niedersachsen'),(80,81,'BAW','Baden-Württemberg'),(81,81,'BAY','Bayern'),(82,81,'BER','Berlin'),(83,81,'BRG','Brandenburg'),(84,81,'BRE','Bremen'),(85,81,'HAM','Hamburg'),(86,81,'HES','Hessen'),(87,81,'MEC','Mecklenburg-Vorpommern'),(88,81,'NRW','Nordrhein-Westfalen'),(89,81,'RHE','Rheinland-Pfalz'),(90,81,'SAR','Saarland'),(91,81,'SAS','Sachsen'),(92,81,'SAC','Sachsen-Anhalt'),(93,81,'SCN','Schleswig-Holstein'),(94,81,'THE','Thüringen'),(95,14,'WI','Wien'),(96,14,'NO','Niederösterreich'),(97,14,'OO','Oberösterreich'),(98,14,'SB','Salzburg'),(99,14,'KN','Kärnten'),(100,14,'ST','Steiermark'),(101,14,'TI','Tirol'),(102,14,'BL','Burgenland'),(103,14,'VB','Voralberg'),(104,204,'AG','Aargau'),(105,204,'AI','Appenzell Innerrhoden'),(106,204,'AR','Appenzell Ausserrhoden'),(107,204,'BE','Bern'),(108,204,'BL','Basel-Landschaft'),(109,204,'BS','Basel-Stadt'),(110,204,'FR','Freiburg'),(111,204,'GE','Genf'),(112,204,'GL','Glarus'),(113,204,'JU','Graubünden'),(114,204,'JU','Jura'),(115,204,'LU','Luzern'),(116,204,'NE','Neuenburg'),(117,204,'NW','Nidwalden'),(118,204,'OW','Obwalden'),(119,204,'SG','St. Gallen'),(120,204,'SH','Schaffhausen'),(121,204,'SO','Solothurn'),(122,204,'SZ','Schwyz'),(123,204,'TG','Thurgau'),(124,204,'TI','Tessin'),(125,204,'UR','Uri'),(126,204,'VD','Waadt'),(127,204,'VS','Wallis'),(128,204,'ZG','Zug'),(129,204,'ZH','Zürich'),(130,195,'A Coruña','A Coruña'),(131,195,'Alava','Alava'),(132,195,'Albacete','Albacete'),(133,195,'Alicante','Alicante'),(134,195,'Almeria','Almeria'),(135,195,'Asturias','Asturias'),(136,195,'Avila','Avila'),(137,195,'Badajoz','Badajoz'),(138,195,'Baleares','Baleares'),(139,195,'Barcelona','Barcelona'),(140,195,'Burgos','Burgos'),(141,195,'Caceres','Caceres'),(142,195,'Cadiz','Cadiz'),(143,195,'Cantabria','Cantabria'),(144,195,'Castellon','Castellon'),(145,195,'Ceuta','Ceuta'),(146,195,'Ciudad Real','Ciudad Real'),(147,195,'Cordoba','Cordoba'),(148,195,'Cuenca','Cuenca'),(149,195,'Girona','Girona'),(150,195,'Granada','Granada'),(151,195,'Guadalajara','Guadalajara'),(152,195,'Guipuzcoa','Guipuzcoa'),(153,195,'Huelva','Huelva'),(154,195,'Huesca','Huesca'),(155,195,'Jaen','Jaen'),(156,195,'La Rioja','La Rioja'),(157,195,'Las Palmas','Las Palmas'),(158,195,'Leon','Leon'),(159,195,'Lleida','Lleida'),(160,195,'Lugo','Lugo'),(161,195,'Madrid','Madrid'),(162,195,'Malaga','Malaga'),(163,195,'Melilla','Melilla'),(164,195,'Murcia','Murcia'),(165,195,'Navarra','Navarra'),(166,195,'Ourense','Ourense'),(167,195,'Palencia','Palencia'),(168,195,'Pontevedra','Pontevedra'),(169,195,'Salamanca','Salamanca'),(170,195,'Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,195,'Segovia','Segovia'),(172,195,'Sevilla','Sevilla'),(173,195,'Soria','Soria'),(174,195,'Tarragona','Tarragona'),(175,195,'Teruel','Teruel'),(176,195,'Toledo','Toledo'),(177,195,'Valencia','Valencia'),(178,195,'Valladolid','Valladolid'),(179,195,'Vizcaya','Vizcaya'),(180,195,'Zamora','Zamora'),(181,195,'Zaragoza','Zaragoza');
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones_to_geo_zones`
--

DROP TABLE IF EXISTS `zones_to_geo_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones_to_geo_zones` (
  `association_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `geo_zone_id` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`association_id`),
  KEY `idx_zones_to_geo_zones_country_id` (`zone_country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones_to_geo_zones`
--

LOCK TABLES `zones_to_geo_zones` WRITE;
/*!40000 ALTER TABLE `zones_to_geo_zones` DISABLE KEYS */;
/*!40000 ALTER TABLE `zones_to_geo_zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-30 23:03:31
