-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: grocerry
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `delivery_order`
--

DROP TABLE IF EXISTS `delivery_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_order` (
  `idorder` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `landmark` varchar(45) DEFAULT NULL,
  `town` varchar(45) DEFAULT NULL,
  `address` varchar(145) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `items` longtext,
  `expected_date` varchar(45) DEFAULT NULL,
  `ranking` varchar(45) DEFAULT '0',
  PRIMARY KEY (`idorder`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_order`
--

LOCK TABLES `delivery_order` WRITE;
/*!40000 ALTER TABLE `delivery_order` DISABLE KEYS */;
INSERT INTO `delivery_order` VALUES (1,'suraj choudhari','9730592659','Navale Hospital','Pune','Narhe Pune','suraj','350','[\'Banana\', \'Apple\', \'Spinach\', \'Banana\', \'Vim Bar\', \'Fortune Oil\']','2019-11-27','0'),(3,'Rohit Borse','9870456677','Narhe Police Station','Narhe','Pune','suraj','140','[\'Apple\', \'Spinach\']','2019-11-27','0'),(4,'Ajay Patil','9876543210','VIT College','Pune','Pune','suraj','355','[\'Fortune Oil\', \'Fry Pan\']','2019-11-27','0'),(6,'Amol Borade','9112396557','amol','Pune','B-13, 4th floor, Venkatesh Villa bldg, Near Bartakke hospital, Warje Malwadi, Pune - 411058','admin','355','[\'Red Bell Paper\', \'Avocado\', \'Tomato\']','2022-05-10','0'),(7,'tony','1122558847','pune','pune','pune','tony','299','[\'Maggi\', \'Yoggi Strawberry Yoghurt\']','','0'),(8,'abcd abce','8888888888','pune','pune','pune','tony','105','[\'Red Bell Paper\', \'Tomato\']','','0'),(9,'Amol','8888888888','pune','Pune','Erandwane Gaothan','tony','263','[\'Maggi\', \'Maggi\', \'Arla Ecological Medium Fat Milk\']','NULL','0');
/*!40000 ALTER TABLE `delivery_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-30 23:47:34
