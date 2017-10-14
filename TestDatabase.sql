-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 14, 2017 at 07:44 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `TestDatabase`
--
CREATE DATABASE IF NOT EXISTS `TestDatabase` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `TestDatabase`;

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE IF NOT EXISTS `data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL COMMENT 'backend reference only',
  `data_type_id` int(11) NOT NULL,
  `order_no` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `data_type_id` (`data_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`id`, `title`, `data_type_id`, `order_no`) VALUES
(1, 'top panel', 1, 1),
(2, 'left panel', 2, 1),
(3, 'work (1Health)', 3, 1),
(4, 'work (HPH)', 3, 2),
(5, 'work (Amygo)', 3, 3),
(6, 'SKILL(PHP (Laravel Ionic))', 6, 1),
(7, 'SKILL(SQL)', 6, 2),
(8, 'SKILL(HTML and CSS)', 6, 3),
(9, 'SKILL(AngularJS )', 6, 4),
(10, 'SKILL(Android)', 6, 5),
(11, 'SKILL(iOS)', 6, 6),
(12, 'SKILL(dada)', 6, 7),
(13, 'SKILL(dudu)', 6, 8),
(14, 'education (Lambton)', 4, 1),
(15, 'education(University)', 4, 2),
(16, 'education(BCS)', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `data_metadata`
--

CREATE TABLE IF NOT EXISTS `data_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_id` int(11) NOT NULL,
  `data_types_metadata_id` int(11) NOT NULL,
  `value` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `data_id` (`data_id`),
  KEY `metadata_id` (`data_types_metadata_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_metadata`
--

INSERT INTO `data_metadata` (`id`, `data_id`, `data_types_metadata_id`, `value`) VALUES
(1, 1, 1, 'Deepesh'),
(2, 1, 2, 'Mehta'),
(3, 2, 3, '+1(647) 773-2820'),
(4, 2, 4, 'deepeshhmehta@gmail.com'),
(5, 2, 5, '67, Apache Trail, North York, M2H 2H7'),
(6, 2, 6, 'Passionate Learner, Innovative Thinker and a Confident speaker with a pair of efficient hands. With over 2 years of overall programming experience.'),
(7, 3, 7, '1Health Integrated Services Pvt Ltd.'),
(8, 3, 8, 'Application Programmer'),
(9, 3, 9, 'Develop Health Solution applications using PHP Laravel & Ionic framework'),
(10, 3, 10, 'Sept 2016 - March 2017'),
(11, 4, 7, 'HPH Systems'),
(12, 4, 8, 'Junior Programmer'),
(13, 4, 9, 'Develop Business Solution applications using Asp.Net'),
(14, 4, 10, 'June 2016 - Aug 2016'),
(15, 5, 7, 'Amygo Productions'),
(16, 5, 8, 'Technical Director'),
(17, 5, 9, 'Design Lights, sound and technically direct various plays'),
(18, 5, 10, 'April 2014 - Aug 2016'),
(19, 2, 15, './ProfilePic.jpg'),
(20, 2, 16, 'I dream of growing myself up alongside an enthusiastic and eager to learn team.'),
(21, 3, 17, 'http://www.arth.tech'),
(22, 4, 17, 'http://www.hphsystems.com'),
(23, 5, 17, '#'),
(24, 10, 18, 'Android'),
(25, 9, 18, 'Angular JS'),
(26, 8, 18, 'HTML and CSS'),
(27, 11, 18, 'iOS'),
(28, 6, 18, 'PHP (Laravel Ionic)'),
(29, 7, 18, 'SQL'),
(30, 12, 18, 'test_dada'),
(31, 13, 18, 'test_dudu'),
(32, 14, 11, 'Lambton College (Toronto)'),
(33, 14, 12, 'MADT'),
(34, 14, 13, 'Jan 2019'),
(35, 16, 11, 'Bombay Cambridge School'),
(36, 16, 12, 'Secondary'),
(37, 16, 13, 'March 2011'),
(38, 15, 11, 'Mumbai University'),
(39, 15, 12, 'BSc.IT'),
(40, 15, 13, '2016'),
(41, 16, 20, 'http://www.bcswest.org/'),
(42, 14, 20, 'https://www.lambtoncollege.ca/'),
(43, 15, 20, 'http://mu.ac.in/portal/');

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_type_name` varchar(25) NOT NULL,
  `order_no` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `data_type_name`, `order_no`) VALUES
(1, 'header', 1),
(2, 'about', 2),
(3, 'work', 3),
(4, 'education', 5),
(5, 'strength', 6),
(6, 'skills', 4);

-- --------------------------------------------------------

--
-- Table structure for table `data_types_metadata`
--

CREATE TABLE IF NOT EXISTS `data_types_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_type_id` int(11) NOT NULL,
  `field_name` varchar(30) NOT NULL,
  `field_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `data_type_id` (`data_type_id`),
  KEY `field_type_id` (`field_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_types_metadata`
--

INSERT INTO `data_types_metadata` (`id`, `data_type_id`, `field_name`, `field_type_id`) VALUES
(1, 1, 'fname', 1),
(2, 1, 'lname', 1),
(3, 2, 'phone', 2),
(4, 2, 'email', 3),
(5, 2, 'address', 1),
(6, 2, 'description', 1),
(7, 3, 'company_name', 1),
(8, 3, 'designation', 1),
(9, 3, 'job_description', 1),
(10, 3, 'tenure', 1),
(11, 4, 'school_name', 1),
(12, 4, 'degree_name', 1),
(13, 4, 'year_of_passing', 1),
(14, 5, 'strength', 1),
(15, 2, 'picture_url', 1),
(16, 2, 'description2', 1),
(17, 3, 'company_url', 1),
(18, 6, 'skill_name', 1),
(19, 6, 'expertise', 1),
(20, 4, 'school_url', 1);

-- --------------------------------------------------------

--
-- Table structure for table `field_types`
--

CREATE TABLE IF NOT EXISTS `field_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `field_types`
--

INSERT INTO `field_types` (`id`, `type`) VALUES
(1, 'text'),
(2, 'number'),
(3, 'email');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data`
--
ALTER TABLE `data`
  ADD CONSTRAINT `data_ibfk_1` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`);

--
-- Constraints for table `data_metadata`
--
ALTER TABLE `data_metadata`
  ADD CONSTRAINT `data_metadata_ibfk_1` FOREIGN KEY (`data_id`) REFERENCES `data` (`id`),
  ADD CONSTRAINT `data_metadata_ibfk_2` FOREIGN KEY (`data_types_metadata_id`) REFERENCES `data_types_metadata` (`id`);

--
-- Constraints for table `data_types_metadata`
--
ALTER TABLE `data_types_metadata`
  ADD CONSTRAINT `data_types_metadata_ibfk_1` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`),
  ADD CONSTRAINT `data_types_metadata_ibfk_2` FOREIGN KEY (`field_type_id`) REFERENCES `field_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
