-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2021 at 07:04 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emp_dept`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dno` int(3) NOT NULL,
  `dname` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT 'New Delhi'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dno`, `dname`, `location`) VALUES
(10, 'Accounting', 'New York'),
(20, 'Research', 'Dallas'),
(30, 'Sales', 'Chicago'),
(40, 'Operation', 'Boston'),
(50, 'Purchase', 'New Delhi');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `eno` char(3) NOT NULL,
  `ename` varchar(50) NOT NULL,
  `job_type` varchar(50) NOT NULL,
  `supervisonENO` char(3) DEFAULT NULL,
  `Hire_date` date NOT NULL,
  `Dno` int(3) DEFAULT NULL,
  `Commission` decimal(10,2) DEFAULT NULL,
  `Salary` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`eno`, `ename`, `job_type`, `supervisonENO`, `Hire_date`, `Dno`, `Commission`, `Salary`) VALUES
('736', 'Smith', 'Clerk', '790', '1981-12-17', 20, '0.00', '1000.00'),
('749', 'Allan', 'Sales_man', '769', '1981-02-20', 30, '300.00', '2000.00'),
('752', 'Ward', 'Sales_man', '769', '1981-02-22', 30, '500.00', '1300.00'),
('756', 'Jones', 'Manager', '783', '1981-04-02', 20, '0.00', '2300.00'),
('765', 'Martin', 'Sales_man', '784', '1981-04-22', 30, '1400.00', '1250.00'),
('769', 'Blake', 'Manager', '783', '1981-05-01', 30, '0.00', '2870.00'),
('778', 'Clark', 'Manager', '783', '1981-06-09', 10, '0.00', '2900.00'),
('783', 'King', 'President', NULL, '1981-11-17', 10, '0.00', '2950.00'),
('784', 'Turner', 'Sales_man', '769', '1981-09-08', 30, '0.00', '1450.00'),
('787', 'Adams', 'Clerk', '778', '1983-01-12', 20, '0.00', '1150.00'),
('788', 'Scott', 'Analyst', '756', '1982-12-09', 20, '0.00', '2850.00'),
('790', 'James', 'Clerk', '769', '1981-12-03', 30, '0.00', '950.00'),
('792', 'Ford', 'Analyst', '756', '1981-12-03', 20, '0.00', '2600.00'),
('793', 'Miller', 'Clerk', '788', '1982-01-23', 40, '0.00', '1300.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dno`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`eno`),
  ADD KEY `Dno` (`Dno`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Dno`) REFERENCES `department` (`dno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
