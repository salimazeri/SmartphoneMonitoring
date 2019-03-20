-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 20 Mar 2019, 22:35
-- Wersja serwera: 10.1.37-MariaDB
-- Wersja PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `BazaDanych`
--
CREATE DATABASE IF NOT EXISTS `BazaDanych` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `BazaDanych`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Logs`
--

CREATE TABLE `Logs` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `event` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Logs`
--

INSERT INTO `Logs` (`id`, `login`, `event`, `date`, `time`) VALUES
(11, 'AzeriSalim', 'Login successfuly', '18.02.2019', '18:45:44'),
(12, 'AzeriSalim', 'Login successfuly', '18.02.2019', '18:45:59'),
(13, 'AzeriSalim', 'Login successfuly', '18.02.2019', '18:46:3'),
(14, 'KamilAzeri', 'Registration unsuccessfuly', '18.02.2019', '18:46:13'),
(15, 'KamilAzeri', 'Registration unsuccessfuly', '18.02.2019', '18:46:23'),
(16, 'KamilAzeri', 'Registration unsuccessfuly', '18.02.2019', '18:46:25'),
(17, 'KamilAzeri', 'Registration unsuccessfuly', '18.02.2019', '18:46:26'),
(18, 'KamilAzeri', 'Registration unsuccessfuly', '18.02.2019', '18:46:27'),
(19, 'KamilAzeri', 'Registration unsuccessfuly', '18.02.2019', '18:46:31'),
(20, 'KamilAzeri', 'Registration unsuccessfuly', '18.02.2019', '18:50:50'),
(21, 'AzeriSalim', 'Login successfuly', '18.02.2019', '18:50:57'),
(22, 'AzeriSalim', 'Login successfuly', '18.02.2019', '18:51:40'),
(23, 'AzeriSalim', 'Login successfuly', '18.02.2019', '18:53:7'),
(24, 'AzeriSalim', 'Logout successfuly', '18.02.2019', '18:53:8'),
(25, 'AzeriSalim', 'Login successfuly', '18.02.2019', '18:54:09'),
(26, 'AzeriSalim', 'Logout successfuly', '18.02.2019', '18:54:19'),
(27, 'AzeriSalim', 'Login successfuly', '18.02.2019', '18:59:02'),
(28, 'AzeriSalim', 'Login successfuly', '19.02.2019', '19:19:02'),
(29, 'AzeriSalim', 'Login successfuly', '19.02.2019', '19:19:40'),
(30, 'AzeriSalim', 'Login successfuly', '19.02.2019', '19:40:47'),
(31, 'AzeriSalim', 'Login successfuly', '19.02.2019', '19:58:50'),
(32, 'AzeriSalim', 'Sent offer', '19.02.2019', '19:59:11'),
(33, 'AzeriSalim', 'Sent answer', '19.02.2019', '19:59:11'),
(34, 'AzeriSalim', 'Sent offer', '19.02.2019', '19:59:23'),
(35, 'AzeriSalim', 'Sent answer', '19.02.2019', '19:59:23'),
(36, 'AzeriSalim', 'Sent offer', '19.02.2019', '19:59:26'),
(37, 'AzeriSalim', 'Sent answer', '19.02.2019', '19:59:26'),
(38, 'AzeriSalim', 'Photo taken', '19.02.2019', '19:59:29'),
(39, 'AzeriSalim', 'Photo taken', '19.02.2019', '19:59:30'),
(40, 'AzeriSalim', 'Photo taken', '19.02.2019', '19:59:30'),
(41, 'AzeriSalim', 'Login successfuly', '19.02.2019', '20:0:34'),
(42, 'AzeriSalim', 'Sent offer', '19.02.2019', '20:0:38'),
(43, 'AzeriSalim', 'Sent answer', '19.02.2019', '20:0:38'),
(44, 'AzeriSalim', 'Sent answer', '19.02.2019', '20:0:43'),
(45, 'AzeriSalim', 'Sent answer', '19.02.2019', '20:0:43'),
(46, 'AzeriSalim', 'Photo taken', '19.02.2019', '20:0:43'),
(47, 'AzeriSalim', 'Sent offer', '19.02.2019', '20:0:44'),
(48, 'AzeriSalim', 'Sent offer', '19.02.2019', '20:0:44'),
(49, 'AzeriSalim', 'Login successfuly', '19.02.2019', '20:1:17'),
(50, 'AzeriSalim', 'Sent offer', '19.02.2019', '20:1:21'),
(51, 'AzeriSalim', 'Sent answer', '19.02.2019', '20:1:21'),
(52, 'AzeriSalim', 'Photo taken', '19.02.2019', '20:1:23'),
(53, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:1:57'),
(54, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:1:58'),
(55, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:1:58'),
(56, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:1:59'),
(57, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:1:59'),
(58, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:00'),
(59, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:00'),
(60, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:01'),
(61, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:01'),
(62, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:02'),
(63, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:02'),
(64, 'AzeriSalim', 'Face Detecting stopped', '19.02.2019', '20:2:02'),
(65, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:03'),
(66, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:03'),
(67, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:04'),
(68, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:04'),
(69, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:05'),
(70, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:06'),
(71, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:07'),
(72, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:08'),
(73, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:09'),
(74, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:10'),
(75, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:11'),
(76, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:12'),
(77, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:13'),
(78, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:14'),
(79, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:15'),
(80, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:16'),
(81, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:17'),
(82, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:18'),
(83, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:19'),
(84, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:20'),
(85, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:21'),
(86, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:22'),
(87, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:23'),
(88, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:24'),
(89, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:25'),
(90, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:26'),
(91, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:27'),
(92, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:28'),
(93, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:29'),
(94, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:30'),
(95, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:31'),
(96, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:31'),
(97, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:32'),
(98, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:32'),
(99, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:33'),
(100, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:33'),
(101, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:34'),
(102, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:34'),
(103, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:35'),
(104, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:35'),
(105, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:36'),
(106, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:36'),
(107, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:37'),
(108, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:37'),
(109, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:38'),
(110, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:38'),
(111, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:39'),
(112, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:39'),
(113, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:40'),
(114, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:40'),
(115, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:41'),
(116, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:41'),
(117, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:42'),
(118, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:42'),
(119, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:43'),
(120, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:43'),
(121, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:44'),
(122, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:44'),
(123, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:45'),
(124, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:45'),
(125, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:46'),
(126, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:46'),
(127, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:47'),
(128, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:47'),
(129, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:48'),
(130, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:48'),
(131, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:49'),
(132, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:49'),
(133, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:50'),
(134, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:50'),
(135, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:51'),
(136, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:52'),
(137, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:53'),
(138, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:54'),
(139, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:55'),
(140, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:56'),
(141, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:57'),
(142, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:58'),
(143, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:2:59'),
(144, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:00'),
(145, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:01'),
(146, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:02'),
(147, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:03'),
(148, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:04'),
(149, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:05'),
(150, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:06'),
(151, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:07'),
(152, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:08'),
(153, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:09'),
(154, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:10'),
(155, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:11'),
(156, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:12'),
(157, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:13'),
(158, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:14'),
(159, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:15'),
(160, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:16'),
(161, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:17'),
(162, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:18'),
(163, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:19'),
(164, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:20'),
(165, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:21'),
(166, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:22'),
(167, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:23'),
(168, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:24'),
(169, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:25'),
(170, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:26'),
(171, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:27'),
(172, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:28'),
(173, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:29'),
(174, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:30'),
(175, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:31'),
(176, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:32'),
(177, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:33'),
(178, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:34'),
(179, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:35'),
(180, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:36'),
(181, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:37'),
(182, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:38'),
(183, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:39'),
(184, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:40'),
(185, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:41'),
(186, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:42'),
(187, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:43'),
(188, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:44'),
(189, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:45'),
(190, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:46'),
(191, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:47'),
(192, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:48'),
(193, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:49'),
(194, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:50'),
(195, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:51'),
(196, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:52'),
(197, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:53'),
(198, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:54'),
(199, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:55'),
(200, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:56'),
(201, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:57'),
(202, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:58'),
(203, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:3:59'),
(204, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:4:00'),
(205, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:4:01'),
(206, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:4:02'),
(207, 'AzeriSalim', 'Face Detecting started', '19.02.2019', '20:4:03'),
(208, 'AzeriSalim', 'Login successfuly', '19.02.2019', '20:47:10'),
(209, 'AzeriSalim', 'Login successfuly', '19.02.2019', '20:51:49'),
(210, 'AzeriSalim', 'Sent offer', '19.02.2019', '20:51:54'),
(211, 'AzeriSalim', 'Sent answer', '19.02.2019', '20:51:54'),
(212, 'AzeriSalim', 'Login successfuly', '21.02.2019', '17:43:54'),
(213, 'AzeriSalim', 'Login successfuly', '21.02.2019', '17:44:19'),
(214, 'AzeriSalim', 'Login successfuly', '21.02.2019', '17:45:28'),
(215, 'admin', 'Registration successfuly', '21.02.2019', '17:47:31'),
(216, 'admin', 'Login successfuly', '21.02.2019', '17:47:37'),
(217, 'AzeriSalim', 'Login successfuly', '21.02.2019', '17:48:27'),
(218, 'AzeriSalim', 'Login successfuly', '21.02.2019', '17:50:28'),
(219, 'AzeriSalim', 'Logout successfuly', '21.02.2019', '17:50:30'),
(220, 'admin', 'Login successfuly', '21.02.2019', '17:50:34'),
(221, 'admin', 'Logout successfuly', '21.02.2019', '17:50:40'),
(222, 'AzeriSalim', 'Login successfuly', '21.02.2019', '17:50:43'),
(223, 'AzeriSalim', 'Logout successfuly', '21.02.2019', '17:50:47'),
(224, 'admin', 'Login successfuly', '21.02.2019', '17:50:51'),
(225, 'AzeriSalim', 'Login successfuly', '21.02.2019', '17:51:44'),
(226, 'AzeriSalim', 'Logout successfuly', '21.02.2019', '17:51:45'),
(227, 'admin', 'Login successfuly', '21.02.2019', '17:51:50'),
(228, 'admin', 'Login successfuly', '21.02.2019', '17:52:28'),
(229, 'admin', 'Login successfuly', '21.02.2019', '17:52:32'),
(230, 'AzeriSalim', 'Login successfuly', '21.02.2019', '17:55:47'),
(231, 'AzeriSalim', 'Login successfuly', '21.02.2019', '18:0:09'),
(232, 'AzeriSalim', 'Logout successfuly', '21.02.2019', '18:0:37'),
(233, 'AzeriSalim', 'Login successfuly', '21.02.2019', '18:0:40'),
(234, 'AzeriSalim', 'Login successfuly', '21.02.2019', '18:1:06'),
(235, 'AzeriSalim', 'Login successfuly', '21.02.2019', '18:3:15'),
(236, 'AzeriSalim', 'Login successfuly', '21.02.2019', '18:3:46'),
(237, 'AzeriSalim', 'Logout successfuly', '21.02.2019', '18:3:49'),
(238, 'AzeriSalim', 'Login successfuly', '21.02.2019', '18:4:13'),
(239, 'AzeriSalim', 'Login successfuly', '21.02.2019', '18:8:18'),
(240, 'AzeriSalim', 'Logout successfuly', '21.02.2019', '18:8:20'),
(241, 'admin', 'Login successfuly', '21.02.2019', '18:8:24'),
(242, 'admin', 'Login successfuly', '21.02.2019', '18:10:25'),
(243, 'AzeriSalim', 'Login successfuly', '21.02.2019', '18:11:31'),
(244, 'AzeriSalim', 'Sent answer', '21.02.2019', '18:11:39'),
(245, 'AzeriSalim', 'Sent offer', '21.02.2019', '18:11:40'),
(246, 'AzeriSalim', 'Sent answer', '21.02.2019', '18:11:47'),
(247, 'AzeriSalim', 'Sent offer', '21.02.2019', '18:11:48'),
(248, 'AzeriSalim', 'Logout successfuly', '21.02.2019', '18:12:04'),
(249, 'admin', 'Login successfuly', '21.02.2019', '18:12:07'),
(250, 'admin', 'Login successfuly', '21.02.2019', '18:13:15'),
(251, 'admin', 'Login successfuly', '21.02.2019', '18:13:53'),
(252, 'AzeriSalim', 'Login successfuly', '21.02.2019', '18:16:58'),
(253, 'AzeriSalim', 'Logout successfuly', '21.02.2019', '18:16:59'),
(254, 'admin', 'Login successfuly', '21.02.2019', '18:17:02'),
(255, 'AzeriSalim', 'Login successfuly', '21.02.2019', '18:17:18'),
(256, 'AzeriSalim', 'Logout successfuly', '21.02.2019', '18:17:19'),
(257, 'admin', 'Login successfuly', '21.02.2019', '18:17:23'),
(258, 'admin', 'Logout successfuly', '21.02.2019', '18:18:10'),
(259, 'admin', 'Login successfuly', '21.02.2019', '18:19:01'),
(260, 'AzeriSalim', 'Login successfuly', '21.02.2019', '18:21:17'),
(261, 'AzeriSalim', 'Logout successfuly', '21.02.2019', '18:21:18'),
(262, 'admin', 'Login successfuly', '21.02.2019', '18:21:22'),
(263, 'AzeriSalim', 'Login successfuly', '21.02.2019', '18:26:35'),
(264, 'AzeriSalim', 'Login successfuly', '21.02.2019', '18:27:04'),
(265, 'admin', 'Login successfuly', '21.02.2019', '18:40:34'),
(266, 'admin', 'Login successfuly', '21.02.2019', '18:45:37'),
(267, 'admin', 'Login successfuly', '21.02.2019', '18:45:52'),
(268, 'admin', 'Login successfuly', '21.02.2019', '18:46:30'),
(269, 'AzeriSalim', 'Login successfuly', '21.02.2019', '18:47:26'),
(270, 'AzeriSalim', 'Sent offer', '21.02.2019', '18:48:10'),
(271, 'AzeriSalim', 'Sent answer', '21.02.2019', '18:48:14'),
(272, 'AzeriSalim', 'Sent offer', '21.02.2019', '18:48:15'),
(273, 'admin', 'Login successfuly', '21.02.2019', '18:49:26'),
(274, 'admin', 'Login successfuly', '21.02.2019', '18:50:40'),
(275, 'admin', 'Login successfuly', '21.02.2019', '18:51:16'),
(276, 'admin', 'Login successfuly', '21.02.2019', '18:51:53'),
(277, 'admin', 'Login successfuly', '21.02.2019', '18:52:46'),
(278, 'admin', 'Login successfuly', '21.02.2019', '18:53:21'),
(279, 'admin', 'Login successfuly', '21.02.2019', '18:54:07'),
(280, 'admin', 'Login successfuly', '21.02.2019', '18:54:42'),
(281, 'admin', 'Login successfuly', '21.02.2019', '18:55:25'),
(282, 'admin', 'Login successfuly', '21.02.2019', '18:55:42'),
(283, 'admin', 'Login successfuly', '21.02.2019', '18:57:09'),
(284, 'admin', 'Login successfuly', '21.02.2019', '18:57:25'),
(285, 'admin', 'Login successfuly', '21.02.2019', '19:4:56'),
(286, 'admin', 'Login successfuly', '21.02.2019', '19:5:21'),
(287, 'admin', 'Login successfuly', '21.02.2019', '19:5:34'),
(288, 'admin', 'Login successfuly', '21.02.2019', '19:6:14'),
(289, 'admin', 'Login successfuly', '21.02.2019', '19:7:01'),
(290, 'admin', 'Login successfuly', '21.02.2019', '19:8:01'),
(291, 'admin', 'Login successfuly', '21.02.2019', '19:9:49'),
(292, 'admin', 'Login successfuly', '21.02.2019', '19:13:31'),
(293, 'admin', 'Login successfuly', '21.02.2019', '19:17:01'),
(294, 'admin', 'Login successfuly', '21.02.2019', '19:17:11'),
(295, 'admin', 'Login successfuly', '21.02.2019', '19:17:30'),
(296, 'admin', 'Login successfuly', '21.02.2019', '19:18:04'),
(297, 'admin', 'Login successfuly', '21.02.2019', '19:20:28'),
(298, 'admin', 'Login successfuly', '21.02.2019', '19:21:05'),
(299, 'admin', 'Login successfuly', '21.02.2019', '19:21:48'),
(300, 'admin', 'Login successfuly', '21.02.2019', '19:22:36'),
(301, 'admin', 'Login successfuly', '21.02.2019', '19:22:50'),
(302, 'admin', 'Login successfuly', '21.02.2019', '19:23:38'),
(303, 'admin', 'Login successfuly', '21.02.2019', '19:23:56'),
(304, 'admin', 'Login successfuly', '21.02.2019', '19:24:46'),
(305, 'admin', 'Login successfuly', '21.02.2019', '19:25:06'),
(306, 'admin', 'Login successfuly', '21.02.2019', '19:27:36'),
(307, 'AzeriSalim', 'Login successfuly', '21.02.2019', '19:27:52'),
(308, 'AzeriSalim', 'Logout successfuly', '21.02.2019', '19:27:53'),
(309, 'admin', 'Login successfuly', '21.02.2019', '19:27:57'),
(310, 'admin', 'Login successfuly', '21.02.2019', '19:29:38'),
(311, 'admin', 'Login successfuly', '21.02.2019', '19:30:22'),
(312, 'admin', 'Login successfuly', '21.02.2019', '19:31:51'),
(313, 'admin', 'Login successfuly', '21.02.2019', '19:38:16'),
(314, 'AzeriSalim', 'Login successfuly', '21.02.2019', '19:39:15'),
(315, 'AzeriSalim', 'Logout successfuly', '21.02.2019', '19:39:16'),
(316, 'admin', 'Login successfuly', '21.02.2019', '19:39:20'),
(317, 'admin', 'Login successfuly', '21.02.2019', '20:8:57'),
(318, 'admin', 'Login successfuly', '21.02.2019', '20:9:40'),
(319, 'admin', 'Login successfuly', '21.02.2019', '20:9:59'),
(320, 'admin', 'Logout successfuly', '21.02.2019', '20:10:27'),
(321, 'admin', 'Login successfuly', '21.02.2019', '20:10:30'),
(322, 'admin', 'Login successfuly', '21.02.2019', '20:11:47'),
(323, 'admin', 'Logout successfuly', '21.02.2019', '20:36:58'),
(324, 'Darek', 'Registration successfuly', '21.02.2019', '20:42:02'),
(325, 'admin', 'Login successfuly', '21.02.2019', '20:44:51'),
(326, 'admin', 'Logout successfuly', '21.02.2019', '20:45:05'),
(327, 'admin', 'Login successfuly', '21.02.2019', '20:45:08'),
(328, 'admin', 'Login successfuly', '21.02.2019', '20:45:57'),
(329, 'admin', 'Login successfuly', '21.02.2019', '20:46:55'),
(330, 'admin', 'Login successfuly', '21.02.2019', '20:50:11'),
(331, 'admin', 'Login successfuly', '21.02.2019', '20:50:35'),
(332, 'admin', 'Login successfuly', '21.02.2019', '21:9:45'),
(333, 'admin', 'Login successfuly', '21.02.2019', '21:10:24'),
(334, 'admin', 'Login successfuly', '21.02.2019', '21:11:35'),
(335, 'admin', 'Login successfuly', '21.02.2019', '21:16:44'),
(336, 'admin', 'Login successfuly', '21.02.2019', '21:18:37'),
(337, 'admin', 'Login successfuly', '21.02.2019', '21:19:29'),
(338, 'admin', 'Logout successfuly', '21.02.2019', '21:20:22'),
(339, 'admin', 'Login successfuly', '21.02.2019', '21:20:25'),
(340, 'admin', 'Login successfuly', '21.02.2019', '21:23:24'),
(341, 'admin', 'Login successfuly', '21.02.2019', '21:25:05'),
(342, 'admin', 'Login successfuly', '21.02.2019', '21:26:43'),
(343, 'admin', 'Login successfuly', '21.02.2019', '21:28:00'),
(344, 'admin', 'Login successfuly', '21.02.2019', '21:30:28'),
(345, 'admin', 'Login successfuly', '21.02.2019', '21:33:35'),
(346, 'admin', 'Login successfuly', '21.02.2019', '21:34:19'),
(347, 'admin', 'Login successfuly', '21.02.2019', '21:35:39'),
(348, 'admin', 'Login successfuly', '21.02.2019', '21:36:04'),
(349, 'AzeriSalim', 'Login successfuly', '21.02.2019', '21:36:21'),
(350, 'AzeriSalim', 'Logout successfuly', '21.02.2019', '21:36:23'),
(351, 'admin', 'Login successfuly', '21.02.2019', '21:36:26'),
(352, 'AzeriSalim', 'Login successfuly', '21.02.2019', '21:37:36'),
(353, 'AzeriSalim', 'Sent answer', '21.02.2019', '21:37:43'),
(354, 'AzeriSalim', 'Sent answer', '21.02.2019', '21:37:43'),
(355, 'AzeriSalim', 'Sent offer', '21.02.2019', '21:37:44'),
(356, 'AzeriSalim', 'Sent offer', '21.02.2019', '21:37:44'),
(357, 'AzeriSalim', 'Sent answer', '21.02.2019', '21:37:44'),
(358, 'AzeriSalim', 'Sent offer', '21.02.2019', '21:37:45'),
(359, 'AzeriSalim', 'Sent answer', '21.02.2019', '21:37:54'),
(360, 'AzeriSalim', 'Sent answer', '21.02.2019', '21:37:54'),
(361, 'AzeriSalim', 'Sent answer', '21.02.2019', '21:37:54'),
(362, 'AzeriSalim', 'Sent offer', '21.02.2019', '21:37:55'),
(363, 'AzeriSalim', 'Sent offer', '21.02.2019', '21:37:55'),
(364, 'AzeriSalim', 'Sent offer', '21.02.2019', '21:37:55'),
(365, 'AzeriSalim', 'Logout successfuly', '21.02.2019', '21:38:00'),
(366, 'admin', 'Login successfuly', '21.02.2019', '21:38:03'),
(367, 'admin', 'Login successfuly', '21.02.2019', '21:46:42'),
(368, 'admin', 'Login successfuly', '21.02.2019', '21:48:43'),
(369, 'admin', 'Login successfuly', '21.02.2019', '21:50:28'),
(370, 'admin', 'Login successfuly', '21.02.2019', '21:51:36'),
(371, 'admin', 'Login successfuly', '21.02.2019', '21:52:15'),
(372, 'admin', 'Login successfuly', '21.02.2019', '21:52:52'),
(373, 'admin', 'Login successfuly', '21.02.2019', '21:53:24'),
(374, 'admin', 'Login successfuly', '21.02.2019', '21:54:00'),
(375, 'admin', 'Login successfuly', '21.02.2019', '21:54:25'),
(376, 'admin', 'Login successfuly', '21.02.2019', '21:56:09'),
(377, 'admin', 'Login successfuly', '21.02.2019', '21:57:31'),
(378, 'admin', 'Login successfuly', '21.02.2019', '22:0:48'),
(379, 'admin', 'Login successfuly', '21.02.2019', '22:3:47'),
(380, 'admin', 'Login successfuly', '21.02.2019', '22:5:53'),
(381, 'MonikaStuchlik', 'Registration successfuly', '21.02.2019', '22:12:23'),
(382, 'admin', 'Login successfuly', '22.02.2019', '2:53:53'),
(383, 'admin', 'Logout successfuly', '22.02.2019', '2:54:56'),
(384, 'User1', 'Registration successfuly', '22.02.2019', '2:55:09'),
(385, 'admin', 'Login successfuly', '22.02.2019', '2:55:15'),
(386, 'admin', 'Login successfuly', '22.02.2019', '3:7:59'),
(387, 'admin', 'Login successfuly', '22.02.2019', '3:15:26'),
(388, 'admin', 'Login successfuly', '22.02.2019', '3:16:08'),
(389, 'admin', 'Login successfuly', '22.02.2019', '3:17:43'),
(390, 'admin', 'Login successfuly', '22.02.2019', '3:18:09'),
(391, 'AzeriSalim', 'Login successfuly', '22.02.2019', '3:19:16'),
(392, 'AzeriSalim', 'Logout successfuly', '22.02.2019', '3:19:19'),
(393, 'admin', 'Login successfuly', '22.02.2019', '3:19:21'),
(394, 'admin', 'Login successfuly', '22.02.2019', '3:20:24'),
(395, 'admin', 'Login successfuly', '22.02.2019', '3:21:19'),
(396, 'admin', 'Login successfuly', '22.02.2019', '3:24:49'),
(397, 'admin', 'Login successfuly', '22.02.2019', '3:25:59'),
(398, 'admin', 'Login successfuly', '22.02.2019', '3:27:04'),
(399, 'admin', 'Login successfuly', '22.02.2019', '3:28:39'),
(400, 'admin', 'Login successfuly', '22.02.2019', '3:37:14'),
(401, 'AzeriSalim', 'Login successfuly', '22.02.2019', '3:39:41'),
(402, 'undefined', 'Logout successfuly', '22.02.2019', '3:40:11'),
(403, 'admin', 'Login successfuly', '22.02.2019', '3:40:14'),
(404, 'admin', 'Logout successfuly', '22.02.2019', '3:41:29'),
(405, 'AzeriSalim', 'Registration successfuly', '22.02.2019', '3:41:42'),
(406, 'AzeriSalim', 'Login successfuly', '22.02.2019', '3:41:46'),
(407, 'AzeriSalim', 'Logout successfuly', '22.02.2019', '3:41:47'),
(408, 'admin', 'Login successfuly', '22.02.2019', '3:41:50'),
(409, 'admin', 'Login successfuly', '22.02.2019', '3:44:28'),
(410, 'admin', 'Login successfuly', '22.02.2019', '3:46:20'),
(411, 'admin', 'Login successfuly', '22.02.2019', '3:49:23'),
(412, 'admin', 'Login successfuly', '22.02.2019', '3:57:05'),
(413, 'admin', 'Login successfuly', '22.02.2019', '3:58:32'),
(414, 'admin', 'Login successfuly', '22.02.2019', '3:59:23'),
(415, 'admin', 'Login successfuly', '22.02.2019', '4:0:38'),
(416, 'admin', 'Login successfuly', '22.02.2019', '4:1:29'),
(417, 'admin', 'Logout successfuly', '22.02.2019', '4:1:30'),
(418, 'sdfsdfdsfsdfsdf', 'Registration successfuly', '22.02.2019', '4:1:44'),
(419, 'sdfsdfdsfsdfsdf', 'Registration unsuccessfuly', '22.02.2019', '4:3:52'),
(420, 'admin', 'Login successfuly', '22.02.2019', '4:4:05'),
(421, 'admin', 'Logout successfuly', '22.02.2019', '4:5:15'),
(422, 'useruseruser', 'Registration successfuly', '22.02.2019', '4:5:26'),
(423, 'admin', 'Login successfuly', '22.02.2019', '4:5:30'),
(424, 'undefined', 'Logout successfuly', '22.02.2019', '4:07:26'),
(425, 'AzeriSalim', 'Login successfuly', '22.02.2019', '4:07:29'),
(426, 'AzeriSalim', 'Logout successfuly', '22.02.2019', '4:07:30'),
(427, 'admin', 'Login successfuly', '22.02.2019', '4:07:33'),
(428, 'admin', 'Login successfuly', '22.02.2019', '4:09:50'),
(429, 'admin', 'Logout successfuly', '22.02.2019', '4:10:41'),
(430, 'AzeriSalim', 'Login successfuly', '22.02.2019', '4:10:44'),
(431, 'AzeriSalim', 'Login successfuly', '22.02.2019', '4:11:07'),
(432, 'AzeriSalim', 'Login successfuly', '22.02.2019', '4:14:44'),
(433, 'AzeriSalim', 'Login successfuly', '22.02.2019', '4:17:48'),
(434, 'AzeriSalim', 'Login successfuly', '22.02.2019', '4:20:28'),
(435, 'AzeriSalim', 'Logout successfuly', '22.02.2019', '4:25:29'),
(436, 'admin', 'Login successfuly', '22.02.2019', '4:25:32'),
(437, 'admin', 'Logout successfuly', '22.02.2019', '4:25:47'),
(438, 'AzeriSalim', 'Login successfuly', '22.02.2019', '4:25:50'),
(439, 'user1', 'Login successfuly', '22.02.2019', '4:29:06'),
(440, 'user1', 'Logout successfuly', '22.02.2019', '4:29:20'),
(441, 'user1', 'Login successfuly', '22.02.2019', '4:29:24'),
(442, 'user1', 'Login successfuly', '22.02.2019', '4:29:58'),
(443, 'user1', 'Logout successfuly', '22.02.2019', '4:30:04'),
(444, 'user1', 'Login unsuccessfuly- User doesn\'t exist', '22.02.2019', '4:30:09'),
(445, 'user1', 'Registration successfuly', '22.02.2019', '4:33:11'),
(446, 'user1', 'Login successfuly', '22.02.2019', '4:33:16'),
(447, 'undefined', 'Logout successfuly', '22.02.2019', '4:34:27'),
(448, 'user1', 'Login unsuccessfuly- User doesn\'t exist', '22.02.2019', '4:34:31'),
(449, 'user1', 'Registration successfuly', '22.02.2019', '4:34:40'),
(450, 'user1', 'Login successfuly', '22.02.2019', '4:34:44'),
(451, 'user1', 'Logout successfuly', '22.02.2019', '4:35:03'),
(452, 'user1', 'Login unsuccessfuly- User doesn\'t exist', '22.02.2019', '4:35:07'),
(453, 'user1', 'Registration successfuly', '22.02.2019', '4:35:16'),
(454, 'user1', 'Registration unsuccessfuly', '22.02.2019', '4:35:40'),
(455, 'user1', 'Login successfuly', '22.02.2019', '4:35:51'),
(456, 'undefined', 'Logout successfuly', '22.02.2019', '4:36:42'),
(457, 'user1', 'Registration successfuly', '22.02.2019', '4:36:53'),
(458, 'user1', 'Login successfuly', '22.02.2019', '4:36:58'),
(459, 'undefined', 'Logout successfuly', '22.02.2019', '4:37:41'),
(460, 'user1', 'Registration successfuly', '22.02.2019', '4:37:51'),
(461, 'user1', 'Login successfuly', '22.02.2019', '4:37:58'),
(462, 'user1', 'Login unsuccessfuly- User doesn\'t exist', '22.02.2019', '4:39:38'),
(463, 'user1', 'Registration successfuly', '22.02.2019', '4:39:48'),
(464, 'user1', 'Login successfuly', '22.02.2019', '4:39:52'),
(465, 'user1', 'Login unsuccessfuly- User doesn\'t exist', '22.02.2019', '4:40:01'),
(466, 'user1', 'Registration successfuly', '22.02.2019', '4:40:09'),
(467, 'user1', 'Login successfuly', '22.02.2019', '4:40:13'),
(468, 'AzeriSalim', 'Login successfuly', '22.02.2019', '4:44:50'),
(469, 'undefined', 'Logout successfuly', '22.02.2019', '4:45:08'),
(470, 'AzeriSalim', 'Login successfuly', '22.02.2019', '4:45:11'),
(471, 'undefined', 'Logout successfuly', '22.02.2019', '4:49:01'),
(472, 'AzeriSalim', 'Login successfuly', '22.02.2019', '4:49:05'),
(473, 'undefined', 'Logout successfuly', '22.02.2019', '4:49:21'),
(474, 'AzeriSalim', 'Login successfuly', '22.02.2019', '4:49:24'),
(475, 'undefined', 'Logout successfuly', '22.02.2019', '4:50:15'),
(476, 'AzeriSalim', 'Login successfuly', '22.02.2019', '4:50:18'),
(477, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:03:23'),
(478, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:11:18'),
(479, 'AzeriSalim', 'Logout successfuly', '22.02.2019', '5:11:46'),
(480, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:11:49'),
(481, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:12:14'),
(482, 'AzeriSalim', 'Password changed', '22.02.2019', '5:12:27'),
(483, 'AzeriSalim', 'Login unsuccessfuly- User doesn\'t exist', '22.02.2019', '5:13:35'),
(484, 'AzeriSalim', 'Login unsuccessfuly- User doesn\'t exist', '22.02.2019', '5:13:39'),
(485, 'AzeriSalim', 'Login unsuccessfuly- User doesn\'t exist', '22.02.2019', '5:14:42'),
(486, 'AzeriSalim', 'Registration successfuly', '22.02.2019', '5:14:50'),
(487, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:14:53'),
(488, 'AzeriSalim', 'Password changed', '22.02.2019', '5:15:06'),
(489, 'AzeriSalim', 'Logout successfuly', '22.02.2019', '5:15:13'),
(490, 'AzeriSalim', 'Login unsuccessfuly- Incorrect data', '22.02.2019', '5:15:16'),
(491, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:15:19'),
(492, 'AzeriSalim', 'Password changed', '22.02.2019', '5:15:37'),
(493, 'AzeriSalim', 'Logout successfuly', '22.02.2019', '5:15:39'),
(494, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:15:43'),
(495, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:18:17'),
(496, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:22:03'),
(497, 'undefined', 'Logout successfuly', '22.02.2019', '5:22:41'),
(498, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:22:44'),
(499, 'undefined', 'Logout successfuly', '22.02.2019', '5:25:07'),
(500, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:25:10'),
(501, 'AzeriSalim', 'Logout successfuly', '22.02.2019', '5:26:21'),
(502, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:26:24'),
(503, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:26:57'),
(504, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:27:55'),
(505, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:28:45'),
(506, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:30:57'),
(507, 'AzeriSalim', 'Password changed', '22.02.2019', '5:31:16'),
(508, 'AzeriSalim', 'Logout successfuly', '22.02.2019', '5:31:21'),
(509, 'AzeriSalim', 'Login unsuccessfuly- Incorrect data', '22.02.2019', '5:31:30'),
(510, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:31:34'),
(511, 'AzeriSalim', 'Password changed', '22.02.2019', '5:31:45'),
(512, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:32:51'),
(513, 'undefined', 'Password changed', '22.02.2019', '5:33:38'),
(514, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:33:46'),
(515, 'undefined', 'Password changed', '22.02.2019', '5:34:06'),
(516, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:34:27'),
(517, 'undefined', 'Password changed', '22.02.2019', '5:34:35'),
(518, 'AzeriSalim', 'Login unsuccessfuly- Incorrect data', '22.02.2019', '5:34:41'),
(519, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:34:45'),
(520, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:35:55'),
(521, 'undefined', 'Password changed', '22.02.2019', '5:36:05'),
(522, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:38:14'),
(523, 'AzeriSalim', 'Password changed', '22.02.2019', '5:38:44'),
(524, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:38:50'),
(525, 'AzeriSalim', 'Logout successfuly', '22.02.2019', '5:38:52'),
(526, 'AzeriSalim', 'Login unsuccessfuly- Incorrect data', '22.02.2019', '5:38:55'),
(527, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:38:58'),
(528, 'AzeriSalim', 'Password changed', '22.02.2019', '5:39:07'),
(529, 'AzeriSalim', 'Login successfuly', '22.02.2019', '5:39:20'),
(530, 'AzeriSalim', 'Logout successfuly', '22.02.2019', '5:39:24'),
(531, 'admin', 'Login successfuly', '22.02.2019', '5:39:27'),
(532, 'admin', 'Logout successfuly', '22.02.2019', '5:39:41'),
(533, 'user1', 'Login successfuly', '22.02.2019', '5:39:46'),
(534, 'admin', 'Login successfuly', '22.02.2019', '5:39:53'),
(535, 'admin', 'Login successfuly', '26.02.2019', '20:15:04'),
(536, 'admin', 'Login successfuly', '26.02.2019', '20:19:54'),
(537, 'admin', 'Login successfuly', '26.02.2019', '20:20:50'),
(538, 'admin', 'Login successfuly', '26.02.2019', '20:21:46'),
(539, 'admin', 'Login successfuly', '26.02.2019', '20:25:55'),
(540, 'admin', 'Logout successfuly', '26.02.2019', '20:27:06'),
(541, 'AzeriSalim', 'Login successfuly', '26.02.2019', '20:27:11'),
(542, 'admin', 'Login successfuly', '26.02.2019', '20:35:53'),
(543, 'admin', 'Login unsuccessfuly- Incorrect data', '26.02.2019', '20:58:34'),
(544, 'admin', 'Login unsuccessfuly- Incorrect data', '26.02.2019', '20:58:38'),
(545, 'admin', 'Login successfuly', '26.02.2019', '20:58:42'),
(546, 'admin', 'Login successfuly', '26.02.2019', '20:59:08'),
(547, 'admin', 'Login successfuly', '27.02.2019', '20:22:03'),
(548, 'admin', 'Logout successfuly', '27.02.2019', '20:22:13'),
(549, 'AzeriSalim', 'Login successfuly', '27.02.2019', '20:22:16'),
(550, 'AzeriSalim', 'Sent answer', '27.02.2019', '20:22:29'),
(551, 'AzeriSalim', 'Sent offer', '27.02.2019', '20:22:29'),
(552, 'AzeriSalim', 'Sent answer', '27.02.2019', '20:22:30'),
(553, 'AzeriSalim', 'Sent offer', '27.02.2019', '20:22:30'),
(554, 'AzeriSalim', 'Sent answer', '27.02.2019', '20:22:31'),
(555, 'AzeriSalim', 'Sent answer', '27.02.2019', '20:22:31'),
(556, 'AzeriSalim', 'Sent offer', '27.02.2019', '20:22:31'),
(557, 'AzeriSalim', 'Sent offer', '27.02.2019', '20:22:31'),
(558, 'AzeriSalim', 'Sent answer', '27.02.2019', '20:22:40'),
(559, 'AzeriSalim', 'Sent answer', '27.02.2019', '20:22:40'),
(560, 'AzeriSalim', 'Sent answer', '27.02.2019', '20:22:40'),
(561, 'AzeriSalim', 'Sent answer', '27.02.2019', '20:22:40'),
(562, 'AzeriSalim', 'Sent offer', '27.02.2019', '20:22:40'),
(563, 'AzeriSalim', 'Sent offer', '27.02.2019', '20:22:40'),
(564, 'AzeriSalim', 'Sent offer', '27.02.2019', '20:22:40'),
(565, 'AzeriSalim', 'Sent offer', '27.02.2019', '20:22:40'),
(566, 'AzeriSalim', 'Login successfuly', '04.03.2019', '13:15:19'),
(567, 'AzeriSalim', 'Sent answer', '04.03.2019', '13:16:13'),
(568, 'AzeriSalim', 'Sent offer', '04.03.2019', '13:16:14'),
(569, 'AzeriSalim', 'Sent answer', '04.03.2019', '13:16:17'),
(570, 'AzeriSalim', 'Sent offer', '04.03.2019', '13:16:18'),
(571, 'AzeriSalim', 'Sent offer', '04.03.2019', '13:16:20'),
(572, 'AzeriSalim', 'Sent answer', '04.03.2019', '13:16:20'),
(573, 'AzeriSalim', 'Sent answer', '04.03.2019', '13:16:23'),
(574, 'AzeriSalim', 'Sent offer', '04.03.2019', '13:16:24'),
(575, 'AzeriSalim', 'Sent answer', '04.03.2019', '13:16:31'),
(576, 'AzeriSalim', 'Sent offer', '04.03.2019', '13:16:32'),
(577, 'AzeriSalim', 'Sent answer', '04.03.2019', '13:16:32'),
(578, 'AzeriSalim', 'Sent offer', '04.03.2019', '13:16:33'),
(579, 'AzeriSalim', 'Sent offer', '04.03.2019', '13:16:33'),
(580, 'AzeriSalim', 'Sent offer', '04.03.2019', '13:16:33'),
(581, 'AzeriSalim', 'Sent answer', '04.03.2019', '13:16:33'),
(582, 'AzeriSalim', 'Sent answer', '04.03.2019', '13:16:33'),
(583, 'AzeriSalim', 'Login successfuly', '04.03.2019', '13:16:56'),
(584, 'AzeriSalim', 'Login successfuly', '04.03.2019', '13:17:30'),
(585, 'AzeriSalim', 'Login successfuly', '04.03.2019', '14:26:40'),
(586, 'AzeriSalim', 'Logout successfuly', '04.03.2019', '14:26:48'),
(587, 'admin', 'Login successfuly', '04.03.2019', '14:26:51'),
(588, 'AzeriSalim', 'Login successfuly', '04.03.2019', '14:27:52'),
(589, 'AzeriSalim', 'Logout successfuly', '04.03.2019', '14:28:45'),
(590, 'AzeriSalim', 'Login successfuly', '04.03.2019', '14:28:48'),
(591, 'AzeriSalim', 'Logout successfuly', '04.03.2019', '14:28:54'),
(592, 'AzeriSalim', 'Login successfuly', '04.03.2019', '14:32:36'),
(593, 'admin', 'Login successfuly', '05.03.2019', '1:44:49'),
(594, 'admin', 'Logout successfuly', '05.03.2019', '1:44:51'),
(595, 'admin', 'Login successfuly', '05.03.2019', '1:46:39'),
(596, 'admin', 'Logout successfuly', '05.03.2019', '1:48:37'),
(597, 'AzeriSalim', 'Login successfuly', '05.03.2019', '1:48:40'),
(598, 'AzeriSalim', 'Sent offer', '05.03.2019', '1:49:24'),
(599, 'AzeriSalim', 'Sent answer', '05.03.2019', '1:49:24'),
(600, 'AzeriSalim', 'Login successfuly', '05.03.2019', '1:50:15'),
(601, 'AzeriSalim', 'Sent offer', '05.03.2019', '1:50:34'),
(602, 'AzeriSalim', 'Sent answer', '05.03.2019', '1:50:34'),
(603, 'AzeriSalim', 'Sent offer', '05.03.2019', '1:50:47'),
(604, 'AzeriSalim', 'Sent answer', '05.03.2019', '1:50:47'),
(605, 'AzeriSalim', 'Login successfuly', '05.03.2019', '1:52:01'),
(606, 'AzeriSalim', 'Login successfuly', '05.03.2019', '1:52:15'),
(607, 'AzeriSalim', 'Sent offer', '05.03.2019', '1:52:21'),
(608, 'AzeriSalim', 'Sent answer', '05.03.2019', '1:52:21'),
(609, 'AzeriSalim', 'Sent offer', '05.03.2019', '1:53:08'),
(610, 'AzeriSalim', 'Sent answer', '05.03.2019', '1:53:08'),
(611, 'AzeriSalim', 'Sent offer', '05.03.2019', '1:54:18'),
(612, 'AzeriSalim', 'Sent answer', '05.03.2019', '1:54:18'),
(613, 'AzeriSalim', 'Sent offer', '05.03.2019', '1:54:19'),
(614, 'AzeriSalim', 'Sent answer', '05.03.2019', '1:54:19'),
(615, 'AzeriSalim', 'Sent answer', '05.03.2019', '1:54:58'),
(616, 'AzeriSalim', 'Sent offer', '05.03.2019', '1:54:59'),
(617, 'AzeriSalim', 'Sent answer', '05.03.2019', '1:54:59'),
(618, 'AzeriSalim', 'Sent offer', '05.03.2019', '1:54:59'),
(619, 'AzeriSalim', 'Sent offer', '05.03.2019', '1:56:16'),
(620, 'AzeriSalim', 'Sent answer', '05.03.2019', '1:56:16'),
(621, 'AzeriSalim', 'Sent answer', '05.03.2019', '1:56:31'),
(622, 'AzeriSalim', 'Sent offer', '05.03.2019', '1:56:31'),
(623, 'AzeriSalim', 'Sent offer', '05.03.2019', '1:57:18'),
(624, 'AzeriSalim', 'Sent answer', '05.03.2019', '1:57:18'),
(625, 'AzeriSalim', 'Sent offer', '05.03.2019', '1:57:18'),
(626, 'AzeriSalim', 'Sent answer', '05.03.2019', '1:57:18'),
(627, 'AzeriSalim', 'Sent offer', '05.03.2019', '1:58:31'),
(628, 'AzeriSalim', 'Sent offer', '05.03.2019', '1:58:31'),
(629, 'AzeriSalim', 'Logout successfuly', '05.03.2019', '1:59:05'),
(630, 'AzeriSalim', 'Login successfuly', '05.03.2019', '16:13:57'),
(631, 'AzeriSalim', 'Logout successfuly', '05.03.2019', '17:16:05'),
(632, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:16:08'),
(633, 'AzeriSalim', 'Logout successfuly', '05.03.2019', '17:17:25'),
(634, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:17:28'),
(635, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:17:55'),
(636, 'AzeriSalim', 'Logout successfuly', '05.03.2019', '17:18:08'),
(637, 'admin', 'Login successfuly', '05.03.2019', '17:18:12'),
(638, 'admin', 'Logout successfuly', '05.03.2019', '17:22:17'),
(639, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:22:21'),
(640, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:22:42'),
(641, 'AzeriSalim', 'Logout successfuly', '05.03.2019', '17:23:18'),
(642, 'admin', 'Login successfuly', '05.03.2019', '17:23:33'),
(643, 'admin', 'Logout successfuly', '05.03.2019', '17:24:29'),
(644, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:24:47'),
(645, 'AzeriSalim', 'Logout successfuly', '05.03.2019', '17:26:54'),
(646, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:27:01'),
(647, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:32:59'),
(648, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:33:18'),
(649, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:35:07'),
(650, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:35:33'),
(651, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:38:02'),
(652, 'AzeriSalim', 'Login unsuccessfuly- Incorrect data', '05.03.2019', '17:42:15'),
(653, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:42:20'),
(654, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:42:59'),
(655, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:43:14'),
(656, 'AzeriSalim', 'Logout successfuly', '05.03.2019', '17:44:06'),
(657, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:45:00'),
(658, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:46:56'),
(659, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '17:50:11'),
(660, 'AzeriSalim', 'Logout successfuly', '05.03.2019', '17:52:19'),
(661, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:52:24'),
(662, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:53:12'),
(663, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:54:24'),
(664, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:55:43'),
(665, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:57:08'),
(666, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:59:12'),
(667, 'AzeriSalim', 'Logout successfuly', '05.03.2019', '17:59:18'),
(668, 'AzeriSalim', 'Login successfuly', '05.03.2019', '17:59:40'),
(669, 'AzeriSalim', 'Logout successfuly', '05.03.2019', '17:59:41'),
(670, 'AzeriSalim', 'Login successfuly', '05.03.2019', '18:00:15'),
(671, 'AzeriSalim', 'Login successfuly', '05.03.2019', '18:01:35'),
(672, 'AzeriSalim', 'Login successfuly', '05.03.2019', '18:02:04'),
(673, 'AzeriSalim', 'Login successfuly', '05.03.2019', '18:04:40'),
(674, 'AzeriSalim', 'Login successfuly', '05.03.2019', '18:06:30'),
(675, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:6:35'),
(676, 'AzeriSalim', 'Login successfuly', '05.03.2019', '18:06:50'),
(677, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:6:53'),
(678, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:7:11'),
(679, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:7:12'),
(680, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:7:29'),
(681, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:7:29'),
(682, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:8:22'),
(683, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:8:22'),
(684, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:8:29'),
(685, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:8:29'),
(686, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:8:56'),
(687, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:8:56'),
(688, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:8:56'),
(689, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:9:02'),
(690, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:9:02'),
(691, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:9:10'),
(692, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:9:11'),
(693, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:9:24'),
(694, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:9:24'),
(695, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:9:25'),
(696, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:9:46'),
(697, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:9:47'),
(698, 'Logged as: AzeriSalim', 'Photo taken', '05.03.2019', '18:9:57'),
(699, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:10:20'),
(700, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:10:24'),
(701, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:10:32'),
(702, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:10:33'),
(703, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:10:33'),
(704, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:10:33'),
(705, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:10:34'),
(706, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:10:34'),
(707, 'Logged as: AzeriSalim', 'Photo taken', '05.03.2019', '18:10:39'),
(708, 'Logged as: AzeriSalim', 'Face Detecting started', '05.03.2019', '18:10:50'),
(709, 'Logged as: AzeriSalim', 'Face Detecting started', '05.03.2019', '18:10:53'),
(710, 'Logged as: AzeriSalim', 'Face Detecting started', '05.03.2019', '18:10:56'),
(711, 'Logged as: AzeriSalim', 'Face Detecting started', '05.03.2019', '18:10:59'),
(712, 'Logged as: AzeriSalim', 'Face Detecting started', '05.03.2019', '18:11:01'),
(713, 'AzeriSalim', 'Login successfuly', '05.03.2019', '18:12:10'),
(714, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:13:10'),
(715, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:14:31'),
(716, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:14:36'),
(717, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:15:06'),
(718, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:15:07'),
(719, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:15:08'),
(720, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:15:08'),
(721, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:15:09'),
(722, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:15:09'),
(723, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:15:09'),
(724, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:15:09'),
(725, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:15:42'),
(726, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:15:43'),
(727, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:15:45'),
(728, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:15:45'),
(729, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:15:45'),
(730, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:15:45'),
(731, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:15:45'),
(732, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:15:45'),
(733, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:16:45'),
(734, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:16:46'),
(735, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:16:46'),
(736, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:16:47'),
(737, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:16:47'),
(738, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:16:48'),
(739, 'Logged as: AzeriSalim', 'Face Detecting stopped', '05.03.2019', '18:17:19'),
(740, 'Logged as: AzeriSalim', 'Photo taken', '05.03.2019', '18:17:20'),
(741, 'Logged as: AzeriSalim', 'Photo taken', '05.03.2019', '18:17:22'),
(742, 'Logged as: AzeriSalim', 'Photo taken', '05.03.2019', '18:17:22'),
(743, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:17:47'),
(744, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:17:47'),
(745, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:17:47'),
(746, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:17:48'),
(747, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:17:48'),
(748, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:17:48'),
(749, 'AzeriSalim', 'Login successfuly', '05.03.2019', '18:18:00'),
(750, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:18:12'),
(751, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:18:12'),
(752, 'AzeriSalim', 'Login successfuly', '05.03.2019', '18:22:12'),
(753, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:22:21'),
(754, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:22:21'),
(755, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:22:21'),
(756, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:22:21'),
(757, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:22:27'),
(758, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:22:27'),
(759, 'Logged as: AzeriSalim', 'Sent offer', '05.03.2019', '18:22:41'),
(760, 'Logged as: AzeriSalim', 'Sent answer', '05.03.2019', '18:22:41'),
(761, 'AzeriSalim', 'Login successfuly', '06.03.2019', '2:04:07'),
(762, 'AzeriSalim', 'Login successfuly', '06.03.2019', '2:36:11'),
(763, 'Logged as: AzeriSalim', 'Sent offer', '06.03.2019', '2:36:26'),
(764, 'Logged as: AzeriSalim', 'Sent answer', '06.03.2019', '2:36:26'),
(765, 'Logged as: AzeriSalim', 'Sent offer', '06.03.2019', '2:36:48'),
(766, 'Logged as: AzeriSalim', 'Sent answer', '06.03.2019', '2:36:48'),
(767, 'AzeriSalim', 'Login successfuly', '06.03.2019', '2:48:45'),
(768, 'AzeriSalim', 'Login successfuly', '06.03.2019', '19:21:57'),
(769, 'Logged as: AzeriSalim', 'Sent answer', '06.03.2019', '19:22:11'),
(770, 'Logged as: AzeriSalim', 'Sent offer', '06.03.2019', '19:22:12'),
(771, 'Logged as: AzeriSalim', 'Sent answer', '06.03.2019', '19:22:13');
INSERT INTO `Logs` (`id`, `login`, `event`, `date`, `time`) VALUES
(772, 'Logged as: AzeriSalim', 'Sent offer', '06.03.2019', '19:22:13'),
(773, 'Logged as: AzeriSalim', 'Sent answer', '06.03.2019', '19:22:14'),
(774, 'Logged as: AzeriSalim', 'Sent offer', '06.03.2019', '19:22:14'),
(775, 'Logged as: AzeriSalim', 'Sent answer', '06.03.2019', '19:22:15'),
(776, 'Logged as: AzeriSalim', 'Sent offer', '06.03.2019', '19:22:16'),
(777, 'AzeriSalim', 'Login successfuly', '06.03.2019', '19:40:41'),
(778, 'admin', 'Login successfuly', '12.03.2019', '1:10:47'),
(779, 'admin', 'Login successfuly', '12.03.2019', '1:13:13'),
(780, 'undefined', 'Logout successfuly', '12.03.2019', '1:28:44'),
(781, 'AzeriSalim', 'Login successfuly', '12.03.2019', '1:28:52'),
(782, 'AzeriSalim', 'Logout successfuly', '12.03.2019', '1:29:38'),
(783, 'AzeriSalim', 'Login successfuly', '12.03.2019', '1:29:42'),
(784, 'AzeriSalim', 'Logout successfuly', '12.03.2019', '1:30:27'),
(785, 'admin', 'Login successfuly', '12.03.2019', '1:30:30'),
(786, 'admin', 'Logout successfuly', '12.03.2019', '1:30:35'),
(787, 'AzeriSalim', 'Login successfuly', '12.03.2019', '1:50:58'),
(788, 'AzeriSalim', 'Login successfuly', '12.03.2019', '1:53:58'),
(789, 'AzeriSalim', 'Login successfuly', '12.03.2019', '1:58:57'),
(790, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:01:27'),
(791, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:01:46'),
(792, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:02:01'),
(793, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:03:27'),
(794, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:04:20'),
(795, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:08:35'),
(796, 'undefined', 'Logout successfuly', '12.03.2019', '2:08:35'),
(797, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:13:22'),
(798, 'undefined', 'Logout successfuly', '12.03.2019', '2:13:22'),
(799, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:13:36'),
(800, 'undefined', 'Logout successfuly', '12.03.2019', '2:13:40'),
(801, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:14:45'),
(802, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:14:48'),
(803, 'undefined', 'Logout successfuly', '12.03.2019', '2:14:52'),
(804, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:14:55'),
(805, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:15:54'),
(806, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:17:06'),
(807, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:17:35'),
(808, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:17:54'),
(809, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:21:46'),
(810, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:22:16'),
(811, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:23:00'),
(812, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:23:22'),
(813, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:24:09'),
(814, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:25:10'),
(815, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:28:44'),
(816, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:29:00'),
(817, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:30:04'),
(818, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:32:13'),
(819, 'undefined', 'Logout successfuly', '12.03.2019', '2:32:15'),
(820, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:33:16'),
(821, 'undefined', 'Logout successfuly', '12.03.2019', '2:33:18'),
(822, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:34:31'),
(823, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:34:42'),
(824, 'undefined', 'Logout successfuly', '12.03.2019', '2:34:42'),
(825, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:34:55'),
(826, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:35:18'),
(827, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:35:42'),
(828, 'undefined', 'Logout successfuly', '12.03.2019', '2:35:47'),
(829, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:35:55'),
(830, 'undefined', 'Logout successfuly', '12.03.2019', '2:35:59'),
(831, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:36:34'),
(832, 'undefined', 'Logout successfuly', '12.03.2019', '2:36:38'),
(833, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:37:01'),
(834, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:37:30'),
(835, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:37:59'),
(836, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:38:57'),
(837, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:40:24'),
(838, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:40:43'),
(839, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:41:47'),
(840, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:42:43'),
(841, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:42:49'),
(842, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:42:51'),
(843, 'AzeriSalim', 'Logout successfuly', '12.03.2019', '2:42:51'),
(844, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:44:51'),
(845, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:44:53'),
(846, 'AzeriSalim', 'Logout successfuly', '12.03.2019', '2:44:53'),
(847, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:44:59'),
(848, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:45:01'),
(849, 'AzeriSalim', 'Logout successfuly', '12.03.2019', '2:45:01'),
(850, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:45:45'),
(851, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:45:47'),
(852, 'AzeriSalim', 'Logout successfuly', '12.03.2019', '2:45:47'),
(853, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:46:02'),
(854, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:46:04'),
(855, 'AzeriSalim', 'Logout successfuly', '12.03.2019', '2:46:04'),
(856, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:46:19'),
(857, 'Logged as: AzeriSalim', 'Sent offer', '12.03.2019', '2:46:20'),
(858, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:46:26'),
(859, 'AzeriSalim', 'Logout successfuly', '12.03.2019', '2:46:26'),
(860, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:49:43'),
(861, 'Logged as: AzeriSalim', 'Sent offer', '12.03.2019', '2:49:44'),
(862, 'AzeriSalim', 'Login successfuly', '12.03.2019', '2:49:50'),
(863, 'AzeriSalim', 'Logout successfuly', '12.03.2019', '2:49:50'),
(864, 'AzeriSalim', 'Login successfuly', '14.03.2019', '22:33:57'),
(865, 'Logged as: AzeriSalim', 'Sent answer', '14.03.2019', '22:34:05'),
(866, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '22:34:06'),
(867, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '22:34:07'),
(868, 'Logged as: AzeriSalim', 'Sent answer', '14.03.2019', '22:34:07'),
(869, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '22:34:07'),
(870, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '22:34:07'),
(871, 'Logged as: AzeriSalim', 'Sent answer', '14.03.2019', '22:34:07'),
(872, 'Logged as: AzeriSalim', 'Sent answer', '14.03.2019', '22:34:07'),
(873, 'Logged as: AzeriSalim', 'Sent answer', '14.03.2019', '22:34:16'),
(874, 'Logged as: AzeriSalim', 'Sent answer', '14.03.2019', '22:34:16'),
(875, 'Logged as: AzeriSalim', 'Sent answer', '14.03.2019', '22:34:16'),
(876, 'Logged as: AzeriSalim', 'Sent answer', '14.03.2019', '22:34:16'),
(877, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '22:34:17'),
(878, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '22:34:17'),
(879, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '22:34:17'),
(880, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '22:34:17'),
(881, 'AzeriSalim', 'Login successfuly', '14.03.2019', '22:37:36'),
(882, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '22:37:54'),
(883, 'AzeriSalim', 'Login successfuly', '14.03.2019', '22:37:58'),
(884, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '22:37:58'),
(885, 'AzeriSalim', 'Login successfuly', '14.03.2019', '22:38:19'),
(886, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '22:38:21'),
(887, 'AzeriSalim', 'Login successfuly', '14.03.2019', '22:38:26'),
(888, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '22:38:27'),
(889, 'AzeriSalim', 'Login successfuly', '14.03.2019', '22:38:53'),
(890, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '22:38:54'),
(891, 'AzeriSalim', 'Login successfuly', '14.03.2019', '22:39:01'),
(892, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '22:39:01'),
(893, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:15:17'),
(894, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:15:19'),
(895, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:15:20'),
(896, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:15:26'),
(897, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '23:15:26'),
(898, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:17:45'),
(899, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:17:47'),
(900, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:17:48'),
(901, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:17:53'),
(902, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '23:17:53'),
(903, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:18:05'),
(904, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:21:33'),
(905, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:21:35'),
(906, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:21:37'),
(907, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:21:38'),
(908, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:21:45'),
(909, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '23:21:45'),
(910, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:22:11'),
(911, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:25:25'),
(912, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:25:27'),
(913, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:25:28'),
(914, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:25:35'),
(915, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '23:25:35'),
(916, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:25:41'),
(917, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:25:44'),
(918, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:25:46'),
(919, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:25:52'),
(920, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '23:25:53'),
(921, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:26:30'),
(922, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:26:31'),
(923, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:26:33'),
(924, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:26:35'),
(925, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '23:26:35'),
(926, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:27:35'),
(927, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:27:36'),
(928, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:27:37'),
(929, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:27:40'),
(930, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '23:27:40'),
(931, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:31:44'),
(932, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:31:46'),
(933, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:31:47'),
(934, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:31:54'),
(935, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '23:31:54'),
(936, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:32:20'),
(937, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:32:23'),
(938, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:32:24'),
(939, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:32:32'),
(940, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '23:32:32'),
(941, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:35:05'),
(942, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:37:44'),
(943, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:37:46'),
(944, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:37:47'),
(945, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:37:54'),
(946, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '23:37:54'),
(947, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:51:19'),
(948, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:51:21'),
(949, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:51:22'),
(950, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:51:24'),
(951, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:51:30'),
(952, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '23:51:30'),
(953, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:51:36'),
(954, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:51:38'),
(955, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:51:40'),
(956, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:51:42'),
(957, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:51:48'),
(958, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '23:51:48'),
(959, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:52:43'),
(960, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:52:44'),
(961, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:52:47'),
(962, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:52:48'),
(963, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:52:55'),
(964, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '23:52:55'),
(965, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:54:27'),
(966, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:54:29'),
(967, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:54:32'),
(968, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:54:33'),
(969, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:54:39'),
(970, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '23:54:40'),
(971, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:54:50'),
(972, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:54:52'),
(973, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:54:54'),
(974, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:54:56'),
(975, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:55:03'),
(976, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '23:55:03'),
(977, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:55:22'),
(978, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:55:24'),
(979, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:55:25'),
(980, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:55:27'),
(981, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:55:33'),
(982, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '23:55:33'),
(983, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:57:14'),
(984, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:57:15'),
(985, 'Logged as: AzeriSalim', 'Sent offer', '14.03.2019', '23:57:17'),
(986, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:57:24'),
(987, 'AzeriSalim', 'Logout successfuly', '14.03.2019', '23:57:24'),
(988, 'AzeriSalim', 'Login successfuly', '14.03.2019', '23:57:26'),
(989, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:01:12'),
(990, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:01:14'),
(991, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:01:16'),
(992, 'Logged as: AzeriSalim', 'Sent offer', '15.03.2019', '0:1:17'),
(993, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:01:24'),
(994, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:01:24'),
(995, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:02:20'),
(996, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:02:21'),
(997, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:02:24'),
(998, 'Logged as: AzeriSalim', 'Sent offer', '15.03.2019', '0:2:26'),
(999, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:02:32'),
(1000, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:02:33'),
(1001, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:02:35'),
(1002, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:02:36'),
(1003, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:02:38'),
(1004, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:02:38'),
(1005, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:03:00'),
(1006, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:03:02'),
(1007, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:03:04'),
(1008, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:03:04'),
(1009, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:03:08'),
(1010, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:03:10'),
(1011, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:03:12'),
(1012, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:03:12'),
(1013, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:03:52'),
(1014, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:04:00'),
(1015, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:04:01'),
(1016, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:04:02'),
(1017, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:04:03'),
(1018, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:04:12'),
(1019, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:04:14'),
(1020, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:05:22'),
(1021, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:05:24'),
(1022, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:05:25'),
(1023, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:05:25'),
(1024, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:07:20'),
(1025, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:07:22'),
(1026, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:07:24'),
(1027, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:07:24'),
(1028, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:09:41'),
(1029, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:09:43'),
(1030, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:09:44'),
(1031, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:09:45'),
(1032, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:09:46'),
(1033, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:10:15'),
(1034, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:10:17'),
(1035, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:10:19'),
(1036, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:10:19'),
(1037, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:10:20'),
(1038, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:10:21'),
(1039, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:10:54'),
(1040, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:10:56'),
(1041, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:11:00'),
(1042, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:11:00'),
(1043, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:11:02'),
(1044, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:11:14'),
(1045, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:11:17'),
(1046, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:11:20'),
(1047, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:11:20'),
(1048, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:11:21'),
(1049, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:11:40'),
(1050, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:11:41'),
(1051, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:11:43'),
(1052, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:11:43'),
(1053, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:11:44'),
(1054, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:12:27'),
(1055, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:12:30'),
(1056, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:12:33'),
(1057, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:12:33'),
(1058, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:12:34'),
(1059, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:12:57'),
(1060, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:12:59'),
(1061, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:13:02'),
(1062, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:13:02'),
(1063, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:13:03'),
(1064, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:13:44'),
(1065, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:13:46'),
(1066, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:13:48'),
(1067, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:13:48'),
(1068, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:13:49'),
(1069, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:13:51'),
(1070, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:14:04'),
(1071, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:14:06'),
(1072, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:14:08'),
(1073, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:14:08'),
(1074, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:14:10'),
(1075, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:14:12'),
(1076, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:17:03'),
(1077, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:17:05'),
(1078, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:17:07'),
(1079, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:17:07'),
(1080, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:17:09'),
(1081, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:17:12'),
(1082, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:17:36'),
(1083, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:17:38'),
(1084, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:17:39'),
(1085, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:17:40'),
(1086, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:17:41'),
(1087, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:17:43'),
(1088, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:17:57'),
(1089, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:17:58'),
(1090, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:18:00'),
(1091, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:18:00'),
(1092, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:18:01'),
(1093, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:18:04'),
(1094, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:18:19'),
(1095, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:18:21'),
(1096, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:18:22'),
(1097, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:18:22'),
(1098, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:18:24'),
(1099, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:18:26'),
(1100, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:19:49'),
(1101, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:19:51'),
(1102, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:19:53'),
(1103, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:19:53'),
(1104, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:19:54'),
(1105, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:19:58'),
(1106, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:20:00'),
(1107, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:21:21'),
(1108, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:21:23'),
(1109, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:21:25'),
(1110, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:21:25'),
(1111, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:21:26'),
(1112, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:21:29'),
(1113, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:21:31'),
(1114, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:21:41'),
(1115, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:21:43'),
(1116, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:21:45'),
(1117, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:21:47'),
(1118, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:21:47'),
(1119, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:21:48'),
(1120, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:21:51'),
(1121, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:21:53'),
(1122, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:22:00'),
(1123, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:22:02'),
(1124, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:22:04'),
(1125, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:22:06'),
(1126, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:22:06'),
(1127, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:22:07'),
(1128, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:22:09'),
(1129, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:22:12'),
(1130, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:22:33'),
(1131, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:22:35'),
(1132, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:22:36'),
(1133, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:22:38'),
(1134, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:22:38'),
(1135, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:22:39'),
(1136, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:22:42'),
(1137, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:22:44'),
(1138, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:31:56'),
(1139, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:31:58'),
(1140, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:32:00'),
(1141, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:32:01'),
(1142, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:32:02'),
(1143, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:32:03'),
(1144, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:32:05'),
(1145, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:32:08'),
(1146, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:32:11'),
(1147, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:35:51'),
(1148, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:35:53'),
(1149, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:35:55'),
(1150, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:35:58'),
(1151, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:35:58'),
(1152, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:35:59'),
(1153, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:36:01'),
(1154, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:36:03'),
(1155, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:36:06'),
(1156, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:36:06'),
(1157, 'admin', 'Login successfuly', '15.03.2019', '0:36:07'),
(1158, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:36:44'),
(1159, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:37:08'),
(1160, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:37:20'),
(1161, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:37:21'),
(1162, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:37:24'),
(1163, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:37:25'),
(1164, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:37:25'),
(1165, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:37:27'),
(1166, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:37:29'),
(1167, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:37:30'),
(1168, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:37:32'),
(1169, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:38:14'),
(1170, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:38:16'),
(1171, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:38:19'),
(1172, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:38:21'),
(1173, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:38:21'),
(1174, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:38:22'),
(1175, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:38:24'),
(1176, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:38:26'),
(1177, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:38:28'),
(1178, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:38:28'),
(1179, 'admin', 'Login successfuly', '15.03.2019', '0:38:29'),
(1180, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:38:31'),
(1181, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:38:31'),
(1182, 'admin', 'Login successfuly', '15.03.2019', '0:38:32'),
(1183, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:39:43'),
(1184, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:39:44'),
(1185, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:39:46'),
(1186, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:39:47'),
(1187, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:39:48'),
(1188, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:39:49'),
(1189, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:39:50'),
(1190, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:39:52'),
(1191, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:39:53'),
(1192, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:39:53'),
(1193, 'admin', 'Login successfuly', '15.03.2019', '0:39:54'),
(1194, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:39:56'),
(1195, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:39:56'),
(1196, 'admin', 'Login successfuly', '15.03.2019', '0:39:57'),
(1197, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:41:13'),
(1198, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:41:21'),
(1199, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:42:15'),
(1200, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:42:18'),
(1201, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:42:24'),
(1202, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:42:25'),
(1203, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:42:27'),
(1204, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:42:28'),
(1205, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:42:31'),
(1206, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:42:32'),
(1207, 'admin', 'Login successfuly', '15.03.2019', '0:42:32'),
(1208, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:42:34'),
(1209, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:42:34'),
(1210, 'admin', 'Login successfuly', '15.03.2019', '0:42:35'),
(1211, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:42:37'),
(1212, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:42:39'),
(1213, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:42:41'),
(1214, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:42:43'),
(1215, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:42:47'),
(1216, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:42:49'),
(1217, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:42:51'),
(1218, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:42:51'),
(1219, 'admin', 'Login successfuly', '15.03.2019', '0:42:52'),
(1220, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:42:53'),
(1221, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:42:54'),
(1222, 'admin', 'Login successfuly', '15.03.2019', '0:42:54'),
(1223, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:43:26'),
(1224, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:43:28'),
(1225, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:43:31'),
(1226, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:43:33'),
(1227, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:43:35'),
(1228, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:43:38'),
(1229, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:43:39'),
(1230, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:43:40'),
(1231, 'admin', 'Login successfuly', '15.03.2019', '0:43:40'),
(1232, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:43:42'),
(1233, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:43:42'),
(1234, 'admin', 'Login successfuly', '15.03.2019', '0:43:43'),
(1235, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:43:44'),
(1236, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:43:44'),
(1237, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:43:49'),
(1238, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:43:51'),
(1239, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:43:53'),
(1240, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:43:55'),
(1241, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:43:57'),
(1242, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:43:58'),
(1243, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:44:01'),
(1244, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:44:01'),
(1245, 'admin', 'Login successfuly', '15.03.2019', '0:44:02'),
(1246, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:44:03'),
(1247, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:44:03'),
(1248, 'admin', 'Login successfuly', '15.03.2019', '0:44:04'),
(1249, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:44:05'),
(1250, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:44:05'),
(1251, 'admin', 'Login successfuly', '15.03.2019', '0:44:06'),
(1252, 'admin', 'Logout successfuly', '15.03.2019', '0:44:20'),
(1253, 'admin', 'Login successfuly', '15.03.2019', '0:44:24'),
(1254, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:46:19'),
(1255, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:46:21'),
(1256, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:46:24'),
(1257, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:46:25'),
(1258, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:46:27'),
(1259, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:46:29'),
(1260, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:46:31'),
(1261, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:46:31'),
(1262, 'admin', 'Login successfuly', '15.03.2019', '0:46:32'),
(1263, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:46:34'),
(1264, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:46:34'),
(1265, 'admin', 'Login successfuly', '15.03.2019', '0:46:35'),
(1266, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:46:37'),
(1267, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:46:37'),
(1268, 'admin', 'Login successfuly', '15.03.2019', '0:46:38'),
(1269, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:47:47'),
(1270, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:47:49'),
(1271, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:47:51'),
(1272, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:47:53'),
(1273, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:47:55'),
(1274, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:47:58'),
(1275, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:48:01'),
(1276, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:48:01'),
(1277, 'admin', 'Login successfuly', '15.03.2019', '0:48:01'),
(1278, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:48:03'),
(1279, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:48:03'),
(1280, 'admin', 'Login successfuly', '15.03.2019', '0:48:04'),
(1281, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:48:05'),
(1282, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:48:06'),
(1283, 'admin', 'Login successfuly', '15.03.2019', '0:48:06'),
(1284, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:50:30'),
(1285, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:50:32'),
(1286, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:50:34'),
(1287, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:50:36'),
(1288, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:50:38'),
(1289, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:50:41'),
(1290, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:50:43'),
(1291, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:50:43'),
(1292, 'admin', 'Login successfuly', '15.03.2019', '0:50:44'),
(1293, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:50:45'),
(1294, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:50:45'),
(1295, 'admin', 'Login successfuly', '15.03.2019', '0:50:46'),
(1296, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:50:48'),
(1297, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:51:43'),
(1298, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:51:46'),
(1299, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:51:47'),
(1300, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:51:49'),
(1301, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:51:52'),
(1302, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:51:55'),
(1303, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:51:56'),
(1304, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:51:56'),
(1305, 'admin', 'Login successfuly', '15.03.2019', '0:51:57'),
(1306, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:51:59'),
(1307, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:51:59'),
(1308, 'admin', 'Login successfuly', '15.03.2019', '0:52:00'),
(1309, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:52:01'),
(1310, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:52:01'),
(1311, 'admin', 'Login successfuly', '15.03.2019', '0:52:02'),
(1312, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:53:00'),
(1313, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:53:02'),
(1314, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:53:04'),
(1315, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:53:07'),
(1316, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:53:08'),
(1317, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:53:10'),
(1318, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:53:11'),
(1319, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:53:13'),
(1320, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:53:13'),
(1321, 'admin', 'Login successfuly', '15.03.2019', '0:53:14'),
(1322, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:53:16'),
(1323, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:53:16'),
(1324, 'admin', 'Login successfuly', '15.03.2019', '0:53:17'),
(1325, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:53:19'),
(1326, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:53:19'),
(1327, 'admin', 'Login successfuly', '15.03.2019', '0:53:19'),
(1328, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:54:54'),
(1329, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:54:58'),
(1330, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:55:00'),
(1331, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:55:03'),
(1332, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:55:05'),
(1333, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:55:07'),
(1334, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:55:10'),
(1335, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:55:10'),
(1336, 'admin', 'Login successfuly', '15.03.2019', '0:55:10'),
(1337, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:55:12'),
(1338, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:55:12'),
(1339, 'admin', 'Login successfuly', '15.03.2019', '0:55:12'),
(1340, 'AzeriSalim', 'Login successfuly', '15.03.2019', '0:55:14'),
(1341, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '0:55:14'),
(1342, 'admin', 'Login successfuly', '15.03.2019', '0:55:15'),
(1343, 'AzeriSalim', 'Login successfuly', '15.03.2019', '1:04:18'),
(1344, 'AzeriSalim', 'Login successfuly', '15.03.2019', '1:05:40'),
(1345, 'AzeriSalim', 'Login successfuly', '15.03.2019', '1:06:16'),
(1346, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '1:06:18'),
(1347, 'admin', 'Login successfuly', '15.03.2019', '1:06:19'),
(1348, 'AzeriSalim', 'Login successfuly', '15.03.2019', '1:08:44'),
(1349, 'AzeriSalim', 'Login successfuly', '15.03.2019', '1:08:55'),
(1350, 'AzeriSalim', 'Login successfuly', '15.03.2019', '1:09:08'),
(1351, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '1:09:10'),
(1352, 'admin', 'Login successfuly', '15.03.2019', '1:09:11'),
(1353, 'AzeriSalim', 'Login successfuly', '15.03.2019', '1:09:30'),
(1354, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '1:09:32'),
(1355, 'admin', 'Login successfuly', '15.03.2019', '1:09:33'),
(1356, 'AzeriSalim', 'Login successfuly', '15.03.2019', '1:39:45'),
(1357, 'AzeriSalim', 'Logout successfuly', '15.03.2019', '1:39:48'),
(1358, 'admin', 'Login successfuly', '15.03.2019', '1:39:49'),
(1359, 'admin', 'Login successfuly', '15.03.2019', '1:45:50'),
(1360, 'undefined', 'Logout successfuly', '15.03.2019', '1:48:59'),
(1361, 'admin', 'Login successfuly', '15.03.2019', '1:49:02'),
(1362, 'admin', 'Login successfuly', '15.03.2019', '1:53:44'),
(1363, 'admin', 'Login successfuly', '15.03.2019', '1:54:27'),
(1364, 'admin', 'Login successfuly', '15.03.2019', '1:56:31');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Users`
--

INSERT INTO `Users` (`id`, `email`, `login`, `password`) VALUES
(15, '', 'admin', '$2b$10$r2493fLhRqOZdS6WF/0oauD7LRuJjcbYQuWV.j9cLxIKEvTB2Du96'),
(16, '19salimazeri96@gmail.com', 'Darek', '$2b$10$7zGUPas91XbWI5FmE9mKKeJ0JCT1VO2mnpiVFCUKpIXLO/5ZE0ODK'),
(17, 'salim.azeri@smcebi.edu.pl', 'MonikaStuchlik', '$2b$10$A5TIv.MMuic25.2405ZsdO3il6UMFmo9FBo7MrYSh/O8EqAQCTVcG'),
(20, 'salim.azeri@smcebi.edu.pl', 'sdfsdfdsfsdfsdf', '$2b$10$TcjJIRW3dlRvWXh8C/2Gi.aIuXXjxAn0rhK44sYGtyLF16T6JZp5S'),
(21, 'fosdkofsdkf@okfodskfodsf.pl', 'useruseruser', '$2b$10$ZqzdUXlPqIpGmFD1o1jsKOuzsNvqxE1O5c/t3fonocou7BEGIVxA2'),
(29, 'dsds', 'dsdsdsds', 'qqqqqqq'),
(31, 'salim.azeri@smcebi.edu.pl', 'AzeriSalim', '$2b$10$.j1h8iYUXnWSpcr66lo9tOHUba2wG7nzGMkzxtX7.85zcIpHI3uDG');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `Logs`
--
ALTER TABLE `Logs`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `Logs`
--
ALTER TABLE `Logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1365;

--
-- AUTO_INCREMENT dla tabeli `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- Baza danych: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Zrzut danych tabeli `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"snap_to_grid\":\"off\",\"relation_lines\":\"true\",\"angular_direct\":\"direct\"}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Zrzut danych tabeli `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'BazaDanych', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"BazaDanych\",\"phpmyadmin\",\"test\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Struktura tabeli @TABLE@\",\"latex_structure_continued_caption\":\"Struktura tabeli @TABLE@ (kontynuacja)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"ZawartoÅ›Ä‡ tabeli @TABLE@\",\"latex_data_continued_caption\":\"ZawartoÅ›Ä‡ tabeli @TABLE@ (kontynuacja)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Zrzut danych tabeli `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"BazaDanych\",\"table\":\"Users\"},{\"db\":\"BazaDanych\",\"table\":\"Logs\"}]');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Zrzut danych tabeli `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'BazaDanych', 'Users', '[]', '2019-02-21 19:39:37');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Zrzut danych tabeli `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2019-03-20 21:34:32', '{\"lang\":\"pl\",\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indeksy dla tabeli `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indeksy dla tabeli `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indeksy dla tabeli `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indeksy dla tabeli `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indeksy dla tabeli `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indeksy dla tabeli `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indeksy dla tabeli `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indeksy dla tabeli `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indeksy dla tabeli `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indeksy dla tabeli `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Baza danych: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
