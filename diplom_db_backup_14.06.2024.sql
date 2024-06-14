-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: diplom
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `additives`
--

DROP TABLE IF EXISTS `additives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `additives` (
  `idadditives` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `active` tinyint DEFAULT NULL,
  PRIMARY KEY (`idadditives`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additives`
--

LOCK TABLES `additives` WRITE;
/*!40000 ALTER TABLE `additives` DISABLE KEYS */;
INSERT INTO `additives` VALUES (1,'лаванда',20,'сироп',1),(5,'шоколад',20,'сироп',0),(6,'карамель',20,'сироп',1),(7,'клубника',20,'сироп',1);
/*!40000 ALTER TABLE `additives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (3,'barista'),(4,'director'),(2,'Персонал'),(1,'Управление');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,2,21);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add additives',7,'add_additives'),(26,'Can change additives',7,'change_additives'),(27,'Can delete additives',7,'delete_additives'),(28,'Can view additives',7,'view_additives'),(29,'Can add deserts',8,'add_deserts'),(30,'Can change deserts',8,'change_deserts'),(31,'Can delete deserts',8,'delete_deserts'),(32,'Can view deserts',8,'view_deserts'),(33,'Can add menu',9,'add_menu'),(34,'Can change menu',9,'change_menu'),(35,'Can delete menu',9,'delete_menu'),(36,'Can view menu',9,'view_menu'),(37,'Can add stock',10,'add_stock'),(38,'Can change stock',10,'change_stock'),(39,'Can delete stock',10,'delete_stock'),(40,'Can view stock',10,'view_stock'),(41,'Can add task',11,'add_task'),(42,'Can change task',11,'change_task'),(43,'Can delete task',11,'delete_task'),(44,'Can view task',11,'view_task'),(45,'Can add user',12,'add_user'),(46,'Can change user',12,'change_user'),(47,'Can delete user',12,'delete_user'),(48,'Can view user',12,'view_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$IoXq4VlaktCnN57B0e4Bzj$LE4LpKcbrW+3RXNNMBvA7he3VIAsZITeQFuV4eUJsig=','2024-06-09 16:17:22.667656',1,'admin','sdfgыва','asdf','admin@admin.ru',1,1,'2024-06-09 13:12:10.074913'),(4,'pbkdf2_sha256$600000$J3n2uaOk61pr10gXjN7P2m$+E3L05gxyImE87KT337jKybIiCQcfukmbpHZ3tPK3CQ=','2024-06-13 18:59:23.570566',0,'test_dir','asdf','asdfasd','',0,1,'2024-06-09 16:20:07.000000'),(5,'pbkdf2_sha256$600000$SfawFfTtsrm2VUJErDxb6H$iZWyDRGliZLhmBbCk5OCPNTchTx9f7X+80Sh43TKn6c=',NULL,0,'fffff','ffff','ffff','',0,1,'2024-06-09 17:29:31.524077'),(6,'pbkdf2_sha256$600000$SDtWxr9pifm8B0IBYHqSpw$9UA1UJiF7TRVck4SNHamOX0pn1rxcGc+zf8KuFLUuOY=',NULL,0,'sdfsdf','sdfsdf','sdfsdf','',0,1,'2024-06-09 17:34:43.331080'),(9,'111','2024-06-13 18:26:18.545667',0,'рыба1','Илья','Максименко','',0,1,'2024-06-10 12:34:28.526018'),(10,'',NULL,0,'корманная_тян','Надя1','Грицюк','',0,1,'2024-06-13 07:43:45.691106'),(17,'222',NULL,0,'трудяга','Саша','Купрацевич','',0,1,'2024-06-13 07:55:24.140655'),(21,'pbkdf2_sha256$600000$s2RhD0e2UALM5RuiHVhe7W$4GleoDVDpYCL7RaAaR6WPWmHNx+RH3jKiPWgnQTX+ls=','2024-06-14 19:07:29.842786',0,'бариста','бариста','бариста','',0,1,'2024-06-13 19:01:55.254730');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (5,4,4),(8,9,3),(9,10,3),(13,17,3),(15,21,3);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `border`
--

DROP TABLE IF EXISTS `border`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `border` (
  `idborder` int NOT NULL AUTO_INCREMENT,
  `idproduct` int DEFAULT NULL,
  `idstock` int DEFAULT NULL,
  `idklient` int DEFAULT NULL,
  `total_prise` float DEFAULT NULL,
  PRIMARY KEY (`idborder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `border`
--

LOCK TABLES `border` WRITE;
/*!40000 ALTER TABLE `border` DISABLE KEYS */;
/*!40000 ALTER TABLE `border` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chek`
--

DROP TABLE IF EXISTS `chek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chek` (
  `idchek` int NOT NULL AUTO_INCREMENT,
  `iduser` int DEFAULT NULL,
  `idborder` int DEFAULT NULL,
  `total_prise` float DEFAULT NULL,
  PRIMARY KEY (`idchek`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chek`
--

LOCK TABLES `chek` WRITE;
/*!40000 ALTER TABLE `chek` DISABLE KEYS */;
/*!40000 ALTER TABLE `chek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deserts`
--

DROP TABLE IF EXISTS `deserts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deserts` (
  `iddeserts` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `active` tinyint DEFAULT NULL,
  PRIMARY KEY (`iddeserts`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deserts`
--

LOCK TABLES `deserts` WRITE;
/*!40000 ALTER TABLE `deserts` DISABLE KEYS */;
INSERT INTO `deserts` VALUES (18,'gfhgb',6000,'ewrsgg',0),(19,'шоколадка',40,'',1),(20,'арбуз',133,'арбуз',NULL);
/*!40000 ALTER TABLE `deserts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-06-09 13:18:37.478260','5','User object (5)',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',12,1),(2,'2024-06-09 13:22:16.082467','1','Управление',1,'[{\"added\": {}}]',3,1),(3,'2024-06-09 13:23:45.209135','2','Персонал',1,'[{\"added\": {}}]',3,1),(4,'2024-06-09 13:24:47.522748','2','антон',1,'[{\"added\": {}}]',4,1),(5,'2024-06-09 13:25:09.626603','2','антон',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(6,'2024-06-09 13:26:33.787570','2','test42',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',4,1),(7,'2024-06-09 13:26:52.775823','2','test42',3,'',4,1),(8,'2024-06-09 13:27:22.180655','3','test42',1,'[{\"added\": {}}]',4,1),(9,'2024-06-09 13:27:29.590008','3','test42',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(10,'2024-06-09 13:28:14.816913','3','test42',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]',4,1),(11,'2024-06-09 13:28:35.603235','3','test42',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(12,'2024-06-09 15:37:37.633503','3','barista',1,'[{\"added\": {}}]',3,1),(13,'2024-06-09 15:38:39.674249','3','test42',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(14,'2024-06-09 16:17:30.193067','3','barista',2,'[]',3,1),(15,'2024-06-09 16:18:38.318518','4','director',1,'[{\"added\": {}}]',3,1),(16,'2024-06-09 16:20:08.067757','4','test_dir',1,'[{\"added\": {}}]',4,1),(17,'2024-06-09 16:20:29.030278','4','test_dir',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'main','additives'),(8,'main','deserts'),(9,'main','menu'),(10,'main','stock'),(11,'main','task'),(12,'main','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-06-09 13:05:33.890760'),(2,'auth','0001_initial','2024-06-09 13:05:35.846292'),(3,'admin','0001_initial','2024-06-09 13:05:36.274804'),(4,'admin','0002_logentry_remove_auto_add','2024-06-09 13:05:36.288343'),(5,'admin','0003_logentry_add_action_flag_choices','2024-06-09 13:05:36.303931'),(6,'contenttypes','0002_remove_content_type_name','2024-06-09 13:05:36.497565'),(7,'auth','0002_alter_permission_name_max_length','2024-06-09 13:05:36.656402'),(8,'auth','0003_alter_user_email_max_length','2024-06-09 13:05:36.702055'),(9,'auth','0004_alter_user_username_opts','2024-06-09 13:05:36.715402'),(10,'auth','0005_alter_user_last_login_null','2024-06-09 13:05:36.875621'),(11,'auth','0006_require_contenttypes_0002','2024-06-09 13:05:36.887858'),(12,'auth','0007_alter_validators_add_error_messages','2024-06-09 13:05:36.904434'),(13,'auth','0008_alter_user_username_max_length','2024-06-09 13:05:37.095860'),(14,'auth','0009_alter_user_last_name_max_length','2024-06-09 13:05:37.332183'),(15,'auth','0010_alter_group_name_max_length','2024-06-09 13:05:37.371600'),(16,'auth','0011_update_proxy_permissions','2024-06-09 13:05:37.389224'),(17,'auth','0012_alter_user_first_name_max_length','2024-06-09 13:05:37.593974'),(18,'main','0001_initial','2024-06-09 13:05:37.606753'),(19,'sessions','0001_initial','2024-06-09 13:05:37.696711');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1rq17v1245sekq0kqs9p7u81gnpjqyfi','.eJxVjEEOwiAQRe_C2pAOFAIu3XsGMsxMpWogKe3KeHdt0oVu_3vvv1TCbS1p67KkmdVZWXX63TLSQ-oO-I711jS1ui5z1ruiD9r1tbE8L4f7d1Cwl2-NNBKMDAR-ILFiY-QgkSEyGZIBY0T0ZnJABsQxugwSsreThcBW1PsDBFY4uA:1sGKdz:3appBYic65Yr_WOyfaaYYxurCD1Xk7zCsOK9rHtxg84','2024-06-23 15:39:43.133951'),('4us65grkkcrsr97o6wo2oiik19afl55f','.eJxVjDsOwjAQBe_iGlnrJf5R0ucMlr3e4ACypTipEHeHSCmgfTPzXiLEbS1h67yEOYuLQCVOv2OK9OC6k3yP9dYktbouc5K7Ig_a5dgyP6-H-3dQYi_fGoymZLVhckDGQ3Z6SqhZG6vQkI-IHrNHYKtJnXECGNigHdh55WwU7w_p5Tbx:1sHpwQ:ILIdTRJsypSX5mf7UY9w0Q60etq3HoypasJPddfOm8o','2024-06-27 19:16:58.031817'),('mwreaq4zzwstj72pt25nm6vbndrzmsag','.eJxVjEEOgjAQRe_StWmmUNsZl-45A5nOtIIaSCisjHdXEha6_e-9_zI9b-vQbzUv_ajmYsicfrfE8sjTDvTO0222Mk_rMia7K_ag1Xaz5uf1cP8OBq7Dt3YB1UMLJbUIGDJjjKDkAFwhJPKAHsCLR9SiiSJLCdRgEDw34ti8P7JiNs8:1sGeEo:-O4wZ3-gw5ZnjSb82z2IER7qYlbHwesgiZXSzvTEd40','2024-06-24 12:35:02.680243'),('myukvgc5ppn38fqdlal3xel3z9xazjb4','.eJxVjDsOwjAQBe_iGlnrJf5R0ucMlr3e4ACypTipEHeHSCmgfTPzXiLEbS1h67yEOYuLQCVOv2OK9OC6k3yP9dYktbouc5K7Ig_a5dgyP6-H-3dQYi_fGoymZLVhckDGQ3Z6SqhZG6vQkI-IHrNHYKtJnXECGNigHdh55WwU7w_p5Tbx:1sICGn:sBDa7soICzg8DoTCbp25pTbfCUGjqJuQshBYejhbX4Y','2024-06-28 19:07:29.857280'),('zugthus8p7xa9m9rgpkqdu6x27i5q040','.eJxVjEEOwiAQRe_C2pAOFAIu3XsGMsxMpWogKe3KeHdt0oVu_3vvv1TCbS1p67KkmdVZWXX63TLSQ-oO-I711jS1ui5z1ruiD9r1tbE8L4f7d1Cwl2-NNBKMDAR-ILFiY-QgkSEyGZIBY0T0ZnJABsQxugwSsreThcBW1PsDBFY4uA:1sGIav:g7E1cr7WnXmFcc1yLRHgkrNXXNJlMO46KBuJ5mZlYjQ','2024-06-23 13:28:25.285834');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klients`
--

DROP TABLE IF EXISTS `klients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klients` (
  `idklients` int NOT NULL AUTO_INCREMENT,
  `klient_name` varchar(45) DEFAULT NULL,
  `klient_sername` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idklients`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klients`
--

LOCK TABLES `klients` WRITE;
/*!40000 ALTER TABLE `klients` DISABLE KEYS */;
/*!40000 ALTER TABLE `klients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `idmenu` int NOT NULL AUTO_INCREMENT,
  `position_name` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `description` varchar(45) NOT NULL,
  `active` tinyint DEFAULT '1',
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (12,'adsf',222,'asdf',1,'asf'),(13,'555',322,'dfg',0,'dfgdf'),(14,'чай',223234,'eee',1,'чай'),(15,'Раф большой',189,'кофе с сливками',NULL,'кофе');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `idstock` int NOT NULL AUTO_INCREMENT,
  `stockc_name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`idstock`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (23,'asdfasdf',222.00,'asdfasdf'),(27,'trrjh',44.00,'dhudrju');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_old`
--

DROP TABLE IF EXISTS `stock_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_old` (
  `idstock` int NOT NULL,
  `stockc_name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`idstock`),
  UNIQUE KEY `idstock_UNIQUE` (`idstock`) /*!80000 INVISIBLE */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_old`
--

LOCK TABLES `stock_old` WRITE;
/*!40000 ALTER TABLE `stock_old` DISABLE KEYS */;
INSERT INTO `stock_old` VALUES (1000,'My Stock','My stock description',123.45);
/*!40000 ALTER TABLE `stock_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `idtask` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`idtask`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'222'),(26,'задание1'),(31,'помыть кофемашину');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `sername` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Игнат','Потапов','ввв@mail.ru','111'),(2,'Юляmhjjgkh','Романоваjjhgjhg','jп@mail.ru','222'),(5,'Ильядл','Максименко','аярыба@mail.ru','ырерке'),(6,'Илья','Максименко','аярыба@mail.ru','gfhjkm');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-14 22:18:12
