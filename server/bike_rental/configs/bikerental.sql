-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:5050
-- Generation Time: Jan 05, 2022 at 01:13 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bikerental`
--

-- --------------------------------------------------------

--
-- Table structure for table `bike`
--

CREATE TABLE `bike` (
  `id` int(11) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  `barcode` varchar(45) NOT NULL,
  `isRented` tinyint(4) DEFAULT NULL,
  `licenseplate` varchar(45) DEFAULT NULL,
  `deposite` int(11) DEFAULT NULL,
  `rentalPrice` int(11) DEFAULT NULL,
  `parkingId` int(11) DEFAULT NULL,
  `battery` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bike`
--

INSERT INTO `bike` (`id`, `category`, `barcode`, `isRented`, `licenseplate`, `deposite`, `rentalPrice`, `parkingId`, `battery`) VALUES
(1, 'XE_DAP_DON', 'EC0001', 0, 'XD1-01', 400, 5, 1, NULL),
(2, 'XE_DAP_DOI', 'EC0002', 0, 'XD2-01', 550, 10, 2, NULL),
(3, 'XE_DAP_DON', 'EC0003', 0, 'XD1-02', 400, 5, 1, NULL),
(4, 'XE_DAP_DON', 'EC0004', 0, 'XD1-03', 400, 5, 1, NULL),
(5, 'XE_DAP_DIEN', 'EC0009', 0, 'XDD-01', 700, 10, 1, 60);

-- --------------------------------------------------------

--
-- Table structure for table `parking`
--

CREATE TABLE `parking` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `area` double DEFAULT NULL,
  `num_single` int(11) DEFAULT NULL,
  `num_couple` int(11) DEFAULT NULL,
  `num_electric` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parking`
--

INSERT INTO `parking` (`id`, `name`, `address`, `area`, `num_single`, `num_couple`, `num_electric`) VALUES
(1, 'Bãi xe Hai Bà Trưng', '35 Trần Đại Nghĩa, Hà Nội', 30, 10, 5, 6),
(2, 'Bãi xe Hoàng Mai', '100 Hoàng Liệt, Hà Nội', 146.69, 100, 50, 13);

-- --------------------------------------------------------

--
-- Table structure for table `payment_transaction`
--

CREATE TABLE `payment_transaction` (
  `id` varchar(100) NOT NULL,
  `content` varchar(100) DEFAULT NULL,
  `method` varchar(100) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `bikeId` int(11) DEFAULT NULL,
  `invoiceId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rental_invoice`
--

CREATE TABLE `rental_invoice` (
  `id` int(11) NOT NULL,
  `totalPrice` int(11) DEFAULT NULL,
  `bikeId` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bike`
--
ALTER TABLE `bike`
  ADD PRIMARY KEY (`id`,`barcode`),
  ADD KEY `parkingId` (`parkingId`);

--
-- Indexes for table `parking`
--
ALTER TABLE `parking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_transaction`
--
ALTER TABLE `payment_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoiceId` (`invoiceId`);

--
-- Indexes for table `rental_invoice`
--
ALTER TABLE `rental_invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bikeId` (`bikeId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bike`
--
ALTER TABLE `bike`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `parking`
--
ALTER TABLE `parking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rental_invoice`
--
ALTER TABLE `rental_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bike`
--
ALTER TABLE `bike`
  ADD CONSTRAINT `bike_ibfk_1` FOREIGN KEY (`parkingId`) REFERENCES `parking` (`id`);

--
-- Constraints for table `payment_transaction`
--
ALTER TABLE `payment_transaction`
  ADD CONSTRAINT `payment_transaction_ibfk_1` FOREIGN KEY (`invoiceId`) REFERENCES `rental_invoice` (`id`);

--
-- Constraints for table `rental_invoice`
--
ALTER TABLE `rental_invoice`
  ADD CONSTRAINT `rental_invoice_ibfk_1` FOREIGN KEY (`bikeId`) REFERENCES `bike` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
