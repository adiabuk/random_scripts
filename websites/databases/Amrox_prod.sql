-- MySQL dump 10.13  Distrib 5.7.11-4, for Linux (x86_64)
--
-- Host: localhost    Database: amrox
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
-- Table structure for table `arch`
--

DROP TABLE IF EXISTS `arch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arch` (
  `arch_id` int(11) DEFAULT NULL,
  `arch` varchar(64) DEFAULT NULL,
  `arch_hrid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arch`
--

LOCK TABLES `arch` WRITE;
/*!40000 ALTER TABLE `arch` DISABLE KEYS */;
/*!40000 ALTER TABLE `arch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup`
--

DROP TABLE IF EXISTS `backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `server` varchar(30) DEFAULT NULL,
  `purpose` varchar(30) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=338 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup`
--

LOCK TABLES `backup` WRITE;
/*!40000 ALTER TABLE `backup` DISABLE KEYS */;
INSERT INTO `backup` VALUES (1,'everything working except shopping_cart prices, waiting for RAC dude to start work','2010-04-12 15:08:11','avsweb01','web','/var/amrox/backups/avsweb01-web-1204101107.tar.gz'),(2,'RAC dude finished work, now all working in Firefox, need to test in others','2010-04-12 22:12:01','avsweb01','web','/var/amrox/backups/avsweb01-web-1204101810.tar.gz'),(3,'Updated Prod to prod level, all working except Internet Explorer, being worked on by RAC-GamaSoftwar','2010-04-13 20:19:21','avpweb01','web','/var/amrox/backups/avpweb01-web-1304101617.tar.gz'),(4,'test','2010-04-14 17:50:37','avsweb01','configs','/var/amrox/backups/--.tar.gz'),(5,'test','2010-04-14 17:51:35','avsweb01','configs','/var/amrox/backups/--.tar.gz'),(6,'backup before removing prod/prod subdirs and editing config','2010-04-14 17:56:17','avsweb01','','/var/amrox/backups/--1404101355.tar.gz'),(7,'','2010-04-14 19:19:35','avpsql01','','/var/amrox/backups/--1404101919.tar.gz'),(8,'All database tables #1','2010-04-14 19:19:58','avpsql01','','/var/amrox/backups/--1404101919.tar.gz'),(9,'Routine','2010-04-20 01:57:45','avpsql01','','/var/amrox/backups/--2004100157.tar.gz'),(10,'test','2010-04-21 19:54:42','avpsql01','','/var/amrox/backups/--2104101954.tar.gz'),(11,'test2','2010-04-21 19:57:02','avpsql01','sql','/var/amrox/backups/--2104101956.tar.gz'),(12,'test3','2010-04-21 19:58:33','avpsql01','sql','/var/amrox/backups/-sql-2104101958.tar.gz'),(13,'test4','2010-04-21 20:00:02','avpsql01','sql','/var/amrox/backups/-sql-2104101959.tar.gz'),(14,'test5','2010-04-21 20:01:27','avpsql01','sql','/var/amrox/backups/avpsql01-sql-2104102001.tar.gz'),(15,'crontab stag/prod','2010-04-22 00:04:17','svr-sql-001','configs','/var/amrox/backups/svr-sql-001-configs-2104102004.'),(16,'crontab changes','2010-04-22 00:05:31','svr-sql-001','etc','/var/amrox/backups/svr-sql-001-etc-2104102005.tar.'),(17,'Working backup before new release','2010-05-05 17:26:14','avpweb01','web-www.amroxonline.com','/var/amrox/backups/avpweb01-web-www.amroxonline.com-0505101326.tar.gz'),(18,'routine','2010-05-06 14:02:23','avpsql01','sql','/var/amrox/backups/avpsql01-sql-0605101402.tar.gz'),(19,'Added Q&A table in stag, about to update in prod','2010-05-14 19:49:00','avpsql01','sql','/var/amrox/backups/avpsql01-sql-1405101948.tar.gz'),(20,'Corrected customer view in Amrox_stag/prod','2010-05-15 22:24:58','avpsql01','sql','/var/amrox/backups/avpsql01-sql-1505102224.tar.gz'),(21,'Locations are correct, and menu is better','2010-05-16 15:47:02','avpweb01.amroxonline.com','web-admin.amroxonline.com','/var/amrox/backups/avpweb01.amroxonline.com-web-admin.amroxonline.com-1605101146.tar.gz'),(22,'Routine','2010-05-18 18:47:43','avpsql01','sql','/var/amrox/backups/avpsql01-sql-1805101847.tar.gz'),(23,'routine','2010-05-28 15:02:09','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2805101101.tar.gz'),(24,'Made price changes in Staging, rolling out to prod','2010-06-04 00:54:42','avpsql01','sql','/var/amrox/backups/avpsql01-sql-0406100054.tar.gz'),(25,'routine','2010-06-07 15:45:57','appovz01p','etc','/var/amrox/backups/appovz01p-etc-0706101145.tar.gz'),(26,'changed Create_VPS and email2 scripts','2010-06-07 15:46:44','appovz01p','configs','/var/amrox/backups/appovz01p-configs-0706101146.tar.gz'),(27,'routine','2010-06-07 15:49:54','avpsql01','sql','/var/amrox/backups/avpsql01-sql-0706101549.tar.gz'),(28,'Routine','2010-06-07 15:52:10','avpweb01','web-admin.amroxonline.com','/var/amrox/backups/avpweb01-web-admin.amroxonline.com-0706101151.tar.gz'),(29,'Routine','2010-06-07 15:52:30','avpweb01','web-www.amroxonline.com','/var/amrox/backups/avpweb01-web-www.amroxonline.com-0706101152.tar.gz'),(30,'Routine','2010-06-07 15:52:43','avpweb01','web-www.amroxservices.com','/var/amrox/backups/avpweb01-web-www.amroxservices.com-0706101152.tar.gz'),(31,'About to copy products_descriptions from stag to prod','2010-06-12 23:45:21','avpsql01','sql','/var/amrox/backups/avpsql01-sql-1206101944.tar.gz'),(32,'routine, before fixing notifications','2010-07-13 02:39:49','avpweb02','nagios','/var/amrox/backups/avpweb02-nagios-1207102239.tar.gz'),(33,'routine','2010-07-13 03:16:27','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1207102315.tar.gz'),(34,'routine','2010-07-23 13:46:39','avpsql01','sql','/var/amrox/backups/avpsql01-sql-2307100946.tar.gz'),(35,'Updated auto-deply script (mysql)','2010-08-05 10:56:28','appovz01p','configs','/var/amrox/backups/appovz01p-configs-0508101055.tar.gz'),(36,'Routine','2010-08-05 11:23:39','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0508101123.tar.gz'),(37,'routine','2010-08-16 14:36:10','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1608101435.tar.gz'),(38,'new staging database fom dude','2010-08-16 14:56:43','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1608101456.tar.gz'),(39,'routine','2010-08-16 15:45:53','appovz01p','etc','/var/amrox/backups/appovz01p-etc-1608101545.tar.gz'),(40,'crontab','2010-08-16 15:52:52','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1608101552.tar.gz'),(41,'crontab','2010-08-16 15:55:26','avpweb01.amroxonline.com','nagios','/var/amrox/backups/avpweb01.amroxonline.com-nagios-1608101555.tar.gz'),(42,'changes to stag by wkreaty','2010-08-17 10:00:49','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1708101000.tar.gz'),(43,'crontab','2010-08-18 00:05:02','avpweb01.amroxonline.com','nagios','/var/amrox/backups/avpweb01.amroxonline.com-nagios-1808100005.tar.gz'),(44,'','2010-08-18 00:05:11','avpweb01.amroxonline.com','pnp data','/var/amrox/backups/avpweb01.amroxonline.com-pnp data-1808100005.tar.gz'),(45,'crontab','2010-08-18 02:00:22','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1808100200.tar.gz'),(46,'crontab','2010-08-19 00:05:02','avpweb01.amroxonline.com','nagios','/var/amrox/backups/avpweb01.amroxonline.com-nagios-1908100005.tar.gz'),(47,'','2010-08-19 00:05:12','avpweb01.amroxonline.com','pnp data','/var/amrox/backups/avpweb01.amroxonline.com-pnp data-1908100005.tar.gz'),(48,'crontab','2010-08-19 02:00:23','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1908100200.tar.gz'),(49,'crontab','2010-08-20 00:05:02','avpweb01.amroxonline.com','nagios','/var/amrox/backups/avpweb01.amroxonline.com-nagios-2008100005.tar.gz'),(50,'','2010-08-20 00:05:12','avpweb01.amroxonline.com','pnp data','/var/amrox/backups/avpweb01.amroxonline.com-pnp data-2008100005.tar.gz'),(51,'crontab','2010-08-20 02:00:20','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2008100200.tar.gz'),(52,'Final update from kunle - stag','2010-08-20 15:02:05','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2008101501.tar.gz'),(53,'crontab','2010-08-21 00:05:02','avpweb01.amroxonline.com','nagios','/var/amrox/backups/avpweb01.amroxonline.com-nagios-2108100005.tar.gz'),(54,'','2010-08-21 00:05:11','avpweb01.amroxonline.com','pnp data','/var/amrox/backups/avpweb01.amroxonline.com-pnp data-2108100005.tar.gz'),(55,'crontab','2010-08-21 02:00:22','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2108100200.tar.gz'),(56,'crontab','2010-08-22 00:05:02','avpweb01.amroxonline.com','nagios','/var/amrox/backups/avpweb01.amroxonline.com-nagios-2208100005.tar.gz'),(57,'','2010-08-22 00:05:10','avpweb01.amroxonline.com','pnp data','/var/amrox/backups/avpweb01.amroxonline.com-pnp data-2208100005.tar.gz'),(58,'crontab','2010-08-22 02:00:23','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2208100200.tar.gz'),(59,'crap website','2010-08-22 21:04:42','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2208102104.tar.gz'),(60,'crontab','2010-08-23 00:05:02','avpweb01.amroxonline.com','nagios','/var/amrox/backups/avpweb01.amroxonline.com-nagios-2308100005.tar.gz'),(61,'','2010-08-23 00:05:12','avpweb01.amroxonline.com','pnp data','/var/amrox/backups/avpweb01.amroxonline.com-pnp data-2308100005.tar.gz'),(62,'crontab','2010-08-23 02:00:20','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2308100200.tar.gz'),(63,'crontab','2010-08-23 12:25:49','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2308101225.tar.gz'),(64,'crontab','2010-08-24 00:05:02','avpweb01.amroxonline.com','nagios','/var/amrox/backups/avpweb01.amroxonline.com-nagios-2408100005.tar.gz'),(65,'','2010-08-24 00:05:12','avpweb01.amroxonline.com','pnp data','/var/amrox/backups/avpweb01.amroxonline.com-pnp data-2408100005.tar.gz'),(66,'crontab','2010-08-24 02:00:17','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2408100200.tar.gz'),(67,'crontab','2010-08-24 08:32:50','avpweb01','nagios','/var/amrox/backups/avpweb01-nagios-2408100832.tar.gz'),(68,'','2010-08-24 08:32:50','avpweb01','pnp data','/var/amrox/backups/avpweb01-pnp data-2408100832.tar.gz'),(69,'crontab','2010-08-24 08:34:21','appovz01p','nagios','/var/amrox/backups/appovz01p-nagios-2408100834.tar.gz'),(70,'','2010-08-24 08:34:21','appovz01p','pnp data','/var/amrox/backups/appovz01p-pnp data-2408100834.tar.gz'),(71,'crontab','2010-08-24 08:35:16','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-2408100835.tar.gz'),(72,'','2010-08-24 08:35:25','avpweb02.amroxonline.com','pnp data','/var/amrox/backups/avpweb02.amroxonline.com-pnp data-2408100835.tar.gz'),(73,'crontab','2010-08-24 08:36:16','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-2408100836.tar.gz'),(74,'','2010-08-24 08:36:21','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-2408100836.tar.gz'),(75,'crontab','2010-08-25 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-2508100005.tar.gz'),(76,'','2010-08-25 00:05:07','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-2508100005.tar.gz'),(77,'crontab','2010-08-25 02:00:24','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2508100200.tar.gz'),(78,'crontab','2010-08-26 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-2608100005.tar.gz'),(79,'','2010-08-26 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-2608100005.tar.gz'),(80,'crontab','2010-08-26 02:00:20','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2608100200.tar.gz'),(81,'crontab','2010-08-27 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-2708100005.tar.gz'),(82,'','2010-08-27 00:05:12','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-2708100005.tar.gz'),(83,'crontab','2010-08-27 02:00:23','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2708100200.tar.gz'),(84,'crontab','2010-08-28 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2808100000.tar.gz'),(85,'crontab','2010-08-28 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-2808100005.tar.gz'),(86,'','2010-08-28 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-2808100005.tar.gz'),(87,'crontab','2010-08-28 02:00:22','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2808100200.tar.gz'),(88,'crontab','2010-08-29 00:00:16','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2908100000.tar.gz'),(89,'crontab','2010-08-29 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-2908100005.tar.gz'),(90,'','2010-08-29 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-2908100005.tar.gz'),(91,'crontab','2010-08-29 02:00:23','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2908100200.tar.gz'),(92,'crontab','2010-08-30 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-3008100000.tar.gz'),(93,'crontab','2010-08-30 00:05:03','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-3008100005.tar.gz'),(94,'','2010-08-30 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-3008100005.tar.gz'),(95,'crontab','2010-08-30 02:00:24','appovz01p','configs','/var/amrox/backups/appovz01p-configs-3008100200.tar.gz'),(96,'crontab','2010-08-31 00:00:16','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-3108100000.tar.gz'),(97,'crontab','2010-08-31 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-3108100005.tar.gz'),(98,'','2010-08-31 00:05:10','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-3108100005.tar.gz'),(99,'crontab','2010-08-31 02:00:24','appovz01p','configs','/var/amrox/backups/appovz01p-configs-3108100200.tar.gz'),(100,'About to remove category_image filed is OSC2_stag.categories','2010-08-31 12:01:04','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-3108101200.tar.gz'),(101,'crontab','2010-09-01 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0109100000.tar.gz'),(102,'crontab','2010-09-01 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-0109100005.tar.gz'),(103,'','2010-09-01 00:05:10','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-0109100005.tar.gz'),(104,'crontab','2010-09-01 02:00:21','appovz01p','configs','/var/amrox/backups/appovz01p-configs-0109100200.tar.gz'),(105,'crontab','2010-09-02 00:00:17','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0209100000.tar.gz'),(106,'crontab','2010-09-02 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-0209100005.tar.gz'),(107,'','2010-09-02 00:05:12','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-0209100005.tar.gz'),(108,'crontab','2010-09-02 02:00:21','appovz01p','configs','/var/amrox/backups/appovz01p-configs-0209100200.tar.gz'),(109,'Routine','2010-09-02 09:32:46','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0209100932.tar.gz'),(110,'crontab','2010-09-03 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0309100000.tar.gz'),(111,'crontab','2010-09-03 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-0309100005.tar.gz'),(112,'','2010-09-03 00:05:10','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-0309100005.tar.gz'),(113,'crontab','2010-09-03 02:00:22','appovz01p','configs','/var/amrox/backups/appovz01p-configs-0309100200.tar.gz'),(114,'crontab','2010-09-04 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0409100000.tar.gz'),(115,'crontab','2010-09-04 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-0409100005.tar.gz'),(116,'','2010-09-04 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-0409100005.tar.gz'),(117,'crontab','2010-09-04 02:00:21','appovz01p','configs','/var/amrox/backups/appovz01p-configs-0409100200.tar.gz'),(118,'crontab','2010-09-05 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0509100000.tar.gz'),(119,'crontab','2010-09-05 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-0509100005.tar.gz'),(120,'','2010-09-05 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-0509100005.tar.gz'),(121,'crontab','2010-09-05 02:00:23','appovz01p','configs','/var/amrox/backups/appovz01p-configs-0509100200.tar.gz'),(122,'crontab','2010-09-06 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0609100000.tar.gz'),(123,'crontab','2010-09-06 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-0609100005.tar.gz'),(124,'','2010-09-06 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-0609100005.tar.gz'),(125,'crontab','2010-09-06 02:00:22','appovz01p','configs','/var/amrox/backups/appovz01p-configs-0609100200.tar.gz'),(126,'crontab','2010-09-07 00:00:14','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0709100000.tar.gz'),(127,'crontab','2010-09-07 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-0709100005.tar.gz'),(128,'','2010-09-07 00:05:12','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-0709100005.tar.gz'),(129,'crontab','2010-09-07 02:00:20','appovz01p','configs','/var/amrox/backups/appovz01p-configs-0709100200.tar.gz'),(130,'crontab','2010-09-08 00:00:14','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0809100000.tar.gz'),(131,'crontab','2010-09-08 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-0809100005.tar.gz'),(132,'','2010-09-08 00:05:12','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-0809100005.tar.gz'),(133,'crontab','2010-09-08 02:00:23','appovz01p','configs','/var/amrox/backups/appovz01p-configs-0809100200.tar.gz'),(134,'staging paypal settings are correct','2010-09-08 16:18:12','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0809101617.tar.gz'),(135,'crontab','2010-09-09 00:00:09','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0909100000.tar.gz'),(136,'crontab','2010-09-09 00:05:01','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-0909100005.tar.gz'),(137,'','2010-09-09 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-0909100005.tar.gz'),(138,'crontab','2010-09-09 02:00:26','appovz01p','configs','/var/amrox/backups/appovz01p-configs-0909100200.tar.gz'),(139,'crontab','2010-09-10 00:00:13','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1009100000.tar.gz'),(140,'crontab','2010-09-10 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-1009100005.tar.gz'),(141,'','2010-09-10 00:05:12','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-1009100005.tar.gz'),(142,'crontab','2010-09-10 02:00:51','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1009100200.tar.gz'),(143,'crontab','2010-09-11 00:00:14','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1109100000.tar.gz'),(144,'crontab','2010-09-11 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-1109100005.tar.gz'),(145,'','2010-09-11 00:05:12','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-1109100005.tar.gz'),(146,'crontab','2010-09-11 02:00:49','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1109100200.tar.gz'),(147,'crontab','2010-09-12 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1209100000.tar.gz'),(148,'crontab','2010-09-12 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-1209100005.tar.gz'),(149,'','2010-09-12 00:05:12','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-1209100005.tar.gz'),(150,'crontab','2010-09-12 02:00:49','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1209100200.tar.gz'),(151,'crontab','2010-09-13 00:00:12','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1309100000.tar.gz'),(152,'crontab','2010-09-13 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-1309100005.tar.gz'),(153,'','2010-09-13 00:05:12','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-1309100005.tar.gz'),(154,'crontab','2010-09-13 02:00:50','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1309100200.tar.gz'),(155,'crontab','2010-09-14 00:00:12','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1409100000.tar.gz'),(156,'crontab','2010-09-14 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-1409100005.tar.gz'),(157,'','2010-09-14 00:05:12','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-1409100005.tar.gz'),(158,'crontab','2010-09-14 02:00:50','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1409100200.tar.gz'),(159,'crontab','2010-09-15 00:00:14','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1509100000.tar.gz'),(160,'crontab','2010-09-15 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-1509100005.tar.gz'),(161,'','2010-09-15 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-1509100005.tar.gz'),(162,'crontab','2010-09-15 02:00:48','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1509100200.tar.gz'),(163,'crontab','2010-09-16 00:00:13','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1609100000.tar.gz'),(164,'crontab','2010-09-16 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-1609100005.tar.gz'),(165,'','2010-09-16 00:05:12','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-1609100005.tar.gz'),(166,'crontab','2010-09-16 02:00:50','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1609100200.tar.gz'),(167,'crontab','2010-09-17 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1709100000.tar.gz'),(168,'crontab','2010-09-17 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-1709100005.tar.gz'),(169,'','2010-09-17 00:05:12','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-1709100005.tar.gz'),(170,'crontab','2010-09-17 02:00:49','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1709100200.tar.gz'),(171,'crontab','2010-09-18 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1809100000.tar.gz'),(172,'crontab','2010-09-18 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-1809100005.tar.gz'),(173,'','2010-09-18 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-1809100005.tar.gz'),(174,'crontab','2010-09-18 02:00:51','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1809100200.tar.gz'),(175,'crontab','2010-09-19 00:00:13','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1909100000.tar.gz'),(176,'crontab','2010-09-19 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-1909100005.tar.gz'),(177,'','2010-09-19 00:05:13','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-1909100005.tar.gz'),(178,'crontab','2010-09-19 02:00:52','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1909100200.tar.gz'),(179,'crontab','2010-09-20 00:00:17','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2009100000.tar.gz'),(180,'crontab','2010-09-20 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-2009100005.tar.gz'),(181,'','2010-09-20 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-2009100005.tar.gz'),(182,'crontab','2010-09-20 02:00:51','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2009100200.tar.gz'),(183,'stag payment broken,given people access','2010-09-20 19:28:24','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2009101928.tar.gz'),(184,'crontab','2010-09-21 00:00:14','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2109100000.tar.gz'),(185,'crontab','2010-09-21 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-2109100005.tar.gz'),(186,'','2010-09-21 00:05:12','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-2109100005.tar.gz'),(187,'crontab','2010-09-21 02:00:49','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2109100200.tar.gz'),(188,'crontab','2010-09-22 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2209100000.tar.gz'),(189,'crontab','2010-09-22 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-2209100005.tar.gz'),(190,'','2010-09-22 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-2209100005.tar.gz'),(191,'crontab','2010-09-22 02:00:51','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2209100200.tar.gz'),(192,'crontab','2010-09-23 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2309100000.tar.gz'),(193,'crontab','2010-09-23 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-2309100005.tar.gz'),(194,'','2010-09-23 00:05:10','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-2309100005.tar.gz'),(195,'crontab','2010-09-23 02:00:50','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2309100200.tar.gz'),(196,'crontab','2010-09-24 00:00:14','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2409100000.tar.gz'),(197,'crontab','2010-09-24 00:05:01','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-2409100005.tar.gz'),(198,'','2010-09-24 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-2409100005.tar.gz'),(199,'crontab','2010-09-24 02:00:50','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2409100200.tar.gz'),(200,'crontab','2010-09-25 00:00:16','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2509100000.tar.gz'),(201,'crontab','2010-09-25 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-2509100005.tar.gz'),(202,'','2010-09-25 00:05:12','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-2509100005.tar.gz'),(203,'crontab','2010-09-25 02:00:50','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2509100200.tar.gz'),(204,'crontab','2010-09-26 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2609100000.tar.gz'),(205,'crontab','2010-09-26 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-2609100005.tar.gz'),(206,'','2010-09-26 00:05:13','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-2609100005.tar.gz'),(207,'crontab','2010-09-26 02:00:48','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2609100200.tar.gz'),(208,'crontab','2010-09-27 00:00:17','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2709100000.tar.gz'),(209,'crontab','2010-09-27 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-2709100005.tar.gz'),(210,'','2010-09-27 00:05:12','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-2709100005.tar.gz'),(211,'crontab','2010-09-27 02:00:48','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2709100200.tar.gz'),(212,'crontab','2010-09-28 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2809100000.tar.gz'),(213,'crontab','2010-09-28 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-2809100005.tar.gz'),(214,'','2010-09-28 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-2809100005.tar.gz'),(215,'crontab','2010-09-28 02:00:49','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2809100200.tar.gz'),(216,'crontab','2010-09-29 00:00:17','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2909100000.tar.gz'),(217,'crontab','2010-09-29 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-2909100005.tar.gz'),(218,'','2010-09-29 00:05:12','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-2909100005.tar.gz'),(219,'crontab','2010-09-29 02:00:46','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2909100200.tar.gz'),(220,'crontab','2010-09-30 00:00:17','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-3009100000.tar.gz'),(221,'crontab','2010-09-30 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-3009100005.tar.gz'),(222,'','2010-09-30 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-3009100005.tar.gz'),(223,'crontab','2010-09-30 02:00:22','appovz01p','configs','/var/amrox/backups/appovz01p-configs-3009100200.tar.gz'),(224,'crontab','2010-10-01 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0110100000.tar.gz'),(225,'crontab','2010-10-01 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-0110100005.tar.gz'),(226,'','2010-10-01 00:05:12','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-0110100005.tar.gz'),(227,'crontab','2010-10-01 02:00:23','appovz01p','configs','/var/amrox/backups/appovz01p-configs-0110100200.tar.gz'),(228,'dude finished paypal work?','2010-10-01 09:20:59','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0110100920.tar.gz'),(229,'crontab','2010-10-02 00:00:10','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0210100000.tar.gz'),(230,'crontab','2010-10-02 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-0210100005.tar.gz'),(231,'','2010-10-02 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-0210100005.tar.gz'),(232,'crontab','2010-10-02 02:00:23','appovz01p','configs','/var/amrox/backups/appovz01p-configs-0210100200.tar.gz'),(233,'crontab','2010-10-03 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0310100000.tar.gz'),(234,'crontab','2010-10-03 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-0310100005.tar.gz'),(235,'','2010-10-03 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-0310100005.tar.gz'),(236,'crontab','2010-10-03 02:00:21','appovz01p','configs','/var/amrox/backups/appovz01p-configs-0310100200.tar.gz'),(237,'crontab','2010-10-05 00:00:17','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0510100000.tar.gz'),(238,'crontab','2010-10-05 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-0510100005.tar.gz'),(239,'','2010-10-05 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-0510100005.tar.gz'),(240,'crontab','2010-10-05 02:00:22','appovz01p','configs','/var/amrox/backups/appovz01p-configs-0510100200.tar.gz'),(241,'crontab','2010-10-06 00:00:16','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0610100000.tar.gz'),(242,'crontab','2010-10-06 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-0610100005.tar.gz'),(243,'','2010-10-06 00:05:10','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-0610100005.tar.gz'),(244,'crontab','2010-10-06 02:00:21','appovz01p','configs','/var/amrox/backups/appovz01p-configs-0610100200.tar.gz'),(245,'crontab','2010-10-07 00:00:18','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0710100000.tar.gz'),(246,'crontab','2010-10-07 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-0710100005.tar.gz'),(247,'','2010-10-07 00:05:10','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-0710100005.tar.gz'),(248,'crontab','2010-10-07 02:00:23','appovz01p','configs','/var/amrox/backups/appovz01p-configs-0710100200.tar.gz'),(249,'crontab','2010-10-08 00:00:19','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0810100000.tar.gz'),(250,'crontab','2010-10-08 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-0810100005.tar.gz'),(251,'','2010-10-08 00:05:13','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-0810100005.tar.gz'),(252,'crontab','2010-10-08 02:00:25','appovz01p','configs','/var/amrox/backups/appovz01p-configs-0810100200.tar.gz'),(253,'crontab','2010-10-09 00:00:19','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-0910100000.tar.gz'),(254,'crontab','2010-10-09 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-0910100005.tar.gz'),(255,'','2010-10-09 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-0910100005.tar.gz'),(256,'crontab','2010-10-09 02:00:26','appovz01p','configs','/var/amrox/backups/appovz01p-configs-0910100200.tar.gz'),(257,'crontab','2010-10-10 00:00:20','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1010100000.tar.gz'),(258,'crontab','2010-10-10 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-1010100005.tar.gz'),(259,'','2010-10-10 00:05:12','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-1010100005.tar.gz'),(260,'crontab','2010-10-10 02:00:26','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1010100200.tar.gz'),(261,'crontab','2010-10-11 00:00:22','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1110100000.tar.gz'),(262,'crontab','2010-10-11 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-1110100005.tar.gz'),(263,'','2010-10-11 00:05:13','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-1110100005.tar.gz'),(264,'crontab','2010-10-11 02:00:27','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1110100200.tar.gz'),(265,'crontab','2010-10-12 00:00:19','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1210100000.tar.gz'),(266,'crontab','2010-10-12 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-1210100005.tar.gz'),(267,'','2010-10-12 00:05:13','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-1210100005.tar.gz'),(268,'crontab','2010-10-12 02:00:23','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1210100200.tar.gz'),(269,'crontab','2010-10-13 00:00:18','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1310100000.tar.gz'),(270,'crontab','2010-10-13 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-1310100005.tar.gz'),(271,'','2010-10-13 00:05:15','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-1310100005.tar.gz'),(272,'crontab','2010-10-13 02:00:24','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1310100200.tar.gz'),(273,'cron','2010-10-13 15:05:50','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-1310101505.tar.gz'),(274,'cron','2010-10-13 15:06:06','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-1310101505.tar.gz'),(275,'crontab','2010-10-14 00:00:16','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1410100000.tar.gz'),(276,'crontab','2010-10-14 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-1410100005.tar.gz'),(277,'','2010-10-14 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-1410100005.tar.gz'),(278,'crontab','2010-10-14 02:00:25','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1410100200.tar.gz'),(279,'routine','2010-10-14 10:17:52','avpweb01.amroxonline.com','web-www.amroxonline.com','/var/amrox/backups/avpweb01.amroxonline.com-web-www.amroxonline.com-1410101017.tar.gz'),(280,'routine','2010-10-14 10:18:57','avpweb01.amroxonline.com','web-admin.amroxonline.com','/var/amrox/backups/avpweb01.amroxonline.com-web-admin.amroxonline.com-1410101018.tar.gz'),(281,'crontab','2010-10-15 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1510100000.tar.gz'),(282,'crontab','2010-10-15 00:05:01','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-1510100005.tar.gz'),(283,'','2010-10-15 00:05:11','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-1510100005.tar.gz'),(284,'crontab','2010-10-15 02:00:24','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1510100200.tar.gz'),(285,'crontab','2010-10-16 00:00:17','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1610100000.tar.gz'),(286,'crontab','2010-10-16 00:05:02','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-1610100005.tar.gz'),(287,'','2010-10-16 00:05:12','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-1610100005.tar.gz'),(288,'crontab','2010-10-16 02:00:23','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1610100200.tar.gz'),(289,'crontab','2010-10-17 00:00:18','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1710100000.tar.gz'),(290,'crontab','2010-10-17 00:05:03','avpweb02.amroxonline.com','nagios','/var/amrox/backups/avpweb02.amroxonline.com-nagios-1710100005.tar.gz'),(291,'','2010-10-17 00:05:13','avpweb02.amroxonline.com','pnp','/var/amrox/backups/avpweb02.amroxonline.com-pnp-1710100005.tar.gz'),(292,'crontab','2010-10-17 02:00:22','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1710100200.tar.gz'),(293,'recurring payments broken?','2010-10-17 14:02:05','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1710101401.tar.gz'),(294,'working','2010-10-17 17:28:47','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1710101713.tar.gz'),(295,'crontab','2010-10-18 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1810100000.tar.gz'),(296,'crontab','2010-10-18 00:05:01','avpnag01.amroxonline.com','nagios','/var/amrox/backups/avpnag01.amroxonline.com-nagios-1810100005.tar.gz'),(297,'','2010-10-18 00:05:12','avpnag01.amroxonline.com','pnp','/var/amrox/backups/avpnag01.amroxonline.com-pnp-1810100005.tar.gz'),(298,'crontab','2010-10-18 02:00:25','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1810100200.tar.gz'),(299,'crontab','2010-10-19 00:00:17','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-1910100000.tar.gz'),(300,'crontab','2010-10-19 00:05:02','avpnag01.amroxonline.com','nagios','/var/amrox/backups/avpnag01.amroxonline.com-nagios-1910100005.tar.gz'),(301,'','2010-10-19 00:05:13','avpnag01.amroxonline.com','pnp','/var/amrox/backups/avpnag01.amroxonline.com-pnp-1910100005.tar.gz'),(302,'crontab','2010-10-19 02:00:26','appovz01p','configs','/var/amrox/backups/appovz01p-configs-1910100200.tar.gz'),(303,'crontab','2010-10-20 00:00:16','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2010100000.tar.gz'),(304,'crontab','2010-10-20 00:05:02','avpnag01.amroxonline.com','nagios','/var/amrox/backups/avpnag01.amroxonline.com-nagios-2010100005.tar.gz'),(305,'','2010-10-20 00:05:15','avpnag01.amroxonline.com','pnp','/var/amrox/backups/avpnag01.amroxonline.com-pnp-2010100005.tar.gz'),(306,'crontab','2010-10-20 02:00:24','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2010100200.tar.gz'),(307,'crontab','2010-10-21 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2110100000.tar.gz'),(308,'crontab','2010-10-21 00:05:01','avpnag01.amroxonline.com','nagios','/var/amrox/backups/avpnag01.amroxonline.com-nagios-2110100005.tar.gz'),(309,'','2010-10-21 00:05:12','avpnag01.amroxonline.com','pnp','/var/amrox/backups/avpnag01.amroxonline.com-pnp-2110100005.tar.gz'),(310,'crontab','2010-10-21 02:00:27','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2110100200.tar.gz'),(311,'paypal working','2010-10-21 20:19:29','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2110102018.tar.gz'),(312,'crontab','2010-10-22 00:00:11','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2210100000.tar.gz'),(313,'crontab','2010-10-22 00:05:02','avpnag01.amroxonline.com','nagios','/var/amrox/backups/avpnag01.amroxonline.com-nagios-2210100005.tar.gz'),(314,'','2010-10-22 00:05:13','avpnag01.amroxonline.com','pnp','/var/amrox/backups/avpnag01.amroxonline.com-pnp-2210100005.tar.gz'),(315,'crontab','2010-10-22 02:00:21','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2210100200.tar.gz'),(316,'crontab','2010-10-23 00:00:16','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2310100000.tar.gz'),(317,'crontab','2010-10-23 00:05:03','avpnag01.amroxonline.com','nagios','/var/amrox/backups/avpnag01.amroxonline.com-nagios-2310100005.tar.gz'),(318,'','2010-10-23 00:05:20','avpnag01.amroxonline.com','pnp','/var/amrox/backups/avpnag01.amroxonline.com-pnp-2310100005.tar.gz'),(319,'crontab','2010-10-23 02:00:25','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2310100200.tar.gz'),(320,'crontab','2010-10-24 00:00:16','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2410100000.tar.gz'),(321,'crontab','2010-10-24 00:05:05','avpnag01.amroxonline.com','nagios','/var/amrox/backups/avpnag01.amroxonline.com-nagios-2410100005.tar.gz'),(322,'','2010-10-24 00:05:25','avpnag01.amroxonline.com','pnp','/var/amrox/backups/avpnag01.amroxonline.com-pnp-2410100005.tar.gz'),(323,'crontab','2010-10-24 02:00:25','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2410100200.tar.gz'),(324,'crontab','2010-10-25 00:00:15','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2510100000.tar.gz'),(325,'crontab','2010-10-25 00:05:02','avpnag01.amroxonline.com','nagios','/var/amrox/backups/avpnag01.amroxonline.com-nagios-2510100005.tar.gz'),(326,'','2010-10-25 00:05:23','avpnag01.amroxonline.com','pnp','/var/amrox/backups/avpnag01.amroxonline.com-pnp-2510100005.tar.gz'),(327,'crontab','2010-10-25 02:00:27','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2510100200.tar.gz'),(328,'backup of 134','2010-10-25 09:00:02','avpweb01.amroxonline.com','web-www.amroxonline.com','/var/amrox/backups/avpweb01.amroxonline.com-web-www.amroxonline.com-2510100859.tar.gz'),(329,'backup of 134','2010-10-25 09:00:43','avpweb01.amroxonline.com','web-admin.amroxonline.com','/var/amrox/backups/avpweb01.amroxonline.com-web-admin.amroxonline.com-2510100900.tar.gz'),(330,'backup of 134','2010-10-25 09:00:50','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2510100900.tar.gz'),(331,'135 routine','2010-10-25 15:15:21','avpweb02.amroxonline.com','web-www.amroxonline.com','/var/amrox/backups/avpweb02.amroxonline.com-web-www.amroxonline.com-2510101515.tar.gz'),(332,'135 routine','2010-10-25 15:16:23','avpweb02.amroxonline.com','web-admin.amroxonline.com','/var/amrox/backups/avpweb02.amroxonline.com-web-admin.amroxonline.com-2510101515.tar.gz'),(333,'crontab','2010-10-26 00:00:13','avpsql01.amroxonline.com','sql','/var/amrox/backups/avpsql01.amroxonline.com-sql-2610100000.tar.gz'),(334,'crontab','2010-10-26 00:05:05','avpnag01.amroxonline.com','nagios','/var/amrox/backups/avpnag01.amroxonline.com-nagios-2610100005.tar.gz'),(335,'','2010-10-26 00:05:26','avpnag01.amroxonline.com','pnp','/var/amrox/backups/avpnag01.amroxonline.com-pnp-2610100005.tar.gz'),(336,'crontab','2010-10-26 02:00:27','appovz01p','configs','/var/amrox/backups/appovz01p-configs-2610100200.tar.gz'),(337,'134 before applying stag diffs','2010-10-26 12:51:14','avpweb01.amroxonline.com','web-www.amroxonline.com','/var/amrox/backups/avpweb01.amroxonline.com-web-www.amroxonline.com-2610101250.tar.gz');
/*!40000 ALTER TABLE `backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpu`
--

DROP TABLE IF EXISTS `cpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpu` (
  `cpu_ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `cpu_freq` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`cpu_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu`
--

LOCK TABLES `cpu` WRITE;
/*!40000 ALTER TABLE `cpu` DISABLE KEYS */;
/*!40000 ALTER TABLE `cpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_ID` int(11) DEFAULT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `email` varchar(96) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_size`
--

DROP TABLE IF EXISTS `db_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_size` (
  `Amrox_prod2` varchar(64) DEFAULT NULL,
  `Size in MB` decimal(50,8) DEFAULT NULL,
  `Free space in MB` decimal(49,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_size`
--

LOCK TABLES `db_size` WRITE;
/*!40000 ALTER TABLE `db_size` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duration`
--

DROP TABLE IF EXISTS `duration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duration` (
  `duration_ID` int(11) DEFAULT NULL,
  `duration_hr` varchar(64) DEFAULT NULL,
  `duration_days` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duration`
--

LOCK TABLES `duration` WRITE;
/*!40000 ALTER TABLE `duration` DISABLE KEYS */;
/*!40000 ALTER TABLE `duration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `free_ip`
--

DROP TABLE IF EXISTS `free_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `free_ip` (
  `ip_address` varchar(25) DEFAULT NULL,
  `host_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `free_ip`
--

LOCK TABLES `free_ip` WRITE;
/*!40000 ALTER TABLE `free_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `free_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harddrive`
--

DROP TABLE IF EXISTS `harddrive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harddrive` (
  `harddrive_ID` int(11) DEFAULT NULL,
  `harddrive_hr` varchar(64) DEFAULT NULL,
  `harddrive_hard` int(11) DEFAULT NULL,
  `harddrive_soft` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harddrive`
--

LOCK TABLES `harddrive` WRITE;
/*!40000 ALTER TABLE `harddrive` DISABLE KEYS */;
/*!40000 ALTER TABLE `harddrive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harddrive_used`
--

DROP TABLE IF EXISTS `harddrive_used`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harddrive_used` (
  `live_name` varchar(25) DEFAULT NULL,
  `host_id` smallint(6) DEFAULT NULL,
  `live` enum('yes','no') DEFAULT NULL,
  `harddrive_id` smallint(6) DEFAULT NULL,
  `harddrive_hard` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harddrive_used`
--

LOCK TABLES `harddrive_used` WRITE;
/*!40000 ALTER TABLE `harddrive_used` DISABLE KEYS */;
/*!40000 ALTER TABLE `harddrive_used` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host` (
  `host_ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `host_name` varchar(25) DEFAULT NULL,
  `host_ip` varchar(25) DEFAULT NULL,
  `host_hd_meg` int(11) DEFAULT NULL,
  `host_ram_meg` int(11) DEFAULT NULL,
  PRIMARY KEY (`host_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES (1,'32bit','192.168.1.69',54905,494),(2,'64bit','192.168.1.66',108057,2010),(3,'svr-sql-001','88.198.39.74',145313,1002),(4,'appovz02','85.10.202.147',704482,7962);
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip`
--

DROP TABLE IF EXISTS `ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip` (
  `ip_ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(25) DEFAULT NULL,
  `netmask` varchar(25) DEFAULT NULL,
  `gateway` varchar(25) DEFAULT NULL,
  `nameserver1` varchar(25) DEFAULT NULL,
  `host_id` smallint(6) DEFAULT NULL,
  `ip_hostname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ip_ID`),
  KEY `host_id` (`host_id`)
) ENGINE=MyISAM AUTO_INCREMENT=950 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip`
--

LOCK TABLES `ip` WRITE;
/*!40000 ALTER TABLE `ip` DISABLE KEYS */;
INSERT INTO `ip` VALUES (872,'78.46.195.30','255.255.255.248','78.46.195.27','213.133.100.100',3,'avstst01.amroxonline.com'),(871,'78.46.195.29','255.255.255.248','78.46.195.27','213.133.100.100',3,NULL),(870,'78.46.195.28','255.255.255.248','78.46.195.27','213.133.100.100',3,NULL),(869,'78.46.195.27','255.255.255.248','78.46.195.27','213.133.100.100',3,'avsweb01.amroxonline.com'),(878,'78.46.195.26','255.255.255.248','78.46.195.27','213.133.100.100',3,'avstst01.amroxonline.com'),(867,'78.46.195.25','255.255.255.248','78.46.195.27','213.133.100.100',3,'avpsql01.amroxonline.com'),(865,'88.198.39.74','255.255.255.224','88.198.39.65','213.133.100.100',3,NULL),(866,'78.46.195.24','255.255.255.248','88.198.39.65','213.133.100.100',3,NULL),(883,'85.10.202.147','255.255.255.224','85.10.202.129','213.133.99.99',4,'appovz02p.amroxonline.com'),(884,'85.10.202.157','255.255.255.224','85.10.202.129','213.133.99.99',4,'appovzo2m.amroxonline.com'),(886,'78.47.5.64','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4064.amroxservices.com'),(887,'78.47.5.65','255.255.255.192','85.10.202.129','213.133.99.99',4,'avpdns03.amroxonline.com'),(888,'78.47.5.66','255.255.255.192','85.10.202.129','213.133.99.99',4,'avpdns02.amroxonline.com'),(889,'78.47.5.67','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4067.amroxonline.com'),(890,'78.47.5.68','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4068.amroxonline.com'),(891,'78.47.5.69','255.255.255.192','85.10.202.129','213.133.99.99',4,'avpdns01.amroxonline.com'),(892,'78.47.5.70','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4070.amroxonline.com'),(893,'78.47.5.71','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4071.amroxonline.com'),(894,'78.47.5.72','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4072.amroxonline.com'),(895,'78.47.5.73','255.255.255.192','85.10.202.129','213.133.99.99',4,'avstst01.amroxonline.com'),(896,'78.47.5.74','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4074.amroxonline.com'),(897,'78.47.5.75','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4075.amroxonline.com'),(898,'78.47.5.76','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4076.amroxonline.com'),(899,'78.47.5.77','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4077.amroxonline.com'),(900,'78.47.5.78','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4078.amroxonline.com'),(901,'78.47.5.79','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4079.amroxonline.com'),(902,'78.47.5.80','255.255.255.192','85.10.202.129','213.133.99.99',4,'avseye01.amroxonline.com'),(903,'78.47.5.81','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4081.amroxonline.com'),(904,'78.47.5.82','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4082.amroxonline.com'),(905,'78.47.5.83','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4083.amroxonline.com'),(906,'78.47.5.84','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4084.amroxonline.com'),(907,'78.47.5.85','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4085.amroxonline.com'),(908,'78.47.5.86','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4086.amroxonline.com'),(909,'78.47.5.87','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4087.amroxonline.com'),(910,'78.47.5.88','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4088.amroxonline.com'),(911,'78.47.5.89','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4089.amroxonline.com'),(912,'78.47.5.90','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4090.amroxonline.com'),(913,'78.47.5.91','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4091.amroxonline.com'),(914,'78.47.5.92','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4092.amroxonline.com'),(915,'78.47.5.93','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4093.amroxonline.com'),(916,'78.47.5.94','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4094.amroxonline.com'),(917,'78.47.5.95','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4095.amroxonline.com'),(918,'78.47.5.96','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4096.amroxonline.com'),(919,'78.47.5.97','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4097.amroxonline.com'),(920,'78.47.5.98','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4098.amroxonline.com'),(921,'78.47.5.99','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4099.amroxonline.com'),(922,'78.47.5.100','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4100.amroxonline.com'),(923,'78.47.5.101','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4101.amroxonline.com'),(924,'78.47.5.102','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4102.amroxonline.com'),(925,'78.47.5.103','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4103.amroxonline.com'),(926,'78.47.5.104','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4104.amroxonline.com'),(927,'78.47.5.105','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4105.amroxonline.com'),(928,'78.47.5.106','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4106.amroxonline.com'),(929,'78.47.5.107','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4107.amroxonline.com'),(930,'78.47.5.108','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4108.amroxonline.com'),(931,'78.47.5.109','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4109.amroxonline.com'),(932,'78.47.5.110','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4110.amroxonline.com'),(933,'78.47.5.111','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4111.amroxonline.com'),(934,'78.47.5.112','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4112.amroxonline.com'),(935,'78.47.5.113','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4113.amroxonline.com'),(936,'78.47.5.114','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4114.amroxonline.com'),(937,'78.47.5.115','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4115.amroxonline.com'),(938,'78.47.5.116','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4116.amroxonline.com'),(939,'78.47.5.117','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4117.amroxonline.com'),(940,'78.47.5.118','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4118.amroxonline.com'),(941,'78.47.5.119','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4119.amroxonline.com'),(942,'78.47.5.120','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4120.amroxonline.com'),(943,'78.47.5.121','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4121.amroxonline.com'),(944,'78.47.5.122','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4122.amroxonline.com'),(945,'78.47.5.123','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4123.amroxonline.com'),(946,'78.47.5.124','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4124.amroxonline.com'),(947,'78.47.5.125','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4125.amroxonline.com'),(948,'78.47.5.126','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4126.amroxonline.com'),(949,'78.47.5.127','255.255.255.192','85.10.202.129','213.133.99.99',4,'svr4127.amroxonline.com');
/*!40000 ALTER TABLE `ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live_CTID_ipID`
--

DROP TABLE IF EXISTS `live_CTID_ipID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live_CTID_ipID` (
  `CTID` varchar(25) DEFAULT NULL,
  `live` enum('yes','no') DEFAULT NULL,
  `ip_id` smallint(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_CTID_ipID`
--

LOCK TABLES `live_CTID_ipID` WRITE;
/*!40000 ALTER TABLE `live_CTID_ipID` DISABLE KEYS */;
/*!40000 ALTER TABLE `live_CTID_ipID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_live`
--

DROP TABLE IF EXISTS `master_live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_live` (
  `live_ID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `live_dateadded` datetime DEFAULT '0000-00-00 00:00:00',
  `live_datemodified` datetime DEFAULT '0000-00-00 00:00:00',
  `duration_days` smallint(6) DEFAULT NULL,
  `bandwidth_id` smallint(6) DEFAULT NULL,
  `cpu_id` smallint(6) DEFAULT NULL,
  `memory_id` smallint(6) DEFAULT NULL,
  `customer_id` smallint(6) DEFAULT NULL,
  `host_id` smallint(6) DEFAULT NULL,
  `live` enum('yes','no') DEFAULT NULL,
  `ip_id` smallint(6) DEFAULT NULL,
  `live_name` varchar(25) NOT NULL,
  `vm_id` smallint(6) NOT NULL,
  `password` varchar(12) NOT NULL,
  `harddrive_id` smallint(6) DEFAULT NULL,
  UNIQUE KEY `live_ID` (`live_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3120 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_live`
--

LOCK TABLES `master_live` WRITE;
/*!40000 ALTER TABLE `master_live` DISABLE KEYS */;
INSERT INTO `master_live` VALUES (3031,'2010-02-14 17:25:14','2010-10-17 00:00:01',999,55,0,43,0,3,'yes',867,'avpsql01.amroxonline.com',38,'password',37),(3025,'2010-02-13 23:16:25','2010-10-17 00:00:01',999,59,0,1,0,3,'yes',865,'appovz01p.amroxonline.com',999,'password',37),(3028,'2010-02-14 17:21:54','2010-10-17 00:00:01',999,55,0,19,0,3,'yes',871,'avpweb01.amroxonline.com',35,'password',37),(3027,'2010-02-14 17:20:35','2010-10-17 00:00:01',999,55,0,19,0,3,'yes',869,'avsweb01.amroxonline.com',33,'password',37),(3088,'2010-06-24 17:37:30','2010-10-14 00:00:01',7,54,0,19,16,0,'yes',890,'svr4068.amroxonline.com',3,'?c66iisCM',39),(3089,'2010-07-09 21:07:44','2010-07-09 21:07:44',7,55,0,40,17,0,'no',889,'svr4067.amroxonline.com',7,'5eF7uF~ji',39),(3105,'2010-07-18 03:22:14','2010-10-14 00:00:01',7,54,0,19,19,0,'yes',898,'svr4076.amroxonline.com',12,'7lkCNn+5i',38),(3106,'2010-07-21 18:36:41','2010-10-17 00:00:01',999,55,0,20,8,4,'yes',899,'svr4077.amroxonline.com',13,'7db9MB,ae',14),(3083,'2010-05-11 17:52:14','2010-10-18 00:00:02',999,55,0,1,1,0,'yes',883,'appovz02p.amroxonline.com',999,'password',37),(3087,'2010-06-09 18:10:29','2010-10-15 00:00:02',30,58,0,21,14,4,'no',886,'svr4064.amroxservices.com',6,'8evK]ju6Q',16),(3101,'2010-07-16 19:25:11','2010-07-16 19:25:11',999,54,0,1,1,4,'no',895,'avstst01.amroxonline.com',26,'password',37),(3091,'2010-02-14 17:25:14','2010-10-17 00:00:02',999,55,0,1,0,3,'yes',891,'avpdns01.amroxonline.com',345,'password',37),(3092,'2010-02-14 17:25:14','2010-10-17 00:00:02',999,55,0,1,0,3,'yes',888,'avpdns02.amroxonline.com',2,'password',37),(3093,'2010-02-14 17:25:14','2010-10-17 00:00:02',999,55,0,1,0,3,'yes',887,'avpdns03.amroxonline.com',4,'password',37),(3094,'2010-02-14 17:25:14','2010-10-17 00:00:02',999,55,0,1,0,3,'yes',902,'avseye01.amroxonline.com',789,'password',37),(3103,'2010-07-16 22:52:27','2010-10-13 00:00:01',365,55,0,20,8,4,'no',896,'svr4074.amroxonline.com',1,'',15),(3104,'2010-07-16 22:52:57','2010-10-13 00:00:01',365,55,0,20,8,4,'yes',897,'svr4075.amroxonline.com',11,'qA9edxY4>',39),(3097,'2010-07-12 02:43:37','2010-10-16 00:00:02',7,56,0,20,8,0,'yes',884,'appovzo2m.amroxonline.com',5,'20qlbA;iG',38),(3098,'2010-07-12 02:43:37','2010-10-16 00:00:02',30,56,0,20,8,4,'no',892,'svr4070.amroxonline.com',8,'TIrlvb}86',16),(3099,'2010-07-12 02:43:37','2010-10-16 00:00:02',7,54,0,19,8,4,'yes',893,'svr4071.amroxonline.com',9,'wiZ5,uqV0',38),(3100,'2010-07-12 16:19:47','2010-10-16 00:00:02',7,54,0,19,8,4,'yes',894,'svr4072.amroxonline.com',10,'_4Lhup7Vz',38),(3107,'2010-07-24 01:28:59','2010-10-13 00:00:01',183,54,0,20,8,4,'yes',900,'svr4078.amroxonline.com',14,'aq54(saUI',39),(3108,'2010-07-31 15:33:35','2010-10-11 00:00:02',7,58,0,40,20,4,'no',901,'svr4079.amroxonline.com',15,'Sb)l5Yh7t',17),(3111,'2010-08-05 06:47:42','2010-10-16 00:00:02',30,54,0,20,8,4,'yes',903,'svr4081.amroxonline.com',16,'yF+p01Oml',38),(3110,'2010-08-05 06:46:24','2010-10-16 00:00:02',30,54,0,20,8,4,'yes',904,'svr4082.amroxonline.com',17,'Pt81%nfWr',14),(3112,'2010-08-19 06:14:11','2010-10-14 00:00:01',7,55,0,21,8,4,'no',905,'svr4083.amroxonline.com',18,'Md?izI39l',14),(3113,'2010-10-13 12:05:52','2010-10-13 12:05:52',30,56,0,21,21,4,'yes',906,'svr4084.amroxonline.com',19,'gh:J5sh3Y',14),(3114,'2010-10-18 10:16:52','2010-10-18 10:16:52',9999,54,0,19,0,3,'yes',872,'avpweb02.amroxonline.com',36,'password',14),(3115,'2010-10-18 10:16:52','2010-10-18 10:16:52',999,54,0,19,0,3,'yes',870,'avpnag01.amroxonline.com',37,'password',14),(3116,'2010-10-26 11:03:03','2010-10-26 11:03:03',0,54,0,18,0,0,'yes',907,'svr4085.amroxonline.com',20,')Kq81qKtt',37),(3117,'2010-10-26 12:00:42','2010-10-26 12:00:42',0,54,0,18,0,0,'yes',908,'svr4086.amroxonline.com',21,'',37),(3118,'2010-10-26 12:00:48','2010-10-26 12:00:48',0,54,0,18,0,0,'yes',909,'svr4087.amroxonline.com',22,'',37),(3119,'2010-10-26 12:01:31','2010-10-26 12:01:31',0,54,0,18,0,0,'yes',910,'svr4088.amroxonline.com',23,'',37);
/*!40000 ALTER TABLE `master_live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memory`
--

DROP TABLE IF EXISTS `memory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memory` (
  `memory_id` int(11) DEFAULT NULL,
  `memory` varchar(64) DEFAULT NULL,
  `memory_values` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memory`
--

LOCK TABLES `memory` WRITE;
/*!40000 ALTER TABLE `memory` DISABLE KEYS */;
/*!40000 ALTER TABLE `memory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memory_used`
--

DROP TABLE IF EXISTS `memory_used`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memory_used` (
  `live_name` varchar(25) DEFAULT NULL,
  `live` enum('yes','no') DEFAULT NULL,
  `host_id` smallint(6) DEFAULT NULL,
  `memory_id` smallint(6) DEFAULT NULL,
  `memory` varchar(64) DEFAULT NULL,
  `memory_values` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memory_used`
--

LOCK TABLES `memory_used` WRITE;
/*!40000 ALTER TABLE `memory_used` DISABLE KEYS */;
/*!40000 ALTER TABLE `memory_used` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support`
--

DROP TABLE IF EXISTS `support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support` (
  `support_id` int(11) DEFAULT NULL,
  `support_type` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support`
--

LOCK TABLES `support` WRITE;
/*!40000 ALTER TABLE `support` DISABLE KEYS */;
/*!40000 ALTER TABLE `support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traffic`
--

DROP TABLE IF EXISTS `traffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traffic` (
  `traffic_ID` int(11) NOT NULL DEFAULT '0',
  `ipaddress` varchar(20) DEFAULT NULL,
  `bytes` bigint(20) DEFAULT NULL,
  `measuringtime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traffic`
--

LOCK TABLES `traffic` WRITE;
/*!40000 ALTER TABLE `traffic` DISABLE KEYS */;
INSERT INTO `traffic` VALUES (205,'78.46.195.25',1496,'2010-02-03 15:19:14'),(206,'78.46.195.26',1527,'2010-02-03 15:19:14'),(207,'78.46.195.27',75343,'2010-02-03 15:19:14'),(208,'78.46.195.29',619,'2010-02-03 15:19:14'),(209,'78.46.195.30',1616,'2010-02-03 15:19:14'),(211,'78.46.195.25',1496,'2010-02-03 15:19:14'),(212,'78.46.195.26',1527,'2010-02-03 15:19:14'),(213,'78.46.195.27',75343,'2010-02-03 15:19:14'),(214,'78.46.195.29',619,'2010-02-03 15:19:14'),(215,'78.46.195.30',1616,'2010-02-03 15:19:14'),(217,'78.46.195.25',3240,'2010-02-03 16:23:10'),(218,'78.46.195.26',8836,'2010-02-03 16:23:10'),(219,'78.46.195.27',19518,'2010-02-03 16:23:10'),(220,'78.46.195.29',27167,'2010-02-03 16:23:10'),(221,'78.46.195.30',6808,'2010-02-03 16:23:10'),(223,'78.46.195.25',26247,'2010-02-03 16:40:12'),(224,'78.46.195.26',26803,'2010-02-03 16:40:12'),(225,'78.46.195.27',91000414,'2010-02-03 16:40:12'),(226,'78.46.195.29',47518,'2010-02-03 16:40:12'),(227,'78.46.195.30',27541,'2010-02-03 16:40:12'),(241,'78.46.195.25',17772,'2010-02-03 20:00:01'),(242,'78.46.195.26',26910,'2010-02-03 20:00:01'),(243,'78.46.195.27',29042,'2010-02-03 20:00:01'),(277,'78.46.195.26',2840,'2010-02-03 20:00:01'),(246,'78.46.195.30',24456,'2010-02-03 20:00:01'),(262,'78.46.195.25',88,'2010-02-03 20:00:01'),(266,'78.46.195.29',128,'2010-02-03 20:00:01'),(269,'78.46.195.25',88,'2010-05-03 19:45:05'),(270,'78.46.195.26',364,'2010-05-03 19:45:05'),(276,'78.46.195.25',1160,'2010-02-03 20:00:01'),(278,'78.46.195.27',4152,'2010-02-03 20:00:01'),(279,'78.46.195.29',1964,'2010-02-03 20:00:01'),(283,'78.46.195.25',466,'2010-02-03 20:15:01'),(284,'78.46.195.26',2352,'2010-02-03 20:15:02'),(285,'78.46.195.27',1304,'2010-02-03 20:15:02'),(288,'78.46.195.30',1562,'2010-02-03 20:15:02'),(290,'78.46.195.25',23131,'2010-02-03 20:30:01'),(291,'78.46.195.26',27720,'2010-02-03 20:30:01'),(292,'78.46.195.27',32164,'2010-02-03 20:30:01'),(295,'78.46.195.30',24400,'2010-02-03 20:30:01'),(297,'78.46.195.25',1504,'2010-02-03 20:45:01'),(298,'78.46.195.26',4692,'2010-02-03 20:45:01'),(299,'78.46.195.27',2828,'2010-02-03 20:45:01');
/*!40000 ALTER TABLE `traffic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `used_ip`
--

DROP TABLE IF EXISTS `used_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `used_ip` (
  `Used IPs` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `used_ip`
--

LOCK TABLES `used_ip` WRITE;
/*!40000 ALTER TABLE `used_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `used_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `version_id` int(11) DEFAULT NULL,
  `version_name` varchar(64) DEFAULT NULL,
  `filename_32` varchar(64) DEFAULT NULL,
  `filename_64` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vm`
--

DROP TABLE IF EXISTS `vm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vm` (
  `vm_ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `CTID` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`vm_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=901 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vm`
--

LOCK TABLES `vm` WRITE;
/*!40000 ALTER TABLE `vm` DISABLE KEYS */;
INSERT INTO `vm` VALUES (1,'100'),(2,'101'),(3,'102'),(4,'103'),(5,'104'),(6,'105'),(7,'106'),(8,'107'),(9,'108'),(10,'109'),(11,'110'),(12,'111'),(13,'112'),(14,'113'),(15,'114'),(16,'115'),(17,'116'),(18,'117'),(19,'118'),(20,'119'),(21,'120'),(22,'121'),(23,'122'),(24,'123'),(25,'124'),(26,'125'),(27,'126'),(28,'127'),(29,'128'),(30,'129'),(31,'130'),(32,'131'),(33,'132'),(34,'133'),(35,'134'),(36,'135'),(37,'136'),(38,'137'),(39,'138'),(40,'139'),(41,'140'),(42,'141'),(43,'142'),(44,'143'),(45,'144'),(46,'145'),(47,'146'),(48,'147'),(49,'148'),(50,'149'),(51,'150'),(52,'151'),(53,'152'),(54,'153'),(55,'154'),(56,'155'),(57,'156'),(58,'157'),(59,'158'),(60,'159'),(61,'160'),(62,'161'),(63,'162'),(64,'163'),(65,'164'),(66,'165'),(67,'166'),(68,'167'),(69,'168'),(70,'169'),(71,'170'),(72,'171'),(73,'172'),(74,'173'),(75,'174'),(76,'175'),(77,'176'),(78,'177'),(79,'178'),(80,'179'),(81,'180'),(82,'181'),(83,'182'),(84,'183'),(85,'184'),(86,'185'),(87,'186'),(88,'187'),(89,'188'),(90,'189'),(91,'190'),(92,'191'),(93,'192'),(94,'193'),(95,'194'),(96,'195'),(97,'196'),(98,'197'),(99,'198'),(100,'199'),(101,'200'),(102,'201'),(103,'202'),(104,'203'),(105,'204'),(106,'205'),(107,'206'),(108,'207'),(109,'208'),(110,'209'),(111,'210'),(112,'211'),(113,'212'),(114,'213'),(115,'214'),(116,'215'),(117,'216'),(118,'217'),(119,'218'),(120,'219'),(121,'220'),(122,'221'),(123,'222'),(124,'223'),(125,'224'),(126,'225'),(127,'226'),(128,'227'),(129,'228'),(130,'229'),(131,'230'),(132,'231'),(133,'232'),(134,'233'),(135,'234'),(136,'235'),(137,'236'),(138,'237'),(139,'238'),(140,'239'),(141,'240'),(142,'241'),(143,'242'),(144,'243'),(145,'244'),(146,'245'),(147,'246'),(148,'247'),(149,'248'),(150,'249'),(151,'250'),(152,'251'),(153,'252'),(154,'253'),(155,'254'),(156,'255'),(157,'256'),(158,'257'),(159,'258'),(160,'259'),(161,'260'),(162,'261'),(163,'262'),(164,'263'),(165,'264'),(166,'265'),(167,'266'),(168,'267'),(169,'268'),(170,'269'),(171,'270'),(172,'271'),(173,'272'),(174,'273'),(175,'274'),(176,'275'),(177,'276'),(178,'277'),(179,'278'),(180,'279'),(181,'280'),(182,'281'),(183,'282'),(184,'283'),(185,'284'),(186,'285'),(187,'286'),(188,'287'),(189,'288'),(190,'289'),(191,'290'),(192,'291'),(193,'292'),(194,'293'),(195,'294'),(196,'295'),(197,'296'),(198,'297'),(199,'298'),(200,'299'),(201,'300'),(202,'301'),(203,'302'),(204,'303'),(205,'304'),(206,'305'),(207,'306'),(208,'307'),(209,'308'),(210,'309'),(211,'310'),(212,'311'),(213,'312'),(214,'313'),(215,'314'),(216,'315'),(217,'316'),(218,'317'),(219,'318'),(220,'319'),(221,'320'),(222,'321'),(223,'322'),(224,'323'),(225,'324'),(226,'325'),(227,'326'),(228,'327'),(229,'328'),(230,'329'),(231,'330'),(232,'331'),(233,'332'),(234,'333'),(235,'334'),(236,'335'),(237,'336'),(238,'337'),(239,'338'),(240,'339'),(241,'340'),(242,'341'),(243,'342'),(244,'343'),(245,'344'),(246,'345'),(247,'346'),(248,'347'),(249,'348'),(250,'349'),(251,'350'),(252,'351'),(253,'352'),(254,'353'),(255,'354'),(256,'355'),(257,'356'),(258,'357'),(259,'358'),(260,'359'),(261,'360'),(262,'361'),(263,'362'),(264,'363'),(265,'364'),(266,'365'),(267,'366'),(268,'367'),(269,'368'),(270,'369'),(271,'370'),(272,'371'),(273,'372'),(274,'373'),(275,'374'),(276,'375'),(277,'376'),(278,'377'),(279,'378'),(280,'379'),(281,'380'),(282,'381'),(283,'382'),(284,'383'),(285,'384'),(286,'385'),(287,'386'),(288,'387'),(289,'388'),(290,'389'),(291,'390'),(292,'391'),(293,'392'),(294,'393'),(295,'394'),(296,'395'),(297,'396'),(298,'397'),(299,'398'),(300,'399'),(301,'400'),(302,'401'),(303,'402'),(304,'403'),(305,'404'),(306,'405'),(307,'406'),(308,'407'),(309,'408'),(310,'409'),(311,'410'),(312,'411'),(313,'412'),(314,'413'),(315,'414'),(316,'415'),(317,'416'),(318,'417'),(319,'418'),(320,'419'),(321,'420'),(322,'421'),(323,'422'),(324,'423'),(325,'424'),(326,'425'),(327,'426'),(328,'427'),(329,'428'),(330,'429'),(331,'430'),(332,'431'),(333,'432'),(334,'433'),(335,'434'),(336,'435'),(337,'436'),(338,'437'),(339,'438'),(340,'439'),(341,'440'),(342,'441'),(343,'442'),(344,'443'),(345,'444'),(346,'445'),(347,'446'),(348,'447'),(349,'448'),(350,'449'),(351,'450'),(352,'451'),(353,'452'),(354,'453'),(355,'454'),(356,'455'),(357,'456'),(358,'457'),(359,'458'),(360,'459'),(361,'460'),(362,'461'),(363,'462'),(364,'463'),(365,'464'),(366,'465'),(367,'466'),(368,'467'),(369,'468'),(370,'469'),(371,'470'),(372,'471'),(373,'472'),(374,'473'),(375,'474'),(376,'475'),(377,'476'),(378,'477'),(379,'478'),(380,'479'),(381,'480'),(382,'481'),(383,'482'),(384,'483'),(385,'484'),(386,'485'),(387,'486'),(388,'487'),(389,'488'),(390,'489'),(391,'490'),(392,'491'),(393,'492'),(394,'493'),(395,'494'),(396,'495'),(397,'496'),(398,'497'),(399,'498'),(400,'499'),(401,'500'),(402,'501'),(403,'502'),(404,'503'),(405,'504'),(406,'505'),(407,'506'),(408,'507'),(409,'508'),(410,'509'),(411,'510'),(412,'511'),(413,'512'),(414,'513'),(415,'514'),(416,'515'),(417,'516'),(418,'517'),(419,'518'),(420,'519'),(421,'520'),(422,'521'),(423,'522'),(424,'523'),(425,'524'),(426,'525'),(427,'526'),(428,'527'),(429,'528'),(430,'529'),(431,'530'),(432,'531'),(433,'532'),(434,'533'),(435,'534'),(436,'535'),(437,'536'),(438,'537'),(439,'538'),(440,'539'),(441,'540'),(442,'541'),(443,'542'),(444,'543'),(445,'544'),(446,'545'),(447,'546'),(448,'547'),(449,'548'),(450,'549'),(451,'550'),(452,'551'),(453,'552'),(454,'553'),(455,'554'),(456,'555'),(457,'556'),(458,'557'),(459,'558'),(460,'559'),(461,'560'),(462,'561'),(463,'562'),(464,'563'),(465,'564'),(466,'565'),(467,'566'),(468,'567'),(469,'568'),(470,'569'),(471,'570'),(472,'571'),(473,'572'),(474,'573'),(475,'574'),(476,'575'),(477,'576'),(478,'577'),(479,'578'),(480,'579'),(481,'580'),(482,'581'),(483,'582'),(484,'583'),(485,'584'),(486,'585'),(487,'586'),(488,'587'),(489,'588'),(490,'589'),(491,'590'),(492,'591'),(493,'592'),(494,'593'),(495,'594'),(496,'595'),(497,'596'),(498,'597'),(499,'598'),(500,'599'),(501,'600'),(502,'601'),(503,'602'),(504,'603'),(505,'604'),(506,'605'),(507,'606'),(508,'607'),(509,'608'),(510,'609'),(511,'610'),(512,'611'),(513,'612'),(514,'613'),(515,'614'),(516,'615'),(517,'616'),(518,'617'),(519,'618'),(520,'619'),(521,'620'),(522,'621'),(523,'622'),(524,'623'),(525,'624'),(526,'625'),(527,'626'),(528,'627'),(529,'628'),(530,'629'),(531,'630'),(532,'631'),(533,'632'),(534,'633'),(535,'634'),(536,'635'),(537,'636'),(538,'637'),(539,'638'),(540,'639'),(541,'640'),(542,'641'),(543,'642'),(544,'643'),(545,'644'),(546,'645'),(547,'646'),(548,'647'),(549,'648'),(550,'649'),(551,'650'),(552,'651'),(553,'652'),(554,'653'),(555,'654'),(556,'655'),(557,'656'),(558,'657'),(559,'658'),(560,'659'),(561,'660'),(562,'661'),(563,'662'),(564,'663'),(565,'664'),(566,'665'),(567,'666'),(568,'667'),(569,'668'),(570,'669'),(571,'670'),(572,'671'),(573,'672'),(574,'673'),(575,'674'),(576,'675'),(577,'676'),(578,'677'),(579,'678'),(580,'679'),(581,'680'),(582,'681'),(583,'682'),(584,'683'),(585,'684'),(586,'685'),(587,'686'),(588,'687'),(589,'688'),(590,'689'),(591,'690'),(592,'691'),(593,'692'),(594,'693'),(595,'694'),(596,'695'),(597,'696'),(598,'697'),(599,'698'),(600,'699'),(601,'700'),(602,'701'),(603,'702'),(604,'703'),(605,'704'),(606,'705'),(607,'706'),(608,'707'),(609,'708'),(610,'709'),(611,'710'),(612,'711'),(613,'712'),(614,'713'),(615,'714'),(616,'715'),(617,'716'),(618,'717'),(619,'718'),(620,'719'),(621,'720'),(622,'721'),(623,'722'),(624,'723'),(625,'724'),(626,'725'),(627,'726'),(628,'727'),(629,'728'),(630,'729'),(631,'730'),(632,'731'),(633,'732'),(634,'733'),(635,'734'),(636,'735'),(637,'736'),(638,'737'),(639,'738'),(640,'739'),(641,'740'),(642,'741'),(643,'742'),(644,'743'),(645,'744'),(646,'745'),(647,'746'),(648,'747'),(649,'748'),(650,'749'),(651,'750'),(652,'751'),(653,'752'),(654,'753'),(655,'754'),(656,'755'),(657,'756'),(658,'757'),(659,'758'),(660,'759'),(661,'760'),(662,'761'),(663,'762'),(664,'763'),(665,'764'),(666,'765'),(667,'766'),(668,'767'),(669,'768'),(670,'769'),(671,'770'),(672,'771'),(673,'772'),(674,'773'),(675,'774'),(676,'775'),(677,'776'),(678,'777'),(679,'778'),(680,'779'),(681,'780'),(682,'781'),(683,'782'),(684,'783'),(685,'784'),(686,'785'),(687,'786'),(688,'787'),(689,'788'),(690,'789'),(691,'790'),(692,'791'),(693,'792'),(694,'793'),(695,'794'),(696,'795'),(697,'796'),(698,'797'),(699,'798'),(700,'799'),(701,'800'),(702,'801'),(703,'802'),(704,'803'),(705,'804'),(706,'805'),(707,'806'),(708,'807'),(709,'808'),(710,'809'),(711,'810'),(712,'811'),(713,'812'),(714,'813'),(715,'814'),(716,'815'),(717,'816'),(718,'817'),(719,'818'),(720,'819'),(721,'820'),(722,'821'),(723,'822'),(724,'823'),(725,'824'),(726,'825'),(727,'826'),(728,'827'),(729,'828'),(730,'829'),(731,'830'),(732,'831'),(733,'832'),(734,'833'),(735,'834'),(736,'835'),(737,'836'),(738,'837'),(739,'838'),(740,'839'),(741,'840'),(742,'841'),(743,'842'),(744,'843'),(745,'844'),(746,'845'),(747,'846'),(748,'847'),(749,'848'),(750,'849'),(751,'850'),(752,'851'),(753,'852'),(754,'853'),(755,'854'),(756,'855'),(757,'856'),(758,'857'),(759,'858'),(760,'859'),(761,'860'),(762,'861'),(763,'862'),(764,'863'),(765,'864'),(766,'865'),(767,'866'),(768,'867'),(769,'868'),(770,'869'),(771,'870'),(772,'871'),(773,'872'),(774,'873'),(775,'874'),(776,'875'),(777,'876'),(778,'877'),(779,'878'),(780,'879'),(781,'880'),(782,'881'),(783,'882'),(784,'883'),(785,'884'),(786,'885'),(787,'886'),(788,'887'),(789,'888'),(790,'889'),(791,'890'),(792,'891'),(793,'892'),(794,'893'),(795,'894'),(796,'895'),(797,'896'),(798,'897'),(799,'898'),(800,'899'),(801,'900'),(802,'901'),(803,'902'),(804,'903'),(805,'904'),(806,'905'),(807,'906'),(808,'907'),(809,'908'),(810,'909'),(811,'910'),(812,'911'),(813,'912'),(814,'913'),(815,'914'),(816,'915'),(817,'916'),(818,'917'),(819,'918'),(820,'919'),(821,'920'),(822,'921'),(823,'922'),(824,'923'),(825,'924'),(826,'925'),(827,'926'),(828,'927'),(829,'928'),(830,'929'),(831,'930'),(832,'931'),(833,'932'),(834,'933'),(835,'934'),(836,'935'),(837,'936'),(838,'937'),(839,'938'),(840,'939'),(841,'940'),(842,'941'),(843,'942'),(844,'943'),(845,'944'),(846,'945'),(847,'946'),(848,'947'),(849,'948'),(850,'949'),(851,'950'),(852,'951'),(853,'952'),(854,'953'),(855,'954'),(856,'955'),(857,'956'),(858,'957'),(859,'958'),(860,'959'),(861,'960'),(862,'961'),(863,'962'),(864,'963'),(865,'964'),(866,'965'),(867,'966'),(868,'967'),(869,'968'),(870,'969'),(871,'970'),(872,'971'),(873,'972'),(874,'973'),(875,'974'),(876,'975'),(877,'976'),(878,'977'),(879,'978'),(880,'979'),(881,'980'),(882,'981'),(883,'982'),(884,'983'),(885,'984'),(886,'985'),(887,'986'),(888,'987'),(889,'988'),(890,'989'),(891,'990'),(892,'991'),(893,'992'),(894,'993'),(895,'994'),(896,'995'),(897,'996'),(898,'997'),(899,'998'),(900,'999');
/*!40000 ALTER TABLE `vm` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-30 22:56:50
