-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: gym_management_system
-- ------------------------------------------------------
-- Server version	10.4.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `branchcode` int(11) NOT NULL,
  `branchname` varchar(45) DEFAULT NULL,
  `branchaddress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`branchcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dietplan`
--

DROP TABLE IF EXISTS `dietplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dietplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `mealid` int(11) DEFAULT NULL,
  `foodid` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foodId` (`foodid`),
  KEY `mealId` (`mealid`),
  KEY `emailid` (`email`),
  CONSTRAINT `emailid` FOREIGN KEY (`email`) REFERENCES `member` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `foodId` FOREIGN KEY (`foodid`) REFERENCES `foodchart` (`foodId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mealId` FOREIGN KEY (`mealid`) REFERENCES `mealchart` (`mealId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dietplan`
--

LOCK TABLES `dietplan` WRITE;
/*!40000 ALTER TABLE `dietplan` DISABLE KEYS */;
INSERT INTO `dietplan` VALUES (1,'2020-01-02',1,1,'minal@gmail.com'),(2,'2020-03-10',2,2,'minal@gmail.com'),(3,'2020-09-10',1,2,NULL);
/*!40000 ALTER TABLE `dietplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercisechart`
--

DROP TABLE IF EXISTS `exercisechart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercisechart` (
  `exerciseid` int(11) NOT NULL,
  `exercisename` varchar(45) DEFAULT NULL,
  `catname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`exerciseid`),
  KEY `catId` (`catname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercisechart`
--

LOCK TABLES `exercisechart` WRITE;
/*!40000 ALTER TABLE `exercisechart` DISABLE KEYS */;
INSERT INTO `exercisechart` VALUES (1,'pushups','floor'),(2,'treadmill','cardio');
/*!40000 ALTER TABLE `exercisechart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exerciseplan`
--

DROP TABLE IF EXISTS `exerciseplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exerciseplan` (
  `exeid` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(45) DEFAULT NULL,
  `sets` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `exerciseid` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`exeid`),
  KEY `eId` (`exerciseid`),
  KEY `email` (`email`),
  CONSTRAINT `eId` FOREIGN KEY (`exerciseid`) REFERENCES `exercisechart` (`exerciseid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `email` FOREIGN KEY (`email`) REFERENCES `member` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exerciseplan`
--

LOCK TABLES `exerciseplan` WRITE;
/*!40000 ALTER TABLE `exerciseplan` DISABLE KEYS */;
INSERT INTO `exerciseplan` VALUES (1,'2020-01-01',5,45,1,'minal@gmail.com'),(2,'2020-01-02',6,5,2,'minal@gmail.com'),(3,'2020-01-01',5,6,1,NULL),(4,'2020-01-02',6,5,2,NULL),(5,'2020-01-01',5,6,1,NULL);
/*!40000 ALTER TABLE `exerciseplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodchart`
--

DROP TABLE IF EXISTS `foodchart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foodchart` (
  `foodid` int(11) NOT NULL,
  `foodname` varchar(45) DEFAULT NULL,
  `nutri_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`foodid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodchart`
--

LOCK TABLES `foodchart` WRITE;
/*!40000 ALTER TABLE `foodchart` DISABLE KEYS */;
INSERT INTO `foodchart` VALUES (1,'Apple','proteins'),(2,'banana','carbohydrate');
/*!40000 ALTER TABLE `foodchart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym`
--

DROP TABLE IF EXISTS `gym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gym` (
  `code` int(11) NOT NULL,
  `gymname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym`
--

LOCK TABLES `gym` WRITE;
/*!40000 ALTER TABLE `gym` DISABLE KEYS */;
/*!40000 ALTER TABLE `gym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `healthissues`
--

DROP TABLE IF EXISTS `healthissues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `healthissues` (
  `healthid` int(11) NOT NULL,
  `issuename` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`healthid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healthissues`
--

LOCK TABLES `healthissues` WRITE;
/*!40000 ALTER TABLE `healthissues` DISABLE KEYS */;
/*!40000 ALTER TABLE `healthissues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruments`
--

DROP TABLE IF EXISTS `instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instruments` (
  `instrumentid` int(11) NOT NULL,
  `instrumentname` varchar(45) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `purchasedate` date DEFAULT NULL,
  `lastServicingdate` date DEFAULT NULL,
  `repairedparts` varchar(45) DEFAULT NULL,
  `maintainanceduration` int(11) DEFAULT NULL,
  PRIMARY KEY (`instrumentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruments`
--

LOCK TABLES `instruments` WRITE;
/*!40000 ALTER TABLE `instruments` DISABLE KEYS */;
/*!40000 ALTER TABLE `instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `managerid` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`managerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('admin','admin');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mealchart`
--

DROP TABLE IF EXISTS `mealchart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mealchart` (
  `mealid` int(11) NOT NULL,
  `mealtype` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mealid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mealchart`
--

LOCK TABLES `mealchart` WRITE;
/*!40000 ALTER TABLE `mealchart` DISABLE KEYS */;
INSERT INTO `mealchart` VALUES (1,'breakfast'),(2,'lunch'),(3,'evening snacks'),(4,'dinner');
/*!40000 ALTER TABLE `mealchart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `memberid` int(11) NOT NULL,
  `membername` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `contactno` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `confirmpassword` varchar(45) DEFAULT NULL,
  `membershipid` int(11) DEFAULT NULL,
  PRIMARY KEY (`email`),
  KEY `membershipid` (`membershipid`),
  CONSTRAINT `membershipid` FOREIGN KEY (`membershipid`) REFERENCES `membershipplan` (`membershipid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (2,'Girija Mage','girija@gmail.com','girija','541854894',22,'pune','girija',1),(1,'Minal Kulkarni','minal@gmail.com','minal','8698432',22,'pune','minal',2),(5,'pranjul Agrahari','pranjul@gmail.com','pranjul123','123456',25,'pune','pranjul123',1),(0,'Rishabh Singh','rishabh@gmail.com','rishabh123','879846',22,'pune','rishabh123',3),(3,'Rucha Nade','rucha@gmail.com','rucha123','584694',22,'pune','rucha123',4),(4,'shashank Sharma','shashank@gmail.com','shashank123','418479',21,'pune','shashank123',4);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberallocation`
--

DROP TABLE IF EXISTS `memberallocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memberallocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mememail` varchar(45) DEFAULT NULL,
  `traineremail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memail` (`mememail`),
  KEY `temail` (`traineremail`),
  CONSTRAINT `memail` FOREIGN KEY (`mememail`) REFERENCES `member` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `temail` FOREIGN KEY (`traineremail`) REFERENCES `trainer` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberallocation`
--

LOCK TABLES `memberallocation` WRITE;
/*!40000 ALTER TABLE `memberallocation` DISABLE KEYS */;
INSERT INTO `memberallocation` VALUES (0,'pranjul@gmail.com','minalt@gmail.com'),(8,'shashank@gmail.com','apurvat@gmail.com'),(9,'minal@gmail.com','ruchat@gmail.com'),(10,'minal@gmail.com','minalt@gmail.com'),(11,'rucha@gmail.com','girijat@gmail.com');
/*!40000 ALTER TABLE `memberallocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membershipplan`
--

DROP TABLE IF EXISTS `membershipplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membershipplan` (
  `membershipid` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`membershipid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membershipplan`
--

LOCK TABLES `membershipplan` WRITE;
/*!40000 ALTER TABLE `membershipplan` DISABLE KEYS */;
INSERT INTO `membershipplan` VALUES (1,'Annual',15000),(2,'Half Yearly',10000),(3,'Quarterly',6000),(4,'Monthly',3000);
/*!40000 ALTER TABLE `membershipplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timings`
--

DROP TABLE IF EXISTS `timings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timings` (
  `timingid` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`timingid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timings`
--

LOCK TABLES `timings` WRITE;
/*!40000 ALTER TABLE `timings` DISABLE KEYS */;
INSERT INTO `timings` VALUES (1,'Prime Time'),(2,'happy Hours'),(3,'aaa');
/*!40000 ALTER TABLE `timings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainer` (
  `trainerid` int(11) NOT NULL,
  `trainername` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `speciality` varchar(45) DEFAULT NULL,
  `availability` varchar(45) DEFAULT NULL,
  `doj` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES (4,'Apurva Naik','apurvat@gmail.com','apurvat123','Certified Fitness Trainer','5pm to 9pm','2019-03-02'),(3,'Girija Mage','girijat@gmail.com','girijat123','Yoga Trainer','5pm to 9pm','2018-02-03'),(2,'Minal Kulkarni','minalt@gmail.com','minalt123','Certified Dieticien','6am to 8am','2019-01-01'),(0,'Rucha Nade','ruchat@gmail.com','ruchat123','Certified Fitness Trainer','9am to 5pm','2022-02-02');
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-30  0:19:59
