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
  `id` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Russia'),(2,'SouthKorea'),(3,'Bangladesh');
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
  `country_name` varchar(100) NOT NULL,
  `letters` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_letters`
--

LOCK TABLES `language_letters` WRITE;
/*!40000 ALTER TABLE `language_letters` DISABLE KEYS */;
INSERT INTO `language_letters` VALUES (1,'Russia','А → A'),(2,'Russia','Б → B'),(3,'Russia','В → V'),(4,'Russia','Г → G'),(5,'Russia','Д → D'),(6,'Russia','Е → E'),(7,'Russia','Ё → Yo'),(8,'Russia','Ж → Zh'),(9,'Russia','З → Z'),(10,'Russia','И → I'),(11,'Russia','Й → Y'),(12,'Russia','К → K'),(13,'Russia','Л → L'),(14,'Russia','М → M'),(15,'Russia','Н → N'),(16,'Russia','О → O'),(17,'Russia','П → P'),(18,'Russia','Р → R'),(19,'Russia','С → S'),(20,'Russia','Т → T'),(21,'Russia','У → U'),(22,'Russia','Ф → F'),(23,'Russia','Х → Kh'),(24,'Russia','Ц → Ts'),(25,'Russia','Ч → Ch'),(26,'Russia','Ш → Sh'),(27,'Russia','Щ → Shch'),(28,'Russia','Ы → Y'),(29,'Russia','Э → E'),(30,'Russia','Ю → Yu'),(31,'Russia','Я → Ya'),(32,'Russia','Ъ → (Hard sign)'),(33,'Russia','Ь → (Soft sign)'),(34,'SouthKorea','ㅏ → A'),(35,'SouthKorea','ㅑ → Ya'),(36,'SouthKorea','ㅓ → Eo'),(37,'SouthKorea','ㅕ → Yeo'),(38,'SouthKorea','ㅗ → O'),(39,'SouthKorea','ㅛ → Yo'),(40,'SouthKorea','ㅜ → U'),(41,'SouthKorea','ㅠ → Yu'),(42,'SouthKorea','ㅡ → Eu'),(43,'SouthKorea','ㅣ → I'),(44,'SouthKorea','ㅐ → Ae'),(45,'SouthKorea','ㅒ → Yae'),(46,'SouthKorea','ㅔ → E'),(47,'SouthKorea','ㅖ → Ye'),(48,'SouthKorea','ㅘ → Wa'),(49,'SouthKorea','ㅙ → Wae'),(50,'SouthKorea','ㅚ → Oe'),(51,'SouthKorea','ㅝ → Weo'),(52,'SouthKorea','ㅞ → We'),(53,'SouthKorea','ㅟ → Wi'),(54,'SouthKorea','ㅢ → Ui'),(55,'SouthKorea','ㄱ → G/K'),(56,'SouthKorea','ㅋ → K'),(57,'SouthKorea','ㄲ → Kk'),(58,'SouthKorea','ㄴ → N'),(59,'SouthKorea','ㄷ → D/T'),(60,'SouthKorea','ㅌ → T'),(61,'SouthKorea','ㄸ → Tt'),(62,'SouthKorea','ㄹ → R/L'),(63,'SouthKorea','ㅁ → M'),(64,'SouthKorea','ㅂ → B/P'),(65,'SouthKorea','ㅍ → P'),(66,'SouthKorea','ㅃ → Pp'),(67,'SouthKorea','ㅅ → S'),(68,'SouthKorea','ㅆ → Ss'),(69,'SouthKorea','ㅇ → Ng'),(70,'SouthKorea','ㅈ → J'),(71,'SouthKorea','ㅉ → Jj'),(72,'SouthKorea','ㅊ → Ch'),(73,'SouthKorea','ㅎ → H'),(74,'Bangladesh','অ → A'),(75,'Bangladesh','আ → A'),(76,'Bangladesh','ই → I'),(77,'Bangladesh','ঈ → I'),(78,'Bangladesh','উ → U'),(79,'Bangladesh','ঊ → U'),(80,'Bangladesh','ঋ → Ri'),(81,'Bangladesh','এ → E'),(82,'Bangladesh','ঐ → Oi'),(83,'Bangladesh','ও → O'),(84,'Bangladesh','ঔ → Ou'),(85,'Bangladesh','ক → K'),(86,'Bangladesh','খ → Kh'),(87,'Bangladesh','গ → G'),(88,'Bangladesh','ঘ → Gh'),(89,'Bangladesh','ঙ → Ng'),(90,'Bangladesh','চ → Ch'),(91,'Bangladesh','ছ → Chh'),(92,'Bangladesh','জ → J'),(93,'Bangladesh','ঝ → Jh'),(94,'Bangladesh','ঞ → Ñ'),(95,'Bangladesh','ট → T'),(96,'Bangladesh','ঠ → Th'),(97,'Bangladesh','ড → D'),(98,'Bangladesh','ঢ → Dh'),(99,'Bangladesh','ণ → N'),(100,'Bangladesh','ত → T'),(101,'Bangladesh','থ → Th'),(102,'Bangladesh','দ → D'),(103,'Bangladesh','ধ → Dh'),(104,'Bangladesh','ন → N'),(105,'Bangladesh','প → P'),(106,'Bangladesh','ফ → Ph'),(107,'Bangladesh','ব → B'),(108,'Bangladesh','ভ → Bh'),(109,'Bangladesh','ম → M'),(110,'Bangladesh','য → Y'),(111,'Bangladesh','র → R'),(112,'Bangladesh','ল → L'),(113,'Bangladesh','শ → Sh'),(114,'Bangladesh','ষ → Sh'),(115,'Bangladesh','স → S'),(116,'Bangladesh','হ → H');
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
  `country_name` varchar(100) NOT NULL,
  `local_name` varchar(100) NOT NULL,
  `english_name` varchar(100) NOT NULL,
  `type` enum('region','city') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (1,'Russia','Москва','Moscow','city'),(2,'Russia','Санкт-Петербург','Saint Petersburg','city'),(3,'Russia','Республика Татарстан','Republic of Tatarstan','region'),(4,'Russia','Республика Башкортостан','Republic of Bashkortostan','region'),(5,'Russia','Краснодарский край','Krasnodar Krai','region'),(6,'Russia','Ростовская область','Rostov Oblast','region'),(7,'Russia','Волгоградская область','Volgograd Oblast','region'),(8,'Russia','Свердловская область','Sverdlovsk Oblast','region'),(9,'Russia','Челябинская область','Chelyabinsk Oblast','region'),(10,'Russia','Татарстан','Tatarstan','region'),(11,'Russia','Пермский край','Perm Krai','region'),(12,'Russia','Оренбургская область','Orenburg Oblast','region'),(13,'Russia','Кемеровская область','Kemerovo Oblast','region'),(14,'Russia','Ульяновская область','Ulyanovsk Oblast','region'),(15,'Russia','Самарская область','Samara Oblast','region'),(16,'Russia','Иркутская область','Irkutsk Oblast','region'),(17,'Russia','Тамбовская область','Tambov Oblast','region'),(18,'Russia','Рязанская область','Ryazan Oblast','region'),(19,'Russia','Мурманская область','Murmansk Oblast','region'),(20,'Russia','Калининградская область','Kaliningrad Oblast','region'),(21,'Russia','Вологодская область','Vologda Oblast','region'),(22,'Russia','Ленинградская область','Leningrad Oblast','region'),(23,'Russia','Ярославская область','Yaroslavl Oblast','region'),(24,'Russia','Костромская область','Kostroma Oblast','region'),(25,'Russia','Нижегородская область','Nizhny Novgorod Oblast','region'),(26,'Russia','Саратовская область','Saratov Oblast','region'),(27,'Russia','Тюменская область','Tyumen Oblast','region'),(28,'Russia','Архангельская область','Arkhangelsk Oblast','region'),(29,'Russia','Псковская область','Pskov Oblast','region'),(30,'Russia','Новосибирская область','Novosibirsk Oblast','region'),(31,'Russia','Московская область','Moscow Oblast','region'),(32,'Russia','Брянская область','Bryansk Oblast','region'),(33,'Russia','Омская область','Omsk Oblast','region'),(34,'Russia','Курская область','Kursk Oblast','region'),(35,'Russia','Смоленская область','Smolensk Oblast','region'),(36,'Russia','Тверская область','Tver Oblast','region'),(37,'Russia','Калужская область','Kaluga Oblast','region'),(38,'Russia','Воронежская область','Voronezh Oblast','region'),(39,'Russia','Белгородская область','Belgorod Oblast','region'),(40,'Russia','Костромская область','Kostroma Oblast','region'),(41,'Russia','Астраханская область','Astrakhan Oblast','region'),(42,'Russia','Республика Саха','Republic of Sakha','region'),(43,'Russia','Хабаровский край','Khabarovsk Krai','region'),(44,'Russia','Алтайский край','Altai Krai','region'),(45,'Russia','Ставропольский край','Stavropol Krai','region'),(46,'Russia','Вологодская область','Vologda Oblast','region'),(47,'Russia','Северная Осетия','North Ossetia','region'),(48,'Russia','Иркутская область','Irkutsk Oblast','region'),(49,'Russia','Чеченская Республика','Chechen Republic','region'),(50,'Russia','Дагестан','Dagestan','region'),(51,'Russia','Кабардино-Балкарская Республика','Kabardino-Balkar Republic','region'),(52,'Russia','Северная Осетия','North Ossetia','region'),(53,'Russia','Калмыкия','Kalmykia','region'),(54,'Russia','Тува','Tuva','region'),(55,'Russia','Марий Эл','Mari El','region'),(56,'Russia','Чувашская Республика','Chuvash Republic','region'),(57,'Russia','Адыгея','Adygea','region'),(58,'Russia','Карачаево-Черкесская Республика','Karachay-Cherkess Republic','region'),(59,'Russia','Республика Коми','Republic of Komi','region'),(60,'Russia','Башкортостан','Bashkortostan','region'),(61,'Russia','Республика Мордовия','Republic of Mordovia','region'),(62,'Russia','Удмуртская Республика','Udmurt Republic','region'),(63,'Russia','Республика Калмыкия','Republic of Kalmykia','region'),(64,'Russia','Республика Алтай','Republic of Altai','region'),(65,'Russia','Липецкая область','Lipetsk Oblast','region'),(66,'Russia','Томская область','Tomsk Oblast','region'),(67,'Russia','Новгородская область','Novgorod Oblast','region'),(68,'Russia','Курганская область','Kurgan Oblast','region'),(69,'Russia','Забайкальский край','Zabaykalsky Krai','region'),(70,'Russia','Еврейская автономная область','Jewish Autonomous Oblast','region'),(71,'Russia','Астраханская область','Astrakhan Oblast','region'),(72,'Russia','Амурская область','Amur Oblast','region'),(73,'Russia','Пензенская область','Penza Oblast','region'),(74,'Russia','Кемеровская область','Kemerovo Oblast','region'),(75,'Russia','Сахалинская область','Sakhalin Oblast','region'),(76,'Russia','Томская область','Tomsk Oblast','region'),(77,'Russia','Оренбургская область','Orenburg Oblast','region'),(78,'Russia','Тульская область','Tula Oblast','region'),(79,'Russia','Республика Хакасия','Republic of Khakassia','region'),(80,'Russia','Республика Чувашия','Chuvash Republic','region'),(81,'Russia','Республика Бурятия','Republic of Buryatia','region'),(82,'Russia','Республика Карелия','Republic of Karelia','region'),(83,'Russia','Республика Мордовия','Mordovia','region'),(84,'Russia','Республика Якутия','Yakutia','region'),(85,'Russia','Республика Калмыкия','Kalmykia','region'),(86,'SouthKorea','서울','Seoul','city'),(87,'SouthKorea','부산','Busan','city'),(88,'SouthKorea','대구','Daegu','city'),(89,'SouthKorea','광주','Gwangju','city'),(90,'SouthKorea','대전','Daejeon','city'),(91,'SouthKorea','울산','Ulsan','city'),(92,'SouthKorea','인천','Incheon','city'),(93,'SouthKorea','세종','Sejong','city'),(94,'SouthKorea','경기','Gyeonggi-do','region'),(95,'SouthKorea','강원','Gangwon-do','region'),(96,'SouthKorea','충남','Chungcheongnam-do','region'),(97,'SouthKorea','충북','Chungcheongbuk-do','region'),(98,'SouthKorea','전남','Jeollanam-do','region'),(99,'SouthKorea','전북','Jeollabuk-do','region'),(100,'SouthKorea','경남','Gyeongsangnam-do','region'),(101,'SouthKorea','경북','Gyeongsangbuk-do','region'),(102,'SouthKorea','제주','Jeju-do','region'),(103,'Bangladesh','ঢাকা','Dhaka','city'),(104,'Bangladesh','চট্টগ্রাম','Chattogram','city'),(105,'Bangladesh','খুলনা','Khulna','city'),(106,'Bangladesh','রাজশাহী','Rajshahi','city'),(107,'Bangladesh','সিলেট','Sylhet','city'),(108,'Bangladesh','বরিশাল','Barishal','city'),(109,'Bangladesh','রংপুর','Rangpur','city'),(110,'Bangladesh','কুমিল্লা','Cumilla','city'),(111,'Bangladesh','নারায়ণগঞ্জ','Narayanganj','city'),(112,'Bangladesh','বগুড়া','Bogra','city'),(113,'Bangladesh','ময়মনসিংহ','Mymensingh','city'),(114,'Bangladesh','গাজীপুর','Gazipur','city'),(115,'Bangladesh','টাঙ্গাইল','Tangail','city'),(116,'Bangladesh','ফরিদপুর','Faridpur','city'),(117,'Bangladesh','কুষ্টিয়া','Kushtia','city'),(118,'Bangladesh','যশোর','Jashore','city'),(119,'Bangladesh','নোয়াখালী','Noakhali','city'),(120,'Bangladesh','চাঁদপুর','Chandpur','city'),(121,'Bangladesh','কক্সবাজার','Cox\'s Bazar','city'),(122,'Bangladesh','ফেনী','Feni','city'),(123,'Bangladesh','লক্ষ্মীপুর','Lakshmipur','city'),(124,'Bangladesh','দিনাজপুর','Dinajpur','city'),(125,'Bangladesh','ঠাকুরগাঁও','Thakurgaon','city'),(126,'Bangladesh','পাবনা','Pabna','city'),(127,'Bangladesh','শরীয়তপুর','Shariatpur','city'),(128,'Bangladesh','গোপালগঞ্জ','Gopalganj','city'),(129,'Bangladesh','মাদারীপুর','Madaripur','city'),(130,'Bangladesh','সাতক্ষীরা','Satkhira','city'),(131,'Bangladesh','পিরোজপুর','Pirojpur','city'),(132,'Bangladesh','ঝালকাঠি','Jhalokathi','city'),(133,'Bangladesh','ভোলা','Bhola','city'),(134,'Bangladesh','বরগুনা','Barguna','city'),(135,'Bangladesh','নেত্রকোণা','Netrokona','city'),(136,'Bangladesh','সুনামগঞ্জ','Sunamganj','city'),(137,'Bangladesh','মৌলভীবাজার','Moulvibazar','city'),(138,'Bangladesh','হবিগঞ্জ','Habiganj','city'),(139,'Bangladesh','গাইবান্ধা','Gaibandha','city'),(140,'Bangladesh','কুড়িগ্রাম','Kurigram','city'),(141,'Bangladesh','নওগাঁ','Naogaon','city'),(142,'Bangladesh','জয়পুরহাট','Joypurhat','city'),(143,'Bangladesh','নাটোর','Natore','city'),(144,'Bangladesh','চুয়াডাঙ্গা','Chuadanga','city'),(145,'Bangladesh','মেহেরপুর','Meherpur','city'),(146,'Bangladesh','মাগুরা','Magura','city'),(147,'Bangladesh','ঝিনাইদহ','Jhenaidah','city'),(148,'Bangladesh','শেরপুর','Sherpur','city'),(149,'Bangladesh','বাগেরহাট','Bagerhat','city'),(150,'Bangladesh','বান্দরবান','Bandarban','city'),(151,'Bangladesh','খাগড়াছড়ি','Khagrachhari','city');
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

-- Dump completed on 2025-03-13 12:21:57
