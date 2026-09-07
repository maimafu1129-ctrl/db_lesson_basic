-- MySQL dump 10.13  Distrib 8.0.46, for macos14.8 (x86_64)
--
-- Host: localhost    Database: db_lesson
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'営業','2026-09-07 09:45:10','2026-09-07 09:45:10'),(2,'開発','2026-09-07 09:45:10','2026-09-07 09:45:10'),(3,'経理','2026-09-07 09:45:10','2026-09-07 09:45:10'),(4,'人事','2026-09-07 09:45:10','2026-09-07 09:45:10'),(5,'情報システム','2026-09-07 09:45:10','2026-09-07 09:45:10');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people` (
  `person_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `department_id` int unsigned DEFAULT NULL,
  `age` tinyint unsigned DEFAULT NULL,
  `gender` tinyint DEFAULT NULL COMMENT '1が男、2が女',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'鈴木たかし','suzuki@gizumo.jp',1,20,1,'2026-09-04 08:54:29','2026-09-07 13:17:06'),(2,'田中ゆうこ','tanaka@gizumo.jp',1,25,2,'2026-09-04 08:54:29','2026-09-07 13:21:33'),(3,'福田だいすけ','fukuda@gizumo.jp',4,42,1,'2026-09-04 08:54:29','2026-09-07 13:23:02'),(4,'豊島はなこ','toyoshima@gizumo.jp',2,34,2,'2026-09-04 08:54:29','2026-09-07 13:09:28'),(6,'不思議沢みちこ','hushigi@gizumo.jp',3,35,NULL,'2026-09-04 08:54:29','2026-09-07 13:22:48'),(7,'山田花子','yamada@gizumo.jp',2,28,2,'2026-09-05 14:22:50','2026-09-07 13:22:26'),(8,'佐藤健一','sato@gizumo.jp',5,35,1,'2026-09-05 14:22:50','2026-09-07 13:25:47'),(9,'高橋美咲','takahashi@gizumo.jp',2,24,2,'2026-09-05 14:22:50','2026-09-07 13:22:32'),(10,'伊藤直樹','ito@gizumo.jp',2,42,1,'2026-09-05 14:22:50','2026-09-07 13:26:04'),(12,'早坂てつお','hayasaka@gizumo.co.jp',1,61,1,'2026-09-06 11:22:34','2026-09-07 13:21:41');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `report_id` int unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int unsigned NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,1,'本日は午前中に商品データの確認を行いました。午後は入力作業を進めました。','2026-09-06 07:32:31','2026-09-06 07:32:31'),(2,2,'本日はメールの確認と資料の整理を行いました。予定していた作業を完了しました','2026-09-06 07:32:31','2026-09-06 07:32:31'),(3,3,'本日はデータの更新作業を行いました。入力内容に間違いがないか確認しました。','2026-09-06 07:32:31','2026-09-06 07:32:31'),(4,4,'本日はチームで作業内容の確認を行いました。その後、担当している作業を進めました。','2026-09-06 07:32:31','2026-09-06 07:32:31'),(5,6,'本日はデータベースの確認を行いました。いくつかのデータを修正しました。','2026-09-06 07:32:31','2026-09-06 07:32:31'),(6,7,'本日は午前中に資料を作成し、午後は内容の確認と修正を行いました。','2026-09-06 07:32:31','2026-09-06 07:32:31'),(7,8,'本日は新しい作業の手順を確認しました。実際に作業を行い、基本的な流れを理解しました。','2026-09-06 07:32:31','2026-09-06 07:32:31'),(8,9,'本日は登録されている情報を確認しました。不要なデータを整理して作業環境を整えました。','2026-09-06 07:32:31','2026-09-06 07:32:31'),(9,10,'本日は担当している作業を予定通り進めました。最後に今日の作業内容を確認しました。','2026-09-06 07:32:31','2026-09-06 07:32:31'),(10,11,'本日はシステムの動作確認を行いました。登録されているデータを確認し、問題がないことを確認しました。','2026-09-06 07:42:10','2026-09-06 07:42:10');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-07 23:22:59
