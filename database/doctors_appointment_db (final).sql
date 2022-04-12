-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2022 at 11:08 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doctors_appointment_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment_list`
--

CREATE TABLE `appointment_list` (
  `id` int(30) NOT NULL,
  `doctor_id` int(30) NOT NULL,
  `patient_id` int(30) NOT NULL,
  `schedule` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0= for verification, 1=confirmed,2= reschedule,3=done',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment_list`
--

INSERT INTO `appointment_list` (`id`, `doctor_id`, `patient_id`, `schedule`, `status`, `date_created`) VALUES
(10, 4, 14, '2022-04-04 13:00:00', 3, '2022-04-02 01:59:02'),
(11, 6, 15, '2022-04-01 16:10:00', 0, '2022-04-02 14:10:25'),
(12, 5, 15, '2022-04-03 13:10:00', 0, '2022-04-02 14:10:47'),
(13, 4, 16, '2022-04-04 13:55:00', 3, '2022-04-02 15:03:38'),
(14, 5, 17, '2022-03-27 15:00:00', 0, '2022-04-02 15:08:07');

-- --------------------------------------------------------

--
-- Table structure for table `doctors_list`
--

CREATE TABLE `doctors_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `name_pref` varchar(100) NOT NULL,
  `clinic_address` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `specialty_ids` text NOT NULL,
  `img_path` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors_list`
--

INSERT INTO `doctors_list` (`id`, `name`, `name_pref`, `clinic_address`, `contact`, `email`, `specialty_ids`, `img_path`, `date_created`) VALUES
(4, 'Yeasin Hossain', 'Ph.D.', 'Sagorika, Chittagong', '+8801626365709', 'yeasin.dr@gmail.com', '[4]', '1648841520_doctor_PNG15988.png', '2022-04-02 01:21:54'),
(5, 'Hasibul Hasan', 'M.D.', 'Agrabad, Chittagong', '+88018154759601', 'hasib.dr@gmail.com', '[3]', '1648841520_doctor_PNG16007.png', '2022-04-02 01:25:39'),
(6, 'Ibrahim Khalil Sopnil', 'Ph.D.', 'Muradpur, Chittagong', '+8801689564708', 'ibrahim.dr@gmail.com', '[1]', '1648841580_doctor_PNG15971.png', '2022-04-02 01:27:51');

-- --------------------------------------------------------

--
-- Table structure for table `doctors_schedule`
--

CREATE TABLE `doctors_schedule` (
  `id` int(30) NOT NULL,
  `doctor_id` int(30) NOT NULL,
  `day` varchar(20) NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors_schedule`
--

INSERT INTO `doctors_schedule` (`id`, `doctor_id`, `day`, `time_from`, `time_to`) VALUES
(3, 2, 'Monday', '10:00:00', '15:00:00'),
(4, 2, 'Wednesday', '10:00:00', '17:00:00'),
(5, 3, 'Monday', '10:00:00', '15:00:00'),
(6, 3, 'Tuesday', '10:00:00', '15:00:00'),
(7, 3, 'Wednesday', '10:00:00', '15:00:00'),
(8, 3, 'Thursday', '10:00:00', '15:00:00'),
(9, 3, 'Friday', '10:00:00', '15:00:00'),
(10, 2, 'Saturday', '09:30:00', '15:00:00'),
(11, 2, 'Sunday', '09:30:00', '15:00:00'),
(12, 5, 'Monday', '09:00:00', '15:00:00'),
(13, 5, 'Saturday', '09:00:00', '15:00:00'),
(14, 5, 'Sunday', '10:00:00', '15:00:00'),
(15, 4, 'Monday', '09:00:00', '14:00:00'),
(16, 4, 'Tuesday', '09:00:00', '14:00:00'),
(17, 4, 'Sunday', '09:00:00', '14:00:00'),
(18, 6, 'Wednesday', '10:00:00', '17:00:00'),
(19, 6, 'Thursday', '10:00:00', '17:00:00'),
(20, 6, 'Friday', '10:00:00', '17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `medical_specialty`
--

CREATE TABLE `medical_specialty` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `img_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medical_specialty`
--

INSERT INTO `medical_specialty` (`id`, `name`, `img_path`) VALUES
(1, 'Allergists', '1648838820_2.jpg'),
(3, 'Cardiology', '1648839780_4.jpg'),
(4, 'Pediatricians', '1648840260_5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Doctor Appointment System', 'doctor_portal@gmail.com', '+8801612312312', '1648842300_aq.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;font-size:24px;text-align: justify;&quot;&gt;The proposed project is a smart appointment booking system that provides patients easy way of booking a doctor&rsquo;s appointment online.&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 24px; text-align: justify; background-color: transparent;&quot;&gt;This is a web based application that overcomes the issue of managing and booking appointments according to user&rsquo;s choice or demands.&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;/p&gt;&lt;h1 style=&quot;text-align: center; font-size: 28px; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/h1&gt;&lt;h1 style=&quot;text-align: center; font-size: 28px; background: transparent; position: relative;&quot;&gt;&lt;b style=&quot;text-align: center; font-size: 28px; background: transparent; position: relative;&quot;&gt;In this project who help me:&lt;/b&gt;&lt;/h1&gt;&lt;p style=&quot;text-align: left; margin-bottom: 15px; padding: 0px; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400;&quot;&gt;&lt;/p&gt;&lt;span style=&quot;text-align: center;&quot;&gt;&lt;h6 style=&quot;text-align: center;&quot;&gt;Ibrahim Khalil Sopnil&lt;/h6&gt;&lt;h6 style=&quot;text-align: center;&quot;&gt;Hasibul Hasan&lt;/h6&gt;&lt;h6 style=&quot;text-align: center;&quot;&gt;MD. Yeasin Hossain&lt;/h6&gt;&lt;/span&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `doctor_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = doctor,3=patient'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `doctor_id`, `name`, `address`, `contact`, `username`, `password`, `type`) VALUES
(1, 0, 'Administrator', '', '', 'admin', 'admin123', 1),
(11, 4, 'DR.Yeasin Hossain, Ph.D.', 'Sagorika, Chittagong', '+8801626365709', 'yeasin.dr@gmail.com', '123', 2),
(12, 5, 'DR.Hasibul Hasan, M.D.', 'Agrabad, Chittagong', '+88018154759601', 'hasib.dr@gmail.com', '123', 2),
(13, 6, 'DR.Ibrahim Khalil Sopnil, Ph.D.', 'Muradpur, Chittagong', '+8801689564708', 'ibrahim.dr@gmail.com', '123', 2),
(14, 0, 'Yasin Arafat', 'GEC, Chittagong', '+01815128012', 'yasin@gmail.com', '202cb962ac59075b964b07152d234b70', 3),
(15, 0, 'Rahim', 'Soraipara, Chittagong', '01626365701', 'rahim@gmail.com', '202cb962ac59075b964b07152d234b70', 3),
(16, 0, 'Afridi', 'GEC', '+8801612312111', 'afridi@gmail.com', '202cb962ac59075b964b07152d234b70', 3),
(17, 0, 'Tanvir', 'Pahartali', '+018151280121', 'tanvir@gmail.com', '202cb962ac59075b964b07152d234b70', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment_list`
--
ALTER TABLE `appointment_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors_list`
--
ALTER TABLE `doctors_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors_schedule`
--
ALTER TABLE `doctors_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical_specialty`
--
ALTER TABLE `medical_specialty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment_list`
--
ALTER TABLE `appointment_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `doctors_list`
--
ALTER TABLE `doctors_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `doctors_schedule`
--
ALTER TABLE `doctors_schedule`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `medical_specialty`
--
ALTER TABLE `medical_specialty`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
