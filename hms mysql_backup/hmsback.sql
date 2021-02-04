-- MySQL dump 10.13  Distrib 5.1.37, for Win32 (ia32)
--
-- Host: localhost    Database: hms
-- ------------------------------------------------------
-- Server version	5.1.37-community

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
-- Table structure for table `checkout`
--

DROP TABLE IF EXISTS `checkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout` (
  `ChkotID` int(11) DEFAULT NULL,
  `PatID` int(11) DEFAULT NULL,
  `RegDt` date DEFAULT NULL,
  `DateOut` date DEFAULT NULL,
  `RoomID` int(11) DEFAULT NULL,
  `RoomPrice` int(11) DEFAULT NULL,
  `OtherMedSer` int(11) DEFAULT NULL,
  `TotalAmt` int(11) DEFAULT NULL,
  KEY `RoomID` (`RoomID`),
  CONSTRAINT `checkout_ibfk_1` FOREIGN KEY (`RoomID`) REFERENCES `roominfo` (`RoomID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout`
--

LOCK TABLES `checkout` WRITE;
/*!40000 ALTER TABLE `checkout` DISABLE KEYS */;
INSERT INTO `checkout` VALUES (1,1,'2015-04-23','2015-05-10',1,5000,4000,9000),(2,2,'2015-05-13','2015-05-27',2,4000,2000,6000),(3,3,'2015-02-20','2015-02-27',3,3000,1000,4000);
/*!40000 ALTER TABLE `checkout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `log_id` int(11) NOT NULL,
  `usr_nm` varchar(34) DEFAULT NULL,
  `pwd` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'sid','jimmy');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration` (
  `PatID` int(11) NOT NULL,
  `RegDt` date DEFAULT NULL,
  `PatNm` varchar(45) DEFAULT NULL,
  `Gndr` varchar(34) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `Addr` varchar(43) DEFAULT NULL,
  `ContNbr` varchar(43) DEFAULT NULL,
  `DisNm` varchar(45) DEFAULT NULL,
  `Distyp` varchar(34) DEFAULT NULL,
  `RoomID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PatID`),
  KEY `RoomID` (`RoomID`),
  KEY `checkout` (`PatID`),
  CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`RoomID`) REFERENCES `roominfo` (`RoomID`),
  CONSTRAINT `registration_ibfk_2` FOREIGN KEY (`PatID`) REFERENCES `registration` (`PatID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES (1,'2015-04-23','Roshan Najar','male',18,'c-52 gopalnahar , gandhidham ','7854125436 ','fever','viral',1),(2,'2015-05-13','Jalaj Yadav','male',28,'d-12 nahar , gandhipur ','9885455436 ','cough','viral',2),(3,'2015-02-20','Roshni Thaker','female',12,'e-232 ramnagar , adipur ','954854360','fracture','none',3);
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roominfo`
--

DROP TABLE IF EXISTS `roominfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roominfo` (
  `RoomID` int(11) NOT NULL DEFAULT '0',
  `RoomNbr` varchar(20) DEFAULT NULL,
  `RoomTyp` varchar(34) DEFAULT NULL,
  `RoomPrice` int(11) DEFAULT NULL,
  PRIMARY KEY (`RoomID`),
  UNIQUE KEY `RoomNbr` (`RoomNbr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roominfo`
--

LOCK TABLES `roominfo` WRITE;
/*!40000 ALTER TABLE `roominfo` DISABLE KEYS */;
INSERT INTO `roominfo` VALUES (1,'R107','VIP',5000),(2,'R105','Medium',4000),(3,'R108','Normal',3000),(4,'R122','Medium',8000);
/*!40000 ALTER TABLE `roominfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-28 11:27:49
