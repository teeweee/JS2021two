-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2021 at 05:01 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university`
--

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `Id_Faculty` bigint(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Id_Rector` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`Id_Faculty`, `Name`, `Address`, `Id_Rector`) VALUES
(2, 'Information Tehnologie', 'Liepaja street 2', 1),
(5, 'Social Science', 'Riga 2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lectors`
--

CREATE TABLE `lectors` (
  `Id_Lector` bigint(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Mail` varchar(70) NOT NULL,
  `Gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lectors`
--

INSERT INTO `lectors` (`Id_Lector`, `Name`, `Surname`, `Phone`, `Mail`, `Gender`) VALUES
(1, 'Ilze', 'Straupe', '25412541', 'ilze@straupe.com', 'Female'),
(3, 'Janis', 'Straupe', '25632563', 'janis@straupe.com', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `map_student_subject`
--

CREATE TABLE `map_student_subject` (
  `Id_stud_sub` bigint(20) NOT NULL,
  `Id_Subject` bigint(20) NOT NULL,
  `Id_Student` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `map_student_subject`
--

INSERT INTO `map_student_subject` (`Id_stud_sub`, `Id_Subject`, `Id_Student`) VALUES
(1, 1, 2),
(3, 1, 3),
(4, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `map_subject_lector`
--

CREATE TABLE `map_subject_lector` (
  `Id_map_sub_lec` bigint(20) NOT NULL,
  `Id_Lector` bigint(20) NOT NULL,
  `Id_Subject` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `map_subject_lector`
--

INSERT INTO `map_subject_lector` (`Id_map_sub_lec`, `Id_Lector`, `Id_Subject`) VALUES
(1, 1, 3),
(2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rector`
--

CREATE TABLE `rector` (
  `Id_Rector` bigint(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `Age` int(100) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Telephone` varchar(15) NOT NULL,
  `Mail` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rector`
--

INSERT INTO `rector` (`Id_Rector`, `Name`, `Surname`, `Age`, `Gender`, `Telephone`, `Mail`) VALUES
(1, 'Maris', 'Rungainis', 32, 'Male', '21451452', 'maris.rungainis@gmail.com'),
(2, 'John', 'Smith', 25, 'Male', '25362563', 'John@mail.com'),
(3, 'Anna', 'Smith', 25, 'Male', '25362563', 'Anna@mail.com');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Id_Student` bigint(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Age` int(100) NOT NULL,
  `Id_faculty` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Id_Student`, `Name`, `Surname`, `Gender`, `Age`, `Id_faculty`) VALUES
(2, 'Karlis', 'Smits', 'Male', 20, 2),
(3, 'Sintia', 'Smits', 'Female', 18, 2),
(5, 'Elin', 'Smite', 'Female', 21, 5),
(7, 'Olga', 'Ose', 'Female', 25, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `Id_Subject` bigint(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Hours` int(120) NOT NULL,
  `CreditPoints` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`Id_Subject`, `Name`, `Hours`, `CreditPoints`) VALUES
(1, 'Javascript', 100, 8),
(2, 'Git', 4, 1),
(3, 'Database', 4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`Id_Faculty`),
  ADD KEY `Id_Rector` (`Id_Rector`);

--
-- Indexes for table `lectors`
--
ALTER TABLE `lectors`
  ADD PRIMARY KEY (`Id_Lector`);

--
-- Indexes for table `map_student_subject`
--
ALTER TABLE `map_student_subject`
  ADD PRIMARY KEY (`Id_stud_sub`),
  ADD KEY `Id_Subject` (`Id_Subject`,`Id_Student`),
  ADD KEY `Id_Student` (`Id_Student`);

--
-- Indexes for table `map_subject_lector`
--
ALTER TABLE `map_subject_lector`
  ADD PRIMARY KEY (`Id_map_sub_lec`),
  ADD KEY `Id_Lector` (`Id_Lector`,`Id_Subject`),
  ADD KEY `Id_Subject` (`Id_Subject`);

--
-- Indexes for table `rector`
--
ALTER TABLE `rector`
  ADD PRIMARY KEY (`Id_Rector`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Id_Student`),
  ADD KEY `Id_faculty` (`Id_faculty`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`Id_Subject`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `Id_Faculty` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lectors`
--
ALTER TABLE `lectors`
  MODIFY `Id_Lector` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `map_student_subject`
--
ALTER TABLE `map_student_subject`
  MODIFY `Id_stud_sub` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `map_subject_lector`
--
ALTER TABLE `map_subject_lector`
  MODIFY `Id_map_sub_lec` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rector`
--
ALTER TABLE `rector`
  MODIFY `Id_Rector` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `Id_Student` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `Id_Subject` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`Id_Rector`) REFERENCES `rector` (`Id_Rector`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `map_student_subject`
--
ALTER TABLE `map_student_subject`
  ADD CONSTRAINT `map_student_subject_ibfk_1` FOREIGN KEY (`Id_Subject`) REFERENCES `subjects` (`Id_Subject`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `map_student_subject_ibfk_2` FOREIGN KEY (`Id_Student`) REFERENCES `student` (`Id_Student`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `map_subject_lector`
--
ALTER TABLE `map_subject_lector`
  ADD CONSTRAINT `map_subject_lector_ibfk_1` FOREIGN KEY (`Id_Lector`) REFERENCES `lectors` (`Id_Lector`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `map_subject_lector_ibfk_2` FOREIGN KEY (`Id_Subject`) REFERENCES `subjects` (`Id_Subject`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Id_faculty`) REFERENCES `faculty` (`Id_Faculty`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
