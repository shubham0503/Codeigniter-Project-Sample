-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2018 at 12:18 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sbd_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `oem`
--

CREATE TABLE `oem` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oem`
--

INSERT INTO `oem` (`id`, `name`) VALUES
(1, 'Acura'),
(2, 'Audi');

-- --------------------------------------------------------

--
-- Table structure for table `oem_model`
--

CREATE TABLE `oem_model` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `oem_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `segment_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oem_model`
--

INSERT INTO `oem_model` (`id`, `oem_id`, `name`, `segment_name`) VALUES
(1, 1, 'ILX MY17', 'C-COMPACT'),
(2, 1, 'TLX MY17', 'D-MIDSIZE'),
(3, 1, 'RLX MY17', 'E-LARGE'),
(4, 1, 'RDX MY17', 'C-COMPACT'),
(5, 1, 'MDX MY17', 'D-MIDSIZE'),
(6, 1, 'NSX MY17', 'G-SPORTS'),
(7, 2, 'A3 MY17', 'C-COMPACT'),
(8, 2, 'A4 MY17', 'D-MIDSIZE'),
(9, 2, 'A6 MY17', 'E-LARGE'),
(10, 2, 'A7 MY17', 'G-SPORTS'),
(11, 2, 'A8 MY17', 'F-LARGE PLUS'),
(12, 2, 'Allroad MY17', 'SUV-SUV'),
(13, 2, 'Q3 MY17', 'C-COMPACT'),
(14, 2, 'Q5 MY17', 'SUV-SUV'),
(15, 2, 'Q7 MY17', 'SUV-SUV'),
(16, 2, 'TT MY17', 'G-SPORTS'),
(17, 2, 'R8 MY17', 'G-SPORTS'),
(18, 2, 'A5 Coupe MY18', 'G-SPORTS'),
(19, 2, 'S5 Coupe MY18', 'G-SPORTS'),
(20, 2, 'S4 MY18', 'D-MIDSIZE');

-- --------------------------------------------------------

--
-- Table structure for table `oem_variant_deails`
--

CREATE TABLE `oem_variant_deails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `oem_model_id` bigint(20) UNSIGNED NOT NULL,
  `variant` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `head_units` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `head_unit_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `standard` enum('0','Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Y for Yes , N for No',
  `stand_alone` enum('0','Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Y for Yes , N for No',
  `pack` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `central_controller` enum('0','Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Y for Yes , N for No',
  `touch_screen` enum('0','Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Y for Yes , N for No',
  `handwriting_recognition` enum('0','Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Y for Yes , N for No',
  `proxy` enum('0','Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Y for Yes , N for No',
  `carplay` enum('0','Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Y for Yes , N for No',
  `android_auto` enum('0','Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Y for Yes , N for No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oem_variant_deails`
--

INSERT INTO `oem_variant_deails` (`id`, `oem_model_id`, `variant`, `head_units`, `head_unit_type`, `standard`, `stand_alone`, `pack`, `central_controller`, `touch_screen`, `handwriting_recognition`, `proxy`, `carplay`, `android_auto`) VALUES
(1, 1, 'ILX - Base', 'Acura Display Audio System', 'Display Audio', 'Y', '0', '', 'Y', '0', '0', 'Y', '0', '0'),
(2, 1, 'ILX with AcuraWatch Plus', 'Acura Display Audio System', 'Display Audio', 'Y', '0', '', 'Y', '0', '0', 'Y', '0', '0'),
(3, 1, 'ILX with Premium Package', 'Acura Display Audio with Navigation System', 'Display Audio with Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(4, 1, 'ILX with Premium and A-SPEC Package', 'Acura Display Audio with Navigation System', 'Display Audio with Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(5, 1, 'ILX with Technology Plus Package', 'Acura Navigation System', 'Embedded Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(6, 1, 'ILX with Technology Plus and A-SPEC Package', 'Acura Navigation System', 'Embedded Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(7, 2, 'TLX', 'Acura Display Audio System (Touchscreen)', 'Display Audio', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(8, 2, 'TLX with Technology Package', 'Acura Navigation System', 'Embedded Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(9, 2, 'TLX V-6', 'Acura Display Audio System (Touchscreen)', 'Display Audio', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(10, 2, 'TLXV-6 with Technology pack', 'Acura Navigation System', 'Embedded Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(11, 2, 'TLX V-6 with Advance pack', 'Acura Navigation System', 'Acura Navigation System', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(12, 2, 'TLX V-6 SH-AWD with Technology pack', 'Acura Navigation System', 'Embedded Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(13, 2, 'TLX V-6 SH-AWD with Advance pack', 'Acura Navigation System', 'Embedded Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(14, 3, 'RLX with Technology Package', 'Acura Navigation System', 'Embedded Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(15, 3, 'RLX with Advance Package', 'Acura Navigation System', 'Embedded Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(16, 3, 'RLX Sport Hybrid SH-AWD with Technology Package', 'Acura Navigation System', 'Acura Navigation System', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(17, 3, 'RLX Sport Hybrid SH-AWD with Advance Package', 'Acura Navigation System', 'Embedded Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(18, 4, 'RDX - Base', 'Acura Display Audio System', 'Display Audio', 'Y', '0', '', 'Y', '0', '0', 'Y', '0', '0'),
(19, 4, 'RDX  with Acura watch Plus (Also AWD)', 'Acura Display Audio System', 'Display Audio', 'Y', '0', '', 'Y', '0', '0', 'Y', '0', '0'),
(20, 4, 'RDX  with Technology Package (Also AWD)', 'Acura Navigation System', 'Embedded Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(21, 4, 'RDX  with Technology and AcuraWatch Plus Packages (Also AWD)', 'Acura Navigation System', 'Embedded Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(22, 4, 'RDX  with Advance Package (Also AWD)', 'Acura Navigation System', 'Embedded Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(23, 5, 'MDX', 'Acura Display Audio System (Touchscreen)', 'Display Audio', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(24, 5, 'MDX with Technology Pack', 'Acura Navigation System', 'Embedded Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(25, 5, 'MDX with Technology & Entertainment Pack', 'Acura Navigation System', 'Embedded Navigation', '0', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(26, 5, 'MDX with Advance Pack', 'Acura Navigation System', 'Embedded Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(27, 5, 'MDX with Advanced & Entertainment Pack', 'Acura Navigation System', 'Embedded Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(28, 5, 'MDX SH-AWD', 'Acura Display Audio System (Touchscreen)', 'Display Audio', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(29, 5, 'MDX SH-AWD with Technology Pack', 'Acura Navigation System', 'Embedded Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(30, 5, 'MDX SH-AWD with Technology & Entertainment Pack', 'Acura Navigation System', 'Embedded Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(31, 5, 'MDX SH-AWD with Advance Pack', 'Acura Navigation System', 'Embedded Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(32, 5, 'MDX SH-AWD with Advanced & Entertainment Pack', 'Acura Navigation System', 'Embedded Navigation', 'Y', '0', '', 'Y', 'Y', '0', 'Y', '0', '0'),
(33, 6, 'NSX - Base', 'Acura Audio System (CP-AA)', 'Display Audio with Navigation', 'Y', '0', '', '0', 'Y', '0', '', 'Y', 'Y'),
(34, 6, 'NSX - Base', 'AcuraLink Navigation System (CP-AA)', 'Embedded Navigation', '0', '0', '$2800-$3000', '0', 'Y', '0', 'Y', 'Y', 'Y'),
(35, 7, 'Premium', 'Audi Concert Radio - 1', 'Display Audio', 'Y', '0', '', 'Y', '0', '0', '', '0', '0'),
(36, 7, 'Premium', 'Audi Concert Radio (CP-AA) - 1', 'Display Audio with Navigation', '0', '0', '$900', 'Y', '0', '0', '', 'Y', 'Y'),
(37, 7, 'Premium Plus', 'Audi Concert Radio (CP-AA) - 1', 'Display Audio with Navigation', 'Y', '0', '', 'Y', '0', '0', '', 'Y', 'Y'),
(38, 7, 'Premium Plus', 'MMI Navigation Plus (CP-AA) - 4', 'Embedded Navigation', '0', '0', '3000$', 'Y', '0', 'Y', 'Y', 'Y', 'Y'),
(39, 7, 'Prestige', 'MMI Navigation Plus (CP-AA) - 4', 'Embedded Navigation', 'Y', '0', '', 'Y', '0', 'Y', 'Y', 'Y', 'Y'),
(40, 7, 'A3 Sportback e-tron - Premium', 'Audi Concert Radio - 1', 'Display Audio', 'Y', '0', '', 'Y', '0', '0', '', '0', '0'),
(41, 7, 'A3 Sportback e-tron - Premium Plus', 'Audi Concert Radio - 1', 'Display Audio', 'Y', '0', '', 'Y', '0', '0', '', '0', '0'),
(42, 7, 'A3 Sportback e-tron - Premium Plus', 'MMI Navigation Plus (CP-AA) - 4', 'Embedded Navigation', '0', '0', '$3150', 'Y', '0', 'Y', 'Y', 'Y', 'Y'),
(43, 7, 'A3 Sportback e-tron - Prestige', 'MMI Navigation Plus (CP-AA) - 4', 'Embedded Navigation', 'Y', '0', '', 'Y', '0', 'Y', 'Y', 'Y', 'Y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oem`
--
ALTER TABLE `oem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oem_model`
--
ALTER TABLE `oem_model`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oem_id` (`oem_id`);

--
-- Indexes for table `oem_variant_deails`
--
ALTER TABLE `oem_variant_deails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oem_model_id` (`oem_model_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oem`
--
ALTER TABLE `oem`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oem_model`
--
ALTER TABLE `oem_model`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `oem_variant_deails`
--
ALTER TABLE `oem_variant_deails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `oem_model`
--
ALTER TABLE `oem_model`
  ADD CONSTRAINT `oem_model_ibfk_1` FOREIGN KEY (`oem_id`) REFERENCES `oem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oem_variant_deails`
--
ALTER TABLE `oem_variant_deails`
  ADD CONSTRAINT `oem_variant_deails_ibfk_1` FOREIGN KEY (`oem_model_id`) REFERENCES `oem_model` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
