-- MySQL dump 10.13  Distrib 9.0.1, for Linux (x86_64)
--
-- Host: localhost    Database: Database_A2
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Account` (
  `acc_no` int NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `balance` int DEFAULT NULL,
  PRIMARY KEY (`acc_no`),
  KEY `branch_name` (`branch_name`),
  CONSTRAINT `Account_ibfk_1` FOREIGN KEY (`branch_name`) REFERENCES `Branch` (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (101,'Akurdi',15000),(102,'Nigdi',8000),(103,'Kharadi',20000),(104,'Hadapsar',12000),(105,'Viman Nagar',5000);
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Borrower`
--

DROP TABLE IF EXISTS `Borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Borrower` (
  `cust_name` varchar(255) DEFAULT NULL,
  `loan_no` int DEFAULT NULL,
  KEY `cust_name` (`cust_name`),
  KEY `loan_no` (`loan_no`),
  CONSTRAINT `Borrower_ibfk_1` FOREIGN KEY (`cust_name`) REFERENCES `Customer` (`cust_name`),
  CONSTRAINT `Borrower_ibfk_2` FOREIGN KEY (`loan_no`) REFERENCES `Loan` (`loan_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Borrower`
--

LOCK TABLES `Borrower` WRITE;
/*!40000 ALTER TABLE `Borrower` DISABLE KEYS */;
INSERT INTO `Borrower` VALUES ('Mehul',202),('Tanmay',203),('Aditya',205);
/*!40000 ALTER TABLE `Borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Branch`
--

DROP TABLE IF EXISTS `Branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Branch` (
  `branch_name` varchar(255) NOT NULL,
  `branch_city` varchar(255) DEFAULT NULL,
  `assets` int DEFAULT NULL,
  PRIMARY KEY (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Branch`
--

LOCK TABLES `Branch` WRITE;
/*!40000 ALTER TABLE `Branch` DISABLE KEYS */;
INSERT INTO `Branch` VALUES ('Akurdi','Pune',5000000),('Hadapsar','Pune',3500000),('Kharadi','Pune',4000000),('Nigdi','Pune',3000000),('Viman Nagar','Pune',4500000);
/*!40000 ALTER TABLE `Branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `cust_name` varchar(255) NOT NULL,
  `cust_street` varchar(255) DEFAULT NULL,
  `cust_city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cust_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('Aditya','Street 5','Pune'),('Kalas','Street 1','Pune'),('Kshitij','Street 4','Pune'),('Mehul','Street 2','Pune'),('Tanmay','Street 3','Pune');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Depositor`
--

DROP TABLE IF EXISTS `Depositor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Depositor` (
  `cust_name` varchar(255) DEFAULT NULL,
  `acc_no` int DEFAULT NULL,
  KEY `cust_name` (`cust_name`),
  KEY `acc_no` (`acc_no`),
  CONSTRAINT `Depositor_ibfk_1` FOREIGN KEY (`cust_name`) REFERENCES `Customer` (`cust_name`),
  CONSTRAINT `Depositor_ibfk_2` FOREIGN KEY (`acc_no`) REFERENCES `Account` (`acc_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Depositor`
--

LOCK TABLES `Depositor` WRITE;
/*!40000 ALTER TABLE `Depositor` DISABLE KEYS */;
INSERT INTO `Depositor` VALUES ('Kalas',101),('Mehul',102),('Tanmay',103),('Kshitij',101),('Aditya',104);
/*!40000 ALTER TABLE `Depositor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Loan`
--

DROP TABLE IF EXISTS `Loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Loan` (
  `loan_no` int NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`loan_no`),
  KEY `branch_name` (`branch_name`),
  CONSTRAINT `Loan_ibfk_1` FOREIGN KEY (`branch_name`) REFERENCES `Branch` (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Loan`
--

LOCK TABLES `Loan` WRITE;
/*!40000 ALTER TABLE `Loan` DISABLE KEYS */;
INSERT INTO `Loan` VALUES (201,'Akurdi',15000),(202,'Nigdi',13000),(203,'Kharadi',25000),(204,'Hadapsar',18000),(205,'Akurdi',1400);
/*!40000 ALTER TABLE `Loan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-31 20:54:27
