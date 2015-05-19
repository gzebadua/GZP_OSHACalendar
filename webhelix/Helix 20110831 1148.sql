-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.91-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema webhelix
--

CREATE DATABASE IF NOT EXISTS webhelix;
USE webhelix;

--
-- Definition of table `incidents`
--

DROP TABLE IF EXISTS `incidents`;
CREATE TABLE `incidents` (
  `iincidentid` int(11) NOT NULL,
  `splant` varchar(500) NOT NULL,
  `idate` int(11) NOT NULL,
  `incident` varchar(500) NOT NULL,
  `iincidenttypeid` int(11) NOT NULL,
  PRIMARY KEY  USING BTREE (`iincidentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incidents`
--

/*!40000 ALTER TABLE `incidents` DISABLE KEYS */;
INSERT INTO `incidents` (`iincidentid`,`splant`,`idate`,`incident`,`iincidenttypeid`) VALUES 
 (1,'Edinburg',20110704,'Line stop due to overheat',0),
 (2,'Sinaloa',20110704,'Exposure levels over the permissible limits',1),
 (3,'Edinburg',20110704,'Line stop due to overheat',0),
 (4,'Imperial Valley',20110713,'Exposure levels over the permissible limits',1),
 (5,'Imperial Valley',20110713,'Line stop due to overheat',0),
 (6,'Sinaloa',20110712,'Line stop due to overheat',0);
/*!40000 ALTER TABLE `incidents` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
