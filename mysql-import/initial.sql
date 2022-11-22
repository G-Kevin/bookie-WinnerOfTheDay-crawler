SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP DATABASE IF EXISTS `sb_crawler`;
CREATE DATABASE `sb_crawler` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `sb_crawler`;

DROP TABLE IF EXISTS `coaches`;
CREATE TABLE `coaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `kunden`;
CREATE TABLE `kunden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coach` int(11) DEFAULT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `land` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `coach` (`coach`),
  KEY `land` (`land`),
  CONSTRAINT `kunden_ibfk_1` FOREIGN KEY (`coach`) REFERENCES `coaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `kunden_ibfk_2` FOREIGN KEY (`land`) REFERENCES `laender` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `laender`;
CREATE TABLE `laender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `land` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP VIEW IF EXISTS `v_get_kunden`;
CREATE TABLE `v_get_kunden` (`id` int(11), `coach` int(11), `firstname` varchar(100), `lastname` varchar(100), `coach_name` varchar(50), `land_name` varchar(30));


DROP TABLE IF EXISTS `v_get_kunden`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_get_kunden` AS select `kunden`.`id` AS `id`,`kunden`.`coach` AS `coach`,`kunden`.`firstname` AS `firstname`,`kunden`.`lastname` AS `lastname`,`coaches`.`name` AS `coach_name`,`laender`.`land` AS `land_name` from ((`kunden` left join `laender` on(`laender`.`id` = `kunden`.`land`)) left join `coaches` on(`coaches`.`id` = `kunden`.`coach`));
