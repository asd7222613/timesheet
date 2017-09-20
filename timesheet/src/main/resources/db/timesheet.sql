-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: localhost    Database: timesheet
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `t_leave`
--

DROP TABLE IF EXISTS `t_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `starttime` datetime NOT NULL,
  `endtime` datetime DEFAULT NULL,
  `reason` varchar(45) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `isdelete` int(11) NOT NULL DEFAULT '0',
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_leave_userid_idx` (`userid`),
  CONSTRAINT `fk_leave_userid` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_leave`
--

LOCK TABLES `t_leave` WRITE;
/*!40000 ALTER TABLE `t_leave` DISABLE KEYS */;
INSERT INTO `t_leave` VALUES (14,'2017-09-20 08:46:21','2017-09-20 08:46:21','休假测试',4,0,'2017-09-20 20:46:29');
/*!40000 ALTER TABLE `t_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_menu`
--

DROP TABLE IF EXISTS `t_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuname` varchar(45) NOT NULL,
  `menuurl` varchar(45) DEFAULT NULL,
  `menuicon` varchar(45) DEFAULT NULL,
  `permissioncode` varchar(45) NOT NULL,
  `level` int(11) DEFAULT '1',
  `parentid` int(11) NOT NULL DEFAULT '0',
  `isdelete` int(11) DEFAULT '0',
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createuser` int(11) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `updateuser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_menu`
--

LOCK TABLES `t_menu` WRITE;
/*!40000 ALTER TABLE `t_menu` DISABLE KEYS */;
INSERT INTO `t_menu` VALUES (1,'工时管理',NULL,NULL,'tasktime/manager',1,0,0,'2017-09-18 09:07:47',1,NULL,NULL),(2,'工时添加',NULL,NULL,'tasktime/add',2,1,0,'2017-09-18 09:08:19',1,NULL,NULL),(3,'工时浏览',NULL,NULL,'tasktime/list',2,1,0,'2017-09-18 09:08:40',1,NULL,NULL),(4,'休假管理',NULL,NULL,'vacation/manager',1,0,0,'2017-09-18 09:09:06',1,NULL,NULL),(5,'休假申请',NULL,NULL,'vacation/add',2,4,0,'2017-09-18 09:09:28',1,NULL,NULL),(6,'待办任务',NULL,NULL,'vacation/apply',2,4,0,'2017-09-18 09:09:56',1,NULL,NULL),(7,'历史任务',NULL,NULL,'vacation/history',2,4,0,'2017-09-18 09:10:16',1,NULL,NULL),(8,'项目管理',NULL,NULL,'project/manager',1,0,0,'2017-09-18 09:10:42',1,NULL,NULL),(9,'新建项目',NULL,NULL,'project/add',2,8,0,'2017-09-18 09:11:26',1,NULL,NULL),(10,'浏览项目信息',NULL,NULL,'project/list',2,8,0,'2017-09-18 09:11:49',1,NULL,NULL),(11,'角色管理',NULL,NULL,'role/manager',1,0,0,'2017-09-18 09:12:16',1,NULL,NULL),(12,'新建角色',NULL,NULL,'role/add',2,11,0,'2017-09-18 09:12:41',1,NULL,NULL),(13,'浏览角色信息',NULL,NULL,'role/list',2,11,0,'2017-09-18 09:13:00',1,NULL,NULL),(14,'用户管理',NULL,NULL,'user/manager',1,0,0,'2017-09-18 09:13:21',1,NULL,NULL),(15,'新建用户',NULL,NULL,'user/add',2,14,0,'2017-09-18 09:13:46',1,NULL,NULL),(16,'浏览用户信息',NULL,NULL,'user/list',2,14,0,'2017-09-18 09:14:08',NULL,NULL,NULL),(17,'处理中的任务',NULL,NULL,'vacation/running',2,4,0,'2017-09-19 10:25:48',1,NULL,NULL);
/*!40000 ALTER TABLE `t_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(45) NOT NULL,
  `roledesc` varchar(45) DEFAULT NULL,
  `isdelete` int(11) NOT NULL DEFAULT '0',
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createuser` int(11) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `updateuser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_createuserid_idx` (`createuser`),
  KEY `fk_role_updateuserid_idx` (`updateuser`),
  CONSTRAINT `fk_role_createuserid` FOREIGN KEY (`createuser`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_updateuserid` FOREIGN KEY (`updateuser`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` VALUES (1,'admin','管理员',0,'2017-09-18 09:03:20',1,NULL,NULL),(2,'leader','部门领导',0,'2017-09-18 09:03:43',1,NULL,NULL),(3,'hr','部门人事',0,'2017-09-18 09:03:43',1,NULL,NULL),(4,'employee','普通员工',0,'2017-09-18 09:04:14',NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_menu`
--

DROP TABLE IF EXISTS `t_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NOT NULL,
  `menuid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_menuid_idx` (`roleid`),
  KEY `fk_menu_roleid_idx` (`menuid`),
  CONSTRAINT `fk_menu_roleid` FOREIGN KEY (`menuid`) REFERENCES `t_menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_menuid` FOREIGN KEY (`roleid`) REFERENCES `t_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_menu`
--

LOCK TABLES `t_role_menu` WRITE;
/*!40000 ALTER TABLE `t_role_menu` DISABLE KEYS */;
INSERT INTO `t_role_menu` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(33,2,1),(34,2,2),(35,2,3),(36,2,4),(37,2,5),(38,2,6),(39,2,7),(40,2,8),(41,2,9),(42,2,10),(43,2,11),(44,2,12),(45,2,13),(46,2,14),(47,2,15),(48,2,16),(49,3,4),(50,3,5),(51,3,6),(52,3,7),(53,4,1),(54,4,2),(55,4,3),(56,4,4),(57,4,5),(58,4,6),(59,4,7),(60,4,8),(61,4,9),(62,4,10),(63,4,11),(64,4,12),(65,4,13),(66,4,14),(67,4,15),(68,4,16),(69,4,17);
/*!40000 ALTER TABLE `t_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_user`
--

DROP TABLE IF EXISTS `t_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_user_id_idx` (`roleid`),
  KEY `fk_user_role_id_idx` (`userid`),
  CONSTRAINT `fk_role_user_id` FOREIGN KEY (`roleid`) REFERENCES `t_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_role_id` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_user`
--

LOCK TABLES `t_role_user` WRITE;
/*!40000 ALTER TABLE `t_role_user` DISABLE KEYS */;
INSERT INTO `t_role_user` VALUES (1,1,1),(2,4,4),(3,2,5),(4,3,6);
/*!40000 ALTER TABLE `t_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `useraccount` varchar(45) NOT NULL,
  `userpassword` varchar(64) NOT NULL,
  `realname` varchar(45) NOT NULL,
  `useremail` varchar(45) DEFAULT NULL,
  `usertel` varchar(45) DEFAULT NULL,
  `isdelete` int(11) NOT NULL DEFAULT '0',
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createuser` int(11) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `updateuser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_createuserid_idx` (`createuser`),
  KEY `fk_user_updateuserid_idx` (`updateuser`),
  CONSTRAINT `fk_user_createuserid` FOREIGN KEY (`createuser`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_updateuserid` FOREIGN KEY (`updateuser`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'admin','7c9c493e9f4a10859681abb4f2ffe7e461b29e71526600fedf98b4c437bbb116','阿娇',NULL,NULL,0,'2017-09-18 09:03:02',1,NULL,NULL),(4,'tester','7c9c493e9f4a10859681abb4f2ffe7e461b29e71526600fedf98b4c437bbb116','小明',NULL,NULL,0,'2017-09-18 09:05:14',1,NULL,NULL),(5,'leader','7c9c493e9f4a10859681abb4f2ffe7e461b29e71526600fedf98b4c437bbb116','张三',NULL,NULL,0,'2017-09-18 09:05:14',1,NULL,NULL),(6,'hr','7c9c493e9f4a10859681abb4f2ffe7e461b29e71526600fedf98b4c437bbb116','李四',NULL,NULL,0,'2017-09-18 09:05:14',1,NULL,NULL);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-20 21:02:43
