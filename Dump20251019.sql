CREATE DATABASE  IF NOT EXISTS `villo_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `villo_db`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 192.168.1.5    Database: villo_db
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `bookings_table`
--

DROP TABLE IF EXISTS `bookings_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `driver_id` int NOT NULL,
  `vehicle_id` int NOT NULL,
  `pickup_location_id` int NOT NULL,
  `drop_location_id` int NOT NULL,
  `status` enum('pending','confirmed','completed','cancelled') NOT NULL,
  `fare` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `driver_id` (`driver_id`),
  KEY `vehicle_id` (`vehicle_id`),
  KEY `pickup_location_id` (`pickup_location_id`),
  KEY `drop_location_id` (`drop_location_id`),
  CONSTRAINT `bookings_table_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users_table` (`id`),
  CONSTRAINT `bookings_table_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `users_table` (`id`),
  CONSTRAINT `bookings_table_ibfk_3` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles_table` (`id`),
  CONSTRAINT `bookings_table_ibfk_4` FOREIGN KEY (`pickup_location_id`) REFERENCES `locations_table` (`id`),
  CONSTRAINT `bookings_table_ibfk_5` FOREIGN KEY (`drop_location_id`) REFERENCES `locations_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_table`
--

LOCK TABLES `bookings_table` WRITE;
/*!40000 ALTER TABLE `bookings_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations_table`
--

DROP TABLE IF EXISTS `locations_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `locations_table_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_table` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations_table`
--

LOCK TABLES `locations_table` WRITE;
/*!40000 ALTER TABLE `locations_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_table`
--

DROP TABLE IF EXISTS `otp_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `expires_at` datetime(6) NOT NULL,
  `otp_code` varchar(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_table`
--

LOCK TABLES `otp_table` WRITE;
/*!40000 ALTER TABLE `otp_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `otp_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_table`
--

DROP TABLE IF EXISTS `users_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('ADMIN','CUSTOMER','DRIVER') NOT NULL,
  `address` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('ACTIVE','INACTIVE') NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_table`
--

LOCK TABLES `users_table` WRITE;
/*!40000 ALTER TABLE `users_table` DISABLE KEYS */;
INSERT INTO `users_table` VALUES (1,'John','Doe','9986550385','prsdpappu@gmail.com','123','ADMIN','123 Main St, Springfield','2025-10-18 15:17:34','ACTIVE',NULL);
/*!40000 ALTER TABLE `users_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles_table`
--

DROP TABLE IF EXISTS `vehicles_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `vehicle_number` varchar(50) NOT NULL,
  `vehicle_type` enum('TRUCK','CAR','BIKE') NOT NULL,
  `capacity` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('AVAILABLE','UNAVAILABLE','IN_SERVICE') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vehicle_number` (`vehicle_number`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `vehicles_table_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_table` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles_table`
--

LOCK TABLES `vehicles_table` WRITE;
/*!40000 ALTER TABLE `vehicles_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicles_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'villo_db'
--

--
-- Dumping routines for database 'villo_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-19 15:38:22
