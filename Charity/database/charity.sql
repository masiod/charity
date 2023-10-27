-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: charityDB
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `Beneficiaries`
--

DROP TABLE IF EXISTS `Beneficiaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Beneficiaries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LastName` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Phone` int NOT NULL,
  `National_ID` int NOT NULL,
  `Certificate` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Work` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Income` double NOT NULL,
  `Reason` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Acceptance` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Phone_UNIQUE` (`Phone`),
  UNIQUE KEY `National_ID_UNIQUE` (`National_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Beneficiaries`
--

LOCK TABLES `Beneficiaries` WRITE;
/*!40000 ALTER TABLE `Beneficiaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `Beneficiaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Beneficiaries_has_Supplies`
--

DROP TABLE IF EXISTS `Beneficiaries_has_Supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Beneficiaries_has_Supplies` (
  `Beneficiaries_id` int NOT NULL DEFAULT '101',
  `Supplies_id` int NOT NULL,
  `Authorization` tinyint NOT NULL DEFAULT '0',
  `AuthQuantity` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`Beneficiaries_id`,`Supplies_id`),
  KEY `fk_Beneficiaries_has_Supplies_Beneficiaries1_idx` (`Beneficiaries_id`),
  KEY `fk_Beneficiaries_has_Supplies_Supplies1_idx` (`Supplies_id`),
  CONSTRAINT `fk_Beneficiaries_has_Supplies_Beneficiaries1` FOREIGN KEY (`Beneficiaries_id`) REFERENCES `Beneficiaries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_Beneficiaries_has_Supplies_Supplies1` FOREIGN KEY (`Supplies_id`) REFERENCES `Supplies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Beneficiaries_has_Supplies`
--

LOCK TABLES `Beneficiaries_has_Supplies` WRITE;
/*!40000 ALTER TABLE `Beneficiaries_has_Supplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Beneficiaries_has_Supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Donors`
--

DROP TABLE IF EXISTS `Donors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Donors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LastName` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Phone` int NOT NULL,
  `National_ID` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Acceptance` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Phone_UNIQUE` (`Phone`),
  UNIQUE KEY `National_ID_UNIQUE` (`National_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Donors`
--

LOCK TABLES `Donors` WRITE;
/*!40000 ALTER TABLE `Donors` DISABLE KEYS */;
/*!40000 ALTER TABLE `Donors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Donors_has_Supplies`
--

DROP TABLE IF EXISTS `Donors_has_Supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Donors_has_Supplies` (
  `Donors_id` int NOT NULL,
  `Supplies_id` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`Donors_id`,`Supplies_id`),
  KEY `fk_Donors_has_Supplies_Donors_idx` (`Donors_id`),
  KEY `fk_Donors_has_Supplies_Supplies1_idx` (`Supplies_id`),
  CONSTRAINT `fk_Donors_has_Supplies_Donors` FOREIGN KEY (`Donors_id`) REFERENCES `Donors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_Donors_has_Supplies_Supplies1` FOREIGN KEY (`Supplies_id`) REFERENCES `Supplies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Donors_has_Supplies`
--

LOCK TABLES `Donors_has_Supplies` WRITE;
/*!40000 ALTER TABLE `Donors_has_Supplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Donors_has_Supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hall`
--

DROP TABLE IF EXISTS `Hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hall` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Location` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Donors_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Hall_Donors1_idx` (`Donors_id`),
  CONSTRAINT `fk_Hall_Donors1` FOREIGN KEY (`Donors_id`) REFERENCES `Donors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hall`
--

LOCK TABLES `Hall` WRITE;
/*!40000 ALTER TABLE `Hall` DISABLE KEYS */;
/*!40000 ALTER TABLE `Hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (66,'2021_02_26_183201_create_Beneficiaries_has_Supplies_table',1),(67,'2021_02_26_183201_create_Beneficiaries_table',1),(68,'2021_02_26_183201_create_Donors_has_Supplies_table',1),(69,'2021_02_26_183201_create_Donors_table',1),(70,'2021_02_26_183201_create_Hall_table',1),(71,'2021_02_26_183201_create_Supplies_table',1),(72,'2021_02_26_183201_create_reservation_date_table',1),(73,'2021_02_26_183202_add_foreign_keys_to_Beneficiaries_has_Supplies_table',1),(74,'2021_02_26_183202_add_foreign_keys_to_Donors_has_Supplies_table',1),(75,'2021_02_26_183202_add_foreign_keys_to_Hall_table',1),(76,'2021_02_26_183202_add_foreign_keys_to_reservation_date_table',1),(77,'2021_02_26_194130_create_triggerB',1),(78,'2021_02_26_194130_create_triggerS',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_date`
--

DROP TABLE IF EXISTS `reservation_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_date` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `Hall_id` int NOT NULL,
  `Beneficiaries_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reservation_date_Hall1_idx` (`Hall_id`),
  KEY `fk_reservation_date_Beneficiaries1_idx` (`Beneficiaries_id`),
  CONSTRAINT `fk_reservation_date_Beneficiaries1` FOREIGN KEY (`Beneficiaries_id`) REFERENCES `Beneficiaries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_reservation_date_Hall1` FOREIGN KEY (`Hall_id`) REFERENCES `Hall` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_date`
--

LOCK TABLES `reservation_date` WRITE;
/*!40000 ALTER TABLE `reservation_date` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplies`
--

DROP TABLE IF EXISTS `Supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supplies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Quantity` int NOT NULL,
  `image` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplies`
--

LOCK TABLES `Supplies` WRITE;
/*!40000 ALTER TABLE `Supplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Supplies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-28 23:41:42
