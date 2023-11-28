-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: universidadmontealbanbackend
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admissions`
--

LOCK TABLES `admissions` WRITE;
/*!40000 ALTER TABLE `admissions` DISABLE KEYS */;
INSERT INTO `admissions` VALUES (2,'Marco Antonio Chavez Rodriguez','antoniochavezmarco@gmail.com','Estoy sumamente interesado en su licenciatura en psicología','w7xDmjgvWbXifq7dmA7pSxaM8hMSwFGqOdbUXuaP','d',1,'2023-11-24 08:35:58','2023-11-24 08:36:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careers`
--

LOCK TABLES `careers` WRITE;
/*!40000 ALTER TABLE `careers` DISABLE KEYS */;
INSERT INTO `careers` VALUES (1,'Licenciatura en psicología','El egresado del Instituto Universitario Monte Albán contará con los conocimientos generales\nacerca del desarrollo humano y los procesos de aprendizaje para diseñar y llevar a cabo\nprogramas de intervención y apoyo psicopedagógico que fortalezcan el desarrollo autónomo y\ncapacidad de actuación de los educandos y/o comunidades de aprendizaje, en los ámbitos\nescolares y extraescolares; con especial atención a la diversidad social y comprendiendo los\ncontextos socioculturales en que surgen las necesidades educativas, de manera sistemática y\nefectiva. Así mismo, contará con los conocimientos y habilidades para proporcionar asesorías\npsicopedagógicas a distintos agentes educativos y colaborar con otros profesionales en proyectos\ny programas educativos dirigidos a la mejora de los procesos educativos, participando con\nactitudes de servicio y ejerciendo sus capacidades reflexiva y crítica en la formación de los\neducandos.','El aspirante que desee ingresar a la Licenciatura de Psicología Educativa del Instituto Universitario\nMonte Albán, debe ser una persona con el nivel de bachillerato o su equivalente concluido. Cabe\nseñalar que la presente licenciatura pretende formar profesionales que respondan a la demanda\nEducativa.\nSe cuenta con un plan de estudios actualizado y flexible con un enfoque centrado en el aprendizaje\nde los estudiantes y la consolidación de su formación mediante prácticas profesionales en\ncontextos educativos. Así mismo, que cuente con los mecanismos de evaluación interna que\npermitan identificar problemas en su funcionamiento y poner en práctica las correcciones\npertinentes que lo mantengan actualizado, competitivo a nivel nacional e internacional y relevante\npara contribuir en la disminución de los problemas educativos atingentes al Psicólogo Educativo.','2023-11-23 10:06:00','2023-11-23 10:06:00'),(2,'LICENCIATURA EN IDIOMAS','El egresado del Instituto Universitario Monte Albán contará con el conocimiento integral y\nactualizado propio del licenciado en Idiomas para ser capaz de desempeñarse competitivamente\nen la traducción ya sea en instituciones nacionales o internacionales, en donde aplicará los\nconocimientos, las habilidades, las destrezas y las actitudes adquiridas. Tendrá las bases para\nincursionar en la enseñanza y la investigación. Además de ser un líder con conciencia social que\nentiende la realidad global y que examina en todo momento de manera innovadora en busca de\nmejoras en beneficio de la sociedad, sin perder su realidad y ética.','El aspirante que desee ingresar a la Licenciatura en Idiomas del Instituto Universitario Monte Albán\ndebe ser una persona con el nivel de bachillerato o su equivalente concluido. Cabe señalar que la\npresente licenciatura pretende formar profesionales que respondan a la demanda de enseñanza de\nlos idiomas Español, Inglés y Japonés por tanto sus asignaturas están enfocadas a las áreas de\nconocimiento en Idiomas, Lenguaje y Cultura, Complementaria, Investigación y enseñanza del\nidioma, así como un área de Optativas; por tal motivo el candidato debe contar con las siguientes\ncaracterísticas:\n Interés por otras lenguas y culturas.\n Facilidad para aprender otros idiomas.\n Empatía con otras culturas, sus tradiciones y sus costumbres.\n Interés por la lectura y la investigación.\n Observación y análisis del uso del lenguaje en diferentes contextos.\n Capacidad de comprensión, análisis, resolución y síntesis.\n Sensibilidad ante la importancia del lenguaje en la sociedad.\n Captación y producción de estructuras lingüísticas diferentes a las propias.','2023-11-23 10:25:13','2023-11-23 10:25:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coments`
--

LOCK TABLES `coments` WRITE;
/*!40000 ALTER TABLE `coments` DISABLE KEYS */;
INSERT INTO `coments` VALUES (2,1,4,'Que bueno ver a los jovenes tan comprometidos con la salud',1,'2023-11-23 10:24:18','2023-11-23 10:24:28'),(3,2,2,'Creara un comentario en la publicación del día del músico',1,'2023-11-24 06:54:31','2023-11-24 06:54:31');
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
  `content` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `complaints_url_unique` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
INSERT INTO `complaints` VALUES (2,'Sandra','antoniochavezmarco@gmail.com','Contenido de la sugerencia','F3RCMLfE1shqxhHCNokM8wA0Rw69by9jeAPFjhh9',1,'2023-11-24 08:31:10','2023-11-24 08:31:37');
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
INSERT INTO `database_logs` VALUES (1,1,'Restauración','2023-11-23','2023-11-23 10:19:41','2023-11-23 10:19:41'),(2,1,'Respaldo','2023-11-24','2023-11-24 08:32:02','2023-11-24 08:32:02'),(3,1,'Restauración','2023-11-24','2023-11-24 08:37:53','2023-11-24 08:37:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Celebración del día del músico','Celebra con nosotros este 22 de Noviembre el día del músico.','2023-11-22',13,2,1,'2023-11-23 09:10:27','2023-11-23 09:10:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (223,'2014_10_12_000000_create_users_table',1),(224,'2014_10_12_100000_create_password_reset_tokens_table',1),(225,'2019_08_19_000000_create_failed_jobs_table',1),(226,'2019_12_14_000001_create_personal_access_tokens_table',1),(227,'2023_10_31_070318_create_posts_table',1),(228,'2023_10_31_172923_create_coments_table',1),(229,'2023_11_01_151611_create_testimonials_table',1),(230,'2023_11_06_154051_create_events_table',1),(231,'2023_11_09_191543_create_careers_table',1),(232,'2023_11_09_191632_create_subjects_table',1),(233,'2023_11_15_082257_create_complaints_table',1),(234,'2023_11_17_033306_create_admissions_table',1),(235,'2023_11_20_202714_create_database_logs_table',1);
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
  `description` text NOT NULL,
  `img` varchar(255) NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `idUser` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_iduser_foreign` (`idUser`),
  CONSTRAINT `posts_iduser_foreign` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Celebración del 20 de Noviembre','Mexicanos unidos para celebrar la revolución mexicana','Ya está todo listo para el desfile del 20 de noviembre 2022 en CDMX. Este año se cumplen 112 años del inicio de la Revolución Mexicana. Para conmemorarlo se realizará el tradicional desfile por calles del Centro Histórico y otras vialidades de la ciudad.\n\nDurante el evento verás vehículos militares, caballos, unidades aéreas, elementos caracterizados con ropa de la época de la Revolución y mucho más. También se espera la participación de las Escaramuzas Militares, quienes son parte del personal especializado en charrería.\n\nSi quieres conmemorar este hecho histórico pero no quieres ir al centro de la CDMX, no te preocupes. Algunas alcaldías también tendrán desfiles con motivo del aniversario de la Revolución Mexicana. Hasta el momento dos demarcaciones han confirmado eventos conmemorativos:\n\nXochimilco: el recorrido comenzará a las 9:00 horas en el Centro Deportivo Xochimilco. Seguirá hacia 16 de septiembre hasta llegar al Centro Histórico de la alcaldía.\nMagdalena Contreras: el desfile partirá del Parque de la Estación a las 10:30 horas y terminará en el Mercado T. La Magdalena.','655ec01e0ff6a.webp','655ec01e0d0ac.pdf',1,'2023-11-23 08:59:42','2023-11-23 08:59:42'),(2,'Día internacional del músico','Celebración del día del músico','El 22 de noviembre se celebra el Día Internacional de la Música 🎼🎤, como una fecha dedicada a todos los músicos y amantes de la música.\r\n¿Y a quién no le gusta la música? 😱 Es prácticamente imposible encontrar a un ser humano que no disfrute con la música. Otra cosa diferente es el estilo de música. Pero en general a todos nos agrada. Y el motivo no es otro que el hecho de que lo llevamos en los genes.\r\nAsí que ya sea rock, clásica, country, jazz, pop, seguro que te resulta agradable escuchar una melodía bonita. 👩‍🎤🧑‍🎤👨‍🎤','655ec18b941f2.webp',NULL,1,'2023-11-23 09:05:48','2023-11-23 09:05:48'),(4,'SEMANA DE LA SALUD ❤️🧠','Celebración de la semana de la salud','En alusión al 10 de octubre, día mundial de la salud mental, nuestros dedicados alumnos universitarios de #PsicologíaEducativa bajo la supervisión y acompañamiento de la psicóloga Iveth Valladares han programado actividades para crear conciencia en nuestros líderes alumnos sobre este tema tan importante en los grupos de sección preparatoria y así generar estrategias que fortalezcan una buena salud mental. ❤️🧠💚\r\n¡Muchas felicidades a los líderes Alicia Nájera, Óscar Soto, Britney Delgado, Viridiana, María Corrales y María Rojas, de Universidad MONTE ALBÁN por su excelente participación. 👏👏👏👏\r\n#saludmental #UniversidadMonteAlbán #SéLíder #SéMonteAlbán','655ed3e39d81d.webp',NULL,1,'2023-11-23 10:24:03','2023-11-23 10:24:03'),(7,'Hoy 23 de noviembre celebra el Día del Profesor de Francés.','Celebración del día del músico','Este día está dedicado a todos los profesores y profesoras de francés, así como aquellas personas que enseñan el idioma francés en cursos de formación bilingüe, en todo el mundo.\r\nFeliz día a nuestro extraordinario líder académico Erwin Ávila Hernández  🥳🥳 🎊🎉','65600c5d9171d.webp',NULL,1,'2023-11-24 08:37:18','2023-11-24 08:37:18');
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Teoría General de Sistemas en Educación',1,1,'2023-11-23 10:06:11','2023-11-23 10:06:11'),(2,'Fundamentación psicopedagógica',1,1,'2023-11-23 10:06:23','2023-11-23 10:06:23'),(3,'Filosofía de la educación',1,1,'2023-11-23 10:06:31','2023-11-23 10:06:31'),(4,'Psicología educativa',1,1,'2023-11-23 10:06:39','2023-11-23 10:06:39'),(5,'Microenseñanza',1,1,'2023-11-23 10:06:47','2023-11-23 10:06:47'),(6,'Aprender a aprender',1,1,'2023-11-23 10:06:55','2023-11-23 10:06:55'),(7,'Política y legislación educativa',2,1,'2023-11-23 10:07:05','2023-11-23 10:07:05'),(8,'Teorías de desarrollo I.',2,1,'2023-11-23 10:07:13','2023-11-23 10:07:13'),(9,'Teorías del desarrollo II.',3,1,'2023-11-23 10:07:22','2023-11-23 10:07:22'),(10,'Bases biológicas de la conducta',3,1,'2023-11-23 10:07:32','2023-11-23 10:07:32'),(11,'Teorías del aprendizaje',4,1,'2023-11-23 10:07:42','2023-11-23 10:07:42'),(12,'Teorías del desarrollo III.',4,1,'2023-11-23 10:07:49','2023-11-23 10:07:49'),(13,'Producción de material didáctico',4,1,'2023-11-23 10:07:58','2023-11-23 10:07:58'),(14,'Intervención en orientación educativa',5,1,'2023-11-23 10:08:13','2023-11-23 10:08:13'),(15,'Teoría y técnica de la entrevista',5,1,'2023-11-23 10:08:20','2023-11-23 10:08:20'),(16,'Modelo de planeación de instituciones educativas',5,1,'2023-11-23 10:08:28','2023-11-23 10:08:28'),(17,'Comunicación y nuevas tecnologías de la educación',5,1,'2023-11-23 10:08:35','2023-11-23 10:08:35'),(18,'Dinámicas de grupos',6,1,'2023-11-23 10:08:45','2023-11-23 10:08:45'),(19,'Psicotecnia de educación especial',6,1,'2023-11-23 10:08:52','2023-11-23 10:08:52'),(20,'Psicometría II',6,1,'2023-11-23 10:09:01','2023-11-23 10:11:06'),(21,'Técnicas de la modificación de la conducta',7,1,'2023-11-23 10:09:10','2023-11-23 10:09:10'),(22,'Liderazgo empresarial',7,1,'2023-11-23 10:09:34','2023-11-23 10:09:34'),(23,'Investigación cualitativa',7,1,'2023-11-23 10:09:41','2023-11-23 10:09:41'),(24,'Evaluación de los aprendizajes',7,1,'2023-11-23 10:09:48','2023-11-23 10:09:48'),(25,'Laboratorio de psicología educativa',8,1,'2023-11-23 10:09:56','2023-11-23 10:09:56'),(26,'Orientación educativa',8,1,'2023-11-23 10:10:04','2023-11-23 10:10:04'),(27,'Investigación cuantitativa',8,1,'2023-11-23 10:10:11','2023-11-23 10:10:11'),(28,'Gestión del conocimiento',9,1,'2023-11-23 10:10:20','2023-11-23 10:10:20'),(29,'Prospectiva de innovación profesional',9,1,'2023-11-23 10:10:32','2023-11-23 10:10:32'),(30,'Etimologías Grecolatinas II',2,2,'2023-11-23 10:25:34','2023-11-23 10:25:56');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'CRMO210133@upemor.edu.mx','MarcoChavez','Marco Antonio','Chavez Rodriguez','2003-08-22','$2y$10$T43H9lVE5Fg/gOgs9N2I8.VeZjNCHws8YEVIV1RILUcNz4PpbELoK',3,'027cYTFf3G7CRnAQsertxWP2Gv0UmimNmRS2pJ7V','2023-11-23 08:54:11','2023-11-24 09:49:51'),(2,'edro210830@upemor.edu.mx','Roger','Rogelio Leonardo','Elizalde Diaz','2003-03-23','$2y$10$ncrUy0yOYlSFoYplMC67J.JiVP0sGf6gnDB5MBls1RvIYi91a7mX.',1,'dNVHhiuirjVx97pqcJuvp2IrCm8liT0oAjppjBUT','2023-11-23 22:23:35','2023-11-24 06:54:07'),(3,'emi@gmail.com','Emiliano','Emiliano','Reyes Gutierrez','2002-01-23','$2y$10$FYX1eznmjRwxdk0PuRdbe.0twrJG85P5am63fz2Z1oZl6DDiliL26',1,'msMTHjOMuqVkF28jCfEyUdJkDyj1IQpt8vMBcBpH','2023-11-24 00:01:49','2023-11-24 00:01:49'),(5,'radonm@gmail.com','Martes','Random','Elizalde','1212-12-12','$2y$10$QrAxepf0qgRGR6731iKC4./KUXOohEqQreDZdZWukJjVRMZrWDoQ6',1,'w0ufFByALFoKqkPJyGqn7OQQiiXAZBZm18l3Ektr','2023-11-24 00:28:09','2023-11-24 00:28:09'),(6,'ra@mail.com','rand','Random2','Random2','2002-02-02','$2y$10$E9YMu88U84A9Rym3kgMHqO6qZ3Gs8pBl5Uf7SSoIN7ensaAkpHOAu',1,'kLYwd4ee1X0J7IoLGTdp6wpHAShkgDiATabTTHgn','2023-11-24 00:29:28','2023-11-24 00:29:28'),(7,'sad@asd.cm','ran','Ran','Dom','2222-11-22','$2y$10$.AhN41ngvN.yy0VderPOaurWaIgC0yjwmHKMlQd4ZLRePwmksMNWu',1,'Yc3Yx1FiWJVq2EuEJDXNoMbtfuN886Ul4P26rRR5','2023-11-24 00:30:49','2023-11-24 00:30:49');
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

-- Dump completed on 2023-11-23 22:36:46
