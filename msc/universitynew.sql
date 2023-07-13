-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2023 at 05:13 PM
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
-- Database: `universitynew`
--

-- --------------------------------------------------------

--
-- Table structure for table `advisor`
--

CREATE TABLE `advisor` (
  `S_ID` int(11) NOT NULL,
  `I_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `advisor`
--

INSERT INTO `advisor` (`S_ID`, `I_ID`) VALUES
(1, 1),
(15, 1),
(21, 1),
(3, 2),
(8, 2),
(14, 2),
(24, 2),
(25, 2),
(12, 3),
(13, 3),
(2, 4),
(9, 4),
(30, 5),
(5, 6),
(20, 6),
(4, 7),
(10, 7),
(22, 7),
(23, 7),
(18, 8),
(16, 9),
(27, 9),
(26, 10),
(6, 11),
(11, 11),
(7, 12),
(29, 12),
(17, 13),
(19, 13),
(28, 13);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `Course_ID` varchar(8) NOT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `Dept_name` varchar(20) DEFAULT NULL,
  `Credits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Course_ID`, `Title`, `Dept_name`, `Credits`) VALUES
('BS', 'BS Statistics', 'Statistics', 300),
('BSB', 'BS Botany', 'Botany', 300),
('BSc', 'BSc Mathematics', 'Mathematics', 260),
('MA', 'MA English', 'Literature', 120),
('MS', 'MSc Computer Science', 'Computer Science', 140),
('MTech', 'MTech CS', 'Computer Science', 150);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Dept_name` varchar(20) NOT NULL,
  `Building` varchar(15) DEFAULT NULL,
  `Budget` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Dept_name`, `Building`, `Budget`) VALUES
('Botany', 'LT-4', '20000000.00'),
('Computer Science', 'LT-1', '10000000.00'),
('Literature', 'LT-3', '50000000.00'),
('Mathematics', 'LT-2', '40000000.00'),
('Statistics', 'LT-1', '9000000.00');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `ID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Dept_name` varchar(20) NOT NULL,
  `Salary` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`ID`, `Name`, `Dept_name`, `Salary`) VALUES
(1, 'Vikas', 'Computer Science', '100000.00'),
(2, 'Bharti', 'Computer Science', '100000.00'),
(3, 'Vasudha', 'Computer Science', '100000.00'),
(4, 'Mukesh', 'Mathematics', '100000.00'),
(5, 'Awadhesh', 'Mathematics', '100000.00'),
(6, 'Naveen', 'Mathematics', '100000.00'),
(7, 'Akhilesh', 'Statistics', '100000.00'),
(8, 'Poonam', 'Statistics', '100000.00'),
(9, 'Manisha', 'Literature', '100000.00'),
(10, 'Geeta', 'Literature', '100000.00'),
(11, 'Jitendra', 'Literature', '100000.00'),
(12, 'Madhoolika', 'Botany', '100000.00'),
(13, 'Kuldeep', 'Botany', '100000.00');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `Course_ID` varchar(8) NOT NULL,
  `Sec_ID` varchar(8) NOT NULL,
  `Semester` varchar(6) NOT NULL,
  `Year` int(11) NOT NULL,
  `Building` varchar(15) NOT NULL,
  `Room_number` varchar(7) NOT NULL,
  `Time_slot_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`Course_ID`, `Sec_ID`, `Semester`, `Year`, `Building`, `Room_number`, `Time_slot_id`) VALUES
('BS', 'A', '1', 1, 'LT-1', 'LT-1A', '09 AM-11 A'),
('BS', 'A', '2', 1, 'LT-1', 'LT-1A', '11 AM-01 P'),
('BS', 'B', '3', 2, 'LT-1', 'LT-1A', '01 PM-03 P'),
('BS', 'B', '4', 2, 'LT-1', 'LT-1A', '03 PM-05 P'),
('BS', 'C', '5', 3, 'LT-1', 'LT-1B', '09 AM-01 P'),
('BS', 'C', '6', 3, 'LT-1', 'LT-1B', '01 PM-05 P'),
('BSB', 'A', '1', 1, 'LT-4', 'LT-4A', '09 AM-11 A'),
('BSB', 'A', '2', 1, 'LT-4', 'LT-4A', '11 AM-01 P'),
('BSB', 'B', '3', 2, 'LT-4', 'LT-4A', '01 PM-03 P'),
('BSB', 'B', '4', 2, 'LT-4', 'LT-4A', '03 PM-05 P'),
('BSB', 'C', '5', 3, 'LT-4', 'LT-4B', '09 AM-01 P'),
('BSB', 'C', '6', 3, 'LT-4', 'LT-4B', '01 PM-05 P'),
('BSc', 'A', '1', 1, 'LT-2', 'LT-2A', '09 AM-11 A'),
('BSc', 'A', '2', 1, 'LT-2', 'LT-2A', '11 AM-01 P'),
('BSc', 'B', '3', 2, 'LT-2', 'LT-2A', '01 PM-03 P'),
('BSc', 'B', '4', 2, 'LT-2', 'LT-2A', '03 PM-05 P'),
('BSc', 'C', '5', 3, 'LT-2', 'LT-2B', '09 AM-01 P'),
('BSc', 'C', '6', 3, 'LT-2', 'LT-2B', '01 PM-05 P'),
('MA', 'A', '1', 1, 'LT-3', 'LT-3A', '09 AM-01 P'),
('MA', 'A', '2', 1, 'LT-3', 'LT-3A', '01 PM-05 P'),
('MA', 'B', '3', 2, 'LT-3', 'LT-3B', '09 AM-01 P'),
('MA', 'B', '4', 2, 'LT-3', 'LT-3B', '01 PM-05 P'),
('MS', 'A', '1', 1, 'LT-1', 'LT-1C', '09 AM-01 P'),
('MS', 'A', '2', 1, 'LT-1', 'LT-1C', '01 PM-05 P'),
('MS', 'B', '3', 2, 'LT-1', 'LT-1D', '09 AM-01 P'),
('MS', 'B', '4', 2, 'LT-1', 'LT-1D', '01 PM-05 P'),
('MTech', 'A', '1', 1, 'LT-1', 'LT-1E', '09 AM-01 P'),
('MTech', 'A', '2', 1, 'LT-1', 'LT-1E', '01 PM-05 P'),
('MTech', 'B', '3', 2, 'LT-1', 'LT-1F', '09 AM-01 P'),
('MTech', 'B', '4', 2, 'LT-1', 'LT-1F', '01 PM-05 P');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `ID` varchar(5) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Dept_name` varchar(20) DEFAULT NULL,
  `Tot_cred` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`ID`, `Name`, `Dept_name`, `Tot_cred`) VALUES
('1', 'Aditya', 'Computer Science', NULL),
('10', 'Stuti', 'Statistics', NULL),
('11', 'Ashish', 'Literature', NULL),
('12', 'Akash', 'Computer Science', NULL),
('13', 'Abhinav', 'Computer Science', NULL),
('14', 'Sudeepto', 'Computer Science', NULL),
('15', 'Kinshuk', 'Computer Science', NULL),
('16', 'Aviral', 'Literature', NULL),
('17', 'Apurva', 'Botany', NULL),
('18', 'Sunil', 'Statistics', NULL),
('19', 'Shubham', 'Botany', NULL),
('2', 'Akanksha', 'Mathematics', NULL),
('20', 'Vallabh', 'Mathematics', NULL),
('21', 'Gagan', 'Computer Science', NULL),
('22', 'Adarsh', 'Statistics', NULL),
('23', 'Neha', 'Statistics', NULL),
('24', 'Stuti', 'Computer Science', NULL),
('25', 'Adamya', 'Computer Science', NULL),
('26', 'Abhishek', 'Literature', NULL),
('27', 'Divya', 'Literature', NULL),
('28', 'Rohan', 'Botany', NULL),
('29', 'Rahul', 'Botany', NULL),
('3', 'Akshita', 'Computer Science', NULL),
('30', 'Rishabh', 'Mathematics', NULL),
('4', 'Anjali', 'Statistics', NULL),
('5', 'Devanshu', 'Mathematics', NULL),
('6', 'Divyanshu', 'Literature', NULL),
('7', 'Harshit', 'Botany', NULL),
('8', 'Jagriti', 'Computer Science', NULL),
('9', 'Tanuja', 'Mathematics', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `takes`
--

CREATE TABLE `takes` (
  `ID` varchar(5) NOT NULL,
  `Course_ID` varchar(8) NOT NULL,
  `Sec_ID` varchar(8) NOT NULL,
  `Semester` varchar(6) NOT NULL,
  `Year` int(11) NOT NULL,
  `Grade` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `takes`
--

INSERT INTO `takes` (`ID`, `Course_ID`, `Sec_ID`, `Semester`, `Year`, `Grade`) VALUES
('1', 'MS', 'A', '1', 1, NULL),
('10', 'BS', 'B', '4', 2, NULL),
('11', 'MA', 'A', '1', 1, NULL),
('12', 'MS', 'B', '3', 2, NULL),
('13', 'MS', 'A', '1', 1, NULL),
('14', 'MTech', 'B', '4', 2, NULL),
('15', 'MTech', 'B', '4', 2, NULL),
('16', 'MA', 'A', '2', 1, NULL),
('17', 'BSB', 'A', '2', 1, NULL),
('18', 'BS', 'C', '6', 3, NULL),
('19', 'BSB', 'B', '4', 2, NULL),
('2', 'BSc', 'A', '1', 1, NULL),
('20', 'BSc', 'C', '5', 3, NULL),
('21', 'MS', 'B', '4', 2, NULL),
('22', 'BS', 'C', '5', 3, NULL),
('23', 'BS', 'C', '6', 3, NULL),
('24', 'MS', 'B', '4', 2, NULL),
('25', 'MTech', 'A', '2', 1, NULL),
('26', 'MA', 'B', '3', 2, NULL),
('27', 'MA', 'A', '1', 1, NULL),
('28', 'BSB', 'C', '5', 3, NULL),
('29', 'BSB', 'B', '3', 2, NULL),
('3', 'MS', 'B', '3', 2, NULL),
('30', 'BSc', 'C', '5', 3, NULL),
('4', 'BS', 'A', '2', 1, NULL),
('5', 'BSc', 'B', '3', 2, NULL),
('6', 'MA', 'A', '1', 1, NULL),
('7', 'BSB', 'A', '2', 1, NULL),
('8', 'MTech', 'A', '1', 1, NULL),
('9', 'BSc', 'A', '2', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teaches`
--

CREATE TABLE `teaches` (
  `ID` int(11) NOT NULL,
  `Course_ID` varchar(8) NOT NULL,
  `Sec_ID` varchar(8) NOT NULL,
  `Semester` varchar(6) NOT NULL,
  `Year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teaches`
--

INSERT INTO `teaches` (`ID`, `Course_ID`, `Sec_ID`, `Semester`, `Year`) VALUES
(1, 'MS', 'A', '1', 1),
(1, 'MTech', 'B', '3', 2),
(1, 'MTech', 'B', '4', 2),
(2, 'MS', 'A', '2', 1),
(2, 'MS', 'B', '3', 2),
(2, 'MS', 'B', '4', 2),
(3, 'MS', 'A', '2', 1),
(3, 'MS', 'B', '3', 2),
(3, 'MTech', 'A', '1', 1),
(3, 'MTech', 'A', '2', 1),
(4, 'BSc', 'A', '1', 1),
(4, 'BSc', 'B', '3', 2),
(4, 'BSc', 'C', '5', 3),
(5, 'BSc', 'A', '2', 1),
(5, 'BSc', 'B', '3', 2),
(5, 'BSc', 'C', '5', 3),
(6, 'BSc', 'A', '1', 1),
(6, 'BSc', 'B', '4', 2),
(6, 'BSc', 'C', '5', 3),
(6, 'BSc', 'C', '6', 3),
(7, 'BS', 'A', '1', 1),
(7, 'BS', 'B', '3', 2),
(7, 'BS', 'C', '5', 3),
(8, 'BS', 'A', '2', 1),
(8, 'BS', 'B', '4', 2),
(8, 'BS', 'C', '6', 3),
(9, 'MA', 'A', '1', 1),
(9, 'MA', 'A', '2', 1),
(9, 'MA', 'B', '3', 2),
(10, 'MA', 'B', '3', 2),
(11, 'MA', 'B', '4', 2),
(12, 'BSB', 'A', '1', 1),
(12, 'BSB', 'A', '2', 1),
(12, 'BSB', 'B', '3', 2),
(12, 'BSB', 'C', '5', 3),
(13, 'BSB', 'A', '2', 1),
(13, 'BSB', 'B', '4', 2),
(13, 'BSB', 'C', '5', 3),
(13, 'BSB', 'C', '6', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advisor`
--
ALTER TABLE `advisor`
  ADD PRIMARY KEY (`S_ID`),
  ADD KEY `I_ID` (`I_ID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Course_ID`),
  ADD KEY `Dept_name` (`Dept_name`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Dept_name`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Dept_name` (`Dept_name`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`Course_ID`,`Sec_ID`,`Semester`,`Year`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Dept_name` (`Dept_name`);

--
-- Indexes for table `takes`
--
ALTER TABLE `takes`
  ADD PRIMARY KEY (`ID`,`Course_ID`,`Sec_ID`,`Semester`,`Year`),
  ADD KEY `Course_ID` (`Course_ID`,`Sec_ID`,`Semester`,`Year`);

--
-- Indexes for table `teaches`
--
ALTER TABLE `teaches`
  ADD PRIMARY KEY (`ID`,`Course_ID`,`Sec_ID`,`Semester`,`Year`),
  ADD KEY `Course_ID` (`Course_ID`,`Sec_ID`,`Semester`,`Year`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advisor`
--
ALTER TABLE `advisor`
  ADD CONSTRAINT `advisor_ibfk_1` FOREIGN KEY (`I_ID`) REFERENCES `instructor` (`ID`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Dept_name`) REFERENCES `department` (`Dept_name`);

--
-- Constraints for table `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`Dept_name`) REFERENCES `department` (`Dept_name`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Dept_name`) REFERENCES `department` (`Dept_name`);

--
-- Constraints for table `takes`
--
ALTER TABLE `takes`
  ADD CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `student` (`ID`),
  ADD CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`Course_ID`,`Sec_ID`,`Semester`,`Year`) REFERENCES `section` (`Course_ID`, `Sec_ID`, `Semester`, `Year`);

--
-- Constraints for table `teaches`
--
ALTER TABLE `teaches`
  ADD CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`Course_ID`,`Sec_ID`,`Semester`,`Year`) REFERENCES `section` (`Course_ID`, `Sec_ID`, `Semester`, `Year`),
  ADD CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `instructor` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
