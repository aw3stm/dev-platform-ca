-- MySQL dump 10.13  Distrib 26.7.0, for macos26.6 (arm64)
--
-- Host: localhost    Database: article_api
-- ------------------------------------------------------
-- Server version	26.7.0

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `category` varchar(100) NOT NULL,
  `submitted_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `submitted_by` (`submitted_by`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`submitted_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'Annas article','This is my first article, enjoy!','Technology',1,'2026-10-02 12:17:52'),(2,'My second article','This article was created through the API.','Technology',1,'2026-10-05 11:01:06'),(3,'My third article','This article was created through the API.','Technology',1,'2026-10-05 13:16:28'),(4,'My fourth article','Testing validation.','Technology',1,'2026-10-05 13:36:13'),(5,'Protected article','Testing JWT protection.','Technology',1,'2026-10-05 15:04:32'),(6,'Article by Kim','Kim created this article.','Fashion',7,'2026-10-05 16:55:41'),(7,'Authenticated article by Anna','This article was created by an authenticated user.','Technology',8,'2026-10-05 17:32:47'),(8,'Authenticated article 2','This article was created by an authenticated user.','Technology',8,'2026-10-06 09:25:01'),(9,'Authenticated article 2','This article was created by an authenticated user.','Technology',8,'2026-10-06 10:15:27'),(10,'Authenticated article 3','This article was created by an authenticated user.','Technology',8,'2026-10-06 10:15:41'),(11,'Last test','Testing authentication.','Technology',9,'2026-10-06 13:18:46');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test@example.com','test-hash','2026-10-02 12:14:50'),(2,'ciara@example.com','$2b$10$dhPifqfMJP.YJwKae9gDheUit2JRqC3bQmaO6nW3gxOt4cbXPhFOy','2026-10-05 14:10:53'),(3,'tom@example.com','$2b$10$4Pju73oQgJVRflweliOg.OxsLlAXaVNZxeew1NY0giZ/ivCgdAqAW','2026-10-05 14:12:14'),(4,'bob@example.com','$2b$10$.G2SKeAKyMZcx2IyEQTd7.jGlXM3lxV/ajWkNzrWox/2WDcKe7Zuy','2026-10-05 14:12:25'),(5,'linda@example.com','$2b$10$jS43QuLL1dTsPglcsjxSNupBCbgdYo4a3Uf3jYONzztKhmz9..mbC','2026-10-05 14:12:34'),(6,'oscar@example.com','$2b$10$R0Fs5jIO0IncZL.tKblcR.G.M2wEAxfqA0NSjs61KJJQ4EIs3XUk2','2026-10-05 14:12:43'),(7,'kim@example.com','$2b$10$FgxsTMV/KFZBmjXF6tmtD.rZ3/lOt0hiHQiTgTMi8aNnVyQwTEt/S','2026-10-05 14:19:42'),(8,'anna@example.com','$2b$10$/Y1TFT3iiSwtJXfT1JaFoO437MRCVQNi0maniTR4W507hkLH1XCIa','2026-10-05 17:18:44'),(9,'newuser@example.com','$2b$10$lxC8IwFEPEO3HP5SZwJ83OTA6bFE/i6qJF9Fv.Ci2MSwmUD/ggawO','2026-10-06 13:14:48');
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

-- Dump completed on 2026-10-06 15:43:01
