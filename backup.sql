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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add area',6,'add_area'),(22,'Can change area',6,'change_area'),(23,'Can delete area',6,'delete_area'),(24,'Can view area',6,'view_area'),(25,'Can add brand',7,'add_brand'),(26,'Can change brand',7,'change_brand'),(27,'Can delete brand',7,'delete_brand'),(28,'Can view brand',7,'view_brand'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add role',9,'add_role'),(34,'Can change role',9,'change_role'),(35,'Can delete role',9,'delete_role'),(36,'Can view role',9,'view_role'),(37,'Can add unit',10,'add_unit'),(38,'Can change unit',10,'change_unit'),(39,'Can delete unit',10,'delete_unit'),(40,'Can view unit',10,'view_unit'),(41,'Can add user',11,'add_customuser'),(42,'Can change user',11,'change_customuser'),(43,'Can delete user',11,'delete_customuser'),(44,'Can view user',11,'view_customuser'),(45,'Can add address',12,'add_address'),(46,'Can change address',12,'change_address'),(47,'Can delete address',12,'delete_address'),(48,'Can view address',12,'view_address'),(49,'Can add cart',13,'add_cart'),(50,'Can change cart',13,'change_cart'),(51,'Can delete cart',13,'delete_cart'),(52,'Can view cart',13,'view_cart'),(53,'Can add order',14,'add_order'),(54,'Can change order',14,'change_order'),(55,'Can delete order',14,'delete_order'),(56,'Can view order',14,'view_order'),(57,'Can add payment',15,'add_payment'),(58,'Can change payment',15,'change_payment'),(59,'Can delete payment',15,'delete_payment'),(60,'Can view payment',15,'view_payment'),(61,'Can add product',16,'add_product'),(62,'Can change product',16,'change_product'),(63,'Can delete product',16,'delete_product'),(64,'Can view product',16,'view_product'),(65,'Can add order item',17,'add_orderitem'),(66,'Can change order item',17,'change_orderitem'),(67,'Can delete order item',17,'delete_orderitem'),(68,'Can view order item',17,'view_orderitem'),(69,'Can add cart item',18,'add_cartitem'),(70,'Can change cart item',18,'change_cartitem'),(71,'Can delete cart item',18,'delete_cartitem'),(72,'Can view cart item',18,'view_cartitem'),(73,'Can add wishlist',19,'add_wishlist'),(74,'Can change wishlist',19,'change_wishlist'),(75,'Can delete wishlist',19,'delete_wishlist'),(76,'Can view wishlist',19,'view_wishlist');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_myapp_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_myapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(12,'myapp','address'),(6,'myapp','area'),(7,'myapp','brand'),(13,'myapp','cart'),(18,'myapp','cartitem'),(8,'myapp','category'),(11,'myapp','customuser'),(14,'myapp','order'),(17,'myapp','orderitem'),(15,'myapp','payment'),(16,'myapp','product'),(9,'myapp','role'),(10,'myapp','unit'),(19,'myapp','wishlist'),(5,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-02-23 14:35:48.340420'),(2,'contenttypes','0002_remove_content_type_name','2025-02-23 14:35:48.756517'),(3,'auth','0001_initial','2025-02-23 14:35:49.491399'),(4,'auth','0002_alter_permission_name_max_length','2025-02-23 14:35:49.655911'),(5,'auth','0003_alter_user_email_max_length','2025-02-23 14:35:49.670946'),(6,'auth','0004_alter_user_username_opts','2025-02-23 14:35:49.683364'),(7,'auth','0005_alter_user_last_login_null','2025-02-23 14:35:49.695647'),(8,'auth','0006_require_contenttypes_0002','2025-02-23 14:35:49.703162'),(9,'auth','0007_alter_validators_add_error_messages','2025-02-23 14:35:49.714631'),(10,'auth','0008_alter_user_username_max_length','2025-02-23 14:35:49.724934'),(11,'auth','0009_alter_user_last_name_max_length','2025-02-23 14:35:49.738161'),(12,'auth','0010_alter_group_name_max_length','2025-02-23 14:35:49.766187'),(13,'auth','0011_update_proxy_permissions','2025-02-23 14:35:49.777705'),(14,'auth','0012_alter_user_first_name_max_length','2025-02-23 14:35:49.791993'),(19,'sessions','0001_initial','2025-02-23 14:35:54.749310'),(21,'myapp','0001_initial','2025-02-24 06:33:25.896552'),(22,'admin','0001_initial','2025-02-24 06:33:26.221680'),(23,'admin','0002_logentry_remove_auto_add','2025-02-24 06:33:26.236788'),(24,'admin','0003_logentry_add_action_flag_choices','2025-02-24 06:33:26.252380'),(25,'myapp','0002_alter_area_id','2025-02-24 06:51:31.571110'),(26,'myapp','0003_alter_customuser_contact_no_and_more','2025-02-24 08:45:53.386601'),(27,'myapp','0004_alter_customuser_username','2025-02-24 10:03:54.508934'),(28,'myapp','0005_wishlist','2025-02-25 13:47:03.355355'),(29,'myapp','0006_cartitem_price_payment_amount_alter_cartitem_cart_and_more','2025-02-26 17:14:37.191252');
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
INSERT INTO `django_session` VALUES ('0v8oxv00yduz9mcak7rs8plw1xfbzpmo','.eJxVjEEOwiAQRe_C2hCZAiku3XsGMsMwUjWQlHbVeHdt0oVu_3vvbyriupS49jzHidVFDaBOvyNheua6E35gvTedWl3mifSu6IN2fWucX9fD_Tso2Mu3JjeKoAEJnpnEnLN3IJ7JIftECCFYJu-zxWxGKw7YCqeEAAMZsur9AT_ROXw:1toNAV:DyxN0o3y58kgSJz784sA2UVx-QIN3zXsBeGtXjIhFr0','2025-03-15 13:46:15.426629'),('iuvhlhbkbs2j0k1q1urds00ij3ll4dzp','.eJxVjk0OgyAQhe_CuiGACNpV033PYAZmEKrVRLSbpncvpi7a5fv78l6sg22N3ZZp6RKyM6sEO_2aDvxA057gHaZ-5n6e1iU5vlf4kWZ-m5HG69H9A0TIsazbSok2OMRGBLSKpAnkG2_IudrW0BBJ6dHZygobwGgUQTttjKpASWh1gWZ4En6h9IA0FuoQtxzTpd9lefZg7w-XcEZd:1tnrl3:sMc91-6f6uwaxPdJUdQgNwLa1unJJjEQCbyKaQ8okes','2025-03-14 04:13:53.175904'),('oj1n3ymvnvde9lkmm84jv58m4r4m8xte','.eJxVjDsOwjAQBe_iGlle_2JT0nMGa73e4ABypDipEHeHSCmgfTPzXiLhtta0dV7SVMRZGCNOv2NGenDbSblju82S5rYuU5a7Ig_a5XUu_Lwc7t9BxV6_NaoSjA8RQNHIGYFCMNYC-YFCVi47GpwnVl5pLqAjQtAj5MjeWqdAvD_78Tdm:1toLpH:VRJIUTktfcmclXRZcjuTLNmUZvgNWyK50WDR-8CohvE','2025-03-15 12:20:15.608028'),('pnbuymwh7jnqivsz8e0upggo59tjdca1','.eJxVjMsOwiAQRf-FtSE8nAAu3fsNZBgGqRpISrtq_Hdt0oVu7znnbiLiutS4Dp7jlMVFmCBOv2NCenLbSX5gu3dJvS3zlOSuyIMOeeuZX9fD_TuoOOq3JkgeyGWgfC7JMkAqoEpBHbIORjnjPVllErJzYMizdtYaAAUaAVi8Px8vN9g:1tngfw:WFop0JAuEvwH8XCdMk7hs5vqJuEYCn9atTNv0uGxpVM','2025-03-06 16:23:52.419964');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_address`
--

DROP TABLE IF EXISTS `myapp_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `full_address` longtext NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_address_user_id_fec7814c_fk_myapp_customuser_id` (`user_id`),
  CONSTRAINT `myapp_address_user_id_fec7814c_fk_myapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_address`
--

LOCK TABLES `myapp_address` WRITE;
/*!40000 ALTER TABLE `myapp_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapp_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_area`
--

DROP TABLE IF EXISTS `myapp_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_area` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `area_name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `area_name` (`area_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_area`
--

LOCK TABLES `myapp_area` WRITE;
/*!40000 ALTER TABLE `myapp_area` DISABLE KEYS */;
INSERT INTO `myapp_area` VALUES (2,'Bapunagar'),(4,'Navrangpura'),(3,'Nikol'),(1,'Thakkarnagar'),(5,'Thaltej');
/*!40000 ALTER TABLE `myapp_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_brand`
--

DROP TABLE IF EXISTS `myapp_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brand_name` (`brand_name`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_brand`
--

LOCK TABLES `myapp_brand` WRITE;
/*!40000 ALTER TABLE `myapp_brand` DISABLE KEYS */;
INSERT INTO `myapp_brand` VALUES (32,'coconut & Squalane'),(22,'Faces canada'),(35,'inde wild'),(34,'Kiko'),(33,'L\'Oreal'),(18,'Lakme'),(25,'Lamel'),(36,'Love Beauty'),(21,'Mac'),(38,'Matrix'),(19,'Maybelline'),(40,'mcaffine'),(37,'Minimilist'),(28,'PIXI'),(20,'Plum'),(31,'Profusion Cosmetics'),(24,'RENNE'),(42,'Rom&nd'),(30,'Rubby\'s Orginics'),(27,'sheglam'),(29,'Swiss Beauty'),(26,'TIRTIR'),(23,'verymiss'),(39,'wishcare');
/*!40000 ALTER TABLE `myapp_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_cart`
--

DROP TABLE IF EXISTS `myapp_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_cart_user_id_d6c51e4b_fk_myapp_customuser_id` (`user_id`),
  CONSTRAINT `myapp_cart_user_id_d6c51e4b_fk_myapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_cart`
--

LOCK TABLES `myapp_cart` WRITE;
/*!40000 ALTER TABLE `myapp_cart` DISABLE KEYS */;
INSERT INTO `myapp_cart` VALUES (5,'2025-02-26 16:25:39.637391',21),(6,'2025-03-01 13:41:03.113747',33),(7,'2025-03-01 13:47:31.058568',32);
/*!40000 ALTER TABLE `myapp_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_cartitem`
--

DROP TABLE IF EXISTS `myapp_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_cartitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `added_at` datetime(6) NOT NULL,
  `cart_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_cartitem_cart_id_a4c8a9cf_fk_myapp_cart_id` (`cart_id`),
  KEY `myapp_cartitem_product_id_4e665953_fk_myapp_product_id` (`product_id`),
  CONSTRAINT `myapp_cartitem_cart_id_a4c8a9cf_fk_myapp_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `myapp_cart` (`id`),
  CONSTRAINT `myapp_cartitem_product_id_4e665953_fk_myapp_product_id` FOREIGN KEY (`product_id`) REFERENCES `myapp_product` (`id`),
  CONSTRAINT `myapp_cartitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_cartitem`
--

LOCK TABLES `myapp_cartitem` WRITE;
/*!40000 ALTER TABLE `myapp_cartitem` DISABLE KEYS */;
INSERT INTO `myapp_cartitem` VALUES (2,1,'2025-02-26 16:26:43.746735',5,2,NULL),(3,1,'2025-03-01 13:41:03.181328',6,1,1550.00),(12,2,'2025-03-02 16:19:52.966871',7,1,1550.00);
/*!40000 ALTER TABLE `myapp_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_category`
--

DROP TABLE IF EXISTS `myapp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_category`
--

LOCK TABLES `myapp_category` WRITE;
/*!40000 ALTER TABLE `myapp_category` DISABLE KEYS */;
INSERT INTO `myapp_category` VALUES (6,'Accessories'),(2,'Eyes'),(1,'Face'),(4,'Hair'),(3,'Lips'),(5,'Nails');
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
  `address` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `area_id` bigint DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `myapp_customuser_role_id_1ba733f1_fk_myapp_role_id` (`role_id`),
  KEY `myapp_customuser_area_id_d05e6db0_fk` (`area_id`),
  CONSTRAINT `myapp_customuser_area_id_d05e6db0_fk` FOREIGN KEY (`area_id`) REFERENCES `myapp_area` (`id`),
  CONSTRAINT `myapp_customuser_role_id_1ba733f1_fk_myapp_role_id` FOREIGN KEY (`role_id`) REFERENCES `myapp_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_customuser`
--

LOCK TABLES `myapp_customuser` WRITE;
/*!40000 ALTER TABLE `myapp_customuser` DISABLE KEYS */;
INSERT INTO `myapp_customuser` VALUES (3,'pbkdf2_sha256$870000$iDZpDrL7yf0prtAkBRRhfb$2UHW90Gmz4o9OLK45CytUrppHHyXD8f6ovojTFQDUCI=',NULL,0,'drashti','','',0,1,'2025-02-24 08:56:24.304466','d@gmail.com','3452346745','amidhara society','Female',NULL,NULL),(4,'pbkdf2_sha256$870000$6Hiqtsy9VXQo7flsjJyF7r$GRzIcMdyiX0yQdEYWa+V2vDVEa9/N6onYB3JM4bhZUw=','2025-02-24 09:06:26.446666',0,'foram','','',0,1,'2025-02-24 09:06:10.454552','foram@gmail.com','5647864532','amikunj society','Female',NULL,NULL),(5,'pbkdf2_sha256$870000$ywc8teqeMlH8RKkoXKjReS$HFp89ktrAN2+8DAqVeopou+QhNQ4N/b8j5kUWy8wGNE=',NULL,0,'jasmin','','',0,1,'2025-02-24 09:13:33.189546','jasmin@gmail.com','5645342657','dwarkesh society','Female',NULL,NULL),(6,'pbkdf2_sha256$870000$OpW6UOvdaQ6wyPlcRPptl2$N2tCuC5gPt0JNWf29aKorIjFmQ2pEXqnycL5Fe2mYwY=',NULL,0,'priyansi','','',0,1,'2025-02-24 09:18:18.820190','p@gmail.com','5463456789','sadhna society','Female',NULL,NULL),(7,'pbkdf2_sha256$870000$GbqhvrLw4HwCqabK68zzVK$7BRojQisCyWkDjPhS3q43ZjcQrjdc+TzzuZXBIL67so=',NULL,0,'aryan','','',0,1,'2025-02-24 09:26:12.953705','a@gmail.com','4563457654','amikunj','Male',NULL,NULL),(8,'pbkdf2_sha256$870000$pZLJiQSviI0Sn4QyEQdKF6$o7b3RKuD4aygVl63+d9nHskoZScEk1pMnHUYP7CkR+Y=',NULL,0,'nisha','','',0,1,'2025-02-24 09:31:48.857670','nisha@gmail.com','6754567897','sadhna','Female',NULL,NULL),(9,'pbkdf2_sha256$870000$6GDDnut3jCWcG30CU5PrMS$MDp3yv9LTVsDM3cB3Ens5xL675MrYSUGvu4SEJVkhGA=',NULL,0,'kavya','','',0,1,'2025-02-24 09:37:10.844905','k@gmail.com','6754325678','gshagu','Female',NULL,NULL),(10,'pbkdf2_sha256$870000$gbj4qqjHj6rcOAQWHKUblr$ra4+4YPEV4HVq1aMI63VedapR3zKW3WWUuUUvyua6cA=',NULL,0,'kavita','','',0,1,'2025-02-24 09:46:32.182263','ka@gmail.com','5674563456','sadhna','Female',NULL,NULL),(21,'pbkdf2_sha256$870000$EeZ9KHuwkUHVS1tx4JPjL5$lrhehMfr4mAWxNT53dYZ0Qm8rCbl9Kfa6TxVj7QZ+oA=',NULL,0,'shreya','','',0,1,'2025-02-26 15:57:15.000000','shreya@gmail.com','1230984567','b-14 khodiyar appartment dwarkesh dham society thakkarnagar road ahmedabad','Female',1,2),(24,'pbkdf2_sha256$870000$LSLLK6EUNkdwToe8vT0kyo$jW6rDKRGuZ4fecBikHkoyY6H+Su6idy5sHjP5HBV8Bk=','2025-02-28 08:05:24.933581',0,'','','',0,1,'2025-02-27 02:25:22.815956','rubina@gmail.com','5674563456','surdhara society','Female',NULL,NULL),(26,'pbkdf2_sha256$870000$UE159z8Ulm6gXAXxUJMEuR$9fsZSWPzUBsWoIdieGQHUbDbImRlP1CIIQSoEHv19tI=','2025-02-27 02:30:07.800362',0,'','','',0,1,'2025-02-27 02:29:57.465164','swati@gmail.com','2341237652','amidhara society','Female',NULL,NULL),(27,'pbkdf2_sha256$870000$DuWoBQMcetHRVIoXSubrqU$o64MB5UV5/mhqOIRLv2SCaJ6N9qi6LqFnCvPRvEEtMc=','2025-02-27 02:45:31.637233',0,'','','',0,1,'2025-02-27 02:45:21.754033','sarjina@gmail.com','5674563456','sadhna society','Female',NULL,NULL),(28,'pbkdf2_sha256$870000$hmqHLQKYwNyQ4e6gclTlmY$ImVtlZmtpwePcesObqP4mDhJpF4Szof1MgLLeOGWT0A=','2025-02-27 16:08:38.841390',0,'','','',0,1,'2025-02-27 16:08:25.979506','tisha@gmail.com','2340985674','sadhna society','Female',NULL,NULL),(30,'pbkdf2_sha256$870000$SNZ0BA0NuLva48TVmrVYDw$xPuyEHCoxiVelkgGVgbNA5ARkXAu/udxAbyDp38fsro=','2025-02-28 08:36:25.330559',1,'khushi','','',1,1,'2025-02-27 16:37:16.670365','khushi@gmail.com',NULL,NULL,NULL,NULL,NULL),(31,'pbkdf2_sha256$870000$mnwOj4unbADEBfvVwrdf6D$dNcQA+nGOe+XpmroJcCUQtObPNRAX30anvm6EzdS0tM=','2025-02-27 16:40:33.208191',0,'','','',0,1,'2025-02-27 16:40:21.166942','praful@gmail.com','5674560987','sadhna society','Male',NULL,NULL),(32,'pbkdf2_sha256$870000$XjzPM7Vig7dIoxxNX1tfyJ$Z8wHj39SZqKKpGe6ppO7cWmwsotgC4IwyzSXzruaFGg=','2025-03-01 13:46:15.402795',0,'','','',0,1,'2025-02-28 03:50:14.380591','moksha@gmail.com','2340984567','surdhara society','Female',NULL,NULL),(33,'pbkdf2_sha256$870000$MRcmVOgZ3YiBGZrjqxsnq7$1GbHtwgwv8QCnEgL08UOnbAj5yZ7AXgjHG9d58xbqkA=','2025-03-01 12:20:15.598119',1,'admin','','',1,1,'2025-02-28 08:37:44.445293','admin@gmail.com',NULL,NULL,NULL,NULL,NULL);
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
-- Table structure for table `myapp_order`
--

DROP TABLE IF EXISTS `myapp_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_date` datetime(6) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_status` varchar(15) NOT NULL,
  `status` varchar(15) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_order_user_id_98783cea_fk_myapp_customuser_id` (`user_id`),
  CONSTRAINT `myapp_order_user_id_98783cea_fk_myapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_order`
--

LOCK TABLES `myapp_order` WRITE;
/*!40000 ALTER TABLE `myapp_order` DISABLE KEYS */;
INSERT INTO `myapp_order` VALUES (2,'2025-03-02 08:18:31.872312',0.00,'Pending','Processing',32),(3,'2025-03-02 08:33:14.960593',0.00,'Pending','Processing',32),(4,'2025-03-02 08:34:52.911401',0.00,'Pending','Processing',32),(5,'2025-03-02 08:35:35.731947',0.00,'Pending','Processing',32),(6,'2025-03-02 08:36:14.722086',0.00,'Pending','Processing',32),(7,'2025-03-02 08:36:25.199632',0.00,'Pending','Processing',32),(8,'2025-03-02 08:38:52.061992',0.00,'Pending','Processing',32),(9,'2025-03-02 08:39:04.092615',0.00,'Pending','Processing',32),(10,'2025-03-02 08:40:17.827076',0.00,'Pending','Processing',32),(11,'2025-03-02 08:51:21.089310',0.00,'Pending','Processing',32),(12,'2025-03-02 08:57:23.205184',0.00,'Pending','Processing',32),(13,'2025-03-02 08:58:18.422953',0.00,'Pending','Processing',32),(14,'2025-03-02 09:16:36.371435',0.00,'Pending','Processing',32),(15,'2025-03-02 09:23:11.849378',0.00,'Pending','Processing',32),(16,'2025-03-02 09:26:10.693990',0.00,'Pending','Processing',32),(17,'2025-03-02 09:27:20.462308',0.00,'Pending','Processing',32),(18,'2025-03-02 09:35:01.281710',0.00,'Pending','Processing',32),(19,'2025-03-02 13:19:14.537056',0.00,'Pending','Processing',32),(20,'2025-03-02 13:39:28.121375',24790.00,'Pending','Processing',32),(21,'2025-03-02 16:18:50.770961',3100.00,'Pending','Processing',32);
/*!40000 ALTER TABLE `myapp_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_orderitem`
--

DROP TABLE IF EXISTS `myapp_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_orderitem_order_id_62cd3209_fk_myapp_order_id` (`order_id`),
  KEY `myapp_orderitem_product_id_c0451de9_fk_myapp_product_id` (`product_id`),
  CONSTRAINT `myapp_orderitem_order_id_62cd3209_fk_myapp_order_id` FOREIGN KEY (`order_id`) REFERENCES `myapp_order` (`id`),
  CONSTRAINT `myapp_orderitem_product_id_c0451de9_fk_myapp_product_id` FOREIGN KEY (`product_id`) REFERENCES `myapp_product` (`id`),
  CONSTRAINT `myapp_orderitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_orderitem`
--

LOCK TABLES `myapp_orderitem` WRITE;
/*!40000 ALTER TABLE `myapp_orderitem` DISABLE KEYS */;
INSERT INTO `myapp_orderitem` VALUES (2,8,450.00,20,2),(3,12,1550.00,20,1),(4,1,716.00,20,7),(5,1,716.00,20,8),(6,2,229.00,20,5),(7,1,700.00,20,6),(8,2,1550.00,21,1);
/*!40000 ALTER TABLE `myapp_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_payment`
--

DROP TABLE IF EXISTS `myapp_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(100) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `payment_date` datetime(6) NOT NULL,
  `order_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_id` (`payment_id`),
  KEY `myapp_payment_order_id_e21c3e63_fk_myapp_order_id` (`order_id`),
  KEY `myapp_payment_user_id_87eedb75_fk_myapp_customuser_id` (`user_id`),
  CONSTRAINT `myapp_payment_order_id_e21c3e63_fk_myapp_order_id` FOREIGN KEY (`order_id`) REFERENCES `myapp_order` (`id`),
  CONSTRAINT `myapp_payment_user_id_87eedb75_fk_myapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_payment`
--

LOCK TABLES `myapp_payment` WRITE;
/*!40000 ALTER TABLE `myapp_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapp_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_product`
--

DROP TABLE IF EXISTS `myapp_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `p_name` varchar(500) NOT NULL,
  `p_price` decimal(10,2) NOT NULL,
  `p_description` longtext,
  `p_img` varchar(100) DEFAULT NULL,
  `p_qty` int unsigned NOT NULL,
  `brand_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  `unit_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_product_brand_id_065003a9_fk_myapp_brand_id` (`brand_id`),
  KEY `myapp_product_category_id_f672ddc0_fk_myapp_category_id` (`category_id`),
  KEY `myapp_product_unit_id_9d871090_fk_myapp_unit_id` (`unit_id`),
  CONSTRAINT `myapp_product_brand_id_065003a9_fk_myapp_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `myapp_brand` (`id`),
  CONSTRAINT `myapp_product_category_id_f672ddc0_fk_myapp_category_id` FOREIGN KEY (`category_id`) REFERENCES `myapp_category` (`id`),
  CONSTRAINT `myapp_product_unit_id_9d871090_fk_myapp_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `myapp_unit` (`id`),
  CONSTRAINT `myapp_product_chk_1` CHECK ((`p_qty` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_product`
--

LOCK TABLES `myapp_product` WRITE;
/*!40000 ALTER TABLE `myapp_product` DISABLE KEYS */;
INSERT INTO `myapp_product` VALUES (1,'Maybelline New York Fit Me Matte Plus Poreless Oil Full Coverage Foundation For Oily Skin',1550.00,'Maybelline Fit Me Foundation is a lightweight foundation, suitable for oily skin to normal skin and offers a natural-looking matte finish. This liquid Foundation for face, is dermatologically tested, allergy tested and is non-comedogenic. It comes with SPF 22 for sun protection. Thanks to its CLAY formula it is equipped for oil control. If you’re looking for a natural-looking, medium coverage liquid foundation, look no further. Maybelline Fit Me foundation is available in several unique shades, you\'ll find a fit for every skin tone. It is the perfect matte foundation for normal to oily skin and refines pores for a natural, matte finish.','products/product-1_tl7ZZ2K.jpg',20,19,1,4),(2,'Coconut & Squalane Nutri-Shine Hair Serum',450.00,'This versatile serum is crafted for all hair types seeking intense shine and nourishment. Powered by a blend of high-performing ingredients like coconut oil, almond oil, and squalane, it instantly tames frizz, smooths each strand, and delivers a clinically proven 22 x shine boost for a radiant, glossy finish. Get instant shine and irresistible softness with each use - thanks to squalane’s deep hydration, coconut oil’s smoothing effects, and almond oil nourishing properties. Embrace every day as a great hair day with shine, softness, and smart frizz control in one bottle!','products/product-2_lu5C33v.jpg',10,20,4,4),(3,'Lipstick Faces Canada  Hd Matte Lipstick, Pigmented And Provides Tea Rose 14 (3.5 G)',600.00,'9 HR HD FINISH: FACESCANADA Ultime Pro Hd Intense Matte Lips + Primer stays put on your lips for 9 hours straight. The super longlasting matte lipstick keeps you looking gorgeous throughout the day.\r\nULTRA LIGHTWEIGHT COMFORT: The formula is super lightweight. The lipstick feels extremely comfortable throughout wear.\r\nPRIMER INFUSED: The lipstick comes with an in-built primer that keeps the lips hydrated and lends a flawless HD finish to the lips.\r\nNON-FEATHERING & NON-STICKY: Developed with a built-in moisturizing formula, experience smooth and creamy application along with constant lip care.','products/product-3_7cjV191.jpg',30,22,3,7),(4,'Maybelline New York HyperCurl WaterProof MasCara ,Smudge & Highly Pigmented - Black | 15 ml',350.00,'Apply an initial coat on your upper lashes and wait for a few minutes for it to dry before applying the second coat. You may choose to curl your lashes with an eyelash curler for easier application and a better definition. Since your lower lashes are shorter, apply the mascara in soft, brisk strokes to ensure even distribution and avoid clumping.','products/product-4_WJuMbWw.jpg',10,19,2,1),(5,'Premium Nail Polish',229.00,'Verymiss Premium Nail Polish is a high shine nail polish with high color payoff that will give your nails that freshly manicured look round-the-clock! It Provides a protective fast drying finishing coat to nail enamel. The chip defying formula of these nail enamels ensure that you have beautiful, polished nails throughout.\r\n\r\nThe Nail Polish gives a glossy, fun color to your nails and with so many shades of nail colors to choose from there\'s one for every mood and occasion and all this in Just One Stroke.','products/product-5_nFk7Znh.jpg',20,23,5,2),(6,'RENEE All In 1 Professional Makeup Brush Set of 6, Premium Easy To Hold & Precise Application For Face, Eyes & Brows | Cruelty Free & Uniquely...',700.00,'Unparalleled Precision: Achieve makeup perfection with the RENEE All In 1 Professional Makeup Brush Set, crafted to match professional makeup artist\'s standards for unparalleled precision.\r\nDedicated Brushes for Every Area: This exquisite set includes 6 essential brushes designed specifically for face, eyes, and brows, ensuring optimal results in every application.\r\nEasy-to-Hold Handles: The brushes are ergonomically designed with easy-to-hold handles, providing a comfortable grip and precise control over your makeup application.\r\nCruelty-Free and Super Soft Bristles: Crafted with cruelty-free bristles, these brushes offer a guilt-free and luxurious experience, with super soft bristles that feel gentle on the skin.\r\nVersatile Compatibility: The bristles of these brushes are compatible with cream, liquid, and powder formulations, making them versatile tools for any makeup technique.','products/product-6_GPVp7iw.jpg',30,24,6,11),(7,'Lamel- 16 Shades- Eyeshadow Palette-№ 16-3 Brown | Shine Shimmery & Warm Matte Neutrals Nude Tones | Organic, Blendable, Long lasting, Waterproof | High Pigmented Professional Makeup Set|',716.00,'Perfectly arranged in colors, the 16 Shades palette will save you from the painful choice of which other shades to combine it with. The palette is available in two color ranges Brown and Burgundy and contains 16 shades that are perfectly combined with each other, allowing you to create both light daytime and brighter evening makeups. Shades attract attention with impeccable matteness, light satin sheen and bright shimmer shine. All colors can be used separately or combined, thereby creating spectacular transitions that emphasize the depth of view.','products/product-7_mk4zaz5.jpg',20,25,2,8),(8,'L\'oreal Paris Glycolic Bright Instant Glowing Face Serum',716.00,'THE #1 Face Serum In the World* does what it says! The L\'Oreal Paris Revitalift Hyaluronic Acid Serum with 1.5% Hyaluron has micro hyaluronic acid for deeper penetration. It intense hydrates and reduces fine lines by -60%*. With this lightweight and non-sticky serum, get visibly youthful skin! Dermatologically tested, it is suitable for all skin types and can be used daily. This face serum for women is paraben- free, fragrance-free & alcohol-free. And suitable for all skin types, including sensitive skin. For best results, use the hyaluronic acid cleanser follow by this serum followed by the hyaluronic acid plumping cream morning and night. Disclaimers: n°1 sell - out sales volume and value, based on nielseniq rms data for the female face care anti-aging serum category, total retail market, 23 countries, 75% of world gni, jan 2021 to dec 21 (copyright © 2021, nielseniq)” **basis instrumental test','products/product-8_4e5mV71.jpg',10,33,1,2),(9,'TIRTIR Mask Fit Makeup Fixer',450.00,'[UNBEATABLE MAKEUP FIXATION] Unlock flawless, long-lasting makeup with our powerful setting fixer! Instantly form a protective layer between your skin and makeup, ensuring your look stays fresh and radiant all day long.\r\n[24-HOUR LONG-LASTING HOLD] Experience the magic of our light air-fit polymer, creating an ultra-thin, breathable shield that locks in your makeup without clogging pores or feeling heavy. Our innovative powder formula absorbs excess oil, leaving your skin smooth, shine-free, and picture-perfect.\r\n[EXPERT SEBUM CONTROL WITH GREEN APPLE] Revel in the refreshing care of patented green apple polyphenols that expertly regulate sebum production. Say goodbye to unwanted shine and hello to a clean, crisp, and invigorating makeup finish.\r\n[SOFT BLURRING EFFECT FOR FLAWLESS SKIN] Achieve the ultimate soft-focus look with our light-scattering technology. Enjoy a beautifully blurred, flawless complexion that diminishes the appearance of pores and imperfections for a dreamy, translucent finish.\r\n[HOW TO USE] Shake the container gently, close your eyes, and spray evenly over your entire face from a distance of 20-30 cm. Let it absorb naturally. Remember to shake well before use to activate the powder formula, and clean the nozzle tip after use to ensure optimal performance. Transform your makeup routine with our advanced setting fixer and enjoy all-day confidence and impeccable beauty!','products/face13_pZrIZo7.png',10,26,1,2),(10,'Sheglam Color Bloom Liquid Blush - Swipe Right',600.00,'Introducing the SHEGLAM Color Bloom Liquid Blush, a must-have addition to your makeup collection. This matte finish love cake gel cream blush offers a range of benefits that will leave you looking radiant and feeling confident all day long. With its long-lasting and non-fading formula, this highly pigmented blush provides a pop of vibrant color that stays put. The lightweight texture ensures a comfortable wear, allowing your skin to breathe naturally. Experience a smooth and flawless application as the gel cream seamlessly blends into your skin, creating a natural-looking flush that enhances your features. The SHEGLAM Color Bloom Liquid Blush is designed for long wear, ensuring that your flushed cheeks last from morning to night. Whether you\'re going for a subtle glow or a bold statement, this versatile blush allows you to build the intensity according to your preference. Not only does this blush provide exceptional color payoff, but it also nourishes your skin. Enriched with skin-loving ingredients, it helps to hydrate and soften your complexion, leaving it looking healthy and radiant. Elevate your makeup routine with the SHEGLAM Color Bloom Liquid Blush. Its stunning matte finish, long-lasting formula, and lightweight texture make it an essential product for achieving a flawless and natural-looking flush. Embrace your beauty and let your cheeks bloom with this highly pigmented and beautifully crafted gel cream blush.','products/face11_g5SrnR3.png',30,27,1,3),(11,'PIXI On-The-Glow Blush - Fleur 3.5 gm',350.00,'Multi-use stick provides a hint of colour while hydrating and conditioning skin in one swipe. This hydrating solid cheek tint is formulated to blend effortlessly on the skin for a natural finish on cheeks and lips. Enriched with botanicals & fruit extracts to create a nourished natural glow.','products/face14_oVuimKO.png',20,28,1,7),(12,'Faces Canada Weightless Stay Matte Finish Compact Powder SPF 20 Non Oily - Natural',229.00,'#Beautifulbeginswithyou it protects and perfects at the same time. A compact powder formulated with SPF 200 pa+++ to give round-the-clock sun protection against harmful UVA & UVB sun rays. The right blend of pacifying agents with vitamin e & shea butter, ensure the compact melts effortlessly into the skin and leaves it looking fresh and hydrated. This synergy coupled with the dual UVA and UVB sun protection action makes this a product which can be used everyday for a healthy and radiant skin. Ingredient story: shea butter: an anti-inflammatory with healing properties, shea butter, acts as a natural moisturizer and is known for its ability to condition, tone, and soothe the skin vitamin e: an anti-oxidant which combats the effects of free radicals and improves cell function and skin health. Shade specifications: 1. Ivory 01 2. Natural 02 3. Beige 03 4. Sand 04 know your skin tone: 1. Natural/ ivory: people who fall in this category appear pink or beige skin tone. If you look under your wrist your veins are mostly blue which denotes cool undertone. 2. Natural/sand/beige: people who fall in this category have slightly green brown skin tone/neutral undertone. If you look under your wrist your veins are a mix of blue and green. 3. Ivory/sand: people who fall in this category are dominantly yellow or golden skin tone. If you look under your wrist your veins are mostly green with warm undertone.','products/face16_G49zYJ0.png',10,22,1,8),(13,'Lakme 9 to 5 Complexion Care Cream Bronze 3.5 gm',700.00,'Lakme 9to5 CC Cream - a fashion-forward beauty essential that seamlessly blends makeup and skincare into one stunning package. Lightweight Luxury Elevate your style with this lightweight moisturizer with a hint of foundation, designed to effortlessly blend into your skin, leaving you with a radiant and flawless complexion. Bid farewell to dullness as you embrace a natural, luminous glow that turns heads wherever you go. Sun-Kissed Protection In an era where every moment is a photo opportunity, our CC cream steps up with SPF 30 PA++, safeguarding your skin from the sun\'s harsh rays. Protect your beauty while you capture the spotlight! Niacinamide Magic! Discover the beauty secret within with this clinically proven and dermatologically tested formula! Enriched with 3% Niacinamide, this CC cream doesn\'t just make you look fabulous; it cares for your skin too. Say hello to reduced dark spots, improved skin texture, and an even tone! Flawless Finish CC cream conceals dark spots and evens out your skin tone. Radiate confidence with a flawless complexion, whether you\'re conquering the office or walking the runway of life. The Lakme 9to5 CC Cream is your everyday companion, delivering chic style and beauty that cares. Whether you\'re heading to the office or owning the fashion scene, make a statement with your style and let your beauty shine. Slay the fashion game with the Lakme 9to5 CC Cream - where fashion-forward meets fabulous! Availaible in six shades.','products/face17_O2Kqfe1.png',10,18,1,7),(14,'Lakme Peach Milk Soft Cream 15 gm',716.00,'Is your skin loosing moisture as the day goes by ? Lakmé brings to you the goodness of peaches and milk in a creme for the very first time! This whipped cream formula has a soothing fragrance which will make you fall in love with it instantly. This deeply nourishing formula easily absorbs into the skin to lock moisture for 12 hours to give you soft|| smooth glowing skin. Apply the crème smoothly over face and neck. Use it in the day/night to get beautiful skin around the clock. This crème can be applied under make up. For best results - use every day for nourished skin that glows. About Lakmé : Lakmé is India’s No. 1 Color Cosmetics brand offering a wide range of high-end|| world-class color cosmetic and skincare products. Lakmé has a vast product range specially crafted by experts for the Indian skin. The brand has also been redefining fashion in India for over 15 years with Lakmé Fashion Week|| India’s premier fashion event. Allergies : In the unlikely event of skin irritation|| stop using and consult a doctor immediately. Warning : Avoid contact with eyes. Wash your eyes thoroughly with clean water in case of contact.*OLD','products/face18_pDEplw9.png',10,18,1,8),(15,'KIKO Milano Smart Nail Lacquer - 14 Rouge Noir',290.00,'Quick-drying nail lacquer. The special formula’s ingredients set the colour in just a few seconds.\r\nThe lacquer\'s smooth texture allows for a flawless application. The formula’s ingredients boost the lacquer’s shine for a extra-bright finish.\r\nWith a brand-new, modern design, the see-through glass bottle has a black matte cap with the KK logo embossed on the top. Thanks to the large, bristle-packed brush, it\'s simple to take the perfect amount of product and brush it evenly on the nails without leaving streaks. Smart Nail Lacquer’s small size allows you to take it with you everywhere to ensure that you always have salon-style nails.\r\nAvailable in manyv amazing colours. Every hue is specifically formulated to maximize application, coverage and colour performance.\r\nWARNING: flammable. Keep out of reach of children. Do not swallow.','products/nail27.png',10,34,5,2),(16,'Nails Our Way Nail Enamel Remover - 2 Toned Vanisher',100.00,'Key Features & Benefits\r\nFormulated in France.\r\nDual-tone acetone-free formula for fast and effortless nail colour removal.\r\nContains 33% aqua to hydrate and replenish moisture.\r\nSuper gentle on nails-no more dry skin and irritated cuticles.\r\nHow to Use:\r\nPrep first: Saturate a cotton ball or pad with nail polish remover.\r\nPress and wait: Press the soaked cotton onto each nail for a few seconds to allow the remover to dissolve the polish.\r\nSwipe it away: Gently swipe the cotton over the nail surface towards the tip to remove the polish, repeating if necessary.','products/nail28.png',10,24,5,4),(18,'RENEE Metallicious Nail Paint - Silky Nude, Quick Drying, Metallic Finish, Long Lasting, Chip Resisting Formula with High Shine & Full Coverage, Acetone & Paraben',600.00,'Unleash your inner boldness and showcase your fearless spirit with RENEE Metallicious Nail Paint, where your nails will radiate unparalleled brilliance with alluring metallic shades. Embrace the power of these striking nail paints, crafted with a long-lasting and high-coverage formula, ensuring your nails exude an irresistible metallicicious charm that captivates onlookers. Dare to be different and explore a captivating range of metallic shades that elevate your nail game to new heights, proving your mettle with every stroke. The rich colors with metallic shine create an awe-inspiring effect, giving your nails a glamorous and dazzling appearance fit for any occasion. The convenience of one-stroke application allows you to effortlessly embrace the metallicicious allure, whether you\'re a nail art enthusiast or someone looking for a quick and glamorous transformation. Say goodbye to tedious and time-consuming manicures, and indulge in the ease and efficiency of achieving metallic perfection. Enjoy the confidence of flaunting your metallicious nails for an extended period, as the long-lasting formula ensures your manicure remains intact and vibrant, enduring the challenges of your daily activities. Embrace a manicure that doesn\'t fade away quickly, granting you the freedom to seize the day without worry. Safety and nail health are paramount in RENEE Metallicious Nail Paint\'s design, as the formulation is carefully crafted to be acetone-free and paraben-free. Your nails deserve to be pampered with a gentle and caring formula that prioritizes their health while still delivering a stunning and enduring metallic finish. Unleash your true brilliance with RENEE Metallicious Nail Paint and embrace a world of fearless shades that accentuate your confidence and individuality. Dare to shine with metallicicious glamour, and let your nails become a captivating testament to your fearless spirit and impeccable taste.','products/nail17.png',10,24,5,2),(20,'RENNE Color Crush Nailart',170.00,'RENNE Color Crush Nail Art Show-stopping nail art 1. 4 different families - Unicorn, Chrome, Circus, Glitterati 2. 30 new shades and textures 3. Choose from pearlescent Unicorn, metal finish Chrome, glitter-mixed effect with Glitterati and Circus with dazzling micro-particles 3. Shades that highlight each texture vividly Unicorn- Dive into the gleaming watery world and get close to precious shimmering sea shells Chrome- Get Chrome finish with bright colors Mirror like chrome finish to get the bright metal look Circus- Spectacular color, Iridescent Glitter Nail effect Inspired by the glittery world of Circus- dazzling glitters, multi reflection micro particles, bright lively color palette Glitterati- Glitter mixed, Pixelized, Computer Glitch inspired Nail Effect Computer glitches are inspiring imageries that give birth to beautiful chaotic mosaics and blurred streaks. It creates light changing effect on nails. This is mix of random color and shape glitters. Your art on your nails Go solo or mix & match with our new Color Crush Nail Art collection in Chrome, Glitterati, Shimmer and Unicorn. Made for every effect Choose from pearlescent Unicorn, metal finish Chrome, glitter-mixed effect with Glitterati and Shimmer with dazzling micro-particles for any mood. Nails that tell your story Create the trendiest looks with the broadest range of shades and textures. How to apply Style your nails Select two contrasting shades like Unicorn and Glitterati. Apply the Unicorn shade as a basecoat and let it dry completely. Then add a coat of Glitterati on the tip of your nails to create your unique nail art.','products/nail19.png',10,24,5,1),(21,'Nails Our Way Treat Coat Nail Enamel - Mighty Mistress',225.00,'No more breakage! This moisturising, nourishing formula prevents nails from breaking, splitting and chipping, resulting in nail colour that lasts longer while improving nail health and integrity in the process.\r\n\r\nKey Features & Benefits\r\nVegan, cruelty-free, and formulated in France.\r\nAchieve gel-like effect and shine at home.\r\nInfused with avocado oil for nourishment.\r\nContains lemon peel water for hydration.\r\nDesigned to prevent breaking and splitting of nails.\r\n21 toxin-free*.\r\n* 21 toxic ingredients have not been added to formulate these Nail products.\r\n\r\nHow to Use:\r\nStart fresh: Start with clean, dry nails. Remove any existing nail polish using a gentle nail polish remover. Shape your nails to your desired length and form and then buff them.\r\nApply right: With a steady hand, apply the polish in smooth, even strokes. Start from the base of your nail and work your way to the tip, ensuring full coverage. Allow the first coat to dry completely before applying a second.','products/nail21.png',10,18,5,3),(22,'Insight Cosmetics Red Rose Nail Polish Remover Wipes',65.00,'Introducing Insight\'s Nail Polish Remover Wipes - Easy to use nail polish remover pads that ensure an easy and mess-free nail paint removal. Enriched with vitamin E, these help in keeping your nails nourished and moisturized at all times. These quick and easy to use nail polish wipes feature an acetone, toluene and paraben free formula.','products/nail22.png',10,24,5,4),(23,'Lakme 9to5 Powerplay Insta-Manicure Nail Enamel - Nude Eclipse',259.00,'Lakme 9to5 Powerplay Insta-Manicure Nail Enamel – dries in a flash & has care in every splash. Elevate your nail game with this ultimate essential for those who want salon finish nails in just 1 minute. Available in ten vibrant shades, this nail enamel dries in just 60 seconds, delivering a flawless, high-gloss finish that resists chips and smudges. This nail polish is also power packed with AHA known to strengthen & repair your cuticles, promoting healthier & more vibrant nails with every application. Priced at Rs.250/- and designed for the everyday fashionista on the go. The Insta-Manicure Nail Enamel combines speed, beauty, and care in one bottle. No more waiting around for your nails to dry or dealing with messy smudges. Just gorgeous, salon-quality nails in an instant. Just evenly apply 1 coat, wait for 60 seconds. Re-apply 2nd coat as per choice & you’re ready to go! Perfect for anyone who refuses to compromise on style or nail health, our quick-drying nail polish is your go-to for flawless, long-lasting color and cuticle care. Transform your manicure routine at home with our this powerpacked nail enamel and enjoy flawless results every time. Dries in 1 minute • Enriched with AHA • 10 vibrant shades • High gloss finish','products/nail23.png',10,18,5,7),(24,'O.P.I Lacquer Spring Collection Nail Polish - *Verified*',756.00,'Dress up your nails with the O.P.I Lacquer Spring Collection Nail Polish - *Verified* (15 ml). This long-lasting nail polish is a chip-resistant nail polish with a flawless, glossy finish that lasts for up to 7 days. As a quick-drying nail polish, this O.P.I nail polish eliminates the risk of smudging and gives you a smooth and hassle-free application.\r\n\r\nKey Features & Benefits:\r\nGives the nails a smooth, glossy finish\r\nLong-lasting formula resistant to chipping\r\nOffers up to 7 days of wear\r\nQuick-drying formula offers convenience and prevents smudges\r\nKey Ingredients:\r\nEthyl acetate: Helps nail polish flow smoothly and dry quickly, allowing for easy removal without causing damage\r\nAll Ingredients:\r\nButyl Acetate, Ethyl Acetate, Nitrocellulose, Isopropyl Alcohol, Acetyl Tributyl Citrate, Tosylamide/Epoxy Resin, Stearalkonium Bentonite, Silica, Sorbic Acid, Phosphoric Acid, Diacetone Alcohol, Kaolin, [May Contain/Peut Contenir/+/-: Titanium Dioxide (Ci 77891), Ultramarines (Ci 77007), Manganese Violet (Ci 77742), Yellow 5 Lake (Ci 19140), Red 6 Lake (Ci 15850), Iron Oxides (Ci 77499)].\r\n\r\nHow to Use:\r\nBefore starting, scrub away traces of past lacquer for smooth application. Apply a base coat to your clean, dry nails, and wait for 60 seconds. You can then apply two more coats for a color-rich look. Finish off with a top coat for best results.','products/nail26.png',30,33,5,3),(26,'Inde Wild Champi Hair Oil (50ml)',949.00,'Use the Inde Wild Champi Hair Oil (50ml) for the ultimate hair care routine. This herbal hair oil is infused with brahmi, amla, and neem to induce blood circulation, fight scalp infections, and stimulate hair growth. Also, this Inde Wild ayurvedic hair oil contains castor oil with five potent carrier oils, including sesame, coconut, almond, argan, and vitamin E for comprehensive hair care.\r\n\r\nKey Features & Benefits:\r\nInfused with brahmi to enhance hair growth and strengthen follicles\r\nAmla promotes blood circulation in the scalp, ensuring optimal nourishment\r\nNeem\'s antibacterial properties prevent scalp infections and dandruff\r\nFree from silicone, paraben, mineral oil, and SLS for safe use\r\nKey Ingredients:\r\nBrahmi: Nourishes the scalp\r\nAmla: Strengthens hair\r\nNeem: Fights dandruff\r\nAll Ingredients:\r\nCocos Nucifera (Coconut) Oil, Sesamum Indicum (Sesame) Seed Oil, Ricinus Communis (Castor) Seed Oil, Prunus Amygdalus Dulcis (Almond) Oil, Argan Oil, Bacopa Monnieri (Brahmi) Plant Extract, Eclipta Alba (Bhringraj) Plant Extract, Emblica Officinalis (Amla) Fruit Extract, Hibiscus Sabdariffa (Hibiscus) Flower Extract, Magnolia Champaca (Champa) Essential Oil, Jasmine Essential Oil, Calendula Officinalis (Calendula) Flower Extract, Glycyrrhiza Glabra (Licorice) Root Extract, Ocimum Sanctum (Tulsi) Leaf Extract, Trigonella Foenum-Graenum (Fenugreek) Extract, Melia Azadirachta (Neem) Leaf Extract, Rosmarinus Officinalis (Rosemary) Extract, Lavender Essential Oil, Gardenia Taitensis Flower, Tocopherol.\r\n\r\nHow to Use:\r\nApply the hair oil on your scalp using your fingertips. Gently massage for 10-15 minutes. Keep the hair oil overnight or wash using a mild shampoo after at least 30 minutes.','products/hair11.png',45,35,4,5),(27,'L\'Oreal Paris Extraordinary Oil Hair Serum (100ml)',584.00,'Get smooth and sleek locks in no time with the L\'Oreal Paris Extraordinary Oil Hair Serum (100ml). Formulated with six rare oils, this lightweight serum is nourishing enough for all hair types. Besides regulating and maintaining your strands\' natural balance, it protects them from heat damage. With detangling and smoothing properties, this L\'oreal Paris hair serum is the perfect styling companion and leaves your hair feeling silky and soft after using it.\r\n\r\nKey Features & Benefits:\r\nFormulated with six rare oils that nourish and promote shine\r\nLightweight formula quickly absorbs to smooth your hair\r\nProvides protection from heat damage\r\nDetangles your hair without feeling greasy\r\nAll Ingredients:\r\nCyclopentasiloxane, Dimethiconol, Chamomilla Recutita Extract/ Matricaria Flower Extract, Cocos Nucifera Oil/Coconut Oil, Helianthus Annuus Seed Oil, Sunflower Seed Oil, Nelumbium Speciosum Extract/ Nelumbium Speciosum Flower Extract, Benzyl Alcohol, Cinnamal, Linalool, Linum Usitatissimum Flower Extract, Caprylic/Capric Triglyceride, Gardenia Tahitensis Flower Extract, Rosa Canina Flower Extract, Bisabolol, Glycine Soja Oil/ Soybean Oil/ Parfum Fragrance.\r\n\r\nHow to Use:\r\nTake an adequate amount of the serum on your palm. Rub palms together, then apply it on clean hair from root to tip. Do not rinse off.','products/hair12_jq8oyF8.png',34,33,4,6),(28,'LOVE beauty AND planet Argan Oil & Lavender Magic Hair Mask for Frizz Control',549.00,'Add the LOVE beauty AND planet Argan Oil & Lavender Hair Mask (200ml) to your haircare routine for soft, smooth tresses. This anti-frizz hair mask, enriched with moroccan argan oil, helps smoothen the hair to reduce frizz and increase manageability. Additionally, this moisturizing hair mask contains hydrating coconut oil to make the hair soft and shiny. Plus, this Love Beauty and Planet hair mask features a relaxing scent of lavender essential oil or a spa-like experience at home.\r\n\r\nKey Features & Benefits:\r\nFormulated with pure moroccan argan oil to moisturize the hair\r\nInfused with organic coconut oil to hydrate and nourish the hair\r\nFeatures a calming fragrance of french lavender essential oil\r\nMakes the hair smooth and manageable by taming frizz\r\nKey Ingredients:\r\nArgan oil: Moisturizes and smoothens the hair\r\nFrench lavender: Adds a calming scent to the hair\r\nCoconut oil: Nourishes the hair and adds moisture\r\nAll Ingredients:\r\nWater, Cetearyl Alcohol, Dimethicone (And) Amodimethicone (And) Peg-7 Propylheptyl Ether (And) Cetrimonium Chloride, Behentrimonium Chloride (And) Dipropylene Glycol, Stearamidopropyl Dimethylamine, Cocos Nucifera (Coconut) Oil, Perfume, L-Lysine Monohydrochloride, Helianthus Annuus (Sunflower) Seed Oil, Argania Spinosa (Argan) Kernel Oil, Lavandula Angustifolia (Lavender) Oil, Lactic Acid, Disodium Edta, Benzyl Alcohol, 1, 2-Hexanediol, Sodium Chloride, Citronellol, Coumarin, Limonene, Linalool. Plant Based Ingredients\r\n\r\nHow to Use:\r\nAfter shampooing and conditioning, towel dry your hair. Apply the hair mask gently all over the hair without applying it to the scalp. Leave it to rest for 20-25 minutes and rinse thoroughly with water.','products/hair13.png',55,36,4,6),(29,'Minimalist Hair Growth Actives 18% Scalp Serum With Capixyl, Redensyl For Hair Fall Control (30ml)',799.00,'Get luscious hair with the Minimalist Hair Growth Actives 18% Scalp Serum With Capixyl Redensyl For Hair Fall Control (30ml) This anti-hair fall serum contains a blend of five powerful ingredients, including capixyl, redensyl, procapil, anagain, and baicapil, which have been proven to promote hair growth. The daily-use hair serum also is packed with a mix of peptides and extracts to help reduce hair fall, stimulate new hair growth and provide fuller, thicker hair.\r\n\r\nKey Features & Benefits:\r\nHair growth serum is infused with five ingredients like capixyl 5%, redensyl 3%, procapil 3%, anagain 3%, and baicapil 4% in a high concentration of 18%\r\nReduces hair fall by the 8th week and promotes new hair growth by the 12th week\r\nEnriched with saw palmetto extract and sanguisorba officinalis (SO) root extract to further enhance the performance of hair serum\r\nWith pH 5.0 - 6.0 to suit all hair types\r\nFree from fragrance, essential oil, and paraben\r\nKey Ingredients:\r\nCapixyl, redensyl, procapil, anagain, and baicapil: Promote hair growth\r\nSaw palmetto extract and sanguisorba officinalis root extract: Enhance the performance of hair serum\r\nHow to Use:\r\nApply this serum once a day, preferably at night. Apply few drops onto clean and dry scalp and massage thoroughly. This product works on your scalp, so applying it to your hair strands is not necessary. Leave it overnight and see results after four to six weeks of daily use.\r\n\r\nAll Ingredients:\r\nButylene Glycol, Aqua, Dextran, Acetyl Tetrapeptide-3, Trifolium Pratense (Clover) Flower Extract, Propanediol, Arginine, Glycine Soja (Soybean) Germ Extract, Triticum Vulgare (Wheat) Germ Extract, Scutellaria Baicalensis Root Extract, Sodium Benzoate, Gluconolactone, Calcium Gluconate, Glycerin, Ppg-26-Buteth-26, Peg-40 Hydrogenated Castor Oil, Apigenin, Oleanolic Acid, Biotinoyl Tripeptide-1, Pisum Sativum (Pea) Sprout Extract, Isomalt, Sodium Metabisulfite, Larix Europaea Wood Extract, Glycine, Zinc Chloride, Camellia Sinensis Leaf Extract, Xylitylglucoside, Anhydroxylitol, Xylitol, Saccharide Isomerate, Sanguisorba Officinalis Root Extract, Serenoa Serrulata (Saw Palmetto) Fruit Extract, Capryloyl Glycine, Phenoxyethanol, Ethylhexylglycerin, Citric Acid, Sodium Citrate, Lactic Acid','products/hair14.png',34,37,4,3),(30,'LOVE beauty AND planet Argan Oil and Lavender Sulphate Free Shampoo for Dry & Frizzy hair',603.00,'Add softness and moisture to unruly locks with the LOVE beauty AND planet Argan Oil And Lavender Smooth And Serene Shampoo (400ml). This anti-frizz shampoo contains moroccan argan oil and organic coconut oil to intensely hydrate, nourish, smoothen, and moisturize the hair while controlling frizz. Also, this Love Beauty and Planet moisturizing shampoo has a calming scent of lavender flowers to leave the hair smelling divine.\r\n\r\nKey Features & Benefits:\r\nInfused with moroccan argan oil to moisturize and smoothen frizzy hair\r\nContains organic coconut oil to hydrate the hair\r\nFeatures a floral lavender scent to refresh the hair\r\nHas a vegan formula free from sulfates, parabens, and dyes for safe use\r\nKey Ingredients:\r\nArgan oil: Moisturizes and smoothens the hair\r\nFrench lavender: Adds a calming scent to the hair\r\nCoconut oil: Nourishes the hair and adds moisture\r\nAll Ingredients:\r\nWater, Sodium Methyl Cocoyl Taurate, Cocamidopropyl Betaine, Dimethiconol (And) Trideceth-10 (And) Tea Dodecylbenzenesulfonate, Perfume, L-Lysine Monohydrochloride, Cocos Nucifera (Coconut) Oil, Argania Spinosa (Argan) Kernel Oil, Lavandula Angustifolia (Lavender) Oil, Stearamidopropyl Dimethylamine, Glycol Distearate, Laureth-4, Citric Acid Monohydrate, Sodium Benzoate, Carbomer, Sodium Chloride, Polyquaternium-10, Ppg-9, Disodium Edta, Citronellol, Coumarin, Limonene, Linalool.\r\n\r\nHow to Use:\r\nFirst, wet your hair thoroughly. Then, squeeze the required amount of shampoo on your palm and create a lather by rubbing your hands together. Next, apply the lathered shampoo on your scalp generously. Last, rinse your hair with water and follow by using a conditioner.','products/hair15.png',23,36,4,6),(31,'Matrix Opti.Care Professional Serum 96Hr Frizz Control with Shea Butter',530.00,'Unleash smooth, shiny hair with the Matrix Opti.Care Professional Serum 96Hr Frizz Control with Shea Butter (100 ml). This lightweight serum is enriched with the goodness of shea butter that penetrates deep into the hair to provide intense moisture, leaving your locks feeling soft. Developed for unmanageable, frizzy hair, it offers 96 hours of frizz control and ensures your hair stays sleek throughout the day. Safe for chemically treated hair, it enhances shine while giving you long-lasting results.\r\n\r\nKey Features & Benefits:\r\nEnriched with shea butter for deep nourishment and moisture\r\nLightweight formula penetrates deeply into the hair follicles providing comprehensive care\r\nDelivers 96-hour frizz control for sleek, frizz-free hair all day\r\nSafe for chemically treated hair\r\nPreferred by more than 100,000 hairstylists globally\r\nKey Ingredients:\r\nShea butter: Moisturizes the hair\r\nAll Ingredients:\r\nWater, Sodium Laureth Sulfate, Dimethicone, Glycol Distearate, Sodium Chloride, Cocamidopropyl Betaine, Citric Acid, Fragrance, Glycerin, Sodium Benzoate, Sodium Hydroxide, Amodimethicone, Coco-Betaine, Guar Hydroxypropyltrimonium Chloride, Trideceth-10, Salicylic Acid, Carbomer, Hexylene Glycol, Peg-100 Stearate, Limonene, Steareth-6, Phenoxyethanol, Linalool, Trideceth 3, Coconut Oil, 2-Oleamido-1, 3-Octadecanediol, Acetic Acid, Fumaric Acid\r\n\r\nHow to Use:\r\nDispense a small amount of serum onto your palms, then rub your hands together to warm the product. Apply evenly to the mid-lengths and ends of your hair, avoiding the scalp to prevent greasiness. Gently comb through to ensure even distribution and focus on areas that need extra shine or frizz control. Style as desired, and for best results, use the serum regularly to keep your hair smooth, shiny, and protected from damage.','products/hair16.png',34,38,4,6),(32,'WishCare Ceramide Anti Dandruff Conditioner - Piroctone Olamine Pre+Probiotics & Hyaluronic Acid',399.00,'Transform your hair care routine with the Ceramide Anti Dandruff Conditioner - Piroctone Olamine, Pre+Probiotics & Hyaluronic Acid. Infused with piroctone olamine and pre+probiotics, this haircare marvel minimizes damage and breakage. Enriched with ceramides, panthenol, and hyaluronic acid, it nourishes each hair strand, boosting hydration and overall moisture levels. The avocado extract helps to improve hair health by protecting against external stressors like pollution and sun exposure while enhancing softness. Perfect for maintaining healthy hair, this conditioner is your go-to for dandruff-free hair.\r\n\r\nKey Features & Benefits:\r\nInfused with piroctone olamine to reduce damage and breakage from dandruff\r\nEnriched with nourishing ingredients like ceramides, panthenol, and hyaluronic acid enhances hydration\r\nContains avocado extract to shield hair from pollution and sun exposure\r\nCombines pre+probiotics to improve overall hair health and leave hair feeling silky and smooth\r\nKey Ingredients:\r\nCeramides, panthenol, and hyaluronic acid: Deeply nourishes hair strands, locking in moisture for softer, more hydrated hair\r\n\r\nAll Ingredients:\r\nDAMAGE & BREAKAGE PROTECTION: This conditioner enhances hair strength and prevents further damage from external stressors like pollution and sun exposure.\r\n\r\nHow to Use:\r\nStart by washing your hair with shampoo and rinsing thoroughly. Next, squeeze out excess water and apply a generous amount of conditioner, focusing on the mid-lengths to the ends of your hair. Leave the conditioner on for a few minutes before rinsing thoroughly with lukewarm water to reveal soft, silky strands.','products/hair17.png',56,39,4,6),(33,'mCaffeine Coffee Shampoo & Conditioner Duo - (2 Pcs)',798.00,'Keep your tresses smooth and shiny with the mCaffeine Coffee Shampoo And Conditioner Duo - (2 Pcs.) This duo includes coffee shampoo and conditioner to deep cleanse your hair while nourishing them. Infused with super ingredients such as coffee, caffeine, protein and argan oil, this hair care duo helps maintain optimum hair and scalp health. The kit also contains pro-vitamin B5t to solve hair fall problems. This dermatologically tested and FDA-approved shampoo and conditioner duo is formulated without parabens, SLS, and silicone for safe use.\r\n\r\nKey Features & Benefits:\r\nEnriched with coffee, caffeine, argan oil and protein for conditioning and nourishment\r\nStrengthens hair and promotes hair growth\r\nRemoves dirt, impurities and product build-up by deep cleansing\r\nFree from paraben, SLS and silicone\r\nSuitable for all hair types\r\nDermatologically tested and FDA approved\r\n100% vegan, cruelty-free, and PETA certified\r\nKey Ingredients:\r\nCoffeePromotes hair growth\r\nCaffeineControls hair fall\r\nProteinNourishes and strengthens the hair shaft\r\nPro-vitamin B5Helps moisturise the scalp and hair follicles\r\nHow to Use:\r\nShampoo: On a wet scalp, apply shampoo and let it lather. Massage your scalp gently for maximum coverage of the shampoo. Then, leave the shampoo on the hair for a few minutes and wash it off with regular bathing water.\r\n\r\nConditioner: Apply conditioner on the washed hair, keep it for a couple of minutes, and then wash it off. Make sure you wash your hair thoroughly to remove all the dirt.\r\n\r\nAll Ingredients:\r\nCoffee & Caffeine, Pro-Vitamin B5, Protein','products/hair18.png',44,40,4,11),(34,'Lipstick Faces Canada  Hd Matte Lipstick, Pigmented And Provides Tea Rose 14 (3.5 G)',600.00,'Slay in style in a single swipe! Formulated in Germany, this crayon will leave your lips looking nothing less than perfect. Developed with a built-in moisturizing formula, experience smooth and creamy application along with constant lip care. One stroke application and super long stay, this one will soon become your safe haven. Packed in a sleek stick with a color stripe at the base, spotting this favourite in your makeup pouch will take no more than a second. Just ‘add to cart’ and the most sought-after matte will be yours.','products/lips11.png',33,22,3,7),(35,'Sheglam Dynamatte Boom Long-Lasting Matte Lipstick - High Key',649.00,'Pamper your lips with the Sheglam Dynamatte Boom Long-Lasting Matte Lipstick - High Key (2.7 g). This matte lipstick delivers a flawless pout that lasts all day, perfect for any occasion. With intense pigments, the Sheglam lipstick provides a rich color payoff in a single stroke. Also, this bullet lipstick does not transfer or get blotchy, ensuring your lips look stunning from morning to night.\r\n\r\nKey Features & Benefits:\r\nIntensely pigmented to deliver a high-coverage finish in a single swipe\r\nDoes not transfer or get blotchy for an even finish\r\nSmudgeproof lipstick keeps your makeup look intact all day\r\nDries to a soft matte finish for a bold look\r\nAll Ingredients:\r\nIngredients: Isododecane, Sucrose Acetate Isobutyrate, Ozokerite, Dimethicone, Ethylhexyl Palmitate, Trimethylsiloxysilicate, Paraffin, Copernicia Cerifera (Carnauba) Wax/Copernicia Cerifera Cera/Cire De Carnauba, Silica Dimethyl Silylate, Polypropylsilsesquioxane, Hydrogenated Styrene/Isoprene Copolymer, Dextrin Isostearate, Synthetic Wax, Cera Microcristallina/Microcrystalline Wax/Cire Microcristalline, Phenoxyethanol, Flavor/Aroma, Tocopheryl Acetate, Caprylyl Glycol, Aluminum Starch Octenylsuccinate, Pentaerythrityl Tetra-Di-T-Butyl Hydroxyhydrocinnamate, Rubus Idaeus (Raspberry) Seed Oil/Rubus Idaeus Seed Oil, Persea Gratissima (Avocado) Oil/Persea Gratissima Oil, Disteardimonium Hectorite, Ricinus Communis (Castor) Seed Oil/Ricinus Communis Seed Oil, Propylene Carbonate, Sodium Hyaluronate, Tribehenin, Hydrogenated Castor Oil, Sorbitan Isostearate, Lactic Acid, Palmitoyl Tripeptide-1, May Contain/Peut Contenir: Titanium Dioxide(Ci 77891), Iron Oxides(Ci 77491, Ci 77492, Ci 77499), Red 7 Lake(Ci 15850), Blue 1 Lake(Ci 42090), Yellow 5 Lake(Ci 19140), Red 28 Lake(Ci 45410)\r\n\r\nHow to Use:\r\nTwist up the bullet and start by defining the edges and corners of your lips. Then, fill your lips with light, sweeping strokes to create a pretty pout.','products/lips12.png',44,27,3,7),(36,'WishCare Tinted Ceramide Lip Balm with SPF 50 PA+++ Kojic Acid & Niacinamide (5g)',251.00,'Let the Wishcare Tinted Ceramide Lip Balm with SPF 50 PA+++ - Kojic Acid & Niacinamide (5g) bring out a flawless pout. Packed with ceramides, this SPF 50 lip balm fortifies your skin barrier for UVA and UVB defense. with a non-sticky, long-lasting formula, this tinted lip balm nourishes and repairs your lips while fading pigmentation. This WishCare lip balm keeps your lips supple, comfortable, and stylish all day long.\r\n\r\nKey Features & Benefits:\r\nPacked with ceramides to strengthen the skin barrier and retain moisture\r\nSPF 50 offers protection from UVA and UVB rays\r\nImproves barrier function by nourishing and repairing the lips\r\nTinted lip balm is non-sticky for optimum comfort\r\nKey Ingredients:\r\nCeramides: Strengthen the skin barrier and retain moisture\r\nNiacinamide and kojic acid: Reduce pigmentation and lighten the lip complexion\r\nShea and cocoa butters: Nourish, condition, and protect the lips\r\nHow to Use:\r\nTwist up the lip balm and glide it across your lips to apply an even layer. Reapply as required throughout the day.','products/lips13.png',32,39,3,10),(37,'Maybelline New York Superstay Teddy Tint Lip and Cheek Color - Knee High',749.00,'Discover the magic of a multi-tasking tint with the Maybelline New York Superstay Teddy Tint Lip and Cheek Color - Knee High (5 ml). This dual-purpose lip color doubles as a cheek color that offers a bouncy, blurred matte finish. With a creamy formula, the Maybelline New York lip tint feels light yet stays put for up to 12 hours. Plus, this transferproof lipstick resists water and smudges for a plush comfort all day.\r\n\r\nKey Features & Benefits:\r\nLip and cheek tint provides a blurred matte finish\r\nCreamy formula glides seamlessly\r\nFormulated to stay put for up to 12 hours while feeling super light on the lips\r\nWaterproof, transferproof, and smudgeproof to keep your makeup intact\r\nAll Ingredients:\r\nDimethicone, Trimethylsiloxysilicate, Nylon-611/Dimethicone Copolymer, Isododecane, Dimethicone Crosspolymer, C30-45 Alkyldimethylsilyl Polypropylsilsesquioxane, Lauroyl Lysine, Silica Silylate, Phenoxyethanol, Sorbic Acid, Ethylhexylglycerin, Disodium Stearoyl Glutamate, Aluminum Hydroxide, Linalool, Silica, Alpha-Isomethyl Ionone, Tocopherol, Parfum / Fragrance\r\n\r\nHow to Use:\r\nSwipe it on clean, dry lips and build up the color to your liking. Dab onto your cheeks, blend with your fingers or a brush, and let it dry for a perfect finish!','products/lips14.png',55,19,3,2),(38,'Sheglam For The Flush Lip & Cheek Tint - It\'s Chili',499.00,'Enhance your natural beauty with the Sheglam For The Flush Lip & Cheek Tint - Fruit Punch (6 ml). This lip and cheek tint offers the perfect flush of color to illuminate your complexion. With a lightweight formula, the Sheglam tint provides a long-lasting, water-like texture that won\'t budge, even after a long day. Also, infused with sodium hyaluronate and fucus extract, this color tint hydrates your skin, leaving your cheeks and lips looking ultra pink and plump.\r\n\r\nKey Features & Benefits:\r\nLightweight texture for comfortable wear all day\r\nEnriched with sodium hyaluronate to moisturize and spirulina to soften\r\nBuildable color for custom use\r\nLiquid formulation makes application a breeze\r\nKey Ingredients:\r\nSodium hyaluronate: Moisturizes the skin\r\nSpirulina: Softens the skin\r\nAll Ingredients:\r\nIngredients: Water/Aqua/Eau, Polysorbate 20, Pentylene Glycol, Phenoxyethanol, Butylene Glycol, Ethylhexylglycerin, Ppg-26-Buteth-26, Peg-40 Hydrogenated Castor Oil, Ethylhexyl Methoxycinnamate, Disodium Edta, Butyl Methoxydibenzoylmethane, Ethylhexyl Salicylate, Fragrance/Parfum, Limonene, Yellow 6 (Ci 15985), Red 33 (Ci 17200), Blue 1 (Ci 42090).\r\n\r\nHow to Use:\r\nApply a small amount of the liquid lip and cheek tint to your fingertips or directly onto your cheeks and lips. Blend gently with your fingers or a brush for a natural flush, building up the color to your desired intensity.','products/lips16.png',23,27,3,2),(39,'Maybelline New York Color Sensational Creamy Matte Lipstick - 657 Nude Nuance',279.00,'Show off your pretty lips with the Maybelline New York Color Sensational Creamy Matte Lipstick - 696 Burgundy Blush (3.9g). This highly-pigmented lipstick comes with a creamy texture and ensures long-lasting wear. It is rich in color and delivers high coverage, so you can apply it without worrying about overdoing it. Also, the Maybelline New York matte lipstick\'s moisturizing formula keeps your lips soft and kissable for hours.\r\n\r\nKey Features & Benefits:\r\n\r\nInfused with shea butter to heal chapped and dry lips\r\nHighly pigmented to offer a rich color payoff\r\nLong-lasting formula offers up to 12-hour wear\r\nLeaves your lips feeling smooth and supple\r\nKey Ingredients:\r\n\r\nShea butter: Heals chapped and dry lips\r\nIsononyl Isononanoate, Octyldodecanol, Oleyl Erucate, Silica, Cera Alba/Beeswax/Sear Debel, Phenyl Trimethicone, Cera Microcristallina/Microcrystalline Wax/Sear Microcrystalline Microcrystals. Restylane, Synthetic Wax, Sesame Indicum Oil/Sesame Seed Oil, Peg-45/Dodecyl Glycol Copolymer, Kaolin, Disteardimonium Hectorite, Dimethicone, Tocopheryl Acetate, Pentamethyl Tetra-D-T-Beauty. L Hydroxyhydrocinnamate, Aluminum, Benzyl Alcohol, Male/Honey/Miel, Parfum/Fragrance. [+/- May/Put] Ingredients: Mica, Ci 77891/Titanium Dioxide, Ci 77491, Ci 77499/Iron Oxides, Ci 15850/Red 7, Ci 45410/Red 28 Lake, Ci 45380/Red 22L. Ak, Ci 1 5985/Yellow 6 Lake, Ci 42090/Blue 1 Lake] Fil D 166274/2\r\n\r\nHow to Use:\r\n\r\nTwist up the bullet and start by defining the edges and corners of your lips. Then, fill in the rest of your lips with light, sweeping strokes to create a pretty pout. For best results, exfoliate your lips and moisturize them before applying your lipstick.','products/lips116.png',55,19,3,7),(40,'Rom&nd Zero Velvet Tint - 21 Villain Vest (5.5g)',890.00,'Let the Rom&nd Zero Velvet Tint - 21 Villain Vest (5.5g) elevate your look. This long-lasting lip tint stays on for hours without flaking or fading off. The creamy formula of the Rom&nd hydrating lip tint blurs the appearance of imperfections while giving your lips a velvety finish.\r\n\r\nKey Features & Benefits:\r\nLightweight formula glides smoothly along the lips\r\nLong-lasting formula stays put all day\r\nOffers a blurring effect to hide imperfections\r\nHighly pigmented formula gives a velvety finish\r\nKey Ingredients:\r\nTitanium dioxide: Protects the lips from UV rays\r\nGlycerin: Moisturizes the lips\r\nAll Ingredients:\r\nDimethicone, Dimethicone Crosspolymer, Polyglyceryl-2 Triisostearate, Tribehenin, Diisostearyl Malate, Macadamia Ternifolia (Macadamia) Seed Oil, Olea Europaea (Olive) Fruit Oil, Simmondsia Chinensis (Jojoba) Seed Oil, Vitis Vinifera (Grape) Seed Oil, Gossypium Herbaceum (Cotton) Seed Extract, Cetyl Peg/Ppg-10/1 Dimethicone, Vp/Hexadecene Copolymer, Polyglyceryl-2 Diisostearate, Butyl Acrylate/Hydroxypropyl Dimethicone Acrylate Copolymer, Isododecane, Isobutylmethacrylate/Bis-Hydroxypropyl Dimethicone Acrylate Copolymer, Water, Glycerin, Butylene Glycol, Sucrose Palmitate, Fragrance, Red 33 Lake (Ci 17200), Iron Oxide (Ci 77491), Titanium Dioxide (Ci 77891), Hydrogenated Lecithin, Yellow 5 Lake (Ci 19140), Hydrogenated Lecithin Dehydroacetic Acid, Iron Oxides (Ci 77491), Red 28 Lake (Ci 45410), Yellow 6 Lake (Ci 15985), Iron Oxides (Ci 77499), Red 22 Lake (Ci 45380), Blue 1 Lake (Ci 42090), Dehydroacetic Acid, Iron Oxides (Ci 77492), Red 7 Lake (Ci 15850:1)\r\n\r\nHow to Use:\r\nPull out the applicator wand and wipe off excess product on the bottle rim. Starting at the inner part of your lips, apply a light layer of lip tint evenly across your lips. Once dry, you can go in with more light layers to build up the color to the perfect intensity.','products/lips17.png',33,42,3,10),(41,'RENEE Madness PH Stick - Pink Pay Off',399.00,'Play lipstick roulette with the Renee Madness PH Stick - Pink Pay Off (3g). This color-changing lipstick surprises you by changing shade according to your skin\'s pH levels. It is a long-lasting lipstick enriched with essential oils to enhance the natural tone of the lips. It is a vegan lipstick, so you can feel good about using this Renee lipstick every day.\r\n\r\nKey Features & Benefits:\r\nChanges shade according to your lip pH level\r\nEnriched with essential oils to nourish the skin and bring out its natural color\r\nLong-lasting natural lip tint\r\nVegan and cruelty-free for safe and guilt-free use\r\nKey Ingredients:\r\nJojoba oil: Protects the skin and clears pores\r\nOlive oil: Hydrates the skin and soothes irritation\r\nShea butter: Nourishes the skin and moisturizes it\r\nMacadamia oil: Reduces inflammation and soothes sensitive skin\r\nVitamin E: Protects and repairs damaged skin\r\nAll Ingredients:\r\nCaprylic Capric Triglyceride, Ozokerite, Butyrospermum Parkii Butter, Simmondsia Chinensis Seed Oil, Hydrogenated Polyisobutene, Macadamia Ternifolia Seed Oil, Olea Europaea Oil, Flavour, Copernicia Cerifera Cera, Euphorbia Cerifera Cera, Cera Microcristallina, Tocopherol, Tocopheryl Acetate, Ci77499\r\n\r\nHow to Use:\r\nLine the borders of your lips, and then use this lipstick to fill in the rest of your lips with light strokes. Blend the pigment well so that there are no harsh lines. If you want more color, you can apply another layer of the lipstick as required.','products/lips18.png',56,24,3,7);
/*!40000 ALTER TABLE `myapp_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_role`
--

DROP TABLE IF EXISTS `myapp_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_role`
--

LOCK TABLES `myapp_role` WRITE;
/*!40000 ALTER TABLE `myapp_role` DISABLE KEYS */;
INSERT INTO `myapp_role` VALUES (1,'Admin'),(2,'Customer');
/*!40000 ALTER TABLE `myapp_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_unit`
--

DROP TABLE IF EXISTS `myapp_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_unit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unit_name` (`unit_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_unit`
--

LOCK TABLES `myapp_unit` WRITE;
/*!40000 ALTER TABLE `myapp_unit` DISABLE KEYS */;
INSERT INTO `myapp_unit` VALUES (8,'10 gm'),(6,'100 ml'),(1,'15 ml'),(3,'20 ml'),(4,'25 ml'),(7,'3.5 gm'),(2,'5 ml'),(10,'5.5 gm'),(9,'50 gm'),(5,'50 ml'),(11,'pices');
/*!40000 ALTER TABLE `myapp_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_wishlist`
--

DROP TABLE IF EXISTS `myapp_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myapp_wishlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_wishlist_product_id_85e36668_fk_myapp_product_id` (`product_id`),
  KEY `myapp_wishlist_user_id_3f5af099_fk_myapp_customuser_id` (`user_id`),
  CONSTRAINT `myapp_wishlist_product_id_85e36668_fk_myapp_product_id` FOREIGN KEY (`product_id`) REFERENCES `myapp_product` (`id`),
  CONSTRAINT `myapp_wishlist_user_id_3f5af099_fk_myapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_wishlist`
--

LOCK TABLES `myapp_wishlist` WRITE;
/*!40000 ALTER TABLE `myapp_wishlist` DISABLE KEYS */;
INSERT INTO `myapp_wishlist` VALUES (5,'2025-03-02 06:59:16.257510',4,32),(6,'2025-03-02 09:36:52.460413',1,32),(8,'2025-03-02 16:32:00.496646',2,32);
/*!40000 ALTER TABLE `myapp_wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-03 10:35:18
