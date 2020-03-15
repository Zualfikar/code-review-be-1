-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 15. Mrz 2020 um 04:16
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_zolfi`
--
CREATE DATABASE IF NOT EXISTS `cr09_zolfi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr09_zolfi`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(10) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`) VALUES
(1, 'karlos', 'zobrek'),
(2, 'mark', 'zorbek'),
(3, 'ali', 'hasan'),
(4, 'micha', 'müller'),
(5, 'manuel', 'hoffer'),
(6, 'john', 'smeth');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `date`
--

CREATE TABLE `date` (
  `date_id` int(10) NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `recieve_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `date`
--

INSERT INTO `date` (`date_id`, `delivery_date`, `recieve_date`) VALUES
(1, '2020-03-11', '2020-03-19'),
(2, '2020-03-01', '2020-03-11'),
(3, '2020-03-17', '2020-03-26'),
(4, '2020-03-24', '2020-03-30'),
(5, '2020-02-02', '2020-02-11'),
(6, '2020-02-18', '2020-03-27');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `description`
--

CREATE TABLE `description` (
  `description_id` int(10) NOT NULL,
  `fk_employee_id` int(10) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `department` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `description`
--

INSERT INTO `description` (`description_id`, `fk_employee_id`, `salary`, `department`) VALUES
(1, 1, 2000, 'recieve'),
(2, 2, 2000, 'recieve'),
(3, 3, 3000, 'process'),
(4, 4, 3000, 'transport');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(10) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`) VALUES
(1, 'zolfi', 'hasan'),
(2, 'katharina', 'hanz'),
(3, 'chris', 'lodvich'),
(4, 'folvia', 'italiano');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location`
--

CREATE TABLE `location` (
  `location_id` int(10) NOT NULL,
  `street` varchar(40) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `zip` int(10) DEFAULT NULL,
  `house_number` int(10) DEFAULT NULL,
  `fk_customer_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `location`
--

INSERT INTO `location` (`location_id`, `street`, `city`, `zip`, `house_number`, `fk_customer_id`) VALUES
(1, 'springergasse', 'vienna', 1020, 19, 1),
(2, 'landstrasse', 'vienna', 1030, 21, 2),
(3, 'darwingasse', 'vienna', 1020, 36, 3),
(4, 'mührengasse', 'vienna', 1100, 13, 4),
(5, 'zichystrasse', 'vienna', 1140, 3, 5),
(6, 'münzergasse', 'vienna', 1150, 39, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package`
--

CREATE TABLE `package` (
  `package_id` int(10) NOT NULL,
  `fk_date_id` int(10) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `package`
--

INSERT INTO `package` (`package_id`, `fk_date_id`, `weight`) VALUES
(1, 1, 360),
(2, 2, 670),
(3, 3, 281),
(4, 4, 115),
(5, 5, 511),
(6, 6, 432);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payments`
--

CREATE TABLE `payments` (
  `payments_id` int(10) NOT NULL,
  `check_in` varchar(1) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `fk_customer_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `payments`
--

INSERT INTO `payments` (`payments_id`, `check_in`, `amount`, `payment_date`, `fk_customer_id`) VALUES
(1, 'f', 3, '2020-03-03', 1),
(2, 't', 23, '2020-02-02', 2),
(3, 'f', 53, '2020-03-11', 3),
(4, 'f', 44, '2020-05-01', 4),
(5, 't', 31, '2019-12-10', 5),
(6, 'f', 67, '2020-09-03', 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `process`
--

CREATE TABLE `process` (
  `process_id` int(10) NOT NULL,
  `fk_package_id` int(10) DEFAULT NULL,
  `fk_employee_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `process`
--

INSERT INTO `process` (`process_id`, `fk_package_id`, `fk_employee_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 1),
(6, 6, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recieve`
--

CREATE TABLE `recieve` (
  `recieve_id` int(10) NOT NULL,
  `fk_customer_id` int(10) DEFAULT NULL,
  `fk_package_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `recieve`
--

INSERT INTO `recieve` (`recieve_id`, `fk_customer_id`, `fk_package_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `transport`
--

CREATE TABLE `transport` (
  `transport_id` int(10) NOT NULL,
  `fk_package_id` int(10) DEFAULT NULL,
  `fk_customer_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `transport`
--

INSERT INTO `transport` (`transport_id`, `fk_package_id`, `fk_customer_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indizes für die Tabelle `date`
--
ALTER TABLE `date`
  ADD PRIMARY KEY (`date_id`);

--
-- Indizes für die Tabelle `description`
--
ALTER TABLE `description`
  ADD PRIMARY KEY (`description_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indizes für die Tabelle `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_date_id` (`fk_date_id`);

--
-- Indizes für die Tabelle `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payments_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `process`
--
ALTER TABLE `process`
  ADD PRIMARY KEY (`process_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`),
  ADD KEY `fk_package_id` (`fk_package_id`);

--
-- Indizes für die Tabelle `recieve`
--
ALTER TABLE `recieve`
  ADD PRIMARY KEY (`recieve_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_package_id` (`fk_package_id`);

--
-- Indizes für die Tabelle `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`transport_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_package_id` (`fk_package_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `date`
--
ALTER TABLE `date`
  MODIFY `date_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `description`
--
ALTER TABLE `description`
  MODIFY `description_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `payments`
--
ALTER TABLE `payments`
  MODIFY `payments_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `process`
--
ALTER TABLE `process`
  MODIFY `process_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `recieve`
--
ALTER TABLE `recieve`
  MODIFY `recieve_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `transport`
--
ALTER TABLE `transport`
  MODIFY `transport_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `recieve` (`recieve_id`);

--
-- Constraints der Tabelle `description`
--
ALTER TABLE `description`
  ADD CONSTRAINT `description_ibfk_1` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints der Tabelle `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_date_id`) REFERENCES `date` (`date_id`);

--
-- Constraints der Tabelle `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `process`
--
ALTER TABLE `process`
  ADD CONSTRAINT `process_ibfk_1` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `process_ibfk_2` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`);

--
-- Constraints der Tabelle `recieve`
--
ALTER TABLE `recieve`
  ADD CONSTRAINT `recieve_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `recieve_ibfk_2` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`);

--
-- Constraints der Tabelle `transport`
--
ALTER TABLE `transport`
  ADD CONSTRAINT `transport_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `transport_ibfk_2` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
