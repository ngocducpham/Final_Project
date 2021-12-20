DROP DATABASE  IF  EXISTS `auctionweb`;
CREATE DATABASE  IF NOT EXISTS `auctionweb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (150000,'2021-12-18 17:09:53',1,1,1),(200000,'2021-12-19 10:38:19',3,2,1),(300000,'2021-12-19 10:39:15',4,1,1);
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `black_list`
--

DROP TABLE IF EXISTS `black_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `black_list` (
  `Auction_ID` int NOT NULL,
  `User_ID` int NOT NULL,
  KEY `Auction_ID` (`Auction_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `black_list_ibfk_1` FOREIGN KEY (`Auction_ID`) REFERENCES `auction` (`Auction_ID`),
  CONSTRAINT `black_list_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
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
  PRIMARY KEY (`Cat_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Laptop',NULL),(2,'Dien thoai',NULL),(3,'Quan Ao',NULL),(4,'Giay Dep',NULL),(5,'Dung cu the thao',NULL),(6,'Thuc pham ho tro',NULL),(7,'Thiet bi deo',NULL);
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
  `points` int NOT NULL,
  `User_ID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `points_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `points`
--

LOCK TABLES `points` WRITE;
/*!40000 ALTER TABLE `points` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_auction`
--

LOCK TABLES `product_auction` WRITE;
/*!40000 ALTER TABLE `product_auction` DISABLE KEYS */;
INSERT INTO `product_auction` VALUES (1,100123,10000,'2021-12-18 15:36:15','2021-12-26 15:36:20',1,100000,2),(2,200000,20000,'2021-12-18 15:38:21','2021-12-25 15:38:26',2,200000,1),(3,300000,30000,'2021-12-18 15:38:43','2021-12-25 15:38:45',3,300000,0),(4,400000,40000,'2021-12-18 15:39:01','2021-12-23 15:39:03',4,500000,0),(5,500000,50000,'2021-12-18 15:39:26','2021-12-24 15:39:28',5,500000,0),(11,600000,60000,'2021-12-19 10:31:11','2021-12-25 10:31:16',6,600000,0);
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
  `img` text NOT NULL,
  `description` text NOT NULL,
  `Status` int NOT NULL,
  `Cat_ID` int NOT NULL,
  PRIMARY KEY (`Pro_ID`),
  KEY `Cat_ID` (`Cat_ID`),
  FULLTEXT KEY `Pname` (`Pname`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`Cat_ID`) REFERENCES `categories` (`Cat_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Laptop Dell Latitude',16000000,'img','<h4>MÔ TẢ SẢN PHẨM</h4><div class=\"content has-table\"><table><tbody><tr><td>Thời gian pin</td><td>12h</td></tr><tr><td>Thời gian sạc</td><td>8h</td></tr><tr><td>Tốc độ CPU</td><td>4.1Ghz</td></tr><tr><td>Hiển thị màu sắc</td><td>HD</td></tr><tr><td>Bluetooth</td><td>Bluetooth 5.0 </td></tr><tr><td>Bộ nhớ đồ họa</td><td>Tối đa 64GB</td></tr><tr><td>Thương hiệu</td><td>Dell</td></tr></tbody></table></div>',1,1),(2,'Laptop Dell Vostro',15000000,'img','<h4>MÔ TẢ SẢN PHẨM</h4><div class=\"content has-table\"><table><tbody><tr><td>Thời gian pin</td><td>12h</td></tr><tr><td>Thời gian sạc</td><td>8h</td></tr><tr><td>Tốc độ CPU</td><td>4.5Ghz</td></tr><tr><td>Hiển thị màu sắc</td><td>HD</td></tr><tr><td>Bluetooth</td><td>Bluetooth 5.0 </td></tr><tr><td>Bộ nhớ đồ họa</td><td>Tối đa 64GB</td></tr><tr><td>Thương hiệu</td><td>Dell</td></tr></tbody></table></div>',1,1),(3,'Laptop HP ProBook',16000000,'hehe','<h4>MÔ TẢ SẢN PHẨM</h4><div class=\"content has-table\"><table><tbody><tr><td>Thời gian pin</td><td>10h</td></tr><tr><td>Thời gian sạc</td><td>8h</td></tr><tr><td>Tốc độ CPU</td><td>4.0Ghz</td></tr><tr><td>Hiển thị màu sắc</td><td>HD</td></tr><tr><td>Bluetooth</td><td>Bluetooth 5.0 </td></tr><tr><td>Bộ nhớ đồ họa</td><td>Tối đa 64GB</td></tr><tr><td>Thương hiệu</td><td>HP</td></tr></tbody></table></div>',1,1),(4,'Laptop HP Pavilion',16000000,'img','<h4>MÔ TẢ SẢN PHẨM</h4><div class=\"content has-table\"><table><tbody><tr><td>Thời gian pin</td><td>12h</td></tr><tr><td>Thời gian sạc</td><td>8h</td></tr><tr><td>Tốc độ CPU</td><td>4.1Ghz</td></tr><tr><td>Hiển thị màu sắc</td><td>HD</td></tr><tr><td>Bluetooth</td><td>Bluetooth 5.0 </td></tr><tr><td>Bộ nhớ đồ họa</td><td>Tối đa 64GB</td></tr><tr><td>Thương hiệu</td><td>HP</td></tr></tbody></table></div>',1,1),(5,'Laptop Dell Inspiron',16000000,' xxx','<h4>MÔ TẢ SẢN PHẨM</h4><div class=\"content has-table\"><table><tbody><tr><td>Thời gian pin</td><td>12h</td></tr><tr><td>Thời gian sạc</td><td>8h</td></tr><tr><td>Tốc độ CPU</td><td>4.1Ghz</td></tr><tr><td>Hiển thị màu sắc</td><td>HD</td></tr><tr><td>Bluetooth</td><td>Bluetooth 5.0 </td></tr><tr><td>Bộ nhớ đồ họa</td><td>Tối đa 64GB</td></tr><tr><td>Thương hiệu</td><td>Dell</td></tr></tbody></table></div>',1,1),(6,'Laptop Lenovo Yoga Slim',16000000,'xxx','<h4>MÔ TẢ SẢN PHẨM</h4><div class=\"content has-table\"><table><tbody><tr><td>Thời gian pin</td><td>15h</td></tr><tr><td>Thời gian sạc</td><td>9h</td></tr><tr><td>Tốc độ CPU</td><td>4.5Ghz</td></tr><tr><td>Hiển thị màu sắc</td><td>HD</td></tr><tr><td>Bluetooth</td><td>Bluetooth 5.0 </td></tr><tr><td>Bộ nhớ đồ họa</td><td>Tối đa 64GB</td></tr><tr><td>Thương hiệu</td><td>Lenovo</td></tr></tbody></table></div>',1,1),(7,'Laptop Lenovo ThinBook',16000000,' xxx','<h4>MÔ TẢ SẢN PHẨM</h4><div class=\"content has-table\"><table><tbody><tr><td>Thời gian pin</td><td>13h</td></tr><tr><td>Thời gian sạc</td><td>9h</td></tr><tr><td>Tốc độ CPU</td><td>4.0Ghz</td></tr><tr><td>Hiển thị màu sắc</td><td>HD</td></tr><tr><td>Bluetooth</td><td>Bluetooth 5.0 </td></tr><tr><td>Bộ nhớ đồ họa</td><td>Tối đa 64GB</td></tr><tr><td>Thương hiệu</td><td>Lenovo</td></tr></tbody></table></div>',1,1),(8,'iPhone 11 64GB',16000000,'xxx','<h4>MÔ TẢ SẢN PHẨM</h4><div class=\"content has-table\"><table><tbody><tr><td>Bluetooth</td><td>Có</td></tr><tr><td>Thương hiệu</td><td>Apple</td></tr><tr><td>Xuất xứ thương hiệu</td><td>Mỹ</td></tr><tr><td>Camera sau</td><td>12 MP + 12 MP</td></tr><tr><td>Camera trước</td><td>12 MP</td></tr><tr><td>Chip đồ họa (GPU)</td><td>Apple GPU (4-core graphics)</td></tr><tr><td>Model</td><td>iPhone 12</td></tr><tr><td>Số sim</td><td>2 (nano‑SIM + eSIM)</td></tr><tr><td>Loại Sim</td><td>Nano Sim</td></tr><tr><td>Trọng lượng</td><td>164g</td></tr><tr><td>RAM</td><td>4GB</td></tr><tr><td>ROM</td><td>64GB</td></tr><tr><td>Kích thước màn hình</td><td>6.1 inch</td></tr></tbody></table></div>',1,2),(9,'Oppo A15s 64GB',16000000,'xxx','<h4>MÔ TẢ SẢN PHẨM</h4><div class=\"content has-table\"><table><tbody><tr><td>Dung lượng pin</td><td>4230 mAh</td></tr><tr><td>Bluetooth</td><td>v5.0</td></tr><tr><td>Thương hiệu</td><td>OPPO</td></tr><tr><td>Xuất xứ thương hiệu</td><td>Trung Quốc</td></tr><tr><td>Camera sau</td><td>Chính 13 MP &amp; Phụ 2 MP, 2 MP</td></tr><tr><td>Camera trước</td><td>8 MP</td></tr<tr><td>Chip đồ họa (GPU)</td><td>IMG PowerVR GE8320</td></tr><tr><td>Chip set</td><td>MediaTek Helio P35 8 nhân</td></tr><tr><td>Kết nối khác</td><td>OTG</td></tr><tr><td>Tốc độ CPU</td><td>4 nhân 2.3 GHz &amp; 4 nhân 1.8 GHz</td></tr><tr><td>Độ phân giải</td><td>HD+ (720 x 1600 pixels)</td></tr><tr><td>ROM</td><td>64GB</td></tr><tr><td>Kích thước màn hình</td><td>6.52 inch</td></tr></tbody></table></div>',1,2),(10,'Vivi Y15s 32GB',16000000,' xxx','<h4>MÔ TẢ SẢN PHẨM</h4><div class=\"content has-table\"><table><tbody><tr><td>Dung lượng pin</td><td>4230 mAh</td></tr><tr><td>Bluetooth</td><td>v5.0</td></tr><tr><td>Thương hiệu</td><td>OPPO</td></tr><tr><td>Xuất xứ thương hiệu</td><td>Trung Quốc</td></tr><tr><td>Camera sau</td><td>Chính 13 MP &amp; Phụ 2 MP, 2 MP</td></tr><tr><td>Camera trước</td><td>8 MP</td></tr><tr><td>Hỗ trợ thẻ nhớ ngoài</td><td>MicroSD</td></tr><tr><td>Chip đồ họa (GPU)</td><td>IMG PowerVR GE8320</td></tr><tr><td>Chip set</td><td>MediaTek Helio P35 8 nhân</td></tr><tr><td>ROM</td><td>64GB</td></tr><tr><td>Kích thước màn hình</td><td>6.52 inch</td></tr><tr><td>Hỗ trợ thẻ tối đa</td><td>256GB</td></tr></tbody></table></div>',1,2),(11,'Realme 64GB',16000000,' xxx','<h4>MÔ TẢ SẢN PHẨM</h4><div class=\"content has-table\"><table><tbody><tr><td>Dung lượng pin</td><td>4230 mAh</td></tr><tr><td>Bluetooth</td><td>v5.0</td></tr><tr><td>Thương hiệu</td><td>OPPO</td></tr><tr><td>Xuất xứ thương hiệu</td><td>Trung Quốc</td></tr><tr><td>Camera sau</td><td>Chính 13 MP &amp; Phụ 2 MP, 2 MP</td></tr><tr><td>Camera trước</td><td>8 MP</td></tr><tr><td>Hỗ trợ thẻ nhớ ngoài</td><td>MicroSD</td></tr><tr><td>Chip đồ họa (GPU)</td><td>IMG PowerVR GE8320</td></tr><tr><td>Chip set</td><td>MediaTek Helio P35 8 nhân</td></tr><tr><td>ROM</td><td>64GB</td></tr><tr><td>Kích thước màn hình</td><td>6.52 inch</td></tr><tr><td>Hỗ trợ thẻ tối đa</td><td>256GB</td></tr></tbody></table></div>',1,2),(12,'iPhone 13 128GB',16000000,' xxx',' <h4>MÔ TẢ SẢN PHẨM</h4><div><table><tbody><tr><td>Dung lượng pin</td><td>4230 mAh</td></tr><tr><td>Bluetooth</td><td>v5.0</td></tr><tr><td>Thương hiệu</td><td>OPPO</td></tr><tr><td>Xuất xứ thương hiệu</td><td>Trung Quốc</td></tr><tr><td>Camera sau</td><td>Chính 13 MP &amp; Phụ 2 MP, 2 MP</td></tr><tr><td>Camera trước</td><td>8 MP</td></tr><tr><td>Hỗ trợ thẻ nhớ ngoài</td><td>MicroSD</td></tr><tr><td>Chip đồ họa (GPU)</td><td>IMG PowerVR GE8320</td></tr><tr><td>Chip set</td><td>MediaTek Helio P35 8 nhân</td></tr><tr><td>ROM</td><td>64GB</td></tr><tr><td>Kích thước màn hình</td><td>6.52 inch</td></tr><tr><td>Hỗ trợ thẻ tối đa</td><td>256GB</td></tr></tbody></table></div> ',1,2),(13,'Quan Jogger Nam',150000,'xxx',' <div><b>MÔ TẢ SẢN PHẨM:</b><ul><li>Tên sản phẩm: Quần Thể Thao Jogger Nam 5S (5 Màu), Chất Vải Gió Cao Cấp, Siêu Nhẹ, Chống Nhăn, Giữ Ấm Tốt (QGD21014)</li><li> Chất liệu: 95% polyester, 5% spandex</li><li>Màu sắc: Xanh cổ vịt, ghi tối, đen, ghi sáng, tím than tối</li><li>Phom dáng:Slimfit hơi ôm</li> <li>Size: S-M-L-XL-2XL</li><li>Xuất xứ: Việt Nam</li></ul></div> ',1,3),(14,'Quan Kaki Nam',250000,'xxx','<div><b>MÔ TẢ SẢN PHẨM:</b><ul><li>Chỉ cần phối với1 chiếc áo thun hoặc sơ mi , cũng làm nên 1 restock cực chất này</li><li>Quần kaki baggy basic pants quốc dân - ai chưa có nên tậu 1 em nhé</li><li>Đi đâu cũng đẹp , phối đồ gì cũng năng động</li><li>Chất liệu : kaki dày dặn , Đảm bảo chất liệu kaki ( không phải vải dù )</li><li>Form : lên form cực chuẩn , có 4 size S M L xl</li><li>Lưng thun dây rút, không kén dáng, che mọi khuyết điểm đôi chân</li><li>Màu : be,nâu. đen. ghi</li><li>Phù hợp mọi đối tương, phối đồ cực yêu , kết hợp với áo thun hay áo sơ mi kèm sneaker cực chất</li><li>Phù hợp mọi môi trường, đi chơi, đi học</li></ul></div>',1,3),(15,'Ao giu nhiet nu',200000,'xxx','<b>MÔ TẢ SẢN PHẨM:</b><ul><li>Tên sản phẩm: Áo giữ nhiệt nữ, Chất Vải Cao Cấp, Siêu Nhẹ, Chống Nhăn, Giữ Ấm Tốt</li><li> Chất liệu: 95% polyester, 5% spandex</li><li>Phom dáng:Slimfit hơi ôm</li><li>Size: S-M-L-XL-2XL</li><li>Xuất xứ: Việt Nam</li></ul>',1,3),(16,'Ao Thun Nam Polo',220000,'xxx','<div><b>MÔ TẢ SẢN PHẨM:</b><ul><li><strong>Áo thun nam cổ bẻ thời trang&nbsp;</strong>thiết kế cổ bẻ, tay ngắn, mang đến phong cách khỏe khoắn, năng động</li><li>Màu trơn đơn giản, tinh tế cùng với form áo rộng rãi, thoải mái giúp tôn được nét mạnh mẽ, nam tính</li><li>Áo thun có nhiều màu sắc khác nhau</li><li>Chất liệu thun cá sấu mềm mại, thấm hút mồ hôi, mang lại cảm giác thoải mái khi mặc</li><li>Bạn có thể chọn kết hợp với quần jeans, đồng hồ thể thao và giày lười để tạo nên một set đồ hiện đại hoặc nhiều trang phục thời trang khác</li></ul></div>',1,3),(17,'Ao so mi dai tay',170000,'xxx','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li><strong>Áo sơ mi dài tay&nbsp;</strong>thiết kế cổ bẻ, tay dài, mang đến phong cách trẻ trung, lịch lãm</li><li>Màu trơn đơn giản, tinh tế cùng với form áo rộng rãi, thoải mái giúp tôn được nét mạnh mẽ, nam tính</li<li>Chất liệu mềm mại, không nhăn, mang lại cảm giác thoải mái khi mặc</li><li>Bạn có thể chọn kết hợp với quần jeans, đồng hồ thể thao và giày lười để tạo nên một set đồ hiện đại hoặc nhiều trang phục thời trang khác</li></ul></div>',1,3),(18,'Giay Sneaker Nam',480000,'xxx','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li><strong>Giày Sneaker Nam &nbsp;</strong>Thiết kế trẻ trung, năng động</li> <li>Chất liệu da cao cấp, nam tính</li> <li>Chất liệu đế: cao su</li><li>Bạn có thể chọn kết hợp với quần jeans, đồng hồ thể thao để tạo nên một set đồ hiện đại hoặc nhiều trang phục thời trang khác</li></ul></div>',1,4),(19,'Giay The Thao Nam',210000,'xxx','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li><strong>Giày Thể thao Nam Bitis Hunter &nbsp;</strong>Form dáng cổ cao</li> <li>Lót đế trong chất liệu EVA, ép khuôn 3D, thâm hút mạnh</li> <li>Chất liệu đế: cao su R.E siêu bền, siêu nhẹ, đàn hồi tốt</li></ul></div>',1,4),(20,'Giay Da Nam Cong so',320000,'xxx','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li><strong>Giày Da công sở nam &nbsp;</strong>Thiết kế sang trọng lịch lãm</li> <li>Chất liệu da cao cấp, nam tính</li> <li>Form giày ôm chân, hợp nhiều lứa tuổi</li><li>Đủ size từ 38-43</li></ul></div>',1,4),(21,'Giay Sneaker Nu Trang',310000,'xxx','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li><strong>Giày Sneaker Nữ &nbsp;</strong>Kiểu dáng sang trọng, nhẹ nhàng</li> <li>Đế cao su nhẹ, êm ái cho người dùng</li> <li>Form giày ôm chân, hợp nhiều lứa tuổi</li><li>Đủ size từ 35-40</li></ul></div>',1,4),(22,'Giay Oxford Nu ',310000,'xxx','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li><strong>Giày Oxford Nữ &nbsp;</strong>Thiết kế lịch lãm, nữ tính</li> <li>Chất liệu da cao cấp, họa tiết tinh tế</li> <li>Form giày ôm chân, hợp nhiều lứa tuổi</li><li>Đủ size từ 35-39</li></ul></div>',1,4),(23,' Xe dap the thao BC66',10000,'img','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li> Khối lượng 24kg</li> <li>Khung xe: Thép chống gỉ, sơn tĩnh điện</li> <li>Xuất xứ: Trung Quốc</li><li>Thuong hieu: Longstyle</li> <li>Màu sắc: trắng, ghi xám, đen,...</li> <li>Phù hợp cho nhân viên văn phòng, phòng tập,...</li> </ul></div>',1,5),(24,' May tap tang chieu cao',1000000,'img','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li> Khối lượng 24kg</li> <li>Khung: Thép chống gỉ, sơn tĩnh điện</li> <li>Đệm chân, tay cầm: cao su, da bọc</li> <li>Xuất xứ: Việt Nam</li><li>Thuong hieu: Longstyle</li> <li>Màu sắc: trắng, ghi xám, đen,...</li> <li>Phù hợp cho mọi lứa tuổi.</li> </ul></div> ',1,5),(25,' Xe dap the thao BC66',100000,'img','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li> Khối lượng 24kg</li> <li>Khung xe: Thép chống gỉ, sơn tĩnh điện</li> <li>Xuất xứ: Trung Quốc</li><li>Thuong hieu: Longstyle</li> <li>Màu sắc: trắng, ghi xám, đen,...</li> <li>Phù hợp cho nhân viên văn phòng, phòng tập,...</li> </ul></div> ',1,5),(26,' Tham tap putting',100000,'img','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li> Kích thước: 5 x 1 m </li> <li>Đi kèm: 1 gậy + 1 bóng</li> <li>Xuất xứ: US</li><li>Thuong hieu:Boston</li>  <li>Phù hợp cho hoạt động trong nhà, ngoài trời,...</li> </ul></div> ',1,5),(27,' Vot tennis',1200000,'img','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li> Khối lượng 3kg</li> <li>Chất liệu: nhựa tổng hợp</li> <li>Xuất xứ: Trung Quốc</li><li>Thuong hieu: Addidas</li> <li>Màu sắc: trắng, ghi xám, đen,...</li> <li>Tặng kèm: bộ quấn tay cầm</li> </ul></div> ',1,5),(28,' Thuc pham bo sung Optimal Gold',1300000,'img','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li> Khối lượng 1kg</li>  <li>Xuất xứ: USA</li><li>Thuong hieu: Nutrifood</li> <li>Freeship: TP.HCM, Hà Nội,...</li> <li>Sử dụng trước và sau buổi tập</li> </ul></div> ',1,5),(29,' Sua Tang Co Whey Protein',1500000,'img','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li> Khối lượng 1kg</li>  <li>Xuất xứ: USA</li><li>Thuong hieu: Nutrifood</li> <li>Freeship: TP.HCM, Hà Nội,...</li> <li>Sử dụng trước và sau buổi tập</li> <li>Dành cho mọi đối tượng</li> </ul></div> ',1,5),(30,' Thuc pham ho tro BCC',1600000,'img','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li> Khối lượng 1.5kg</li>  <li>Xuất xứ: USA</li><li> Thuong hieu: Golden Standard</li>  <li>Sử dụng trước và sau buổi tập</li> <li>Tặng kèm: 1 bình giữ nhiệt 1.5l</li> </ul></div> ',1,5),(31,' Sua Tang Co Organic',1600000,'img','<div><b>THÔNG TIN SẢN PHẨM:</b><ul><li> Khối lượng 2kg</li>  <li>Xuất xứ: USA</li><li>Thuong hieu: True Recover</li>  <li>Sử dụng trước và sau buổi tập</li> <li>Dành cho mọi đối tượng</li> </ul></div> ',1,5);
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
  PRIMARY KEY (`RateB_ID`),
  KEY `Bidder` (`Bidder`),
  KEY `Pro_ID` (`Pro_ID`),
  CONSTRAINT `rates_ibfk_1` FOREIGN KEY (`Bidder`) REFERENCES `users` (`User_ID`),
  CONSTRAINT `rates_ibfk_2` FOREIGN KEY (`Pro_ID`) REFERENCES `products` (`Pro_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Duc','Duc@gmail.com','123',1,'1','2021-12-18','2021-12-22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

