CREATE DATABASE  IF NOT EXISTS `auctionweb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `auctionweb`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: auctionweb
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
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auction` (
  `Price_of_User` int NOT NULL,
  `Price_Time` datetime NOT NULL,
  `Auction_ID` int NOT NULL AUTO_INCREMENT,
  `Pro_Auc_ID` int NOT NULL,
  `User_ID` int NOT NULL,
  PRIMARY KEY (`Auction_ID`),
  KEY `Pro_Auc_ID` (`Pro_Auc_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`Pro_Auc_ID`) REFERENCES `product_auction` (`Pro_Auc_ID`),
  CONSTRAINT `auction_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (50799000,'2021-12-30 20:26:44',108,1,4),(32499000,'2021-12-30 20:27:12',109,1,5),(45899000,'2021-12-30 20:28:14',110,1,6),(75999000,'2021-12-30 20:29:03',111,1,8),(67999000,'2021-12-30 20:29:22',112,1,9),(49999000,'2021-12-30 20:34:44',113,2,4),(58999000,'2021-12-30 20:34:53',114,3,4),(49999000,'2021-12-30 20:35:00',115,4,4),(45489000,'2021-12-30 20:35:08',116,5,4),(50099000,'2021-12-30 20:35:38',117,2,5),(59099000,'2021-12-30 20:35:46',118,3,5),(50099000,'2021-12-30 20:36:00',119,4,5),(45589000,'2021-12-30 20:36:08',120,5,5),(80099000,'2021-12-30 20:36:24',121,2,6),(89099000,'2021-12-30 20:36:33',122,3,6),(80099000,'2021-12-30 20:36:41',123,4,6),(75589000,'2021-12-30 20:36:48',124,5,6),(80199000,'2021-12-30 20:37:11',125,2,8),(89199000,'2021-12-30 20:37:21',126,3,8),(80199000,'2021-12-30 20:37:30',127,4,8),(75689000,'2021-12-30 20:37:38',128,5,8),(88299000,'2021-12-30 20:37:56',129,2,9),(89299000,'2021-12-30 20:38:01',130,3,9),(80299000,'2021-12-30 20:38:07',131,4,9),(75789000,'2021-12-30 20:38:12',132,5,9),(110299000,'2021-12-31 09:14:29',133,2,9),(118399000,'2021-12-31 09:20:28',134,2,4);
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `black_list`
--

DROP TABLE IF EXISTS `black_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `black_list` (
  `User_ID` int NOT NULL,
  `product_auction_ID` int NOT NULL,
  KEY `User_ID` (`User_ID`),
  KEY `fk_black_list_product_auction1_idx` (`product_auction_ID`),
  CONSTRAINT `black_list_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`),
  CONSTRAINT `fk_black_list_product_auction1` FOREIGN KEY (`product_auction_ID`) REFERENCES `product_auction` (`Pro_Auc_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `black_list`
--

LOCK TABLES `black_list` WRITE;
/*!40000 ALTER TABLE `black_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `black_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `Cat_ID` int NOT NULL AUTO_INCREMENT,
  `Cname` text NOT NULL,
  `Cparent_ID` int DEFAULT NULL,
  `Level` int DEFAULT NULL,
  PRIMARY KEY (`Cat_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Đồ điện tử ',NULL,1),(2,'Thời trang',NULL,1),(3,'Sức khỏe',NULL,1),(4,'Thiết bị đeo',NULL,1),(5,'Khác',NULL,1),(6,'Quần áo',2,2),(7,'Giày dép',2,2),(8,'Dụng cụ thể thao',3,2),(9,'Thực phẩm hỗ trợ',3,2),(10,'Laptop',1,2),(11,'Điện thoại',1,2),(12,'Đồng hồ',4,2);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `Pro_ID` int DEFAULT NULL,
  `User_ID` int DEFAULT NULL,
  KEY `Pro_ID` (`Pro_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`Pro_ID`) REFERENCES `products` (`Pro_ID`),
  CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magage`
--

DROP TABLE IF EXISTS `magage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magage` (
  `Pro_ID` int DEFAULT NULL,
  `User_ID` int DEFAULT NULL,
  KEY `Pro_ID` (`Pro_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `magage_ibfk_1` FOREIGN KEY (`Pro_ID`) REFERENCES `products` (`Pro_ID`),
  CONSTRAINT `magage_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magage`
--

LOCK TABLES `magage` WRITE;
/*!40000 ALTER TABLE `magage` DISABLE KEYS */;
INSERT INTO `magage` VALUES (1,1),(2,2),(3,3),(4,1),(5,2),(6,3),(7,2),(8,1),(9,3),(10,1),(11,2),(12,3),(13,2),(14,1),(15,3),(16,2),(17,3),(18,2),(19,1),(20,3),(21,1),(22,2),(23,3),(24,2),(25,1),(26,3),(27,1),(28,2),(29,3),(30,2),(31,1),(32,2),(33,3),(34,1),(35,2),(36,3),(37,1),(38,2),(39,3),(40,1),(41,2),(42,3),(43,1);
/*!40000 ALTER TABLE `magage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `points`
--

DROP TABLE IF EXISTS `points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `points` (
  `id` int NOT NULL AUTO_INCREMENT,
  `up` int NOT NULL,
  `down` int NOT NULL,
  `User_ID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `points_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `points`
--

LOCK TABLES `points` WRITE;
/*!40000 ALTER TABLE `points` DISABLE KEYS */;
INSERT INTO `points` VALUES (1,10,0,1),(2,10,0,2),(3,10,0,3),(4,10,0,4),(5,10,0,5),(6,10,0,6),(7,99999999,0,7),(8,10,0,8),(12,10,0,9);
/*!40000 ALTER TABLE `points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_auction`
--

DROP TABLE IF EXISTS `product_auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_auction` (
  `Pro_Auc_ID` int NOT NULL AUTO_INCREMENT,
  `Start_Price` int NOT NULL,
  `Distance_Price` int NOT NULL,
  `Start_Time` datetime NOT NULL,
  `End_Time` datetime NOT NULL,
  `Pro_ID` int NOT NULL,
  `Current_Price` int DEFAULT NULL,
  `Total_Bid` int DEFAULT NULL,
  PRIMARY KEY (`Pro_Auc_ID`),
  KEY `Pro_ID` (`Pro_ID`),
  CONSTRAINT `product_auction_ibfk_1` FOREIGN KEY (`Pro_ID`) REFERENCES `products` (`Pro_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_auction`
--

LOCK TABLES `product_auction` WRITE;
/*!40000 ALTER TABLE `product_auction` DISABLE KEYS */;
INSERT INTO `product_auction` VALUES (1,20799000,100000,'2021-12-30 20:47:59','2022-01-01 06:13:14',1,68099000,5),(2,19999000,100000,'2021-12-27 17:43:04','2022-01-01 03:40:09',2,110399000,7),(3,28999000,100000,'2021-12-27 17:43:04','2022-01-01 03:09:12',3,89299000,5),(4,19999000,100000,'2021-12-27 17:43:04','2022-01-01 05:26:14',4,80299000,5),(5,15489000,100000,'2021-12-27 17:43:04','2022-01-01 05:43:13',5,75789000,5),(6,22999000,100000,'2021-12-27 17:43:04','2022-01-01 15:32:18',6,22999000,0),(7,25999000,100000,'2021-12-27 17:43:04','2022-01-01 10:42:17',7,25999000,0),(8,10790000,100000,'2021-12-27 17:43:04','2022-01-01 11:30:12',8,10790000,0),(9,4290000,100000,'2021-12-27 17:43:04','2022-01-01 11:28:22',9,4290000,0),(10,3690000,100000,'2021-12-27 17:43:04','2022-01-04 07:20:00',10,3690000,0),(11,3390000,100000,'2021-12-27 17:43:04','2022-01-06 12:27:06',11,3390000,0),(12,32990000,100000,'2021-12-27 17:43:04','2022-01-07 17:20:00',12,32990000,0),(13,150000,100000,'2021-12-27 17:43:04','2022-01-07 19:16:05',13,150000,0),(14,250000,100000,'2021-12-27 17:43:04','2022-01-06 17:20:00',14,250000,0),(15,200000,100000,'2021-12-27 17:43:04','2022-01-09 17:20:00',15,200000,0),(16,220000,100000,'2021-12-27 17:43:04','2022-01-14 17:20:00',16,220000,0),(17,170000,100000,'2021-12-27 17:43:04','2022-03-01 17:20:00',17,170000,0),(18,480000,100000,'2021-12-27 15:23:25','2022-01-01 20:13:00',18,480000,0),(19,210000,100000,'2021-12-27 09:12:34','2022-01-03 17:20:00',19,210000,0),(20,320000,100000,'2021-12-27 12:13:34','2022-01-07 13:20:00',20,320000,0),(21,310000,100000,'2021-12-14 17:19:40','2022-01-07 17:14:00',21,310000,0),(22,310000,100000,'2021-12-27 09:13:46','2022-01-05 17:24:00',22,310000,0),(23,3000000,100000,'2021-12-12 17:19:40','2022-01-06 13:20:00',23,3000000,0),(24,1000000,100000,'2021-12-27 09:25:35','2022-01-05 11:14:00',24,1000000,0),(25,1000000,100000,'2021-12-27 12:28:32','2022-01-08 19:13:25',25,1000000,0),(26,100000,100000,'2021-12-27 11:26:32','2022-01-20 17:20:00',26,100000,0),(27,120000,100000,'2021-12-27 07:27:23','2022-01-24 17:20:00',27,120000,0),(28,130000,100000,'2021-12-27 06:19:40','2022-01-04 17:20:00',28,130000,0),(29,150000,100000,'2021-12-27 23:25:48','2022-01-05 18:15:00',29,150000,0),(30,160000,100000,'2021-12-27 09:32:49','2022-01-02 14:20:00',30,160000,0),(31,160000,100000,'2021-12-27 22:26:32','2022-01-21 19:15:00',31,160000,0),(32,750000,100000,'2021-12-27 22:26:32','2022-01-02 23:14:00',32,750000,0),(33,100000,100000,'2021-12-27 22:26:32','2022-01-03 17:20:15',33,100000,0),(34,850000,100000,'2021-12-27 22:26:32','2022-01-03 17:15:00',34,850000,0),(35,2000000,100000,'2021-12-27 22:26:32','2022-01-02 17:14:00',35,2000000,0),(36,800000,100000,'2021-12-27 22:26:32','2022-01-02 10:20:00',36,800000,0),(37,2500000,100000,'2021-12-27 22:26:32','2022-01-05 20:11:00',37,2500000,0),(38,3000000,100000,'2021-12-27 22:26:32','2022-01-02 07:31:07',38,3000000,0),(39,950000,100000,'2021-12-27 22:26:32','2022-01-04 17:14:00',39,950000,0),(40,50000,100000,'2021-12-27 22:26:32','2022-01-03 19:13:10',40,50000,0),(41,45000,100000,'2021-12-27 22:26:32','2022-01-02 17:26:00',41,45000,0),(42,90000,100000,'2021-12-27 22:26:32','2022-01-07 11:20:00',42,90000,0),(43,90000,100000,'2021-12-27 22:26:32','2022-01-09 10:25:00',43,90000,0);
/*!40000 ALTER TABLE `product_auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `Pro_ID` int NOT NULL AUTO_INCREMENT,
  `Pname` text NOT NULL,
  `Price` int NOT NULL,
  `img` text,
  `description` text,
  `Status` int NOT NULL,
  `Cat_ID` int NOT NULL,
  PRIMARY KEY (`Pro_ID`),
  KEY `Cat_ID` (`Cat_ID`),
  FULLTEXT KEY `Pname` (`Pname`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`Cat_ID`) REFERENCES `categories` (`Cat_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Laptop Dell Latitude',20799000,'img','<div class=\"content has-table\"><table><tbody><tr><td>Thời gian pin</td><td>12h</td></tr><tr><td>Thời gian sạc</td><td>8h</td></tr><tr><td>Tốc độ CPU</td><td>4.1Ghz</td></tr><tr><td>Hiển thị màu sắc</td><td>HD</td></tr><tr><td>Bluetooth</td><td>Bluetooth 5.0 </td></tr><tr><td>Bộ nhớ đồ họa</td><td>Tối đa 64GB</td></tr><tr><td>Thương hiệu</td><td>Dell</td></tr></tbody></table></div></br></br><div class=\'text-xl font-bold\'>29/12/2021</div><p>aaaaa</p></br></br><div class=\'text-xl font-bold\'>29/12/2021</div><p>tiếng ziệt</p></br></br><div class=\'text-xl font-bold\'>29/12/2021</div><p>sửa đc </p>',1,10),(2,'Laptop Dell Vostro',19999000,'img','<div class=\"content has-table\"><table><tbody><tr><td>Thời gian pin</td><td>12h</td></tr><tr><td>Thời gian sạc</td><td>8h</td></tr><tr><td>Tốc độ CPU</td><td>4.5Ghz</td></tr><tr><td>Hiển thị màu sắc</td><td>HD</td></tr><tr><td>Bluetooth</td><td>Bluetooth 5.0 </td></tr><tr><td>Bộ nhớ đồ họa</td><td>Tối đa 64GB</td></tr><tr><td>Thương hiệu</td><td>Dell</td></tr></tbody></table></div>',1,10),(3,'Laptop HP ProBook',28999000,'hehe','<div class=\"content has-table\"><table><tbody><tr><td>Thời gian pin</td><td>10h</td></tr><tr><td>Thời gian sạc</td><td>8h</td></tr><tr><td>Tốc độ CPU</td><td>4.0Ghz</td></tr><tr><td>Hiển thị màu sắc</td><td>HD</td></tr><tr><td>Bluetooth</td><td>Bluetooth 5.0 </td></tr><tr><td>Bộ nhớ đồ họa</td><td>Tối đa 64GB</td></tr><tr><td>Thương hiệu</td><td>HP</td></tr></tbody></table></div>',1,10),(4,'Laptop HP Pavilion',19999000,'img','<div class=\"content has-table\"><table><tbody><tr><td>Thời gian pin</td><td>12h</td></tr><tr><td>Thời gian sạc</td><td>8h</td></tr><tr><td>Tốc độ CPU</td><td>4.1Ghz</td></tr><tr><td>Hiển thị màu sắc</td><td>HD</td></tr><tr><td>Bluetooth</td><td>Bluetooth 5.0 </td></tr><tr><td>Bộ nhớ đồ họa</td><td>Tối đa 64GB</td></tr><tr><td>Thương hiệu</td><td>HP</td></tr></tbody></table></div>',1,10),(5,'Laptop Dell Inspiron',15489000,' xxx','<div class=\"content has-table\"><table><tbody><tr><td>Thời gian pin</td><td>12h</td></tr><tr><td>Thời gian sạc</td><td>8h</td></tr><tr><td>Tốc độ CPU</td><td>4.1Ghz</td></tr><tr><td>Hiển thị màu sắc</td><td>HD</td></tr><tr><td>Bluetooth</td><td>Bluetooth 5.0 </td></tr><tr><td>Bộ nhớ đồ họa</td><td>Tối đa 64GB</td></tr><tr><td>Thương hiệu</td><td>Dell</td></tr></tbody></table></div>',1,10),(6,'Laptop Lenovo Yoga Slim',22999000,'xxx','<div class=\"content has-table\"><table><tbody><tr><td>Thời gian pin</td><td>15h</td></tr><tr><td>Thời gian sạc</td><td>9h</td></tr><tr><td>Tốc độ CPU</td><td>4.5Ghz</td></tr><tr><td>Hiển thị màu sắc</td><td>HD</td></tr><tr><td>Bluetooth</td><td>Bluetooth 5.0 </td></tr><tr><td>Bộ nhớ đồ họa</td><td>Tối đa 64GB</td></tr><tr><td>Thương hiệu</td><td>Lenovo</td></tr></tbody></table></div>',1,10),(7,'Laptop Lenovo ThinkBook',25999000,' xxx','<div class=\"content has-table\"><table><tbody><tr><td>Thời gian pin</td><td>13h</td></tr><tr><td>Thời gian sạc</td><td>9h</td></tr><tr><td>Tốc độ CPU</td><td>4.0Ghz</td></tr><tr><td>Hiển thị màu sắc</td><td>HD</td></tr><tr><td>Bluetooth</td><td>Bluetooth 5.0 </td></tr><tr><td>Bộ nhớ đồ họa</td><td>Tối đa 64GB</td></tr><tr><td>Thương hiệu</td><td>Lenovo</td></tr></tbody></table></div>',1,10),(8,'iPhone 11 64GB',10790000,'xxx','<div class=\"content has-table\"><table><tbody><tr><td>Bluetooth</td><td>Có</td></tr><tr><td>Thương hiệu</td><td>Apple</td></tr><tr><td>Xuất xứ thương hiệu</td><td>Mỹ</td></tr><tr><td>Camera sau</td><td>12 MP + 12 MP</td></tr><tr><td>Camera trước</td><td>12 MP</td></tr><tr><td>Chip đồ họa (GPU)</td><td>Apple GPU (4-core graphics)</td></tr><tr><td>Model</td><td>iPhone 12</td></tr><tr><td>Số sim</td><td>2 (nano‑SIM + eSIM)</td></tr><tr><td>Loại Sim</td><td>Nano Sim</td></tr><tr><td>Trọng lượng</td><td>164g</td></tr><tr><td>RAM</td><td>4GB</td></tr><tr><td>ROM</td><td>64GB</td></tr><tr><td>Kích thước màn hình</td><td>6.1 inch</td></tr></tbody></table></div>',1,11),(9,'Oppo A15s 64GB',4290000,'xxx','<div class=\"content has-table\"><table><tbody><tr><td>Dung lượng pin</td><td>4230 mAh</td></tr><tr><td>Bluetooth</td><td>v5.0</td></tr><tr><td>Thương hiệu</td><td>OPPO</td></tr><tr><td>Xuất xứ thương hiệu</td><td>Trung Quốc</td></tr><tr><td>Camera sau</td><td>Chính 13 MP &amp; Phụ 2 MP, 2 MP</td></tr><tr><td>Camera trước</td><td>8 MP</td></tr<tr><td>Chip đồ họa (GPU)</td><td>IMG PowerVR GE8320</td></tr><tr><td>Chip set</td><td>MediaTek Helio P35 8 nhân</td></tr><tr><td>Kết nối khác</td><td>OTG</td></tr><tr><td>Tốc độ CPU</td><td>4 nhân 2.3 GHz &amp; 4 nhân 1.8 GHz</td></tr><tr><td>Độ phân giải</td><td>HD+ (720 x 1600 pixels)</td></tr><tr><td>ROM</td><td>64GB</td></tr><tr><td>Kích thước màn hình</td><td>6.52 inch</td></tr></tbody></table></div>',1,11),(10,'Vivo Y15s 32GB',3690000,' xxx','<div class=\"content has-table\"><table><tbody><tr><td>Dung lượng pin</td><td>4230 mAh</td></tr><tr><td>Bluetooth</td><td>v5.0</td></tr><tr><td>Thương hiệu</td><td>OPPO</td></tr><tr><td>Xuất xứ thương hiệu</td><td>Trung Quốc</td></tr><tr><td>Camera sau</td><td>Chính 13 MP &amp; Phụ 2 MP, 2 MP</td></tr><tr><td>Camera trước</td><td>8 MP</td></tr><tr><td>Hỗ trợ thẻ nhớ ngoài</td><td>MicroSD</td></tr><tr><td>Chip đồ họa (GPU)</td><td>IMG PowerVR GE8320</td></tr><tr><td>Chip set</td><td>MediaTek Helio P35 8 nhân</td></tr><tr><td>ROM</td><td>64GB</td></tr><tr><td>Kích thước màn hình</td><td>6.52 inch</td></tr><tr><td>Hỗ trợ thẻ tối đa</td><td>256GB</td></tr></tbody></table></div>',1,11),(11,'Realme 64GB',3390000,' xxx','<div class=\"content has-table\"><table><tbody><tr><td>Dung lượng pin</td><td>4230 mAh</td></tr><tr><td>Bluetooth</td><td>v5.0</td></tr><tr><td>Thương hiệu</td><td>OPPO</td></tr><tr><td>Xuất xứ thương hiệu</td><td>Trung Quốc</td></tr><tr><td>Camera sau</td><td>Chính 13 MP &amp; Phụ 2 MP, 2 MP</td></tr><tr><td>Camera trước</td><td>8 MP</td></tr><tr><td>Hỗ trợ thẻ nhớ ngoài</td><td>MicroSD</td></tr><tr><td>Chip đồ họa (GPU)</td><td>IMG PowerVR GE8320</td></tr><tr><td>Chip set</td><td>MediaTek Helio P35 8 nhân</td></tr><tr><td>ROM</td><td>64GB</td></tr><tr><td>Kích thước màn hình</td><td>6.52 inch</td></tr><tr><td>Hỗ trợ thẻ tối đa</td><td>256GB</td></tr></tbody></table></div>',1,11),(12,'iPhone 13 128GB',32990000,' xxx','<div><table><tbody><tr><td>Dung lượng pin</td><td>4230 mAh</td></tr><tr><td>Bluetooth</td><td>v5.0</td></tr><tr><td>Thương hiệu</td><td>OPPO</td></tr><tr><td>Xuất xứ thương hiệu</td><td>Trung Quốc</td></tr><tr><td>Camera sau</td><td>Chính 13 MP &amp; Phụ 2 MP, 2 MP</td></tr><tr><td>Camera trước</td><td>8 MP</td></tr><tr><td>Hỗ trợ thẻ nhớ ngoài</td><td>MicroSD</td></tr><tr><td>Chip đồ họa (GPU)</td><td>IMG PowerVR GE8320</td></tr><tr><td>Chip set</td><td>MediaTek Helio P35 8 nhân</td></tr><tr><td>ROM</td><td>64GB</td></tr><tr><td>Kích thước màn hình</td><td>6.52 inch</td></tr><tr><td>Hỗ trợ thẻ tối đa</td><td>256GB</td></tr></tbody></table></div> ',1,11),(13,'Quần Jogger Nam',150000,'xxx',' <div><ul><li>Tên sản phẩm: Quần Thể Thao Jogger Nam 5S (5 Màu), Chất Vải Gió Cao Cấp, Siêu Nhẹ, Chống Nhăn, Giữ Ấm Tốt (QGD21014)</li><li> Chất liệu: 95% polyester, 5% spandex</li><li>Màu sắc: Xanh cổ vịt, ghi tối, đen, ghi sáng, tím than tối</li><li>Phom dáng:Slimfit hơi ôm</li> <li>Size: S-M-L-XL-2XL</li><li>Xuất xứ: Việt Nam</li></ul></div> ',1,6),(14,'Quần Kaki Nam',250000,'xxx','<div><ul><li>Chỉ cần phối với1 chiếc áo thun hoặc sơ mi , cũng làm nên 1 restock cực chất này</li><li>Quần kaki baggy basic pants quốc dân - ai chưa có nên tậu 1 em nhé</li><li>Đi đâu cũng đẹp , phối đồ gì cũng năng động</li><li>Chất liệu : kaki dày dặn , Đảm bảo chất liệu kaki ( không phải vải dù )</li><li>Form : lên form cực chuẩn , có 4 size S M L xl</li><li>Lưng thun dây rút, không kén dáng, che mọi khuyết điểm đôi chân</li><li>Màu : be,nâu. đen. ghi</li><li>Phù hợp mọi đối tương, phối đồ cực yêu , kết hợp với áo thun hay áo sơ mi kèm sneaker cực chất</li><li>Phù hợp mọi môi trường, đi chơi, đi học</li></ul></div>',1,6),(15,'Áo giữ nhiet nu',200000,'xxx','<ul><li>Tên sản phẩm: Áo giữ nhiệt nữ, Chất Vải Cao Cấp, Siêu Nhẹ, Chống Nhăn, Giữ Ấm Tốt</li><li> Chất liệu: 95% polyester, 5% spandex</li><li>Phom dáng:Slimfit hơi ôm</li><li>Size: S-M-L-XL-2XL</li><li>Xuất xứ: Việt Nam</li></ul>',1,6),(16,'Áo Thun Nam Polo',220000,'xxx','<div><ul><li><strong>Áo thun nam cổ bẻ thời trang&nbsp;</strong>thiết kế cổ bẻ, tay ngắn, mang đến phong cách khỏe khoắn, năng động</li><li>Màu trơn đơn giản, tinh tế cùng với form áo rộng rãi, thoải mái giúp tôn được nét mạnh mẽ, nam tính</li><li>Áo thun có nhiều màu sắc khác nhau</li><li>Chất liệu thun cá sấu mềm mại, thấm hút mồ hôi, mang lại cảm giác thoải mái khi mặc</li><li>Bạn có thể chọn kết hợp với quần jeans, đồng hồ thể thao và giày lười để tạo nên một set đồ hiện đại hoặc nhiều trang phục thời trang khác</li></ul></div>',1,6),(17,'Áo sơ mi dài tay',170000,'xxx','<div><ul><li><strong>Áo sơ mi dài tay&nbsp;</strong>thiết kế cổ bẻ, tay dài, mang đến phong cách trẻ trung, lịch lãm</li><li>Màu trơn đơn giản, tinh tế cùng với form áo rộng rãi, thoải mái giúp tôn được nét mạnh mẽ, nam tính</li<li>Chất liệu mềm mại, không nhăn, mang lại cảm giác thoải mái khi mặc</li><li>Bạn có thể chọn kết hợp với quần jeans, đồng hồ thể thao và giày lười để tạo nên một set đồ hiện đại hoặc nhiều trang phục thời trang khác</li></ul></div>',1,6),(18,'Giày Sneaker Nam',480000,'xxx','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li><strong>Giày Sneaker Nam &nbsp;</strong>Thiết kế trẻ trung, năng động</li> <li>Chất liệu da cao cấp, nam tính</li> <li>Chất liệu đế: cao su</li><li>Bạn có thể chọn kết hợp với quần jeans, đồng hồ thể thao để tạo nên một set đồ hiện đại hoặc nhiều trang phục thời trang khác</li></ul></div>',1,7),(19,'Giày Thể Thao Nam',210000,'xxx','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li><strong>Giày Thể thao Nam Bitis Hunter &nbsp;</strong>Form dáng cổ cao</li> <li>Lót đế trong chất liệu EVA, ép khuôn 3D, thâm hút mạnh</li> <li>Chất liệu đế: cao su R.E siêu bền, siêu nhẹ, đàn hồi tốt</li></ul></div>',1,7),(20,'Giày Da Nam Công sở',320000,'xxx','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li><strong>Giày Da công sở nam &nbsp;</strong>Thiết kế sang trọng lịch lãm</li> <li>Chất liệu da cao cấp, nam tính</li> <li>Form giày ôm chân, hợp nhiều lứa tuổi</li><li>Đủ size từ 38-43</li></ul></div>',1,7),(21,'Giày Sneaker Nữ Trắng',310000,'xxx','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li><strong>Giày Sneaker Nữ &nbsp;</strong>Kiểu dáng sang trọng, nhẹ nhàng</li> <li>Đế cao su nhẹ, êm ái cho người dùng</li> <li>Form giày ôm chân, hợp nhiều lứa tuổi</li><li>Đủ size từ 35-40</li></ul></div>',1,7),(22,'Giày Oxford Nữ ',310000,'xxx','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li><strong>Giày Oxford Nữ &nbsp;</strong>Thiết kế lịch lãm, nữ tính</li> <li>Chất liệu da cao cấp, họa tiết tinh tế</li> <li>Form giày ôm chân, hợp nhiều lứa tuổi</li><li>Đủ size từ 35-39</li></ul></div>',1,7),(23,'Xe đạp thể thao BC66',3000000,'img','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li> Khối lượng 24kg</li> <li>Khung xe: Thép chống gỉ, sơn tĩnh điện</li> <li>Xuất xứ: Trung Quốc</li><li>Thuong hieu: Longstyle</li> <li>Màu sắc: trắng, ghi xám, đen,...</li> <li>Phù hợp cho nhân viên văn phòng, phòng tập,...</li> </ul></div>',1,8),(24,'Máy tập tăng chiều cao',1000000,'img','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li> Khối lượng 24kg</li> <li>Khung: Thép chống gỉ, sơn tĩnh điện</li> <li>Đệm chân, tay cầm: cao su, da bọc</li> <li>Xuất xứ: Việt Nam</li><li>Thuong hieu: Longstyle</li> <li>Màu sắc: trắng, ghi xám, đen,...</li> <li>Phù hợp cho mọi lứa tuổi.</li> </ul></div> ',1,8),(25,'Xe đạp thể thao BC66',1000000,'img','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li> Khối lượng 24kg</li> <li>Khung xe: Thép chống gỉ, sơn tĩnh điện</li> <li>Xuất xứ: Trung Quốc</li><li>Thuong hieu: Longstyle</li> <li>Màu sắc: trắng, ghi xám, đen,...</li> <li>Phù hợp cho nhân viên văn phòng, phòng tập,...</li> </ul></div> ',1,8),(26,'Thảm tập putting',100000,'img','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li> Kích thước: 5 x 1 m </li> <li>Đi kèm: 1 gậy + 1 bóng</li> <li>Xuất xứ: US</li><li>Thuong hieu:Boston</li>  <li>Phù hợp cho hoạt động trong nhà, ngoài trời,...</li> </ul></div> ',1,8),(27,'Vợt tennis',120000,'img','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li> Khối lượng 3kg</li> <li>Chất liệu: nhựa tổng hợp</li> <li>Xuất xứ: Trung Quốc</li><li>Thuong hieu: Addidas</li> <li>Màu sắc: trắng, ghi xám, đen,...</li> <li>Tặng kèm: bộ quấn tay cầm</li> </ul></div> ',1,8),(28,'Thực phẩm bổ sung Optimal Gold',130000,'img','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li> Khối lượng 1kg</li>  <li>Xuất xứ: USA</li><li>Thuong hieu: Nutrifood</li> <li>Freeship: TP.HCM, Hà Nội,...</li> <li>Sử dụng trước và sau buổi tập</li> </ul></div> ',1,9),(29,'Sữa Tăng Cơ Whey Protein',150000,'img','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li> Khối lượng 1kg</li>  <li>Xuất xứ: USA</li><li>Thuong hieu: Nutrifood</li> <li>Freeship: TP.HCM, Hà Nội,...</li> <li>Sử dụng trước và sau buổi tập</li> <li>Dành cho mọi đối tượng</li> </ul></div> ',1,9),(30,'Thực phẩm hỗ trợ BCC',160000,'img','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li> Khối lượng 1.5kg</li>  <li>Xuất xứ: USA</li><li> Thuong hieu: Golden Standard</li>  <li>Sử dụng trước và sau buổi tập</li> <li>Tặng kèm: 1 bình giữ nhiệt 1.5l</li> </ul></div> ',1,9),(31,'Sữa Tăng Cơ Organic',160000,'img','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li> Khối lượng 2kg</li>  <li>Xuất xứ: USA</li><li>Thuong hieu: True Recover</li>  <li>Sử dụng trước và sau buổi tập</li> <li>Dành cho mọi đối tượng</li> </ul></div> ',1,9),(32,'Đồng hồ CASIO ',750000,NULL,NULL,1,12),(33,'Đồng hồ Apple Watch ',100000,NULL,NULL,1,12),(34,'Tai nghe Bluetooth',850000,NULL,NULL,1,12),(35,'Tai nghe chụp Zealot',2000000,NULL,NULL,1,12),(36,'Đồng hồ FullBox kim loại',800000,NULL,NULL,1,12),(37,'Đồng hồ HuaWei GT30',2500000,NULL,NULL,1,12),(38,'Tai nghe Bluetooth GX-50',3000000,NULL,NULL,1,12),(39,'Nhẫn titan nam 3 màu',950000,NULL,NULL,1,5),(40,'Nhẫn nam chạm rồng',50000,NULL,NULL,1,5),(41,'Vòng đeo tay nữ',45000,NULL,NULL,1,5),(42,'Vòng cổ kim cương 24 car',90000,NULL,NULL,1,5),(43,'Nhẫn đôi kim cương trắng',500000,NULL,NULL,1,5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rates`
--

DROP TABLE IF EXISTS `rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rates` (
  `RateB_ID` int NOT NULL AUTO_INCREMENT,
  `Seller_ID` int NOT NULL,
  `Comment` text NOT NULL,
  `Type` int NOT NULL,
  `Bidder` int NOT NULL,
  `Pro_ID` int NOT NULL,
  `Vote` int DEFAULT NULL,
  PRIMARY KEY (`RateB_ID`),
  KEY `Pro_ID` (`Pro_ID`),
  CONSTRAINT `rates_ibfk_2` FOREIGN KEY (`Pro_ID`) REFERENCES `products` (`Pro_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rates`
--

LOCK TABLES `rates` WRITE;
/*!40000 ALTER TABLE `rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `Request_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int NOT NULL,
  PRIMARY KEY (`Request_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `request_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `User_ID` int NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Pass` text NOT NULL,
  `userrole` int NOT NULL,
  `Address` text NOT NULL,
  `Date_o_Birth` date DEFAULT NULL,
  `Seller_Expired_Date` date DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Honda','tomcursi123@gmail.com','$2a$12$NjeIBtO8D7DOhuCnxlRxxO4KA4iSB6zpBjM/1y0lMSMXm7t4zvtBO',2,'Duc Ngoc, Xã Suối Nghệ, Huyện Châu Đức, Bà Rịa - Vũng Tàu','2021-12-18','2021-12-31'),(2,'Suzuki','thanhpt21.it@gmail.com','$2a$12$NjeIBtO8D7DOhuCnxlRxxO4KA4iSB6zpBjM/1y0lMSMXm7t4zvtBO',2,'ấp 1, Xã Đắk Ha, Huyện Đắk Glong, Đắk Nông','2012-09-02','2021-12-31'),(3,'BMW','vohuugiau2901@gmail.com','$2a$12$NjeIBtO8D7DOhuCnxlRxxO4KA4iSB6zpBjM/1y0lMSMXm7t4zvtBO',2,'Duc Ngoc, Xã Suối Nghệ, Huyện Châu Đức, Bà Rịa - Vũng Tàu','2021-12-27','2021-12-31'),(4,'Audi','ngocduc011001@gmail.com','$2a$12$NjeIBtO8D7DOhuCnxlRxxO4KA4iSB6zpBjM/1y0lMSMXm7t4zvtBO',1,'Duc Ngoc, Xã Suối Nghệ, Huyện Châu Đức, Bà Rịa - Vũng Tàu','2021-12-27',NULL),(5,'Toyota','joofunny3110@gmail.com','$2a$12$NjeIBtO8D7DOhuCnxlRxxO4KA4iSB6zpBjM/1y0lMSMXm7t4zvtBO',1,'admin, Xã Tân Thuận Đông, Thành Phố Cao Lãnh, Đồng Tháp','2012-09-02',NULL),(6,'Huynhdai','joofunny31@gmail.com','$2a$12$NjeIBtO8D7DOhuCnxlRxxO4KA4iSB6zpBjM/1y0lMSMXm7t4zvtBO',1,'Pham Ngoc Duc, Xã Duyệt Trung, Thị Xã Cao Bằng, Cao Bằng','2012-09-02',NULL),(7,'admin','admin@ad.com','$2a$12$NjeIBtO8D7DOhuCnxlRxxO4KA4iSB6zpBjM/1y0lMSMXm7t4zvtBO',3,'Duc Ngoc, Xã Suối Nghệ, Huyện Châu Đức, Bà Rịa - Vũng Tàu','2021-12-24',NULL),(8,'Mercedes','joofunny10@gmail.com','$2a$12$NjeIBtO8D7DOhuCnxlRxxO4KA4iSB6zpBjM/1y0lMSMXm7t4zvtBO',1,'Duc Ngoc, Xã Suối Nghệ, Huyện Châu Đức, Bà Rịa - Vũng Tàu','2012-09-02',NULL),(9,'Ford','cu170399@gmail.com','$2a$12$NjeIBtO8D7DOhuCnxlRxxO4KA4iSB6zpBjM/1y0lMSMXm7t4zvtBO',1,'1, Xã Sơn Bình, Huyện Châu Đức, Bà Rịa - Vũng Tàu','2012-09-02','2022-01-05');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `win_list`
--

DROP TABLE IF EXISTS `win_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `win_list` (
  `Win_List_ID` int NOT NULL AUTO_INCREMENT,
  `Pro_Auc_ID` int DEFAULT NULL,
  `User_ID` int DEFAULT NULL,
  PRIMARY KEY (`Win_List_ID`),
  KEY `win_list_product_auction_Pro_Auc_ID_fk` (`Pro_Auc_ID`),
  KEY `win_list_users_User_ID_fk` (`User_ID`),
  CONSTRAINT `win_list_product_auction_Pro_Auc_ID_fk` FOREIGN KEY (`Pro_Auc_ID`) REFERENCES `product_auction` (`Pro_Auc_ID`),
  CONSTRAINT `win_list_users_User_ID_fk` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `win_list`
--

LOCK TABLES `win_list` WRITE;
/*!40000 ALTER TABLE `win_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `win_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'auctionweb'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `Check_User_Expired_Date` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `Check_User_Expired_Date` ON SCHEDULE EVERY 1 DAY STARTS '2021-12-30 00:00:00' ON COMPLETION PRESERVE ENABLE DO begin
        update auctionweb.users
        set userrole            = 1,
            Seller_Expired_Date = null
        where Seller_Expired_Date = CURDATE();
    end */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'auctionweb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-31 15:59:15
