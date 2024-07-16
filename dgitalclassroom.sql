-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: arvi22_digital
-- ------------------------------------------------------
-- Server version	8.0.28

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
create database arvi22_digital;
use arvi22_digital;
DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `msg` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (2,'Bhavesh Roy','ytdgdg96@gmail.com','practical submission','Hello sir when submit practical ?.');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_attendance`
--

DROP TABLE IF EXISTS `fac_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fac_attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `faculty_id` int NOT NULL,
  `date` date NOT NULL,
  `verify` varchar(45) DEFAULT 'Disapproved',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_attendance`
--

LOCK TABLES `fac_attendance` WRITE;
/*!40000 ALTER TABLE `fac_attendance` DISABLE KEYS */;
INSERT INTO `fac_attendance` VALUES (1,1,'2022-04-01','Disapproved'),(2,1,'2022-04-02','Disapproved'),(3,5,'2022-05-01','Disapproved'),(4,5,'2022-05-01','Disapproved'),(5,5,'2022-05-01','Disapproved'),(6,5,'2022-05-31','Disapproved'),(7,5,'2022-05-30','Disapproved'),(8,5,'2022-05-30','Disapproved'),(9,5,'2022-05-29','Disapproved'),(10,5,'2022-05-28','Disapproved'),(11,5,'2022-05-28','Disapproved'),(12,5,'2022-05-27','Disapproved'),(13,5,'2022-05-02','Disapproved'),(14,5,'2022-05-03','Disapproved'),(15,5,'2022-05-04','Disapproved'),(16,10,'2022-05-01','Disapproved'),(17,10,'2022-05-02','Disapproved'),(18,10,'2022-05-28','Approved'),(19,10,'2022-05-27','Disapproved'),(20,10,'2022-05-03','Disapproved'),(21,10,'2022-05-04','Approved'),(22,10,'2022-05-05','Disapproved'),(23,10,'2022-05-06','Disapproved'),(24,10,'2022-05-07','Disapproved');
/*!40000 ALTER TABLE `fac_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `facultyid` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `branch` varchar(200) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `qualification` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'vijay','1','Wardha','vijay@gmail.com','CO','8057552586','Math','Male','Vijay@123',1,'BE'),(2,'ramesh','2','arvi','ramesh@gmail.com','CO','5566858658','java','Male','Ramesh@123',1,'BE'),(6,'H.N.Ranotkar','6','Arvi','hnranotkar@gmail.com','CO','9768657588','NIS','Male','Ranotkar@123',1,'PHD'),(7,'M.P.Ganorkar','7','Arvi','mpganorkar@gmail.com','CH','7866391791','FCH','Male','Ganorkar@123',1,'ME'),(8,'P.U.Malve','8','Arvi','pumalve@gmail.com','CO','8586558887','MAD','Male','Malve@123',1,'PHD'),(9,'G.R.Savant','9','Arvi','grsavant@gmail.com','CO','7387462348','PWP','Male','Savant@123',1,'ME'),(10,'M.K. Tatte','3','Arvi','mktatte@gmail.com','CO','5645781256','EDE','Male','Tatte@123',1,'PHD'),(11,'M.A.Ali','4','Arvi','maali@gmail.com','CO','4654644245','MAN','Male','Ali@123',1,'PHD');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty_files`
--

DROP TABLE IF EXISTS `faculty_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `year` int NOT NULL,
  `semester` int NOT NULL,
  `subject` varchar(100) NOT NULL,
  `faculty_id` int NOT NULL,
  `branch` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_files`
--

LOCK TABLES `faculty_files` WRITE;
/*!40000 ALTER TABLE `faculty_files` DISABLE KEYS */;
INSERT INTO `faculty_files` VALUES (3,'Role and Commissioner Creation.webm','Akshay Bahadarpure',2,1,'asdasd',1,'CO'),(4,'22032 - Entrepreneurship Development  syllabus.pdf','EDE_syllabus',3,6,'EDE',5,'CO'),(5,'EDE_Practical_1_TO_12.pdf','chapter-1',3,6,'EDE',10,'CO');
/*!40000 ALTER TABLE `faculty_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty_videos`
--

DROP TABLE IF EXISTS `faculty_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty_videos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `year` int NOT NULL,
  `semester` int NOT NULL,
  `subject` varchar(100) NOT NULL,
  `faculty_id` int NOT NULL,
  `branch` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_videos`
--

LOCK TABLES `faculty_videos` WRITE;
/*!40000 ALTER TABLE `faculty_videos` DISABLE KEYS */;
INSERT INTO `faculty_videos` VALUES (3,'Role and Commissioner Creation.webm','Akshay Bahadarpure',2,1,'asdasd',1,'CO'),(4,'What is Entrepreneurship_ definition, characteristics and entrepreneurial process.mp4','Ch_1',3,6,'What is Entrepreneurship?',5,'CO');
/*!40000 ALTER TABLE `faculty_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (3,'Online exam Update','2022-05-24','All Students Should collect their respective login ID & Password tommrow for Online Test Exam'),(4,'Exam Update ','2022-05-22','All Students check their phone or laptop with camera for internet connectivity by visiting their respective classroom(shown in Class TT) for online Test Exam held on 25th and 26th May 2022.'),(5,'Expert lecture','2022-05-13','Expert lecture on  \" personality developement and interview technique \" by Mr Sohal Khan,Director Pathik Consultancy , Amaravati '),(6,'Expert lecture on career career counselling','2022-05-05','Expert lecture on career career counselling will be conducted tomorrow');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (7,'Practical Submission','Hello Student Upload Practical '),(8,'Microproject Submission','Hello Student Upload Microproject'),(9,'Today lecture','Today lecture is cancel due to power cut.');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_attendance`
--

DROP TABLE IF EXISTS `stud_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stud_attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `date` date NOT NULL,
  `verify` varchar(200) DEFAULT 'Disapproved',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_attendance`
--

LOCK TABLES `stud_attendance` WRITE;
/*!40000 ALTER TABLE `stud_attendance` DISABLE KEYS */;
INSERT INTO `stud_attendance` VALUES (1,1,'2022-05-01','Disapproved');
/*!40000 ALTER TABLE `stud_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `enrollno` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `year` int NOT NULL,
  `semester` int NOT NULL,
  `faculty_id` int DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Pratik kushabrao jaypurkar','12333545','Wardha','pratik@gmail.com','CO','Male',3,6,10,'Pass@123',1),(2,'sanket khawashi','1901320140','karanja, wardha','sanket@gmail.com','CO','Male',3,6,10,'Pass@123',1),(3,'Bhavesh Jaypurkar','1901320114','Arvi, wardha','bhavesh@gmail.com','CO','Male',3,6,NULL,'Pass@123',1),(4,'BANGARE AASHISH YUWRAJ','1701320129','Arvi','ashishbangre77@gmail.com','CO','Male',3,6,NULL,'Pass@123',1),(5,'THAKARE JANHAVI RAJESHWAR','1801320116','Arvi, wardha','rathodgaurav940@gmail. com','EE','Male',2,5,NULL,'Pass@123',1),(6,'TIJARE NIHARIKA BABAN','1901320091','Arvi, wardha','niharika@gmail.com','ET','Female',2,4,NULL,'Pass@123',1),(7,'PATIL SANKET SHRIKRUSHNA','1901320121','Arvi, wardha','sanketpatl@gmail.com','ME','Male',2,2,NULL,'Pass@123',1),(8,'INGLE RENUKA PRASHANTRAO','1901320098','Arvi, wardha','inglerenuka05@gmail.com','CO','Female',2,6,NULL,'Pass@123',1),(9,'KOLSE BHUSHAN SURESH','1901320099','Arvi, wardha','bhushan@gmail.com','CO','Male',2,3,NULL,'Pass@123',1),(10,'SARODE SUDHANSHU PRAKASH','1901320100','Arvi, wardha','shudanshu@gmail.com','CO','Male',1,4,NULL,'Pass@123',1),(11,'VAIDYA KUNAL GAJANAN','1901320102','Arvi, wardha','kvaidya474@gmail.com','CH','Male',1,5,NULL,'Pass@123',1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-31 17:48:51
