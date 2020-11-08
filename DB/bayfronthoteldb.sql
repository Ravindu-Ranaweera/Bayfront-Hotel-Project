-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2020 at 03:25 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bayfronthoteldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` tinytext NOT NULL,
  `last_name` tinytext NOT NULL,
  `location` tinytext NOT NULL,
  `contact_number` tinytext NOT NULL,
  `date_of_birth` tinytext NOT NULL,
  `age` int(3) NOT NULL,
  `email` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `location`, `contact_number`, `date_of_birth`, `age`, `email`) VALUES
(1, 'Himasha', 'Anjali', 'Colombo-SriLanka', '077123456', '1998-03-17', 22, 'anjali@gmail.com'),
(46, 'Thanuj', 'Dasun', 'Gonapura-Galle', '0774664827', '2000-10-21', 20, 'dasun@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `owner_user_id` int(11) NOT NULL,
  `first_name` tinytext NOT NULL,
  `last_name` tinytext NOT NULL,
  `email` tinytext NOT NULL,
  `salary` tinytext NOT NULL,
  `location` tinytext NOT NULL,
  `contact_num` tinytext NOT NULL,
  `is_deleted` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `owner_user_id`, `first_name`, `last_name`, `email`, `salary`, `location`, `contact_num`, `is_deleted`) VALUES
(1, 2, 'Tharindu', 'Gihan', 'tharindu@gmail.com', '75000', 'Poddala,Galle', '0778522736', 1),
(2, 2, 'Ravindu', 'Ranaweera', 'rane@gmail.com', '75000', 'Weligam,Matara', '077456125', 0),
(4, 2, 'WT', 'Gihan', 'wtgiihan@gmail.com', '75000', 'Imaduwa Galle', '0774851268', 1),
(5, 2, 'Tharindu', 'Wanigasekara', 'anura@gmail.com', '75000', 'Imaduwa Galle', '0774851268', 1),
(6, 2, 'Lorem', 'Ipsum', 'thegoodstory1998@gmail.com', '75000', 'Imaduwa', '0774561255', 1),
(7, 2, 'Himasha', 'Anjali', 'anjai@gmail.com', '65000', 'Mulleriayawa', '077455885', 0),
(8, 2, 'Lorem', 'Wanigasekara', 'anura@gmail.com', '75000', 'Imaduwa Galle', '0774558852', 0),
(9, 2, 'Tharindu', 'Malkan', 'anura@gmail.com', '75000', 'Imaduwa Galle', '07748512688', 1),
(10, 2, 'Tharindu', 'Wanigasekara', 'anura@gmail.com', '75000', 'Imaduwa Galle', '07748512688', 1);

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `owner_user_id` int(11) NOT NULL,
  `username` tinytext NOT NULL,
  `email` tinytext NOT NULL,
  `password` longtext NOT NULL,
  `user_level` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`owner_user_id`, `username`, `email`, `password`, `user_level`) VALUES
(2, 'WTGihan', 'wtgihan@gmail.com', '011c945f30ce2cbafc452f39840f025693339c42', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name_of_card` tinytext NOT NULL,
  `credit_card_number` tinytext NOT NULL,
  `expire_month` tinytext NOT NULL,
  `expire_year` tinytext NOT NULL,
  `cvv` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `reservation_id`, `customer_id`, `name_of_card`, `credit_card_number`, `expire_month`, `expire_year`, `cvv`) VALUES
(1, 81, 46, 'Visa', '1234-4567-6987-2586', '12', '2023', '123');

-- --------------------------------------------------------

--
-- Table structure for table `reception`
--

CREATE TABLE `reception` (
  `reception_user_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `user_level` int(11) NOT NULL,
  `username` tinytext NOT NULL,
  `password` longtext NOT NULL,
  `email` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reception`
--

INSERT INTO `reception` (`reception_user_id`, `emp_id`, `user_level`, `username`, `password`, `email`) VALUES
(1, 1, 2, 'Tharindu', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'wtgihan@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `reception_user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `no_of_guest` int(11) NOT NULL,
  `is_valid` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `customer_id`, `reception_user_id`, `room_id`, `check_in_date`, `check_out_date`, `no_of_guest`, `is_valid`) VALUES
(81, 46, 1, 2, '2020-03-12', '2020-03-17', 5, 0),
(88, 46, 1, 2, '2020-11-01', '2020-11-05', 5, 1),
(89, 1, 1, 1, '2020-09-30', '2020-10-03', 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `room_type_id` int(11) NOT NULL,
  `room_number` tinytext NOT NULL,
  `is_booked` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `room_type_id`, `room_number`, `is_booked`) VALUES
(1, 1, 'B102', 0),
(2, 1, 'B103', 1),
(3, 1, 'B104', 0);

-- --------------------------------------------------------

--
-- Table structure for table `room_discount`
--

CREATE TABLE `room_discount` (
  `discount_id` int(11) NOT NULL,
  `room_type_id` int(11) NOT NULL,
  `discount_rate` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_discount`
--

INSERT INTO `room_discount` (`discount_id`, `room_type_id`, `discount_rate`, `start_date`, `end_date`) VALUES
(1, 1, 10, '2020-10-10', '2020-10-30');

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `room_type_id` int(11) NOT NULL,
  `floor_number` int(11) NOT NULL,
  `max_guest` int(11) NOT NULL,
  `facilites` varchar(255) DEFAULT NULL,
  `room_price` tinytext NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_name` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_type`
--

INSERT INTO `room_type` (`room_type_id`, `floor_number`, `max_guest`, `facilites`, `room_price`, `description`, `type_name`) VALUES
(1, 2, 4, 'Free Wifi and Free Breakfast', '$100', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Vitae, commodi!', 'Single');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `owner_user_id` (`owner_user_id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`owner_user_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indexes for table `reception`
--
ALTER TABLE `reception`
  ADD PRIMARY KEY (`reception_user_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `reception_user_id` (`reception_user_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `room_type_id` (`room_type_id`);

--
-- Indexes for table `room_discount`
--
ALTER TABLE `room_discount`
  ADD PRIMARY KEY (`discount_id`),
  ADD KEY `room_type_id` (`room_type_id`);

--
-- Indexes for table `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`room_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `owner_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reception`
--
ALTER TABLE `reception`
  MODIFY `reception_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `room_discount`
--
ALTER TABLE `room_discount`
  MODIFY `discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `room_type`
--
ALTER TABLE `room_type`
  MODIFY `room_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`owner_user_id`) REFERENCES `owner` (`owner_user_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints for table `reception`
--
ALTER TABLE `reception`
  ADD CONSTRAINT `reception_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`reception_user_id`) REFERENCES `reception` (`reception_user_id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`room_type_id`);

--
-- Constraints for table `room_discount`
--
ALTER TABLE `room_discount`
  ADD CONSTRAINT `room_discount_ibfk_1` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`room_type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
