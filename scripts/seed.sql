-- MySQL dump 10.13  Distrib 8.0.25, for macos11.3 (x86_64)
--
-- Host: localhost    Database: emma
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `merchants`
--
DROP TABLE IF EXISTS `merchants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `display_name` varchar(255) NOT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `funny_gif_url` varchar(45) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchants`
--

LOCK TABLES `merchants` WRITE;
/*!40000 ALTER TABLE `merchants` DISABLE KEYS */;
INSERT INTO `merchants` VALUES (1,'Papa Jones','www.google.com','www.google.com','2021-11-07 09:32:50','2021-11-07 09:32:50'),(2,'Guru bar','www.google.com','www.google.com','2021-11-07 09:33:04','2021-11-07 09:33:04'),(3,'London times','www.google.com','www.google.com','2021-11-07 09:33:21','2021-11-07 09:33:21');
/*!40000 ALTER TABLE `merchants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `merchant_id` int DEFAULT NULL,
  `amount` float NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `merchant_id` (`merchant_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,1,10,'2021-11-07 09:35:54','something','2021-11-07 09:35:54','2021-11-07 09:35:54'),(2,1,1,15,'2021-11-07 09:36:03','something','2021-11-07 09:36:03','2021-11-07 09:36:03'),(3,1,1,20,'2021-11-07 09:36:11','something','2021-11-07 09:36:11','2021-11-07 09:36:11'),(4,2,1,5,'2021-11-07 09:36:28','something','2021-11-07 09:36:28','2021-11-07 09:36:28'),(5,2,1,15,'2021-11-07 09:36:39','something','2021-11-07 09:36:39','2021-11-07 09:36:39'),(6,2,2,15,'2021-11-07 09:36:48','something','2021-11-07 09:36:48','2021-11-07 09:36:48'),(7,2,2,10,'2021-11-07 09:36:56','something','2021-11-07 09:36:56','2021-11-07 09:36:56'),(8,1,2,10,'2021-11-07 09:37:04','something','2021-11-07 09:37:04','2021-11-07 09:37:04'),(9,1,2,3,'2021-11-07 09:37:13','something','2021-11-07 09:37:13','2021-11-07 09:37:13'),(10,1,2,4,'2021-11-07 09:37:41','something','2021-11-07 09:37:41','2021-11-07 09:37:41'),(12,2,2,4,'2021-11-07 09:38:01','something','2021-11-07 09:38:01','2021-11-07 09:38:01'),(13,3,2,4,'2021-11-07 09:38:42','something','2021-11-07 09:38:42','2021-11-07 09:38:42'),(14,3,2,4,'2021-11-07 09:38:44','something','2021-11-07 09:38:44','2021-11-07 09:38:44'),(15,3,1,2,'2021-11-07 09:38:55','something','2021-11-07 09:38:55','2021-11-07 09:38:55'),(16,3,1,2,'2021-11-07 09:38:56','something','2021-11-07 09:38:56','2021-11-07 09:38:56'),(17,4,1,7,'2021-11-07 09:39:07','something','2021-11-07 09:39:07','2021-11-07 09:39:07'),(18,4,1,7,'2021-11-07 09:39:10','something','2021-11-07 09:39:10','2021-11-07 09:39:10'),(19,4,2,7,'2021-11-07 09:39:17','something','2021-11-07 09:39:17','2021-11-07 09:39:17'),(20,4,2,7,'2021-11-07 09:39:19','something','2021-11-07 09:39:19','2021-11-07 09:39:19'),(21,2,1,10,'2021-11-08 09:35:54','something','2021-11-08 09:35:54','2021-11-08 09:35:54'),(22,1,1,15,'2021-11-08 09:36:03','something','2021-11-08 09:36:03','2021-11-08 09:36:03'),(23,1,1,20,'2021-11-08 09:36:11','something','2021-11-08 09:36:11','2021-11-08 09:36:11'),(24,2,1,5,'2021-11-08 09:36:28','something','2021-11-08 09:36:28','2021-11-08 09:36:28'),(25,2,1,15,'2021-11-08 09:36:39','something','2021-11-08 09:36:39','2021-11-08 09:36:39'),(26,2,2,15,'2021-11-08 09:36:48','something','2021-11-08 09:36:48','2021-11-08 09:36:48'),(27,2,2,10,'2021-11-08 09:36:56','something','2021-11-08 09:36:56','2021-11-08 09:36:56'),(28,1,2,10,'2021-11-08 09:37:04','something','2021-11-08 09:37:04','2021-11-08 09:37:04'),(29,1,2,3,'2021-11-08 09:37:13','something','2021-11-08 09:37:13','2021-11-08 09:37:13'),(30,1,2,4,'2021-11-08 09:37:41','something','2021-11-08 09:37:41','2021-11-08 09:37:41'),(32,2,2,4,'2021-11-08 09:38:01','something','2021-11-08 09:38:01','2021-11-08 09:38:01'),(33,3,2,4,'2021-11-08 09:38:42','something','2021-11-08 09:38:42','2021-11-08 09:38:42'),(34,3,2,4,'2021-11-08 09:38:44','something','2021-11-08 09:38:44','2021-11-08 09:38:44'),(35,3,1,2,'2021-11-08 09:38:55','something','2021-11-08 09:38:55','2021-11-08 09:38:55'),(36,3,1,2,'2021-11-08 09:38:56','something','2021-11-08 09:38:56','2021-11-08 09:38:56'),(37,4,1,7,'2021-11-08 09:39:07','something','2021-11-08 09:39:07','2021-11-08 09:39:07'),(38,4,1,7,'2021-11-08 09:39:10','something','2021-11-08 09:39:10','2021-11-08 09:39:10'),(39,4,2,7,'2021-11-08 09:39:17','something','2021-11-08 09:39:17','2021-11-08 09:39:17'),(40,4,2,57,'2021-11-08 09:39:19','something','2021-11-08 09:39:19','2021-11-08 09:39:19');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John','Doe','2021-11-07 09:29:28','2021-11-07 09:29:28'),(2,'Mary','Jane','2021-11-07 09:29:46','2021-11-07 09:29:46'),(3,'Will','Smith','2021-11-07 09:29:59','2021-11-07 09:29:59'),(4,'Jamie','Jones','2021-11-07 09:38:32','2021-11-07 09:38:32');
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

-- Dump completed on 2021-11-07  9:42:05
