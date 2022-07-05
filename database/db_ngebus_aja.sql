-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 05, 2022 at 05:33 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ngebus_aja`
--

-- --------------------------------------------------------

--
-- Table structure for table `agency`
--

CREATE TABLE `agency` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `owner_user_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agency`
--

INSERT INTO `agency` (`id`, `code`, `details`, `name`, `owner_user_id`) VALUES
(1, 'MDN', 'Padang - Palembang', 'farhan', 1),
(2, 'JKT', 'Serang - Bandung', 'John', 2),
(3, 'BKS', 'Serang - Cikarang', 'Karen', 3),
(4, 'MDN', 'Padang - Palembang', 'Sinar Jaya', 1),
(5, 'MDN', 'Jambi - Aceh', 'joko', 4),
(6, 'mdn', 'mdn - serang', 'Farhan', 5);

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `id` bigint(20) NOT NULL,
  `capacity` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `agency_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id`, `capacity`, `code`, `make`, `agency_id`) VALUES
(1, 20, 'BDL01', '20', 1),
(2, 15, 'BDL02', '15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `flyway_schema_history`
--

CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flyway_schema_history`
--

INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES
(1, '1', '<< Flyway Baseline >>', 'BASELINE', '<< Flyway Baseline >>', NULL, 'root', '2022-06-28 10:06:42', 0, 1),
(2, '1.1', 'insert bus', 'SQL', 'V1.1__insert_bus.sql', -323711555, 'root', '2022-06-28 10:06:42', 3, 1),
(3, '1.2', 'insert role', 'SQL', 'V1.2__insert_role.sql', -555065487, 'root', '2022-06-28 10:06:42', 2, 1),
(4, '1.3', 'insert stop', 'SQL', 'V1.3__insert_stop.sql', -297623919, 'root', '2022-06-28 10:06:42', 1, 1),
(5, '1.4', 'insert trip', 'SQL', 'V1.4__insert_trip.sql', 0, 'root', '2022-06-28 10:06:42', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'ROLE_USER'),
(2, 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `stop`
--

CREATE TABLE `stop` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stop`
--

INSERT INTO `stop` (`id`, `code`, `detail`, `name`) VALUES
(1, '1-2', 'Teluk', 'Karang'),
(2, '1-8', 'Cimeng', 'Sukaraja 1-8'),
(3, '1-3', 'Raja BasaI', 'Kedaton 1-3'),
(4, '1-2', 'Sukabumi', 'Sukarame 1-2'),
(5, '1-10', 'A Yani', 'halte bus A Yani');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` bigint(20) NOT NULL,
  `cancellable` bit(1) DEFAULT NULL,
  `journey_date` varchar(255) DEFAULT NULL,
  `seat_number` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `trip_schedule_id` bigint(20) DEFAULT NULL,
  `passenger_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

CREATE TABLE `trip` (
  `id` bigint(20) NOT NULL,
  `fare` int(11) NOT NULL,
  `journey_time` int(11) NOT NULL,
  `agency_id` bigint(20) DEFAULT NULL,
  `bus_id` bigint(20) DEFAULT NULL,
  `dest_stop_id` bigint(20) DEFAULT NULL,
  `source_stop_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `trip_schedule`
--

CREATE TABLE `trip_schedule` (
  `id` bigint(20) NOT NULL,
  `available_seats` int(11) NOT NULL,
  `trip_date` varchar(255) DEFAULT NULL,
  `trip_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `first_name` varchar(120) DEFAULT NULL,
  `last_name` varchar(120) DEFAULT NULL,
  `mobile_number` varchar(120) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `mobile_number`, `password`, `username`) VALUES
(1, 'farhan@gmail.com', 'farhan', 'ilhamdi', '0811223344', '$2a$10$irXUiNesnqyWjhoeiysGXuhWP8xcjdIxUJ3o1v7CH8x9Q5gxej9ky', 'farlhmd'),
(2, 'johndoe@gmail.com', 'John', 'Doe', '081111111', '$2a$10$vgtRQZF/oX0tiAV8Lelt3uLHFD7dUnDther74qh5h9H4kg3L.vET.', 'johndoe'),
(3, 'karen@gmail.com', 'Nobita', 'Chan', '0811992233', '$2a$10$XpZmBEUtQpT7pBdfUcZM9.WJL1fDFSndM72irwlXZwqxjYZMh6cBO', 'karendoe'),
(4, 'joko@gmail.com', 'Joko', 'Handoyo', '0811223344', '$2a$10$aMkwm9Wo/dPCFKbmBmyx2.osnv3ffXWYefu9kdSAyFhb6DcupPQ.y', 'joko');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(5, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8y56hykf78k5u3wmutny52wcf` (`owner_user_id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK64nil2xxuhqde813s57dp1n9t` (`agency_id`);

--
-- Indexes for table `flyway_schema_history`
--
ALTER TABLE `flyway_schema_history`
  ADD PRIMARY KEY (`installed_rank`),
  ADD KEY `flyway_schema_history_s_idx` (`success`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stop`
--
ALTER TABLE `stop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKk5tv3bg4g8k4lwvnp5d9q34eq` (`passenger_id`),
  ADD KEY `FKdvt57mcco3ogsosi97odw563o` (`user_id`),
  ADD KEY `FKfhudhsxbslgtmbrbkd3uak4ha` (`trip_schedule_id`);

--
-- Indexes for table `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKab03gksoo5t3lo12ga3ixnykk` (`agency_id`),
  ADD KEY `FKptvi61dd1hao1yig3in0gvcjs` (`bus_id`),
  ADD KEY `FK1evbxrekvflflkfscj2i0fwv0` (`dest_stop_id`),
  ADD KEY `FK5ln8w8n974euslk976dh6x7k5` (`source_stop_id`);

--
-- Indexes for table `trip_schedule`
--
ALTER TABLE `trip_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKaqjflucdvoypakmjxtb7n2mmm` (`trip_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKsb8bbouer5wak8vyiiy4pf2bx` (`username`),
  ADD UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKf2ksd6h8hsjtd57ipfq9myr64` (`username`) USING HASH,
  ADD UNIQUE KEY `UKgnu0k8vv6ptioedbxbfsnan9g` (`email`) USING HASH;

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agency`
--
ALTER TABLE `agency`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stop`
--
ALTER TABLE `stop`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trip`
--
ALTER TABLE `trip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trip_schedule`
--
ALTER TABLE `trip_schedule`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
