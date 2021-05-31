-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2019 at 11:36 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digital_archive0`
--
CREATE DATABASE IF NOT EXISTS `digital_archive0` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `digital_archive0`;

-- --------------------------------------------------------

--
-- Table structure for table `da0_category`
--

CREATE TABLE IF NOT EXISTS `da0_category` (
  `id` int(4) NOT NULL,
  `category` varchar(30) NOT NULL,
  `locate` enum('1','2','3','4') NOT NULL,
  `id_divisi` varchar(3) NOT NULL,
  `parent_id` int(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `da0_ci_session`
--

CREATE TABLE IF NOT EXISTS `da0_ci_session` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `da0_count`
--

CREATE TABLE IF NOT EXISTS `da0_count` (
  `id` int(3) NOT NULL,
  `table` varchar(20) NOT NULL,
  `field_column` varchar(25) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `da0_count`
--

INSERT INTO `da0_count` (`id`, `table`, `field_column`, `count`) VALUES
(1, 'da0_users', 'id', 3),
(2, 'da0_file', 'id', 0),
(3, 'da0_shared_docs', 'id', 0);

-- --------------------------------------------------------

--
-- Table structure for table `da0_divisi`
--

CREATE TABLE IF NOT EXISTS `da0_divisi` (
  `id` varchar(3) NOT NULL,
  `divisi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `da0_divisi`
--

INSERT INTO `da0_divisi` (`id`, `divisi`) VALUES
('ACC', 'Accounting'),
('EQP', 'Equipment'),
('FIN', 'Finance'),
('HRD', 'HRD & GA'),
('IT', 'Information Tech'),
('OPR', 'Operation'),
('TAX', 'Tax');

-- --------------------------------------------------------

--
-- Table structure for table `da0_file`
--

CREATE TABLE IF NOT EXISTS `da0_file` (
  `id` varchar(32) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `capacity` decimal(10,2) NOT NULL,
  `date_upload` datetime NOT NULL,
  `enc_name` varchar(100) NOT NULL,
  `is_shared` enum('0','1') NOT NULL,
  `id_users` varchar(32) NOT NULL,
  `id_divisi` varchar(3) NOT NULL,
  `id_category` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `da0_recyclebin`
--

CREATE TABLE IF NOT EXISTS `da0_recyclebin` (
  `id_rec` int(5) NOT NULL,
  `id` varchar(32) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `capacity` decimal(10,2) NOT NULL,
  `date_upload` datetime NOT NULL,
  `enc_name` varchar(100) NOT NULL,
  `is_shared` int(11) NOT NULL,
  `id_users` varchar(32) NOT NULL,
  `id_divisi` varchar(3) NOT NULL,
  `id_category` int(4) NOT NULL,
  `whos_delete` varchar(32) NOT NULL,
  `when_delete` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `da0_shared_docs`
--

CREATE TABLE IF NOT EXISTS `da0_shared_docs` (
  `id` varchar(32) NOT NULL,
  `from_user_id` varchar(32) NOT NULL,
  `file_id` varchar(32) NOT NULL,
  `to_user_id` varchar(32) NOT NULL,
  `shared_on` datetime NOT NULL,
  `until` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------

--
-- Table structure for table `da0_users`
--

CREATE TABLE IF NOT EXISTS `da0_users` (
  `id` varchar(32) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(60) NOT NULL,
  `nip` varchar(9) NOT NULL,
  `email` varchar(40) NOT NULL,
  `is_enable` tinyint(1) NOT NULL DEFAULT '1',
  `id_divisi` varchar(3) NOT NULL,
  `authority` enum('1','2','3') NOT NULL,
  `last_login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `da0_users`
--

INSERT INTO `da0_users` (`id`, `nickname`, `username`, `password`, `nip`, `email`, `is_enable`, `id_divisi`, `authority`, `last_login`) VALUES
('c4ca4238a0b923820dcc509a6f75849b', 'Rizk Jamal', 'rizkijh', '$2y$10$4nhzIFJXZSJ75x38qPEJLumSu1Lv4IsZnRsdF9WD/22nhVOzDabyK', 'TN1802039', 'rizki@mail.com', 1, 'IT', '1', '2019-02-27 11:02:00'),
('c81e728d9d4c2f636f067f89cc14862c', 'Rizki', 'tautau', '$2y$10$l36TW8CthmnK0buNm7ynje59VFfgxODclsXZVxel62FeMCZDz28N2', 'TN1702000', 'tau@mail.com', 1, 'EQP', '2', '2019-02-27 10:43:39'),
('eccbc87e4b5ce2fe28308fd9f2a7baf3', 'Tester1', 'tester1', '$2y$10$Y6sXYJTOro9xDD2.lqHj9.PXnoccubCCXwrrC7UgRwOYZxYVdJII2', 'TN1704004', 'tester@mail', 0, 'FIN', '3', '2019-02-10 19:31:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `da0_category`
--
ALTER TABLE `da0_category`
  ADD PRIMARY KEY (`id`);
--
-- Indexes for table `da0_ci_session`
--
ALTER TABLE `da0_ci_session`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);
--
-- Indexes for table `da0_count`
--
ALTER TABLE `da0_count`
  ADD PRIMARY KEY (`id`);
--
-- Indexes for table `da0_divisi`
--
ALTER TABLE `da0_divisi`
  ADD PRIMARY KEY (`id`);
--
-- Indexes for table `da0_file`
--
ALTER TABLE `da0_file`
  ADD PRIMARY KEY (`id`);
--
-- Indexes for table `da0_recyclebin`
--
ALTER TABLE `da0_recyclebin`
  ADD PRIMARY KEY (`id_rec`);
--
-- Indexes for table `da0_shared_docs`
--
ALTER TABLE `da0_shared_docs`
  ADD PRIMARY KEY (`id`);
--
-- Indexes for table `da0_users`
--
ALTER TABLE `da0_users`
  ADD PRIMARY KEY (`id`);
--
-- AUTO_INCREMENT for table `da0_category`
--
ALTER TABLE `da0_category`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `da0_count`
--
ALTER TABLE `da0_count`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `da0_recyclebin`
--
ALTER TABLE `da0_recyclebin`
  MODIFY `id_rec` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
