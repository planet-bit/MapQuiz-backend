-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: mapquizdb
-- ------------------------------------------------------
-- Server version	8.4.4

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
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `country_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES ('bd','Bangladesh'),('kr','SouthKorea'),('ru','Russia');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_letters`
--

DROP TABLE IF EXISTS `language_letters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_letters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `letters` varchar(100) NOT NULL,
  `country_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_letters`
--

LOCK TABLES `language_letters` WRITE;
/*!40000 ALTER TABLE `language_letters` DISABLE KEYS */;
INSERT INTO `language_letters` VALUES (1,'А → A','ru'),(2,'Б → B','ru'),(3,'В → V','ru'),(4,'Г → G','ru'),(5,'Д → D','ru'),(6,'Е → E','ru'),(7,'Ё → Yo','ru'),(8,'Ж → Zh','ru'),(9,'З → Z','ru'),(10,'И → I','ru'),(11,'Й → Y','ru'),(12,'К → K','ru'),(13,'Л → L','ru'),(14,'М → M','ru'),(15,'Н → N','ru'),(16,'О → O','ru'),(17,'П → P','ru'),(18,'Р → R','ru'),(19,'С → S','ru'),(20,'Т → T','ru'),(21,'У → U','ru'),(22,'Ф → F','ru'),(23,'Х → Kh','ru'),(24,'Ц → Ts','ru'),(25,'Ч → Ch','ru'),(26,'Ш → Sh','ru'),(27,'Щ → Shch','ru'),(28,'Ы → Y','ru'),(29,'Э → E','ru'),(30,'Ю → Yu','ru'),(31,'Я → Ya','ru'),(32,'Ъ → (Hard sign)','ru'),(33,'Ь → (Soft sign)','ru'),(34,'ㅏ → A','kr'),(35,'ㅑ → Ya','kr'),(36,'ㅓ → Eo','kr'),(37,'ㅕ → Yeo','kr'),(38,'ㅗ → O','kr'),(39,'ㅛ → Yo','kr'),(40,'ㅜ → U','kr'),(41,'ㅠ → Yu','kr'),(42,'ㅡ → Eu','kr'),(43,'ㅣ → I','kr'),(44,'ㅐ → Ae','kr'),(45,'ㅒ → Yae','kr'),(46,'ㅔ → E','kr'),(47,'ㅖ → Ye','kr'),(48,'ㅘ → Wa','kr'),(49,'ㅙ → Wae','kr'),(50,'ㅚ → Oe','kr'),(51,'ㅝ → Weo','kr'),(52,'ㅞ → We','kr'),(53,'ㅟ → Wi','kr'),(54,'ㅢ → Ui','kr'),(55,'ㄱ → G/K','kr'),(56,'ㅋ → K','kr'),(57,'ㄲ → Kk','kr'),(58,'ㄴ → N','kr'),(59,'ㄷ → D/T','kr'),(60,'ㅌ → T','kr'),(61,'ㄸ → Tt','kr'),(62,'ㄹ → R/L','kr'),(63,'ㅁ → M','kr'),(64,'ㅂ → B/P','kr'),(65,'ㅍ → P','kr'),(66,'ㅃ → Pp','kr'),(67,'ㅅ → S','kr'),(68,'ㅆ → Ss','kr'),(69,'ㅇ → Ng','kr'),(70,'ㅈ → J','kr'),(71,'ㅉ → Jj','kr'),(72,'ㅊ → Ch','kr'),(73,'ㅎ → H','kr'),(74,'অ → A','bd'),(75,'আ → A','bd'),(76,'ই → I','bd'),(77,'ঈ → I','bd'),(78,'উ → U','bd'),(79,'ঊ → U','bd'),(80,'ঋ → Ri','bd'),(81,'এ → E','bd'),(82,'ঐ → Oi','bd'),(83,'ও → O','bd'),(84,'ঔ → Ou','bd'),(85,'ক → K','bd'),(86,'খ → Kh','bd'),(87,'গ → G','bd'),(88,'ঘ → Gh','bd'),(89,'ঙ → Ng','bd'),(90,'চ → Ch','bd'),(91,'ছ → Chh','bd'),(92,'জ → J','bd'),(93,'ঝ → Jh','bd'),(94,'ঞ → Ñ','bd'),(95,'ট → T','bd'),(96,'ঠ → Th','bd'),(97,'ড → D','bd'),(98,'ঢ → Dh','bd'),(99,'ণ → N','bd'),(100,'ত → T','bd'),(101,'থ → Th','bd'),(102,'দ → D','bd'),(103,'ধ → Dh','bd'),(104,'ন → N','bd'),(105,'প → P','bd'),(106,'ফ → Ph','bd'),(107,'ব → B','bd'),(108,'ভ → Bh','bd'),(109,'ম → M','bd'),(110,'য → Y','bd'),(111,'র → R','bd'),(112,'ল → L','bd'),(113,'শ → Sh','bd'),(114,'ষ → Sh','bd'),(115,'স → S','bd'),(116,'হ → H','bd');
/*!40000 ALTER TABLE `language_letters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places` (
  `id` int NOT NULL AUTO_INCREMENT,
  `local_name` varchar(100) NOT NULL,
  `english_name` varchar(100) NOT NULL,
  `country_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (1,'Москва','Moscow','ru'),(2,'Санкт-Петербург','Saint Petersburg','ru'),(3,'Республика Татарстан','Republic of Tatarstan','ru'),(4,'Республика Башкортостан','Republic of Bashkortostan','ru'),(5,'Краснодарский край','Krasnodar Krai','ru'),(6,'Ростовская область','Rostov Oblast','ru'),(7,'Волгоградская область','Volgograd Oblast','ru'),(8,'Свердловская область','Sverdlovsk Oblast','ru'),(9,'Челябинская область','Chelyabinsk Oblast','ru'),(10,'Татарстан','Tatarstan','ru'),(11,'Пермский край','Perm Krai','ru'),(12,'Оренбургская область','Orenburg Oblast','ru'),(13,'Кемеровская область','Kemerovo Oblast','ru'),(14,'Ульяновская область','Ulyanovsk Oblast','ru'),(15,'Самарская область','Samara Oblast','ru'),(16,'Иркутская область','Irkutsk Oblast','ru'),(17,'Тамбовская область','Tambov Oblast','ru'),(18,'Рязанская область','Ryazan Oblast','ru'),(19,'Мурманская область','Murmansk Oblast','ru'),(20,'Калининградская область','Kaliningrad Oblast','ru'),(21,'Вологодская область','Vologda Oblast','ru'),(22,'Ленинградская область','Leningrad Oblast','ru'),(23,'Ярославская область','Yaroslavl Oblast','ru'),(24,'Костромская область','Kostroma Oblast','ru'),(25,'Нижегородская область','Nizhny Novgorod Oblast','ru'),(26,'Саратовская область','Saratov Oblast','ru'),(27,'Тюменская область','Tyumen Oblast','ru'),(28,'Архангельская область','Arkhangelsk Oblast','ru'),(29,'Псковская область','Pskov Oblast','ru'),(30,'Новосибирская область','Novosibirsk Oblast','ru'),(31,'Московская область','Moscow Oblast','ru'),(32,'Брянская область','Bryansk Oblast','ru'),(33,'Омская область','Omsk Oblast','ru'),(34,'Курская область','Kursk Oblast','ru'),(35,'Смоленская область','Smolensk Oblast','ru'),(36,'Тверская область','Tver Oblast','ru'),(37,'Калужская область','Kaluga Oblast','ru'),(38,'Воронежская область','Voronezh Oblast','ru'),(39,'Белгородская область','Belgorod Oblast','ru'),(40,'Костромская область','Kostroma Oblast','ru'),(41,'Астраханская область','Astrakhan Oblast','ru'),(42,'Республика Саха','Republic of Sakha','ru'),(43,'Хабаровский край','Khabarovsk Krai','ru'),(44,'Алтайский край','Altai Krai','ru'),(45,'Ставропольский край','Stavropol Krai','ru'),(46,'Вологодская область','Vologda Oblast','ru'),(47,'Северная Осетия','North Ossetia','ru'),(48,'Иркутская область','Irkutsk Oblast','ru'),(49,'Чеченская Республика','Chechen Republic','ru'),(50,'Дагестан','Dagestan','ru'),(51,'Кабардино-Балкарская Республика','Kabardino-Balkar Republic','ru'),(52,'Северная Осетия','North Ossetia','ru'),(53,'Калмыкия','Kalmykia','ru'),(54,'Тува','Tuva','ru'),(55,'Марий Эл','Mari El','ru'),(56,'Чувашская Республика','Chuvash Republic','ru'),(57,'Адыгея','Adygea','ru'),(58,'Карачаево-Черкесская Республика','Karachay-Cherkess Republic','ru'),(59,'Республика Коми','Republic of Komi','ru'),(60,'Башкортостан','Bashkortostan','ru'),(61,'Республика Мордовия','Republic of Mordovia','ru'),(62,'Удмуртская Республика','Udmurt Republic','ru'),(63,'Республика Калмыкия','Republic of Kalmykia','ru'),(64,'Республика Алтай','Republic of Altai','ru'),(65,'Липецкая область','Lipetsk Oblast','ru'),(66,'Томская область','Tomsk Oblast','ru'),(67,'Новгородская область','Novgorod Oblast','ru'),(68,'Курганская область','Kurgan Oblast','ru'),(69,'Забайкальский край','Zabaykalsky Krai','ru'),(70,'Еврейская автономная область','Jewish Autonomous Oblast','ru'),(71,'Астраханская область','Astrakhan Oblast','ru'),(72,'Амурская область','Amur Oblast','ru'),(73,'Пензенская область','Penza Oblast','ru'),(74,'Кемеровская область','Kemerovo Oblast','ru'),(75,'Сахалинская область','Sakhalin Oblast','ru'),(76,'Томская область','Tomsk Oblast','ru'),(77,'Оренбургская область','Orenburg Oblast','ru'),(78,'Тульская область','Tula Oblast','ru'),(79,'Республика Хакасия','Republic of Khakassia','ru'),(80,'Республика Чувашия','Chuvash Republic','ru'),(81,'Республика Бурятия','Republic of Buryatia','ru'),(82,'Республика Карелия','Republic of Karelia','ru'),(83,'Республика Мордовия','Mordovia','ru'),(84,'Республика Якутия','Yakutia','ru'),(85,'Республика Калмыкия','Kalmykia','ru'),(86,'서울','Seoul','kr'),(87,'부산','Busan','kr'),(88,'대구','Daegu','kr'),(89,'광주','Gwangju','kr'),(90,'대전','Daejeon','kr'),(91,'울산','Ulsan','kr'),(92,'인천','Incheon','kr'),(93,'세종','Sejong','kr'),(94,'경기','Gyeonggi-do','kr'),(95,'강원','Gangwon-do','kr'),(96,'충남','Chungcheongnam-do','kr'),(97,'충북','Chungcheongbuk-do','kr'),(98,'전남','Jeollanam-do','kr'),(99,'전북','Jeollabuk-do','kr'),(100,'경남','Gyeongsangnam-do','kr'),(101,'경북','Gyeongsangbuk-do','kr'),(102,'제주','Jeju-do','kr'),(103,'ঢাকা','Dhaka','bd'),(104,'চট্টগ্রাম','Chattogram','bd'),(105,'খুলনা','Khulna','bd'),(106,'রাজশাহী','Rajshahi','bd'),(107,'সিলেট','Sylhet','bd'),(108,'বরিশাল','Barishal','bd'),(109,'রংপুর','Rangpur','bd'),(110,'কুমিল্লা','Cumilla','bd'),(111,'নারায়ণগঞ্জ','Narayanganj','bd'),(112,'বগুড়া','Bogra','bd'),(113,'ময়মনসিংহ','Mymensingh','bd'),(114,'গাজীপুর','Gazipur','bd'),(115,'টাঙ্গাইল','Tangail','bd'),(116,'ফরিদপুর','Faridpur','bd'),(117,'কুষ্টিয়া','Kushtia','bd'),(118,'যশোর','Jashore','bd'),(119,'নোয়াখালী','Noakhali','bd'),(120,'চাঁদপুর','Chandpur','bd'),(121,'কক্সবাজার','Cox\'s Bazar','bd'),(122,'ফেনী','Feni','bd'),(123,'লক্ষ্মীপুর','Lakshmipur','bd'),(124,'দিনাজপুর','Dinajpur','bd'),(125,'ঠাকুরগাঁও','Thakurgaon','bd'),(126,'পাবনা','Pabna','bd'),(127,'শরীয়তপুর','Shariatpur','bd'),(128,'গোপালগঞ্জ','Gopalganj','bd'),(129,'মাদারীপুর','Madaripur','bd'),(130,'সাতক্ষীরা','Satkhira','bd'),(131,'পিরোজপুর','Pirojpur','bd'),(132,'ঝালকাঠি','Jhalokathi','bd'),(133,'ভোলা','Bhola','bd'),(134,'বরগুনা','Barguna','bd'),(135,'নেত্রকোণা','Netrokona','bd'),(136,'সুনামগঞ্জ','Sunamganj','bd'),(137,'মৌলভীবাজার','Moulvibazar','bd'),(138,'হবিগঞ্জ','Habiganj','bd'),(139,'গাইবান্ধা','Gaibandha','bd'),(140,'কুড়িগ্রাম','Kurigram','bd'),(141,'নওগাঁ','Naogaon','bd'),(142,'জয়পুরহাট','Joypurhat','bd'),(143,'নাটোর','Natore','bd'),(144,'চুয়াডাঙ্গা','Chuadanga','bd'),(145,'মেহেরপুর','Meherpur','bd'),(146,'মাগুরা','Magura','bd'),(147,'ঝিনাইদহ','Jhenaidah','bd'),(148,'শেরপুর','Sherpur','bd'),(149,'বাগেরহাট','Bagerhat','bd'),(150,'বান্দরবান','Bandarban','bd'),(151,'খাগড়াছড়ি','Khagrachhari','bd');
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mapquizdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-15  5:26:01
