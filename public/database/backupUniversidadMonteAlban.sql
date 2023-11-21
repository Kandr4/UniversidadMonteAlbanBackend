-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: universidadmontealban_bd
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admissions`
--

DROP TABLE IF EXISTS `admissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `response` text DEFAULT NULL,
  `idCareer` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admissions_url_unique` (`url`),
  KEY `admissions_idcareer_foreign` (`idCareer`),
  CONSTRAINT `admissions_idcareer_foreign` FOREIGN KEY (`idCareer`) REFERENCES `careers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admissions`
--

LOCK TABLES `admissions` WRITE;
/*!40000 ALTER TABLE `admissions` DISABLE KEYS */;
INSERT INTO `admissions` VALUES (1,'Katherine Cummings','ferry.yvonne@nikolaus.org','Omnis dolores saepe repellat illo sit numquam deserunt. Non voluptatem veniam assumenda. Assumenda molestias est dignissimos aliquam corporis voluptatem repudiandae. Ex cum ut facere labore animi.','CKS0VPcBHbrXFXbKt7xztBJMULCxmTndbwZYQpN3','Incidunt magni voluptates et sit vitae velit. Aut pariatur dicta perspiciatis et at ut dolorum numquam. Ab atque ut aut inventore et labore mollitia.',2,'2023-11-21 02:44:19','2023-11-21 02:44:19'),(2,'Eugenia Hettinger','randy.kuhn@schinner.com','Quo iusto velit consequatur reprehenderit consectetur necessitatibus. Qui quasi dolorem sapiente explicabo cum harum laborum maxime.','H63GLPDo4IxjXM4OJ1XXn5N8OI9mvlXcgKsaN2HO','Repellat est consequatur nobis omnis voluptate aperiam. Incidunt sit enim ipsam nesciunt officia temporibus voluptas nostrum. Vero aut sit quo tempore voluptates expedita.',1,'2023-11-21 02:44:19','2023-11-21 02:44:19'),(3,'Maybelle Herzog','ukihn@yahoo.com','Doloribus atque numquam aut velit ut qui voluptates expedita. Illo dolor cumque enim. Quis sed et magni quaerat.','UiESXX2eyBZ8zS5d6InwNrNR6QfTfRwodWRaUaNL','Blanditiis ipsum beatae debitis. Et eius ad accusantium ea unde optio. Expedita qui enim dignissimos aut facere vitae.',2,'2023-11-21 02:44:20','2023-11-21 02:44:20'),(4,'Rey Boyle','vfriesen@gmail.com','At similique assumenda tempore omnis. Aut impedit rem minima. Incidunt id omnis reiciendis et quia quia deleniti. Dolore saepe ipsa doloremque ad quo sunt culpa.','pvDnZ7nEyGAyd9fRYIqalIudePllmYKKw2SpM3yP','Modi nemo tempora officia non voluptatibus ullam. Occaecati similique ipsum officia qui corporis deleniti eaque hic. Animi non voluptas eaque.',1,'2023-11-21 02:44:20','2023-11-21 02:44:20'),(5,'Dorthy Treutel','beatrice.batz@gmail.com','Sint non amet temporibus accusantium. Aliquid consequatur provident porro corporis neque. Aliquid labore autem quia aperiam delectus laborum hic.','5D0DIE8Y96LHXwYgE3LNk3ERqK3LQyHhRdBPBlSv','Deleniti nostrum eligendi provident qui. Ab rerum dolorem sed odio voluptas. Quos cupiditate ut sequi consequatur perferendis eveniet ut. Rerum sit nihil quisquam ea.',2,'2023-11-21 02:44:20','2023-11-21 02:44:20');
/*!40000 ALTER TABLE `admissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `careers`
--

DROP TABLE IF EXISTS `careers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `careers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `graduationProfile` text NOT NULL,
  `admissionProfile` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careers`
--

LOCK TABLES `careers` WRITE;
/*!40000 ALTER TABLE `careers` DISABLE KEYS */;
INSERT INTO `careers` VALUES (1,'Licenciatura en memes','Este es el texto del perfil de egreso que sera mostrado de la carrera','Perfil de ingreso, el aspirante debe ser un metahumano perron','2023-11-21 02:44:17','2023-11-21 02:44:17'),(2,'Licenciatura en Psicologia','Este es el texto del perfil de egreso que sera mostrado de la carrera','Perfil de ingreso, el aspirante debe ser un metahumano perron','2023-11-21 02:44:17','2023-11-21 02:44:17');
/*!40000 ALTER TABLE `careers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coments`
--

DROP TABLE IF EXISTS `coments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` bigint(20) unsigned NOT NULL,
  `idPost` bigint(20) unsigned NOT NULL,
  `content` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coments_iduser_foreign` (`idUser`),
  KEY `coments_idpost_foreign` (`idPost`),
  CONSTRAINT `coments_idpost_foreign` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `coments_iduser_foreign` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coments`
--

LOCK TABLES `coments` WRITE;
/*!40000 ALTER TABLE `coments` DISABLE KEYS */;
INSERT INTO `coments` VALUES (1,4,3,'Itaque nostrum ea tempore quod harum ducimus. Occaecati rem aliquam vero eos. Nihil molestias modi est consequatur dolorum. Molestias veniam sint voluptatem nostrum quaerat sunt voluptas nam. Sint dolore temporibus qui quisquam beatae dicta.',0,'2023-11-21 02:44:15','2023-11-21 02:44:15'),(2,4,5,'At eos laboriosam alias cupiditate officia. Illum similique rerum quia architecto velit illo qui. Molestiae provident occaecati ab dignissimos. Suscipit suscipit sequi aliquid itaque aperiam. Tempora nulla et aut quas.',0,'2023-11-21 02:44:15','2023-11-21 02:44:15'),(3,3,4,'Et libero perferendis tenetur deleniti est. Dolor aut voluptatem qui vero beatae officiis. Optio et vero temporibus incidunt sit voluptas.',1,'2023-11-21 02:44:15','2023-11-21 02:44:15'),(4,2,8,'Consequatur tempore aspernatur quo et numquam. Quasi sapiente et soluta velit. Eveniet neque odit sunt excepturi deleniti enim aliquam. Voluptatem perferendis veritatis qui.',0,'2023-11-21 02:44:15','2023-11-21 02:44:15'),(5,2,1,'Sint voluptatem sequi saepe. Facere aut dolorum doloremque optio. Rerum nemo veniam rerum laboriosam beatae.',1,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(6,1,7,'Quis impedit ratione iure tempore est. Magni ut reiciendis fugit dolores. Fugiat alias ullam eveniet sapiente dolor consequatur ut. Distinctio eos suscipit ut. Ad aut id et est. Incidunt quasi porro eos velit quia ipsum non.',1,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(7,4,2,'Incidunt excepturi quia expedita quibusdam. Temporibus architecto inventore magni neque aut. Excepturi quam atque qui voluptatem. Illum nihil et quasi. Ut facilis ab labore et soluta voluptatum.',1,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(8,2,9,'Ipsa aspernatur tenetur quam. Impedit soluta et aut est dolor possimus. Quam sequi sed ut ipsum sed est qui. Voluptatibus ut vel quo tempora. Omnis voluptatem et rerum error et. Molestiae aliquam omnis repellat aut iure.',1,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(9,3,2,'Nostrum dolorem odio quia quos eum. Porro itaque consequuntur et sint. Eligendi consectetur delectus ut facere eos suscipit deleniti ipsum. Rerum fugiat laudantium labore sunt sequi. Dignissimos ipsa qui et aliquam.',0,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(10,2,3,'Tempora voluptatibus atque et. Voluptatem facere ipsam sed. Officiis vel dolores reprehenderit quos id molestias qui.',0,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(11,3,7,'Et vitae suscipit accusamus officia repudiandae quis architecto. Eaque natus vitae veritatis architecto. Illo et et cum necessitatibus temporibus ut quia nemo. Est sit neque sunt at voluptatem et rem et.',1,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(12,1,4,'Necessitatibus aut excepturi nobis aut. Beatae tempora consequatur rerum magnam blanditiis doloremque porro. Harum omnis voluptas numquam tempore deserunt.',1,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(13,2,10,'Rerum et aut rerum eius quas eaque. Impedit occaecati in qui incidunt occaecati blanditiis eos. Sit aliquam ipsam facere corporis nesciunt consequatur voluptatem. Quo voluptas quia quasi perspiciatis dolorem quibusdam.',1,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(14,3,5,'Odio quod error sed natus voluptatibus ut id nam. Illo et ut voluptas ipsam saepe inventore deleniti. Magnam quo reiciendis nihil velit id repudiandae. Qui exercitationem vel magni impedit enim rerum.',0,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(15,3,8,'Quo veritatis blanditiis quod voluptatem nesciunt. Qui modi consequatur quia sed dolorem. Culpa rerum voluptatem tempore rerum. Occaecati tenetur aut voluptas neque repellendus commodi cupiditate.',0,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(16,2,4,'Harum voluptates natus sequi ut quo fuga. At ut voluptas eveniet enim incidunt doloribus quaerat. Ea et iure voluptatem molestiae aut magni hic. Laborum qui voluptatem enim culpa quidem.',0,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(17,3,3,'Aut enim qui nostrum et rerum est atque. Natus qui nostrum doloribus id aut. Molestiae pariatur ut autem sit dolorem dolor. Et id omnis officia ea. Et cupiditate perspiciatis voluptatibus. Velit voluptas mollitia veritatis voluptatem.',0,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(18,4,7,'Doloremque ipsa esse eaque magni sint. Dolor occaecati ab praesentium ullam velit est. Sunt necessitatibus debitis facere tempore expedita.',0,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(19,4,10,'Reprehenderit autem maiores occaecati est aut. Ipsam non voluptate sed labore nisi dolorem. Eveniet sed maxime nihil suscipit repudiandae.',1,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(20,1,6,'Autem voluptates at earum. Voluptates accusantium laudantium facilis dolorem itaque eum autem fugit. Est ipsa ducimus magni dolorem quis dolor. Soluta eveniet ipsam omnis molestias occaecati aliquam illo voluptatem.',1,'2023-11-21 02:44:16','2023-11-21 02:44:16');
/*!40000 ALTER TABLE `coments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaints` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `complaints_url_unique` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
INSERT INTO `complaints` VALUES (1,'Glenda Weissnat','roxane92@brekke.info','Adipisci blanditiis corrupti voluptas neque. Iste fuga voluptatem et molestias qui voluptatem nisi. Voluptas sequi quis sunt molestiae ut animi. Eligendi suscipit possimus iusto ipsa et.','dJdDzNdIiGGvv72N3f8vLSJSmAS90LPsosHPGV1o',0,'2023-11-21 02:44:19','2023-11-21 02:44:19'),(2,'Ms. Melyna Cormier','camryn45@robel.com','Dolores architecto voluptate itaque culpa quidem. Molestiae placeat dolorum nemo corrupti ratione eaque. Harum natus repellendus facere excepturi dolore quia.','4d2x9FzhlwimN7vPyCUwAQp4yp7etA9D5VzVxp6t',0,'2023-11-21 02:44:19','2023-11-21 02:44:19'),(3,'Dr. Buster Harris I','irice@gmail.com','Aut nihil voluptatum quia sint dolorem. Soluta nostrum voluptates quisquam esse repellat magnam. Sunt omnis ea sint porro accusantium.','tgi4B3cYSe3oQLTIAP9Rw7rBFWGPDX3O1bk0lrdE',0,'2023-11-21 02:44:19','2023-11-21 02:44:19'),(4,'Taylor O\'Conner','reuben30@littel.com','Earum voluptas error nulla ratione. Et deleniti sit iste itaque. Illum inventore itaque veritatis officiis deserunt ea sint dolorem.','GyKQerW2ANnWW1yP7MU2f7QTV1WUPVT0SBewy3LS',0,'2023-11-21 02:44:19','2023-11-21 02:44:19'),(5,'Alberto Lehner','angeline75@hotmail.com','Et iste ut sit aut sed et velit. Omnis culpa debitis qui quo neque. Accusantium fugiat consectetur ea consequatur et nemo. Eos facilis et est cupiditate.','GOHtm1kCzyAXFzyZwvAs2kgFuo61r8mIcqDN85ww',0,'2023-11-21 02:44:19','2023-11-21 02:44:19');
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `database_logs`
--

DROP TABLE IF EXISTS `database_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `database_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` bigint(20) unsigned NOT NULL,
  `operation` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `database_logs_iduser_foreign` (`idUser`),
  CONSTRAINT `database_logs_iduser_foreign` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_logs`
--

LOCK TABLES `database_logs` WRITE;
/*!40000 ALTER TABLE `database_logs` DISABLE KEYS */;
INSERT INTO `database_logs` VALUES (1,3,'Backup Creation','2023-11-20','2023-11-21 02:44:49','2023-11-21 02:44:49'),(2,3,'Restauración','2023-11-21','2023-11-21 06:01:32','2023-11-21 06:01:32'),(3,3,'Respaldo','2023-11-21','2023-11-21 09:52:32','2023-11-21 09:52:32');
/*!40000 ALTER TABLE `database_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `eventName` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `type` int(11) NOT NULL,
  `idPost` bigint(20) unsigned DEFAULT NULL,
  `idUser` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `events_idpost_foreign` (`idPost`),
  KEY `events_iduser_foreign` (`idUser`),
  CONSTRAINT `events_idpost_foreign` FOREIGN KEY (`idPost`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `events_iduser_foreign` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Blanditiis laboriosam ex sequi nostrum illum alias voluptatem.','Maxime ex explicabo dolore labore quam voluptatem sed. Aut sed dolorem iste quas. Aut sint ipsa ipsam numquam hic facere rem.','2023-11-09',2,1,1,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(2,'Perferendis aperiam et fuga delectus distinctio.','Eveniet dolore libero ea asperiores ipsum ut magni. Ab assumenda est maxime. Saepe ut nisi nisi voluptatem animi omnis. Ex deleniti explicabo inventore delectus optio pariatur.','2023-11-21',1,3,4,'2023-11-21 02:44:17','2023-11-21 02:44:17'),(3,'Quis quo illum praesentium quisquam quasi aut cupiditate.','Reiciendis eaque unde voluptas nesciunt natus blanditiis. Quam omnis voluptatibus minima totam labore sit ex. Neque omnis illo illo accusantium ab quis nihil rerum. Tenetur necessitatibus modi fugiat odio.','2023-11-11',1,7,2,'2023-11-21 02:44:17','2023-11-21 02:44:17'),(4,'Illum iusto incidunt similique iure.','Tempora officiis non temporibus quis ea. Veritatis autem recusandae exercitationem qui quibusdam ullam veritatis suscipit.','2023-11-06',1,4,4,'2023-11-21 02:44:17','2023-11-21 02:44:17'),(5,'Quia atque ipsam est sit dolores dolorem omnis earum.','Magni et rem ducimus fugiat rerum. Omnis optio cum rerum officia repellat sint. Fugiat et nemo in nobis. Ut consequatur voluptas inventore incidunt nesciunt id delectus.','2023-11-06',4,6,1,'2023-11-21 02:44:17','2023-11-21 02:44:17');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (185,'2014_10_12_000000_create_users_table',1),(186,'2014_10_12_100000_create_password_reset_tokens_table',1),(187,'2019_08_19_000000_create_failed_jobs_table',1),(188,'2019_12_14_000001_create_personal_access_tokens_table',1),(189,'2023_10_31_070318_create_posts_table',1),(190,'2023_10_31_172923_create_coments_table',1),(191,'2023_11_01_151611_create_testimonials_table',1),(192,'2023_11_06_154051_create_events_table',1),(193,'2023_11_09_191543_create_careers_table',1),(194,'2023_11_09_191632_create_subjects_table',1),(195,'2023_11_15_082257_create_complaints_table',1),(196,'2023_11_17_033306_create_admissions_table',1),(197,'2023_11_20_202714_create_database_logs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `legend` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `idUser` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_iduser_foreign` (`idUser`),
  CONSTRAINT `posts_iduser_foreign` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Minus aliquid nam placeat officia vel autem iste.','Ullam sed et in ad voluptatem provident aliquam.','Autem est soluta voluptate sunt ad quaerat. Facere commodi voluptatem exercitationem officia et autem. Ut laudantium veritatis est iusto nisi impedit velit quia.','image_1.webp','Cambia esto perroooooo',3,'2023-11-21 02:44:15','2023-11-21 02:44:15'),(2,'Tenetur totam eligendi deserunt possimus perferendis ab.','Error harum autem et alias rerum cum.','Delectus omnis facilis officiis consequatur. Porro asperiores dolorum aut illum atque natus velit voluptates. Voluptas et neque iusto facilis. Architecto nesciunt enim est nostrum. Sunt eaque dicta libero sit quia id itaque quas.','image_1.webp','Cambia esto perroooooo',3,'2023-11-21 02:44:15','2023-11-21 02:44:15'),(3,'At a rem libero voluptas et.','Dolorem et animi corporis et voluptatem.','Voluptas blanditiis debitis aliquam optio rerum ut. Veniam tenetur maiores non voluptate voluptates non. Iure facere itaque tempore expedita eum.','image_1.webp','Cambia esto perroooooo',3,'2023-11-21 02:44:15','2023-11-21 02:44:15'),(4,'Sit officia debitis sunt aut quis ad et unde.','Veniam ex optio atque iure ab veritatis hic.','Cumque commodi dolor omnis illum ullam. Quisquam illum voluptas quas porro maxime explicabo ut. Dicta quidem id veritatis aspernatur.','image_1.webp','Cambia esto perroooooo',2,'2023-11-21 02:44:15','2023-11-21 02:44:15'),(5,'Totam quos illo fugiat saepe.','Est id magni quis fugiat voluptas mollitia.','Unde nihil sunt fugiat ut. Qui incidunt inventore ut omnis enim. Impedit voluptas voluptatem neque magni consequatur beatae. Consequatur voluptatem neque aut ut architecto rem error cumque.','image_1.webp','Cambia esto perroooooo',1,'2023-11-21 02:44:15','2023-11-21 02:44:15'),(6,'Delectus sit laborum mollitia ad architecto soluta pariatur tempora.','Autem soluta nostrum voluptatum optio dolorem optio error.','A natus laudantium nemo fugiat enim voluptas autem optio. Et repellendus consequatur provident libero id aut assumenda. Enim recusandae ea et sequi libero iusto.','image_1.webp','Cambia esto perroooooo',2,'2023-11-21 02:44:15','2023-11-21 02:44:15'),(7,'Natus quod saepe laudantium vitae omnis unde qui est.','Debitis eaque et iusto aspernatur porro iure et quia.','Libero dolorum et neque similique optio. Velit odit nisi soluta. Vitae et ea consectetur est eaque assumenda. Ex nesciunt quo excepturi ut autem perferendis.','image_1.webp','Cambia esto perroooooo',1,'2023-11-21 02:44:15','2023-11-21 02:44:15'),(8,'Debitis accusantium praesentium repellat eum.','Non aspernatur reiciendis qui repudiandae nulla officia omnis.','Assumenda amet sint beatae. Laboriosam expedita mollitia porro. Consectetur numquam voluptas neque.','image_1.webp','Cambia esto perroooooo',1,'2023-11-21 02:44:15','2023-11-21 02:44:15'),(9,'Labore quas consequatur nemo voluptas et ut nemo.','Magni cumque qui dolorem amet minima facere atque.','Aspernatur eos non deleniti nihil deserunt voluptates voluptatum laboriosam. Rem explicabo qui voluptatem accusantium et velit. Temporibus iusto fugit quis. Et aut qui eius facilis. Sit velit reprehenderit officiis molestiae et ipsam quis odio.','image_1.webp','Cambia esto perroooooo',1,'2023-11-21 02:44:15','2023-11-21 02:44:15'),(10,'Voluptas vel consequatur consequatur consectetur omnis.','Et ut voluptatem assumenda at.','Corporis quibusdam eos magnam minus sint. Aperiam repellat autem quo quia et. Recusandae ut non ratione eum.','image_1.webp','Cambia esto perroooooo',3,'2023-11-21 02:44:15','2023-11-21 02:44:15'),(11,'Publicación de prueba para la base de datos','asdfasdfa','asdfasdfasdfasdf','655bd65d76302.webp',NULL,3,'2023-11-21 03:57:50','2023-11-21 03:57:50');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `semester` int(11) NOT NULL,
  `idCareer` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subjects_idcareer_foreign` (`idCareer`),
  CONSTRAINT `subjects_idcareer_foreign` FOREIGN KEY (`idCareer`) REFERENCES `careers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Dr. Moshe Jast V',2,2,'2023-11-21 02:44:17','2023-11-21 02:44:17'),(2,'Prof. Robbie Hammes DVM',5,1,'2023-11-21 02:44:17','2023-11-21 02:44:17'),(3,'Jordane Bergnaum',4,2,'2023-11-21 02:44:17','2023-11-21 02:44:17'),(4,'Jamir Friesen',8,2,'2023-11-21 02:44:18','2023-11-21 02:44:18'),(5,'Roel Pfeffer',2,2,'2023-11-21 02:44:18','2023-11-21 02:44:18'),(6,'Aryanna Metz',8,2,'2023-11-21 02:44:18','2023-11-21 02:44:18'),(7,'Prof. Davonte Morissette',7,2,'2023-11-21 02:44:18','2023-11-21 02:44:18'),(8,'Alison Auer DDS',4,2,'2023-11-21 02:44:18','2023-11-21 02:44:18'),(9,'Kristin Yost',9,2,'2023-11-21 02:44:19','2023-11-21 02:44:19'),(10,'Margarette Bednar',3,2,'2023-11-21 02:44:19','2023-11-21 02:44:19');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `status` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `img` varchar(255) NOT NULL,
  `idUser` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `testimonials_iduser_foreign` (`idUser`),
  CONSTRAINT `testimonials_iduser_foreign` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Jaquan Pfeffer','m','Teacher','Frase generica para los testimonios','2023-11-20','imgTestimonio.webp',1,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(2,'Dr. Fidel Wolff Jr.','m','Graduated','Frase generica para los testimonios','2023-11-20','imgTestimonio.webp',2,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(3,'Ariane Hirthe','m','Graduated','Frase generica para los testimonios','2023-11-20','imgTestimonio.webp',2,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(4,'Dr. Nya Lindgren V','m','Graduated','Frase generica para los testimonios','2023-11-20','imgTestimonio.webp',4,'2023-11-21 02:44:16','2023-11-21 02:44:16'),(5,'Hank Metz','m','Graduated','Frase generica para los testimonios','2023-11-20','imgTestimonio.webp',2,'2023-11-21 02:44:16','2023-11-21 02:44:16');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `cookie` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_cookie_unique` (`cookie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'roger@gmail.com','Roger','Rogelio','Elizalde Diaz','2003-03-23','$2y$10$aFBFhYbaMKK3S9hcKYm3QOLWQteY5Y2JtdU4foFgWLDiwqmDZfZ3O',2,'PGRP1FmxShZHDMXNOI5CE1a6WN4Coq2NLb0Kg609','2023-11-21 02:44:14','2023-11-21 06:19:25'),(2,'chavez@gmail.com','Gixarde3','Marco','Chávez Rodríguez','2003-03-23','$2y$10$PQtFsZS7riPpvBFvvU..ceFO4VcWF4l21gTrSAs/KJ/pG7uwFzeFu',2,'lJB1fx7mgVLOFsTBGlZbwnQLMB0HCX9rmFLfH5Ej','2023-11-21 02:44:14','2023-11-21 02:44:14'),(3,'superAdmin@gmail.com','superAdmin','Super','Admin','2003-03-23','$2y$10$Aqy2bTkSwK9.xyffCSZJ7.XSq38HbpZv8f9In3JPllDG1vCcEzjDi',3,'Ba7ROj9dYnt6WXvebhaORe3NENXCmnRzd4wPQBt9','2023-11-21 02:44:14','2023-11-21 06:19:47'),(4,'user@gmail.com','normalUser','User','Common','2003-03-23','$2y$10$cLg/cnJpyDSp4iSq7o9I4ug6VTKkFZPw2QcMYvn5bbwbc6NJyrrfq',1,'uGIzzAu1dtSOCqszQu3wIKGo3WX4yDwph1QjUoe4','2023-11-21 02:44:15','2023-11-21 02:44:15');
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

-- Dump completed on 2023-11-20 22:17:49
