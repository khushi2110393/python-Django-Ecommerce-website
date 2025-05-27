-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: tables
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `Area_id` int NOT NULL,
  `Area_name` varchar(15) NOT NULL,
  PRIMARY KEY (`Area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add area',7,'add_area'),(26,'Can change area',7,'change_area'),(27,'Can delete area',7,'delete_area'),(28,'Can view area',7,'view_area'),(29,'Can add brand',8,'add_brand'),(30,'Can change brand',8,'change_brand'),(31,'Can delete brand',8,'delete_brand'),(32,'Can view brand',8,'view_brand'),(33,'Can add category',9,'add_category'),(34,'Can change category',9,'change_category'),(35,'Can delete category',9,'delete_category'),(36,'Can view category',9,'view_category'),(37,'Can add role',10,'add_role'),(38,'Can change role',10,'change_role'),(39,'Can delete role',10,'delete_role'),(40,'Can view role',10,'view_role'),(41,'Can add unit',11,'add_unit'),(42,'Can change unit',11,'change_unit'),(43,'Can delete unit',11,'delete_unit'),(44,'Can view unit',11,'view_unit'),(45,'Can add user',12,'add_customuser'),(46,'Can change user',12,'change_customuser'),(47,'Can delete user',12,'delete_customuser'),(48,'Can view user',12,'view_customuser'),(49,'Can add product',13,'add_product'),(50,'Can change product',13,'change_product'),(51,'Can delete product',13,'delete_product'),(52,'Can view product',13,'view_product'),(53,'Can add cart item',14,'add_cartitem'),(54,'Can change cart item',14,'change_cartitem'),(55,'Can delete cart item',14,'delete_cartitem'),(56,'Can view cart item',14,'view_cartitem'),(57,'Can add cart',15,'add_cart'),(58,'Can change cart',15,'change_cart'),(59,'Can delete cart',15,'delete_cart'),(60,'Can view cart',15,'view_cart');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$HrzGjIQfPdNA2uI7x8ZxP9$WBw7C75Rog6PrlG/i0sD8tdAbb9aP8fZJ4QX/DCAJSY=',NULL,0,'testuser','','','test@example.com',0,1,'2025-02-20 14:18:12.599425'),(2,'pbkdf2_sha256$870000$A01cWDvnWEbqau823n9woX$kfZqkUGeGYF1xg6V9LejgS0EnUQ1UzE3WCBPCGOTWwo=',NULL,0,'newuser','','','new@example.com',0,1,'2025-02-20 15:04:05.978529'),(3,'pbkdf2_sha256$870000$lk6QuMCJGCv9jqT3m2YSqc$GUNN843w70J88QqTM1V8b6AIDyWHmSGKYzIbv6XCERo=','2025-02-20 16:43:36.518692',0,'krish','','','krish@example.com',0,1,'2025-02-20 15:38:15.588394'),(4,'pbkdf2_sha256$870000$X6kuX4Eu4a6AotR4XKTmkv$oU092rrV1eFK6LMl4L0D5G3O0SfQ0IUA6IBPhbJC+d8=','2025-02-20 16:48:11.664956',1,'khushii','','','khushi@gmail.com',1,1,'2025-02-20 16:47:27.226696'),(5,'pbkdf2_sha256$870000$KSqxjMBHotHIwaXi7rHkmN$/ekXOYMl497/B7BBJxqkDlKbScsXqaTJaomc16nPiYc=','2025-02-21 07:39:37.513834',1,'karishma','','','karishma@gmail.com',1,1,'2025-02-21 05:21:46.976277'),(6,'pbkdf2_sha256$870000$DzbpmoLinShrbD1cFYNrU4$et58wm5ykUKxkwSdpoV96GJHiSNG/Wfsst9a+PRm5As=',NULL,1,'khushi','','','khushi@gmail.com',1,1,'2025-02-21 12:40:11.242943');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `Brand_id` int NOT NULL,
  `Brand_name` varchar(15) NOT NULL,
  PRIMARY KEY (`Brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `C_id` int NOT NULL,
  `User_id` int NOT NULL,
  `P_id` int NOT NULL,
  `C_date` date NOT NULL,
  `Total_amt` int NOT NULL,
  PRIMARY KEY (`C_id`),
  KEY `P_id` (`P_id`),
  KEY `User_id` (`User_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`P_id`) REFERENCES `product` (`P_id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `Cart_id` int NOT NULL,
  `P_id` int NOT NULL,
  `P_qty` int NOT NULL,
  `C_date` date NOT NULL,
  `Total_amt` int NOT NULL,
  PRIMARY KEY (`Cart_id`),
  KEY `P_id` (`P_id`),
  CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`P_id`) REFERENCES `product` (`P_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `Category_id` int NOT NULL,
  `Category_name` varchar(15) NOT NULL,
  PRIMARY KEY (`Category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
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
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'myapp','area'),(8,'myapp','brand'),(15,'myapp','cart'),(14,'myapp','cartitem'),(9,'myapp','category'),(12,'myapp','customuser'),(13,'myapp','product'),(10,'myapp','role'),(11,'myapp','unit'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-02-20 12:01:59.872329'),(2,'auth','0001_initial','2025-02-20 12:02:01.626079'),(3,'admin','0001_initial','2025-02-20 12:02:02.061894'),(4,'admin','0002_logentry_remove_auto_add','2025-02-20 12:02:02.077879'),(5,'admin','0003_logentry_add_action_flag_choices','2025-02-20 12:02:02.095226'),(6,'contenttypes','0002_remove_content_type_name','2025-02-20 12:02:02.305648'),(7,'auth','0002_alter_permission_name_max_length','2025-02-20 12:02:02.558894'),(8,'auth','0003_alter_user_email_max_length','2025-02-20 12:02:02.612134'),(9,'auth','0004_alter_user_username_opts','2025-02-20 12:02:02.625563'),(10,'auth','0005_alter_user_last_login_null','2025-02-20 12:02:02.774249'),(11,'auth','0006_require_contenttypes_0002','2025-02-20 12:02:02.782787'),(12,'auth','0007_alter_validators_add_error_messages','2025-02-20 12:02:02.797855'),(13,'auth','0008_alter_user_username_max_length','2025-02-20 12:02:02.976025'),(14,'auth','0009_alter_user_last_name_max_length','2025-02-20 12:02:03.180017'),(15,'auth','0010_alter_group_name_max_length','2025-02-20 12:02:03.225375'),(16,'auth','0011_update_proxy_permissions','2025-02-20 12:02:03.241500'),(17,'auth','0012_alter_user_first_name_max_length','2025-02-20 12:02:03.395308'),(18,'myapp','0001_initial','2025-02-20 12:02:06.133297'),(19,'myapp','0002_alter_customuser_username','2025-02-20 12:02:06.150450'),(20,'sessions','0001_initial','2025-02-20 12:02:06.231302'),(21,'myapp','0003_alter_area_area_name_alter_brand_brand_name_and_more','2025-02-21 12:39:37.999511');
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
INSERT INTO `django_session` VALUES ('11kdpsj9sreesbtyr9zuh77t488f90et','.eJxVjDsOwjAQBe_iGllZr9cfSnrOENnrNQmgRIqTCnF3iJQC2jcz76X6tK1DvzVZ-rGoszKgTr9jTvyQaSflnqbbrHme1mXMelf0QZu-zkWel8P9OxhSG741cjXS-dQFjFEc1VwjAnjrrOdKQmhsdkQBiBg6FEZTIGZGQONCUO8P7G026w:1tlpRs:BBPUjFgvSiINAQECQTWeoupty5k38vLq7dyScYuZO54','2025-03-08 13:21:40.587665'),('bw6s6fjqgoo1sxd7qketjmwtdch3uqwk','.eJxVjEEOwiAQRe_C2pAOzEzBpXvPQBigUjVtUtqV8e7apAvd_vfef6kQt7WGrZUljFmdlUF1-h0lpkeZdpLvcbrNOs3Tuoyid0UftOnrnMvzcrh_BzW2-q0BXM8chySOyCc2kBkFGHrkTvrsLKEnS4O1vkMvmAUICQYnnl006v0B1jI2mg:1tlkTb:DH0cLSKmkx41UF_2vkjekixonoD0ZFu4-lbtsGPeAYc','2025-03-08 08:03:07.342571');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `Feed_id` int NOT NULL,
  `Rating` float NOT NULL,
  `Feedback` varchar(99) NOT NULL,
  `Feedback_date` date NOT NULL,
  `User_id` int NOT NULL,
  `O_id` int NOT NULL,
  `P_id` int NOT NULL,
  KEY `User_id` (`User_id`),
  KEY `O_id` (`O_id`),
  KEY `P_id` (`P_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`O_id`) REFERENCES `orders` (`O_id`),
  CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`P_id`) REFERENCES `product` (`P_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_area`
--

DROP TABLE IF EXISTS `myapp_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_area` (
  `area_id` int NOT NULL AUTO_INCREMENT,
  `area_name` varchar(15) NOT NULL,
  PRIMARY KEY (`area_id`),
  UNIQUE KEY `myapp_area_area_name_021e1b03_uniq` (`area_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_area`
--

LOCK TABLES `myapp_area` WRITE;
/*!40000 ALTER TABLE `myapp_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapp_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_brand`
--

DROP TABLE IF EXISTS `myapp_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_brand` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(15) NOT NULL,
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `myapp_brand_brand_name_e96da3a8_uniq` (`brand_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_brand`
--

LOCK TABLES `myapp_brand` WRITE;
/*!40000 ALTER TABLE `myapp_brand` DISABLE KEYS */;
INSERT INTO `myapp_brand` VALUES (4,'L\'Oreal'),(2,'Lakme'),(5,'MAC'),(3,'Maybelline'),(6,'Revlon');
/*!40000 ALTER TABLE `myapp_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_cart`
--

DROP TABLE IF EXISTS `myapp_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_cart` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `c_date` date NOT NULL,
  `total_amt` decimal(10,2) NOT NULL,
  `user_id` bigint NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `myapp_cart_user_id_d6c51e4b_fk_myapp_customuser_id` (`user_id`),
  KEY `myapp_cart_product_id_8e7aeeb3_fk_myapp_product_p_id` (`product_id`),
  CONSTRAINT `myapp_cart_product_id_8e7aeeb3_fk_myapp_product_p_id` FOREIGN KEY (`product_id`) REFERENCES `myapp_product` (`p_id`),
  CONSTRAINT `myapp_cart_user_id_d6c51e4b_fk_myapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_cart`
--

LOCK TABLES `myapp_cart` WRITE;
/*!40000 ALTER TABLE `myapp_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapp_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_cartitem`
--

DROP TABLE IF EXISTS `myapp_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_cartitem` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `p_qty` int unsigned NOT NULL,
  `c_date` date NOT NULL,
  `total_amt` decimal(10,2) NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `myapp_cartitem_product_id_4e665953_fk_myapp_product_p_id` (`product_id`),
  CONSTRAINT `myapp_cartitem_product_id_4e665953_fk_myapp_product_p_id` FOREIGN KEY (`product_id`) REFERENCES `myapp_product` (`p_id`),
  CONSTRAINT `myapp_cartitem_p_qty_db5f0ad9_check` CHECK ((`p_qty` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_cartitem`
--

LOCK TABLES `myapp_cartitem` WRITE;
/*!40000 ALTER TABLE `myapp_cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapp_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_category`
--

DROP TABLE IF EXISTS `myapp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(15) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `myapp_category_category_name_33c250d6_uniq` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_category`
--

LOCK TABLES `myapp_category` WRITE;
/*!40000 ALTER TABLE `myapp_category` DISABLE KEYS */;
INSERT INTO `myapp_category` VALUES (10,'Accessories'),(9,'Body'),(6,'Eyes'),(5,'Face'),(8,'Hair'),(7,'Lips'),(2,'Nails');
/*!40000 ALTER TABLE `myapp_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_customuser`
--

DROP TABLE IF EXISTS `myapp_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_no` varchar(15) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `area_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `contact_no` (`contact_no`),
  KEY `myapp_customuser_area_id_d05e6db0_fk_myapp_area_area_id` (`area_id`),
  KEY `myapp_customuser_role_id_1ba733f1_fk_myapp_role_role_id` (`role_id`),
  CONSTRAINT `myapp_customuser_area_id_d05e6db0_fk_myapp_area_area_id` FOREIGN KEY (`area_id`) REFERENCES `myapp_area` (`area_id`),
  CONSTRAINT `myapp_customuser_role_id_1ba733f1_fk_myapp_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `myapp_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_customuser`
--

LOCK TABLES `myapp_customuser` WRITE;
/*!40000 ALTER TABLE `myapp_customuser` DISABLE KEYS */;
INSERT INTO `myapp_customuser` VALUES (1,'pbkdf2_sha256$870000$rCUHqZw0G6N27PZxCYDFNR$TzkuMYpvG8vWv0IzaZPh9pzlQbJhDhOo8fplP/5oGeo=',NULL,0,'vedant','','',0,1,'2025-02-20 12:49:10.197566','vedant@gmail.com','4563756453','krishnadham society','Male',NULL,NULL),(2,'pbkdf2_sha256$870000$mgA2IojnkfQoebRHHu9Oi6$cTebQ/enfqmVxLBahcFXHUQsukPvr1yFbeB7ebDKSXg=',NULL,0,'dharmi','','',0,1,'2025-02-20 12:54:58.533058','dharmi@gmail.com','4563423456','aksharvilla society','Female',NULL,NULL),(3,'pbkdf2_sha256$870000$3jQDOmTIZPobVfxS3p6eqR$mWE2rs8fQWT46XTs+oUfkEc5zs8OwjuHa8tVckBrtk0=',NULL,0,'kavita','','',0,1,'2025-02-20 13:00:33.016623','kavita@gmail.com','5647345679','b-11 dwarkesh society','Female',NULL,NULL),(4,'pbkdf2_sha256$870000$2t12Yuc14euHQjmbDnUNs7$ZnUgnFnsfo+hW8VUq7erlegyugr/CptI9XulUH6cc18=',NULL,0,'jansi','','',0,1,'2025-02-20 13:14:18.892823','jansi@gmail.com','2341237655','krishnavilaa society','Female',NULL,NULL),(5,'pbkdf2_sha256$870000$iUNYR8kPiy6nUX1Z97mzFP$1o1Nz+EljsJ2VT1IJ9Y0FbG1ihYhZQ9r3rvQEVoXOm4=',NULL,0,'krishna','','',0,1,'2025-02-20 13:22:21.752083','krishna@gmail.com','1230984567','krishnadham society','Male',NULL,NULL),(6,'pbkdf2_sha256$870000$mCgORm37KQvYq6gnyjuIsu$sETYjOgscwfMvEpLekADFk2ES6zjsYAM9D3jJm46MiY=',NULL,0,'devangi','','',0,1,'2025-02-20 13:42:59.787365','devi@gmail.com','9586805641','sadhna society','Female',NULL,NULL),(7,'pbkdf2_sha256$870000$1gHlYOAc3yWHDPq7pqZjP4$321uY1/WvlEvzPGg87V0o29+duXXAM21quS24VrbjYk=',NULL,0,'sangeeta','','',0,1,'2025-02-20 14:02:04.937807','sangeeta@gmail.com','4567845632','avkar society','Female',NULL,NULL),(8,'pbkdf2_sha256$870000$a8qeDcNTDic21oyOetzR2V$mEo6bUQr3FR3MGinEJcj5Uu64dCdQDH6ip139qKUwHU=',NULL,0,'jinal','','',0,1,'2025-02-20 14:22:21.438630','jinal@gmail.com','1238764534','surdhara society','Female',NULL,NULL),(9,'pbkdf2_sha256$870000$SLdc0vXB3uYXQB6UJXBmb6$8RaMhyKQlEs8rANEe7ui+Chz2HdyhKZ6QWu35JOPbJk=',NULL,0,'ujas','','',0,1,'2025-02-20 14:45:47.742119','ujas@gmail.com','5674563453','kelvanidham','Male',NULL,NULL),(10,'pbkdf2_sha256$870000$nvy558HmXQZ0EuBDuxmadN$mjHuJkdmwAzWlhtem+vmDHOEXL+JEZr7eq53MeSNlmI=',NULL,0,'priya','','',0,1,'2025-02-20 14:51:03.280528','priya@gmail.com','5675432456','gokul appartent','Female',NULL,NULL),(11,'pbkdf2_sha256$870000$R57P5R2GjK9eQBoej4IL0j$4f0Jap0afP7hgiMfTJjP7EJNYKFDQzbK4TQKizlD7gg=',NULL,0,'priyanshu','','',0,1,'2025-02-20 15:11:12.797872','priyanshu@gmail.com','5674563423','krishna appertment','Male',NULL,NULL),(12,'pbkdf2_sha256$870000$3cayzwRrHY2fBir32zayPM$j5TNSV6ookN/094P8AUsHntG88P1gUmFj7RTLR29rH8=',NULL,0,'bansi','','',0,1,'2025-02-20 15:20:48.367355','basi@gmail.com','4563452345','ankur society','Female',NULL,NULL),(13,'pbkdf2_sha256$870000$a3W3HQJaJbhH4ypRnXIrXT$HO8Y8LbbpK8K4hZa4YXmz+jBCIoKVJp2U6qsJARh+OM=',NULL,0,'krish','','',0,1,'2025-02-20 15:32:21.851215','krish@gmail.com','5674563456','ami dhara','Male',NULL,NULL),(14,'pbkdf2_sha256$870000$4KPPI3FleJr2e5IGWrV1AE$TJUP/S1HjVr7d5UCTNFdzJ5PvpVKE2m/v8DlNxZ+LDE=','2025-02-21 13:41:40.376513',0,'vaibhav','','',0,1,'2025-02-21 13:41:28.816127','vaibhav@gmail.com','8765674534','khosiyar flat','Male',NULL,NULL),(15,'pbkdf2_sha256$870000$hxUc4BCX9LWW0JpFrsm5OL$0KNKG7HbkPI/YQw+FPCs5+vMmVWXmNhEyQKGXsB0qGo=','2025-02-21 14:12:13.567359',1,'karishma','','',1,1,'2025-02-21 14:11:36.776856','karishma@gmail.com',NULL,NULL,NULL,NULL,NULL),(16,'pbkdf2_sha256$870000$NsJ162O22Ieiym45CxhkJr$HE5uOklvKQRptn1b4hQ7WC13VFt6lQZQ41/OF+/P7jE=',NULL,1,'nidhi','','',1,1,'2025-02-21 14:38:27.186329','nidhi@gmail.com',NULL,NULL,NULL,NULL,NULL),(17,'pbkdf2_sha256$870000$SKwXi6LuiAAfuOa4jHUBKz$8WkqUTy3O2COROQDGz1xw4yUwUAoT8OrKSInvGXIQU0=',NULL,1,'khushii','','',1,1,'2025-02-21 14:39:36.411946','khushi@gmail.com',NULL,NULL,NULL,NULL,NULL),(19,'pbkdf2_sha256$870000$3NjNcyeM4LS3pkjCy1mais$Czxc/E871jMMElJurUck5vrh+pZgVVarVFItX34rehk=','2025-02-21 16:42:09.677783',1,'foram','','',1,1,'2025-02-21 16:40:13.759174','foram@gmail.com',NULL,NULL,NULL,NULL,NULL),(20,'pbkdf2_sha256$870000$914RRDYZuDpg3lrAWRp33T$k+5CzRFt8ruABQtf4s6VA2p1GG3jbB8i0D4VtmNM+/U=','2025-02-21 16:41:49.123905',0,'kavya','','',0,1,'2025-02-21 16:41:35.622096','kavya@gmail.com','2341237651','amikunj residency','Female',NULL,NULL),(21,'pbkdf2_sha256$870000$Extw2yMP2lUpeZE3NYQEsX$UZIPB8la2iQZdMB502MpeccEM38Q7QCW8YnidJ6qZ+M=','2025-02-22 13:21:40.574857',1,'admin','','',1,1,'2025-02-22 07:20:12.597133','admin@gmail.com',NULL,NULL,NULL,NULL,NULL),(22,'pbkdf2_sha256$870000$MDOhnHxkqXrHCOTUprl6KQ$WoVzqv3zbguD6amkriz+rJVOao/hIuitRfRxydHhATM=','2025-02-22 07:23:28.501509',0,'netra','','',0,1,'2025-02-22 07:23:14.570962','netra@gmail.com','6754564351','amikunj society','Female',NULL,NULL),(23,'pbkdf2_sha256$870000$cpfI009FsOeoZUS1g8p19a$tLcvmNxwecGCisx4VvuyYIyjwgZUSTc+A1QlpGR2uoU=',NULL,0,'nensi','','',0,1,'2025-02-22 08:01:04.233505','neni@gmail.com','5647864532','gokul appartment','Female',NULL,NULL),(24,'pbkdf2_sha256$870000$8lMu8aaFnzQGOKcDmjq368$DzB4o7oHVYc4fIANWAtUNmTloi7AC2SHGVigFEoyJsU=','2025-02-22 08:03:07.331567',0,'siddhi','','',0,1,'2025-02-22 08:02:54.229630','siddhi@gmail.com','4537864534','avkar society thakkar nagar','Female',NULL,NULL);
/*!40000 ALTER TABLE `myapp_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_customuser_groups`
--

DROP TABLE IF EXISTS `myapp_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myapp_customuser_groups_customuser_id_group_id_8dfb17af_uniq` (`customuser_id`,`group_id`),
  KEY `myapp_customuser_groups_group_id_9a436a56_fk_auth_group_id` (`group_id`),
  CONSTRAINT `myapp_customuser_gro_customuser_id_4b46b787_fk_myapp_cus` FOREIGN KEY (`customuser_id`) REFERENCES `myapp_customuser` (`id`),
  CONSTRAINT `myapp_customuser_groups_group_id_9a436a56_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_customuser_groups`
--

LOCK TABLES `myapp_customuser_groups` WRITE;
/*!40000 ALTER TABLE `myapp_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapp_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_customuser_user_permissions`
--

DROP TABLE IF EXISTS `myapp_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myapp_customuser_user_pe_customuser_id_permission_a9e136bb_uniq` (`customuser_id`,`permission_id`),
  KEY `myapp_customuser_use_permission_id_4ffda77e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `myapp_customuser_use_customuser_id_afabd7b0_fk_myapp_cus` FOREIGN KEY (`customuser_id`) REFERENCES `myapp_customuser` (`id`),
  CONSTRAINT `myapp_customuser_use_permission_id_4ffda77e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_customuser_user_permissions`
--

LOCK TABLES `myapp_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `myapp_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapp_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_product`
--

DROP TABLE IF EXISTS `myapp_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_product` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_name` varchar(20) NOT NULL,
  `p_price` decimal(10,2) NOT NULL,
  `p_description` varchar(70) DEFAULT NULL,
  `p_img` varchar(100) DEFAULT NULL,
  `p_qty` int unsigned NOT NULL,
  `brand_id` int NOT NULL,
  `category_id` int NOT NULL,
  `unit_id` int NOT NULL,
  PRIMARY KEY (`p_id`),
  UNIQUE KEY `myapp_product_p_name_8bd58446_uniq` (`p_name`),
  KEY `myapp_product_brand_id_065003a9_fk_myapp_brand_brand_id` (`brand_id`),
  KEY `myapp_product_category_id_f672ddc0_fk_myapp_category_category_id` (`category_id`),
  KEY `myapp_product_unit_id_9d871090_fk_myapp_unit_unit_id` (`unit_id`),
  CONSTRAINT `myapp_product_brand_id_065003a9_fk_myapp_brand_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `myapp_brand` (`brand_id`),
  CONSTRAINT `myapp_product_category_id_f672ddc0_fk_myapp_category_category_id` FOREIGN KEY (`category_id`) REFERENCES `myapp_category` (`category_id`),
  CONSTRAINT `myapp_product_unit_id_9d871090_fk_myapp_unit_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `myapp_unit` (`unit_id`),
  CONSTRAINT `myapp_product_p_qty_2fe14258_check` CHECK ((`p_qty` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_product`
--

LOCK TABLES `myapp_product` WRITE;
/*!40000 ALTER TABLE `myapp_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapp_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_role`
--

DROP TABLE IF EXISTS `myapp_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(10) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `myapp_role_role_name_c848a883_uniq` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_role`
--

LOCK TABLES `myapp_role` WRITE;
/*!40000 ALTER TABLE `myapp_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapp_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_unit`
--

DROP TABLE IF EXISTS `myapp_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_unit` (
  `unit_id` int NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(15) NOT NULL,
  PRIMARY KEY (`unit_id`),
  UNIQUE KEY `myapp_unit_unit_name_c9a52dd0_uniq` (`unit_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_unit`
--

LOCK TABLES `myapp_unit` WRITE;
/*!40000 ALTER TABLE `myapp_unit` DISABLE KEYS */;
INSERT INTO `myapp_unit` VALUES (2,'g'),(1,'ml'),(4,'pack'),(3,'pcs');
/*!40000 ALTER TABLE `myapp_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `Oi_id` int NOT NULL,
  `Oi_qty` int NOT NULL,
  `P_id` int NOT NULL,
  `O_id` int NOT NULL,
  PRIMARY KEY (`Oi_id`),
  KEY `P_id` (`P_id`),
  KEY `O_id` (`O_id`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`P_id`) REFERENCES `product` (`P_id`),
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`O_id`) REFERENCES `orders` (`O_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `O_id` int NOT NULL,
  `O_date` date NOT NULL,
  `Area_id` int NOT NULL,
  `User_id` int NOT NULL,
  PRIMARY KEY (`O_id`),
  KEY `Area_id` (`Area_id`),
  KEY `User_id` (`User_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Area_id`) REFERENCES `area` (`Area_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `P_id` int NOT NULL,
  `Category_id` int NOT NULL,
  `Brand_id` int NOT NULL,
  `Unit_id` int NOT NULL,
  `P_name` varchar(20) NOT NULL,
  `p_price` int NOT NULL,
  `p_descriptipn` varchar(70) NOT NULL,
  `p_img` varchar(100) NOT NULL,
  `p_qty` int NOT NULL,
  PRIMARY KEY (`P_id`),
  KEY `Category_id` (`Category_id`),
  KEY `Brand_id` (`Brand_id`),
  KEY `Unit_id` (`Unit_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Category_id`) REFERENCES `category` (`Category_id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`Brand_id`) REFERENCES `brand` (`Brand_id`),
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`Unit_id`) REFERENCES `unit` (`Unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `Role_id` int NOT NULL,
  `Role_name` varchar(10) NOT NULL,
  PRIMARY KEY (`Role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit` (
  `Unit_id` int NOT NULL,
  `Unit_name` varchar(15) NOT NULL,
  PRIMARY KEY (`Unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `User_id` int NOT NULL,
  `Pasword` varchar(10) NOT NULL,
  `Email_id` varchar(15) DEFAULT NULL,
  `Address` varchar(30) NOT NULL,
  `Area_id` int NOT NULL,
  `Contact_no` int NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `Role_id` int NOT NULL,
  PRIMARY KEY (`User_id`),
  UNIQUE KEY `Email_id` (`Email_id`),
  KEY `Area_id` (`Area_id`),
  KEY `Role_id` (`Role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`Area_id`) REFERENCES `area` (`Area_id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`Role_id`) REFERENCES `roles` (`Role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-22 19:46:44
