--
-- Table structure for table `fail2ban`
--

DROP TABLE IF EXISTS `fail2ban`;
CREATE TABLE `fail2ban` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `port` int(11) NOT NULL,
  `ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `longitude` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

