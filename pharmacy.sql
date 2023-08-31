-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2023 at 05:46 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `str_druglist` ()   select NAME , TYPE ,BARCODE,SELLING_PRICE , EXPIRY , COMPANY_NAME, PRODUCTION_DATE, EXPIRATION_DATE from drugs$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `NAME` varchar(50) NOT NULL,
  `ADDRESS` varchar(50) NOT NULL,
  `PHONE` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`NAME`, `ADDRESS`, `PHONE`) VALUES
('Cipla', 'Bangalore, Karnataka', 9965253652),
('Dr Reddys', 'Bangalore', 8875423965),
('GSK', 'Gurugram, Haryana', 9746532589),
('Intas', 'Baikampady, Mangalore', 8875962153),
('Ipca', 'Gurugram, Haryana', 9985547236),
('Med_City', 'Nellore, Andhra Pradesh', 8856935624),
('Sun Pharma', 'Mysore, Karnataka', 7596842536),
('Torrent Pharma', 'Panjim, Goa', 7556822654);

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `NAME` varchar(50) NOT NULL,
  `TYPE` varchar(20) NOT NULL,
  `BARCODE` int(4) NOT NULL,
  `DOSE` int(11) NOT NULL,
  `CODE` varchar(10) NOT NULL,
  `COST_PRICE` double NOT NULL,
  `SELLING_PRICE` double NOT NULL,
  `EXPIRY` varchar(20) NOT NULL,
  `COMPANY_NAME` varchar(50) NOT NULL,
  `PRODUCTION_DATE` date NOT NULL,
  `EXPIRATION_DATE` date NOT NULL,
  `PLACE` varchar(20) NOT NULL,
  `QUANTITY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`NAME`, `TYPE`, `BARCODE`, `DOSE`, `CODE`, `COST_PRICE`, `SELLING_PRICE`, `EXPIRY`, `COMPANY_NAME`, `PRODUCTION_DATE`, `EXPIRATION_DATE`, `PLACE`, `QUANTITY`) VALUES
('Mox Capsules', 'Pills', 4588, 340, 'M2', 5, 6, 'Expired', 'GSK', '2019-05-10', '2022-04-10', 'B-Right', 3),
('Cheston Cold', 'Pills', 5264, 340, 'M4', 2.5, 7, 'Available for use', 'Cipla', '2022-05-10', '2024-04-09', 'C-Down', 1),
('Vigoron', 'Pills', 5764, 50, 'M10', 2, 2.5, 'Expired', 'Sun Pharma', '2021-01-05', '2023-01-29', 'E-Right', 10),
('Rozat', 'Pills', 5799, 500, 'M8', 2, 2.5, 'Expired', 'Sun Pharma', '2022-02-02', '2023-01-17', 'C-Down', 20),
('Asthalin-2', 'Pills', 6231, 2, 'M1', 2, 5.37, 'Available for use', 'Cipla', '2021-08-19', '2024-07-19', 'C-Right', 22),
('Dolo', 'Pills', 7845, 550, 'M7', 2.5, 3, 'Available for use', 'Cipla', '2022-01-03', '2024-01-03', 'C-Down', 10),
('Incid Ultra', 'Pills', 8754, 100, 'M8', 1.2, 2.6, 'Expired', 'Intas', '2021-01-29', '2023-01-30', 'E-Up', 15);

--
-- Triggers `drugs`
--
DELIMITER $$
CREATE TRIGGER `med_hdose` BEFORE INSERT ON `drugs` FOR EACH ROW if NEW.DOSE>=500 
then set NEW.PLACE="C-Down";
end if
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `history_sales`
--

CREATE TABLE `history_sales` (
  `USER_NAME` varchar(20) NOT NULL,
  `BARCODE` int(4) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `TYPE` varchar(10) NOT NULL,
  `DOSE` varchar(10) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `PRICE` double NOT NULL,
  `AMOUNT` double NOT NULL,
  `DATE` varchar(15) NOT NULL,
  `TIME` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `history_sales`
--

INSERT INTO `history_sales` (`USER_NAME`, `BARCODE`, `NAME`, `TYPE`, `DOSE`, `QUANTITY`, `PRICE`, `AMOUNT`, `DATE`, `TIME`) VALUES
('admin', 4588, 'Mox Capsules', 'Pills', '340mg', 3, 12.5, 37.5, '10-01-2023', '02:50:21 pm'),
('admin', 4588, 'Mox Capsules', 'Pills', '340mg', 2, 12.5, 25, '15-01-2023', '04:03:31 pm'),
('admin', 4588, 'Mox Capsules', 'Pills', '340mg', 1, 12.5, 12.5, '15-01-2023', '04:33:41 pm'),
('admin', 5264, 'Cheston Cold', 'Pills', '340mg', 3, 7, 21, '10-01-2023', '02:50:37 pm'),
('admin', 5264, 'Cheston Cold', 'Pills', '340', 1, 7, 7, '30-01-2023', '03:39:35 pm'),
('admin', 5264, 'Cheston Cold', 'Pills', '340mg', 3, 7, 21, '15-01-2023', '04:04:21 pm'),
('admin', 5264, 'Cheston Cold', 'Pills', '340mg', 2, 7, 14, '29-01-2023', '08:46:38 pm'),
('admin', 6231, 'Asthalin-2', 'Pills', '2mg', 3, 5.37, 16.11, '16-01-2023', '07:02:26 pm'),
('admin', 6231, 'Asthalin-2', 'Pills', '2mg', 2, 5.37, 10.74, '16-01-2023', '07:06:54 pm'),
('admin', 6231, 'Asthalin-2', 'Pills', '2mg', 4, 5.37, 21.48, '29-01-2023', '08:44:58 pm'),
('admin', 8896, 'Dolo', 'Pills', '650', 3, 3.5, 10.5, '15-01-2023', '04:04:00 pm'),
('admin', 8896, 'Dolo', 'Pills', '650', 5, 3.5, 17.5, '16-01-2023', '07:06:43 pm'),
('Mark', 4588, 'Mox Capsules', 'Pills', '340mg', 2, 12.5, 25, '10-01-2023', '02:46:44 pm'),
('Mark', 4588, 'Mox Capsules', 'Pills', '340mg', 5, 12.5, 62.5, '10-01-2023', '02:47:16 pm'),
('Mark', 5264, 'Cheston Cold', 'Pills', '340mg', 2, 7, 14, '10-01-2023', '02:33:42 pm'),
('Mark', 6231, 'Asthalin-2', 'Pills', '2mg', 4, 5.37, 21.48, '18-01-2023', '12:12:14 am');

-- --------------------------------------------------------

--
-- Table structure for table `inbox`
--

CREATE TABLE `inbox` (
  `MESSAGE_FROM` varchar(20) NOT NULL,
  `MESSAGE_TO` varchar(20) NOT NULL,
  `MESSAGE_TEXT` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `inbox`
--

INSERT INTO `inbox` (`MESSAGE_FROM`, `MESSAGE_TO`, `MESSAGE_TEXT`) VALUES
('admin', 'mark', 'Welcome mark'),
('mark', 'admin', 'Welcome sir'),
('admin', 'mark', 'Hay , mark '),
('mark', 'admin', 'Hay '),
('mark', 'admin', 'Welcome'),
('admin', 'mark', 'Hello , mark'),
('admin', 'mark', 'mark , Please go and update\nthe drug roof '),
('admin', 'Tony', 'Welcome'),
('admin', 'mark', 'This is your salary on the disk , \n3000 , close in 12  ; good luck'),
('admin', 'mark', 'good job meet me in five'),
('mark', 'admin', 'Ok i will '),
('admin', 'mark', 'gdfgfdgfdgfdg'),
('admin', 'mark', 'haaaaaaaaaaaaaaaai'),
('admin', 'mark', 'What is wrong ? '),
('mark', 'admin', 'I am okay thanks '),
('admin', 'Clark', 'Hello!'),
('Mark', 'Tony', 'Hey!\nPlease update the list of drugs soon');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `NAME` varchar(50) NOT NULL,
  `TYPE` varchar(20) NOT NULL,
  `DATE` varchar(20) NOT NULL,
  `TIME` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`NAME`, `TYPE`, `DATE`, `TIME`) VALUES
('admin', 'Admin', '01-01-2023', '10:22:31'),
('mark', 'Employee', '01-01-2023', '10:33:10'),
('admin', 'Admin', '03-05-2017', '01:23:14'),
('admin', 'Admin', '03-05-2017', '01:51:20'),
('admin', 'Admin', '03-05-2017', '01:52:35'),
('admin', 'Admin', '03-05-2017', '03:31:40'),
('admin', 'Admin', '03-05-2017', '03:47:32'),
('admin', 'Admin', '04-04-2017', '06:32:57'),
('mark', 'Employee', '04-04-2017', '06:39:00'),
('admin', 'Admin', '05-01-2023', '08:24:48'),
('admin', 'Admin', '05-01-2023', '08:37:53'),
('admin', 'Admin', '05-05-2017', '01:24:00'),
('admin', 'Admin', '05-05-2017', '03:06:19'),
('admin', 'Admin', '05-05-2017', '07:54:02'),
('admin', 'Admin', '07-06-2017', '08:41:28'),
('admin', 'Admin', '09-01-2023', '07:00:03'),
('admin', 'Admin', '09-01-2023', '07:41:32'),
('admin', 'Admin', '09-01-2023', '07:44:46'),
('mark', 'Employee', '09-01-2023', '08:06:21'),
('admin', 'Admin', '09-01-2023', '10:07:44'),
('admin', 'Admin', '10-01-2023', '01:37:30'),
('admin', 'Admin', '10-01-2023', '01:57:39'),
('admin', 'Admin', '10-01-2023', '02:22:32'),
('Mark', 'Employee', '10-01-2023', '02:30:17'),
('Mark', 'Employee', '10-01-2023', '02:46:14'),
('admin', 'Admin', '10-01-2023', '02:50:10'),
('admin', 'Admin', '10-01-2023', '02:57:53'),
('admin', 'Admin', '10-01-2023', '03:19:48'),
('admin', 'Admin', '10-01-2023', '03:22:14'),
('admin', 'Admin', '10-01-2023', '03:27:48'),
('admin', 'Admin', '10-01-2023', '04:05:18'),
('admin', 'Admin', '10-01-2023', '09:26:27'),
('admin', 'Admin', '10-01-2023', '09:38:24'),
('admin', 'Admin', '10-01-2023', '10:36:37'),
('admin', 'Admin', '10-01-2023', '10:49:57'),
('admin', 'Admin', '13-04-2017', '02:57:26'),
('admin', 'Admin', '13-04-2017', '03:06:11'),
('admin', 'Admin', '13-04-2017', '03:08:31'),
('admin', 'Admin', '13-04-2017', '03:09:40'),
('admin', 'Admin', '13-04-2017', '03:13:24'),
('admin', 'Admin', '13-04-2017', '05:04:26'),
('admin', 'Admin', '13-04-2017', '05:07:20'),
('admin', 'Admin', '13-04-2017', '05:10:11'),
('admin', 'Admin', '13-04-2017', '05:21:53'),
('admin', 'Admin', '14-04-2017', '02:32:24'),
('admin', 'Admin', '14-04-2017', '02:40:18'),
('admin', 'Admin', '14-04-2017', '02:43:43'),
('admin', 'Admin', '14-04-2017', '02:46:41'),
('admin', 'Admin', '14-04-2017', '02:48:26'),
('admin', 'Admin', '14-04-2017', '02:49:19'),
('mark', 'Employee', '14-04-2017', '02:52:01'),
('admin', 'Admin', '14-04-2017', '02:58:36'),
('admin', 'Admin', '14-04-2017', '03:14:22'),
('admin', 'Admin', '14-04-2017', '03:17:23'),
('admin', 'Admin', '14-04-2017', '03:19:28'),
('admin', 'Admin', '14-04-2017', '03:27:34'),
('admin', 'Admin', '14-04-2017', '04:49:24'),
('mark', 'Employee', '14-04-2017', '04:55:06'),
('mark', 'Employee', '14-04-2017', '05:01:50'),
('mark', 'Employee', '14-04-2017', '05:03:59'),
('admin', 'Admin', '14-04-2017', '05:11:57'),
('admin', 'Admin', '14-04-2017', '05:13:44'),
('mark', 'Employee', '14-04-2017', '05:14:50'),
('mark', 'Employee', '14-04-2017', '05:17:01'),
('admin', 'Admin', '14-04-2017', '05:17:42'),
('mark', 'Employee', '14-04-2017', '05:17:50'),
('admin', 'Admin', '14-04-2017', '05:19:38'),
('mark', 'Employee', '14-04-2017', '05:21:19'),
('admin', 'Admin', '14-04-2017', '05:22:00'),
('mark', 'Employee', '14-04-2017', '05:23:30'),
('mark', 'Employee', '14-04-2017', '05:26:03'),
('admin', 'Admin', '14-04-2017', '05:28:37'),
('mark', 'Employee', '14-04-2017', '05:28:53'),
('admin', 'Admin', '14-04-2017', '05:30:48'),
('mark', 'Employee', '14-04-2017', '05:32:36'),
('admin', 'Admin', '14-04-2017', '05:35:00'),
('mark', 'Employee', '14-04-2017', '05:35:04'),
('mark', 'Employee', '14-04-2017', '05:37:17'),
('admin', 'Admin', '14-04-2017', '05:39:54'),
('admin', 'Admin', '14-04-2017', '05:41:53'),
('admin', 'Admin', '14-04-2017', '05:44:29'),
('admin', 'Admin', '14-04-2017', '05:47:08'),
('admin', 'Admin', '14-04-2017', '05:48:24'),
('admin', 'Admin', '14-04-2017', '05:49:36'),
('admin', 'Admin', '14-04-2017', '05:51:28'),
('admin', 'Admin', '14-04-2017', '05:53:15'),
('admin', 'Admin', '14-04-2017', '06:22:53'),
('admin', 'Admin', '14-04-2017', '06:30:59'),
('admin', 'Admin', '14-04-2017', '07:19:33'),
('mark', 'Employee', '14-12-2017', '02:56:45'),
('admin', 'Admin', '15-01-2023', '02:26:53'),
('admin', 'Admin', '15-01-2023', '04:00:38'),
('admin', 'Admin', '15-01-2023', '11:35:09'),
('mark', 'Employee', '15-04-2017', '02:03:12'),
('admin', 'Admin', '15-04-2017', '02:47:28'),
('admin', 'Admin', '15-04-2017', '02:56:16'),
('admin', 'Admin', '15-04-2017', '03:06:20'),
('admin', 'Admin', '15-04-2017', '03:36:58'),
('admin', 'Admin', '15-04-2017', '03:42:44'),
('admin', 'Admin', '16-01-2023', '06:00:31'),
('admin', 'Admin', '16-01-2023', '06:00:54'),
('admin', 'Admin', '16-01-2023', '06:05:05'),
('admin', 'Admin', '16-01-2023', '06:06:34'),
('admin', 'Admin', '16-01-2023', '06:10:23'),
('admin', 'Admin', '16-01-2023', '06:38:27'),
('admin', 'Admin', '16-01-2023', '06:44:30'),
('admin', 'Admin', '16-01-2023', '06:51:09'),
('admin', 'Admin', '16-01-2023', '10:03:13'),
('admin', 'Admin', '17-01-2023', '03:35:49'),
('admin', 'Admin', '17-01-2023', '03:47:37'),
('admin', 'Admin', '17-01-2023', '03:58:00'),
('admin', 'Admin', '17-01-2023', '03:59:24'),
('admin', 'Admin', '17-01-2023', '04:15:43'),
('admin', 'Admin', '17-01-2023', '04:19:15'),
('admin', 'Admin', '17-01-2023', '04:28:26'),
('admin', 'Admin', '17-01-2023', '04:33:37'),
('admin', 'Admin', '17-01-2023', '04:43:16'),
('admin', 'Admin', '17-01-2023', '04:47:50'),
('admin', 'Admin', '17-01-2023', '04:48:36'),
('admin', 'Admin', '17-01-2023', '06:29:34'),
('admin', 'Admin', '17-01-2023', '07:15:57'),
('admin', 'Admin', '17-01-2023', '08:03:45'),
('admin', 'Admin', '17-01-2023', '08:08:20'),
('admin', 'Admin', '17-01-2023', '08:11:47'),
('admin', 'Admin', '17-01-2023', '08:29:49'),
('admin', 'Admin', '17-01-2023', '11:43:55'),
('admin', 'Admin', '17-01-2023', '11:48:04'),
('admin', 'Admin', '17-01-2023', '11:50:29'),
('admin', 'Admin', '17-01-2023', '12:34:36'),
('admin', 'Admin', '17-02-2017', '01:40:08'),
('admin', 'Admin', '17-02-2017', '10:30:24'),
('admin', 'Admin', '17-02-2017', '10:32:48'),
('mark', 'Employee', '17-02-2017', '10:32:56'),
('admin', 'Admin', '17-02-2017', '10:33:10'),
('mark', 'Employee', '17-02-2017', '10:33:37'),
('admin', 'Admin', '17-02-2017', '10:36:21'),
('admin', 'Admin', '17-02-2017', '10:36:53'),
('admin', 'Admin', '17-02-2017', '10:49:27'),
('admin', 'Admin', '17-02-2017', '11:02:23'),
('admin', 'Admin', '18-01-2023', '09:07:33'),
('admin', 'Admin', '18-01-2023', '12:01:39'),
('admin', 'Admin', '18-01-2023', '12:08:59'),
('Mark', 'Employee', '18-01-2023', '12:10:17'),
('admin', 'Admin', '18-02-2017', '10:50:29'),
('admin', 'Admin', '18-02-2017', '10:51:50'),
('admin', 'Admin', '18-02-2017', '10:53:33'),
('admin', 'Admin', '18-02-2017', '10:58:41'),
('admin', 'Admin', '18-02-2017', '11:15:39'),
('mark', 'Employee', '18-02-2017', '11:18:19'),
('admin', 'Admin', '18-02-2017', '11:23:25'),
('mark', 'Employee', '18-02-2017', '11:24:19'),
('mark', 'Employee', '19-09-2017', '06:10:07'),
('admin', 'Admin', '21-11-2017', '09:06:10'),
('admin', 'Admin', '21-11-2017', '09:15:39'),
('admin', 'Admin', '24-03-2018', '07:20:36'),
('admin', 'Admin', '24-03-2018', '08:47:14'),
('admin', 'Admin', '24-03-2018', '08:51:01'),
('mark', 'Employee', '24-03-2018', '08:52:17'),
('admin', 'Admin', '24-03-2018', '08:52:50'),
('admin', 'Admin', '25-01-2023', '10:26:42'),
('admin', 'Admin', '27-01-2023', '10:41:07'),
('admin', 'Admin', '27-05-2017', '03:53:36'),
('admin', 'Admin', '27-05-2017', '03:54:05'),
('admin', 'Admin', '27-05-2017', '04:05:04'),
('mark', 'Employee', '27-05-2017', '04:06:02'),
('admin', 'Admin', '29-01-2023', '01:02:14'),
('admin', 'Admin', '29-01-2023', '01:06:43'),
('admin', 'Admin', '29-01-2023', '01:10:47'),
('admin', 'Admin', '29-01-2023', '01:45:53'),
('Mark', 'Employee', '29-01-2023', '01:46:14'),
('Mark', 'Employee', '29-01-2023', '01:49:32'),
('admin', 'Admin', '29-01-2023', '08:42:24'),
('admin', 'Admin', '29-01-2023', '08:55:27'),
('admin', 'Admin', '29-01-2023', '08:57:04'),
('admin', 'Admin', '29-01-2023', '09:09:20'),
('admin', 'Admin', '29-01-2023', '09:17:38'),
('admin', 'Admin', '29-01-2023', '09:22:37'),
('admin', 'Admin', '29-01-2023', '09:35:12'),
('admin', 'Admin', '29-01-2023', '09:38:44'),
('admin', 'Admin', '29-01-2023', '09:40:57'),
('admin', 'Admin', '29-01-2023', '09:44:01'),
('admin', 'Admin', '30-01-2023', '03:31:32'),
('admin', 'Admin', '30-01-2023', '03:37:48'),
('admin', 'Admin', '30-01-2023', '08:00:02'),
('Mark', 'Employee', '30-01-2023', '08:03:40'),
('admin', 'Admin', '30-01-2023', '12:30:58'),
('admin', 'Admin', '30-01-2023', '12:49:19'),
('admin', 'Admin', '30-05-2017', '03:13:41'),
('admin', 'Admin', '31-05-2017', '10:57:35'),
('admin', 'Admin', '31-05-2017', '11:00:02'),
('admin', 'Admin', '31-05-2017', '11:06:32');

-- --------------------------------------------------------

--
-- Table structure for table `message_history`
--

CREATE TABLE `message_history` (
  `MESSAGE_FROM` varchar(20) NOT NULL,
  `MESSAGE_TO` varchar(20) NOT NULL,
  `MESSAGE_TEXT` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `message_history`
--

INSERT INTO `message_history` (`MESSAGE_FROM`, `MESSAGE_TO`, `MESSAGE_TEXT`) VALUES
('admin', 'Clark', 'Hello!'),
('Mark', 'Tony', 'Hey!\nPlease update the list of drugs soon');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `BARCODE` int(4) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `TYPE` varchar(20) NOT NULL,
  `COMPANY_NAME` varchar(20) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `PRICE` double NOT NULL,
  `AMOUNT` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`BARCODE`, `NAME`, `TYPE`, `COMPANY_NAME`, `QUANTITY`, `PRICE`, `AMOUNT`) VALUES
(4588, 'Mox Capsules', 'Pills', 'GSK', 3, 5, 15);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `BARCODE` int(4) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `TYPE` varchar(10) NOT NULL,
  `DOSE` varchar(10) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `PRICE` double NOT NULL,
  `AMOUNT` double NOT NULL,
  `DATE` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(2) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `DOB` date NOT NULL,
  `ADDRESS` varchar(100) NOT NULL,
  `PHONE` bigint(10) NOT NULL,
  `SALARY` double NOT NULL,
  `PASSWORD` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `NAME`, `DOB`, `ADDRESS`, `PHONE`, `SALARY`, `PASSWORD`) VALUES
(1, 'admin', '1971-04-01', 'Mangalore', 9845271270, 50000, 'admin'),
(2, 'Mark', '1976-05-20', 'Bangalore ', 9536258564, 2000, 'Mark'),
(3, 'Clark', '1999-06-12', 'Udupi', 7488563251, 4000, 'rootaccess'),
(4, 'Tony', '2000-10-28', 'Mangalore', 8525636965, 3000, 'rootaccess'),
(5, 'Sachin', '1975-07-03', 'Chennai', 9965236452, 15000, 'Sachin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`NAME`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`BARCODE`),
  ADD KEY `COMPANY_NAME` (`COMPANY_NAME`);

--
-- Indexes for table `history_sales`
--
ALTER TABLE `history_sales`
  ADD PRIMARY KEY (`USER_NAME`,`BARCODE`,`TIME`),
  ADD KEY `history_sales_ibfk_1` (`BARCODE`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`DATE`,`TIME`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`BARCODE`),
  ADD KEY `fkr3` (`COMPANY_NAME`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`BARCODE`,`AMOUNT`,`DATE`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `drugs`
--
ALTER TABLE `drugs`
  ADD CONSTRAINT `drugs_ibfk_1` FOREIGN KEY (`COMPANY_NAME`) REFERENCES `company` (`NAME`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `history_sales`
--
ALTER TABLE `history_sales`
  ADD CONSTRAINT `history_sales_ibfk_1` FOREIGN KEY (`BARCODE`) REFERENCES `drugs` (`BARCODE`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `fkr3` FOREIGN KEY (`COMPANY_NAME`) REFERENCES `company` (`NAME`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`BARCODE`) REFERENCES `drugs` (`BARCODE`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`BARCODE`) REFERENCES `drugs` (`BARCODE`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
