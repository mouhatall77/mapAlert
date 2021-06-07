-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 07, 2021 at 11:13 AM
-- Server version: 8.0.25
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crashes`
--

-- --------------------------------------------------------

--
-- Table structure for table `crashevent`
--

CREATE TABLE `crashevent` (
  `report_number` int NOT NULL,
  `crash_date` varchar(60) NOT NULL,
  `crash_time` time DEFAULT NULL,
  `county` varchar(80) NOT NULL,
  `city` varchar(80) NOT NULL,
  `investigating_agency` varchar(80) NOT NULL,
  `on_street` varchar(80) NOT NULL,
  `offset_feet` int DEFAULT NULL,
  `offset_direction` varchar(80) DEFAULT NULL,
  `from_intersecting_street` varchar(80) DEFAULT NULL,
  `crash_severity` varchar(80) NOT NULL,
  `lat` decimal(9,6) NOT NULL,
  `lng` decimal(9,6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `crashevent`
--

INSERT INTO `crashevent` (`report_number`, `crash_date`, `crash_time`, `county`, `city`, `investigating_agency`, `on_street`, `offset_feet`, `offset_direction`, `from_intersecting_street`, `crash_severity`, `lat`, `lng`) VALUES
(5000002, '05/01/2021', '03:58:00', 'Alachua', 'Gainesville', 'Florida Highway Patrol', 'SR-24', NULL, ' ', 'SW 34th Street', 'Serious Injury', '29.627061', '-82.372452'),
(5000003, '05/01/2021', '04:08:00', 'Alachua', 'Gainesville', 'Gainesville Police Department', 'SW 34th Street', 150, 'North', 'SW Archer Road', 'Injury', '29.627653', '-82.372440'),
(5000004, '05/01/2021', '05:15:00', 'Alachua', 'Unicorporated', 'Florida Highway Patrol', 'I-75', 3000, 'North', 'SR-24', 'Fatal', '29.623165', '-82.390096'),
(5000005, '05/01/2021', '06:11:00', 'Alachua', 'Unicorporated', 'Alachua County Sheriff\'s Office', '3970 SW Archer Road (Parking Lot)', NULL, '', '', 'Property Damage Only', '29.620315', '-82.384064');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `report_number` int NOT NULL,
  `vehicule_number` int NOT NULL,
  `person_number` int NOT NULL,
  `injury_severity` varchar(80) NOT NULL,
  `sex` char(1) NOT NULL,
  `age` int NOT NULL,
  `restraint_systems` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`report_number`, `vehicule_number`, `person_number`, `injury_severity`, `sex`, `age`, `restraint_systems`) VALUES
(5000001, 1, 1, 'None', 'M', 62, 'Shoulder & Lap Belts'),
(5000001, 2, 3, 'None', 'F', 26, 'Shoulder & Lap Belts'),
(5000002, 1, 1, 'Injury', 'F', 56, 'Lap Belt Only'),
(5000002, 2, 2, 'Serious Injury', 'M', 68, 'None Used'),
(5000003, 1, 1, 'None', 'M', 22, 'Shoulder & Lap Belts'),
(5000003, 2, 2, 'Injury', 'F', 19, 'Shoulder & Lap Belts'),
(5000004, 1, 1, 'Fatal', 'M', 29, 'None Used'),
(5000005, 1, 1, 'None', 'F', 18, 'Shoulder & Lap Belts'),
(5000005, 2, 2, 'None', 'M', 34, 'Shoulder & Lap Belts');

-- --------------------------------------------------------

--
-- Table structure for table `vehicule`
--

CREATE TABLE `vehicule` (
  `report_number` int NOT NULL,
  `vehicule_number` int NOT NULL,
  `year` int NOT NULL,
  `make` varchar(80) NOT NULL,
  `model` varchar(80) NOT NULL,
  `color` varchar(80) NOT NULL,
  `traveling_on_street` varchar(80) NOT NULL,
  `traveling_direction` varchar(80) NOT NULL,
  `maneuver` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vehicule`
--

INSERT INTO `vehicule` (`report_number`, `vehicule_number`, `year`, `make`, `model`, `color`, `traveling_on_street`, `traveling_direction`, `maneuver`) VALUES
(5000001, 1, 2017, 'HOND', 'ACCORD', 'WHT', 'NW 14th Street', 'North', 'Straight Ahead'),
(5000001, 2, 2020, 'TESL', 'MODEL S', 'RED', 'NW 2nd Avenue', 'West', 'Turning Left'),
(5000002, 1, 1968, 'PONT', 'FIREBIRD', 'WHT', 'SR-24', 'East', 'Turning Left'),
(5000002, 2, 1984, 'CHEV', 'CAMARO', 'BLU', 'SR-24', 'West', 'Straight Ahead'),
(5000003, 1, 2008, 'FORD', 'EXPEDITION', 'BLK', 'SW 34th Street', 'North', 'Straight Ahead'),
(5000003, 2, 2018, 'GMC', 'YUKON', 'GRN', 'SW 34th Street', 'North', 'Turning Right'),
(5000004, 1, 2016, 'FORD', 'TRANSIT', 'SIL', 'I-75', 'North', 'Straight Ahead'),
(5000004, 1, 2019, 'JEEP', 'CHEROKEE', 'BLK', 'Target Parking Lot', 'East', 'Backing'),
(5000004, 2, 2021, 'MERC', 'E300', 'WHT', 'Target Parking Lot', 'South', 'Straight Ahead');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `crashevent`
--
ALTER TABLE `crashevent`
  ADD PRIMARY KEY (`report_number`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD KEY `vehicule` (`report_number`,`vehicule_number`);

--
-- Indexes for table `vehicule`
--
ALTER TABLE `vehicule`
  ADD KEY `crashevent` (`report_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `crashevent`
--
ALTER TABLE `crashevent`
  MODIFY `report_number` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5000006;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
