-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: recruitment_system
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `about_candidate`
--

DROP TABLE IF EXISTS `about_candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `about_candidate` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `skills` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `experience` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `profession` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `aditional_info` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `prev_employment` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `certificates` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `languages` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `hobby` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `education` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `avatar` blob,
  `candidate_id` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `about_candidate_ibfk_1_idx` (`candidate_id`),
  CONSTRAINT `about_candidate_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_candidate`
--

LOCK TABLES `about_candidate` WRITE;
/*!40000 ALTER TABLE `about_candidate` DISABLE KEYS */;
INSERT INTO `about_candidate` VALUES (1,'Language: good German & English;','3 years in IT organization','Frontend',NULL,'DEV-company',NULL,'German, English','websites ',NULL,NULL,1),(2,'analytical thinking, teamwork skills ','2 years of intership in IT','Backend',NULL,'S&B',NULL,'German, English, Spanish','editing movies, programming',NULL,NULL,2),(3,'Good team work spirit and passion for Network technologies','4 years of Frontend Developing','Data science',NULL,'Nokkia',NULL,' English','coding, sport, music',NULL,NULL,3),(4,'teamwork skills, good communication in English (both written and spoken) ','2 years of Backend developing','Marketing',NULL,'Bank IG',NULL,' English','physics, history',NULL,NULL,4);
/*!40000 ALTER TABLE `about_candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_status`
--

DROP TABLE IF EXISTS `application_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `date_changed` timestamp NULL DEFAULT NULL,
  `application_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `application_id` (`application_id`),
  CONSTRAINT `application_status_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `applications` (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_status`
--

LOCK TABLES `application_status` WRITE;
/*!40000 ALTER TABLE `application_status` DISABLE KEYS */;
INSERT INTO `application_status` VALUES (1,'verification','2021-09-30 17:31:54',1),(2,'verification','2021-11-30 19:00:00',2),(3,'verification','2021-09-02 19:00:00',3),(4,'verification','2021-11-21 22:59:59',4);
/*!40000 ALTER TABLE `application_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `application_id` int NOT NULL AUTO_INCREMENT,
  `term_of_validity` datetime DEFAULT NULL,
  `recruiters_id` int NOT NULL,
  `candidate_id` int NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `hierd` enum('T','N') CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`application_id`),
  KEY `recruiters_id` (`recruiters_id`),
  KEY `candidate_id` (`candidate_id`),
  CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`recruiters_id`) REFERENCES `recruiters` (`recruiters_id`),
  CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,'2021-11-21 23:59:59',1,1,'Web Developer',NULL,'T',NULL),(2,'2021-09-16 20:25:10',1,2,'Backend Developer',NULL,'T',NULL),(3,'2021-09-12 21:00:00',2,3,'Frontend Developer (React)',NULL,'N',NULL),(4,'2021-09-30 19:31:54',3,4,'IT system administrator',NULL,'T',NULL);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidates` (
  `candidate_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `surname` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `recruiters_id` int NOT NULL,
  PRIMARY KEY (`candidate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidates`
--

LOCK TABLES `candidates` WRITE;
/*!40000 ALTER TABLE `candidates` DISABLE KEYS */;
INSERT INTO `candidates` VALUES (1,'Robert','Kotarski',1),(2,'Andrzej','Adamowicz',1),(3,'Sebastian','Sobota',2),(4,'Piotr','Szymański',3);
/*!40000 ALTER TABLE `candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `document_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `type` enum('cv','umowa','zgoda','inne') CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `document` blob,
  `candidate_id` int NOT NULL,
  PRIMARY KEY (`document_id`),
  KEY `candidate_id` (`candidate_id`),
  CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'Contract with previous employer','umowa',NULL,1),(2,'Curriculum vitae','cv',NULL,2);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_offers`
--

DROP TABLE IF EXISTS `job_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_offers` (
  `ID_Aplikacji` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `position_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `description` varchar(45) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  `Tasks` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `candidate_description` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `required_skills` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `wage_rate` varchar(45) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  `type_of_contract` enum('umowa o pracę','b2b','umowa o zlecenie','umowa o dzieło') CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  `trial_days` int DEFAULT NULL,
  `minimal_experience` int DEFAULT NULL,
  `end_of_recruitment` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tags` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `recruiters_id` int DEFAULT NULL,
  PRIMARY KEY (`ID_Aplikacji`),
  KEY `recruiters_id` (`recruiters_id`),
  CONSTRAINT `job_offers_ibfk_1` FOREIGN KEY (`recruiters_id`) REFERENCES `recruiters` (`recruiters_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_offers`
--

LOCK TABLES `job_offers` WRITE;
/*!40000 ALTER TABLE `job_offers` DISABLE KEYS */;
INSERT INTO `job_offers` VALUES (1,'Frontend Developer (React)','Frontend Developer ','We are looking for Forntend Developer','Design, development and testing of components of the Transfer Agency Investor Onboarding system.\r\n\r\nSupporting business analysts in reaching a common understanding of user stories and acceptance criteria.\r\n\r\nIntegration of the systems developed in-house with vendor solutions.\r\n\r\nResolution of issues reported in test and on production systems.','Senior Frontend Developer with advanced JS and React','React, JS, ES6, CSS, HTML','12000','b2b',15,7,'2021-09-30 17:31:54','React, Frontend, Js',1),(2,' Embedded systems developer  (Python / C / C+','Developer','We are looking for Python Developer','Design and development of embedded systems software with the use of microcontrollers.\r\n\r\nDesigning and developing software for embedded devices / systems using single-chip computers (SBC), especially Raspberry Pi.\r\n','Mid Python Developer with at least 3 years of experience','Python, Raspberry PI, C++, C','14000','umowa o pracę',30,3,'2021-09-22 14:17:41','Python, Embedded systems, Job, Raspberry',1),(3,'Integration and Testing Engineer','Integration and Testing Engineer','We are looking for telecommunication expert','Work with teams of experts developing the telecommunication systems deployed worldwide','Master\'s or Bachelor\'s degree in Engineering, Telecommunications, Computer Science, Software Technology or equivalent education','Perl, Bash, telecommunication systems 2G/3G/4G/5G','10000','umowa o pracę',30,1,'2021-09-16 18:25:10','Perl, Bash, telecommunication systems',2),(4,'IT system administrator','IT System Administrator','We are looking for System Administrator','Internal system management','Familiarity with some of following areas: Linux, IP networks, telecommunication systems, radio frequency technologies and measurements, scripting','Linux, Perl, UNIX, IP networks','13000','b2b',60,3,'2021-10-10 20:59:59','Administrator, Perl, Linux',2),(5,'Analytical problem solving engineer','Analyst engineer','We are looking for Analyst engineer','Working on analyses and investigations of potential bugs','Analytical problem solving engineer with advanced knowlage with Data science','Jenkins, Git, JIRA','14000','umowa o zlecenie',30,2,'2021-09-12 19:00:00','Jenkis, JIRA, Analyst, Git',2),(6,'Network Operations Engineer','Network Engineer','We are looking for Network Engineer','Dealing with different network technologies','Experience in telecommunication and Business Customer network environments','DLS, Ethernet, Fiber, LTE','9000','umowa o pracę',15,2,'2021-11-30 19:00:00','DLS, Fiber, LTE, Ethernet',3),(7,'Marketing Manager','Marketing Manager','We are looking for Network Marketing Manager','Seeking and building business relationships with suppliers - customers','Advanced knowledge of working with at least one CRM system, including mapping the sales process, information flow, data management of other team members, setting work priorities','Pipedrive, HubSpot CRM, Nutshell CRM','11000','umowa o zlecenie',30,1,'2021-11-21 22:59:59','Marketing Manager, Pipedrive, HubSpot CRM, Nutshell CRM',3),(8,'Backend Developer','Backend Developer','We are looking for Backend Developer','Develop digital products throughout every stage of the development process','We are looking for a Backend Developer (+3 years of professional experience)','GitLab, Google Docs, Jira, Jenkins','12000','b2b',30,3,'2021-09-02 19:00:00','Backend Developer, Jira, Jenkins,',1),(9,'Web Developer','Web Developer','We are looking for Web Developer','You will be responsible for analyzing, developing, improving and maintaining web technology based platforms - used by our customers','Web Developer with at least 3 years of experience','JavaScript, HTML, PHP, Git','11000','umowa o dzieło',60,3,'2021-10-15 20:59:59','JavaScript, HTML, PHP, Git, Web Developer',3);
/*!40000 ALTER TABLE `job_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetings` (
  `meeting_id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `place` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `additional_info` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `recruiters_id` int NOT NULL,
  PRIMARY KEY (`meeting_id`),
  KEY `recruiters_id` (`recruiters_id`),
  CONSTRAINT `meetings_ibfk_1` FOREIGN KEY (`recruiters_id`) REFERENCES `recruiters` (`recruiters_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
INSERT INTO `meetings` VALUES (1,'2012-10-11','10:00:00','Warszawa','Manekin restauration',1),(2,'2021-10-11','11:00:00','Katowice','Silesia City Center',2);
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `boss` varchar(45) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `number_of_vacancies` int NOT NULL,
  `recruiters_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'Omero','At OMERO we use the latest computer assisted translation technology systems to provide our Clients with mechanisms that guarantee convenience and economic savings in the translation process.','Sławomir Tokarz',3,1),(2,'Fast-Mobile','At Fast-Mobile , we create technology that helps the world to communicate as fast as possible.','Mikel Morgan',3,2),(3,'M&M','M&M is a digital design and engineering consultancy driven by people and culture','Tom Jonson',3,3);
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_data`
--

DROP TABLE IF EXISTS `personal_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_data` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `type` enum('rekruter','kandydat') CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `country` varchar(40) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL DEFAULT 'Polska',
  `city` varchar(40) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `postal_code` varchar(6) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `PESEL` varchar(11) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `phone_number` varchar(12) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `e_mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `street` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `house_number` int NOT NULL,
  `apartment_number` int DEFAULT NULL,
  `recruiters_id` int DEFAULT NULL,
  `candidate_id` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK1_Dane Osobowe` (`PESEL`),
  UNIQUE KEY `AK2_Dane Osobowe` (`phone_number`),
  UNIQUE KEY `AK3_Dane Osobowe` (`e_mail`),
  KEY `recruiters_id` (`recruiters_id`),
  KEY `candidate_id` (`candidate_id`),
  CONSTRAINT `personal_data_ibfk_1` FOREIGN KEY (`recruiters_id`) REFERENCES `recruiters` (`recruiters_id`),
  CONSTRAINT `personal_data_ibfk_2` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_data`
--

LOCK TABLES `personal_data` WRITE;
/*!40000 ALTER TABLE `personal_data` DISABLE KEYS */;
INSERT INTO `personal_data` VALUES (1,'rekruter','M','Poland','Bytom','45-233','75849354758','465738465','Adam@email.pl','Warszawska',43,3,1,NULL),(2,'kandydat','M','Poland','Zabrze','45-234','24352957453','354758495','rob@email.pl','Krakowska',54,NULL,NULL,1),(3,'kandydat','M','Poland','Warszawa','23-555','45387975643','132658463','andrzej@email.pl','Staszica',2,5,NULL,2),(4,'rekruter','F','Poland','Warszawa','36-554','34256745369','352906758','Beati@email.pl','Jagielońska',43,NULL,2,NULL),(5,'rekruter','M','Poland','Katowice','36-342','23769087468','536497856','tom@email.com','Bytomska',54,34,3,NULL),(6,'kandydat','M','Poland','Wrocław','46-953','45978342759','459865783','seba@email.pl','Kolorowa',34,5,NULL,3),(7,'kandydat','M','Poland','Poznań','25-345','13245362845','583957489','piotr@email.pl','Kwiatowa',23,NULL,NULL,4);
/*!40000 ALTER TABLE `personal_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruiters`
--

DROP TABLE IF EXISTS `recruiters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruiters` (
  `recruiters_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `surname` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `department` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `organization_id` int NOT NULL,
  PRIMARY KEY (`recruiters_id`),
  UNIQUE KEY `AK1_Rekruterzy` (`department`),
  KEY `organization_id` (`organization_id`),
  CONSTRAINT `recruiters_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruiters`
--

LOCK TABLES `recruiters` WRITE;
/*!40000 ALTER TABLE `recruiters` DISABLE KEYS */;
INSERT INTO `recruiters` VALUES (1,'Adam ','Nowiński','IT',1),(2,'Beata','Marczyk','Telecommunication',2),(3,'Tomasz','Kamiński','Marketing',3);
/*!40000 ALTER TABLE `recruiters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_account`
--

DROP TABLE IF EXISTS `system_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_account` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `login` varchar(70) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(70) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `recruiters_id` int DEFAULT NULL,
  `candidate_id` int DEFAULT NULL,
  PRIMARY KEY (`ID`,`login`,`password`),
  KEY `recruiters_id` (`recruiters_id`),
  KEY `candidate_id` (`candidate_id`),
  CONSTRAINT `system_account_ibfk_1` FOREIGN KEY (`recruiters_id`) REFERENCES `recruiters` (`recruiters_id`),
  CONSTRAINT `system_account_ibfk_2` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_account`
--

LOCK TABLES `system_account` WRITE;
/*!40000 ALTER TABLE `system_account` DISABLE KEYS */;
INSERT INTO `system_account` VALUES (1,'Robert123','rob123',NULL,1),(2,'Andrzej321','andrzej123',NULL,2),(3,'Seba123','seba123',NULL,3),(4,'Piotrek123','piotr123',NULL,4),(5,'Adam123','adi123',1,NULL),(6,'Beata123','beti123',2,NULL),(7,'Tom123','tom123',3,NULL);
/*!40000 ALTER TABLE `system_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-16 22:33:49
