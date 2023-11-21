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
INSERT INTO `admissions` VALUES (1,'Jose Brown III','blick.claude@smitham.net','Vero fugiat ut aut ab repellat. Et molestiae atque dignissimos laboriosam. Impedit sit tenetur omnis ea molestiae similique. Molestiae eligendi sapiente officia ipsam velit minima maxime.','5e8jAigclOpBeWZp3veA8FrlUa5eiiBtMYY0t6WH','Quis hic eum porro aut et. Fuga possimus beatae ut doloribus dolores quis est. Quaerat ut rem dolorum consequatur. Ut vero enim rerum accusamus harum aliquid dolorem.',2,'2023-11-21 03:59:38','2023-11-21 03:59:38'),(2,'Ms. Fiona Torphy V','kaitlyn.jakubowski@hotmail.com','Quidem at alias ipsam aut explicabo est. Temporibus et numquam tempora. Sit facilis quae modi ratione rerum. Consectetur dignissimos magni qui aperiam ratione est nobis.','6Wy1sF8xmn8yeKc5KRbBFtThTI51X7SXvgnmsMlt','Magnam labore consectetur repudiandae et quos nulla. Qui beatae atque necessitatibus ipsam et sed. Laudantium est qui est repudiandae. Explicabo sed non et adipisci.',2,'2023-11-21 03:59:38','2023-11-21 03:59:38'),(3,'Shawna Erdman','eulalia64@effertz.net','Cumque temporibus autem aperiam sunt qui porro. Doloribus enim vel nesciunt tenetur itaque est. Ipsa ut ipsam et ea ut.','z9zfxnPQIBgNaAnCg2XmHl6gB4jN3W85gHpplLeg','Qui illo voluptates nihil consequatur rem possimus. Hic vel qui molestias.',2,'2023-11-21 03:59:38','2023-11-21 03:59:38'),(4,'Prof. Yvonne Jakubowski','mckenna07@gmail.com','Sequi dolorum nemo omnis. Ut non dolor ut quod ut eos earum. Porro qui nam nulla mollitia nam. Et necessitatibus minus magni quod. Sed impedit eos dicta qui perferendis et omnis.','gQQt5rXWxkJ3KB7lORIMip3A0wNxJHdd8VoeAaiU','Dolorem placeat officiis magnam sed tempora sint dolorem fuga. Iure hic et fuga voluptate sed dicta nobis. Ducimus quo possimus et quibusdam in laudantium modi. Impedit quasi rem consequuntur velit.',1,'2023-11-21 03:59:38','2023-11-21 03:59:38'),(5,'Susie Erdman II','jennifer83@krajcik.com','Occaecati et ratione voluptas eius. Vel eaque sapiente qui voluptatem. Nihil blanditiis tenetur veritatis et quo quibusdam facere.','O1xvUgOkJSM0aH1zv4p0BlycNwfwWE1yHTeUGjoh','Nemo eos omnis qui. Ratione aut eveniet aperiam est sapiente in rem. Ipsum illum qui quo est soluta rerum.',2,'2023-11-21 03:59:38','2023-11-21 03:59:38');
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
INSERT INTO `careers` VALUES (1,'Licenciatura en memes','Este es el texto del perfil de egreso que sera mostrado de la carrera','Perfil de ingreso, el aspirante debe ser un metahumano perron','2023-11-21 03:59:35','2023-11-21 03:59:35'),(2,'Licenciatura en Psicologia','Este es el texto del perfil de egreso que sera mostrado de la carrera','Perfil de ingreso, el aspirante debe ser un metahumano perron','2023-11-21 03:59:35','2023-11-21 03:59:35');
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
INSERT INTO `coments` VALUES (1,4,7,'Impedit illo sunt rerum est. Ut ea quo accusantium rerum est fugiat pariatur dignissimos. Aliquid est culpa inventore odio est magni corrupti. Ea eveniet necessitatibus aut excepturi aut.',1,'2023-11-21 03:59:33','2023-11-21 03:59:33'),(2,4,3,'Et sit eius officia est facere. Quia sed nesciunt nemo corrupti soluta et asperiores.',1,'2023-11-21 03:59:33','2023-11-21 03:59:33'),(3,3,3,'Vel assumenda ab ea itaque voluptas. Assumenda eos minima quia. Ea quia explicabo magni commodi. Exercitationem ab unde quia sed suscipit. Minima a dolores velit omnis at praesentium.',0,'2023-11-21 03:59:34','2023-11-21 03:59:34'),(4,1,9,'Libero aperiam aliquam voluptatem eum ea velit. Optio distinctio sit minima sunt impedit eius libero consectetur. Saepe enim consequatur est. Et eos maiores aperiam molestiae minus eius iste alias.',1,'2023-11-21 03:59:34','2023-11-21 03:59:34'),(5,4,4,'Cum optio et inventore placeat doloribus. Expedita qui dolor expedita. Animi fugit eum nisi at. Nihil alias esse sequi reprehenderit similique ab.',0,'2023-11-21 03:59:34','2023-11-21 03:59:34'),(6,3,6,'Et necessitatibus qui laudantium rerum ut. Sit eos quos sunt aut quam harum. Labore quisquam consectetur tempora culpa voluptas aliquid veritatis. Molestiae veniam laboriosam animi. Modi sed sapiente eveniet rem ad facere quod.',1,'2023-11-21 03:59:34','2023-11-21 03:59:34'),(7,4,9,'Delectus dolorum ea unde architecto dolorem corporis. Voluptatem et consequuntur facere ut voluptate saepe maxime soluta. Aut nulla dolor praesentium dignissimos cum consequatur.',1,'2023-11-21 03:59:34','2023-11-21 03:59:34'),(8,1,2,'Laudantium sunt quia maiores aliquid repellat. Perferendis molestias aut ipsam sed rem placeat dolores. Accusantium beatae quo amet. Unde libero odit quidem vero eius eos dicta. Error earum necessitatibus nostrum et nemo.',1,'2023-11-21 03:59:34','2023-11-21 03:59:34'),(9,1,9,'Ratione enim doloribus ipsam aliquam et. Occaecati ducimus qui est exercitationem ut nam exercitationem odit. Dicta ut unde maiores aspernatur itaque iste sint.',1,'2023-11-21 03:59:34','2023-11-21 03:59:34'),(10,1,5,'Ex sint officiis quis est sapiente. Cumque deleniti molestias ea ad dolor quisquam. A ut illo ea beatae ut perferendis. Eum assumenda corrupti non id unde est quos. Et consequatur aut porro enim exercitationem dolor. Et illo iste maiores.',1,'2023-11-21 03:59:34','2023-11-21 03:59:34'),(11,2,4,'Unde officia a quia dolorum soluta libero id. Non quis voluptas aut ut voluptas. Rerum soluta inventore quas voluptas aut.',1,'2023-11-21 03:59:34','2023-11-21 03:59:34'),(12,1,7,'Eos fugit necessitatibus excepturi unde ad. Qui unde aut sit voluptatem est. Est laudantium sit quis voluptatem non animi. Tenetur quidem rerum pariatur laudantium dolores.',0,'2023-11-21 03:59:34','2023-11-21 03:59:34'),(13,3,8,'Debitis ut ratione ut maiores. Ut ipsam maxime est sequi culpa eos corrupti. Voluptas eaque numquam cupiditate et et voluptatem.',1,'2023-11-21 03:59:34','2023-11-21 03:59:34'),(14,1,3,'Facilis maxime inventore necessitatibus aut et voluptatem. Error in totam fuga aut asperiores a. Quia voluptas sed ipsa inventore quis quaerat ut.',1,'2023-11-21 03:59:34','2023-11-21 03:59:34'),(15,4,9,'Ut fugit distinctio omnis cumque fugit id. Molestias nihil consequatur exercitationem earum vel. Qui nihil qui commodi autem ut alias ipsum. Id et sit in aliquam aut eius voluptatem.',1,'2023-11-21 03:59:34','2023-11-21 03:59:34'),(16,3,8,'Commodi molestiae quo cumque quibusdam assumenda dicta magnam. Mollitia ab libero rerum provident dolorem nostrum. Nesciunt consequuntur odio eaque repellendus dolorem. Accusamus nobis est pariatur et. Quo harum consequatur amet rerum.',0,'2023-11-21 03:59:34','2023-11-21 03:59:34'),(17,4,7,'Suscipit hic sunt consectetur. Voluptatum dolore quisquam perspiciatis quidem labore voluptatem. Dicta ad itaque accusamus dolorem. Sed est sed saepe dolores deserunt adipisci dolore.',1,'2023-11-21 03:59:34','2023-11-21 03:59:34'),(18,4,4,'Vero tempore saepe qui dolorem dolore atque. Quos ipsum praesentium blanditiis earum architecto. Corporis molestiae rerum harum libero odit voluptate. Itaque ex voluptas ipsam mollitia sint.',1,'2023-11-21 03:59:34','2023-11-21 03:59:34'),(19,3,1,'Vel dignissimos omnis consequatur beatae recusandae in. Neque omnis aut eius. Perspiciatis nisi dolorem aut porro aut quae necessitatibus. Quia nam eligendi corrupti ad ut at dolor enim.',0,'2023-11-21 03:59:34','2023-11-21 03:59:34'),(20,2,3,'Sunt ut facere sit velit. Consequatur adipisci saepe sint. Ut est eos iure quia nesciunt neque possimus.',1,'2023-11-21 03:59:34','2023-11-21 03:59:34');
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
INSERT INTO `complaints` VALUES (1,'Hipolito White','khackett@gmail.com','Et omnis alias consequuntur temporibus. Vel nam amet ut minima. Consequatur perspiciatis quaerat quia necessitatibus.','EyNmVRyFBSkuLSQRJZjnPPOQKqyY63298T2elXeG',0,'2023-11-21 03:59:37','2023-11-21 03:59:37'),(2,'Prof. Marc McClure V','runte.bianka@gmail.com','Eum dicta deleniti quam quasi consequatur facere voluptas. Repellendus ipsum qui qui. Odit sunt id omnis nostrum.','kMt7Qn0c0BZsy102FQsM6bzs3IWikroJbS4yOAMM',0,'2023-11-21 03:59:37','2023-11-21 03:59:37'),(3,'Prof. Sammie Kuhn IV','gutmann.destin@anderson.com','Quibusdam iste dolore in corrupti ab consequatur eveniet. Quo dolore minus quasi omnis ea repudiandae officiis. Itaque rerum beatae eaque dolor consequuntur velit reprehenderit.','lVigAtN4T2urWAPllvjooStSnKmOxehdm0zzMS3v',0,'2023-11-21 03:59:37','2023-11-21 03:59:37'),(4,'Jeff Miller I','weissnat.jonatan@yahoo.com','Impedit vero dolor impedit impedit amet. Magnam alias dolorum maxime quas quod. Expedita omnis nulla et id impedit temporibus nisi.','MkCOPjBp9gW1C9Nvn1PPHrCnERC8dKpyoxxNzz7X',0,'2023-11-21 03:59:37','2023-11-21 03:59:37'),(5,'Robin Huels Sr.','josue.bins@gmail.com','Omnis nihil quod sint minus saepe a quibusdam. Nisi praesentium aut omnis vel velit corporis. Sit enim exercitationem eos fugiat. Earum minus facere blanditiis enim cum aut magni.','MrJ7XCViqSflHtH7Ug8pP7enFkMcEWQlT1raL3nc',0,'2023-11-21 03:59:37','2023-11-21 03:59:37');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_logs`
--

LOCK TABLES `database_logs` WRITE;
/*!40000 ALTER TABLE `database_logs` DISABLE KEYS */;
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
INSERT INTO `events` VALUES (1,'Est voluptatum optio et est quaerat.','Quae ipsa totam porro illum. In quod doloribus numquam corrupti rerum et sapiente. Voluptas incidunt est dicta. Quae adipisci quasi tempora officiis non. Id atque exercitationem cum eum quisquam distinctio nobis.','2023-11-21',1,7,2,'2023-11-21 03:59:35','2023-11-21 03:59:35'),(2,'Blanditiis error consequatur architecto eos quae mollitia ut.','Molestiae voluptatum commodi harum eveniet. Explicabo vel natus dolorem consectetur. Numquam facere quaerat incidunt iste eius. Natus molestiae aut aut ab at a alias quia. Ea totam dicta occaecati et consectetur aut unde.','2023-11-29',1,6,3,'2023-11-21 03:59:35','2023-11-21 03:59:35'),(3,'Aut vitae nam repellat aliquam veritatis saepe.','Sit laborum minima et ipsa earum dolore vero. Debitis voluptatem quo est perferendis necessitatibus dolor harum nihil. Et similique dolorem aut. Enim ut et eum beatae.','2023-11-18',5,7,4,'2023-11-21 03:59:35','2023-11-21 03:59:35'),(4,'Culpa ratione dolor accusamus fuga placeat reiciendis in.','Dicta et ut aperiam nisi nesciunt vel. Sint rerum nemo eligendi nam consequatur labore et ab. Qui qui harum eius ipsam eum. Recusandae repellat et modi sit.','2023-11-29',1,7,2,'2023-11-21 03:59:35','2023-11-21 03:59:35'),(5,'Accusamus dicta porro quas.','Perspiciatis doloribus harum soluta. Ut soluta voluptatem ad non. Ad sed voluptas non velit perferendis sunt. Quis aliquid nisi distinctio laborum animi qui.','2023-11-25',5,8,4,'2023-11-21 03:59:35','2023-11-21 03:59:35');
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
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (198,'2014_10_12_000000_create_users_table',1),(199,'2014_10_12_100000_create_password_reset_tokens_table',1),(200,'2019_08_19_000000_create_failed_jobs_table',1),(201,'2019_12_14_000001_create_personal_access_tokens_table',1),(202,'2023_10_31_070318_create_posts_table',1),(203,'2023_10_31_172923_create_coments_table',1),(204,'2023_11_01_151611_create_testimonials_table',1),(205,'2023_11_06_154051_create_events_table',1),(206,'2023_11_09_191543_create_careers_table',1),(207,'2023_11_09_191632_create_subjects_table',1),(208,'2023_11_15_082257_create_complaints_table',1),(209,'2023_11_17_033306_create_admissions_table',1),(210,'2023_11_20_202714_create_database_logs_table',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Sit quo neque reprehenderit necessitatibus rerum.','Est amet autem reprehenderit at et pariatur.','Nihil voluptatem cupiditate corrupti doloremque qui. Quae est qui aspernatur. Alias eos voluptatem ipsam ab voluptas unde temporibus. Quaerat cum quia et eaque enim. Est nesciunt incidunt qui et vero.','image_1.webp','Cambia esto perroooooo',4,'2023-11-21 03:59:33','2023-11-21 03:59:33'),(2,'Numquam ut sed aut nihil ut cum similique.','Nam odit omnis accusamus.','Quos aut necessitatibus aut debitis soluta deleniti aut. Fuga rem numquam commodi sapiente aut incidunt consequuntur. Deserunt dolores sequi rem ut cum.','image_1.webp','Cambia esto perroooooo',2,'2023-11-21 03:59:33','2023-11-21 03:59:33'),(3,'Odio illo quia in officia et voluptas.','Eius recusandae eos aliquam perspiciatis dolores velit et voluptatum.','Labore veritatis saepe praesentium velit. Molestiae ea adipisci non pariatur. Nisi debitis odit sed ipsum. Non quod accusantium perspiciatis culpa dicta provident vel. Quas quis non hic iste aut laboriosam ut velit.','image_1.webp','Cambia esto perroooooo',1,'2023-11-21 03:59:33','2023-11-21 03:59:33'),(4,'Dolorem aperiam perferendis et et commodi consequatur est.','Accusamus quaerat sit excepturi.','Error officia excepturi ea odio debitis. Doloribus sint in consectetur voluptatem velit. Eos eos sit omnis ipsum consectetur quasi.','image_1.webp','Cambia esto perroooooo',2,'2023-11-21 03:59:33','2023-11-21 03:59:33'),(5,'Aut rerum nulla at porro aliquid.','Provident voluptas velit est adipisci illum quasi illum.','Quis possimus ratione exercitationem sequi tempore. Nisi recusandae dolorem sunt explicabo expedita. Et minima error beatae repellendus et provident.','image_1.webp','Cambia esto perroooooo',1,'2023-11-21 03:59:33','2023-11-21 03:59:33'),(6,'Dolores alias labore cum eum sint sint quasi.','Dolorem veniam ea aut ut est quia mollitia aspernatur.','Quis dolor culpa id quo atque ut et. Tenetur omnis sequi voluptas omnis aliquid sed. Ut eligendi doloremque voluptas optio ex distinctio minus. Sint tempora atque qui velit.','image_1.webp','Cambia esto perroooooo',2,'2023-11-21 03:59:33','2023-11-21 03:59:33'),(7,'Modi nobis sit vero aut ut non et velit.','Nobis illo praesentium sit quibusdam.','Explicabo maiores minus voluptatem incidunt. Deleniti laboriosam id placeat provident est voluptatem illo. Dicta nisi aspernatur vitae consequatur. Voluptate temporibus nihil illum optio consectetur ullam maxime.','image_1.webp','Cambia esto perroooooo',2,'2023-11-21 03:59:33','2023-11-21 03:59:33'),(8,'Occaecati ut soluta autem enim exercitationem nostrum quisquam iusto.','Id corrupti sunt incidunt velit non.','Consequatur nihil perspiciatis sint explicabo. Accusamus delectus aut dicta animi voluptatem possimus ducimus. Soluta quia qui iure qui rerum.','image_1.webp','Cambia esto perroooooo',4,'2023-11-21 03:59:33','2023-11-21 03:59:33'),(9,'Optio nulla id optio harum.','Ipsum accusamus illo est eos commodi beatae autem.','Totam dolore esse id neque. Cupiditate occaecati autem dolor nobis voluptatem aperiam. Ullam perferendis excepturi dolores at saepe. Incidunt dolor sed nostrum soluta perspiciatis.','image_1.webp','Cambia esto perroooooo',2,'2023-11-21 03:59:33','2023-11-21 03:59:33'),(10,'Velit eum velit aspernatur placeat eum qui.','Corporis dicta consequuntur est veniam voluptatem.','Libero dignissimos aut incidunt ut sit. Eos qui nobis expedita rerum voluptate quia. Maxime laborum cum enim iste adipisci occaecati.','image_1.webp','Cambia esto perroooooo',4,'2023-11-21 03:59:33','2023-11-21 03:59:33');
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
INSERT INTO `subjects` VALUES (1,'Miss Aubree Swaniawski',1,1,'2023-11-21 03:59:35','2023-11-21 03:59:35'),(2,'Prof. Katharina Luettgen',3,1,'2023-11-21 03:59:36','2023-11-21 03:59:36'),(3,'Prof. Dagmar Strosin',2,2,'2023-11-21 03:59:36','2023-11-21 03:59:36'),(4,'Dallas Keebler',9,1,'2023-11-21 03:59:36','2023-11-21 03:59:36'),(5,'Prof. Arch Von',6,2,'2023-11-21 03:59:36','2023-11-21 03:59:36'),(6,'Emely Kerluke',8,1,'2023-11-21 03:59:36','2023-11-21 03:59:36'),(7,'Thomas Thiel',3,2,'2023-11-21 03:59:36','2023-11-21 03:59:36'),(8,'Clarissa Lang',6,1,'2023-11-21 03:59:36','2023-11-21 03:59:36'),(9,'Nikita Zulauf',1,1,'2023-11-21 03:59:37','2023-11-21 03:59:37'),(10,'Amara Greenholt Sr.',7,1,'2023-11-21 03:59:37','2023-11-21 03:59:37');
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
INSERT INTO `testimonials` VALUES (1,'Keira Kulas','m','Student','Frase generica para los testimonios','2023-11-20','imgTestimonio.webp',4,'2023-11-21 03:59:34','2023-11-21 03:59:34'),(2,'Tyler Reilly','m','Teacher','Frase generica para los testimonios','2023-11-20','imgTestimonio.webp',3,'2023-11-21 03:59:35','2023-11-21 03:59:35'),(3,'Mr. Cole Swift DDS','m','Student','Frase generica para los testimonios','2023-11-20','imgTestimonio.webp',3,'2023-11-21 03:59:35','2023-11-21 03:59:35'),(4,'Jodie Parisian','m','Graduated','Frase generica para los testimonios','2023-11-20','imgTestimonio.webp',2,'2023-11-21 03:59:35','2023-11-21 03:59:35'),(5,'Robbie Ratke','m','Student','Frase generica para los testimonios','2023-11-20','imgTestimonio.webp',2,'2023-11-21 03:59:35','2023-11-21 03:59:35');
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
INSERT INTO `users` VALUES (1,'roger@gmail.com','Roger','Rogelio','Elizalde Diaz','2003-03-23','$2y$10$xKZLUX/8ZqD4RO1XJbJNYe/wj0KsZUuVMXM94fyzwPss8mCbq26Ke',2,'JIwqa8z8zYl3POFMb6ogjh0IOG0HVdmoQRJzq2gJ','2023-11-21 03:59:32','2023-11-21 03:59:32'),(2,'chavez@gmail.com','Gixarde3','Marco','Chávez Rodríguez','2003-03-23','$2y$10$rlX65e/qEe4FdZGT7cJviOxf0ToAwSpjYPI.hxI8RS61tQ.XoSvwy',2,'412LUeA8yaNfJKqOTL23KmWe658JYV1P8H88yaNX','2023-11-21 03:59:33','2023-11-21 03:59:33'),(3,'superAdmin@gmail.com','superAdmin','Super','Admin','2003-03-23','$2y$10$cTt3kqAn4CYO1x.TWOdjteK2EMDDzw5vUiOJ9Jq62k0TAM2VRSrxi',3,'Cjo3y7p1UtR2MlBtvk4eXFzZsJGke1RdahnarbKD','2023-11-21 03:59:33','2023-11-21 06:00:49'),(4,'user@gmail.com','normalUser','User','Common','2003-03-23','$2y$10$CY5gnrbDqSHPbXeD6F/nB.wEcoQPvdsJJtLMHXdR5m93jj.3Cp2xS',1,'6anyAdcSAYtV2fSBFhGq8JYq3AMv4jnNBO1qBM1g','2023-11-21 03:59:33','2023-11-21 03:59:33');
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

-- Dump completed on 2023-11-20 18:00:53
