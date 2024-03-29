-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2021 at 08:19 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `fundergui`
--

CREATE TABLE `fundergui` (
  `funderID` int(255) NOT NULL,
  `funderName` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `funderEmail` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `funderTel` int(10) NOT NULL,
  `funderGender` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `funderDonation` int(255) NOT NULL,
  `funderDesc` varchar(255) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fundergui`
--

INSERT INTO `fundergui` (`funderID`, `funderName`, `funderEmail`, `funderTel`, `funderGender`, `funderDonation`, `funderDesc`) VALUES
(1, 'KA', 'KA@agafs', 77556253, 'Male', 255555, 'skjll dndj sjfs jgbfs'),
(12, 'ksdasd', 'sjaffg', 5451323, 'sdjhf', 323, 'saffa'),
(13, 'asdas', 'sdada', 5555, 'adasda', 555, 'dsada'),
(14, 'asdas', 'sdada', 5555, 'adasda', 555, 'dsadada');

-- --------------------------------------------------------

--
-- Table structure for table `funders`
--

CREATE TABLE `funders` (
  `funderID` int(255) NOT NULL,
  `funderName` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `funderEmail` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `funderTel` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `funderGender` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `funderDonation` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `funderDesc` varchar(255) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `funders`
--

INSERT INTO `funders` (`funderID`, `funderName`, `funderEmail`, `funderTel`, `funderGender`, `funderDonation`, `funderDesc`) VALUES
(1, 'Isuru', 'isuru@dsm', '0775862535', 'male', '50000.0', 'donation to the robotic research'),
(2, 'saman', 'saman@dsm', '0775555835', 'male', '600000.0', 'fund donation to the robotic research'),
(3, 'kasun', 'kasun@dsm', '0706555835', 'male', '400000.0', 'many fund donation to the robotic research'),
(4, 'Nuwani', 'Nuwani@dsm', '0725655835', 'female', '145222.0', ' to the many fund donation to the robotic research');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fundergui`
--
ALTER TABLE `fundergui`
  ADD PRIMARY KEY (`funderID`);

--
-- Indexes for table `funders`
--
ALTER TABLE `funders`
  ADD PRIMARY KEY (`funderID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fundergui`
--
ALTER TABLE `fundergui`
  MODIFY `funderID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `funders`
--
ALTER TABLE `funders`
  MODIFY `funderID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
