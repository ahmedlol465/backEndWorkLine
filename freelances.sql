-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2025 at 04:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `freelances`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `beneficiary_name` varchar(255) NOT NULL,
  `iban` varchar(255) NOT NULL,
  `bic_swift` varchar(255) NOT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `governorate` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `terms` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`terms`)),
  `userId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `beneficiary_name`, `iban`, `bic_swift`, `address_line1`, `address_line2`, `city`, `governorate`, `zip_code`, `country`, `terms`, `userId`, `created_at`, `updated_at`) VALUES
(1, 'ahmed', '23213421', '34243', 'address', 'dsadsd', 'egypt', 'cairo', '2323', 'United States', '[true,true,true,true]', 7, '2025-03-04 08:42:42', '2025-03-04 08:42:42');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `freelancer_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `client_email` varchar(255) NOT NULL,
  `freelancer_name` varchar(255) NOT NULL,
  `private_message` text NOT NULL,
  `project_title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `photo_paths` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`photo_paths`)),
  `required_skills` varchar(255) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `subsection` varchar(255) DEFAULT NULL,
  `expected_budget` varchar(255) DEFAULT NULL,
  `expected_duration` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `freelancer_id`, `client_id`, `client_name`, `client_email`, `freelancer_name`, `private_message`, `project_title`, `description`, `photo_paths`, `required_skills`, `section`, `subsection`, `expected_budget`, `expected_duration`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 'Ahmed Hisham', 'ahmed@example.com', 'John Doe', 'Hello, I am interested in your services.', 'Web Development Project', 'I need a website built using React and Laravel.', '[]', 'React, Laravel, MySQL', 'Web Development', 'Full Stack', '1000 USD', '1 month', '2025-02-04 13:00:35', '2025-02-04 13:00:35'),
(2, 1, 3, 'John Doe', 'john.doe@example.com', 'hasedsllsssdo', 'I\'m excited about your profile!', 'Project X Development', 'We need to develop our Project X', '[]', 'Laravel', 'Web Development', 'Backend Development', '$1000 - $2000', '2 weeks - 1 month', '2025-02-04 13:31:02', '2025-02-04 13:31:02'),
(3, 1, 3, 'Client Name', 'client@example.com', 'hasedsllsssdo', 'adasd', 'adasd', 'adasd', '[]', NULL, NULL, NULL, NULL, NULL, '2025-02-04 13:34:16', '2025-02-04 13:34:16'),
(4, 1, 7, 'Client Name', 'client@example.com', 'hasedsllsssdo', 'sadasd', 'asdas', 'adfasf', '[\"contact_message_photos\\/1A6CRK8vzGR73LqXRcvyoRYshvPEs0Jt7bSkEAsZ.jpg\"]', 'Laravel', 'Design', 'Full Stack', '$500 - $1000', '2 weeks - 1 month', '2025-02-22 05:27:49', '2025-02-22 05:27:49'),
(5, 1, 7, 'Client Name', 'client@example.com', 'hasedsllsssdo', 'dasdas', 'adasd', 'adasf', '[\"contact_message_photos\\/scE3i5395NpUXEsIgCtIYUTdnfgUdtCWAWbfXPWR.jpg\"]', 'Laravel', 'Marketing', 'Content Writing', '$1000 - $2000', '2 weeks - 1 month', '2025-02-22 06:09:31', '2025-02-22 06:09:31'),
(6, 1, 7, 'asd', 'gak@gmail.com', 'hasedsllsssdo', 'sadasdasd', 'sadsadasd', 'sdsadasdsaf', '[]', NULL, NULL, NULL, NULL, NULL, '2025-02-22 07:30:55', '2025-02-22 07:30:55'),
(7, 1, 7, 'asd', 'gak@gmail.com', 'hasedsllsssdo', 'sadasdasd', 'sadsadasd', 'sdsadasdsaf', '[]', NULL, NULL, NULL, NULL, NULL, '2025-02-22 07:31:22', '2025-02-22 07:31:22'),
(8, 1, 7, 'asd', 'gak@gmail.com', 'hasedsllsssdo', 'sadasdasd', 'sadsadasd', 'sdsadasdsaf', '[]', NULL, NULL, NULL, NULL, NULL, '2025-02-22 07:42:50', '2025-02-22 07:42:50'),
(9, 1, 7, 'asd', 'gak@gmail.com', 'hasedsllsssdo', 'sadasdasd', 'sadsadasd', 'sdsadasdsaf', '[]', NULL, NULL, NULL, NULL, NULL, '2025-02-22 07:43:41', '2025-02-22 07:43:41'),
(10, 1, 7, 'asd', 'gak@gmail.com', 'hasedsllsssdo', 'sadasdasd', 'sadsadasd', 'sdsadasdsaf', '[]', NULL, NULL, NULL, NULL, NULL, '2025-02-22 07:44:10', '2025-02-22 07:44:10'),
(11, 1, 7, 'Client Name', 'client@example.com', 'hasedsllsssdo', 'adasd', 'afafs', 'adfasf', '[\"contact_message_photos\\/rj82Sk0SBxa6ogj5V54Hds3NmYp2xkyhlMHUPfQK.jpg\"]', 'Python', 'Design', 'UI/UX Design', '$1000 - $2000', '1-3 months', '2025-02-22 08:18:51', '2025-02-22 08:18:51'),
(12, 1, 7, 'asd', 'gak@gmail.com', 'hasedsllsssdo', 'sadasdasd', 'sadsadasd', 'sdsadasdsaf', '[]', NULL, NULL, NULL, NULL, NULL, '2025-02-22 08:28:22', '2025-02-22 08:28:22');

-- --------------------------------------------------------

--
-- Table structure for table `credite_cards`
--

CREATE TABLE `credite_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `card_holder` varchar(255) NOT NULL,
  `card_number` varchar(255) NOT NULL,
  `expiry_date` varchar(255) NOT NULL,
  `save_for_next_order` tinyint(1) NOT NULL DEFAULT 0,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `credite_cards`
--

INSERT INTO `credite_cards` (`id`, `card_holder`, `card_number`, `expiry_date`, `save_for_next_order`, `userId`, `created_at`, `updated_at`) VALUES
(1, 'dasdasd', '2313131', '213/2132/332', 0, 7, '2025-02-28 23:10:07', '2025-02-28 23:10:07'),
(2, 'adasdas', '23434324', '23232', 0, 7, '2025-02-28 23:19:38', '2025-02-28 23:19:38');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `address`, `userId`, `created_at`, `updated_at`) VALUES
(2, 'ads@gmail.com', 7, '2025-02-28 23:33:14', '2025-02-28 23:33:14');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `favourite_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `favouritable_id` bigint(20) NOT NULL,
  `favouritable_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`id`, `user_id`, `favourite_id`, `type`, `created_at`, `updated_at`, `favouritable_id`, `favouritable_type`) VALUES
(11, 7, 1, 'freelancer', '2025-02-21 12:52:35', '2025-02-21 12:52:35', 0, ''),
(12, 7, 1, 'project', '2025-02-21 12:54:08', '2025-02-21 12:54:08', 0, ''),
(13, 7, 2, 'freelancer', '2025-02-21 12:54:20', '2025-02-21 12:54:20', 0, ''),
(14, 7, 9, 'freelancer', '2025-02-21 12:54:29', '2025-02-21 12:54:29', 0, ''),
(15, 7, 2, 'project', '2025-02-22 10:55:33', '2025-02-22 10:55:33', 0, ''),
(18, 1, 4, 'project', '2025-02-26 12:10:43', '2025-02-26 12:10:43', 5, 'App\\Models\\User'),
(19, 7, 4, 'project', '2025-02-26 12:16:29', '2025-02-26 12:16:29', 1, 'App\\Models\\User'),
(20, 7, 4, 'project', '2025-02-26 12:19:10', '2025-02-26 12:19:10', 1, 'App\\Models\\project'),
(21, 1, 4, 'project', '2025-02-26 12:19:13', '2025-02-26 12:19:13', 1, 'App\\Models\\project'),
(22, 1, 4, 'project', '2025-02-26 12:24:16', '2025-02-26 12:24:16', 1, 'App\\Models\\service'),
(23, 7, 4, 'project', '2025-02-26 12:24:21', '2025-02-26 12:24:21', 4, 'App\\Models\\service'),
(24, 1, 4, 'project', '2025-02-26 12:26:00', '2025-02-26 12:26:00', 7, 'App\\Models\\service'),
(25, 7, 4, 'project', '2025-02-26 14:45:09', '2025-02-26 14:45:09', 7, 'App\\Models\\userWork'),
(26, 7, 3, 'project', '2025-02-26 13:28:07', '2025-02-26 13:28:07', 5, 'App\\Models\\Project'),
(27, 7, 3, 'project', '2025-02-26 13:33:55', '2025-02-26 13:33:55', 36, 'App\\Models\\service'),
(28, 7, 11, 'project', '2025-03-04 12:11:32', '2025-03-04 12:11:32', 11, 'project');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_20_071817_create_personal_access_tokens_table', 1),
(8, '2025_01_30_142049_create_user_balances_table', 2),
(9, '2025_01_22_075257_create_projects_table', 3),
(12, '2025_01_22_075335_create_services_table', 4),
(13, '2025_01_30_142030_create_transactions_table', 4),
(14, '2025_02_02_112228_create_purchases_table', 5),
(16, '2025_02_02_123230_create_user_statistics_table', 6),
(17, '2025_02_04_141018_create_contact_messages_table', 7),
(18, '2025_02_21_134139_create_favourites_table', 8),
(19, '2025_02_22_085207_create_notifications_table', 9),
(21, '2025_02_24_101048_create_sub_servieses_table', 10),
(26, '2025_02_28_233057_create_bank_accounts_table', 11),
(27, '2025_03_01_001059_create_emails_table', 11),
(28, '2025_03_01_001621_create_credite_cards_table', 11),
(29, '2025_03_01_004102_create_vrifications_table', 11),
(30, '2025_03_29_105336_create_offers_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `user_id_receiver` bigint(20) UNSIGNED NOT NULL,
  `user_id_sender` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `description`, `type`, `user_id_receiver`, `user_id_sender`, `created_at`, `updated_at`) VALUES
(1, 'sadsadasd', 'sdsadasdsaf', 'mail', 7, 7, '2025-02-22 07:44:10', '2025-02-22 07:44:10'),
(2, 'afafs', 'adfasf', 'mail', 7, 7, '2025-02-22 08:18:51', '2025-02-22 08:18:51'),
(3, 'sadsadasd', 'sdsadasdsaf', 'notification', 7, 7, '2025-02-22 08:28:22', '2025-02-22 08:28:22');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `freelancer_id` bigint(20) UNSIGNED NOT NULL COMMENT 'User ID of the freelancer making the offer',
  `offer_text` text NOT NULL,
  `num_replies` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_flagged` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('pending','accepted','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `project_id`, `freelancer_id`, `offer_text`, `num_replies`, `is_flagged`, `status`, `created_at`, `updated_at`) VALUES
(1, 10, 7, 'I have experience with similar projects and can complete this within 5 days.', 0, 0, 'pending', '2025-04-12 06:15:12', '2025-04-12 06:15:12');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`id`, `email`, `code`, `created_at`) VALUES
(1, 'ahmesddhisssham46737@gmail.com', '727796', NULL),
(2, 'ahmesddhaisssham46737@gmail.com', '907124', NULL),
(3, 'ahmesddhdisssham46737@gmail.com', '263037', NULL),
(4, 'ahme@gmail.com', '404330', NULL),
(5, 'kadlasd@gmail.com', '776455', NULL),
(6, 'ajdlaskjd@gmail.com', '454634', NULL),
(7, 'ahmesddhdissasham46737@gmail.com', '198069', NULL),
(8, 'hausdhu@gmail.com', '715100', NULL),
(9, 'ahmesddhisssham46737@gmail.com', 'd17P18ryZsDmVBvEtIYubYqtEnicZ7GWY8vGNcwWssUcG5TA39tRTMjscuAK', NULL),
(10, 'ahmesddhisssham46737@gmail.com', '83XGpkHXQCZh1QPsUHKMXwFjFIKYo45uycm4QFoaUBIvbVNpXKROYszci4cf', NULL),
(11, 'ahmesddhisssham46737@gmail.com', 'UiyxtSGH0hWW4j2jVaoXXOGxdN85xfxzrZsf1OksGsYEQ0P7oxPqevD0L3ES', NULL),
(12, 'ahmesddhisssham46737@gmail.com', 'veyoj7VYhektpQcqgjjPq1jGJcnYNoF3lQFUdCZYWlrwPXvToc2PcKj306UR', NULL),
(13, 'ahmesddhisssham46737@gmail.com', '3f5NIVDnO0FYEm6VKCPrXPEW4FWEtBL0KAfwtKJqOpAytfE2KESqUdCi86h9', NULL),
(14, 'ahmesddhisssham46737@gmail.com', 'DhMj2puGcDgH5aXzgvd3mIqUrOTxtkbRi2ySnCWcbyVRDnutnoBsjyPaTyRd', NULL),
(15, 'ahmesddhisssham46737@gmail.com', 'A4DxXV3gDh54pXzfmjrtTiKj0J0hDGTD0iivH6VLhpP2Mb0dADnQ68p5IZYP', NULL),
(16, 'ahmesddhisssham46737@gmail.com', 'ZfuR9WWz7Sj2jknp1sAqFbGc1GuWRRNbqdeUYb97G01aAgeAjWpCOswrQZry', NULL),
(17, 'ahmesddhisssham46737@gmail.com', 'INk0AVIJULpTdREj3baZGNAcerauZRaSxu8BhWlgGNzxIWYUXuMlAX0Nb1Vy', NULL),
(18, 'ahmesddhisssham46737@gmail.com', 'p5thaCy5m28MgjRILKjaB0LcSW2zabxqbfRCNSsRcM5uSBb88MOSsUD1l4OT', NULL),
(19, 'ahmesddhisssham46737@gmail.com', 'UrYFtzC8bZSuy6ytlSeAYSYtfj1h51eeiu8SzxLxEFgKm6LutQdRTTrYqXiP', NULL),
(20, 'ahmesddhisssham46737@gmail.com', 'ASSWXDMfWJs2k6Dp2H7RqLmO7CLJKnYYpQqWpgXG65Q1dOUAKwhbKfO4JoUf', NULL),
(21, 'ahmesddhisssham46737@gmail.com', 'wMjuhHz3ltb9btKYdIsGv03Sz3mShLZxJAKUjnpfmkGt9w12kSJ8N9nqpagX', NULL),
(22, 'ahmesddhisssham46737@gmail.com', 'LFFhatZpx07ux7iq7qVleAFZTISJ8f7Qn0WnCvT98qZhST1HVuazXZGpPbO5', NULL),
(23, 'ahmesddhisssham46737@gmail.com', 'AvYbMq2Tt9yzjuZS94vO5IkymEy52iagDr3FpvRjJ4KR93B2tdUvIwYiKuco', NULL),
(24, 'ahmesddhisssham46737@gmail.com', '9JAfEg6BFz01fGQId7tdERzYfHJHAIwWUv3OzGetYj4kJNHeXS87t8TI94JJ', NULL),
(25, 'ahmesddhisssham46737@gmail.com', 'rbv36zV4SPzscSFb3g9cim11z1FBLfAj4xU5s1QxtQSvDEHrMsVBbkvSkXHF', NULL),
(26, 'ahmesddhisssham46737@gmail.com', '6YMfibOR2MQ0UT2GvXK6WyA4ouiaQkwP2pOtBFOKB5csvJbwGwOTcB6DavYo', NULL),
(27, 'ahmesddhisssham46737@gmail.com', 'm40INlGjAlei4Ml6Nv1SMRUYxiZp38dIskLDLeQ87ZY7NSNckcYxmxrReomx', NULL),
(28, 'ahmesddhisssham46737@gmail.com', 'RSUIsu3Xyfkc23f8UU1fG8g8kLB0IDEwBmyvkEtzec5E1oFuU69sZwCIWn29', NULL),
(29, 'ahmesddhisssham46737@gmail.com', 'VG86amEBWmRDBUXn2xV0u6UKp8H1AoMdry2cr9BrUzcjtYV9RuhpxNw5tzak', NULL),
(30, 'ahmesddhisssham46737@gmail.com', 'zAgELiCTWK46xbukUuqocamP7Omjc1MXj9KEt3n9qqd8A2Iz98sph2q523Zq', NULL),
(31, 'ahmesddhisssham46737@gmail.com', 'txKEphwfjnwTb2ZlnEVtsz5hJZvXooEvtldrXi7tKZGMU9t7Lbx8PACJXtnR', NULL),
(32, 'ahmesddhisssham46737@gmail.com', 'Je5SdPdE4wo5MtdhtCPnzUEi4qp2BI2xPhN6xYCRgTEtsaEbbh9Eb6j9Tqy7', NULL),
(33, 'ahmesddhisssham46737@gmail.com', 'UtLupqekd7Lih5iBz2PEeFZLbj2WYiUkS9p6MuJ8V5qZaQkXV8xsi8iROskS', NULL),
(34, 'ahmesddhisssham46737@gmail.com', 'Q5FlpCG6oHyWCQa0OkFodqhxRlzmTHcHUgJIq1ZXN4WClRGH1r4e8UwrLA8i', NULL),
(35, 'ahmedhisham46737@gmail.com', '996369', NULL),
(36, 'gamesmooodshisham@gmail.com', '546117', NULL),
(37, 'dsajdlas@gmail.com', '352152', NULL),
(38, 'djaskljdkla@gmail.com', '818414', NULL),
(39, 'lsdkasjdkj@gmail.com', '618408', NULL),
(40, 'djaslkdjalk@gmail.com', '160954', NULL),
(41, 'djaslkdjal@gmail.com', '243613', NULL),
(42, 'jasldajsldk@gmail.com', '337868', NULL),
(43, 'djaldjlk@gmail.com', '938289', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_description` varchar(255) NOT NULL,
  `project_image` varchar(255) NOT NULL,
  `required_skills` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `sub_section` varchar(255) NOT NULL,
  `project_link` varchar(255) DEFAULT NULL,
  `project_question` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'under_review',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `budget` varchar(255) DEFAULT NULL,
  `budgetTo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `user_id`, `project_name`, `project_description`, `project_image`, `required_skills`, `section`, `sub_section`, `project_link`, `project_question`, `status`, `created_at`, `updated_at`, `duration`, `budget`, `budgetTo`) VALUES
(3, 9, 'das;dkjas', 'djlasdjkasl', 'projects/oznHZJMUntIbrkafQQA4GOGd3EK9dLgb.jpg', 'Web design', 'Web development', 'Mobile app', NULL, NULL, 'under_review', '2025-02-09 12:57:11', '2025-02-09 12:57:11', NULL, NULL, NULL),
(4, 17, 'jsaldjasldj', 'maksjdasjdl;', 'projects/3TcXn2P2s0IP3sNxm41NFfMakwpgJbA5.jpg', 'Illustrator', 'Mobile app', 'Mobile app', NULL, NULL, 'under_review', '2025-02-18 12:48:52', '2025-02-18 12:48:52', NULL, NULL, NULL),
(5, 17, 'dadas', 'asdsadsas', 'projects/K2qOHlwG1B2HHFhZYECKpFii1S6DC8tX.jpg', 'Write articles', 'Web development', 'Web site', NULL, NULL, 'under_review', '2025-02-18 12:51:13', '2025-02-18 12:51:13', NULL, NULL, NULL),
(6, 7, 'kfjas;lfjl', 'fljadfkljdasf', 'projects/kXjzWMJqUoBDJuEB3jUZ0yP8n702bhSd.jpg', 'Translate', 'Web development', 'Web site', NULL, NULL, 'under_review', '2025-02-21 07:34:48', '2025-02-21 07:34:48', NULL, NULL, NULL),
(7, 7, 'dasdasd', 'sdasdasd', 'projects/6h25UNnlbbo5EKCQkdRuQicxNd5r1Hda.jpg', 'Translate', 'Web development', 'Web site', NULL, NULL, 'under_review', '2025-02-21 07:35:45', '2025-02-21 07:35:45', NULL, NULL, NULL),
(9, 7, 'afsasf', 'afdfa', 'projects/CBToCMGwSJFP79MSauSj7kPMQMZ2Yms2.jpg', 'Graphic design', 'Mobile app', 'Content management systems', NULL, NULL, 'under_review', '2025-02-23 13:09:18', '2025-02-23 13:09:18', '2', '13124', NULL),
(10, 7, 'website', 'making web', 'projects/5eLrkHzTVnoh22jgaydAITFEIRT5URwt.jpg', 'react', 'Writing & Translation', 'Frontend Development', 'http://localhost:5173/react/ControlPanel', NULL, 'under_review', '2025-03-04 08:45:26', '2025-03-04 08:45:26', '22', '23', NULL),
(11, 7, 'website', 'make website', 'projects/xBY5LtObw2oXsURJDGj7RZnLe6nAbSCb.jpg', 'react', 'Writing & Translation', 'Backend Development', 'https://google.com/', NULL, 'under_review', '2025-03-04 11:55:17', '2025-03-04 11:55:17', '22', '50', '200');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `buyer_user_id` bigint(20) UNSIGNED NOT NULL,
  `seller_user_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(255) NOT NULL DEFAULT 'awaiting_seller_approval',
  `purchase_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `buyer_user_id`, `seller_user_id`, `service_id`, `purchase_date`, `status`, `purchase_price`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, '2025-02-02 11:52:50', 'in_progress', 120.00, '2025-02-02 09:52:50', '2025-02-02 09:52:50'),
(2, 3, 1, 1, '2025-02-02 11:53:33', 'in_progress', 120.00, '2025-02-02 09:53:33', '2025-02-02 09:53:33'),
(3, 3, 1, 1, '2025-02-02 11:53:36', 'in_progress', 120.00, '2025-02-02 09:53:36', '2025-02-02 09:53:36'),
(4, 3, 1, 1, '2025-02-02 11:54:28', 'in_progress', 120.00, '2025-02-02 09:54:28', '2025-02-02 09:54:28');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `subsection` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `thumbnail_photo` varchar(255) NOT NULL,
  `main_photo` varchar(255) NOT NULL,
  `required_skills` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `delivery_duration` varchar(255) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `title`, `section`, `subsection`, `description`, `thumbnail_photo`, `main_photo`, `required_skills`, `price`, `delivery_duration`, `from_date`, `to_date`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Test Service', 'Web Development', 'Frontend Development', 'This is a test description for the service.', 'services/exmEWnl4JkoN2BwgCVCJ1Y3d3hFyanEWhSXIKufY.png', 'services/QgnR0jVeHSPy3B5GjThBDLEwRlfrELhBqFXViHet.png', 'HTML, CSS, JavaScript', 100.00, '5 days', '2025-01-01', '2025-01-10', 'https://example.com', 'sent', '2025-02-02 07:35:21', '2025-02-02 07:35:21'),
(2, 1, 'adfasfasf', 'Writing & Translation', 'Backend Development', 'afasfsafs', 'services/UeEKN70cVLFcz8jtQBxkmlEcgMA5hr0KHGReVyMJ.jpg', 'services/TAHx8WskMDV9SxVkd2Tcu6NqLuMur1U2oMS5IqvO.jpg', 'js', 43.00, '124', '2025-02-28', '2025-02-20', 'https://chat.deepseek.com/', 'sent', '2025-02-21 09:43:34', '2025-02-21 09:43:34'),
(3, 7, 'fdsfsd', 'Data Entry', 'Backend Development', 'sdfdsfsdf', 'services/UYVMxeFdHxPPtvy5StfNWc4PfYkoeddnO1OWDEfr.jpg', 'services/mzOtkOMtBf1nzSXq6DxUafePvb9AnIPQe5XUsKiy.jpg', 'dsf', 34.00, '34', '2025-02-19', '2025-02-27', 'https://chat.deepseek.com/', 'sent', '2025-02-21 09:56:26', '2025-02-21 09:56:26'),
(4, 7, 'asdasd', 'Digital Marketing & Sales', 'Frontend Development', 'alsndlasdklasdklasf', 'services/JTyv9uiJuYZmpihmY3LWzXdSX3CUvLMdmaFvR2TV.jpg', 'services/dKQZjVGhm6guEpdg4i94HKLjGjghCeWD5QHKyceg.jpg', 'sdalkdjlkasjlksd', 232.00, '23231', '2025-02-27', '2025-02-04', 'https://chat.deepseek.com/', 'sent', '2025-02-24 09:33:25', '2025-02-24 09:33:25'),
(5, 7, 'alsdljasdjlsd', 'Digital Marketing & Sales', 'Backend Development', 'adsd', 'services/X9v6jwfCSqUwIrOk7nRFyDms1q0p3UX4GKuH7HEj.jpg', 'services/88ea9GEhUWeVou7Lj1WO8igTPBXZ4xNUdt55ZKyT.jpg', 'asdsadff', 232123.00, '223', '2025-02-28', '2025-02-12', 'https://chat.deepseek.com/', 'sent', '2025-02-24 10:07:19', '2025-02-24 10:07:19'),
(6, 7, 'alsdljasdjlsd', 'Digital Marketing & Sales', 'Backend Development', 'adsd', 'services/jXNFn9MBje4vgNOgeuG3UgFs4c2hgg3mLfzs233N.jpg', 'services/yrceqftBU2Zl1OIas1BVeGhXQAQLcnFKly42v7pu.jpg', 'asdsadff', 232123.00, '223', '2025-02-28', '2025-02-12', 'https://chat.deepseek.com/', 'sent', '2025-02-24 10:07:21', '2025-02-24 10:07:21'),
(7, 7, 'alsdljasdjlsd', 'Digital Marketing & Sales', 'Backend Development', 'adsd', 'services/bQeFg51s1cWXyGCvSbgP7UYjjqWOp73XBUZMGC0r.jpg', 'services/6r7VfQQC2Ln6axtDHAl1kR2elC9RmVdHUpFrC1aO.jpg', 'asdsadff', 232123.00, '223', '2025-02-28', '2025-02-12', 'https://chat.deepseek.com/', 'sent', '2025-02-24 10:07:25', '2025-02-24 10:07:25'),
(8, 7, 'alsdljasdjlsd', 'Digital Marketing & Sales', 'Backend Development', 'adsd', 'services/QauyxIBhN7IG7pXeZobI6AyYjJ6DEBAmQMlGcKU1.jpg', 'services/gSHqBPzMpybgGYbfFnJuLxcMBAWgnrxuaLDcu1Nw.jpg', 'asdsadff', 232123.00, '223', '2025-02-28', '2025-02-12', 'https://chat.deepseek.com/', 'sent', '2025-02-24 10:07:32', '2025-02-24 10:07:32'),
(9, 7, 'asdasd', 'Digital Marketing & Sales', 'Frontend Development', 'asdasdaf', 'services/78Ce9yhC6ttT457QtIGri7RG689dWNOx1r6jr6aq.jpg', 'services/YsIQ2RJhrCBKQOLu9JCZhNZekzRJ0rhBJwLf73r4.jpg', 'adasd2', 2323.00, '232', '2025-02-28', '2025-02-26', 'https://chat.deepseek.com/', 'sent', '2025-02-24 10:11:12', '2025-02-24 10:11:12'),
(10, 7, 'afasf', 'Consulting', 'Frontend Development', 'afasf', 'services/RJ8BB3minL3Lo0fbJKQIk7ukPNpRGE597dkFqAmF.jpg', 'services/cvWyeHs4drLA5MGGjVSil72HY97Zo6Y1TPBYNazq.jpg', 'asdsa', 3424.00, '432', '2334-02-22', '3242-02-26', 'https://chat.deepseek.com/', 'sent', '2025-02-24 10:14:14', '2025-02-24 10:14:14'),
(11, 7, 'afasf', 'Consulting', 'Frontend Development', 'afasf', 'services/W1Vcxq4DBkl1FymKBr2BLfoXVnBNCsOsBQKOlGn1.jpg', 'services/I993Hj6jMEXkihoK2ZFSgsjrvqOCd48wPN0p4tdf.jpg', 'asdsa', 3424.00, '432', '2334-02-22', '3242-02-26', 'https://chat.deepseek.com/', 'sent', '2025-02-24 10:15:19', '2025-02-24 10:15:19'),
(12, 7, 'afasf', 'Consulting', 'Frontend Development', 'afasf', 'services/aAFpY3ytybQFb4n4kWZslDJCqFZwB2qCeTlKC1Yq.jpg', 'services/6m8LyoRRmYsNmu3QG1tFCs3djZLnKgZFU92Tb9qK.jpg', 'asdsa', 3424.00, '432', '2334-02-22', '3242-02-26', 'https://chat.deepseek.com/', 'sent', '2025-02-24 10:15:33', '2025-02-24 10:15:33'),
(13, 7, 'afasf', 'Consulting', 'Frontend Development', 'afasf', 'services/25ab1iY1B4B4D4wq8jjgXBYNFlvnvcKdkMoV1O2H.jpg', 'services/9oOqTAkLHnsUF32RCfBxCTkpEKanDkAgPsvSkvt2.jpg', 'asdsa', 3424.00, '432', '2334-02-22', '3242-02-26', 'https://chat.deepseek.com/', 'sent', '2025-02-24 10:15:54', '2025-02-24 10:15:54'),
(14, 7, 'afasf', 'Consulting', 'Frontend Development', 'afasf', 'services/tFXa8wxc5CMtVKt7SVsJSdcdB9vgKUHpesjoaxSJ.jpg', 'services/Zpol09bg9G1tKiVizqblqbLGxXz7AxUIP1Xpj2qP.jpg', 'asdsa', 3424.00, '432', '2334-02-22', '3242-02-26', 'https://chat.deepseek.com/', 'sent', '2025-02-24 10:16:02', '2025-02-24 10:16:02'),
(15, 7, 'afasf', 'Consulting', 'Frontend Development', 'afasf', 'services/oRnZCw5TaWtArQgklorPT38vViazBtnFlubMFz8S.jpg', 'services/ITTvPMdR27OBAOj2TFPEYtG2xjc8mXjbhPkPHFq3.jpg', 'asdsa', 3424.00, '432', '2334-02-22', '3242-02-26', 'https://chat.deepseek.com/', 'sent', '2025-02-24 10:16:06', '2025-02-24 10:16:06'),
(16, 7, 'afasf', 'Consulting', 'Frontend Development', 'afasf', 'services/qD1xUa94G4E3XPKBitA3mM5sVgh2yCYLS3ZDTsWI.jpg', 'services/SndOvMfCI0BMLCpTus0GHyu7RbUjr2pPdtynZN94.jpg', 'asdsa', 3424.00, '432', '2334-02-22', '3242-02-26', 'https://chat.deepseek.com/', 'sent', '2025-02-24 10:23:51', '2025-02-24 10:23:51'),
(17, 7, 'afasf', 'Consulting', 'Frontend Development', 'afasf', 'services/AusAdHlh4Ak5IsmggeQ4BwtGg4p8Qe9XmjoGwkmX.jpg', 'services/H3mphYXe45xPRiwNojDybQJSIF3cLSQIrZqI1spo.jpg', 'asdsa', 3424.00, '432', '2334-02-22', '3242-02-26', 'https://chat.deepseek.com/', 'sent', '2025-02-24 10:24:21', '2025-02-24 10:24:21'),
(18, 7, 'afasf', 'Consulting', 'Frontend Development', 'afasf', 'services/TKA2vMOS1odvzzLygfd5hIZiUyQIOgfas1IFrMAz.jpg', 'services/FvFJ06O8Zdz8hire782RrawHDar07rjD2chltcb1.jpg', 'asdsa', 3424.00, '432', '2334-02-22', '3242-02-26', 'https://chat.deepseek.com/', 'sent', '2025-02-24 10:25:26', '2025-02-24 10:25:26'),
(19, 7, 'afasf', 'Consulting', 'Frontend Development', 'afasf', 'services/5KTrOEJoF5Ip8vorEtffcQo3a8JRTMLQTGlIJyH5.jpg', 'services/fGvh8iAMpw9faFiIfDPZDLsopMuqZRKyBdscYab9.jpg', 'asdsa', 3424.00, '432', '2334-02-22', '3242-02-26', 'https://chat.deepseek.com/', 'sent', '2025-02-24 10:25:29', '2025-02-24 10:25:29'),
(20, 7, 'afasf', 'Consulting', 'Frontend Development', 'afasf', 'services/mOgMMJe80xOUMCiP08fAIWFScBUShCHeFjOAhEMT.jpg', 'services/DAbynC35aRq3IvOWLO9GnplKVLqpAeNtKh0l1MlX.jpg', 'asdsa', 3424.00, '432', '2334-02-22', '3242-02-26', 'https://chat.deepseek.com/', 'sent', '2025-02-24 10:25:52', '2025-02-24 10:25:52'),
(21, 7, 'afasf', 'Consulting', 'Frontend Development', 'afasf', 'services/FDms1Ck086csqdqEG8D2wMBVd4bzwkzX4VubriiN.jpg', 'services/67YlV6bHSqmayu4DaUNr9SBkyK7QCXRqrXpw2QOT.jpg', 'asdsa', 3424.00, '432', '2334-02-22', '3242-02-26', 'https://chat.deepseek.com/', 'sent', '2025-02-24 10:26:30', '2025-02-24 10:26:30'),
(22, 7, 'afasf', 'Consulting', 'Frontend Development', 'afasf', 'services/7ixklfQpeEm5kkqkDYSb4bpKoURsAtysCmQ7aLQV.jpg', 'services/eBu4qicwNIwYx8Ut9FvdsItoBWTVC7M07VLbntal.jpg', 'asdsa', 3424.00, '432', '2334-02-22', '3242-02-26', 'https://chat.deepseek.com/', 'sent', '2025-02-24 10:26:35', '2025-02-24 10:26:35'),
(23, 7, 'adasdasd', 'Consulting', 'Backend Development', 'asdsadasf', 'services/5CFc7e9OMGNnAGFn2d5TqDwjvrsoMsRvlUcaGsTn.jpg', 'services/SyGsz3abTCGr8ND3DjYXiWaVYEXPQnTLUhD3JAcA.jpg', 'asdasd', 342.00, '4324', '2025-02-27', '2025-02-26', 'https://chat.deepseek.com/', 'sent', '2025-02-24 13:32:22', '2025-02-24 13:32:22'),
(24, 7, 'jdsklakd', 'Writing & Translation', 'Frontend Development', 'asdasda', 'services/Ce1NFvoLoBxOYFpNkRBJaz9lbgzTGnnyDd88RN4Z.jpg', 'services/gx7VfpBknsfIkZuxamTBIAxfQpQg15AOJmSIIdZv.jpg', 'sadasd', 3113.00, '23232', '2025-02-26', '2025-02-26', 'https://chat.deepseek.com/', 'sent', '2025-02-25 14:23:28', '2025-02-25 14:23:28'),
(25, 7, 'kkklk', 'Data Entry', 'Mobile App Development', 'jkjlkjlk', 'services/S20Xj7Ulavo0f3AxfBEX43GLDyxWVLjji8HPiK2a.jpg', 'services/x82S3r8hYRgfofBj7KoyuDwoiyzsfn8b8P2s6j1X.jpg', 'nklnk', 9090.00, '800', '2025-02-27', '2025-02-28', 'https://chat.deepseek.com/', 'sent', '2025-02-25 15:08:24', '2025-02-25 15:08:24'),
(26, 7, 'kklklk', 'Consulting', 'Frontend Development', ',nlkjkj', 'services/9mE7aoxtvYIJPsa4gX5ihaw7jQmXM0veT1ehV9KZ.jpg', 'services/bfyCSGU7tQpF1WauWMga8sDtPu0DiLJjeeLItLoC.jpg', 'lkkl', 90989.00, '0909', '2025-02-18', '2025-02-28', 'https://chat.deepseek.com/', 'sent', '2025-02-25 15:10:30', '2025-02-25 15:10:30'),
(27, 7, 'kklklk', 'Consulting', 'Frontend Development', ',nlkjkj', 'services/C01SfMFsCeWLZbfFBWQ08xaN37IZLGKGVyw84BZk.jpg', 'services/dQeD9ExsvMW7INaEg5eH7nkQgoIZ4Qndxc0svWz5.jpg', 'lkkl', 90989.00, '0909', '2025-02-18', '2025-02-28', 'https://chat.deepseek.com/', 'sent', '2025-02-25 15:10:38', '2025-02-25 15:10:38'),
(28, 7, 'kklklk', 'Consulting', 'Frontend Development', ',nlkjkj', 'services/w5UymOS77czSGeoxtZix27dk6kC0wLSQhV7i1lvr.jpg', 'services/CW944clJJmCtabFPUgQBzNY1CsTyiGgQTpFKCi9T.jpg', 'lkkl', 90989.00, '0909', '2025-02-18', '2025-02-28', 'https://chat.deepseek.com/', 'sent', '2025-02-25 15:10:52', '2025-02-25 15:10:52'),
(29, 7, 'kklklk', 'Consulting', 'Frontend Development', ',nlkjkj', 'services/Yq4DjJ9gUXQTlCXjcE49BMrzTMjmU5oQYG61Gsk1.jpg', 'services/oGUx7gQjxZPtAcUw4Lf2GBeZSvoCp4sYtki4hmEq.jpg', 'lkkl', 90989.00, '0909', '2025-02-18', '2025-02-28', 'https://chat.deepseek.com/', 'sent', '2025-02-25 15:13:12', '2025-02-25 15:13:12'),
(30, 7, 'kklklk', 'Consulting', 'Frontend Development', ',nlkjkj', 'services/Sl1GNbYNUf20dTzhyNpnG5CkzZZlkNxgp2No8wYe.jpg', 'services/fQMnWkm7hZegVE4Faa5Gp2VgIR2KY3ECxhXv5W78.jpg', 'lkkl', 90989.00, '0909', '2025-02-18', '2025-02-28', 'https://chat.deepseek.com/', 'sent', '2025-02-25 15:13:25', '2025-02-25 15:13:25'),
(31, 7, 'kklklk', 'Consulting', 'Frontend Development', ',nlkjkj', 'services/GwSlLexeuiEox0oTQzYN87xnzOnu5BpXtSOgVLXt.jpg', 'services/QgWazujdwzI1byy2zvgR2D9l1Kcylk9GoVnJR6bc.jpg', 'lkkl', 90989.00, '0909', '2025-02-18', '2025-02-28', 'https://chat.deepseek.com/', 'sent', '2025-02-25 15:13:28', '2025-02-25 15:13:28'),
(32, 7, 'kklklk', 'Consulting', 'Frontend Development', ',nlkjkj', 'services/J1VUBP6rO4fV17fMUe9yy6k7w06tmO4lJSBaycJl.jpg', 'services/V1GO2btt7WdEV2zyzMDfWUuJfxUFOqPGsCRfd2oY.jpg', 'lkkl', 90989.00, '0909', '2025-02-18', '2025-02-28', 'https://chat.deepseek.com/', 'sent', '2025-02-25 15:13:36', '2025-02-25 15:13:36'),
(33, 7, 'kklklk', 'Consulting', 'Frontend Development', ',nlkjkj', 'services/Ws8EYRo3CKbcWMzLSuwscgmT5LPgjU31UXeElFAs.jpg', 'services/ujglsom9vbsGl29H3utzIwwERSo9Zmxbl5lo0Bl3.jpg', 'lkkl', 90989.00, '0909', '2025-02-18', '2025-02-28', 'https://chat.deepseek.com/', 'sent', '2025-02-25 15:13:41', '2025-02-25 15:13:41'),
(34, 7, 'Test Service', 'Web Development', 'Frontend Development', 'This is a test description for the service.', 'services/FxlH9T7BgVO1kC0KgfMJyTEabC4poSdJ.jpg', 'services/Kmh4f1B4yz7fZUxrek7VXasKr7Vkj4ac.jpg', 'HTML, CSS, JavaScript', 100.00, '5 days', '2025-01-01', '2025-01-10', 'https://example.com', 'sent', '2025-02-25 16:32:46', '2025-02-25 16:32:46'),
(35, 7, 'Test Service', 'Web Development', 'Frontend Development', 'This is a test description for the service.', 'Q9q7Szgaut12cuQOFcElZiw7dz3VSCui.jpg', 'U1tw6fVg6hcjHYmkwUsYKjbzhnrEvJyu.jpg', 'HTML, CSS, JavaScript', 100.00, '5 days', '2025-01-01', '2025-01-10', 'https://example.com', 'sent', '2025-02-25 16:33:27', '2025-02-25 16:33:27'),
(36, 7, 'Test Service', 'Web Development', 'Frontend Development', 'This is a test description for the service.', 'services/tciWcNmYwgKFcubfp3bHpJThhNwgVb2x.jpg', 'services/b5NpBBNJMV6PkYWpXyRGGmsKaUVtL8Ag.jpg', 'HTML, CSS, JavaScript', 100.00, '5 days', '2025-01-01', '2025-01-10', 'https://example.com', 'sent', '2025-02-25 16:33:41', '2025-02-25 16:33:41'),
(37, 7, 'make website', 'Programming', 'Frontend Development', 'making website', 'services/kTxWPC2ZhtYieyreRfck6ib1bL3S35T7.jpg', 'services/MpwhtViLVydyDPgUtKoPvv8TDizbmz7D.jpg', 'translation', 22.00, '23', '2025-03-05', '2025-03-04', 'https://www.google.com/', 'sent', '2025-03-04 08:21:36', '2025-03-04 08:21:36'),
(38, 7, 'make website', 'Programming', 'Frontend Development', 'making website', 'services/j0zw1OX4TQ39SNd3BcpPfYDSrKmkXf3F.jpg', 'services/qN8FyRCVEcJb5FuYtp3DgQble3CsjnfX.jpg', 'translation', 22.00, '23', '2025-03-05', '2025-03-04', 'https://www.google.com/', 'sent', '2025-03-04 08:21:47', '2025-03-04 08:21:47'),
(39, 7, 'make website', 'Programming', 'Frontend Development', 'making website', 'services/h7NZDdbzAY2FGbzg2Uguvz1bEDBxJZ2i.jpg', 'services/dV29mCy3FznzAuTIDMgl1QkN8S1hjD5P.jpg', 'translation', 22.00, '23', '2025-03-05', '2025-03-04', 'https://www.google.com/', 'sent', '2025-03-04 08:21:52', '2025-03-04 08:21:52');

-- --------------------------------------------------------

--
-- Table structure for table `sub_servieses`
--

CREATE TABLE `sub_servieses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `delivery_duration` varchar(255) NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_servieses`
--

INSERT INTO `sub_servieses` (`id`, `service_name`, `price`, `delivery_duration`, `service_id`, `created_at`, `updated_at`) VALUES
(1, 'ad', '23', '232', 1, '2025-02-24 09:05:54', '2025-02-24 09:05:54'),
(2, 'adasfasf', '23132', '23243', 15, '2025-02-24 10:16:06', '2025-02-24 10:16:06'),
(3, 'adasfasf', '23132', '23243', 21, '2025-02-24 10:26:36', '2025-02-24 10:26:36'),
(4, 'jljlk', '8989', '998', 26, '2025-02-25 15:10:38', '2025-02-25 15:10:38'),
(5, 'ljljk', '89899', '7998', 26, '2025-02-25 15:10:39', '2025-02-25 15:10:39'),
(6, 'jljlk', '8989', '998', 27, '2025-02-25 15:10:52', '2025-02-25 15:10:52'),
(7, 'ljljk', '89899', '7998', 27, '2025-02-25 15:10:53', '2025-02-25 15:10:53'),
(8, 'jljlk', '8989', '998', 28, '2025-02-25 15:13:12', '2025-02-25 15:13:12'),
(9, 'ljljk', '89899', '7998', 28, '2025-02-25 15:13:13', '2025-02-25 15:13:13'),
(10, 'jljlk', '8989', '998', 29, '2025-02-25 15:13:26', '2025-02-25 15:13:26'),
(11, 'ljljk', '89899', '7998', 29, '2025-02-25 15:13:26', '2025-02-25 15:13:26'),
(12, 'jljlk', '8989', '998', 30, '2025-02-25 15:13:29', '2025-02-25 15:13:29'),
(13, 'ljljk', '89899', '7998', 30, '2025-02-25 15:13:29', '2025-02-25 15:13:29'),
(14, 'jljlk', '8989', '998', 31, '2025-02-25 15:13:36', '2025-02-25 15:13:36'),
(15, 'ljljk', '89899', '7998', 31, '2025-02-25 15:13:36', '2025-02-25 15:13:36'),
(16, 'jljlk', '8989', '998', 32, '2025-02-25 15:13:41', '2025-02-25 15:13:41'),
(17, 'ljljk', '89899', '7998', 32, '2025-02-25 15:13:42', '2025-02-25 15:13:42'),
(18, 'ad', '23', '232', 26, '2025-02-25 16:42:53', '2025-02-25 16:42:53'),
(19, 'ad', '23', '232', 36, '2025-02-25 16:44:02', '2025-02-25 16:44:02');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_type` varchar(50) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `related_job_id` bigint(20) UNSIGNED DEFAULT NULL,
  `related_service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE `userdata` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `specialist` varchar(255) NOT NULL,
  `jobTitle` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `skillsOfWork` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`skillsOfWork`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`id`, `userId`, `specialist`, `jobTitle`, `description`, `skillsOfWork`, `created_at`, `updated_at`) VALUES
(14, 3, 'Design', 'asidjaspd', 'asd', '[\"dsad\",\"adsad\"]', '2025-02-02 13:46:58', '2025-02-03 12:58:51'),
(15, 1, 'Web Development', 'Full Stack Developer', 'Responsible for developing and maintaining web applications.', '\"[\\\"JavaScript\\\",\\\"React\\\",\\\"Laravel\\\",\\\"Node.js\\\"]\"', '2025-02-04 11:35:13', '2025-02-04 11:35:13'),
(16, 1, 'Web development', 'Backend Developer', 'ajpjdaspjdasdjasp', '\"[\\\"Web design\\\",\\\"Illustrator\\\"]\"', '2025-02-05 16:42:25', '2025-02-05 16:42:25'),
(17, 1, 'Photo shop', 'Full Stack Developer', 'sadasdd', '\"[\\\"Translate\\\"]\"', '2025-02-05 16:45:54', '2025-02-05 16:45:54'),
(18, 1, 'Web design', 'Frontend Developer', 'adasd', '\"[\\\"Translate\\\"]\"', '2025-02-05 16:48:02', '2025-02-05 16:48:02'),
(19, 1, 'Web development', 'Full Stack Developer', 'adaslkdhasil', '\"[\\\"Web design\\\"]\"', '2025-02-09 10:21:05', '2025-02-09 10:21:05'),
(20, 11, 'Web Development', 'Full Stack Developer', 'Responsible for developing and maintaining web applications.', '\"[\\\"JavaScript\\\",\\\"React\\\",\\\"Laravel\\\",\\\"Node.js\\\"]\"', '2025-02-18 10:22:21', '2025-02-18 10:22:21'),
(21, 11, 'Web design', 'Backend Developer', 'dsadsadsafsaf', '\"[\\\"Translate\\\"]\"', '2025-02-18 10:24:44', '2025-02-18 10:24:44'),
(22, 12, 'Web design', 'Backend Developer', 'casdljsaldj', '\"[\\\"Translate\\\"]\"', '2025-02-18 10:28:50', '2025-02-18 10:28:50'),
(23, 7, 'ui-ux', 'Frontend Developer', 'ds', '[\"add\",\"agf\"]', '2025-02-18 11:02:51', '2025-02-28 21:12:10'),
(24, 16, 'Web design', 'Frontend Developer', 'opkpokopdaps', '\"[\\\"Translate\\\"]\"', '2025-02-18 11:06:03', '2025-02-18 11:06:03'),
(25, 17, 'Web design', 'Frontend Developer', 'af;kao;fka;k', '\"[\\\"Translate\\\"]\"', '2025-02-18 11:08:28', '2025-02-18 11:08:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `accountType` varchar(255) NOT NULL,
  `isEmailVerified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `profilePhoto` varchar(255) DEFAULT NULL,
  `Region` varchar(255) DEFAULT NULL,
  `Phone_number` varchar(255) DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `userName`, `role`, `accountType`, `isEmailVerified`, `created_at`, `updated_at`, `profilePhoto`, `Region`, `Phone_number`, `Gender`, `type`, `rate`) VALUES
(1, 'John', 'Doe', 'ahmesddhisssham46737@gmail.com', '$2y$12$nEzZ/b8umqbjGZRZJj93q.EPFkriHtVJPmA4gW5E/nSwyqnkBadZG', 'hasedsllsssdo', 'user', 'freelancer', 1, '2025-01-31 05:47:07', '2025-01-31 05:47:07', NULL, NULL, NULL, NULL, NULL, 4),
(2, 'John', 'Doe', 'ahmesddhaisssham46737@gmail.com', '$2y$12$2L3xkA151aEwMbxzLo7ZoulBVGA3S9RsDIFo.MjhcvRdafceQKPcK', 'hasedsllssssdo', 'user', 'freelancer', 1, '2025-02-01 11:08:41', '2025-02-01 11:08:41', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'nkjkjadsadas', 'Doeaaa', 'ahmesddhdisssham46737@gmail.com', '$2y$12$B5vMeXUoXZ0xvAvrR31ReugAOMVyX.NGk95R0llTcavdwGWWLtyNm', 'dasdadasd', 'user', 'projectOwner', 1, '2025-02-02 07:08:06', '2025-02-03 12:41:44', 'D7OWpPiIn4ndEuz1Jiv5UsaNN3jkuQ9O.jpg', 'saudi-arabia', '0111323', 'Male', NULL, NULL),
(4, 'ahmed', 'hehsham', 'ahme@gmail.com', '$2y$12$ucmnvB.H67zYVrPn4VFizO52b0zFbboy6g3J3MHuC24HA4bjDon0e', 'ahmedahmed', 'user', 'company', 0, '2025-02-05 16:39:56', '2025-02-05 16:39:56', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'asdhmemd', 'dakldas', 'kadlasd@gmail.com', '$2y$12$S1UGttdA1X9QMT0pxRx0hO46YvwTXSZ/eEHAfGunixjs3mOPjCRvq', 'adasda', 'user', 'freelancer', 0, '2025-02-05 16:45:17', '2025-02-05 16:45:17', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'ajdkasl', 'jaskdjkasj', 'ajdlaskjd@gmail.com', '$2y$12$1RkTQvyxE32Gcj31Do4MQe793XUn81FYMbYHWjesafG5k7h9FimPi', 'asdas', 'user', 'project_owner', 1, '2025-02-05 16:47:44', '2025-02-05 16:47:44', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'John', 'Doe', 'ahmesddhdissasham46737@gmail.com', '$2y$12$LA0IbEEzOCidjwLl0aCeEuDlFt6Mz35SzE60dJUTw/uMZ.d5U2z5W', 'assss', 'user', 'projectOwner', 1, '2025-02-05 17:14:13', '2025-02-28 20:51:31', 'hMpyrmbfYibIsqCFSB7fPtP3P2aKYP5W.jpg', 'united-arab-emirates', NULL, 'mail', NULL, NULL),
(8, 'hkhkh', 'hkhkh', 'hausdhu@gmail.com', '$2y$12$JKM5X13NFTCtItzs62ikUeU4adA601g6Na/.b3Z1HCRwlhWGWPDvu', 'asdasd', 'user', 'freelancer', 0, '2025-02-06 09:20:41', '2025-02-06 09:20:41', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Ahmed', 'Hisham', 'ahmedhisham46737@gmail.com', '$2y$12$lsGnAz.SSNQY8tT1sG2JtOi.WtT9snQyZnEoK3wmRHv8wzjkiAyjW', 'adasd', 'user', 'freelancer', 0, '2025-02-09 10:18:31', '2025-02-09 10:18:31', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'ahmed', 'hisham', 'gamesmooodshisham@gmail.com', '$2y$12$rm4QLEYKZbHHrk65LreFLuVJWBKcfNTZ.dOH/YwE2BmniUDP3iXFe', 'ahdkslad', 'user', 'freelancer', 0, '2025-02-13 20:18:35', '2025-02-13 20:18:35', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'asdasd', 'dsjlkdjald', 'dsajdlas@gmail.com', '$2y$12$Sbm9oytI5NaUjlqiFd1/T.x5Roei.Zh6DpnCmQcXrxcUmYDsk4lpG', 'dsadsdsd', 'user', 'project_owner', 0, '2025-02-18 10:11:15', '2025-02-18 10:11:15', NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'dasdj', 'djasljdka', 'djaskljdkla@gmail.com', '$2y$12$RHsRNaOwfjcbd5hoQIZzQuNTb22cV1c/4OKfFKZRSzqULvRCgKazq', 'asdasds', 'user', 'freelancer', 0, '2025-02-18 10:27:59', '2025-02-18 10:27:59', NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'sadkasdj', 'sjkldjalskjsa', 'lsdkasjdkj@gmail.com', '$2y$12$x25sK.1wk6u6e5SlJ0YrmuLRfi32v2uw7KSTW1lhy1sRfs9HIQNIq', 'asdsafaf', 'user', 'freelancer', 0, '2025-02-18 10:31:25', '2025-02-18 10:31:25', NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'sadlkjasld', 'djasljdaskd', 'djaslkdjalk@gmail.com', '$2y$12$yzA8TDNFhg1D/7BQxiLg0uorfB5SZDw3u7tjJo1FE4j4aeXzjGcGy', 'affafasf', 'user', 'freelancer', 0, '2025-02-18 10:33:50', '2025-02-18 10:33:50', NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'lkljljj', ';lsjdklaj', 'djaslkdjal@gmail.com', '$2y$12$U0Fqc4XjtdccyxvFnnf8ceZxcW8uHwvMHQAafdJiVanRhwPwJLQsK', 'eeaepdjasldfjas', 'user', 'project_owner', 0, '2025-02-18 11:02:35', '2025-02-18 11:02:35', NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'asndlkasnl', 'dlasdjlaskd', 'jasldajsldk@gmail.com', '$2y$12$ykfkxjIbwRha67Qc6DFni.ecv1qrajKY85DzmZDy0qpXMb/R3tH6i', 'kljjjoj', 'user', 'project_owner', 0, '2025-02-18 11:05:48', '2025-02-18 11:05:48', NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'dasdad', 'saldasljd', 'djaldjlk@gmail.com', '$2y$12$ON.b0.hpmFULZyQyQ.SbNu2XDqkJGIG8I58SsVEL.SRZpM3a77nxy', 'dadasda', 'user', 'freelancer', 0, '2025-02-18 11:08:11', '2025-02-18 11:08:11', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userwork`
--

CREATE TABLE `userwork` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `workTitle` varchar(255) NOT NULL,
  `workDescription` text NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `workPhoto` varchar(255) NOT NULL,
  `completeDate` varchar(255) NOT NULL,
  `workLink` varchar(255) NOT NULL,
  `skillsOfWork` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`skillsOfWork`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userwork`
--

INSERT INTO `userwork` (`id`, `userId`, `workTitle`, `workDescription`, `thumbnail`, `workPhoto`, `completeDate`, `workLink`, `skillsOfWork`, `created_at`, `updated_at`) VALUES
(1, 3, 'Portfolio Website Development', 'Developed a portfolio website showcasing personal projects, skills, and achievements.', '2RjR0hp1mYDgAwFvNYEszEUsYMMDYE7D.jpg', 'l1Axp2GkbW5sz5ZGiHRF03nyU9Klhjrs.jpg', '2025-01-20', 'https://www.myportfolio.com', '\"\\\"HTML,CSS,JavaScript,React,Laravel\\\"\"', '2025-02-02 18:37:14', '2025-02-02 18:37:14'),
(2, 3, 'Portfolio Website Development', 'Developed a portfolio website showcasing personal projects, skills, and achievements.', '0HexfiJMDG94294gZEV3ltPGihlBdlWr.jpg', 's15eb3PB5rft2BS1efn1qmSMtjG6AXfN.jpg', '2025-01-20', 'https://www.myportfolio.com', '\"\\\"HTML,CSS,JavaScript,React,Laravel\\\"\"', '2025-02-02 18:39:25', '2025-02-02 18:39:25'),
(3, 3, 'Portfolio Website Development', 'Developed a portfolio website showcasing personal projects, skills, and achievements.', '02Bva9sR28dWJQiKvLHBJauYczKjRUZC.jpg', '2PhsGmKg2zyrjcRJ6Cx5fjBhAMPbfMIh.jpg', '2025-01-20', 'https://www.myportfolio.com', '\"\\\"HTML,CSS,JavaScript,React,Laravel\\\"\"', '2025-02-04 11:49:32', '2025-02-04 11:49:32'),
(4, 1, 'Portfolio Website Development', 'Developed a portfolio website showcasing personal projects, skills, and achievements.', 'LZmkEbmKM8cHkXIu3zPPrk6OrHocK2ol.jpg', 'QFOuEvmoSdL13gOk63LxsBS9nS4qKKBl.jpg', '2025-01-20', 'https://www.myportfolio.com', '\"\\\"HTML,CSS,JavaScript,React,Laravel\\\"\"', '2025-02-04 11:49:35', '2025-02-04 11:49:35'),
(5, 1, 'شيشسحيتمني', 'يىمشىيوشسىينضى', 'ZDlyijF9HheU6MaH8tY68hoSSq1G7JmN.jpg', 'BGX0nfjU8XzhUYvFjheuXXpIA4GdebaZ.jpg', '2025-02-13', 'https://paymentservices.amazon.com/', '\"\\\"Translate,Web design\\\"\"', '2025-02-05 17:50:54', '2025-02-05 17:50:54'),
(6, 17, 'j;adfjasldj', 'dlkasjdkljsjk', '2pKrawq5OR0MfuTwIqUhr12rOi5jQA30.jpg', '4hhJKENDDYPVsQN8G3OuwwJAuAH3oFys.jpg', '2025-02-13', 'https://www.youtube.com/watch?v=mOON9pyIuMI', '\"\\\"Translate\\\"\"', '2025-02-18 12:27:40', '2025-02-18 12:27:40'),
(7, 17, 'daslidajdjaslk', 'sdkaskdldjksl', 'IMj7rLYFsjlMihFkzdXILPoDle5TTTMZ.jpg', 'HqOa1W7kOQYgH6lNtMMrWjgSHlv9eWY2.jpg', '2025-02-20', 'https://www.youtube.com/watch?v=mOON9pyIuMI', '\"\\\"Translate\\\"\"', '2025-02-18 12:27:41', '2025-02-18 12:27:41'),
(8, 17, 'jlqjjdskla', 'dlsjdakld', '8YwadAPAzijlMzMjYphA0lg2CHmwHvK7.jpg', 'pUS6B3lC5NIvssy227h0SkrBHnigVD1g.jpg', '2025-02-20', 'https://www.youtube.com/watch?v=uKA4kryoYD4', '\"\\\"Translate\\\"\"', '2025-02-18 12:41:51', '2025-02-18 12:41:51'),
(9, 17, 'asdasdasd', 'dasdasldjl', 'YOqf1Onjcv27QCeEwMWhslp4TufALrzY.jpg', 'IUD0udRu5VZJZXfsSNlxcqO1g5am7I8q.jpg', '2025-02-20', 'https://www.youtube.com/watch?v=uKA4kryoYD4', '\"\\\"Translate\\\"\"', '2025-02-18 12:41:51', '2025-02-18 12:41:51'),
(10, 17, 'jlqjjdskla', 'dlsjdakld', 'U5apoOw2Mqcs6k5nEqpJXfSe2z2k2kp7.jpg', 'xKaT0ZRsEJn2WYbSAETgpO8w8b1auEUt.jpg', '2025-02-20', 'https://www.youtube.com/watch?v=uKA4kryoYD4', '\"\\\"Translate\\\"\"', '2025-02-18 12:46:30', '2025-02-18 12:46:30'),
(11, 17, 'asdasdasd', 'dasdasldjl', 'bdtoJdBro4tDRFo3JbHtdU9AyOSf15dt.jpg', 'JizGuiDhu7oCGcBXDNgvN3og15H5rJpt.jpg', '2025-02-20', 'https://www.youtube.com/watch?v=uKA4kryoYD4', '\"\\\"Translate\\\"\"', '2025-02-18 12:46:31', '2025-02-18 12:46:31'),
(12, 17, 'jlqjjdskla', 'dlsjdakld', 'znBHZJQPkWr9GRLvuuQu6hn90dMdfuFj.jpg', 'K26h8mOFNzPZIQCI5f7EhAkKsB2byX4r.jpg', '2025-02-20', 'https://www.youtube.com/watch?v=uKA4kryoYD4', '\"\\\"Translate\\\"\"', '2025-02-18 12:48:19', '2025-02-18 12:48:19'),
(13, 17, 'asdasdasd', 'dasdasldjl', '5Cl5NieJ0JdG670at4qc2rJ2FcFt8yA4.jpg', '82tOY2dgSNIcCpi1Tl5blprF7Qf13iKj.jpg', '2025-02-20', 'https://www.youtube.com/watch?v=uKA4kryoYD4', '\"\\\"Translate\\\"\"', '2025-02-18 12:48:19', '2025-02-18 12:48:19');

-- --------------------------------------------------------

--
-- Table structure for table `user_balances`
--

CREATE TABLE `user_balances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `pending_balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `available_balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `withdrawal_balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_balances`
--

INSERT INTO `user_balances` (`id`, `user_id`, `total_balance`, `pending_balance`, `available_balance`, `withdrawal_balance`, `created_at`, `updated_at`) VALUES
(2, 1, 1000.00, 200.00, 800.00, 0.00, '2025-01-31 05:53:39', '2025-01-31 05:53:39'),
(3, 1, 1000.00, 200.00, 800.00, 0.00, '2025-02-01 10:42:05', '2025-02-01 10:42:05'),
(4, 1, 1000.00, 200.00, 800.00, 0.00, '2025-02-02 08:27:22', '2025-02-02 08:27:22'),
(5, 1, 1000.00, 200.00, 800.00, 0.00, '2025-02-02 08:32:14', '2025-02-02 08:32:14'),
(6, 1, 1000.00, 200.00, 800.00, 0.00, '2025-02-02 08:32:29', '2025-02-02 08:32:29'),
(7, 1, 1000.00, 200.00, 800.00, 0.00, '2025-02-02 08:32:33', '2025-02-02 08:32:33'),
(8, 3, 1000.00, 200.00, 800.00, 0.00, '2025-02-02 08:40:31', '2025-02-02 08:40:31'),
(9, 3, 1000.00, 200.00, 800.00, 0.00, '2025-02-02 08:40:38', '2025-02-02 08:40:38'),
(10, 3, 1000.00, 200.00, 800.00, 0.00, '2025-02-02 08:42:06', '2025-02-02 08:42:06'),
(11, 3, 1000.00, 200.00, 800.00, 0.00, '2025-02-02 08:42:11', '2025-02-02 08:42:11');

-- --------------------------------------------------------

--
-- Table structure for table `user_statistics`
--

CREATE TABLE `user_statistics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ratings` decimal(3,2) NOT NULL,
  `project_completion_rate` decimal(5,2) NOT NULL,
  `reemployment_rate` decimal(5,2) NOT NULL,
  `on_time_delivery_rate` decimal(5,2) NOT NULL,
  `average_response_time` varchar(255) NOT NULL,
  `registration_date` date NOT NULL,
  `last_seen_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_statistics`
--

INSERT INTO `user_statistics` (`id`, `user_id`, `ratings`, `project_completion_rate`, `reemployment_rate`, `on_time_delivery_rate`, `average_response_time`, `registration_date`, `last_seen_at`, `created_at`, `updated_at`) VALUES
(2, 3, 4.80, 96.70, 82.10, 97.90, '12 hours & 30 min', '2024-09-15', '2025-02-02 13:00:00', '2025-02-02 11:37:46', '2025-02-02 11:37:46');

-- --------------------------------------------------------

--
-- Table structure for table `vrifications`
--

CREATE TABLE `vrifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `front_id_image_path` varchar(255) DEFAULT NULL,
  `back_id_image_path` varchar(255) DEFAULT NULL,
  `selfie_with_id_image_path` varchar(255) DEFAULT NULL,
  `verification_status` enum('pending','processing','verified','rejected') NOT NULL DEFAULT 'pending',
  `userId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_accounts_userid_foreign` (`userId`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_messages_freelancer_id_foreign` (`freelancer_id`),
  ADD KEY `contact_messages_client_id_foreign` (`client_id`);

--
-- Indexes for table `credite_cards`
--
ALTER TABLE `credite_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credite_cards_userid_foreign` (`userId`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emails_userid_foreign` (`userId`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favourites_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_receiver_foreign` (`user_id_receiver`),
  ADD KEY `notifications_user_id_sender_foreign` (`user_id_sender`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offers_project_id_foreign` (`project_id`),
  ADD KEY `offers_freelancer_id_foreign` (`freelancer_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_user_id_foreign` (`user_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_buyer_user_id_index` (`buyer_user_id`),
  ADD KEY `purchases_seller_user_id_index` (`seller_user_id`),
  ADD KEY `purchases_service_id_index` (`service_id`),
  ADD KEY `purchases_status_index` (`status`),
  ADD KEY `purchases_purchase_date_index` (`purchase_date`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_user_id_foreign` (`user_id`);

--
-- Indexes for table `sub_servieses`
--
ALTER TABLE `sub_servieses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_servieses_service_id_foreign` (`service_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_related_job_id_foreign` (`related_job_id`),
  ADD KEY `transactions_related_service_id_foreign` (`related_service_id`);

--
-- Indexes for table `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userdata_userid_foreign` (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`userName`);

--
-- Indexes for table `userwork`
--
ALTER TABLE `userwork`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userwork_userid_foreign` (`userId`);

--
-- Indexes for table `user_balances`
--
ALTER TABLE `user_balances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_balances_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_statistics`
--
ALTER TABLE `user_statistics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_statistics_user_id_unique` (`user_id`);

--
-- Indexes for table `vrifications`
--
ALTER TABLE `vrifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vrifications_userid_foreign` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `credite_cards`
--
ALTER TABLE `credite_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `sub_servieses`
--
ALTER TABLE `sub_servieses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userdata`
--
ALTER TABLE `userdata`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `userwork`
--
ALTER TABLE `userwork`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_balances`
--
ALTER TABLE `user_balances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_statistics`
--
ALTER TABLE `user_statistics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vrifications`
--
ALTER TABLE `vrifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD CONSTRAINT `bank_accounts_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD CONSTRAINT `contact_messages_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contact_messages_freelancer_id_foreign` FOREIGN KEY (`freelancer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `credite_cards`
--
ALTER TABLE `credite_cards`
  ADD CONSTRAINT `credite_cards_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `emails_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_receiver_foreign` FOREIGN KEY (`user_id_receiver`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_user_id_sender_foreign` FOREIGN KEY (`user_id_sender`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `offers_freelancer_id_foreign` FOREIGN KEY (`freelancer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `offers_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_buyer_user_id_foreign` FOREIGN KEY (`buyer_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchases_seller_user_id_foreign` FOREIGN KEY (`seller_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchases_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_servieses`
--
ALTER TABLE `sub_servieses`
  ADD CONSTRAINT `sub_servieses_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_related_job_id_foreign` FOREIGN KEY (`related_job_id`) REFERENCES `jobs` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_related_service_id_foreign` FOREIGN KEY (`related_service_id`) REFERENCES `services` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userdata`
--
ALTER TABLE `userdata`
  ADD CONSTRAINT `userdata_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userwork`
--
ALTER TABLE `userwork`
  ADD CONSTRAINT `userwork_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_balances`
--
ALTER TABLE `user_balances`
  ADD CONSTRAINT `user_balances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_statistics`
--
ALTER TABLE `user_statistics`
  ADD CONSTRAINT `user_statistics_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vrifications`
--
ALTER TABLE `vrifications`
  ADD CONSTRAINT `vrifications_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
