-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2020 at 10:26 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_earnings`
--

CREATE TABLE `admin_earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `purposes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `affiliates`
--

CREATE TABLE `affiliates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `student_account_id` bigint(20) UNSIGNED NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) NOT NULL DEFAULT 0,
  `is_cancel` tinyint(1) NOT NULL DEFAULT 0,
  `balance` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_histories`
--

CREATE TABLE `affiliate_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `affiliate_id` bigint(20) UNSIGNED DEFAULT NULL,
  `refer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_payments`
--

CREATE TABLE `affiliate_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `current_balance` double DEFAULT NULL,
  `process` enum('Bank','Paypal','Stripe') COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_account_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Request','Confirm') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_change_date` datetime DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `affiliate_id` bigint(20) UNSIGNED DEFAULT NULL,
  `confirm_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_password_resets`
--

CREATE TABLE `api_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_price` double DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_popular` tinyint(1) NOT NULL DEFAULT 0,
  `top` tinyint(1) NOT NULL DEFAULT 0,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `parent_category_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `is_popular`, `top`, `icon`, `is_published`, `parent_category_id`, `created_at`, `updated_at`) VALUES
(1, 'Web Development', 'web-development', 1, 1, 'uploads/category/8zDbVpP9bY72rDarU7aUS89OHT38b56MTUmpOzwB.jpeg', 1, 0, '2020-06-09 09:48:52', '2020-06-11 11:18:23'),
(2, 'Education', 'education', 1, 0, 'uploads/category/zI9DWeCynrZ6xz6YAlaHiK7PfMWJi5bFojDKcYb0.jpeg', 1, 0, '2020-06-09 10:35:08', '2020-06-10 13:58:23'),
(3, 'Business', 'business', 1, 0, 'uploads/category/Og49LEoPOOH2ovICL3IXEdNuuCx1OxKmeEJqQ7cp.jpeg', 1, 0, '2020-06-10 02:01:03', '2020-06-10 13:58:24'),
(4, 'Finance and Banking', 'finance-and-banking', 0, 0, 'uploads/category/gledLNwJwa9olfiD3Bcc9LgnEy8FK0obSXqYsZgB.jpeg', 1, 3, '2020-06-10 02:01:48', '2020-06-12 04:49:21'),
(5, 'Marketing', 'marketing', 1, 0, 'uploads/category/2D9dTYUCjXGuFdijmtukp7qvxPxmVmmmNcZ2ouKV.jpeg', 1, 0, '2020-06-10 02:02:49', '2020-06-10 13:58:25'),
(6, 'Photography', 'photography', 1, 1, 'uploads/category/YArm0XhuX6OBNSvDImoPEC6Sfc06F7vHEqK49AuN.jpeg', 1, 0, '2020-06-10 02:19:05', '2020-06-10 13:58:46'),
(7, 'Music', 'music', 1, 0, 'uploads/category/W3EIpA6eX4SeR3SCTE7NqwHXiA4yR8n74EFMQU72.jpeg', 1, 0, '2020-06-10 02:19:58', '2020-06-10 13:58:26');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `title`, `course_id`, `priority`, `is_published`, `deleted_at`, `created_at`, `updated_at`) VALUES
(5, 'Introduction', 11, 0, 1, NULL, '2020-06-10 07:33:45', '2020-06-10 07:33:45'),
(6, 'Basic knowledge', 11, 0, 1, NULL, '2020-06-10 07:34:53', '2020-06-10 07:34:53'),
(7, 'Diving into deep', 11, 0, 1, '2020-06-11 00:13:13', '2020-06-10 07:35:25', '2020-06-11 00:13:13'),
(8, 'Introduction', 1, 0, 1, NULL, '2020-06-10 07:33:45', '2020-06-10 07:33:45'),
(9, 'Basic knowledge', 1, 0, 1, NULL, '2020-06-10 07:34:53', '2020-06-10 07:34:53'),
(10, 'Diving into deep', 1, 0, 1, '2020-06-11 00:13:34', '2020-06-10 07:35:25', '2020-06-11 00:13:34'),
(11, 'Introduction', 2, 0, 1, NULL, '2020-06-10 07:33:45', '2020-06-10 07:33:45'),
(12, 'Basic knowledge', 2, 0, 1, NULL, '2020-06-10 07:34:53', '2020-06-10 07:34:53'),
(13, 'Diving into deep', 2, 0, 1, '2020-06-11 00:14:34', '2020-06-10 07:35:25', '2020-06-11 00:14:34'),
(14, 'Introduction', 5, 0, 1, NULL, '2020-06-10 07:33:45', '2020-06-10 07:33:45'),
(15, 'Basic knowledge', 5, 0, 1, NULL, '2020-06-10 07:34:53', '2020-06-10 07:34:53'),
(16, 'Diving into deep', 5, 0, 1, '2020-06-11 00:15:22', '2020-06-10 07:35:25', '2020-06-11 00:15:22'),
(17, 'Introduction', 6, 0, 1, NULL, '2020-06-10 07:33:45', '2020-06-10 07:33:45'),
(18, 'Basic knowledge', 6, 0, 1, NULL, '2020-06-10 07:34:53', '2020-06-10 07:34:53'),
(19, 'Diving into deep', 6, 0, 1, '2020-06-11 00:15:40', '2020-06-10 07:35:25', '2020-06-11 00:15:40'),
(20, 'Introduction', 9, 0, 1, NULL, '2020-06-10 07:33:45', '2020-06-10 07:33:45'),
(21, 'Basic knowledge', 9, 0, 1, NULL, '2020-06-10 07:34:53', '2020-06-10 07:34:53'),
(22, 'Diving into deep', 9, 0, 1, NULL, '2020-06-10 07:35:25', '2020-06-10 07:35:25'),
(23, 'Introduction', 19, 0, 1, NULL, '2020-06-11 00:30:52', '2020-06-11 00:30:52'),
(24, 'Basic knowledge', 19, 0, 1, NULL, '2020-06-11 00:31:04', '2020-06-11 00:31:04'),
(25, 'Introduction', 20, 0, 1, NULL, '2020-06-11 00:40:48', '2020-06-11 00:40:48'),
(26, 'Diving into deep', 20, 0, 1, NULL, '2020-06-11 00:40:59', '2020-06-11 00:40:59'),
(27, 'Introduction', 21, 0, 1, NULL, '2020-06-11 00:52:06', '2020-06-11 00:52:06'),
(28, 'Diving into deep', 21, 0, 1, NULL, '2020-06-11 00:52:13', '2020-06-11 00:52:13'),
(29, 'Introduction', 22, 0, 1, NULL, '2020-06-11 00:59:40', '2020-06-11 00:59:40');

-- --------------------------------------------------------

--
-- Table structure for table `class_contents`
--

CREATE TABLE `class_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type` enum('Video','Document') COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` enum('Youtube','HTML5','Vimeo','File') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `is_preview` tinyint(1) NOT NULL DEFAULT 0,
  `source_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_contents`
--

INSERT INTO `class_contents` (`id`, `title`, `content_type`, `provider`, `video_url`, `duration`, `file`, `description`, `class_id`, `priority`, `is_published`, `is_preview`, `source_code`, `deleted_at`, `created_at`, `updated_at`) VALUES
(5, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 5, 1, 1, 0, NULL, NULL, '2020-06-10 07:35:47', '2020-06-11 15:48:15'),
(6, 'Starting from scratch', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 5, 2, 1, 0, NULL, NULL, '2020-06-10 07:36:20', '2020-06-11 15:48:15'),
(7, 'Important Announcement', 'Document', NULL, NULL, NULL, 'uploads/class_contents/KBpAR5ae5YF9eisRvoxHOjfHIMO0IxFK0trBdH5F.jpeg', NULL, 5, 0, 1, 0, 'uploads/class_source_codes/DhPorF4ppJKg0fudLzFIxByrGvUWbGCIaKeae5fd.zip', '2020-06-11 00:12:45', '2020-06-10 07:37:26', '2020-06-11 00:12:45'),
(8, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 6, 3, 1, 0, NULL, NULL, '2020-06-10 07:38:56', '2020-06-11 15:48:07'),
(9, 'Diving into deep', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 6, 4, 1, 0, NULL, NULL, '2020-06-10 07:39:18', '2020-06-11 15:48:07'),
(10, 'Important Announcement', 'Video', NULL, NULL, NULL, NULL, NULL, 7, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:33', '2020-06-10 07:39:33'),
(11, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 8, 0, 1, 0, NULL, NULL, '2020-06-10 07:35:47', '2020-06-10 07:35:47'),
(12, 'Starting from scratch', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 8, 0, 1, 0, NULL, NULL, '2020-06-10 07:36:20', '2020-06-10 07:36:20'),
(13, 'Important Announcement', 'Document', NULL, NULL, NULL, 'uploads/class_contents/KBpAR5ae5YF9eisRvoxHOjfHIMO0IxFK0trBdH5F.jpeg', NULL, 8, 0, 1, 0, 'uploads/class_source_codes/DhPorF4ppJKg0fudLzFIxByrGvUWbGCIaKeae5fd.zip', '2020-06-11 00:13:26', '2020-06-10 07:37:26', '2020-06-11 00:13:26'),
(14, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 9, 0, 1, 0, NULL, NULL, '2020-06-10 07:38:56', '2020-06-10 07:38:56'),
(15, 'Diving into deep', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 9, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:18', '2020-06-10 07:39:18'),
(16, 'Important Announcement', 'Video', NULL, NULL, NULL, NULL, NULL, 10, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:33', '2020-06-10 07:39:33'),
(17, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 11, 0, 1, 0, NULL, NULL, '2020-06-10 07:35:47', '2020-06-10 07:35:47'),
(18, 'Starting from scratch', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 11, 0, 1, 0, NULL, NULL, '2020-06-10 07:36:20', '2020-06-10 07:36:20'),
(19, 'Important Announcement', 'Document', NULL, NULL, NULL, 'uploads/class_contents/KBpAR5ae5YF9eisRvoxHOjfHIMO0IxFK0trBdH5F.jpeg', NULL, 11, 0, 1, 0, 'uploads/class_source_codes/DhPorF4ppJKg0fudLzFIxByrGvUWbGCIaKeae5fd.zip', '2020-06-11 00:13:46', '2020-06-10 07:37:26', '2020-06-11 00:13:46'),
(20, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 12, 0, 1, 0, NULL, NULL, '2020-06-10 07:38:56', '2020-06-10 07:38:56'),
(21, 'Diving into deep', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 12, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:18', '2020-06-10 07:39:18'),
(22, 'Important Announcement', 'Video', NULL, NULL, NULL, NULL, NULL, 13, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:33', '2020-06-10 07:39:33'),
(23, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 14, 0, 1, 0, NULL, NULL, '2020-06-10 07:35:47', '2020-06-10 07:35:47'),
(24, 'Starting from scratch', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 14, 0, 1, 0, NULL, NULL, '2020-06-10 07:36:20', '2020-06-10 07:36:20'),
(25, 'Important Announcement', 'Document', NULL, NULL, NULL, 'uploads/class_contents/KBpAR5ae5YF9eisRvoxHOjfHIMO0IxFK0trBdH5F.jpeg', NULL, 14, 0, 1, 0, 'uploads/class_source_codes/DhPorF4ppJKg0fudLzFIxByrGvUWbGCIaKeae5fd.zip', '2020-06-11 00:15:18', '2020-06-10 07:37:26', '2020-06-11 00:15:18'),
(26, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 15, 0, 1, 0, NULL, NULL, '2020-06-10 07:38:56', '2020-06-10 07:38:56'),
(27, 'Diving into deep', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 15, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:18', '2020-06-10 07:39:18'),
(28, 'Important Announcement', 'Video', NULL, NULL, NULL, NULL, NULL, 16, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:33', '2020-06-10 07:39:33'),
(29, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 17, 0, 1, 0, NULL, NULL, '2020-06-10 07:35:47', '2020-06-10 07:35:47'),
(30, 'Starting from scratch', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 17, 0, 1, 0, NULL, NULL, '2020-06-10 07:36:20', '2020-06-10 07:36:20'),
(31, 'Important Announcement', 'Document', NULL, NULL, NULL, 'uploads/class_contents/KBpAR5ae5YF9eisRvoxHOjfHIMO0IxFK0trBdH5F.jpeg', NULL, 17, 0, 1, 0, 'uploads/class_source_codes/DhPorF4ppJKg0fudLzFIxByrGvUWbGCIaKeae5fd.zip', '2020-06-11 00:15:35', '2020-06-10 07:37:26', '2020-06-11 00:15:35'),
(32, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 18, 0, 1, 0, NULL, NULL, '2020-06-10 07:38:56', '2020-06-10 07:38:56'),
(33, 'Diving into deep', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 18, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:18', '2020-06-10 07:39:18'),
(34, 'Important Announcement', 'Video', NULL, NULL, NULL, NULL, NULL, 19, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:33', '2020-06-10 07:39:33'),
(35, 'Starting from scratch', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 20, 0, 1, 0, NULL, NULL, '2020-06-10 07:36:20', '2020-06-10 07:36:20'),
(36, 'Important Announcement', 'Document', NULL, NULL, NULL, 'uploads/class_contents/KBpAR5ae5YF9eisRvoxHOjfHIMO0IxFK0trBdH5F.jpeg', NULL, 20, 0, 1, 0, 'uploads/class_source_codes/DhPorF4ppJKg0fudLzFIxByrGvUWbGCIaKeae5fd.zip', '2020-06-11 00:16:09', '2020-06-10 07:37:26', '2020-06-11 00:16:09'),
(37, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 20, 0, 1, 0, NULL, '2020-06-11 00:15:57', '2020-06-10 07:38:56', '2020-06-11 00:15:57'),
(38, 'Diving into deep', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 21, 0, 1, 0, NULL, NULL, '2020-06-10 07:39:18', '2020-06-10 07:39:18'),
(39, 'Important Announcement', 'Video', NULL, NULL, NULL, NULL, NULL, 21, 0, 1, 0, NULL, '2020-06-11 00:16:15', '2020-06-10 07:39:33', '2020-06-11 00:16:15'),
(40, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 22, 0, 1, 0, NULL, NULL, '2020-06-10 07:35:47', '2020-06-10 07:35:47'),
(41, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 23, 0, 1, 1, 'uploads/class_source_codes/Gda9sKA4sMA67soA3Mt4dSUL6nkl3buP8s8v6zZC.zip', NULL, '2020-06-11 00:31:28', '2020-06-11 00:34:40'),
(42, 'Diving into deep', 'Document', NULL, NULL, NULL, 'uploads/class_contents/1l0Rgmmik4lXyi7qcPqBXyoR6iPxMqJtvWCihJ8B.zip', '<p>This is the document details</p>', 23, 0, 1, 0, NULL, NULL, '2020-06-11 00:32:01', '2020-06-11 00:34:39'),
(43, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 24, 0, 1, 0, 'uploads/class_source_codes/WEWZmc9x803yfvW5NKseDULQcSTZrjWZ5q9rhU0U.zip', NULL, '2020-06-11 00:32:19', '2020-06-11 00:32:19'),
(44, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 25, 0, 1, 1, NULL, NULL, '2020-06-11 00:41:12', '2020-06-11 00:56:00'),
(45, 'Important Announcement', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 25, 0, 1, 1, 'uploads/class_source_codes/JYcW06ECKIkUW8YQKjKJX7GooG3RkhRCl9S8TJTo.zip', NULL, '2020-06-11 00:41:35', '2020-06-11 00:56:04'),
(46, 'Diving into deep', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 26, 0, 1, 0, NULL, NULL, '2020-06-11 00:41:49', '2020-06-11 00:41:49'),
(47, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 27, 0, 1, 1, NULL, NULL, '2020-06-11 00:55:14', '2020-06-11 00:55:18'),
(48, 'Basic knowledge', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 27, 0, 1, 1, NULL, NULL, '2020-06-11 00:55:32', '2020-06-11 00:55:34'),
(49, 'Diving into deep', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 28, 0, 1, 0, NULL, NULL, '2020-06-11 00:55:48', '2020-06-11 00:55:48'),
(50, 'Introduction', 'Video', 'Youtube', 'https://youtu.be/_rKk-urv1Is', 2296, NULL, NULL, 29, 0, 1, 1, NULL, NULL, '2020-06-11 00:59:56', '2020-06-11 01:00:01');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('Beginner','Advanced','All Levels') COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` enum('1','2','3','4','5') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `short_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overview_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` enum('Youtube','HTML5','Vimeo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `requirement` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `outcome` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `tag` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_free` tinyint(1) NOT NULL DEFAULT 0,
  `price` double DEFAULT NULL,
  `is_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_price` double DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'english',
  `meta_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `slug`, `level`, `rating`, `short_description`, `big_description`, `image`, `overview_url`, `provider`, `requirement`, `outcome`, `tag`, `is_free`, `price`, `is_discount`, `discount_price`, `language`, `meta_title`, `meta_description`, `is_published`, `user_id`, `category_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Wordpress For Beginner', 'wordpress-for-beginner', 'Beginner', '1', '<h3 class=\"widget-title\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 700; font-size: 24px; color: rgb(35, 61, 99); font-family: Mukta, sans-serif;\">What you\'ll learn?</h3><ul class=\"list-items mt-3\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-type: none; display: flex; flex-wrap: wrap; color: rgb(127, 136, 151); font-family: Mukta, sans-serif;\"><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Proven Tips and Tricks of the Digital Marketing Trade</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Growth Hacking</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Unique Ways of Promoting a Business from Scratch</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Inbound Marketing</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;How to Generate More Traffic and Leads for Your Brand</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Marketing Strategy</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Digital Marketing Tools and Strategies</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Income Statements</li></ul>', '<p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">****UPDATED WITH&nbsp;A 273-PAGE&nbsp;NOTEBOOK &amp;&nbsp;NEW&nbsp;LESSONS****</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\"><em>This online photography course will teach you how to take amazing images and even sell them, whether you use a smartphone, mirrorless or&nbsp;DSLR camera.</em></span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">This photography&nbsp;course is designed to teach you the ins and outs of photography, even if you have little to no experience with it, to help create profitable images that help you stand out from the crowd and sell.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Master Photography Techniques to Create Extraordinary Images!</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">While there are plenty of digital photography courses that focus on specific styles or how to use gear, it\'s hard to find a comprehensive course like this one, which is for beginner to advanced photographers.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">This course is designed for all levels of photographers who want to improve their skills, take stellar images, and make money with their photos - especially great for any DSLR or mirrorless camera user.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">What will you learn:</span></p><ul style=\"list-style-position: initial; list-style-image: initial; margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; padding: 0px 0px 0px 35px; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Understand how cameras work and what gear you need</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Master shooting in manual mode and understanding your camera</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Know what equipment you should buy no matter what your budget is</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Follow our practical demonstrations to see how we shoot in real-world scenarios</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Use composition, lighting, and proper settings to take better photos</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Edit photos professionally to make them look even better</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Learn start a photography business and make money from your new skills</p></li></ul><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Styles of photography you will learn:</span></p><ul style=\"list-style-position: initial; list-style-image: initial; margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; padding: 0px 0px 0px 35px; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Portrait photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Long exposure photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Landscape photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Product photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Low light photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Sports and action photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Street photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Architecture photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Event and wedding photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Aerial and drone photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Wildlife photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Night photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">DSLR&nbsp;photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Mirrorless photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Smartphone photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">and more!</p></li></ul><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Improve Your Photography Techniques, Acquire Clients, And Make More Money</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Regardless of what your level of experience is or what type of camera you use, this in-depth course is designed to provide you with everything you need to take your photography skills to the next level.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Whether you prefer taking photos of nature, animals, or people, a great photographer knows how to compose a shot, light it, and edit it. By honing these skills, you can sell your photos so you can turn your passion into a career. This course shows you how.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Unlike other photography classes that are more limited in scope, this complete course teaches you how to take amazing photos and how to make money by selling them.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Contents and Overview</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">This course is aimed at teaching photographers what it takes to improve your techniques to earn more money.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">You\'ll start with the basics and tackle how a camera operates, the types of cameras and lenses available, and equipment you\'ll need for accomplishing your goals. You\'ll then dive into the different styles of photography you can focus on.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">You\'ll learn about your camera settings (DSLR, mirrorless, or other), including how to shoot in manual mode. You\'ll use stabilization tools and master how to properly compose and light a scene. You\'ll even learn how to take great photos with a smartphone or tablet and how to edit images.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">So you can sell your photos, you\'ll learn how to brand yourself, create a portfolio and website, and find freelance work or a full-time position. Gain insight into licensing, fair use, and more. And if you want to get into wedding photography, you\'ll learn how to start your own business.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">By the end of this master course, your confidence as a photographer will soar. You\'ll have a thorough understanding of your camera and gear so you can use them to their fullest potential to take unforgettable photos and start a profitable photography career.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">What camera should you use?</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">A DSLR camera or mirrorless camera is a great option for taking this course. It doesn\'t have to be an expensive or fancy model. Any interchangeable lens camera like a DSLR or mirrorless is fine. You can even use a smartphone or point and shoot camera, although you may not have all the manual settings and options that we cover in this course.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Who are the Instructors?</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Phil Ebiner, Sam Shimizu-Jones, and Will Carnahan - all professionals making a living from their photographic skills, have come together to create this amazing new course.&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Phil &amp; Sam, creators of the original Photography Masterclass, took the feedback left from students to make this course even better. Will has come on board to share his passion and in-depth knowledge of photography with you.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">With 3 instructors, you\'ll get premium support and feedback to help you become a better photographer!</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Our happiness guarantee...<br></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">We have a&nbsp;<span style=\"font-weight: 700;\">30-day 100% money back guarantee,&nbsp;</span>so if you aren\'t happy with your purchase, we will refund your course -&nbsp;<em>no questions asked!</em></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">We can\'t wait to see you in the course!</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Enroll now, and we\'ll help you take better photos than ever before!</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Phil, Sam, &amp; Will</p><div class=\"audience\" data-purpose=\"course-audience\" style=\"margin-top: 20px; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><div class=\"audience__title\" style=\"font-size: 18px; font-weight: 700; margin: 0px 0px 10px;\">Who this course is for:</div><ul class=\"audience__list\" style=\"list-style-position: initial; list-style-image: initial; margin-right: 0px; margin-bottom: 10.5px; margin-left: 10px; padding: 0px 0px 0px 35px;\"><li>Anyone who wants to take better photos</li><li>Absolute beginners who want to become skilled photographers</li><li>Moms, dads, kids, grandparents, and anyone else who wants to document their lives in a beautiful way</li><li>Amateur photographers wanting to improve their skills</li><li>Photographers looking to make money with their skills</li></ul></div>', 'uploads/course/xdB5bQTHb3tXlrS58aoreimgMuTgE2lvrBkCCtMR.jpeg', 'https://youtu.be/QKnvPClWlLk', 'Youtube', '[\"Computer, Internet\"]', '[\"Web development\"]', '[\"Wordpres\"]', 1, NULL, 0, NULL, 'English', '[\"Meta\"]', 'Meta', 1, 5, 1, NULL, '2020-06-09 10:29:55', '2020-06-10 14:07:04'),
(2, 'Python for Beginners - Basics to Advanced Python', 'python-for-beginners-basics-to-advanced-python-development', 'Beginner', '1', '<h3 class=\"widget-title\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 700; font-size: 24px; color: rgb(35, 61, 99); font-family: Mukta, sans-serif;\">What you\'ll learn?</h3><ul class=\"list-items mt-3\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-type: none; display: flex; flex-wrap: wrap; color: rgb(127, 136, 151); font-family: Mukta, sans-serif;\"><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Proven Tips and Tricks of the Digital Marketing Trade</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Growth Hacking</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Unique Ways of Promoting a Business from Scratch</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Inbound Marketing</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;How to Generate More Traffic and Leads for Your Brand</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Marketing Strategy</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Digital Marketing Tools and Strategies</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Income Statements</li></ul>', '<p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">****UPDATED WITH&nbsp;A 273-PAGE&nbsp;NOTEBOOK &amp;&nbsp;NEW&nbsp;LESSONS****</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\"><em>This online photography course will teach you how to take amazing images and even sell them, whether you use a smartphone, mirrorless or&nbsp;DSLR camera.</em></span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">This photography&nbsp;course is designed to teach you the ins and outs of photography, even if you have little to no experience with it, to help create profitable images that help you stand out from the crowd and sell.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Master Photography Techniques to Create Extraordinary Images!</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">While there are plenty of digital photography courses that focus on specific styles or how to use gear, it\'s hard to find a comprehensive course like this one, which is for beginner to advanced photographers.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">This course is designed for all levels of photographers who want to improve their skills, take stellar images, and make money with their photos - especially great for any DSLR or mirrorless camera user.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">What will you learn:</span></p><ul style=\"list-style-position: initial; list-style-image: initial; margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; padding: 0px 0px 0px 35px; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Understand how cameras work and what gear you need</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Master shooting in manual mode and understanding your camera</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Know what equipment you should buy no matter what your budget is</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Follow our practical demonstrations to see how we shoot in real-world scenarios</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Use composition, lighting, and proper settings to take better photos</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Edit photos professionally to make them look even better</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Learn start a photography business and make money from your new skills</p></li></ul><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Styles of photography you will learn:</span></p><ul style=\"list-style-position: initial; list-style-image: initial; margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; padding: 0px 0px 0px 35px; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Portrait photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Long exposure photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Landscape photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Product photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Low light photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Sports and action photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Street photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Architecture photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Event and wedding photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Aerial and drone photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Wildlife photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Night photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">DSLR&nbsp;photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Mirrorless photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Smartphone photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">and more!</p></li></ul><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Improve Your Photography Techniques, Acquire Clients, And Make More Money</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Regardless of what your level of experience is or what type of camera you use, this in-depth course is designed to provide you with everything you need to take your photography skills to the next level.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Whether you prefer taking photos of nature, animals, or people, a great photographer knows how to compose a shot, light it, and edit it. By honing these skills, you can sell your photos so you can turn your passion into a career. This course shows you how.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Unlike other photography classes that are more limited in scope, this complete course teaches you how to take amazing photos and how to make money by selling them.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Contents and Overview</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">This course is aimed at teaching photographers what it takes to improve your techniques to earn more money.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">You\'ll start with the basics and tackle how a camera operates, the types of cameras and lenses available, and equipment you\'ll need for accomplishing your goals. You\'ll then dive into the different styles of photography you can focus on.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">You\'ll learn about your camera settings (DSLR, mirrorless, or other), including how to shoot in manual mode. You\'ll use stabilization tools and master how to properly compose and light a scene. You\'ll even learn how to take great photos with a smartphone or tablet and how to edit images.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">So you can sell your photos, you\'ll learn how to brand yourself, create a portfolio and website, and find freelance work or a full-time position. Gain insight into licensing, fair use, and more. And if you want to get into wedding photography, you\'ll learn how to start your own business.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">By the end of this master course, your confidence as a photographer will soar. You\'ll have a thorough understanding of your camera and gear so you can use them to their fullest potential to take unforgettable photos and start a profitable photography career.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">What camera should you use?</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">A DSLR camera or mirrorless camera is a great option for taking this course. It doesn\'t have to be an expensive or fancy model. Any interchangeable lens camera like a DSLR or mirrorless is fine. You can even use a smartphone or point and shoot camera, although you may not have all the manual settings and options that we cover in this course.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Who are the Instructors?</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Phil Ebiner, Sam Shimizu-Jones, and Will Carnahan - all professionals making a living from their photographic skills, have come together to create this amazing new course.&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Phil &amp; Sam, creators of the original Photography Masterclass, took the feedback left from students to make this course even better. Will has come on board to share his passion and in-depth knowledge of photography with you.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">With 3 instructors, you\'ll get premium support and feedback to help you become a better photographer!</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Our happiness guarantee...<br></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">We have a&nbsp;<span style=\"font-weight: 700;\">30-day 100% money back guarantee,&nbsp;</span>so if you aren\'t happy with your purchase, we will refund your course -&nbsp;<em>no questions asked!</em></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">We can\'t wait to see you in the course!</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Enroll now, and we\'ll help you take better photos than ever before!</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Phil, Sam, &amp; Will</p><div class=\"audience\" data-purpose=\"course-audience\" style=\"margin-top: 20px; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><div class=\"audience__title\" style=\"font-size: 18px; font-weight: 700; margin: 0px 0px 10px;\">Who this course is for:</div><ul class=\"audience__list\" style=\"list-style-position: initial; list-style-image: initial; margin-right: 0px; margin-bottom: 10.5px; margin-left: 10px; padding: 0px 0px 0px 35px;\"><li>Anyone who wants to take better photos</li><li>Absolute beginners who want to become skilled photographers</li><li>Moms, dads, kids, grandparents, and anyone else who wants to document their lives in a beautiful way</li><li>Amateur photographers wanting to improve their skills</li><li>Photographers looking to make money with their skills</li></ul></div>', 'uploads/course/aB1WlGyFMa8LFRiBAZxtYcFwROmLe04mco9GSozl.jpeg', 'https://youtu.be/QKnvPClWlLk', 'Youtube', '[\"Basic of c,computer,internet\"]', '[\"learn new skill, skill development\"]', '[\"python, coding\"]', 0, 20, 1, 5, 'English', '[\"Meta\"]', 'Meta', 1, 5, 1, NULL, '2020-06-09 10:29:55', '2020-06-10 14:07:37');
INSERT INTO `courses` (`id`, `title`, `slug`, `level`, `rating`, `short_description`, `big_description`, `image`, `overview_url`, `provider`, `requirement`, `outcome`, `tag`, `is_free`, `price`, `is_discount`, `discount_price`, `language`, `meta_title`, `meta_description`, `is_published`, `user_id`, `category_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(5, 'Learn Photography', 'learn-photography', 'Beginner', '1', '<h3 class=\"widget-title\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 700; font-size: 24px; color: rgb(35, 61, 99); font-family: Mukta, sans-serif;\">What you\'ll learn?</h3><ul class=\"list-items mt-3\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-type: none; display: flex; flex-wrap: wrap; color: rgb(127, 136, 151); font-family: Mukta, sans-serif;\"><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Proven Tips and Tricks of the Digital Marketing Trade</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Growth Hacking</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Unique Ways of Promoting a Business from Scratch</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Inbound Marketing</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;How to Generate More Traffic and Leads for Your Brand</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Marketing Strategy</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Digital Marketing Tools and Strategies</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Income Statements</li></ul>', '<p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">****UPDATED WITH&nbsp;A 273-PAGE&nbsp;NOTEBOOK &amp;&nbsp;NEW&nbsp;LESSONS****</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\"><em>This online photography course will teach you how to take amazing images and even sell them, whether you use a smartphone, mirrorless or&nbsp;DSLR camera.</em></span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">This photography&nbsp;course is designed to teach you the ins and outs of photography, even if you have little to no experience with it, to help create profitable images that help you stand out from the crowd and sell.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Master Photography Techniques to Create Extraordinary Images!</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">While there are plenty of digital photography courses that focus on specific styles or how to use gear, it\'s hard to find a comprehensive course like this one, which is for beginner to advanced photographers.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">This course is designed for all levels of photographers who want to improve their skills, take stellar images, and make money with their photos - especially great for any DSLR or mirrorless camera user.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">What will you learn:</span></p><ul style=\"list-style-position: initial; list-style-image: initial; margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; padding: 0px 0px 0px 35px; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Understand how cameras work and what gear you need</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Master shooting in manual mode and understanding your camera</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Know what equipment you should buy no matter what your budget is</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Follow our practical demonstrations to see how we shoot in real-world scenarios</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Use composition, lighting, and proper settings to take better photos</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Edit photos professionally to make them look even better</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Learn start a photography business and make money from your new skills</p></li></ul><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Styles of photography you will learn:</span></p><ul style=\"list-style-position: initial; list-style-image: initial; margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; padding: 0px 0px 0px 35px; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Portrait photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Long exposure photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Landscape photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Product photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Low light photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Sports and action photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Street photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Architecture photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Event and wedding photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Aerial and drone photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Wildlife photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Night photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">DSLR&nbsp;photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Mirrorless photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Smartphone photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">and more!</p></li></ul><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Improve Your Photography Techniques, Acquire Clients, And Make More Money</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Regardless of what your level of experience is or what type of camera you use, this in-depth course is designed to provide you with everything you need to take your photography skills to the next level.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Whether you prefer taking photos of nature, animals, or people, a great photographer knows how to compose a shot, light it, and edit it. By honing these skills, you can sell your photos so you can turn your passion into a career. This course shows you how.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Unlike other photography classes that are more limited in scope, this complete course teaches you how to take amazing photos and how to make money by selling them.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Contents and Overview</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">This course is aimed at teaching photographers what it takes to improve your techniques to earn more money.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">You\'ll start with the basics and tackle how a camera operates, the types of cameras and lenses available, and equipment you\'ll need for accomplishing your goals. You\'ll then dive into the different styles of photography you can focus on.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">You\'ll learn about your camera settings (DSLR, mirrorless, or other), including how to shoot in manual mode. You\'ll use stabilization tools and master how to properly compose and light a scene. You\'ll even learn how to take great photos with a smartphone or tablet and how to edit images.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">So you can sell your photos, you\'ll learn how to brand yourself, create a portfolio and website, and find freelance work or a full-time position. Gain insight into licensing, fair use, and more. And if you want to get into wedding photography, you\'ll learn how to start your own business.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">By the end of this master course, your confidence as a photographer will soar. You\'ll have a thorough understanding of your camera and gear so you can use them to their fullest potential to take unforgettable photos and start a profitable photography career.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">What camera should you use?</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">A DSLR camera or mirrorless camera is a great option for taking this course. It doesn\'t have to be an expensive or fancy model. Any interchangeable lens camera like a DSLR or mirrorless is fine. You can even use a smartphone or point and shoot camera, although you may not have all the manual settings and options that we cover in this course.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Who are the Instructors?</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Phil Ebiner, Sam Shimizu-Jones, and Will Carnahan - all professionals making a living from their photographic skills, have come together to create this amazing new course.&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Phil &amp; Sam, creators of the original Photography Masterclass, took the feedback left from students to make this course even better. Will has come on board to share his passion and in-depth knowledge of photography with you.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">With 3 instructors, you\'ll get premium support and feedback to help you become a better photographer!</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Our happiness guarantee...<br></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">We have a&nbsp;<span style=\"font-weight: 700;\">30-day 100% money back guarantee,&nbsp;</span>so if you aren\'t happy with your purchase, we will refund your course -&nbsp;<em>no questions asked!</em></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">We can\'t wait to see you in the course!</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Enroll now, and we\'ll help you take better photos than ever before!</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Phil, Sam, &amp; Will</p><div class=\"audience\" data-purpose=\"course-audience\" style=\"margin-top: 20px; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><div class=\"audience__title\" style=\"font-size: 18px; font-weight: 700; margin: 0px 0px 10px;\">Who this course is for:</div><ul class=\"audience__list\" style=\"list-style-position: initial; list-style-image: initial; margin-right: 0px; margin-bottom: 10.5px; margin-left: 10px; padding: 0px 0px 0px 35px;\"><li>Anyone who wants to take better photos</li><li>Absolute beginners who want to become skilled photographers</li><li>Moms, dads, kids, grandparents, and anyone else who wants to document their lives in a beautiful way</li><li>Amateur photographers wanting to improve their skills</li><li>Photographers looking to make money with their skills</li></ul></div>', 'uploads/course/hEiI5UjOI8DTYAgnBp3v0bkf7OhNwD9b2ySz4KnX.jpeg', 'https://youtu.be/QKnvPClWlLk', 'Youtube', '[\"Camera, Lens\"]', '[\"Photography, photographar\"]', '[\"dslr, camera, photography\"]', 1, NULL, 0, NULL, 'English', '[\"Photography\"]', 'Photography', 1, 5, 6, NULL, '2020-06-09 10:29:55', '2020-06-10 14:07:56'),
(6, 'Advance Wordpress', 'advance-wordpress', 'Advanced', '1', '<h3 class=\"widget-title\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 700; font-size: 24px; color: rgb(35, 61, 99); font-family: Mukta, sans-serif;\">What you\'ll learn?</h3><ul class=\"list-items mt-3\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-type: none; display: flex; flex-wrap: wrap; color: rgb(127, 136, 151); font-family: Mukta, sans-serif;\"><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Proven Tips and Tricks of the Digital Marketing Trade</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Growth Hacking</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Unique Ways of Promoting a Business from Scratch</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Inbound Marketing</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;How to Generate More Traffic and Leads for Your Brand</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Marketing Strategy</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Digital Marketing Tools and Strategies</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Income Statements</li></ul>', '<p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">\"<span style=\"font-weight: 700;\">An in depth course on XGBoost with code, examples and caveats. Very valuable</span>.\" - Thibaut</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">\"<span style=\"font-weight: 700;\">This was a very comprehensive course on the benefits and how to configure the gradient booster XGBoost</span>.\"&nbsp;Kevin K</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">\"<span style=\"font-weight: 700;\">Nice and quick course with concise code examples. I would recommend to someone with a bit of ML experience, not for beginners (as he says in the first lecture)</span>.\" Alex G.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">\"Good breadth of coverage on this topic. Good examples and documentation. To elaborate on the who-this-is-for section, if you know machine learning but not XGBoost specifically, this is for you.\"</span>&nbsp;Louis B</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">\"Great code samples to get started on my own problems. Thanks!\"&nbsp;</span>Stephen E.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Welcome to&nbsp;<span style=\"font-weight: 700;\">XGBoost Master Class in Python.</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">My name is Mike West and I\'m a machine learning engineer in the applied space. I\'ve worked or consulted with over 50 companies and just finished a project with Microsoft. I\'ve published over 50 courses and this is 49 on Udemy. If you\'re interested in learning what the real-world is really like then you\'re in good hands.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">There\'s a big difference between&nbsp;<span style=\"font-weight: 700;\">real world machine learning</span>&nbsp;and what you read everywhere else. This course is going to focus on the&nbsp;<span style=\"font-weight: 700;\">real world.</span>&nbsp; The real world is often referred to as&nbsp;<span style=\"font-weight: 700;\">applied machine learning.</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Important</span>&nbsp;- I want you to take my course, however, I want the course to be right for you. This is&nbsp;<span style=\"font-weight: 700;\">NOT</span>&nbsp;an entry level course in machine learning. You\'ll need have a&nbsp;<span style=\"font-weight: 700;\">solid background in core Python.&nbsp;</span>If you haven\'t taken my courses on data wrangling and core Python for machine learning please do that first.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">This is a master class but what does that mean? It simply means the course is more advanced. You\'ll need to have a solid background in Python and I\'d suggest a well rounded background on the fundamentals of machine learning.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">In applied machine learning almost all your models will be&nbsp;<span style=\"font-weight: 700;\">supervised learning</span>&nbsp;models. That simply means you\'ll build your models against existing data.&nbsp; That data will be in the shape of an array.&nbsp; Think of an excel spreadsheet.&nbsp; Most models will require your data be in that specific shape before they can model it.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">In competitive modeling and the real world, a group of algorithms known as&nbsp;<span style=\"font-weight: 700;\">gradient boosters</span>&nbsp;has taken the world be storm.&nbsp;&nbsp;<span style=\"font-weight: 700;\">They\'ve won almost every single competition</span>&nbsp;in the&nbsp;<span style=\"font-weight: 700;\">structured data</span>&nbsp;category.&nbsp; In this course I\'m going to show you how to use them to score high on the world\'s most competitive machine learning competition.&nbsp;<span style=\"font-weight: 700;\">Kaggle</span>.&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Here\'s what you\'ll learn:</p><ul style=\"list-style-position: initial; list-style-image: initial; margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; padding: 0px 0px 0px 35px; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Define gradient boosters</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Cleanse your data for success</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Build award winning models with XGBoost</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Use them on your real world models</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Add the ranking to your resume</p></li></ul><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Competitive modeling tells employers&nbsp;<span style=\"font-weight: 700;\">you understand the basics of the machine learning workflow.</span>&nbsp; If you can work through the machine learning workflow from end to end your&nbsp;<span style=\"font-weight: 700;\">chances of securing a job in this space are greatly improved.</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Make no mistake,&nbsp;<span style=\"font-weight: 700;\">the barrier to entry in this space is large</span>.&nbsp; While this is only one step in a long arduous process to becoming a real world machine learning engineer, it\'s one of the most important things you can do right now to build your skills and your resume.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">If you really want to be a part of&nbsp;<span style=\"font-weight: 700;\">one the most exciting career paths</span>&nbsp;in the world then&nbsp;<span style=\"font-weight: 700;\">take this course now</span>!!!</p><div class=\"audience\" data-purpose=\"course-audience\" style=\"margin-top: 20px; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><div class=\"audience__title\" style=\"font-size: 18px; font-weight: 700; margin: 0px 0px 10px;\">Who this course is for:</div><ul class=\"audience__list\" style=\"list-style-position: initial; list-style-image: initial; margin-right: 0px; margin-bottom: 10.5px; margin-left: 10px; padding: 0px 0px 0px 35px;\"><li>If you want to become a machine learning engineer then this course is for you.</li><li>If you want something beyond the typical lecture style course then this course is for you.</li><li>If you want to impress perspective employers with your data science acumen this course is for you</li></ul></div>', 'uploads/course/dqsdqNqvQGmiPahTsQmAWWcy0IKs01YipDi2r463.jpeg', 'https://youtu.be/QKnvPClWlLk', 'Youtube', '[\"Basic wordpress knowledge,computer, internet\"]', '[\"Build website,learn coding\"]', '[\"wordpress\"]', 1, NULL, 0, NULL, 'English', '[\"Meta\"]', 'Meta', 1, 5, 1, NULL, '2020-06-09 10:29:55', '2020-06-11 00:17:31');
INSERT INTO `courses` (`id`, `title`, `slug`, `level`, `rating`, `short_description`, `big_description`, `image`, `overview_url`, `provider`, `requirement`, `outcome`, `tag`, `is_free`, `price`, `is_discount`, `discount_price`, `language`, `meta_title`, `meta_description`, `is_published`, `user_id`, `category_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(9, 'Learn how to play guitar', 'learn-how-to-play-guitar', 'Beginner', '1', '<h3 class=\"widget-title\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 700; font-size: 24px; color: rgb(35, 61, 99); font-family: Mukta, sans-serif;\">What you\'ll learn?</h3><ul class=\"list-items mt-3\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-type: none; display: flex; flex-wrap: wrap; color: rgb(127, 136, 151); font-family: Mukta, sans-serif;\"><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Proven Tips and Tricks of the Digital Marketing Trade</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Growth Hacking</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Unique Ways of Promoting a Business from Scratch</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Inbound Marketing</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;How to Generate More Traffic and Leads for Your Brand</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Marketing Strategy</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Digital Marketing Tools and Strategies</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Income Statements</li></ul>', '<p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">****UPDATED WITH&nbsp;A 273-PAGE&nbsp;NOTEBOOK &amp;&nbsp;NEW&nbsp;LESSONS****</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\"><em>This online photography course will teach you how to take amazing images and even sell them, whether you use a smartphone, mirrorless or&nbsp;DSLR camera.</em></span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">This photography&nbsp;course is designed to teach you the ins and outs of photography, even if you have little to no experience with it, to help create profitable images that help you stand out from the crowd and sell.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Master Photography Techniques to Create Extraordinary Images!</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">While there are plenty of digital photography courses that focus on specific styles or how to use gear, it\'s hard to find a comprehensive course like this one, which is for beginner to advanced photographers.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">This course is designed for all levels of photographers who want to improve their skills, take stellar images, and make money with their photos - especially great for any DSLR or mirrorless camera user.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">What will you learn:</span></p><ul style=\"list-style-position: initial; list-style-image: initial; margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; padding: 0px 0px 0px 35px; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Understand how cameras work and what gear you need</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Master shooting in manual mode and understanding your camera</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Know what equipment you should buy no matter what your budget is</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Follow our practical demonstrations to see how we shoot in real-world scenarios</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Use composition, lighting, and proper settings to take better photos</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Edit photos professionally to make them look even better</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Learn start a photography business and make money from your new skills</p></li></ul><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Styles of photography you will learn:</span></p><ul style=\"list-style-position: initial; list-style-image: initial; margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; padding: 0px 0px 0px 35px; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Portrait photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Long exposure photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Landscape photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Product photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Low light photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Sports and action photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Street photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Architecture photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Event and wedding photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Aerial and drone photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Wildlife photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Night photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">DSLR&nbsp;photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Mirrorless photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">Smartphone photography</p></li><li><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word;\">and more!</p></li></ul><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Improve Your Photography Techniques, Acquire Clients, And Make More Money</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Regardless of what your level of experience is or what type of camera you use, this in-depth course is designed to provide you with everything you need to take your photography skills to the next level.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Whether you prefer taking photos of nature, animals, or people, a great photographer knows how to compose a shot, light it, and edit it. By honing these skills, you can sell your photos so you can turn your passion into a career. This course shows you how.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Unlike other photography classes that are more limited in scope, this complete course teaches you how to take amazing photos and how to make money by selling them.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Contents and Overview</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">This course is aimed at teaching photographers what it takes to improve your techniques to earn more money.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">You\'ll start with the basics and tackle how a camera operates, the types of cameras and lenses available, and equipment you\'ll need for accomplishing your goals. You\'ll then dive into the different styles of photography you can focus on.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">You\'ll learn about your camera settings (DSLR, mirrorless, or other), including how to shoot in manual mode. You\'ll use stabilization tools and master how to properly compose and light a scene. You\'ll even learn how to take great photos with a smartphone or tablet and how to edit images.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">So you can sell your photos, you\'ll learn how to brand yourself, create a portfolio and website, and find freelance work or a full-time position. Gain insight into licensing, fair use, and more. And if you want to get into wedding photography, you\'ll learn how to start your own business.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">By the end of this master course, your confidence as a photographer will soar. You\'ll have a thorough understanding of your camera and gear so you can use them to their fullest potential to take unforgettable photos and start a profitable photography career.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">What camera should you use?</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">A DSLR camera or mirrorless camera is a great option for taking this course. It doesn\'t have to be an expensive or fancy model. Any interchangeable lens camera like a DSLR or mirrorless is fine. You can even use a smartphone or point and shoot camera, although you may not have all the manual settings and options that we cover in this course.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">Who are the Instructors?</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Phil Ebiner, Sam Shimizu-Jones, and Will Carnahan - all professionals making a living from their photographic skills, have come together to create this amazing new course.&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Phil &amp; Sam, creators of the original Photography Masterclass, took the feedback left from students to make this course even better. Will has come on board to share his passion and in-depth knowledge of photography with you.</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">With 3 instructors, you\'ll get premium support and feedback to help you become a better photographer!</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Our happiness guarantee...<br></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">We have a&nbsp;<span style=\"font-weight: 700;\">30-day 100% money back guarantee,&nbsp;</span>so if you aren\'t happy with your purchase, we will refund your course -&nbsp;<em>no questions asked!</em></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><span style=\"font-weight: 700;\">We can\'t wait to see you in the course!</span></p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Enroll now, and we\'ll help you take better photos than ever before!</p><p style=\"margin-right: 0px; margin-bottom: 10.5px; margin-left: 0px; word-break: break-word; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\">Phil, Sam, &amp; Will</p><div class=\"audience\" data-purpose=\"course-audience\" style=\"margin-top: 20px; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px;\"><div class=\"audience__title\" style=\"font-size: 18px; font-weight: 700; margin: 0px 0px 10px;\">Who this course is for:</div><ul class=\"audience__list\" style=\"list-style-position: initial; list-style-image: initial; margin-right: 0px; margin-bottom: 10.5px; margin-left: 10px; padding: 0px 0px 0px 35px;\"><li>Anyone who wants to take better photos</li><li>Absolute beginners who want to become skilled photographers</li><li>Moms, dads, kids, grandparents, and anyone else who wants to document their lives in a beautiful way</li><li>Amateur photographers wanting to improve their skills</li><li>Photographers looking to make money with their skills</li></ul></div>', 'uploads/course/DBP1Nj0oBdMDEy4wnUpG1DVVpRTChH1jESjBNTqd.jpeg', 'https://youtu.be/QKnvPClWlLk', 'Youtube', '[\"guitar,time,Patience\"]', '[\"Guitarist\"]', '[\"Guitar, Music\"]', 0, 30, 1, 10, 'English', '[\"Guitar Learning\"]', 'Learn how to play guitar', 1, 5, 7, NULL, '2020-06-09 10:29:55', '2020-06-10 14:08:46'),
(11, 'The Complete Financial Analyst Course 2020', 'the-complete-financial-analyst-course-2020', 'Beginner', '1', '<h3 class=\"widget-title\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 700; font-size: 24px; color: rgb(35, 61, 99); font-family: Mukta, sans-serif;\">What you\'ll learn?</h3><ul class=\"list-items mt-3\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-type: none; display: flex; flex-wrap: wrap; color: rgb(127, 136, 151); font-family: Mukta, sans-serif;\"><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Proven Tips and Tricks of the Digital Marketing Trade</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Growth Hacking</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Unique Ways of Promoting a Business from Scratch</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Inbound Marketing</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;How to Generate More Traffic and Leads for Your Brand</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Marketing Strategy</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Digital Marketing Tools and Strategies</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Income Statements</li></ul>', '<p><div class=\"row row--component-margin\" style=\"box-sizing: border-box; margin-left: -15px; margin-right: -15px; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><div class=\"col-xxs-8 left-col\" style=\"box-sizing: border-box; position: relative; min-height: 1px; padding-left: 15px; padding-right: 15px; float: left; width: 780px;\"><span style=\"font-weight: 700;\"><em>**Updated for May 2020!**</em></span><br></div></div></p><div class=\"row row--component-margin\" style=\"box-sizing: border-box; margin-left: -15px; margin-right: -15px; color: rgb(41, 48, 59); font-family: &quot;sf pro text&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;segoe ui&quot;, Helvetica, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><div class=\"col-xxs-8 left-col\" style=\"box-sizing: border-box; position: relative; min-height: 1px; padding-left: 15px; padding-right: 15px; float: left; width: 780px;\"><div class=\"clp-component-render\" style=\"box-sizing: border-box; margin-top: 40px;\"><div class=\"description js-user-tracker-click\" data-purpose=\"course-description\" data-user-tracker-schema=\"action-logs\" data-user-tracker-object-id=\"648826\" data-user-tracker-action=\"full-description-read\" data-user-tracker-target-selector-class=\"js-simple-collapse-more-btn\" style=\"box-sizing: border-box;\"><div data-more=\"+ See more\" class=\"js-simple-collapse js-simple-collapse--description\" data-purpose=\"collapse-description-btn\" style=\"box-sizing: border-box; overflow: hidden; position: relative; max-height: none;\"><div class=\"js-simple-collapse-inner\" data-purpose=\"collapse-description-text\" style=\"box-sizing: border-box;\"><div class=\"\" style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\"><em style=\"box-sizing: border-box;\">\"If you’re trying to prepare for an eventual career in finance, but are still looking to round out your knowledge of the subject, The Complete Financial Analyst Course might be a perfect fit for you.\",&nbsp;</em>Business Insider</p><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">\"A Financial Analyst Career is one of the top-paying entry-level jobs on the market.”&nbsp;</p><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\"><em style=\"box-sizing: border-box;\">\"Even in the toughest job markets, the best candidates find great positions.\",&nbsp;</em>Forbes</p><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\"><strong style=\"box-sizing: border-box; font-weight: 700;\">You simply have to find a way to acquire practical skills that will give you an edge over the other candidates.</strong></p><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\"><strong style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">But how can you do that?</em></strong></p><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">You haven’t had the proper training, and you have never seen how analysts in large firms do their work ...</p><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Stop worrying, please! We are here to help.</p><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\"><strong style=\"box-sizing: border-box; font-weight: 700;\">The Complete Financial Analyst Course is the most comprehensive, dynamic, and practical course you will find online.</strong></p><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">I<strong style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">t covers several topics, which are fundamental for every aspiring Financial Analyst:</em></strong></p><ul style=\"box-sizing: border-box; list-style: disc; margin: 0px 0px 10.5px; padding: 0px 0px 0px 35px;\"><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Microsoft Excel for Beginner and Intermediate Users: Become Proficient with the world’s #1 productivity software</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Accounting, Financial Statements, and Financial Ratios: Making Sense of Debits and Credits, Profit and Loss statements, Balance Sheets, Liquidity, Solvency, Profitability, and Growth Financial Ratios</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Finance Basics: Interest Rates, Financial Math Calculations, Loan Calculations, Time Value of Money, Present and Future Value of Cash Flows</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Business Analysis: Understanding what drives a Business, Key Items to be Analyzed and their Meaning, the Importance of Industry Cycles, Important Drivers for the Business of Startup, Growth, Mature and Declining Companies, Important Drivers for an Industry</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Capital Budgeting:&nbsp;Decide whether a company\'s project is feasible from a financial perspective and be able to compare between different investment opportunities</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Microsoft PowerPoint for Beginner and Intermediate Users: The #1 tool for visual representation of your work, a necessary skill for every Financial Analyst</p></li></ul><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">As you can see, this is a complete bundle that ensures you will receive the right training for each critical aspect.</p><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\"><strong style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">Here comes the fun part!</em></strong></p><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">We have a challenge for you! After covering each major roadblock, you will be asked to solve a challenge. You will:</p><ul style=\"box-sizing: border-box; list-style: disc; margin: 0px 0px 10.5px; padding: 0px 0px 0px 35px;\"><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Calculate a company’s sales in Excel</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Register its bookkeeping entries and produce useful financial statements + calculate financial ratios</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Calculate a complete loan schedule for the company’s debt</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Analyze the company’s business performance</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Create a PowerPoint presentation based on the results</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Receive personalized feedback</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Receive a gift</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Participate in our monthly Amazon Gift Card Lottery(!)</p></li></ul><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\"><strong style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">Sounds interesting, right?</em></strong></p><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">At the end of the challenge, you will send us the work you’ve done, and we will reply&nbsp;with personalized feedback. This makes for an interactive student experience that optimizes what you will learn from the course.</p><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\"><strong style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">What makes this course different from the rest of the Finance courses out there?</em></strong></p><ul style=\"box-sizing: border-box; list-style: disc; margin: 0px 0px 10.5px; padding: 0px 0px 0px 35px;\"><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">High quality of production:&nbsp;HD video and animations (this isn’t a collection of boring lectures!)</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Knowledgeable instructor (experience in companies&nbsp;like Pwc and Coca-Cola)</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Complete training:&nbsp;We will cover all major topics and skills you need&nbsp;to become a top-class Financial Analyst</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Extensive Case Studies:&nbsp;To&nbsp;help you reinforce everything you’ve learned</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Course Challenge: Solve our Course Challenge and make this course an interactive experience</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Excellent support: If you don’t understand a concept or you simply want to drop us a line, you’ll receive an answer within 1 business day</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Dynamic: We don’t want to waste your time! The instructor keeps up a very good pace throughout the whole course</p></li></ul><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\"><strong style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">Why should you consider a career as a Financial Analyst?</em></strong><br style=\"box-sizing: border-box;\"></p><ul style=\"box-sizing: border-box; list-style: disc; margin: 0px 0px 10.5px; padding: 0px 0px 0px 35px;\"><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Salary. A Financial Analyst job usually leads to a very well-paid career</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Promotions. Financial Analysts acquire valuable technical skills, which makes them the leading candidates for senior roles within a corporation</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Secure Future. There is high demand for Financial Analysts on the job market, and you won’t have to be concerned about finding a job</p></li><li style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Growth. This isn’t a boring job. Every day, you will face different challenges that will test your existing skills</p></li></ul><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\">Please don’t forget that the course comes with Udemy’s 30-day unconditional, money-back-in-full guarantee. And why not give such a guarantee, when we are convinced the course will provide a ton of value for you?<br style=\"box-sizing: border-box;\"></p><p style=\"box-sizing: border-box; margin: 0px 0px 10.5px; word-break: break-word;\"><strong style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">Just go ahead and subscribe to this course! If you don\'t acquire these skills now, you will miss an opportunity to separate yourself from the others. Don\'t risk your future success! Let\'s start learning together now!</em></strong></p><div class=\"audience\" data-purpose=\"course-audience\" style=\"box-sizing: border-box; margin-top: 20px;\"><div class=\"audience__title\" style=\"box-sizing: border-box; font-size: 18px; font-weight: 700; margin: 0px 0px 10px;\">Who this course is for:</div><ul class=\"audience__list\" style=\"box-sizing: border-box; list-style: disc; margin: 0px 0px 10.5px 10px; padding: 0px 0px 0px 35px;\"><li style=\"box-sizing: border-box;\">People who want a successful career in Finance</li><li style=\"box-sizing: border-box;\">Anyone who wants to learn the practical skills of Financial analysis</li><li style=\"box-sizing: border-box;\">People who are ambitious and want to learn faster than their peers</li></ul></div></div></div></div></div></div></div></div>', 'uploads/course/cJND1JsRLhOOEONLmLK3QTgAs53m23xZeOZsEPB3.jpeg', 'https://youtu.be/QKnvPClWlLk', 'Youtube', '[\"Computer, internet                                                            ,Eagerness\"]', '[\"Business statistic,Business policy\"]', '[\"business,policy\"]', 0, 20, 0, NULL, 'Bengali', '[\"business policy\"]', 'Business course', 1, 5, 4, NULL, '2020-06-10 04:06:23', '2020-06-10 23:53:58'),
(19, 'Outcome Based Education (OBE) & Academic Quality Assurance', 'outcome-based-education-obe-and-academic-quality-assurance', 'Beginner', '1', '<h3 class=\"widget-title\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 700; font-size: 24px; color: rgb(35, 61, 99); font-family: Mukta, sans-serif;\">What you\'ll learn?</h3><ul class=\"list-items mt-3\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-type: none; display: flex; flex-wrap: wrap; color: rgb(127, 136, 151); font-family: Mukta, sans-serif;\"><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Proven Tips and Tricks of the Digital Marketing Trade</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Growth Hacking</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Unique Ways of Promoting a Business from Scratch</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Inbound Marketing</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;How to Generate More Traffic and Leads for Your Brand</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Marketing Strategy</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Digital Marketing Tools and Strategies</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Income Statements</li></ul>', '<div class=\"description-wrap margin-bottom-40px\" style=\"padding: 0px; margin: 0px 0px 40px; color: rgb(127, 136, 151); font-family: Mukta, sans-serif;\"><p class=\"mb-2 mt-3\" style=\"padding: 0px; margin-right: 0px; margin-left: 0px;\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p><p class=\"mb-3\" style=\"padding: 0px; margin-right: 0px; margin-left: 0px;\">It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p><h5 class=\"font-size-16 \" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(35, 61, 99); font-size: 16px !important;\">Why should you consider a career as a Financial Analyst?</h5><ul class=\"list-items mt-2 mb-3\" style=\"padding: 0px; margin-right: 0px; margin-left: 0px; list-style-type: none;\"><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative; font-size: 15px;\">Salary. A Financial Analyst job usually leads to a very well-paid career</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative; font-size: 15px;\">Promotions. Financial Analysts acquire valuable technical skills</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative; font-size: 15px;\">Secure Future. There is high demand for Financial Analysts on the job market</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px; position: relative; font-size: 15px;\">Growth. This isn’t a boring job. Every day, you will face different challenges</li></ul><h5 class=\"font-size-16 line-height-27 \" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(35, 61, 99); line-height: 27px !important; font-size: 16px !important;\">Just go ahead and subscribe to this course! If you don\'t acquire these skills now, you will miss an opportunity to separate yourself from the others. Don\'t risk your future success! Let\'s start learning together now!</h5></div><div class=\"requirement-wrap margin-bottom-30px\" style=\"padding: 0px; margin: 0px 0px 30px; color: rgb(127, 136, 151); font-family: Mukta, sans-serif;\"><h3 class=\"widget-title\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 700; font-size: 24px; color: rgb(35, 61, 99);\">Who this course is for:</h3><ul class=\"list-items mt-3 mb-3\" style=\"padding: 0px; margin-right: 0px; margin-left: 0px; list-style-type: none;\"><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative;\">Anyone who wants to become a digital marketer, promote a business</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative;\">Anyone who is tired of their day job or wants a career change</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative;\">People who want to earn an additional income from freelancing</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px; position: relative;\">Digital marketers who want some more tricks</li></ul></div>', 'uploads/course/EOcKJ945IWhaeDE2MJCrWgUkMaj1nWL4UwUlfxRz.jpeg', 'https://youtu.be/QKnvPClWlLk', 'Youtube', '[\"Basic knowledge of digital marketing terms,Basic understanding of business,Pen and paper for taking notes,Internet connection\"]', '[\"Outcome Text, Outcome\"]', '[\"Education\"]', 0, 50, 1, 20, 'Bengali', '[\"meta title\"]', 'Meta description', 1, 5, 2, NULL, '2020-06-11 00:30:46', '2020-06-11 00:32:52');
INSERT INTO `courses` (`id`, `title`, `slug`, `level`, `rating`, `short_description`, `big_description`, `image`, `overview_url`, `provider`, `requirement`, `outcome`, `tag`, `is_free`, `price`, `is_discount`, `discount_price`, `language`, `meta_title`, `meta_description`, `is_published`, `user_id`, `category_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(20, 'The Complete Digital finance Marketing Course', 'the-complete-digital-finance-marketing-course', 'Advanced', '1', '<h3 class=\"widget-title\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 700; font-size: 24px; color: rgb(35, 61, 99); font-family: Mukta, sans-serif;\">What you\'ll learn?</h3><ul class=\"list-items mt-3\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-type: none; display: flex; flex-wrap: wrap; color: rgb(127, 136, 151); font-family: Mukta, sans-serif;\"><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Proven Tips and Tricks of the Digital Marketing Trade</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Growth Hacking</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Unique Ways of Promoting a Business from Scratch</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Inbound Marketing</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;How to Generate More Traffic and Leads for Your Brand</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Marketing Strategy</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Digital Marketing Tools and Strategies</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Income Statements</li></ul>', '<div class=\"description-wrap margin-bottom-40px\" style=\"padding: 0px; margin: 0px 0px 40px; color: rgb(127, 136, 151); font-family: Mukta, sans-serif;\"><p class=\"mb-2 mt-3\" style=\"padding: 0px; margin-right: 0px; margin-left: 0px;\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p><p class=\"mb-3\" style=\"padding: 0px; margin-right: 0px; margin-left: 0px;\">It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p><h5 class=\"font-size-16 \" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(35, 61, 99); font-size: 16px !important;\">Why should you consider a career as a Financial Analyst?</h5><ul class=\"list-items mt-2 mb-3\" style=\"padding: 0px; margin-right: 0px; margin-left: 0px; list-style-type: none;\"><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative; font-size: 15px;\">Salary. A Financial Analyst job usually leads to a very well-paid career</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative; font-size: 15px;\">Promotions. Financial Analysts acquire valuable technical skills</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative; font-size: 15px;\">Secure Future. There is high demand for Financial Analysts on the job market</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px; position: relative; font-size: 15px;\">Growth. This isn’t a boring job. Every day, you will face different challenges</li></ul><h5 class=\"font-size-16 line-height-27 \" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(35, 61, 99); line-height: 27px !important; font-size: 16px !important;\">Just go ahead and subscribe to this course! If you don\'t acquire these skills now, you will miss an opportunity to separate yourself from the others. Don\'t risk your future success! Let\'s start learning together now!</h5></div><div class=\"requirement-wrap margin-bottom-30px\" style=\"padding: 0px; margin: 0px 0px 30px; color: rgb(127, 136, 151); font-family: Mukta, sans-serif;\"><h3 class=\"widget-title\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 700; font-size: 24px; color: rgb(35, 61, 99);\">Who this course is for:</h3><ul class=\"list-items mt-3 mb-3\" style=\"padding: 0px; margin-right: 0px; margin-left: 0px; list-style-type: none;\"><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative;\">Anyone who wants to become a digital marketer, promote a business</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative;\">Anyone who is tired of their day job or wants a career change</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative;\">People who want to earn an additional income from freelancing</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px; position: relative;\">Digital marketers who want some more tricks</li></ul></div>', 'uploads/course/W3il4ig1WwQ8Cpn4QnVM0U8uHp9qVYLAJtjCu3GO.jpeg', 'https://youtu.be/QKnvPClWlLk', 'Youtube', '[\"Basic knowledge of digital marketing terms,Basic understanding of business\"]', '[\"Basic understanding of business\"]', '[\"Basic understanding of business\"]', 1, 20, 0, NULL, 'English', '[\"Meta title\"]', 'Meta Description', 1, 5, 5, NULL, '2020-06-11 00:40:42', '2020-06-11 06:26:52'),
(21, 'Microsoft SQL Server 2019 for Everyone', 'microsoft-sql-server-2019-for-everyone', 'All Levels', '1', '<h3 class=\"widget-title\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 700; font-size: 24px; color: rgb(35, 61, 99); font-family: Mukta, sans-serif;\">What you\'ll learn?</h3><ul class=\"list-items mt-3\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-type: none; display: flex; flex-wrap: wrap; color: rgb(127, 136, 151); font-family: Mukta, sans-serif;\"><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Proven Tips and Tricks of the Digital Marketing Trade</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Growth Hacking</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Unique Ways of Promoting a Business from Scratch</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Inbound Marketing</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;How to Generate More Traffic and Leads for Your Brand</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Marketing Strategy</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Digital Marketing Tools and Strategies</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Income Statements</li></ul>', '<div class=\"description-wrap margin-bottom-40px\" style=\"padding: 0px; margin: 0px 0px 40px; color: rgb(127, 136, 151); font-family: Mukta, sans-serif;\"><p class=\"mb-2 mt-3\" style=\"padding: 0px; margin-right: 0px; margin-left: 0px;\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p><p class=\"mb-3\" style=\"padding: 0px; margin-right: 0px; margin-left: 0px;\">It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p><h5 class=\"font-size-16 \" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(35, 61, 99); font-size: 16px !important;\">Why should you consider a career as a Financial Analyst?</h5><ul class=\"list-items mt-2 mb-3\" style=\"padding: 0px; margin-right: 0px; margin-left: 0px; list-style-type: none;\"><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative; font-size: 15px;\">Salary. A Financial Analyst job usually leads to a very well-paid career</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative; font-size: 15px;\">Promotions. Financial Analysts acquire valuable technical skills</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative; font-size: 15px;\">Secure Future. There is high demand for Financial Analysts on the job market</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px; position: relative; font-size: 15px;\">Growth. This isn’t a boring job. Every day, you will face different challenges</li></ul><h5 class=\"font-size-16 line-height-27 \" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(35, 61, 99); line-height: 27px !important; font-size: 16px !important;\">Just go ahead and subscribe to this course! If you don\'t acquire these skills now, you will miss an opportunity to separate yourself from the others. Don\'t risk your future success! Let\'s start learning together now!</h5></div><div class=\"requirement-wrap margin-bottom-30px\" style=\"padding: 0px; margin: 0px 0px 30px; color: rgb(127, 136, 151); font-family: Mukta, sans-serif;\"><h3 class=\"widget-title\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 700; font-size: 24px; color: rgb(35, 61, 99);\">Who this course is for:</h3><ul class=\"list-items mt-3 mb-3\" style=\"padding: 0px; margin-right: 0px; margin-left: 0px; list-style-type: none;\"><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative;\">Anyone who wants to become a digital marketer, promote a business</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative;\">Anyone who is tired of their day job or wants a career change</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative;\">People who want to earn an additional income from freelancing</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px; position: relative;\">Digital marketers who want some more tricks</li></ul></div>', 'uploads/course/DlolL30aMOQmC81xNCDfmnjdSL4OuZqsIlS4Hm7s.jpeg', 'https://youtu.be/QKnvPClWlLk', 'Youtube', '[\"Basic knowledge of digital marketing terms,Pen and paper for taking notes\"]', '[\"Basic knowledge of digital marketing terms\"]', '[\"Basic knowledge of digital marketing terms,Digital Marketing\"]', 0, 20, 0, NULL, 'English', '[\"Meta Title\"]', 'Meta Description', 1, 5, 3, NULL, '2020-06-11 00:46:21', '2020-06-11 00:46:36'),
(22, 'Digital finance Marketing Course', 'digital-finance-marketing-course', 'Beginner', '1', '<h3 class=\"widget-title\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 700; font-size: 24px; color: rgb(35, 61, 99); font-family: Mukta, sans-serif;\">What you\'ll learn?</h3><ul class=\"list-items mt-3\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-type: none; display: flex; flex-wrap: wrap; color: rgb(127, 136, 151); font-family: Mukta, sans-serif;\"><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Proven Tips and Tricks of the Digital Marketing Trade</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Growth Hacking</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Unique Ways of Promoting a Business from Scratch</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Inbound Marketing</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;How to Generate More Traffic and Leads for Your Brand</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Marketing Strategy</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Digital Marketing Tools and Strategies</li><li style=\"padding: 0px; margin: 0px 33px 12px 0px; position: relative; width: 318.594px;\"><span class=\"la la-check-circle\" style=\"padding: 0px; margin: 0px 6px 0px 0px; color: rgb(81, 190, 120);\"></span>&nbsp;Income Statements</li></ul>', '<div class=\"description-wrap margin-bottom-40px\" style=\"padding: 0px; margin: 0px 0px 40px; color: rgb(127, 136, 151); font-family: Mukta, sans-serif;\"><p class=\"mb-2 mt-3\" style=\"padding: 0px; margin-right: 0px; margin-left: 0px;\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p><p class=\"mb-3\" style=\"padding: 0px; margin-right: 0px; margin-left: 0px;\">It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p><h5 class=\"font-size-16 \" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(35, 61, 99); font-size: 16px !important;\">Why should you consider a career as a Financial Analyst?</h5><ul class=\"list-items mt-2 mb-3\" style=\"padding: 0px; margin-right: 0px; margin-left: 0px; list-style-type: none;\"><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative; font-size: 15px;\">Salary. A Financial Analyst job usually leads to a very well-paid career</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative; font-size: 15px;\">Promotions. Financial Analysts acquire valuable technical skills</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative; font-size: 15px;\">Secure Future. There is high demand for Financial Analysts on the job market</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px; position: relative; font-size: 15px;\">Growth. This isn’t a boring job. Every day, you will face different challenges</li></ul><h5 class=\"font-size-16 line-height-27 \" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(35, 61, 99); line-height: 27px !important; font-size: 16px !important;\">Just go ahead and subscribe to this course! If you don\'t acquire these skills now, you will miss an opportunity to separate yourself from the others. Don\'t risk your future success! Let\'s start learning together now!</h5></div><div class=\"requirement-wrap margin-bottom-30px\" style=\"padding: 0px; margin: 0px 0px 30px; color: rgb(127, 136, 151); font-family: Mukta, sans-serif;\"><h3 class=\"widget-title\" style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: 700; font-size: 24px; color: rgb(35, 61, 99);\">Who this course is for:</h3><ul class=\"list-items mt-3 mb-3\" style=\"padding: 0px; margin-right: 0px; margin-left: 0px; list-style-type: none;\"><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative;\">Anyone who wants to become a digital marketer, promote a business</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative;\">Anyone who is tired of their day job or wants a career change</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px 0px 8px; position: relative;\">People who want to earn an additional income from freelancing</li><li style=\"padding: 0px 0px 0px 18px; margin: 0px; position: relative;\">Digital marketers who want some more tricks</li></ul></div>', 'uploads/course/Kx9x37vpM42whMPQAUp61e21EWiJFCOWLknn3meo.jpeg', 'https://youtu.be/QKnvPClWlLk', 'Youtube', '[\"Basic knowledge of digital marketing terms\"]', '[\"Basic knowledge of digital marketing terms\"]', '[\"Basic knowledge of digital marketing terms\"]', 1, NULL, 0, NULL, 'English', '[\"Meta Title\"]', 'Meta Description', 0, 5, 4, NULL, '2020-06-11 00:59:33', '2020-06-11 00:59:33');

-- --------------------------------------------------------

--
-- Table structure for table `course_comments`
--

CREATE TABLE `course_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` double DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `replay` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_purchase_histories`
--

CREATE TABLE `course_purchase_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enrollment_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `align` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `rate`, `is_published`, `align`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Dollar', 'USD', '$', 1, 1, 1, NULL, NULL, '2020-06-10 01:47:09');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `linked` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tw` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`id`, `name`, `email`, `phone`, `address`, `image`, `balance`, `linked`, `fb`, `tw`, `skype`, `about`, `package_id`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 'Jhon Denver', 'instructor@mail.com', NULL, 'H#20, R#20, Address City, Town', 'uploads/instructor/tKhPoUGGDWSPDO70q6GuehN8xuCxPCr1jUBY985S.jpeg', 326, 'https://www.linkedin.com/', 'https://www.facebook.com', 'https://www.twitter.com', 'https://www.skypee.com/', 'This is my about us section.', 1, 5, NULL, '2020-06-10 04:08:06', '2020-07-23 01:46:18');

-- --------------------------------------------------------

--
-- Table structure for table `instructor_accounts`
--

CREATE TABLE `instructor_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `bank` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Bank',
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `routing_number` int(11) DEFAULT NULL,
  `paypal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Paypal',
  `paypal_acc_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_acc_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Stripe',
  `stripe_acc_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_acc_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instructor_earnings`
--

CREATE TABLE `instructor_earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `enrollment_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `course_price` double NOT NULL,
  `will_get` double NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, 'en', 'English', 'Flag_of_the_United_States.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `massages`
--

CREATE TABLE `massages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `enroll_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2020_02_18_053228_create_categories_table', 1),
(11, '2020_03_18_055630_create_languages_table', 1),
(12, '2020_03_18_085009_create_currencies_table', 1),
(13, '2020_03_18_101231_create_system_settings_table', 1),
(14, '2020_03_20_104650_create_packages_table', 1),
(15, '2020_03_20_104940_create_instructors_table', 1),
(16, '2020_03_20_105907_create_package_purchase_histories_table', 1),
(17, '2020_03_20_110758_create_courses_table', 1),
(18, '2020_03_20_115215_create_classes_table', 1),
(19, '2020_03_20_115803_create_class_contents_table', 1),
(20, '2020_03_20_120806_create_students_table', 1),
(21, '2020_03_20_121712_create_enrollments_table', 1),
(22, '2020_03_20_122043_create_carts_table', 1),
(23, '2020_03_20_123531_create_course_purchase_histories_table', 1),
(24, '2020_03_20_123839_create_wishlists_table', 1),
(25, '2020_03_20_124006_create_admin_earnings_table', 1),
(26, '2020_03_20_124108_create_support_tickets_table', 1),
(27, '2020_03_20_124319_create_support_ticket_replays_table', 1),
(28, '2020_04_01_045351_create_sliders_table', 1),
(29, '2020_04_03_082248_create_instructor_earnings_table', 1),
(30, '2020_04_14_032755_create_jobs_table', 1),
(31, '2020_04_17_061729_create_verify_users_table', 1),
(32, '2020_05_04_192324_create_seen_contents_table', 1),
(33, '2020_05_05_053312_create_api_password_resets_table', 1),
(34, '2020_05_05_074657_create_massages_table', 1),
(35, '2020_05_05_153038_create_course_comments_table', 1),
(36, '2020_05_12_131611_create_pages_table', 1),
(37, '2020_05_12_131737_create_page_contents_table', 1),
(38, '2020_05_14_093225_create_instructor_accounts_table', 1),
(39, '2020_05_14_093226_create_payments_table', 1),
(40, '2020_06_04_210613_create_notification_users_table', 1),
(41, '2020_07_22_091509_create_affiliates_table', 2),
(42, '2020_07_22_091735_create_student_accounts_table', 2),
(43, '2020_07_22_130558_create_affiliate_histories_table', 2),
(44, '2020_07_22_160131_create_affiliate_payments_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notification_users`
--

CREATE TABLE `notification_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `commission` double NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `image`, `price`, `commission`, `is_published`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'uploads/package/x1t7704KOJG6WYqqcMghQ5d0eIS3osh7MfJq6QvJ.jpeg', 0, 40, 1, NULL, '2020-06-09 09:49:18', '2020-06-10 14:02:54'),
(2, 'uploads/package/S5YUUuMRd7BLRP11SmhllvrgGaBoIwfImDS2VtcM.jpeg', 10, 20, 1, NULL, '2020-06-09 09:49:35', '2020-06-10 14:02:39'),
(3, 'uploads/package/aCRKkSZnF3IPWSsNMZ7eL1ZSePOmxdll0Gj7dqv1.jpeg', 30, 5, 1, NULL, '2020-06-10 01:55:32', '2020-06-10 14:02:31');

-- --------------------------------------------------------

--
-- Table structure for table `package_purchase_histories`
--

CREATE TABLE `package_purchase_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `active`, `created_at`, `updated_at`) VALUES
(3, 'About Us', 'about-us', 1, '2020-06-10 02:20:43', '2020-06-10 02:20:43'),
(4, 'Privacy & Policy', 'privacy-policy', 1, '2020-06-10 02:22:52', '2020-06-10 02:22:52'),
(5, 'Term', 'term', 1, '2020-06-10 02:23:27', '2020-06-10 02:23:27');

-- --------------------------------------------------------

--
-- Table structure for table `page_contents`
--

CREATE TABLE `page_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_id` bigint(20) UNSIGNED NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_contents`
--

INSERT INTO `page_contents` (`id`, `title`, `page_id`, `body`, `active`, `created_at`, `updated_at`) VALUES
(1, 'About Us', 3, '<p style=\"margin: 1em 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 18px; line-height: 1.61111em; font-family: AvenirNext, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; vertical-align: baseline; color: rgb(51, 71, 91);\">When you have a great story about how your product or service was built to change lives, share it. The \"About Us\" page is a great place for it to live, too. Good stories humanize your brand, providing context and meaning for your product. What’s more, good stories are sticky -- which means people are more likely to connect with them and pass them on.</p><p style=\"margin: 1em 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 18px; line-height: 1.61111em; font-family: AvenirNext, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; vertical-align: baseline; color: rgb(51, 71, 91);\">Yellow Leaf Hammocks tells users about its product by describing how the hammocks empower artisan weavers and their families. The company breaks down different pieces of the story into sections that combine words and easily digestible graphics, painting a picture instead of big chunks of text. They\'re clear about why they\'re different: \"Not a Charity,\" the page reads. And then: \"This is the basis for a brighter future, built on a hand up, not a handout.\"</p><p style=\"margin: 1em 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 18px; line-height: 1.61111em; font-family: AvenirNext, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; vertical-align: baseline; color: rgb(51, 71, 91);\">Every company has a story to tell, so break out your storytelling skills from that random English class you took years ago and put them to work on your \"About Us\" page. Using descriptive and emotive copy and gorgeous graphics, an \"About Us\" page with a story works harder for your business than a generic one.</p>', 1, '2020-06-10 02:22:29', '2020-06-10 02:22:29'),
(2, 'Privacy Policy', 4, '<p style=\"margin: 1em 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 18px; line-height: 1.61111em; font-family: AvenirNext, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; vertical-align: baseline; color: rgb(51, 71, 91);\">When you have a great story about how your product or service was built to change lives, share it. The \"About Us\" page is a great place for it to live, too. Good stories humanize your brand, providing context and meaning for your product. What’s more, good stories are sticky -- which means people are more likely to connect with them and pass them on.</p><p style=\"margin: 1em 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 18px; line-height: 1.61111em; font-family: AvenirNext, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; vertical-align: baseline; color: rgb(51, 71, 91);\">Yellow Leaf Hammocks tells users about its product by describing how the hammocks empower artisan weavers and their families. The company breaks down different pieces of the story into sections that combine words and easily digestible graphics, painting a picture instead of big chunks of text. They\'re clear about why they\'re different: \"Not a Charity,\" the page reads. And then: \"This is the basis for a brighter future, built on a hand up, not a handout.\"</p><p style=\"margin: 1em 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 18px; line-height: 1.61111em; font-family: AvenirNext, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; vertical-align: baseline; color: rgb(51, 71, 91);\">Every company has a story to tell, so break out your storytelling skills from that random English class you took years ago and put them to work on your \"About Us\" page. Using descriptive and emotive copy and gorgeous graphics, an \"About Us\" page with a story works harder for your business than a generic one.</p>', 1, '2020-06-10 02:23:07', '2020-06-10 02:23:07'),
(3, 'Term', 5, '<p style=\"margin: 1em 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 18px; line-height: 1.61111em; font-family: AvenirNext, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; vertical-align: baseline; color: rgb(51, 71, 91);\">When you have a great story about how your product or service was built to change lives, share it. The \"About Us\" page is a great place for it to live, too. Good stories humanize your brand, providing context and meaning for your product. What’s more, good stories are sticky -- which means people are more likely to connect with them and pass them on.</p><p style=\"margin: 1em 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 18px; line-height: 1.61111em; font-family: AvenirNext, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; vertical-align: baseline; color: rgb(51, 71, 91);\">Yellow Leaf Hammocks tells users about its product by describing how the hammocks empower artisan weavers and their families. The company breaks down different pieces of the story into sections that combine words and easily digestible graphics, painting a picture instead of big chunks of text. They\'re clear about why they\'re different: \"Not a Charity,\" the page reads. And then: \"This is the basis for a brighter future, built on a hand up, not a handout.\"</p><p style=\"margin: 1em 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 18px; line-height: 1.61111em; font-family: AvenirNext, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; vertical-align: baseline; color: rgb(51, 71, 91);\">Every company has a story to tell, so break out your storytelling skills from that random English class you took years ago and put them to work on your \"About Us\" page. Using descriptive and emotive copy and gorgeous graphics, an \"About Us\" page with a story works harder for your business than a generic one.</p>', 1, '2020-06-10 02:23:36', '2020-06-10 02:23:36');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `current_balance` double DEFAULT NULL,
  `process` enum('Bank','Paypal','Stripe') COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Request','Confirm') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_change_date` datetime DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seen_contents`
--

CREATE TABLE `seen_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `enroll_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `content_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `title`, `sub_title`, `url`, `is_published`, `created_at`, `updated_at`) VALUES
(1, 'uploads/slider/A1M6f36uzdGHw6VUPWUk1ti9IFtiykT8ZQtqIRQ9.jpeg', 'Course LMS, best online learning platform', 'Find your course and start learning', NULL, 1, NULL, '2020-06-10 13:55:53');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tw` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linked` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_accounts`
--

CREATE TABLE `student_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `bank` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Bank',
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `routing_number` int(11) DEFAULT NULL,
  `paypal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Paypal',
  `paypal_acc_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_acc_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Stripe',
  `stripe_acc_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_acc_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `replay_count` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_replays`
--

CREATE TABLE `support_ticket_replays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'default_currencies', '1', NULL, NULL),
(2, 'type_logo', 'uploads/site/header.png', NULL, NULL),
(3, 'type_name', 'Course lms', NULL, NULL),
(4, 'type_footer', NULL, NULL, '2020-07-22 22:36:49'),
(5, 'type_mail', NULL, NULL, '2020-07-22 22:36:50'),
(6, 'type_address', NULL, NULL, '2020-07-22 22:36:49'),
(7, 'type_fb', NULL, NULL, '2020-07-22 22:36:49'),
(8, 'type_tw', NULL, NULL, '2020-07-22 22:36:49'),
(9, 'type_number', NULL, NULL, '2020-07-22 22:36:49'),
(10, 'type_google', NULL, NULL, '2020-07-22 22:36:49'),
(11, 'footer_logo', 'uploads/site/footer.png', NULL, NULL),
(12, 'favicon_icon', 'uploads/site/icon.png', NULL, NULL),
(13, 'default_currencies', '1', NULL, NULL),
(14, 'type_logo', '', NULL, NULL),
(15, 'type_name', '', NULL, NULL),
(16, 'type_footer', '', NULL, NULL),
(17, 'type_mail', '', NULL, NULL),
(18, 'type_address', '', NULL, NULL),
(19, 'type_fb', '', NULL, NULL),
(20, 'type_tw', '', NULL, NULL),
(21, 'type_number', '', NULL, NULL),
(22, 'type_google', '', NULL, NULL),
(23, 'footer_logo', '', NULL, NULL),
(24, 'favicon_icon', '', NULL, NULL),
(25, 'affiliate', 'Active', NULL, '2020-07-22 22:36:50'),
(26, 'commission', '1', NULL, NULL),
(27, 'withdraw_limit', '10', NULL, NULL),
(28, 'cookies_limit', '10', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` enum('Student','Instructor','Admin') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT 0,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'uploads/user/user.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `slug`, `email`, `user_type`, `email_verified_at`, `verified`, `password`, `banned`, `provider_id`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'Jhon Denver', 'john-denver', 'instructor@mail.com', 'Instructor', NULL, 1, '$2y$10$G0BCOu0y2C9WLXs8g4dBeOvhoYacD3by0qXWRYNQuETraycz4GZ2y', 0, NULL, 'uploads/instructor/tKhPoUGGDWSPDO70q6GuehN8xuCxPCr1jUBY985S.jpeg', NULL, '2020-06-10 04:08:06', '2020-06-10 14:10:41');

-- --------------------------------------------------------

--
-- Table structure for table `verify_users`
--

CREATE TABLE `verify_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_price` double DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_earnings`
--
ALTER TABLE `admin_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliates`
--
ALTER TABLE `affiliates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_payments`
--
ALTER TABLE `affiliate_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_password_resets`
--
ALTER TABLE `api_password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_password_resets_email_index` (`email`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_course_id_foreign` (`course_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classes_course_id_foreign` (`course_id`);

--
-- Indexes for table `class_contents`
--
ALTER TABLE `class_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_contents_class_id_foreign` (`class_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `courses_slug_unique` (`slug`),
  ADD KEY `courses_user_id_foreign` (`user_id`),
  ADD KEY `courses_category_id_foreign` (`category_id`);

--
-- Indexes for table `course_comments`
--
ALTER TABLE `course_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_comments_course_id_foreign` (`course_id`),
  ADD KEY `course_comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `course_purchase_histories`
--
ALTER TABLE `course_purchase_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_purchase_histories_enrollment_id_foreign` (`enrollment_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollments_course_id_foreign` (`course_id`),
  ADD KEY `enrollments_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `instructors_email_unique` (`email`),
  ADD KEY `instructors_package_id_foreign` (`package_id`),
  ADD KEY `instructors_user_id_foreign` (`user_id`);

--
-- Indexes for table `instructor_accounts`
--
ALTER TABLE `instructor_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instructor_accounts_user_id_foreign` (`user_id`);

--
-- Indexes for table `instructor_earnings`
--
ALTER TABLE `instructor_earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instructor_earnings_enrollment_id_foreign` (`enrollment_id`),
  ADD KEY `instructor_earnings_package_id_foreign` (`package_id`),
  ADD KEY `instructor_earnings_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `massages`
--
ALTER TABLE `massages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `massages_enroll_id_foreign` (`enroll_id`),
  ADD KEY `massages_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_users`
--
ALTER TABLE `notification_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_purchase_histories`
--
ALTER TABLE `package_purchase_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_purchase_histories_user_id_foreign` (`user_id`),
  ADD KEY `package_purchase_histories_package_id_foreign` (`package_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_contents`
--
ALTER TABLE `page_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_contents_page_id_foreign` (`page_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_account_id_foreign` (`account_id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `seen_contents`
--
ALTER TABLE `seen_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seen_contents_enroll_id_foreign` (`enroll_id`),
  ADD KEY `seen_contents_course_id_foreign` (`course_id`),
  ADD KEY `seen_contents_class_id_foreign` (`class_id`),
  ADD KEY `seen_contents_content_id_foreign` (`content_id`),
  ADD KEY `seen_contents_user_id_foreign` (`user_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_email_unique` (`email`),
  ADD KEY `students_user_id_foreign` (`user_id`);

--
-- Indexes for table `student_accounts`
--
ALTER TABLE `student_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_tickets_user_id_foreign` (`user_id`);

--
-- Indexes for table `support_ticket_replays`
--
ALTER TABLE `support_ticket_replays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_ticket_replays_ticket_id_foreign` (`ticket_id`),
  ADD KEY `support_ticket_replays_user_id_foreign` (`user_id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `verify_users`
--
ALTER TABLE `verify_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_course_id_foreign` (`course_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_earnings`
--
ALTER TABLE `admin_earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliates`
--
ALTER TABLE `affiliates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliate_payments`
--
ALTER TABLE `affiliate_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_password_resets`
--
ALTER TABLE `api_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `class_contents`
--
ALTER TABLE `class_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `course_comments`
--
ALTER TABLE `course_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course_purchase_histories`
--
ALTER TABLE `course_purchase_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `instructor_accounts`
--
ALTER TABLE `instructor_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `instructor_earnings`
--
ALTER TABLE `instructor_earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `massages`
--
ALTER TABLE `massages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `notification_users`
--
ALTER TABLE `notification_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `package_purchase_histories`
--
ALTER TABLE `package_purchase_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `page_contents`
--
ALTER TABLE `page_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seen_contents`
--
ALTER TABLE `seen_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_accounts`
--
ALTER TABLE `student_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `support_ticket_replays`
--
ALTER TABLE `support_ticket_replays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `verify_users`
--
ALTER TABLE `verify_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `class_contents`
--
ALTER TABLE `class_contents`
  ADD CONSTRAINT `class_contents_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_comments`
--
ALTER TABLE `course_comments`
  ADD CONSTRAINT `course_comments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
