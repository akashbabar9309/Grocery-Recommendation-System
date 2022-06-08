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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `idadmin` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idadmin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `idcart` int NOT NULL AUTO_INCREMENT,
  `item` varchar(45) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcart`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (3,'Apple',100,'amol'),(9,'Conference',160,'admin');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `idcontact` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `subject` varchar(145) DEFAULT NULL,
  `message` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idcontact`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'ss','ss@ss.com','1234567890','hi testing','hi test');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_order`
--

LOCK TABLES `delivery_order` WRITE;
/*!40000 ALTER TABLE `delivery_order` DISABLE KEYS */;
INSERT INTO `delivery_order` VALUES (1,'suraj choudhari','9730592659','Navale Hospital','Pune','Narhe Pune','suraj','350','[\'Banana\', \'Apple\', \'Spinach\', \'Banana\', \'Vim Bar\', \'Fortune Oil\']','2019-11-27','0'),(3,'Rohit Borse','9870456677','Narhe Police Station','Narhe','Pune','suraj','140','[\'Apple\', \'Spinach\']','2019-11-27','0'),(4,'Ajay Patil','9876543210','VIT College','Pune','Pune','suraj','355','[\'Fortune Oil\', \'Fry Pan\']','2019-11-27','0'),(6,'Amol Borade','9112396557','amol','Pune','B-13, 4th floor, Venkatesh Villa bldg, Near Bartakke hospital, Warje Malwadi, Pune - 411058','admin','355','[\'Red Bell Paper\', \'Avocado\', \'Tomato\']','2022-05-10','0');
/*!40000 ALTER TABLE `delivery_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `idproducts` int NOT NULL AUTO_INCREMENT,
  `category` varchar(45) DEFAULT NULL,
  `pname` varchar(45) DEFAULT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `pic` varchar(455) DEFAULT NULL,
  `ranking` varchar(45) DEFAULT '0',
  PRIMARY KEY (`idproducts`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (4,'Fruits','Anjou','1kg','250','Anjou_Iconic.png','0'),(5,'Fruits','Avocado','1kg','250','Avocado_Iconic.png','8'),(7,'Vegetables','Red Bell Paper','1kg','60','Red-Bell-Pepper_Iconic.png','5'),(8,'Vegetables','Tomato','1kg','30','Vine-Tomato_Iconic.png','2'),(9,'Kitchen','Fresh Soy Milk ','1ltr','120','Alpro-Fresh-Soy-Milk_Iconic.png','0'),(10,'Vegetables','Aubergine','1kg','150','Aubergine_Iconic.png','0'),(11,'Vegetables','Asparagus','12Nos','600','Asparagus_Iconic.png','0'),(12,'Package','Bravo Apple Juice','1ltr','200','Bravo-Apple-Juice_Iconic.png','0'),(13,'Vegetables','Conference','1kg','160','Conference_Iconic.png','3'),(14,'Package','Arla Ecological Medium Fat Milk','1ltr','200','Arla-Ecological-Medium-Fat-Milk_Iconic.png','0'),(15,'Fruits','Cantaloupe','1kg','260','Cantaloupe_Iconic.png','0'),(16,'Fruits','Orange','12Nos','340','Orange_Iconic.png','0'),(17,'Package','Yoggi Strawberry Yoghurt','1ltr','260','Yoggi-Strawberry-Yoghurt_Iconic.png','0'),(18,'Fruits','Pomegranate','1kg','450','Pomegranate_Iconic.png','0'),(19,'Package','Oatly Oat Milk','1ltr','280','Oatly-Oat-Milk_Iconic.png','1'),(20,'Households','Domex','1ltr','130','20.png','0'),(21,'Households','Vim Soap','1Nos','20','18.png','0'),(22,'Households','Lux Soap','1Nos','24','Lux-soup-600x690.png','0'),(23,'Households','Nirma Powder','1kg','120','nirama.jpg','0'),(24,'Package','Maggi','1Nos','24','maggi.jpg','0'),(25,'Vegetables','Orange Bell Peper','1kg','200','Orange-Bell-Pepper_Iconic.png','0'),(26,'Vegetables','Garlic','1kg','200','Garlic_Iconic.png','0'),(27,'Vegetables','Ginger','1kg','120','Ginger_Iconic.png','0'),(28,'Households','Harpic','1ltr','240','Harpic-10X.jpg','0'),(29,'Fruits','Peach','1kg','150','Peach_Iconic.png','0');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `uname` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mob` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'suraj','12345678','sur@gmail.com','7788995533','Pune'),(2,'gajanan','1234567','gajanan@gmail.com','9988776655','Pune'),(3,'amol','123456','amolborade1001@gmail.com','09112396557','Pune');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-08 17:32:01
