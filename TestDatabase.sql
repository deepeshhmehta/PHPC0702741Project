-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 18, 2017 at 12:32 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `admin_credentials`
--

CREATE TABLE `admin_credentials` (
  `id` int(11) NOT NULL,
  `user` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `access` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_credentials`
--

INSERT INTO `admin_credentials` (`id`, `user`, `password`, `access`) VALUES
(1, 'deepu', '$2y$10$Hw6M4meZOnqeWmbkTwNOX.P4DsBMCfVHJNR/tNztXXAWiFZgugu8C', 1);

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL COMMENT 'backend reference only',
  `data_type_id` int(11) NOT NULL,
  `order_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`id`, `title`, `data_type_id`, `order_no`) VALUES
(1, 'top panel', 1, 1),
(3, 'work (1Health)', 3, 1),
(4, 'work (HPH)', 3, 2),
(5, 'work (Amygo)', 3, 3),
(6, 'SKILL(PHP (Laravel Ionic))', 6, 1),
(7, 'SKILL(SQL)', 6, 2),
(8, 'SKILL(HTML and CSS)', 6, 3),
(9, 'SKILL(AngularJS )', 6, 4),
(10, 'SKILL(Android)', 6, 5),
(11, 'SKILL(iOS)', 6, 6),
(14, 'education (Lambton)', 4, 1),
(15, 'education(University)', 4, 2),
(16, 'education(BCS)', 4, 3),
(17, 'STRENGTH(Confident Speaker)', 5, 1),
(18, 'STRENGTH(Quick Learner)', 5, 2),
(19, 'STRENGTH(Ability to analyze th', 5, 3),
(20, 'STRENGTH(Multi tasker)', 5, 4),
(21, 'STRENGTH(Efficient solutions)', 5, 5),
(22, 'STRENGTH(Lazy (can find the ea', 5, 6),
(23, 'STRENGTH(Calm Mind)', 5, 7),
(24, 'STRENGTH(Team Player)', 5, 8),
(27, 'about', 2, 1),
(33, 'PRODUCT(Book1)', 7, 1),
(34, 'PRODUCTS(my book2)', 7, 2),
(35, 'PRODUCTS(my book3)', 7, 3),
(36, 'PRODUCTS(my book 4)', 7, 4),
(37, 'PRODUCTS(my book 5)', 7, 5),
(38, 'PRODUCTS(my book6)', 7, 6),
(39, 'PRODUCTS(my book 7)', 7, 7),
(40, 'USER(Deepesh)', 8, 1),
(41, 'USER(Nishant)', 8, 2),
(42, 'ORDER(0041Tue Oct 17, 2017 18:', 9, 1),
(43, 'ORDER(0041Tue Oct 17, 2017 18:', 9, 2),
(44, 'ORDER(0041Tue Oct 17, 2017 18:', 9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `data_metadata`
--

CREATE TABLE `data_metadata` (
  `id` int(11) NOT NULL,
  `data_id` int(11) NOT NULL,
  `data_types_metadata_id` int(11) NOT NULL,
  `value` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_metadata`
--

INSERT INTO `data_metadata` (`id`, `data_id`, `data_types_metadata_id`, `value`) VALUES
(1, 1, 1, 'Deepesh'),
(2, 1, 2, 'Mehta'),
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
(21, 3, 17, 'http://www.arth.tech'),
(22, 4, 17, 'http://www.hphsystems.com'),
(23, 5, 17, '#'),
(24, 10, 18, 'Android'),
(25, 9, 18, 'Angular JS'),
(26, 8, 18, 'HTML and CSS'),
(27, 11, 18, 'iOS'),
(28, 6, 18, 'PHP (Laravel Ionic)'),
(29, 7, 18, 'SQL'),
(32, 14, 11, 'Lambton College (Toronto)'),
(33, 14, 12, 'MADT'),
(34, 14, 13, 'Jan 2019'),
(35, 16, 11, 'Bombay Cambridge School'),
(36, 16, 12, 'Secondary'),
(37, 16, 13, 'March 2011'),
(38, 15, 11, 'Mumbai University'),
(39, 15, 12, 'BSc.IT'),
(40, 15, 13, 'March 2016'),
(41, 16, 20, 'http://www.bcswest.org/'),
(42, 14, 20, 'https://www.lambtoncollege.ca/'),
(43, 15, 20, 'http://mu.ac.in/portal/'),
(44, 17, 14, 'Confident Speaker'),
(45, 18, 14, 'Quick Learner'),
(46, 19, 14, 'Ability to analyze the problem'),
(47, 20, 14, 'Multi tasker'),
(48, 21, 14, 'Efficient solutions'),
(49, 22, 14, 'Lazy (can find the easiest and simplest way out)'),
(50, 23, 14, 'Calm Mind'),
(51, 24, 14, 'Team Player'),
(61, 27, 3, '+1(647) 773-2820'),
(62, 27, 4, 'deepeshhmehta@gmail.com'),
(63, 27, 5, '67, Apache Trail, North York, M2H 2H7'),
(64, 27, 6, 'Passionate Learner, Innovative Thinker and a Confident speaker with a pair of efficient hands. With over 2 years of overall programming experience.'),
(65, 27, 15, 'ProfilePic.jpg'),
(66, 27, 16, 'I dream of growing myself up alongside an enthusiastic and eager to learn team.'),
(73, 33, 21, 'my book1'),
(74, 33, 22, '10'),
(75, 33, 23, './images/book1.jpg'),
(76, 34, 21, 'my book2'),
(77, 34, 22, '20'),
(78, 34, 23, './images/book2.jpg'),
(79, 35, 21, 'my book3'),
(80, 35, 22, '40'),
(81, 35, 23, './images/book3.jpg'),
(82, 36, 21, 'my book 4'),
(83, 36, 22, '1'),
(84, 36, 23, './images/book4.jpg'),
(85, 37, 21, 'my book 5'),
(86, 37, 22, 'free'),
(87, 37, 23, './images/book5.jpg'),
(88, 38, 21, 'my book6'),
(89, 38, 22, '10'),
(90, 38, 23, './images/book6.jpg'),
(91, 39, 21, 'my book 7'),
(92, 39, 22, '12.58'),
(93, 39, 23, './images/book7.jpg'),
(94, 40, 24, 'Deepesh'),
(95, 40, 25, 'deepeshhmehta@gmail.com'),
(96, 40, 26, '+1(647) 773-2820'),
(97, 40, 27, 'apple123'),
(98, 41, 24, 'Nishant'),
(99, 41, 25, 'nishdesai@gmail.com'),
(100, 41, 26, '987'),
(101, 41, 27, '$2y$10$ff.aPCQ0fR1vuvvrJ0dwteh1IhHdZNwtwnQC.CcPreJLO39yLPXHS'),
(102, 42, 28, '41'),
(103, 42, 29, '33'),
(104, 42, 29, '38'),
(105, 42, 29, '35'),
(106, 43, 28, '41'),
(107, 43, 29, '33'),
(108, 43, 29, '38'),
(109, 43, 29, '39'),
(110, 44, 28, '41'),
(111, 44, 29, '34'),
(112, 44, 29, '38');

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(11) NOT NULL,
  `data_type_name` varchar(25) NOT NULL,
  `order_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `data_type_name`, `order_no`) VALUES
(1, 'header', 1),
(2, 'about', 2),
(3, 'work', 3),
(4, 'education', 5),
(5, 'strength', 6),
(6, 'skills', 4),
(7, 'products', 7),
(8, 'user', 8),
(9, 'order', 9);

-- --------------------------------------------------------

--
-- Table structure for table `data_types_metadata`
--

CREATE TABLE `data_types_metadata` (
  `id` int(11) NOT NULL,
  `data_type_id` int(11) NOT NULL,
  `field_name` varchar(30) NOT NULL,
  `field_type_id` int(11) NOT NULL,
  `order_no` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_types_metadata`
--

INSERT INTO `data_types_metadata` (`id`, `data_type_id`, `field_name`, `field_type_id`, `order_no`) VALUES
(1, 1, 'fname', 1, 1),
(2, 1, 'lname', 1, 1),
(3, 2, 'phone', 2, 1),
(4, 2, 'email', 3, 2),
(5, 2, 'address', 1, 3),
(6, 2, 'description', 1, 4),
(7, 3, 'company_name', 1, 1),
(8, 3, 'designation', 1, 2),
(9, 3, 'job_description', 1, 4),
(10, 3, 'tenure', 1, 3),
(11, 4, 'school_name', 1, 1),
(12, 4, 'degree_name', 1, 2),
(13, 4, 'year_of_passing', 1, 3),
(14, 5, 'strength', 1, 1),
(15, 2, 'picture_url', 1, 6),
(16, 2, 'description2', 1, 5),
(17, 3, 'company_url', 1, 5),
(18, 6, 'skill_name', 1, 1),
(20, 4, 'school_url', 1, 4),
(21, 7, 'name', 1, 1),
(22, 7, 'price', 1, 2),
(23, 7, 'image_url', 1, 3),
(24, 8, 'name', 1, 1),
(25, 8, 'email', 2, 2),
(26, 8, 'phone', 1, 3),
(27, 8, 'pass', 1, 4),
(28, 9, 'user_id', 1, 1),
(29, 9, 'product_id', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `field_types`
--

CREATE TABLE `field_types` (
  `id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `field_types`
--

INSERT INTO `field_types` (`id`, `type`) VALUES
(1, 'text'),
(2, 'number'),
(3, 'email');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_credentials`
--
ALTER TABLE `admin_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_type_id` (`data_type_id`);

--
-- Indexes for table `data_metadata`
--
ALTER TABLE `data_metadata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_id` (`data_id`),
  ADD KEY `metadata_id` (`data_types_metadata_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_types_metadata`
--
ALTER TABLE `data_types_metadata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_type_id` (`data_type_id`),
  ADD KEY `field_type_id` (`field_type_id`);

--
-- Indexes for table `field_types`
--
ALTER TABLE `field_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_credentials`
--
ALTER TABLE `admin_credentials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `data_metadata`
--
ALTER TABLE `data_metadata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `data_types_metadata`
--
ALTER TABLE `data_types_metadata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `field_types`
--
ALTER TABLE `field_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
