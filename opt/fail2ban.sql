--
-- Table structure for table `fail2ban`
--

DROP TABLE IF EXISTS `fail2ban`;
CREATE TABLE `fail2ban` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `protocol` varchar(4) NOT NULL,
  `port` int(11) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `count` int(11) NOT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `country` varchar(5) DEFAULT NULL,
  `geo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM;
