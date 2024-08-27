-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2024-08-26 15:32:46
-- 服务器版本： 10.4.32-MariaDB
-- PHP 版本： 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `cvv`
--

-- --------------------------------------------------------

--
-- 表的结构 `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'ADMIN',
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `mobile_code` varchar(10) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_postal` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `device_info` text DEFAULT NULL,
  `last_logged_in` timestamp NULL DEFAULT NULL,
  `last_logged_out` timestamp NULL DEFAULT NULL,
  `login_status` tinyint(1) NOT NULL DEFAULT 0,
  `notification_clear_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin_role_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `admins`
--

INSERT INTO `admins` (`id`, `firstname`, `lastname`, `username`, `user_type`, `email`, `password`, `image`, `email_verified_at`, `remember_token`, `mobile_code`, `phone`, `country`, `city`, `state`, `zip_postal`, `address`, `device_id`, `status`, `device_info`, `last_logged_in`, `last_logged_out`, `login_status`, `notification_clear_at`, `created_at`, `updated_at`, `admin_role_id`) VALUES
(1, 'Sun Jiaqiang', 'Sun', 'admin', 'ADMIN', 'sjf110@gmail.com', '$2y$10$aveSUkdAUURRP0NkC6nEsOY2H6qu41xUJL6t8uqdQYg8.D47ll6O2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2024-08-26 03:43:39', NULL, 1, NULL, '2024-08-21 08:41:28', '2024-08-26 03:43:39', 1),
(2, 'Maximo', 'Grimes', 'wyman.velva', 'ADMIN', 'mswaniawski@hotmail.com', '$2y$10$ke8oY2lL2GqNhUVv291IpuvTIX6U1ElIduzqT7Zzthi22CtGJ0aTC', NULL, NULL, NULL, NULL, '(607) 956-4940', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, '2024-08-21 08:41:28', '2024-08-21 08:41:28', NULL),
(3, 'Maegan', 'Parker', 'anastacio91', 'ADMIN', 'imelda48@hotmail.com', '$2y$10$hU5ul2XvL4gcY/BcOCbGCuTkqZkjJqwfK2MWoFODcrj8PEu2Fmc8K', NULL, NULL, NULL, NULL, '1-445-803-7026', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, '2024-08-21 08:41:28', '2024-08-21 08:41:28', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `admin_has_roles`
--

CREATE TABLE `admin_has_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `admin_role_id` bigint(20) UNSIGNED NOT NULL,
  `last_edit_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `admin_has_roles`
--

INSERT INTO `admin_has_roles` (`id`, `admin_id`, `admin_role_id`, `last_edit_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2024-08-21 08:41:28', '2024-08-21 08:41:28');

-- --------------------------------------------------------

--
-- 表的结构 `admin_login_logs`
--

CREATE TABLE `admin_login_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `mac` varchar(17) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `browser` varchar(30) DEFAULT NULL,
  `os` varchar(30) DEFAULT NULL,
  `timezone` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `admin_login_logs`
--

INSERT INTO `admin_login_logs` (`id`, `admin_id`, `ip`, `mac`, `city`, `country`, `longitude`, `latitude`, `browser`, `os`, `timezone`, `created_at`, `updated_at`) VALUES
(1, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Edge', 'Windows', 'America/New_York', '2024-08-21 08:42:27', '2024-08-21 08:42:27'),
(2, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Chrome', 'Windows', 'America/New_York', '2024-08-21 10:16:28', '2024-08-21 10:16:28'),
(3, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Edge', 'Windows', 'America/New_York', '2024-08-21 12:13:57', '2024-08-21 12:13:57'),
(4, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Chrome', 'Windows', 'America/New_York', '2024-08-22 00:18:24', '2024-08-22 00:18:24'),
(5, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Edge', 'Windows', 'America/New_York', '2024-08-22 03:21:32', '2024-08-22 03:21:32'),
(6, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Edge', 'Windows', 'America/New_York', '2024-08-22 05:51:26', '2024-08-22 05:51:26'),
(7, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Edge', 'Windows', 'America/New_York', '2024-08-22 06:22:47', '2024-08-22 06:22:47'),
(8, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Edge', 'Windows', 'America/New_York', '2024-08-22 11:52:13', '2024-08-22 11:52:13'),
(9, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Edge', 'Windows', 'America/New_York', '2024-08-23 03:41:28', '2024-08-23 03:41:28'),
(10, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Edge', 'Windows', 'America/New_York', '2024-08-23 09:30:40', '2024-08-23 09:30:40'),
(11, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Chrome', 'Windows', 'America/New_York', '2024-08-24 05:18:26', '2024-08-24 05:18:26'),
(12, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Chrome', 'Windows', 'America/New_York', '2024-08-24 11:44:31', '2024-08-24 11:44:31'),
(13, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Chrome', 'Windows', 'America/New_York', '2024-08-25 09:31:40', '2024-08-25 09:31:40'),
(14, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Chrome', 'Windows', 'America/New_York', '2024-08-25 13:18:36', '2024-08-25 13:18:36'),
(15, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Chrome', 'Windows', 'America/New_York', '2024-08-26 03:43:38', '2024-08-26 03:43:38');

-- --------------------------------------------------------

--
-- 表的结构 `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `admin_notifications`
--

INSERT INTO `admin_notifications` (`id`, `admin_id`, `type`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 'SIDE_NAV', '{\"title\":\"Sun Jiaqiang Sun(admin) logged in.\",\"time\":\"1 second ago\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/default.webp\"}', '2024-08-21 08:42:27', '2024-08-21 08:42:27'),
(2, 1, 'SIDE_NAV', '{\"title\":\"Sun Jiaqiang Sun(admin) logged in.\",\"time\":\"1 second ago\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/default.webp\"}', '2024-08-21 10:16:28', '2024-08-21 10:16:28'),
(3, 1, 'SIDE_NAV', '{\"title\":\"Sun Jiaqiang Sun(admin) logged in.\",\"time\":\"1 second ago\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/default.webp\"}', '2024-08-21 12:13:57', '2024-08-21 12:13:57'),
(4, 1, 'SIDE_NAV', '{\"title\":\"Sun Jiaqiang Sun(admin) logged in.\",\"time\":\"1 second ago\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/default.webp\"}', '2024-08-22 00:18:24', '2024-08-22 00:18:24'),
(5, 1, 'SIDE_NAV', '{\"title\":\"Sun Jiaqiang Sun(admin) logged in.\",\"time\":\"1 second ago\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/default.webp\"}', '2024-08-22 03:21:32', '2024-08-22 03:21:32'),
(6, 1, 'SIDE_NAV', '{\"title\":\"Sun Jiaqiang Sun(admin) logged in.\",\"time\":\"1 second ago\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/default.webp\"}', '2024-08-22 05:51:26', '2024-08-22 05:51:26'),
(7, 1, 'SIDE_NAV', '{\"title\":\"Sun Jiaqiang Sun(admin) logged in.\",\"time\":\"1 second ago\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/default.webp\"}', '2024-08-22 06:22:47', '2024-08-22 06:22:47'),
(8, 1, 'SIDE_NAV', '{\"title\":\"Sun Jiaqiang Sun(admin) logged in.\",\"time\":\"1 second ago\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/default.webp\"}', '2024-08-22 11:52:13', '2024-08-22 11:52:13'),
(9, 1, 'SIDE_NAV', '{\"title\":\"Sun Jiaqiang Sun(admin) logged in.\",\"time\":\"1 second ago\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/default.webp\"}', '2024-08-23 03:41:28', '2024-08-23 03:41:28'),
(10, 1, 'SIDE_NAV', '{\"title\":\"Sun Jiaqiang Sun(admin) logged in.\",\"time\":\"1 second ago\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/default.webp\"}', '2024-08-23 09:30:40', '2024-08-23 09:30:40'),
(11, 1, 'SIDE_NAV', '{\"title\":\"Sun Jiaqiang Sun(admin) logged in.\",\"time\":\"1 second ago\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/default.webp\"}', '2024-08-24 05:18:26', '2024-08-24 05:18:26'),
(12, 1, 'SIDE_NAV', '{\"title\":\"Sun Jiaqiang Sun(admin) logged in.\",\"time\":\"1 second ago\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/default.webp\"}', '2024-08-24 11:44:31', '2024-08-24 11:44:31'),
(13, 1, 'SIDE_NAV', '{\"title\":\"Sun Jiaqiang Sun(admin) logged in.\",\"time\":\"1 second ago\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/default.webp\"}', '2024-08-25 09:31:40', '2024-08-25 09:31:40'),
(14, 1, 'SIDE_NAV', '{\"title\":\"Sun Jiaqiang Sun(admin) logged in.\",\"time\":\"1 second ago\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/default.webp\"}', '2024-08-25 13:18:36', '2024-08-25 13:18:36'),
(15, 1, 'SIDE_NAV', '{\"title\":\"Sun Jiaqiang Sun(admin) logged in.\",\"time\":\"1 second ago\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/default.webp\"}', '2024-08-26 03:43:38', '2024-08-26 03:43:38');

-- --------------------------------------------------------

--
-- 表的结构 `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `admin_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Super Admin', 1, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(2, 1, 'Sub Admin', 1, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(3, 1, 'Moderator', 1, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(4, 1, 'Editor', 1, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(5, 1, 'Support Team', 1, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(6, 1, 'IT Specialist', 1, '2024-08-21 08:41:28', '2024-08-21 08:41:28');

-- --------------------------------------------------------

--
-- 表的结构 `admin_role_has_permissions`
--

CREATE TABLE `admin_role_has_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_role_permission_id` bigint(20) UNSIGNED NOT NULL,
  `route` varchar(100) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `last_edit_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_role_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `slug` varchar(80) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `app_onboard_screens`
--

CREATE TABLE `app_onboard_screens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `last_edit_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `app_onboard_screens`
--

INSERT INTO `app_onboard_screens` (`id`, `title`, `sub_title`, `image`, `status`, `last_edit_by`, `created_at`, `updated_at`) VALUES
(1, 'Create Unlimited Virtual Cards for Unlimited Usage', 'Users can easily create virtual credit cards from here. Use anytime anywhere and unlimited. Thanks for start a new journey with StripCard.', 'seeder/Onboard1.png', 1, 1, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(2, 'Easy, Quick & Secure System for Create Virtual Card', 'StripCard has the most secure system which is very useful for money transactions. Get ready to use unlimited virtual credit card system.', 'seeder/Onboard2.png', 1, 1, '2024-08-21 08:41:28', '2024-08-21 08:41:28');

-- --------------------------------------------------------

--
-- 表的结构 `app_settings`
--

CREATE TABLE `app_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `splash_screen_image` varchar(255) DEFAULT NULL,
  `url_title` varchar(191) DEFAULT NULL,
  `android_url` varchar(255) DEFAULT NULL,
  `iso_url` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `app_settings`
--

INSERT INTO `app_settings` (`id`, `version`, `splash_screen_image`, `url_title`, `android_url`, `iso_url`, `created_at`, `updated_at`) VALUES
(1, '3.6.0', 'seeder/splash_screen.png', 'App Url', 'https://play.google.com/store', 'https://www.apple.com/app-store', '2024-08-21 08:41:28', '2024-08-21 08:41:28');

-- --------------------------------------------------------

--
-- 表的结构 `basic_settings`
--

CREATE TABLE `basic_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(100) DEFAULT NULL,
  `site_title` varchar(255) DEFAULT NULL,
  `base_color` varchar(50) DEFAULT NULL,
  `secondary_color` varchar(50) DEFAULT NULL,
  `otp_exp_seconds` int(11) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `user_registration` tinyint(1) NOT NULL DEFAULT 1,
  `secure_password` tinyint(1) NOT NULL DEFAULT 0,
  `agree_policy` tinyint(1) NOT NULL DEFAULT 0,
  `force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `email_verification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_verification` tinyint(1) NOT NULL DEFAULT 0,
  `email_notification` tinyint(1) NOT NULL DEFAULT 0,
  `push_notification` tinyint(1) NOT NULL DEFAULT 0,
  `kyc_verification` tinyint(1) NOT NULL DEFAULT 0,
  `site_logo_dark` varchar(255) DEFAULT NULL,
  `site_logo` varchar(255) DEFAULT NULL,
  `site_fav_dark` varchar(255) DEFAULT NULL,
  `site_fav` varchar(255) DEFAULT NULL,
  `mail_config` text DEFAULT NULL,
  `mail_activity` text DEFAULT NULL,
  `push_notification_config` text DEFAULT NULL,
  `push_notification_activity` text DEFAULT NULL,
  `broadcast_config` text DEFAULT NULL,
  `broadcast_activity` text DEFAULT NULL,
  `sms_config` text DEFAULT NULL,
  `sms_activity` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `web_version` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `basic_settings`
--

INSERT INTO `basic_settings` (`id`, `site_name`, `site_title`, `base_color`, `secondary_color`, `otp_exp_seconds`, `timezone`, `user_registration`, `secure_password`, `agree_policy`, `force_ssl`, `email_verification`, `sms_verification`, `email_notification`, `push_notification`, `kyc_verification`, `site_logo_dark`, `site_logo`, `site_fav_dark`, `site_fav`, `mail_config`, `mail_activity`, `push_notification_config`, `push_notification_activity`, `broadcast_config`, `broadcast_activity`, `sms_config`, `sms_activity`, `created_at`, `updated_at`, `web_version`) VALUES
(1, 'Cvv Card', 'Virtual Credit Card Solution', '#635bfe', '#ea5455', 3600, 'Asia/Dhaka', 1, 0, 1, 0, 0, 0, 0, 0, 0, 'seeder/logo-white.png', 'seeder/logo-dark.png', 'seeder/favicon-dark.png', 'seeder/favicon-white.png', '{\"method\":\"smtp\",\"host\":\"\",\"port\":\"\",\"encryption\":\"\",\"password\":\"\",\"username\":\"\",\"from\":\"\",\"app_name\":\"\"}', NULL, '{\"method\":\"pusher\",\"instance_id\":\"255ae045-4995-4b74-9caf-b9b5101780df\",\"primary_key\":\"CDBB1D7FC33B562C63019647D3076998A14B97B251F651CB72B3934E49114200\"}', NULL, '{\"method\":\"pusher\",\"app_id\":\"1574360\",\"primary_key\":\"971ccaa6176db78407bf\",\"secret_key\":\" a30a6f1a61b97eb8225a\",\"cluster\":\"ap2\"}', NULL, NULL, NULL, '2024-08-21 08:41:28', '2024-08-26 04:27:55', '3.6.0');

-- --------------------------------------------------------

--
-- 表的结构 `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `tags` longtext DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `blogs`
--

INSERT INTO `blogs` (`id`, `admin_id`, `category_id`, `name`, `slug`, `image`, `tags`, `details`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 5, '{\"language\":{\"en\":{\"name\":\"The Rise of Virtual Credit Cards: Transforming Online Payments\"},\"es\":{\"name\":\"El auge de las tarjetas de cr\\u00e9dito virtuales: transformando los pagos en l\\u00ednea\"},\"ar\":{\"name\":\"\\u0638\\u0647\\u0648\\u0631 \\u0628\\u0637\\u0627\\u0642\\u0627\\u062a \\u0627\\u0644\\u0627\\u0626\\u062a\\u0645\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u064a\\u0629: \\u062a\\u062d\\u0648\\u064a\\u0644 \\u0627\\u0644\\u0645\\u062f\\u0641\\u0648\\u0639\\u0627\\u062a \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a\"}}}', 'the-rise-of-virtual-credit-cards-transforming-online-payments', '4ed4a526-d4e2-4132-82c5-5d846e044020.webp', '[\"StripCard\",\"VirtualCard\",\"Appdevs\"]', '{\"language\":{\"en\":{\"details\":\"<p>In today\\u2019s digital age, online payments have become an integral part of our lives. But with convenience comes the need for security. This blog explores the phenomenon of virtual credit cards, their growing popularity, and how they are revolutionizing online payments. We delve into the benefits of virtual credit cards, their unique features, and why they are considered the future of secure online transactions.<\\/p>\"},\"es\":{\"details\":\"<p>En la era digital actual, los pagos en l\\u00ednea se han convertido en una parte integral de nuestras vidas. Pero la comodidad conlleva la necesidad de seguridad. Este blog explora el fen\\u00f3meno de las tarjetas de cr\\u00e9dito virtuales, su creciente popularidad y c\\u00f3mo est\\u00e1n revolucionando los pagos en l\\u00ednea. Profundizamos en los beneficios de las tarjetas de cr\\u00e9dito virtuales, sus caracter\\u00edsticas \\u00fanicas y por qu\\u00e9 se consideran el futuro de las transacciones seguras en l\\u00ednea.<\\/p>\"},\"ar\":{\"details\":\"<p>\\u0641\\u064a \\u0627\\u0644\\u0639\\u0635\\u0631 \\u0627\\u0644\\u0631\\u0642\\u0645\\u064a \\u0627\\u0644\\u0630\\u064a \\u0646\\u0639\\u064a\\u0634\\u0647 \\u0627\\u0644\\u064a\\u0648\\u0645\\u060c \\u0623\\u0635\\u0628\\u062d\\u062a \\u0627\\u0644\\u0645\\u062f\\u0641\\u0648\\u0639\\u0627\\u062a \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a \\u062c\\u0632\\u0621\\u064b\\u0627 \\u0644\\u0627 \\u064a\\u062a\\u062c\\u0632\\u0623 \\u0645\\u0646 \\u062d\\u064a\\u0627\\u062a\\u0646\\u0627. \\u0648\\u0644\\u0643\\u0646 \\u0645\\u0639 \\u0627\\u0644\\u0631\\u0627\\u062d\\u0629 \\u062a\\u0623\\u062a\\u064a \\u0627\\u0644\\u062d\\u0627\\u062c\\u0629 \\u0625\\u0644\\u0649 \\u0627\\u0644\\u0623\\u0645\\u0646. \\u062a\\u0633\\u062a\\u0643\\u0634\\u0641 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0645\\u062f\\u0648\\u0646\\u0629 \\u0638\\u0627\\u0647\\u0631\\u0629 \\u0628\\u0637\\u0627\\u0642\\u0627\\u062a \\u0627\\u0644\\u0627\\u0626\\u062a\\u0645\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u064a\\u0629 \\u0648\\u0634\\u0639\\u0628\\u064a\\u062a\\u0647\\u0627 \\u0627\\u0644\\u0645\\u062a\\u0632\\u0627\\u064a\\u062f\\u0629 \\u0648\\u0643\\u064a\\u0641 \\u062a\\u064f\\u062d\\u062f\\u062b \\u062b\\u0648\\u0631\\u0629 \\u0641\\u064a \\u0645\\u062c\\u0627\\u0644 \\u0627\\u0644\\u062f\\u0641\\u0639 \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a. \\u0646\\u062d\\u0646 \\u0646\\u062a\\u0639\\u0645\\u0642 \\u0641\\u064a \\u0641\\u0648\\u0627\\u0626\\u062f \\u0628\\u0637\\u0627\\u0642\\u0627\\u062a \\u0627\\u0644\\u0627\\u0626\\u062a\\u0645\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u064a\\u0629\\u060c \\u0648\\u0645\\u064a\\u0632\\u0627\\u062a\\u0647\\u0627 \\u0627\\u0644\\u0641\\u0631\\u064a\\u062f\\u0629\\u060c \\u0648\\u0644\\u0645\\u0627\\u0630\\u0627 \\u062a\\u0639\\u062a\\u0628\\u0631 \\u0645\\u0633\\u062a\\u0642\\u0628\\u0644 \\u0627\\u0644\\u0645\\u0639\\u0627\\u0645\\u0644\\u0627\\u062a \\u0627\\u0644\\u0622\\u0645\\u0646\\u0629 \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a.<\\/p>\"}}}', 1, '2023-11-06 04:49:48', '2023-11-06 04:49:48'),
(2, 1, 5, '{\"language\":{\"en\":{\"name\":\"Entrepreneurial Success with Virtual Credit Card Services\"},\"es\":{\"name\":\"\\u00c9xito empresarial con servicios de tarjetas de cr\\u00e9dito virtuales\"},\"ar\":{\"name\":\"\\u0646\\u062c\\u0627\\u062d \\u0631\\u064a\\u0627\\u062f\\u0629 \\u0627\\u0644\\u0623\\u0639\\u0645\\u0627\\u0644 \\u0645\\u0639 \\u062e\\u062f\\u0645\\u0627\\u062a \\u0628\\u0637\\u0627\\u0642\\u0627\\u062a \\u0627\\u0644\\u0627\\u0626\\u062a\\u0645\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u064a\\u0629\"}}}', 'entrepreneurial-success-with-virtual-credit-card-services', '56a5408b-0f2b-4eb0-9e56-004435a8170e.webp', '[\"Money\",\"Online\",\"StripCard\",\"Payment\"]', '{\"language\":{\"en\":{\"details\":\"<p>In today\\u2019s digital age, online payments have become an integral part of our lives. But with convenience comes the need for security. This blog explores the phenomenon of virtual credit cards, their growing popularity, and how they are revolutionizing online payments. We delve into the benefits of virtual credit cards, their unique features, and why they are considered the future of secure online transactions.<\\/p>\"},\"es\":{\"details\":\"<p>En la era digital actual, los pagos en l\\u00ednea se han convertido en una parte integral de nuestras vidas. Pero la comodidad conlleva la necesidad de seguridad. Este blog explora el fen\\u00f3meno de las tarjetas de cr\\u00e9dito virtuales, su creciente popularidad y c\\u00f3mo est\\u00e1n revolucionando los pagos en l\\u00ednea. Profundizamos en los beneficios de las tarjetas de cr\\u00e9dito virtuales, sus caracter\\u00edsticas \\u00fanicas y por qu\\u00e9 se consideran el futuro de las transacciones seguras en l\\u00ednea.<\\/p>\"},\"ar\":{\"details\":\"<p>\\u0641\\u064a \\u0627\\u0644\\u0639\\u0635\\u0631 \\u0627\\u0644\\u0631\\u0642\\u0645\\u064a \\u0627\\u0644\\u0630\\u064a \\u0646\\u0639\\u064a\\u0634\\u0647 \\u0627\\u0644\\u064a\\u0648\\u0645\\u060c \\u0623\\u0635\\u0628\\u062d\\u062a \\u0627\\u0644\\u0645\\u062f\\u0641\\u0648\\u0639\\u0627\\u062a \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a \\u062c\\u0632\\u0621\\u064b\\u0627 \\u0644\\u0627 \\u064a\\u062a\\u062c\\u0632\\u0623 \\u0645\\u0646 \\u062d\\u064a\\u0627\\u062a\\u0646\\u0627. \\u0648\\u0644\\u0643\\u0646 \\u0645\\u0639 \\u0627\\u0644\\u0631\\u0627\\u062d\\u0629 \\u062a\\u0623\\u062a\\u064a \\u0627\\u0644\\u062d\\u0627\\u062c\\u0629 \\u0625\\u0644\\u0649 \\u0627\\u0644\\u0623\\u0645\\u0646. \\u062a\\u0633\\u062a\\u0643\\u0634\\u0641 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0645\\u062f\\u0648\\u0646\\u0629 \\u0638\\u0627\\u0647\\u0631\\u0629 \\u0628\\u0637\\u0627\\u0642\\u0627\\u062a \\u0627\\u0644\\u0627\\u0626\\u062a\\u0645\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u064a\\u0629 \\u0648\\u0634\\u0639\\u0628\\u064a\\u062a\\u0647\\u0627 \\u0627\\u0644\\u0645\\u062a\\u0632\\u0627\\u064a\\u062f\\u0629 \\u0648\\u0643\\u064a\\u0641 \\u062a\\u064f\\u062d\\u062f\\u062b \\u062b\\u0648\\u0631\\u0629 \\u0641\\u064a \\u0645\\u062c\\u0627\\u0644 \\u0627\\u0644\\u062f\\u0641\\u0639 \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a. \\u0646\\u062d\\u0646 \\u0646\\u062a\\u0639\\u0645\\u0642 \\u0641\\u064a \\u0641\\u0648\\u0627\\u0626\\u062f \\u0628\\u0637\\u0627\\u0642\\u0627\\u062a \\u0627\\u0644\\u0627\\u0626\\u062a\\u0645\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u064a\\u0629\\u060c \\u0648\\u0645\\u064a\\u0632\\u0627\\u062a\\u0647\\u0627 \\u0627\\u0644\\u0641\\u0631\\u064a\\u062f\\u0629\\u060c \\u0648\\u0644\\u0645\\u0627\\u0630\\u0627 \\u062a\\u0639\\u062a\\u0628\\u0631 \\u0645\\u0633\\u062a\\u0642\\u0628\\u0644 \\u0627\\u0644\\u0645\\u0639\\u0627\\u0645\\u0644\\u0627\\u062a \\u0627\\u0644\\u0622\\u0645\\u0646\\u0629 \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a.<\\/p>\"}}}', 1, '2023-11-06 04:49:19', '2023-11-06 04:49:19'),
(3, 1, 2, '{\"language\":{\"en\":{\"name\":\"Entrepreneurial Success with Virtual Credit Card Services\"},\"es\":{\"name\":\"\\u00c9xito empresarial con servicios de tarjetas de cr\\u00e9dito virtuales\"},\"ar\":{\"name\":\"\\u0646\\u062c\\u0627\\u062d \\u0631\\u064a\\u0627\\u062f\\u0629 \\u0627\\u0644\\u0623\\u0639\\u0645\\u0627\\u0644 \\u0645\\u0639 \\u062e\\u062f\\u0645\\u0627\\u062a \\u0628\\u0637\\u0627\\u0642\\u0627\\u062a \\u0627\\u0644\\u0627\\u0626\\u062a\\u0645\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u064a\\u0629\"}}}', 'entrepreneurial-success-with-virtual-credit-card-services', '5738b6fd-6f84-4fb9-b43f-4a60b2406301.webp', '[\"StripCard\",\"Online Payment\",\"Virtual Card\"]', '{\"language\":{\"en\":{\"details\":\"<p>Are you an entrepreneur looking to diversify your business and boost revenue? In this blog, we explore how offering virtual credit card services to your clients can be a game-changer. We discuss the opportunities, benefits, and strategies for entrepreneurs to leverage the virtual credit card trend and create a win-win scenario for their clients and their business.<\\/p>\"},\"es\":{\"details\":\"<p>\\u00bfEs usted un emprendedor que busca diversificar su negocio y aumentar los ingresos? En este blog, exploramos c\\u00f3mo ofrecer servicios de tarjetas de cr\\u00e9dito virtuales a sus clientes puede cambiar las reglas del juego. Discutimos las oportunidades, beneficios y estrategias para que los emprendedores aprovechen la tendencia de las tarjetas de cr\\u00e9dito virtuales y creen un escenario en el que todos ganan para sus clientes y sus negocios.<\\/p>\"},\"ar\":{\"details\":\"<p>\\u0647\\u0644 \\u0623\\u0646\\u062a \\u0631\\u0627\\u0626\\u062f \\u0623\\u0639\\u0645\\u0627\\u0644 \\u0648\\u062a\\u062a\\u0637\\u0644\\u0639 \\u0625\\u0644\\u0649 \\u062a\\u0646\\u0648\\u064a\\u0639 \\u0623\\u0639\\u0645\\u0627\\u0644\\u0643 \\u0648\\u0632\\u064a\\u0627\\u062f\\u0629 \\u0627\\u0644\\u0625\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a\\u061f \\u0641\\u064a \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0645\\u062f\\u0648\\u0646\\u0629\\u060c \\u0646\\u0633\\u062a\\u0643\\u0634\\u0641 \\u0643\\u064a\\u0641 \\u064a\\u0645\\u0643\\u0646 \\u0623\\u0646 \\u064a\\u0624\\u062f\\u064a \\u062a\\u0642\\u062f\\u064a\\u0645 \\u062e\\u062f\\u0645\\u0627\\u062a \\u0628\\u0637\\u0627\\u0642\\u0627\\u062a \\u0627\\u0644\\u0627\\u0626\\u062a\\u0645\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u064a\\u0629 \\u0644\\u0639\\u0645\\u0644\\u0627\\u0626\\u0643 \\u0625\\u0644\\u0649 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u0642\\u0648\\u0627\\u0639\\u062f \\u0627\\u0644\\u0644\\u0639\\u0628\\u0629. \\u0646\\u0646\\u0627\\u0642\\u0634 \\u0627\\u0644\\u0641\\u0631\\u0635 \\u0648\\u0627\\u0644\\u0641\\u0648\\u0627\\u0626\\u062f \\u0648\\u0627\\u0644\\u0627\\u0633\\u062a\\u0631\\u0627\\u062a\\u064a\\u062c\\u064a\\u0627\\u062a \\u0644\\u0631\\u0648\\u0627\\u062f \\u0627\\u0644\\u0623\\u0639\\u0645\\u0627\\u0644 \\u0644\\u0644\\u0627\\u0633\\u062a\\u0641\\u0627\\u062f\\u0629 \\u0645\\u0646 \\u0627\\u062a\\u062c\\u0627\\u0647 \\u0628\\u0637\\u0627\\u0642\\u0627\\u062a \\u0627\\u0644\\u0627\\u0626\\u062a\\u0645\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u064a\\u0629 \\u0648\\u0625\\u0646\\u0634\\u0627\\u0621 \\u0633\\u064a\\u0646\\u0627\\u0631\\u064a\\u0648 \\u0645\\u0631\\u0628\\u062d \\u0644\\u0644\\u062c\\u0627\\u0646\\u0628\\u064a\\u0646 \\u0644\\u0639\\u0645\\u0644\\u0627\\u0626\\u0647\\u0645 \\u0648\\u0623\\u0639\\u0645\\u0627\\u0644\\u0647\\u0645.<\\/p>\"}}}', 1, '2023-11-06 04:47:56', '2023-11-06 04:47:56');

-- --------------------------------------------------------

--
-- 表的结构 `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `admin_id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Finance', 'finance', 1, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(2, 1, 'Insurance', 'insurance', 1, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(3, 1, 'Help', 'help', 1, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(4, 1, 'Taxes', 'taxes', 1, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(5, 1, 'Credit Card', 'credit-card', 1, '2024-08-21 08:41:28', '2024-08-21 08:41:28');

-- --------------------------------------------------------

--
-- 表的结构 `category_types`
--

CREATE TABLE `category_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1=faq,2=event',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `coinbase_webhook_calls`
--

CREATE TABLE `coinbase_webhook_calls` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `payload` text DEFAULT NULL,
  `exception` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `mobile` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `crypto_assets`
--

CREATE TABLE `crypto_assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_gateway_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(250) NOT NULL,
  `chain` varchar(250) NOT NULL,
  `coin` varchar(250) NOT NULL,
  `credentials` text DEFAULT NULL,
  `assets` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `crypto_transactions`
--

CREATE TABLE `crypto_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `internal_trx_type` varchar(150) DEFAULT NULL COMMENT 'Internal Transaction Type. EX: Add Money, Money Out',
  `internal_trx_ref_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Internal Transaction Reference ID. EX: Transaction Table ID',
  `transaction_type` varchar(250) DEFAULT NULL,
  `sender_address` varchar(250) DEFAULT NULL,
  `receiver_address` varchar(250) DEFAULT NULL,
  `amount` varchar(250) DEFAULT NULL COMMENT 'Can be positive and negative',
  `asset` varchar(250) DEFAULT NULL,
  `block_number` varchar(250) DEFAULT NULL,
  `txn_hash` varchar(250) DEFAULT NULL COMMENT 'Transaction ID/Transaction Hash',
  `chain` varchar(250) DEFAULT NULL,
  `callback_response` text DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'NOT-USED',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(20) NOT NULL,
  `symbol` varchar(20) NOT NULL,
  `type` enum('CRYPTO','FIAT') NOT NULL DEFAULT 'FIAT',
  `flag` varchar(255) DEFAULT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT 1.00000000,
  `sender` tinyint(1) NOT NULL DEFAULT 0,
  `receiver` tinyint(1) NOT NULL DEFAULT 0,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `currencies`
--

INSERT INTO `currencies` (`id`, `admin_id`, `country`, `name`, `code`, `symbol`, `type`, `flag`, `rate`, `sender`, `receiver`, `default`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'United States', 'United States dollar', 'USD', '$', 'FIAT', '5d371250-25f9-449e-b17d-a46b71472681.webp', 1.00000000, 1, 1, 1, 1, '2024-08-21 08:41:28', '2024-08-21 08:41:28');

-- --------------------------------------------------------

--
-- 表的结构 `exchange_rates`
--

CREATE TABLE `exchange_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `mobile_code` varchar(191) NOT NULL,
  `currency_name` varchar(191) NOT NULL,
  `currency_code` varchar(191) NOT NULL,
  `currency_symbol` varchar(191) NOT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1:Active,2:Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `exchange_rates`
--

INSERT INTO `exchange_rates` (`id`, `name`, `mobile_code`, `currency_name`, `currency_code`, `currency_symbol`, `rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', '93', 'Afghan afghani', 'AFN', '؋', 73.90411100, 1, NULL, '2023-10-27 02:27:05'),
(2, 'Aland Islands', '+358-18', 'Euro', 'EUR', '€', 0.95000000, 1, NULL, '2023-10-27 02:27:05'),
(3, 'Albania', '355', 'Albanian lek', 'ALL', 'Lek', 100.16000000, 1, NULL, '2023-10-27 02:27:05'),
(4, 'Algeria', '213', 'Algerian dinar', 'DZD', 'دج', 136.86000000, 1, NULL, '2023-10-27 02:27:05'),
(5, 'United States', '1', 'United States dollar', 'USD', '$', 1.00000000, 1, NULL, NULL),
(6, 'American Samoa', '+1-684', 'US Dollar', 'USD', '$', 2.80000000, 1, NULL, '2023-10-27 02:27:05'),
(7, 'Andorra', '376', 'Euro', 'EUR', '€', 0.95000000, 1, NULL, '2023-10-27 02:27:05'),
(8, 'Angola', '244', 'Angolan kwanza', 'AOA', 'Kz', 828.50000000, 1, NULL, '2023-10-27 02:27:05'),
(9, 'Anguilla', '+1-264', 'East Caribbean dollar', 'XCD', '$', 2.70000000, 1, NULL, '2023-10-27 02:27:05'),
(10, 'Antarctica', '672', 'Antarctican dollar', 'AAD', '$', 3.67250000, 1, NULL, '2023-10-27 02:27:05'),
(11, 'Antigua And Barbuda', '+1-268', 'Eastern Caribbean dollar', 'XCD', '$', 2.70000000, 1, NULL, '2023-10-27 02:27:05'),
(12, 'Argentina', '54', 'Argentine peso', 'ARS', '$', 349.82000000, 1, NULL, '2023-10-27 02:27:05'),
(13, 'Armenia', '374', 'Armenian dram', 'AMD', '֏', 399.71000000, 1, NULL, '2023-10-27 02:27:05'),
(14, 'Aruba', '297', 'Aruban florin', 'AWG', 'ƒ', 1.80000000, 1, NULL, '2023-10-27 02:27:05'),
(15, 'Australia', '61', 'Australian dollar', 'AUD', '$', 1.58000000, 1, NULL, '2023-10-27 02:27:05'),
(16, 'Austria', '43', 'Euro', 'EUR', '€', 0.95000000, 1, NULL, '2023-10-27 02:27:05'),
(17, 'Azerbaijan', '994', 'Azerbaijani manat', 'AZN', 'm', 1.70000000, 1, NULL, '2023-10-27 02:27:05'),
(18, 'Bahrain', '973', 'Bahraini dinar', 'BHD', '.د.ب', 0.38000000, 1, NULL, '2023-10-27 02:27:05'),
(19, 'Bangladesh', '880', 'Bangladeshi taka', 'BDT', '৳', 110.04000000, 1, NULL, '2023-10-27 02:27:05'),
(20, 'Barbados', '+1-246', 'Barbadian dollar', 'BBD', 'Bds$', 2.02000000, 1, NULL, '2023-10-27 02:27:05'),
(21, 'Belarus', '375', 'Belarusian ruble', 'BYN', 'Br', 3.29000000, 1, NULL, '2023-10-27 02:27:05'),
(22, 'Belgium', '32', 'Euro', 'EUR', '€', 0.95000000, 1, NULL, '2023-10-27 02:30:46'),
(23, 'Belize', '501', 'Belize dollar', 'BZD', '$', 2.01000000, 1, NULL, '2023-10-27 02:30:46'),
(24, 'Benin', '229', 'West African CFA franc', 'XOF', 'CFA', 621.30000000, 1, NULL, '2023-10-27 02:30:46'),
(25, 'Bermuda', '+1-441', 'Bermudian dollar', 'BMD', '$', 1.00000000, 1, NULL, NULL),
(26, 'Bhutan', '975', 'Bhutanese ngultrum', 'BTN', 'Nu.', 83.06000000, 1, NULL, '2023-10-27 02:30:46'),
(27, 'Bolivia', '591', 'Bolivian boliviano', 'BOB', 'Bs.', 6.90000000, 1, NULL, '2023-10-27 02:30:46'),
(28, 'Bonaire, Sint Eustatius and Saba', '599', 'United States dollar', 'USD', '$', 1.00000000, 1, NULL, NULL),
(29, 'Bosnia and Herzegovina', '387', 'Bosnia and Herzegovina convertible mark', 'BAM', 'KM', 1.85000000, 1, NULL, '2023-10-27 02:30:46'),
(30, 'Botswana', '267', 'Botswana pula', 'BWP', 'P', 1.00000000, 1, NULL, NULL),
(31, 'Bouvet Island', '0055', 'Norwegian Krone', 'NOK', 'kr', 1.00000000, 1, NULL, NULL),
(32, 'Brazil', '55', 'Brazilian real', 'BRL', 'R$', 1.00000000, 1, NULL, NULL),
(33, 'British Indian Ocean Territory', '246', 'United States dollar', 'USD', '$', 1.00000000, 1, NULL, NULL),
(34, 'Brunei', '673', 'Brunei dollar', 'BND', 'B$', 1.00000000, 1, NULL, NULL),
(35, 'Bulgaria', '359', 'Bulgarian lev', 'BGN', 'Лв.', 1.00000000, 1, NULL, NULL),
(36, 'Burkina Faso', '226', 'West African CFA franc', 'XOF', 'CFA', 1.00000000, 1, NULL, NULL),
(37, 'Burundi', '257', 'Burundian franc', 'BIF', 'FBu', 1.00000000, 1, NULL, NULL),
(38, 'Cambodia', '855', 'Cambodian riel', 'KHR', 'KHR', 1.00000000, 1, NULL, NULL),
(39, 'Cameroon', '237', 'Central African CFA franc', 'XAF', 'FCFA', 1.00000000, 1, NULL, NULL),
(40, 'Canada', '1', 'Canadian dollar', 'CAD', '$', 1.38000000, 1, NULL, '2023-10-27 02:32:13'),
(41, 'Cape Verde', '238', 'Cape Verdean escudo', 'CVE', '$', 1.00000000, 1, NULL, NULL),
(42, 'Cayman Islands', '+1-345', 'Cayman Islands dollar', 'KYD', '$', 1.00000000, 1, NULL, NULL),
(43, 'Central African Republic', '236', 'Central African CFA franc', 'XAF', 'FCFA', 1.00000000, 1, NULL, NULL),
(44, 'Chad', '235', 'Central African CFA franc', 'XAF', 'FCFA', 1.00000000, 1, NULL, NULL),
(45, 'Chile', '56', 'Chilean peso', 'CLP', '$', 1.00000000, 1, NULL, NULL),
(46, 'China', '86', 'Chinese yuan', 'CNY', '¥', 1.00000000, 1, NULL, NULL),
(47, 'Christmas Island', '61', 'Australian dollar', 'AUD', '$', 1.00000000, 1, NULL, NULL),
(48, 'Cocos (Keeling) Islands', '61', 'Australian dollar', 'AUD', '$', 1.00000000, 1, NULL, NULL),
(49, 'Colombia', '57', 'Colombian peso', 'COP', '$', 1.00000000, 1, NULL, NULL),
(50, 'Comoros', '269', 'Comorian franc', 'KMF', 'CF', 1.00000000, 1, NULL, NULL),
(51, 'Congo', '242', 'Central African CFA franc', 'XAF', 'FC', 1.00000000, 1, NULL, NULL),
(52, 'Cook Islands', '682', 'Cook Islands dollar', 'NZD', '$', 1.00000000, 1, NULL, NULL),
(53, 'Costa Rica', '506', 'Costa Rican colón', 'CRC', '₡', 1.00000000, 1, NULL, NULL),
(54, 'Cote D\'Ivoire (Ivory Coast)', '225', 'West African CFA franc', 'XOF', 'CFA', 1.00000000, 1, NULL, NULL),
(55, 'Croatia', '385', 'Croatian kuna', 'HRK', 'kn', 1.00000000, 1, NULL, NULL),
(56, 'Cuba', '53', 'Cuban peso', 'CUP', '$', 1.00000000, 1, NULL, NULL),
(57, 'Curaçao', '599', 'Netherlands Antillean guilder', 'ANG', 'ƒ', 1.00000000, 1, NULL, NULL),
(58, 'Cyprus', '357', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(59, 'Czech Republic', '420', 'Czech koruna', 'CZK', 'Kč', 1.00000000, 1, NULL, NULL),
(60, 'Democratic Republic of the Congo', '243', 'Congolese Franc', 'CDF', 'FC', 1.00000000, 1, NULL, NULL),
(61, 'Denmark', '45', 'Danish krone', 'DKK', 'Kr.', 1.00000000, 1, NULL, NULL),
(62, 'Djibouti', '253', 'Djiboutian franc', 'DJF', 'Fdj', 1.00000000, 1, NULL, NULL),
(63, 'Dominica', '+1-767', 'Eastern Caribbean dollar', 'XCD', '$', 1.00000000, 1, NULL, NULL),
(64, 'Dominican Republic', '+1-809 and 1-829', 'Dominican peso', 'DOP', '$', 1.00000000, 1, NULL, NULL),
(65, 'East Timor', '670', 'United States dollar', 'USD', '$', 1.00000000, 1, NULL, NULL),
(66, 'Ecuador', '593', 'United States dollar', 'USD', '$', 1.00000000, 1, NULL, NULL),
(67, 'Egypt', '20', 'Egyptian pound', 'EGP', 'ج.م', 1.00000000, 1, NULL, NULL),
(68, 'El Salvador', '503', 'United States dollar', 'USD', '$', 1.00000000, 1, NULL, NULL),
(69, 'Equatorial Guinea', '240', 'Central African CFA franc', 'XAF', 'FCFA', 1.00000000, 1, NULL, NULL),
(70, 'Eritrea', '291', 'Eritrean nakfa', 'ERN', 'Nfk', 1.00000000, 1, NULL, NULL),
(71, 'Estonia', '372', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(72, 'Ethiopia', '251', 'Ethiopian birr', 'ETB', 'Nkf', 1.00000000, 1, NULL, NULL),
(73, 'Falkland Islands', '500', 'Falkland Islands pound', 'FKP', '£', 1.00000000, 1, NULL, NULL),
(74, 'Faroe Islands', '298', 'Danish krone', 'DKK', 'Kr.', 1.00000000, 1, NULL, NULL),
(75, 'Fiji Islands', '679', 'Fijian dollar', 'FJD', 'FJ$', 1.00000000, 1, NULL, NULL),
(76, 'Finland', '358', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(77, 'France', '33', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(78, 'French Guiana', '594', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(79, 'French Polynesia', '689', 'CFP franc', 'XPF', '₣', 1.00000000, 1, NULL, NULL),
(80, 'French Southern Territories', '262', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(81, 'Gabon', '241', 'Central African CFA franc', 'XAF', 'FCFA', 1.00000000, 1, NULL, NULL),
(82, 'Gambia The', '220', 'Gambian dalasi', 'GMD', 'D', 1.00000000, 1, NULL, NULL),
(83, 'Georgia', '995', 'Georgian lari', 'GEL', 'ლ', 1.00000000, 1, NULL, NULL),
(84, 'Germany', '49', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(85, 'Ghana', '233', 'Ghanaian cedi', 'GHS', 'GH₵', 1.00000000, 1, NULL, NULL),
(86, 'Gibraltar', '350', 'Gibraltar pound', 'GIP', '£', 1.00000000, 1, NULL, NULL),
(87, 'Greece', '30', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(88, 'Greenland', '299', 'Danish krone', 'DKK', 'Kr.', 1.00000000, 1, NULL, NULL),
(89, 'Grenada', '+1-473', 'Eastern Caribbean dollar', 'XCD', '$', 1.00000000, 1, NULL, NULL),
(90, 'Guadeloupe', '590', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(91, 'Guam', '+1-671', 'US Dollar', 'USD', '$', 1.00000000, 1, NULL, NULL),
(92, 'Guatemala', '502', 'Guatemalan quetzal', 'GTQ', 'Q', 1.00000000, 1, NULL, NULL),
(93, 'Guernsey and Alderney', '+44-1481', 'British pound', 'GBP', '£', 1.00000000, 1, NULL, NULL),
(94, 'Guinea', '224', 'Guinean franc', 'GNF', 'FG', 1.00000000, 1, NULL, NULL),
(95, 'Guinea-Bissau', '245', 'West African CFA franc', 'XOF', 'CFA', 1.00000000, 1, NULL, NULL),
(96, 'Guyana', '592', 'Guyanese dollar', 'GYD', '$', 1.00000000, 1, NULL, NULL),
(97, 'Haiti', '509', 'Haitian gourde', 'HTG', 'G', 1.00000000, 1, NULL, NULL),
(98, 'Heard Island and McDonald Islands', '672', 'Australian dollar', 'AUD', '$', 1.00000000, 1, NULL, NULL),
(99, 'Honduras', '504', 'Honduran lempira', 'HNL', 'L', 1.00000000, 1, NULL, NULL),
(100, 'Hong Kong S.A.R.', '852', 'Hong Kong dollar', 'HKD', '$', 1.00000000, 1, NULL, NULL),
(101, 'Hungary', '36', 'Hungarian forint', 'HUF', 'Ft', 1.00000000, 1, NULL, NULL),
(102, 'Iceland', '354', 'Icelandic króna', 'ISK', 'kr', 1.00000000, 1, NULL, NULL),
(103, 'India', '91', 'Indian rupee', 'INR', '₹', 83.24000000, 1, NULL, '2023-10-27 02:31:16'),
(104, 'Indonesia', '62', 'Indonesian rupiah', 'IDR', 'Rp', 1.00000000, 1, NULL, NULL),
(105, 'Iran', '98', 'Iranian rial', 'IRR', '﷼', 1.00000000, 1, NULL, NULL),
(106, 'Iraq', '964', 'Iraqi dinar', 'IQD', 'د.ع', 1.00000000, 1, NULL, NULL),
(107, 'Ireland', '353', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(108, 'Israel', '972', 'Israeli new shekel', 'ILS', '₪', 1.00000000, 1, NULL, NULL),
(109, 'Italy', '39', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(110, 'Jamaica', '+1-876', 'Jamaican dollar', 'JMD', 'J$', 1.00000000, 1, NULL, NULL),
(111, 'Japan', '81', 'Japanese yen', 'JPY', '¥', 1.00000000, 1, NULL, NULL),
(112, 'Jersey', '+44-1534', 'British pound', 'GBP', '£', 1.00000000, 1, NULL, NULL),
(113, 'Jordan', '962', 'Jordanian dinar', 'JOD', 'ا.د', 1.00000000, 1, NULL, NULL),
(114, 'Kazakhstan', '7', 'Kazakhstani tenge', 'KZT', 'лв', 1.00000000, 1, NULL, NULL),
(115, 'Kenya', '254', 'Kenyan shilling', 'KES', 'KSh', 1.00000000, 1, NULL, NULL),
(116, 'Kiribati', '686', 'Australian dollar', 'AUD', '$', 1.00000000, 1, NULL, NULL),
(117, 'Kosovo', '383', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(118, 'Kuwait', '965', 'Kuwaiti dinar', 'KWD', 'ك.د', 1.00000000, 1, NULL, NULL),
(119, 'Kyrgyzstan', '996', 'Kyrgyzstani som', 'KGS', 'лв', 1.00000000, 1, NULL, NULL),
(120, 'Laos', '856', 'Lao kip', 'LAK', '₭', 1.00000000, 1, NULL, NULL),
(121, 'Latvia', '371', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(122, 'Lebanon', '961', 'Lebanese pound', 'LBP', '£', 1.00000000, 1, NULL, NULL),
(123, 'Lesotho', '266', 'Lesotho loti', 'LSL', 'L', 1.00000000, 1, NULL, NULL),
(124, 'Liberia', '231', 'Liberian dollar', 'LRD', '$', 1.00000000, 1, NULL, NULL),
(125, 'Libya', '218', 'Libyan dinar', 'LYD', 'د.ل', 1.00000000, 1, NULL, NULL),
(126, 'Liechtenstein', '423', 'Swiss franc', 'CHF', 'CHf', 1.00000000, 1, NULL, NULL),
(127, 'Lithuania', '370', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(128, 'Luxembourg', '352', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(129, 'Macau S.A.R.', '853', 'Macanese pataca', 'MOP', '$', 1.00000000, 1, NULL, NULL),
(130, 'Macedonia', '389', 'Denar', 'MKD', 'ден', 1.00000000, 1, NULL, NULL),
(131, 'Madagascar', '261', 'Malagasy ariary', 'MGA', 'Ar', 1.00000000, 1, NULL, NULL),
(132, 'Malawi', '265', 'Malawian kwacha', 'MWK', 'MK', 1.00000000, 1, NULL, NULL),
(133, 'Malaysia', '60', 'Malaysian ringgit', 'MYR', 'RM', 1.00000000, 1, NULL, NULL),
(134, 'Maldives', '960', 'Maldivian rufiyaa', 'MVR', 'Rf', 1.00000000, 1, NULL, NULL),
(135, 'Mali', '223', 'West African CFA franc', 'XOF', 'CFA', 1.00000000, 1, NULL, NULL),
(136, 'Malta', '356', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(137, 'Man (Isle of)', '+44-1624', 'British pound', 'GBP', '£', 1.00000000, 1, NULL, NULL),
(138, 'Marshall Islands', '692', 'United States dollar', 'USD', '$', 1.00000000, 1, NULL, NULL),
(139, 'Martinique', '596', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(140, 'Mauritania', '222', 'Mauritanian ouguiya', 'MRO', 'MRU', 1.00000000, 1, NULL, NULL),
(141, 'Mauritius', '230', 'Mauritian rupee', 'MUR', '₨', 1.00000000, 1, NULL, NULL),
(142, 'Mayotte', '262', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(143, 'Mexico', '52', 'Mexican peso', 'MXN', '$', 1.00000000, 1, NULL, NULL),
(144, 'Micronesia', '691', 'United States dollar', 'USD', '$', 1.00000000, 1, NULL, NULL),
(145, 'Moldova', '373', 'Moldovan leu', 'MDL', 'L', 1.00000000, 1, NULL, NULL),
(146, 'Monaco', '377', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(147, 'Mongolia', '976', 'Mongolian tögrög', 'MNT', '₮', 1.00000000, 1, NULL, NULL),
(148, 'Montenegro', '382', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(149, 'Montserrat', '+1-664', 'Eastern Caribbean dollar', 'XCD', '$', 1.00000000, 1, NULL, NULL),
(150, 'Morocco', '212', 'Moroccan dirham', 'MAD', 'DH', 1.00000000, 1, NULL, NULL),
(151, 'Mozambique', '258', 'Mozambican metical', 'MZN', 'MT', 1.00000000, 1, NULL, NULL),
(152, 'Myanmar', '95', 'Burmese kyat', 'MMK', 'K', 1.00000000, 1, NULL, NULL),
(153, 'Namibia', '264', 'Namibian dollar', 'NAD', '$', 1.00000000, 1, NULL, NULL),
(154, 'Nauru', '674', 'Australian dollar', 'AUD', '$', 1.00000000, 1, NULL, NULL),
(155, 'Nepal', '977', 'Nepalese rupee', 'NPR', '₨', 132.91000000, 1, NULL, '2023-10-27 02:34:33'),
(156, 'Netherlands', '31', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(157, 'New Caledonia', '687', 'CFP franc', 'XPF', '₣', 1.00000000, 1, NULL, NULL),
(158, 'New Zealand', '64', 'New Zealand dollar', 'NZD', '$', 1.00000000, 1, NULL, NULL),
(159, 'Nicaragua', '505', 'Nicaraguan córdoba', 'NIO', 'C$', 1.00000000, 1, NULL, NULL),
(160, 'Niger', '227', 'West African CFA franc', 'XOF', 'CFA', 1.00000000, 1, NULL, NULL),
(161, 'Nigeria', '234', 'Nigerian naira', 'NGN', '₦', 802.70000000, 1, NULL, '2023-10-27 02:33:47'),
(162, 'Niue', '683', 'New Zealand dollar', 'NZD', '$', 1.00000000, 1, NULL, NULL),
(163, 'Norfolk Island', '672', 'Australian dollar', 'AUD', '$', 1.00000000, 1, NULL, NULL),
(164, 'North Korea', '850', 'North Korean Won', 'KPW', '₩', 1.00000000, 1, NULL, NULL),
(165, 'Northern Mariana Islands', '+1-670', 'United States dollar', 'USD', '$', 1.00000000, 1, NULL, NULL),
(166, 'Norway', '47', 'Norwegian krone', 'NOK', 'kr', 1.00000000, 1, NULL, NULL),
(167, 'Oman', '968', 'Omani rial', 'OMR', '.ع.ر', 1.00000000, 1, NULL, NULL),
(168, 'Pakistan', '92', 'Pakistani rupee', 'PKR', '₨', 279.59000000, 1, NULL, '2023-10-27 02:34:08'),
(169, 'Palau', '680', 'United States dollar', 'USD', '$', 1.00000000, 1, NULL, NULL),
(170, 'Palestinian Territory Occupied', '970', 'Israeli new shekel', 'ILS', '₪', 1.00000000, 1, NULL, NULL),
(171, 'Panama', '507', 'Panamanian balboa', 'PAB', 'B/.', 1.00000000, 1, NULL, NULL),
(172, 'Papua new Guinea', '675', 'Papua New Guinean kina', 'PGK', 'K', 1.00000000, 1, NULL, NULL),
(173, 'Paraguay', '595', 'Paraguayan guarani', 'PYG', '₲', 1.00000000, 1, NULL, NULL),
(174, 'Peru', '51', 'Peruvian sol', 'PEN', 'S/.', 1.00000000, 1, NULL, NULL),
(175, 'Philippines', '63', 'Philippine peso', 'PHP', '₱', 1.00000000, 1, NULL, NULL),
(176, 'Pitcairn Island', '870', 'New Zealand dollar', 'NZD', '$', 1.00000000, 1, NULL, NULL),
(177, 'Poland', '48', 'Polish złoty', 'PLN', 'zł', 1.00000000, 1, NULL, NULL),
(178, 'Portugal', '351', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(179, 'Puerto Rico', '+1-787 and 1-939', 'United States dollar', 'USD', '$', 1.00000000, 1, NULL, NULL),
(180, 'Qatar', '974', 'Qatari riyal', 'QAR', 'ق.ر', 1.00000000, 1, NULL, NULL),
(181, 'Reunion', '262', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(182, 'Romania', '40', 'Romanian leu', 'RON', 'lei', 1.00000000, 1, NULL, NULL),
(183, 'Russia', '7', 'Russian ruble', 'RUB', '₽', 1.00000000, 1, NULL, NULL),
(184, 'Rwanda', '250', 'Rwandan franc', 'RWF', 'FRw', 1.00000000, 1, NULL, NULL),
(185, 'Saint Helena', '290', 'Saint Helena pound', 'SHP', '£', 1.00000000, 1, NULL, NULL),
(186, 'Saint Kitts And Nevis', '+1-869', 'Eastern Caribbean dollar', 'XCD', '$', 1.00000000, 1, NULL, NULL),
(187, 'Saint Lucia', '+1-758', 'Eastern Caribbean dollar', 'XCD', '$', 1.00000000, 1, NULL, NULL),
(188, 'Saint Pierre and Miquelon', '508', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(189, 'Saint Vincent And The Grenadines', '+1-784', 'Eastern Caribbean dollar', 'XCD', '$', 1.00000000, 1, NULL, NULL),
(190, 'Saint-Barthelemy', '590', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(191, 'Saint-Martin (French part)', '590', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(192, 'Samoa', '685', 'Samoan tālā', 'WST', 'SAT', 1.00000000, 1, NULL, NULL),
(193, 'San Marino', '378', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(194, 'Sao Tome and Principe', '239', 'Dobra', 'STD', 'Db', 1.00000000, 1, NULL, NULL),
(195, 'Saudi Arabia', '966', 'Saudi riyal', 'SAR', '﷼', 1.00000000, 1, NULL, NULL),
(196, 'Senegal', '221', 'West African CFA franc', 'XOF', 'CFA', 1.00000000, 1, NULL, NULL),
(197, 'Serbia', '381', 'Serbian dinar', 'RSD', 'din', 1.00000000, 1, NULL, NULL),
(198, 'Seychelles', '248', 'Seychellois rupee', 'SCR', 'SRe', 1.00000000, 1, NULL, NULL),
(199, 'Sierra Leone', '232', 'Sierra Leonean leone', 'SLL', 'Le', 1.00000000, 1, NULL, NULL),
(200, 'Singapore', '65', 'Singapore dollar', 'SGD', '$', 1.00000000, 1, NULL, NULL),
(201, 'Sint Maarten (Dutch part)', '1721', 'Netherlands Antillean guilder', 'ANG', 'ƒ', 1.00000000, 1, NULL, NULL),
(202, 'Slovakia', '421', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(203, 'Slovenia', '386', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(204, 'Solomon Islands', '677', 'Solomon Islands dollar', 'SBD', 'Si$', 1.00000000, 1, NULL, NULL),
(205, 'Somalia', '252', 'Somali shilling', 'SOS', 'Sh.so.', 1.00000000, 1, NULL, NULL),
(206, 'South Africa', '27', 'South African rand', 'ZAR', 'R', 1.00000000, 1, NULL, NULL),
(207, 'South Georgia', '500', 'British pound', 'GBP', '£', 1.00000000, 1, NULL, NULL),
(208, 'South Korea', '82', 'Won', 'KRW', '₩', 1.00000000, 1, NULL, NULL),
(209, 'South Sudan', '211', 'South Sudanese pound', 'SSP', '£', 1.00000000, 1, NULL, NULL),
(210, 'Spain', '34', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(211, 'Sri Lanka', '94', 'Sri Lankan rupee', 'LKR', 'Rs', 1.00000000, 1, NULL, NULL),
(212, 'Sudan', '249', 'Sudanese pound', 'SDG', '.س.ج', 1.00000000, 1, NULL, NULL),
(213, 'Suriname', '597', 'Surinamese dollar', 'SRD', '$', 1.00000000, 1, NULL, NULL),
(214, 'Svalbard And Jan Mayen Islands', '47', 'Norwegian Krone', 'NOK', 'kr', 1.00000000, 1, NULL, NULL),
(215, 'Swaziland', '268', 'Lilangeni', 'SZL', 'E', 1.00000000, 1, NULL, NULL),
(216, 'Sweden', '46', 'Swedish krona', 'SEK', 'kr', 1.00000000, 1, NULL, NULL),
(217, 'Switzerland', '41', 'Swiss franc', 'CHF', 'CHf', 1.00000000, 1, NULL, NULL),
(218, 'Syria', '963', 'Syrian pound', 'SYP', 'LS', 1.00000000, 1, NULL, NULL),
(219, 'Taiwan', '886', 'New Taiwan dollar', 'TWD', '$', 1.00000000, 1, NULL, NULL),
(220, 'Tajikistan', '992', 'Tajikistani somoni', 'TJS', 'SM', 1.00000000, 1, NULL, NULL),
(221, 'Tanzania', '255', 'Tanzanian shilling', 'TZS', 'TSh', 2501.00000000, 1, NULL, '2023-10-27 02:35:51'),
(222, 'Thailand', '66', 'Thai baht', 'THB', '฿', 1.00000000, 1, NULL, NULL),
(223, 'The Bahamas', '+1-242', 'Bahamian dollar', 'BSD', 'B$', 1.00000000, 1, NULL, NULL),
(224, 'Togo', '228', 'West African CFA franc', 'XOF', 'CFA', 1.00000000, 1, NULL, NULL),
(225, 'Tokelau', '690', 'New Zealand dollar', 'NZD', '$', 1.00000000, 1, NULL, NULL),
(226, 'Tonga', '676', 'Tongan paʻanga', 'TOP', '$', 1.00000000, 1, NULL, NULL),
(227, 'Trinidad And Tobago', '+1-868', 'Trinidad and Tobago dollar', 'TTD', '$', 1.00000000, 1, NULL, NULL),
(228, 'Tunisia', '216', 'Tunisian dinar', 'TND', 'ت.د', 1.00000000, 1, NULL, NULL),
(229, 'Turkey', '90', 'Turkish lira', 'TRY', '₺', 1.00000000, 1, NULL, NULL),
(230, 'Turkmenistan', '993', 'Turkmenistan manat', 'TMT', 'T', 1.00000000, 1, NULL, NULL),
(231, 'Turks And Caicos Islands', '+1-649', 'United States dollar', 'USD', '$', 1.00000000, 1, NULL, NULL),
(232, 'Tuvalu', '688', 'Australian dollar', 'AUD', '$', 1.00000000, 1, NULL, NULL),
(233, 'Uganda', '256', 'Ugandan shilling', 'UGX', 'USh', 1.00000000, 1, NULL, NULL),
(234, 'Ukraine', '380', 'Ukrainian hryvnia', 'UAH', '₴', 1.00000000, 1, NULL, NULL),
(235, 'United Arab Emirates', '971', 'United Arab Emirates dirham', 'AED', 'إ.د', 1.00000000, 1, NULL, NULL),
(236, 'United Kingdom', '44', 'British pound', 'GBP', '£', 0.82000000, 1, NULL, '2023-10-27 02:33:21'),
(237, 'United States Minor Outlying Islands', '1', 'United States dollar', 'USD', '$', 1.00000000, 1, NULL, NULL),
(238, 'Uruguay', '598', 'Uruguayan peso', 'UYU', '$', 1.00000000, 1, NULL, NULL),
(239, 'Uzbekistan', '998', 'Uzbekistani soʻm', 'UZS', 'лв', 1.00000000, 1, NULL, NULL),
(240, 'Vanuatu', '678', 'Vanuatu vatu', 'VUV', 'VT', 1.00000000, 1, NULL, NULL),
(241, 'Vatican City State (Holy See)', '379', 'Euro', 'EUR', '€', 1.00000000, 1, NULL, NULL),
(242, 'Venezuela', '58', 'Bolívar', 'VEF', 'Bs', 1.00000000, 1, NULL, NULL),
(243, 'Vietnam', '84', 'Vietnamese đồng', 'VND', '₫', 1.00000000, 1, NULL, NULL),
(244, 'Virgin Islands (British)', '+1-284', 'United States dollar', 'USD', '$', 1.00000000, 1, NULL, NULL),
(245, 'Virgin Islands (US)', '+1-340', 'United States dollar', 'USD', '$', 1.00000000, 1, NULL, NULL),
(246, 'Wallis And Futuna Islands', '681', 'CFP franc', 'XPF', '₣', 1.00000000, 1, NULL, NULL),
(247, 'Western Sahara', '212', 'Moroccan Dirham', 'MAD', 'MAD', 1.00000000, 1, NULL, NULL),
(248, 'Yemen', '967', 'Yemeni rial', 'YER', '﷼', 1.00000000, 1, NULL, NULL),
(249, 'Zambia', '260', 'Zambian kwacha', 'ZMW', 'ZK', 1.00000000, 1, NULL, NULL),
(250, 'Zimbabwe', '263', 'Zimbabwe Dollar', 'ZWL', '$', 1.00000000, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `script` text DEFAULT NULL,
  `shortcode` text DEFAULT NULL,
  `support_image` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `extensions`
--

INSERT INTO `extensions` (`id`, `name`, `slug`, `description`, `image`, `script`, `shortcode`, `support_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Tawk', 'tawk-to', 'Go to your tawk to dashbaord. Click [setting icon] on top bar. Then click [Chat Widget] link from sidebar and follow the screenshot bellow. Copy property ID and paste it in Property ID field. Then copy widget ID and paste it in Widget ID field. Finally click on [Update] button and you are ready to go.', 'logo-tawk-to.png', NULL, '{\"property_id\":{\"title\":\"Property ID\",\"value\":\"\"},\"widget_id\":{\"title\":\"Widget ID\",\"value\":\"\"}}', 'instruction-tawk-to.png', 1, '2024-08-21 08:41:28', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `faq_sections`
--

CREATE TABLE `faq_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `gift_cards`
--

CREATE TABLE `gift_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(50) NOT NULL COMMENT 'should be USER, AGENT, Merchant',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_wallet_id` bigint(20) UNSIGNED NOT NULL,
  `recipient_currency_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `trx_id` varchar(191) NOT NULL COMMENT 'internal TRX ID',
  `api_trx_id` varchar(250) NOT NULL COMMENT 'TRX ID From API',
  `card_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `card_total_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `card_currency` varchar(250) NOT NULL,
  `card_image` varchar(255) DEFAULT NULL,
  `card_name` varchar(255) DEFAULT NULL,
  `user_wallet_currency` varchar(30) NOT NULL,
  `exchange_rate` decimal(28,8) NOT NULL DEFAULT 1.00000000,
  `default_currency` varchar(30) NOT NULL,
  `percent_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT 'charge percentage in default currency',
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT 'charge fixed in default currency',
  `percent_charge_calc` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge_calc` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `total_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `qty` int(11) NOT NULL,
  `unit_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Unit amount in user wallet currency',
  `conversion_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `total_payable` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `api_currency` varchar(30) NOT NULL COMMENT 'API owner account currency',
  `api_discount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `api_fee` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `api_sms_fee` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `api_total_fee` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `pre_order` tinyint(1) NOT NULL DEFAULT 0,
  `recipient_email` varchar(250) DEFAULT NULL,
  `recipient_country_iso2` varchar(250) DEFAULT NULL,
  `recipient_phone` varchar(250) DEFAULT NULL,
  `codes` text DEFAULT NULL COMMENT 'Redeem Codes',
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `gift_card_apis`
--

CREATE TABLE `gift_card_apis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider` varchar(250) NOT NULL COMMENT 'Provider slug',
  `credentials` text NOT NULL COMMENT 'configuration credentials',
  `status` tinyint(4) NOT NULL COMMENT '1: Active, 2: Deactivate',
  `env` varchar(100) NOT NULL DEFAULT 'sandbox' COMMENT 'environment',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `gift_card_apis`
--

INSERT INTO `gift_card_apis` (`id`, `provider`, `credentials`, `status`, `env`, `created_at`, `updated_at`) VALUES
(1, 'RELOADLY', '{\"client_id\":\"zdEpKtHis9zKyuQI89ctF7tfswm5HEyN\",\"secret_key\":\"weHaLOnFmO-OxuQ8nHGh91ilR8GIuE-Q4BTyFJOK5sH33mwPDw39BtYTwPgAtQv\",\"production_base_url\":\"https:\\/\\/giftcards.reloadly.com\",\"sandbox_base_url\":\"https:\\/\\/giftcards-sandbox.reloadly.com\"}', 1, 'sandbox', '2024-04-06 21:16:17', '2024-04-07 02:15:42');

-- --------------------------------------------------------

--
-- 表的结构 `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `last_edit_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dir` varchar(191) NOT NULL DEFAULT 'ltr'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `status`, `last_edit_by`, `created_at`, `updated_at`, `dir`) VALUES
(1, 'English', 'en', 0, 1, '2024-08-21 08:41:28', '2024-08-24 05:19:19', 'ltr'),
(2, 'Spanish', 'es', 0, 1, '2024-08-21 08:41:28', NULL, 'ltr'),
(3, 'Arabic', 'ar', 0, 1, '2024-08-21 08:41:28', NULL, 'rtl'),
(4, '简体中文', 'CN', 1, 1, '2024-08-21 10:19:45', '2024-08-24 05:19:21', 'ltr');

-- --------------------------------------------------------

--
-- 表的结构 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_12_11_061454_create_admins_table', 1),
(6, '2022_12_13_060252_create_transaction_settings_table', 1),
(7, '2022_12_14_103353_create_currencies_table', 1),
(8, '2022_12_17_104923_create_basic_settings_table', 1),
(9, '2022_12_18_093156_create_setup_seos_table', 1),
(10, '2022_12_19_072039_create_app_settings_table', 1),
(11, '2022_12_24_071800_create_site_sections_table', 1),
(12, '2022_12_24_110923_create_app_onboard_screens_table', 1),
(13, '2022_12_25_082623_create_payment_gateways_table', 1),
(14, '2022_12_26_060705_create_payment_gateway_currencies_table', 1),
(15, '2023_01_03_095454_create_extensions_table', 1),
(16, '2023_01_04_061756_create_setup_kycs_table', 1),
(17, '2023_01_07_053411_create_user_profiles_table', 1),
(18, '2023_01_08_133258_create_push_notification_records_table', 1),
(19, '2023_01_10_105235_create_user_password_resets_table', 1),
(20, '2023_01_10_115626_create_admin_login_logs_table', 1),
(21, '2023_01_11_121649_create_admin_roles_table', 1),
(22, '2023_01_11_122240_create_user_login_logs_table', 1),
(23, '2023_01_11_135434_update_admins_table', 1),
(24, '2023_01_12_052750_create_admin_role_permissions_table', 1),
(25, '2023_01_12_055605_create_exchange_rates_table', 1),
(26, '2023_01_12_055705_create_user_wallets_table', 1),
(27, '2023_01_14_093411_create_transactions_table', 1),
(28, '2023_01_14_154700_create_admin_role_has_permissions_table', 1),
(29, '2023_01_15_051638_create_admin_has_roles_table', 1),
(30, '2023_01_16_095331_create_temporary_datas_table', 1),
(31, '2023_01_18_043653_create_admin_notifications_table', 1),
(32, '2023_01_18_102653_create_languages_table', 1),
(33, '2023_01_19_060838_create_coinbase_webhook_calls_table', 1),
(34, '2023_01_28_075936_create_user_support_tickets_table', 1),
(35, '2023_01_28_081512_create_user_support_chats_table', 1),
(36, '2023_01_28_101246_create_user_support_ticket_attachments_table', 1),
(37, '2023_02_06_070418_create_user_mail_logs_table', 1),
(38, '2023_02_06_143558_create_user_authorizations_table', 1),
(39, '2023_02_07_154740_create_user_kyc_data_table', 1),
(40, '2023_02_09_083658_create_setup_pages_table', 1),
(41, '2023_02_23_072239_create_transaction_charges_table', 1),
(42, '2023_02_23_073232_create_transaction_devices_table', 1),
(43, '2023_03_02_054825_create_category_types_table', 1),
(44, '2023_03_02_115955_create_faq_sections_table', 1),
(45, '2023_03_11_054132_create_user_notifications_table', 1),
(46, '2023_03_15_060724_create_blog_categories_table', 1),
(47, '2023_03_15_112130_create_blogs_table', 1),
(48, '2023_03_23_152217_create_contacts_table', 1),
(49, '2023_03_30_102050_create_virtual_card_apis_table', 1),
(50, '2023_04_01_065330_create_virtual_cards_table', 1),
(51, '2023_06_21_133800_create_script_table', 1),
(52, '2023_07_19_174909_create_sudo_virtual_cards_table', 1),
(53, '2023_08_09_154956_add_user_table_update_column', 1),
(54, '2023_08_09_154956_add_user_table_update_column_for_strowallet', 1),
(55, '2023_08_09_154956_add_user_table_update_column_v1', 1),
(56, '2023_08_09_154956_add_user_table_update_column_v2', 1),
(57, '2023_08_09_154956_update_column_virtual_card_api_v1', 1),
(58, '2023_08_09_155439_add_basic_settings_table_update_column', 1),
(59, '2023_08_09_155834_blog_table_update_column', 1),
(60, '2023_08_09_155834_update_virtual_card_api_table_column', 1),
(61, '2023_08_26_222500_create_stripe_virtual_cards_table', 1),
(62, '2023_09_03_173051_add_column_on_languages_table', 1),
(63, '2023_09_13_155834_add_transaction_column', 1),
(64, '2023_09_16_130618_update_column_on_transactions_table', 1),
(65, '2023_10_30_163112_create_crypto_assets_table', 1),
(66, '2023_11_02_180143_create_crypto_transactions_table', 1),
(67, '2023_11_21_171439_create_strowallet_virtual_cards_table', 1),
(68, '2023_11_22_155834_update_virtual_card_for_default_system_table_column', 1),
(69, '2024_02_27_180149_update_strowallet_virtual_cards_table_column', 1),
(70, '2024_03_13_155834_update_transaction_column', 1),
(71, '2024_03_16_013002_create_gift_card_apis_table', 1),
(72, '2024_03_20_064600_create_gift_cards_table', 1),
(73, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(74, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(75, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(76, '2016_06_01_000004_create_oauth_clients_table', 2),
(77, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(78, '2024_08_23_204958_create_virtual_card_transactions_table', 3),
(79, '2024_08_23_222140_add_product_to_virtual_card_transactions_table', 4);

-- --------------------------------------------------------

--
-- 表的结构 `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'StripCard Personal Access Client', 'NjuWvISAU8RHhU8GOl8UmCubM2ruIcwf0hMm0ADb', NULL, 'http://localhost', 1, 0, 0, '2024-08-21 08:41:30', '2024-08-21 08:41:30'),
(2, NULL, 'StripCard Password Grant Client', 'hgHipfDDC9O9sMWOjDwkappmKMQvsQnSjFjRChuJ', 'users', 'http://localhost', 0, 1, 0, '2024-08-21 08:41:30', '2024-08-21 08:41:30');

-- --------------------------------------------------------

--
-- 表的结构 `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-08-21 08:41:30', '2024-08-21 08:41:30');

-- --------------------------------------------------------

--
-- 表的结构 `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) NOT NULL,
  `code` int(10) UNSIGNED NOT NULL,
  `type` enum('AUTOMATIC','MANUAL') NOT NULL,
  `name` varchar(100) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(120) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `credentials` text DEFAULT NULL,
  `supported_currencies` text DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0,
  `desc` text DEFAULT NULL,
  `input_fields` text DEFAULT NULL,
  `env` enum('SANDBOX','PRODUCTION') DEFAULT NULL COMMENT 'Payment Gateway Environment (Ex: Production/Sandbox)',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `last_edit_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `slug`, `code`, `type`, `name`, `title`, `alias`, `image`, `credentials`, `supported_currencies`, `crypto`, `desc`, `input_fields`, `env`, `status`, `last_edit_by`, `created_at`, `updated_at`) VALUES
(1, 'add-money', 105, 'AUTOMATIC', 'Paypal', 'Paypal Gateway', 'paypal', '056c00f2-b983-499f-b53e-c27d66410866.webp', '[{\"label\":\"Secret ID\",\"placeholder\":\"Enter Secret ID\",\"name\":\"secret-id\",\"value\":\"EOmsQW73ja4jFXUIpkeTuKj5qLcqiXRCPZMPx-2UNzNy729C5lzN8cYIdZRfHIx7xPVh9cyaeByefXJL\"},{\"label\":\"Client ID\",\"placeholder\":\"Enter Client ID\",\"name\":\"client-id\",\"value\":\"AZhkSGtOqSoGsixors18c5UDkmHD53TzNogt2ksVfxqDeu1RzqdjMClVv8VGarayaAH1exMK0JHMjE8v\"}]', '[\"USD\",\"AUD\",\"CAD\",\"GBP\",\"SGD\",\"BRL\",\"EUR\",\"RUB\"]', 0, NULL, NULL, NULL, 0, 1, '2023-08-29 05:14:57', '2024-08-25 10:00:07'),
(2, 'add-money', 106, 'AUTOMATIC', 'Stripe', 'Stripe Gateway', 'stripe', '25cc3ebb-13cb-4aa9-83df-77ebf1e8a785.webp', '[{\"label\":\"Publishable Key\",\"placeholder\":\"Enter Publishable Key\",\"name\":\"publishable-key\",\"value\":\"pk_test_51NECrlJXLo7QTdMco2E4YxHSeoBnDvKmmi0CZl3hxjGgH1JwgcLVUF3ZR0yFraoRgT7hf0LtOReFADhShAZqTNuB003PnBSlGP\"},{\"label\":\"Secret Id\",\"placeholder\":\"Enter Secret ID\",\"name\":\"secret-id\",\"value\":\"sk_test_51NECrlJXLo7QTdMc2x7K5LaDuiS0MGNYHkO9dzzV0Y9XuWNZsXjECFsusjZEnqtxMIjCh3qtogc5sHHwL2oQ083900aFy1k7DE\"}]', '[\"USD\",\"AUD\",\"AED\",\"BDT\",\"BGN\",\"CAD\",\"EGP\",\"EUR\",\"GBP\",\"INR\"]', 0, NULL, NULL, NULL, 0, 1, '2023-08-29 05:14:57', '2024-08-25 10:00:08'),
(3, 'add-money', 110, 'MANUAL', 'AdPay (Manual)', 'AdPay (Manual) Gateway', 'adpay-manual', '6fe0ddbe-9c0c-4326-95bd-29ac7711b649.webp', NULL, '[\"USD\"]', 0, '<p>This is the manual payment gateway for StripCard, Please follow the payment instruction and sumit required information.</p><p>.</p>', '[{\"type\":\"file\",\"label\":\"Screenshoot\",\"name\":\"screenshoot\",\"required\":true,\"validation\":{\"max\":\"10\",\"mimes\":[\"jpg\",\"png\",\"webp\"],\"min\":0,\"options\":[],\"required\":true}},{\"type\":\"text\",\"label\":\"Transaction ID\",\"name\":\"transaction_id\",\"required\":true,\"validation\":{\"max\":\"30\",\"mimes\":[],\"min\":\"0\",\"options\":[],\"required\":true}}]', NULL, 1, 1, '2023-08-29 05:14:57', '2023-10-03 06:36:51'),
(4, 'add-money', 115, 'MANUAL', 'Bkash(Manual)', 'Bkash(Manual) Gateway', 'bkashmanual', '7bee42e7-b1e9-4fe4-8db8-973b859babc7.webp', NULL, '[\"BDT\"]', 0, '<p>This is the manual payment gateway for StripCard, Please follow the payment instruction and sumit required information.</p><p>.</p>', '[{\"type\":\"text\",\"label\":\"Transaction ID\",\"name\":\"transaction_id\",\"required\":true,\"validation\":{\"max\":\"30\",\"mimes\":[],\"min\":\"0\",\"options\":[],\"required\":true}},{\"type\":\"text\",\"label\":\"Phone Number\",\"name\":\"phone_number\",\"required\":true,\"validation\":{\"max\":\"30\",\"mimes\":[],\"min\":\"0\",\"options\":[],\"required\":true}},{\"type\":\"file\",\"label\":\"Screenshoot\",\"name\":\"screenshoot\",\"required\":true,\"validation\":{\"max\":\"10\",\"mimes\":[\"jpg\",\"png\",\"webp\"],\"min\":0,\"options\":[],\"required\":true}}]', NULL, 1, 1, '2023-08-29 05:14:57', '2023-10-03 06:38:14'),
(5, 'add-money', 120, 'MANUAL', 'Khalti(Manual)', 'Khalti(Manual) Gateway', 'khaltimanual', '774e5db2-b461-4285-ad64-1caf6e5a0716.webp', NULL, '[\"NPR\"]', 0, '<p>This is the manual payment gateway for StripCard, Please follow the payment instruction and sumit required information.</p><p>.</p>', '[{\"type\":\"text\",\"label\":\"Transaction ID\",\"name\":\"transaction_id\",\"required\":true,\"validation\":{\"max\":\"30\",\"mimes\":[],\"min\":\"0\",\"options\":[],\"required\":true}},{\"type\":\"text\",\"label\":\"Phone Number\",\"name\":\"phone_number\",\"required\":true,\"validation\":{\"max\":\"30\",\"mimes\":[],\"min\":\"0\",\"options\":[],\"required\":true}},{\"type\":\"file\",\"label\":\"Screenshoot\",\"name\":\"screenshoot\",\"required\":true,\"validation\":{\"max\":\"10\",\"mimes\":[\"jpg\",\"png\",\"webp\"],\"min\":0,\"options\":[],\"required\":true}}]', NULL, 1, 1, '2023-08-29 05:14:57', '2023-10-03 06:38:33'),
(6, 'add-money', 125, 'MANUAL', 'JazzCash(Manual)', 'JazzCash(Manual) Gateway', 'jazzcashmanual', 'c42ea4db-5067-4dda-92a1-4e00f20b5aaf.webp', NULL, '[\"PKR\"]', 0, '<p>This is the manual payment gateway for StripCard, Please follow the payment instruction and sumit required information.</p><p>.</p>', '[{\"type\":\"text\",\"label\":\"Transaction ID\",\"name\":\"transaction_id\",\"required\":true,\"validation\":{\"max\":\"30\",\"mimes\":[],\"min\":\"0\",\"options\":[],\"required\":true}},{\"type\":\"text\",\"label\":\"Phone Number\",\"name\":\"phone_number\",\"required\":true,\"validation\":{\"max\":\"30\",\"mimes\":[],\"min\":\"0\",\"options\":[],\"required\":true}},{\"type\":\"file\",\"label\":\"Screenshoot\",\"name\":\"screenshoot\",\"required\":true,\"validation\":{\"max\":\"10\",\"mimes\":[\"jpg\",\"png\",\"webp\"],\"min\":0,\"options\":[],\"required\":true}}]', NULL, 1, 1, '2023-08-29 05:14:57', '2023-10-03 06:38:53'),
(7, 'add-money', 130, 'MANUAL', 'EasyPaisa(Manual)', 'EasyPaisa(Manual) Gateway', 'easypaisamanual', '957603b7-d30a-4b70-b4d1-81d8c67ba751.webp', NULL, '[\"PKR\"]', 0, '<p>This is the manual payment gateway for StripCard, Please follow the payment instruction and sumit required information.</p><p>.</p>', '[{\"type\":\"text\",\"label\":\"Transaction ID\",\"name\":\"transaction_id\",\"required\":true,\"validation\":{\"max\":\"30\",\"mimes\":[],\"min\":\"0\",\"options\":[],\"required\":true}},{\"type\":\"text\",\"label\":\"Phone Number\",\"name\":\"phone_number\",\"required\":true,\"validation\":{\"max\":\"30\",\"mimes\":[],\"min\":\"0\",\"options\":[],\"required\":true}},{\"type\":\"file\",\"label\":\"Screenshoot\",\"name\":\"screenshoot\",\"required\":true,\"validation\":{\"max\":\"10\",\"mimes\":[\"jpg\",\"png\",\"webp\"],\"min\":0,\"options\":[],\"required\":true}}]', NULL, 1, 1, '2023-08-29 05:14:57', '2023-10-03 06:39:05'),
(8, 'add-money', 135, 'MANUAL', 'PhonePe(Manual)', 'PhonePe(Manual) Gateway', 'phonepemanual', 'd6dcbd50-d68e-4535-ae2f-c35e3eb56872.webp', NULL, '[\"INR\"]', 0, '<p>This is the manual payment gateway for StripCard, Please follow the payment instruction and sumit required information.</p><p>.</p>', '[{\"type\":\"text\",\"label\":\"Transaction ID\",\"name\":\"transaction_id\",\"required\":true,\"validation\":{\"max\":\"30\",\"mimes\":[],\"min\":\"0\",\"options\":[],\"required\":true}},{\"type\":\"text\",\"label\":\"Phone Number\",\"name\":\"phone_number\",\"required\":true,\"validation\":{\"max\":\"30\",\"mimes\":[],\"min\":\"0\",\"options\":[],\"required\":true}},{\"type\":\"file\",\"label\":\"Screenshoot\",\"name\":\"screenshoot\",\"required\":true,\"validation\":{\"max\":\"10\",\"mimes\":[\"jpg\",\"png\",\"webp\"],\"min\":0,\"options\":[],\"required\":true}}]', NULL, 1, 1, '2023-08-29 05:14:57', '2023-10-03 06:39:17'),
(9, 'add-money', 140, 'MANUAL', 'UPI(Manual)', 'UPI(Manual) Gateway', 'upimanual', '80c9caa2-abc3-48c6-b239-778f10888632.webp', NULL, '[\"INR\"]', 0, '<p>This is the manual payment gateway for StripCard, Please follow the payment instruction and sumit required information.</p><p>.</p>', '[{\"type\":\"text\",\"label\":\"Transaction ID\",\"name\":\"transaction_id\",\"required\":true,\"validation\":{\"max\":\"30\",\"mimes\":[],\"min\":\"0\",\"options\":[],\"required\":true}},{\"type\":\"text\",\"label\":\"Phone Number\",\"name\":\"phone_number\",\"required\":true,\"validation\":{\"max\":\"30\",\"mimes\":[],\"min\":\"0\",\"options\":[],\"required\":true}},{\"type\":\"file\",\"label\":\"Screenshoot\",\"name\":\"screenshoot\",\"required\":true,\"validation\":{\"max\":\"10\",\"mimes\":[\"jpg\",\"png\",\"webp\"],\"min\":0,\"options\":[],\"required\":true}}]', NULL, 1, 1, '2023-08-29 05:14:57', '2023-10-03 06:39:30'),
(10, 'money-out', 145, 'MANUAL', 'StripCard(Manual)', 'StripCard(Manual) Gateway', 'stripcardmanual', '274b95fc-258a-445e-ad96-6d91783e6d9b.webp', NULL, '[\"USD\"]', 0, '<p>This is the manual withdraw gateway for StripCard, Please follow the withdraw instruction and sumit required information.</p>', '[{\"type\":\"text\",\"label\":\"Email\",\"name\":\"email\",\"required\":true,\"validation\":{\"max\":\"30\",\"mimes\":[],\"min\":\"5\",\"options\":[],\"required\":true}},{\"type\":\"text\",\"label\":\"Card Number\",\"name\":\"card_number\",\"required\":true,\"validation\":{\"max\":\"30\",\"mimes\":[],\"min\":\"16\",\"options\":[],\"required\":true}},{\"type\":\"text\",\"label\":\"Card Expiry\",\"name\":\"card_expiry\",\"required\":true,\"validation\":{\"max\":\"30\",\"mimes\":[],\"min\":\"4\",\"options\":[],\"required\":true}},{\"type\":\"text\",\"label\":\"CVC\",\"name\":\"cvc\",\"required\":true,\"validation\":{\"max\":\"30\",\"mimes\":[],\"min\":\"3\",\"options\":[],\"required\":true}}]', NULL, 1, 1, NULL, '2023-10-03 05:34:59'),
(11, 'add-money', 210, 'AUTOMATIC', 'SSLCommerz', 'SSLCommerz Payment Gateway For Add Money', 'sslcommerz', 'f4fe90e9-9b25-48b8-b3f5-9847cfbc6da7.webp', '[{\"label\":\"Store Id\",\"placeholder\":\"Enter Store Id\",\"name\":\"store-id\",\"value\":\"appde6513b3970d62c\"},{\"label\":\"Store Password\",\"placeholder\":\"Enter Store Password\",\"name\":\"store-password\",\"value\":\"appde6513b3970d62c@ssl\"},{\"label\":\"Sandbox Url\",\"placeholder\":\"Enter Sandbox Url\",\"name\":\"sandbox-url\",\"value\":\"https:\\/\\/sandbox.sslcommerz.com\"},{\"label\":\"Live Url\",\"placeholder\":\"Enter Live Url\",\"name\":\"live-url\",\"value\":\"https:\\/\\/securepay.sslcommerz.com\"}]', '[\"BDT\",\"EUR\",\"GBP\",\"AUD\",\"USD\",\"CAD\"]', 0, NULL, NULL, 'SANDBOX', 0, 1, '2023-09-27 08:11:26', '2024-08-25 10:00:09'),
(12, 'add-money', 200, 'AUTOMATIC', 'RazorPay', 'Razor Pay Payment Gateway', 'razorpay', '7f46e145-774e-41bf-9170-243605a5d4d0.webp', '[{\"label\":\"Key ID\",\"placeholder\":\"Enter Key ID\",\"name\":\"key-id\",\"value\":\"rzp_test_voV4gKUbSxoQez\"},{\"label\":\"Secret Key\",\"placeholder\":\"Enter Secret Key\",\"name\":\"secret-key\",\"value\":\"cJltc1jy6evA4Vvh9lTO7SWr\"}]', '[\"USD\",\"EUR\",\"GBP\",\"SGD\",\"AED\",\"AUD\",\"CAD\",\"CNY\",\"SEK\",\"NZD\",\"MXN\",\"BDT\",\"EGP\",\"HKD\",\"INR\",\"LBP\",\"LKR\",\"MAD\",\"MYR\",\"NGN\",\"NPR\",\"PHP\",\"PKR\",\"QAR\",\"SAR\",\"UZS\",\"GHS\"]', 0, NULL, NULL, 'SANDBOX', 0, 1, '2023-08-23 05:21:55', '2024-08-25 10:00:10'),
(13, 'add-money', 142, 'AUTOMATIC', 'Flutterwave', 'Flutterwave Payement Gateway', 'flutterwave', '137701d0-4e12-4a21-bc63-cda5454c2476.webp', '[{\"label\":\"Encryption key\",\"placeholder\":\"Enter Encryption key\",\"name\":\"encryption-key\",\"value\":\"FLWSECK_TEST27bee2235efd\"},{\"label\":\"Secret key\",\"placeholder\":\"Enter Secret key\",\"name\":\"secret-key\",\"value\":\"FLWSECK_TEST-da35e3dbd28be1e7dc5d5f3519e2ebef-X\"},{\"label\":\"Public key\",\"placeholder\":\"Enter Public key\",\"name\":\"public-key\",\"value\":\"FLWPUBK_TEST-e0bc02a00395b938a4a2bed65e1bc94f-X\"}]', '[\"AED\", \"ARS\", \"AUD\", \"CAD\", \"CHF\", \"CZK\", \"ETB\", \"EUR\", \"GBP\", \"GHS\", \"ILS\", \"INR\", \"JPY\", \"KES\", \"MAD\", \"MUR\", \"MYR\", \"NGN\", \"NOK\", \"NZD\", \"PEN\", \"PLN\", \"RUB\", \"RWF\", \"SAR\", \"SEK\", \"SGD\", \"SLL\", \"TZS\", \"UGX\", \"USD\", \"XAF\", \"XOF\", \"ZAR\", \"ZMK\", \"ZMW\", \"MWK\"]', 0, NULL, NULL, NULL, 0, 1, '2023-05-25 03:40:27', '2024-08-25 10:00:11'),
(14, 'add-money', 215, 'AUTOMATIC', 'QRPay', 'QRPay Payment Gateway For Add Money', 'qrpay', '7bcdead3-6b43-46db-8433-f15d5755827c.webp', '[{\"label\":\"Live Base Url\",\"placeholder\":\"Enter Live Base Url\",\"name\":\"live-base-url\",\"value\":\"https:\\/\\/envato.appdevs.net\\/qrpay\\/pay\\/api\\/v1\"},{\"label\":\"Sendbox Base Url\",\"placeholder\":\"Enter Sendbox Base Url\",\"name\":\"sendbox-base-url\",\"value\":\"https:\\/\\/envato.appdevs.net\\/qrpay\\/pay\\/sandbox\\/api\\/v1\"},{\"label\":\"Client Secret\",\"placeholder\":\"Enter Client Secret\",\"name\":\"client-secret\",\"value\":\"oZouVmqHCbyg6ad7iMnrwq3d8wy9Kr4bo6VpQnsX6zAOoEs4oxHPjttpun36JhGxDl7AUMz3ShUqVyPmxh4oPk3TQmDF7YvHN5M3\"},{\"label\":\"Client Id\",\"placeholder\":\"Enter Client Id\",\"name\":\"client-id\",\"value\":\"tRCDXCuztQzRYThPwlh1KXAYm4bG3rwWjbxM2R63kTefrGD2B9jNn6JnarDf7ycxdzfnaroxcyr5cnduY6AqpulRSebwHwRmGerA\"}]', '[\"USD\"]', 0, NULL, NULL, 'SANDBOX', 0, 1, '2023-11-06 07:21:19', '2024-08-25 10:00:18'),
(15, 'add-money', 220, 'AUTOMATIC', 'CoinGate', 'Crypto Payment gateway (CoinGate)', 'coingate', '7e1f09b8-7c58-44bb-9de5-133eaffc10eb.webp', '[{\"label\":\"Sandbox URL\",\"placeholder\":\"Enter Sandbox URL\",\"name\":\"sandbox-url\",\"value\":\"https:\\/\\/api-sandbox.coingate.com\\/v2\"},{\"label\":\"Sandbox App Token\",\"placeholder\":\"Enter Sandbox App Token\",\"name\":\"sandbox-app-token\",\"value\":\"XJW4RyhT8F-xssX2PvaHMWJjYe5nsbsrbb2Uqy4m\"},{\"label\":\"Production URL\",\"placeholder\":\"Enter Production URL\",\"name\":\"production-url\",\"value\":\"https:\\/\\/api.coingate.com\\/v2\"},{\"label\":\"Production App Token\",\"placeholder\":\"Enter Production App Token\",\"name\":\"production-app-token\",\"value\":null}]', '[\"USD\",\"BTC\",\"LTC\",\"ETH\",\"BCH\",\"TRX\",\"ETC\",\"DOGE\",\"BTG\",\"BNB\",\"TUSD\",\"USDT\",\"BSV\",\"MATIC\",\"BUSD\",\"SOL\",\"WBTC\",\"RVN\",\"BCD\",\"ATOM\",\"BTTC\",\"EURT\"]', 0, NULL, NULL, 'SANDBOX', 0, 1, '2024-08-21 08:41:28', '2024-08-25 10:00:20'),
(16, 'add-money', 225, 'AUTOMATIC', 'Tatum', 'Tatum Gateway', 'tatum', 'b6d31ae3-6b79-453a-a699-1c741b6cc0fe.webp', '[{\"label\":\"Testnet\",\"placeholder\":\"Enter Testnet\",\"name\":\"test-net\",\"value\":\"t-657aafddb117a3001c86eda4-37941d61197f4aa6bf416aff\"},{\"label\":\"Mainnet\",\"placeholder\":\"Enter Mainnet\",\"name\":\"main-net\",\"value\":\"t-657aafddb117a3001c86eda4-53dede7263974bb4a63d6e0e\"}]', '[\"BTC\",\"ETH\",\"SOL\"]', 1, NULL, NULL, 'SANDBOX', 1, 1, '2024-08-21 08:41:28', '2024-08-25 10:26:18'),
(17, 'add-money', 230, 'AUTOMATIC', 'Perfect Money', 'Perfect Money Gateway', 'perfect-money', 'a9f5fc3e-b53c-4fb8-9b9d-301c82b3158c.webp', '[{\"label\":\"Alternate Passphrase\",\"placeholder\":\"Enter Alternate Passphrase\",\"name\":\"alternate-passphrase\",\"value\":\"t0d2nbK2ZA92fRTnIFsMTWsHT\"},{\"label\":\"EUR Account\",\"placeholder\":\"Enter EUR Account\",\"name\":\"eur-account\",\"value\":\"E39620511\"},{\"label\":\"USD Account\",\"placeholder\":\"Enter USD Account\",\"name\":\"usd-account\",\"value\":\"U39903302\"}]', '[\"USD\",\"EUR\"]', 0, NULL, NULL, 'SANDBOX', 0, 1, '2024-08-21 08:41:28', '2024-08-25 10:00:16'),
(18, 'add-money', 245, 'AUTOMATIC', 'Pagadito', 'Pagadito Payment gateway', 'pagadito', 'seeder/pagadito.webp', '[{\"label\":\"UID\",\"placeholder\":\"Enter UID\",\"name\":\"uid\",\"value\":\"b73eb3fa1dc8bea4b4363322c906a8fd\"},{\"label\":\"WSK\",\"placeholder\":\"Enter WSK\",\"name\":\"wsk\",\"value\":\"dc843ff5865bac2858ad8f23af081256\"},{\"label\":\"base_url\",\"placeholder\":\"Enter base_url\",\"name\":\"base_url\",\"value\":\"https:\\/\\/sandbox.pagadito.com\"}]', '[\"USD\",\"HNL\",\"CRC\",\"DOP\",\"GTQ\",\"NIO\",\"PAB\"]', 0, NULL, NULL, 'SANDBOX', 0, 1, '2024-08-21 08:41:28', '2024-08-25 10:00:15'),
(19, 'add-money', 250, 'AUTOMATIC', 'EQUSDT', 'EQUSDT', 'equsdt', NULL, '[{\"label\":\"EQUSDT\",\"placeholder\":\"Enter EQUSDT\",\"name\":\"equsdt\",\"value\":\"EQUSDT\"}]', '[\"USDT\"]', 0, NULL, NULL, 'PRODUCTION', 1, 1, '2024-08-25 09:47:34', '2024-08-25 10:03:06');

-- --------------------------------------------------------

--
-- 表的结构 `payment_gateway_currencies`
--

CREATE TABLE `payment_gateway_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_gateway_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `alias` varchar(120) NOT NULL,
  `currency_code` varchar(20) NOT NULL,
  `currency_symbol` varchar(20) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `min_limit` decimal(28,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `max_limit` decimal(28,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(28,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(28,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `payment_gateway_currencies`
--

INSERT INTO `payment_gateway_currencies` (`id`, `payment_gateway_id`, `name`, `alias`, `currency_code`, `currency_symbol`, `image`, `min_limit`, `max_limit`, `percent_charge`, `fixed_charge`, `rate`, `created_at`, `updated_at`) VALUES
(1, 1, 'Paypal USD', 'add-money-paypal-usd-automatic', 'USD', '$', NULL, 10.00000000, 1000.00000000, 1.00000000, 2.00000000, 1.00000000, '2023-08-29 05:14:57', NULL),
(2, 1, 'Paypal AUD', 'add-money-paypal-aud-automatic', 'AUD', '$', NULL, 15.00000000, 1500.00000000, 1.00000000, 2.00000000, 1.55000000, '2023-08-29 05:14:57', NULL),
(3, 2, 'Stripe USD', 'add-money-stripe-usd-automatic', 'USD', '$', NULL, 10.00000000, 1000.00000000, 1.00000000, 2.00000000, 1.00000000, '2023-08-29 05:14:57', NULL),
(4, 2, 'Stripe AUD', 'add-money-stripe-aud-automatic', 'AUD', '$', NULL, 15.00000000, 1500.00000000, 1.00000000, 2.00000000, 1.55000000, '2023-08-29 05:14:57', NULL),
(5, 3, 'AdPay (Manual) USD', 'adpay-manual-usd-manual', 'USD', '$', NULL, 10.00000000, 1000.00000000, 1.00000000, 2.00000000, 1.00000000, '2023-08-29 05:14:57', '2023-10-03 06:36:51'),
(6, 4, 'Bkash(Manual) BDT', 'bkashmanual-bdt-manual', 'BDT', '৳', NULL, 10.00000000, 1000.00000000, 1.00000000, 2.00000000, 109.13000000, '2023-08-29 05:14:57', '2023-10-03 06:38:14'),
(7, 5, 'Khalti(Manual) NPR', 'khaltimanual-npr-manual', 'NPR', 'रु', NULL, 10.00000000, 1000.00000000, 1.00000000, 2.00000000, 132.05000000, '2023-08-29 05:14:57', '2023-10-03 06:38:33'),
(8, 6, 'JazzCash(Manual) PKR', 'jazzcashmanual-pkr-manual', 'PKR', 'रु', NULL, 10.00000000, 1000.00000000, 1.00000000, 2.00000000, 303.16000000, '2023-08-29 05:14:57', '2023-10-03 06:38:53'),
(9, 7, 'EasyPaisa(Manual) PKR', 'easypaisamanual-pkr-manual', 'PKR', 'रु', NULL, 10.00000000, 1000.00000000, 1.00000000, 2.00000000, 303.16000000, '2023-08-29 05:14:57', '2023-10-03 06:39:05'),
(10, 8, 'PhonePe(Manual) INR', 'phonepemanual-inr-manual', 'INR', '₹', NULL, 10.00000000, 1000.00000000, 1.00000000, 2.00000000, 82.67000000, '2023-08-29 05:14:57', '2023-10-03 06:39:17'),
(11, 9, 'UPI(Manual) INR', 'upimanual-inr-manual', 'INR', '₹', NULL, 10.00000000, 1000.00000000, 1.00000000, 2.00000000, 82.67000000, '2023-08-29 05:14:57', '2023-10-03 06:39:30'),
(12, 10, 'StripCard(Manual) USD', 'stripcardmanual-usd-money-out', 'USD', '$', NULL, 1.00000000, 100.00000000, 1.00000000, 1.00000000, 1.00000000, '2023-10-03 05:15:44', '2023-10-03 05:34:59'),
(13, 11, 'SSLCommerz BDT', 'add-money-sslcommerz-bdt-automatic', 'BDT', '৳', '06f617aa-a336-4382-987e-ae632929bed1.webp', 100.00000000, 50000.00000000, 0.00000000, 0.00000000, 110.64000000, '2023-10-03 09:27:49', '2023-10-03 09:29:55'),
(14, 12, 'RazorPay INR', 'add-money-razorpay-inr-automatic', 'INR', '₹', '69b7df34-f1fb-4947-a6f5-e93b78648075.webp', 100.00000000, 100000.00000000, 0.00000000, 1.00000000, 82.87000000, '2023-10-03 09:28:26', '2023-10-03 09:28:26'),
(15, 13, 'Flutterwave NGN', 'add-money-flutterwave-ngn-automatic', 'NGN', '₦', '17fb91c7-a29c-486a-ac5f-ca8bc69a1bfe.webp', 1000.00000000, 10000.00000000, 1.00000000, 0.00000000, 464.00000000, '2023-10-03 09:29:06', '2023-10-03 09:29:06'),
(16, 14, 'QRPay USD', 'add-money-qrpay-usd-automatic', 'USD', '$', NULL, 1.00000000, 100.00000000, 0.00000000, 1.00000000, 1.00000000, '2023-11-06 07:23:33', '2023-11-06 07:23:33'),
(17, 15, 'CoinGate USDT', 'add-money-coingate-usdt-automatic', 'USDT', '$', NULL, 1.00000000, 100.00000000, 1.00000000, 0.00000000, 1.00000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(18, 15, 'CoinGate USD', 'add-money-coingate-usd-automatic', 'USD', '$', NULL, 1.00000000, 100.00000000, 1.00000000, 0.00000000, 1.00000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(19, 16, 'Tatum ETH', 'add-money-tatum-eth-automatic', 'ETH', 'ETH', NULL, 0.00000000, 1000.00000000, 1.00000000, 0.00000000, 0.00044000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(20, 16, 'Tatum BTC', 'add-money-tatum-btc-automatic', 'BTC', 'BTC', NULL, 0.00000000, 1000.00000000, 1.00000000, 0.00000000, 0.00002400, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(21, 16, 'Tatum SOL', 'add-money-tatum-sol-automatic', 'SOL', 'SOL', NULL, 0.00000000, 1000.00000000, 1.00000000, 0.00000000, 3.76000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(22, 17, 'Perfect Money EUR', 'add-money-perfect-money-eur-automatic', 'EUR', '€', 'a9f5fc3e-b53c-4fb8-9b9d-301c82b3158c.webp', 1.00000000, 1000.00000000, 1.00000000, 1.00000000, 0.92000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(23, 17, 'Perfect Money USD', 'add-money-perfect-money-usd-automatic', 'USD', '$', 'a9f5fc3e-b53c-4fb8-9b9d-301c82b3158c.webp', 1.00000000, 1000.00000000, 1.00000000, 1.00000000, 1.00000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(24, 12, 'Razorpay GHS', 'add-money-razorpay-ghs-automatic', 'GHS', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 11.90000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(25, 12, 'Razorpay UZS', 'add-money-razorpay-uzs-automatic', 'UZS', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 12263.46000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(26, 12, 'Razorpay SAR', 'add-money-razorpay-sar-automatic', 'SAR', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 3.75000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(27, 12, 'Razorpay QAR', 'add-money-razorpay-qar-automatic', 'QAR', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 3.64000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(28, 12, 'Razorpay PKR', 'add-money-razorpay-pkr-automatic', 'PKR', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 286.50000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(29, 12, 'Razorpay PHP', 'add-money-razorpay-php-automatic', 'PHP', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 55.79000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(30, 12, 'Razorpay NPR', 'add-money-razorpay-npr-automatic', 'NPR', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 133.25000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(31, 12, 'Razorpay NGN', 'add-money-razorpay-ngn-automatic', 'NGN', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 780.00000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(32, 12, 'Razorpay MYR', 'add-money-razorpay-myr-automatic', 'MYR', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 4.69000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(33, 12, 'Razorpay MAD', 'add-money-razorpay-mad-automatic', 'MAD', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 10.21000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(34, 12, 'Razorpay LKR', 'add-money-razorpay-lkr-automatic', 'LKR', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 327.00000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(35, 12, 'Razorpay LBP', 'add-money-razorpay-lbp-automatic', 'LBP', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 15000.00000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(36, 12, 'Razorpay HKD', 'add-money-razorpay-hkd-automatic', 'HKD', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 7.81000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(37, 12, 'Razorpay EGP', 'add-money-razorpay-egp-automatic', 'EGP', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 30.85000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(38, 12, 'Razorpay BDT', 'add-money-razorpay-bdt-automatic', 'BDT', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 110.00000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(39, 12, 'Razorpay MXN', 'add-money-razorpay-mxn-automatic', 'MXN', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 17.57000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(40, 12, 'Razorpay NZD', 'add-money-razorpay-nzd-automatic', 'NZD', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 1.69000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(41, 12, 'Razorpay SEK', 'add-money-razorpay-sek-automatic', 'SEK', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 10.89000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(42, 12, 'Razorpay CNY', 'add-money-razorpay-cny-automatic', 'CNY', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 7.29000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(43, 12, 'Razorpay CAD', 'add-money-razorpay-cad-automatic', 'CAD', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 1.38000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(44, 12, 'Razorpay AUD', 'add-money-razorpay-aud-automatic', 'AUD', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 1.56000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(45, 12, 'Razorpay AED', 'add-money-razorpay-aed-automatic', 'AED', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 3.67000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(46, 12, 'Razorpay SGD', 'add-money-razorpay-sgd-automatic', 'SGD', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 1.36000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(47, 12, 'Razorpay GBP', 'add-money-razorpay-gbp-automatic', 'GBP', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 0.82000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(48, 12, 'Razorpay EUR', 'add-money-razorpay-eur-automatic', 'EUR', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 0.94000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(49, 12, 'Razorpay USD', 'add-money-razorpay-usd-automatic', 'USD', NULL, NULL, 1.00000000, 1000.00000000, 2.00000000, 1.00000000, 1.00000000, '2024-08-21 08:41:28', '2024-08-21 08:41:28'),
(50, 18, 'Pagadito USD', 'add-money-pagadito-usd-automatic', 'USD', '$', 'seeder/pagadito.webp', 1.00000000, 1000.00000000, 1.00000000, 1.00000000, 1.00000000, '2024-01-07 20:11:48', '2024-01-07 20:12:21'),
(51, 18, 'Pagadito HNL', 'add-money-pagadito-hnl-automatic', 'HNL', NULL, 'seeder/pagadito.webp', 0.00000000, 0.00000000, 0.00000000, 0.00000000, 24.62000000, '2024-01-07 20:11:48', '2024-01-07 20:12:21'),
(52, 18, 'Pagadito CRC', 'add-money-pagadito-crc-automatic', 'CRC', NULL, 'seeder/pagadito.webp', 1.00000000, 1000.00000000, 1.00000000, 1.00000000, 518.12000000, '2024-01-07 20:11:48', '2024-01-07 20:12:21'),
(53, 18, 'Pagadito DOP', 'add-money-pagadito-dop-automatic', 'DOP', NULL, 'seeder/pagadito.webp', 1.00000000, 1000.00000000, 1.00000000, 1.00000000, 58.02801200, '2024-01-07 20:11:48', '2024-01-07 20:12:21'),
(54, 18, 'Pagadito GTQ', 'add-money-pagadito-gtq-automatic', 'GTQ', NULL, 'seeder/pagadito.webp', 1.00000000, 1000.00000000, 1.00000000, 1.00000000, 7.81000000, '2024-01-07 20:11:48', '2024-01-07 20:12:21'),
(55, 18, 'Pagadito NIO', 'add-money-pagadito-nio-automatic', 'NIO', NULL, 'seeder/pagadito.webp', 1.00000000, 1000.00000000, 1.00000000, 1.00000000, 36.54000000, '2024-01-07 20:11:48', '2024-01-07 20:12:21'),
(56, 18, 'Pagadito PAB', 'add-money-pagadito-pab-automatic', 'PAB', NULL, 'seeder/pagadito.webp', 1.00000000, 1000.00000000, 1.00000000, 1.00000000, 1.00000000, '2024-01-07 20:11:48', '2024-01-07 20:12:21'),
(57, 19, 'EQUSDT USDT', 'add-money-equsdt-usdt-automatic', 'USDT', '$', NULL, 50.00000000, 1500.00000000, 7.00000000, 0.00000000, 1.00000000, '2024-08-25 10:01:19', '2024-08-26 04:59:13');

-- --------------------------------------------------------

--
-- 表的结构 `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `push_notification_records`
--

CREATE TABLE `push_notification_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_ids` text DEFAULT NULL,
  `device_ids` text DEFAULT NULL,
  `method` varchar(50) NOT NULL,
  `response` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `send_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `script`
--

CREATE TABLE `script` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client` varchar(191) NOT NULL,
  `signature` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `script`
--

INSERT INTO `script` (`id`, `client`, `signature`, `created_at`, `updated_at`) VALUES
(1, 'localhost', 'eyJfdG9rZW4iOiJXV0hlckJaNkhueXdMYXRpNkt0UVJwV3I0Yk9pUkJSSmZpMThpajRrIiwidXNlcm5hbWUiOiJzdW5qaWFmdSIsImNvZGUiOiJzdW5qaWFmdSIsImNsaWVudCI6eyJjbGllbnQiOiJodHRwOlwvXC9sb2NhbGhvc3RcL3ZjYyJ9LCJhcHBfbmFtZSI6IkN2diBDYXJkIiwiaG9zdCI6ImxvY2FsaG9zdCIsImRiX25hbWUiOiJjdnYiLCJkYl91c2VyIjoicm9vdCIsImRiX3VzZXJfcGFzc3dvcmQiOm51bGwsImVtYWlsIjoic2pmMTEwQGdtYWlsLmNvbSIsImZfbmFtZSI6IlN1biBKaWFxaWFuZyIsImxfbmFtZSI6IlN1biIsInBhc3N3b3JkIjoiTG92ZTc0ODI2NCJ9', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `setup_kycs`
--

CREATE TABLE `setup_kycs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  `fields` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `last_edit_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `setup_kycs`
--

INSERT INTO `setup_kycs` (`id`, `slug`, `user_type`, `fields`, `status`, `last_edit_by`, `created_at`, `updated_at`) VALUES
(1, 'user', 'USER', '[{\"type\":\"select\",\"label\":\"ID Type\",\"name\":\"id_type\",\"required\":true,\"validation\":{\"max\":0,\"min\":0,\"mimes\":[],\"options\":[\"NID\",\" Driving License\",\" Passport\"],\"required\":true}},{\"type\":\"file\",\"label\":\"Back\",\"name\":\"back\",\"required\":true,\"validation\":{\"max\":\"2\",\"mimes\":[\"jpg\",\" png\",\" webp\",\" jpeg\"],\"min\":0,\"options\":[],\"required\":true}},{\"type\":\"file\",\"label\":\"Front\",\"name\":\"front\",\"required\":true,\"validation\":{\"max\":\"2\",\"mimes\":[\"jpg\",\" png\",\" webp\",\" jpeg\"],\"min\":0,\"options\":[],\"required\":true}}]', 1, 1, '2024-08-21 08:41:28', '2024-08-21 08:41:28');

-- --------------------------------------------------------

--
-- 表的结构 `setup_pages`
--

CREATE TABLE `setup_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(250) NOT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `last_edit_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `setup_pages`
--

INSERT INTO `setup_pages` (`id`, `type`, `slug`, `title`, `url`, `details`, `last_edit_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'setup-page', 'home', '{\"title\":\"Home\"}', '/', NULL, 1, 1, '2024-08-21 08:41:28', NULL),
(2, 'setup-page', 'about', '{\"title\":\"About\"}', '/about', NULL, 1, 1, '2024-08-21 08:41:28', NULL),
(3, 'setup-page', 'services', '{\"title\":\"Services\"}', '/services', NULL, 1, 1, '2024-08-21 08:41:28', NULL),
(4, 'setup-page', 'announcement', '{\"title\":\"Announcement\"}', 'announcement', NULL, 1, 1, '2024-08-21 08:41:28', NULL),
(5, 'setup-page', 'contact', '{\"title\":\"Contact\"}', '/contact', NULL, 1, 1, '2024-08-21 08:41:28', NULL),
(6, 'useful-links', 'privacy-policy', '{\"language\":{\"en\":{\"title\":\"Privacy Policy\"},\"es\":{\"title\":\"pol\\u00edtica de privacidad\"}}}', NULL, '{\"language\":{\"en\":{\"details\":\"<h3 style=\\\"margin-left:0px;\\\"><strong>What information do we collect?<\\/strong><\\/h3><p style=\\\"margin-left:0px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><h3 style=\\\"margin-left:0px;\\\"><strong>How do we protect your information?<\\/strong><\\/h3><p style=\\\"margin-left:0px;\\\">All provided delicate\\/credit data is sent through Stripe.<br>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won be put away on our workers.<\\/p><h3 style=\\\"margin-left:0px;\\\"><strong>Do we disclose any information to outside parties?<\\/strong><\\/h3><p style=\\\"margin-left:0px;\\\">We don sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others rights, property, or wellbeing.<\\/p><h3 style=\\\"margin-left:0px;\\\"><strong>Childrens Online Privacy Protection Act Compliance<\\/strong><\\/h3><p style=\\\"margin-left:0px;\\\">We are consistent with the prerequisites of COPPA (Childrens Online Privacy Protection Act), we don gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><h3 style=\\\"margin-left:0px;\\\"><strong>Changes to our Privacy Policy<\\/strong><\\/h3><p style=\\\"margin-left:0px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><h3 style=\\\"margin-left:0px;\\\"><strong>How long we retain your information?<\\/strong><\\/h3><p style=\\\"margin-left:0px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don not erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><h2 style=\\\"margin-left:0px;text-align:center;\\\">&nbsp;<\\/h2>\"},\"es\":{\"details\":\"<p>\\u00bfQu\\u00e9 informaci\\u00f3n recopilamos?<\\/p><p>Recopilamos sus datos cuando se registra en nuestro sitio, env\\u00eda una solicitud, compra cualquier servicio, reacciona a una descripci\\u00f3n general o completa una estructura. Cuando solicite asistencia o se registre en nuestro sitio, seg\\u00fan corresponda, se le pedir\\u00e1 que ingrese su: nombre, direcci\\u00f3n de correo electr\\u00f3nico o n\\u00famero de tel\\u00e9fono. No obstante, puede visitar nuestro sitio de forma an\\u00f3nima.<\\/p><p>\\u00bfC\\u00f3mo protegemos tu informaci\\u00f3n?<\\/p><p>Todos los datos delicados\\/de cr\\u00e9dito proporcionados se env\\u00edan a trav\\u00e9s de Stripe.<br>Despu\\u00e9s de un intercambio, sus datos privados (tarjetas de cr\\u00e9dito, n\\u00fameros de seguridad social, datos financieros, etc.) se guardar\\u00e1n en nuestros trabajadores.<\\/p><p>\\u00bfRevelamos informaci\\u00f3n a terceros?<\\/p><p>No vendemos, intercambiamos o, en cualquier caso, nos trasladamos a reuniones externas por y por datos reconocibles. Esto excluye a personas ajenas a la confianza que nos ayudan a trabajar en nuestro sitio, liderar nuestro negocio o ajustarlo, ya que esos grupos aceptan mantener estos datos privados. Tambi\\u00e9n podemos entregar sus datos cuando aceptemos que la descarga es adecuada para cumplir con la ley, implementar las estrategias de nuestro sitio o garantizar nuestros derechos, propiedad o bienestar propios o ajenos.<\\/p><p>Cumplimiento de la Ley de protecci\\u00f3n de la privacidad en l\\u00ednea de los ni\\u00f1os<\\/p><p>Cumplimos con los requisitos previos de COPPA (Ley de protecci\\u00f3n de la privacidad en l\\u00ednea de los ni\\u00f1os), no recopilamos datos de personas menores de 13 a\\u00f1os. Nuestro sitio, art\\u00edculos y administraciones est\\u00e1n completamente coordinados para personas que tienen al menos 13 a\\u00f1os de edad o m\\u00e1s establecidas.<\\/p><p>Cambios a nuestra Pol\\u00edtica de Privacidad<\\/p><p>Si decidimos cambiar nuestra pol\\u00edtica de privacidad, publicaremos esos cambios en esta p\\u00e1gina.<\\/p><p>\\u00bfCu\\u00e1nto tiempo retenemos su informaci\\u00f3n?<\\/p><p>En el momento en que se registra en nuestro sitio, ciclamos y mantenemos la informaci\\u00f3n que tenemos sobre usted por el tiempo que no borre el registro o se retire (sujeto a leyes y pautas).<\\/p>\"}}}', 1, 1, '2024-08-21 08:41:28', '2024-08-21 08:41:28');

-- --------------------------------------------------------

--
-- 表的结构 `setup_seos`
--

CREATE TABLE `setup_seos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `last_edit_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `setup_seos`
--

INSERT INTO `setup_seos` (`id`, `slug`, `title`, `desc`, `tags`, `image`, `last_edit_by`, `created_at`, `updated_at`) VALUES
(1, 'strip-card', 'StripCard- Virtual Credit Card Solution', 'StripCard is a software application used to conduct an online chat conversation for text and image, in lieu of providing direct contact with a live human agent. It is capable of maintaining a conversation with a user in natural language, understanding their intent, and replying based on preset rules and data.', '[\"24\\/7 support\",\"card issuance\",\"customizable\",\"easy setup\",\"financial inclusion\",\"one-time-use codes\",\"online payments\",\"payment solutions\",\"secure transactions\",\"sleek design\",\"User-Friendly interface\",\"virtual credit cards\"]', 'seeder/seo_image.jpg', 1, '2024-08-21 08:41:28', '2024-08-21 08:41:28');

-- --------------------------------------------------------

--
-- 表的结构 `site_sections`
--

CREATE TABLE `site_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(100) NOT NULL,
  `value` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `serialize` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `site_sections`
--

INSERT INTO `site_sections` (`id`, `key`, `value`, `status`, `serialize`, `created_at`, `updated_at`) VALUES
(1, 'site_cookie', '{\"status\":true,\"link\":\"page\\/privacy-policy\",\"desc\":\"<p><span style=\\\"color:hsl(0,0%,0%);\\\">We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.<\\/span><\\/p><p>&nbsp;<\\/p>\"}', 1, NULL, NULL, NULL),
(2, 'home-banner', '{\"images\":{\"banner_image\":\"3770d1fc-37bf-4a7a-9e5d-170883df5df9.webp\"},\"language\":{\"en\":{\"heading\":\"Unveiling the Virtual Credit Card Experience\",\"sub_heading\":\"The payment needs of major online giants such as AliExpress, Netflix, Facebook-Google Advertising, Amazon, and various other shopping platforms.\",\"button_name\":\"Apply Virtual Card\",\"button_link\":\"contact\"},\"es\":{\"heading\":\"Presentando la experiencia de la tarjeta de cr\\u00e9dito virtual\",\"sub_heading\":\"Las necesidades de pago de los principales gigantes en l\\u00ednea como AliExpress, Netflix, Facebook-Google Advertising, Amazon y varias otras plataformas de compras.\",\"button_name\":\"Aplicar Tarjeta Virtual\",\"button_link\":\"contact\"},\"ar\":{\"heading\":\"\\u0627\\u0644\\u0643\\u0634\\u0641 \\u0639\\u0646 \\u062a\\u062c\\u0631\\u0628\\u0629 \\u0628\\u0637\\u0627\\u0642\\u0629 \\u0627\\u0644\\u0627\\u0626\\u062a\\u0645\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u064a\\u0629\",\"sub_heading\":\"\\u0627\\u062d\\u062a\\u064a\\u0627\\u062c\\u0627\\u062a \\u0627\\u0644\\u062f\\u0641\\u0639 \\u0644\\u0643\\u0628\\u0627\\u0631 \\u0639\\u0645\\u0627\\u0644\\u0642\\u0629 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a \\u0645\\u062b\\u0644 AliExpress \\u0648Netflix \\u0648Facebook-Google Advertising \\u0648Amazon \\u0648\\u0627\\u0644\\u0639\\u062f\\u064a\\u062f \\u0645\\u0646 \\u0645\\u0646\\u0635\\u0627\\u062a \\u0627\\u0644\\u062a\\u0633\\u0648\\u0642 \\u0627\\u0644\\u0623\\u062e\\u0631\\u0649.\",\"button_name\":\"\\u062a\\u0637\\u0628\\u064a\\u0642 \\u0627\\u0644\\u0628\\u0637\\u0627\\u0642\\u0629 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u064a\\u0629\",\"button_link\":\"contact\"},\"CN\":{\"heading\":\"\\u4e00\\u7ad9\\u5f0f\\u5e7f\\u544a\\u6295\\u653e \\u7ba1\\u7406\\u5e73\\u53f0\",\"sub_heading\":\"\\u96c6\\u6210Facebook\\u3001Google\\u3001Tiktok\\u7b49\\u4e00\\u7ad9\\u5f0f\\u5e7f\\u544a\\u6295\\u653e \\u52a9\\u529b\\u8de8\\u5883\\u4f01\\u4e1a\\u54c1\\u724c\\u51fa\\u6d77\\uff0c\\u4e00\\u952e\\u89e6\\u8fbe\",\"button_name\":\"\\u7acb\\u5373\\u4f7f\\u7528\",\"button_link\":\"456456456\"}}}', 1, NULL, NULL, '2024-08-26 03:59:21'),
(3, 'about-section', '{\"images\":{\"banner_image\":\"88c1be66-6038-438e-8b7c-64a6b3356a71.webp\",\"first_section_image\":\"afbb5b41-2bed-47c9-a82a-ef16751d8f90.webp\",\"second_section_image\":\"e3261cd8-8861-42cd-9df4-152bdc126b57.webp\",\"image\":\"98d8b2de-c267-484a-8316-b5d518570c10.webp\"},\"language\":{\"en\":{\"section_title\":\"About Us\",\"heading\":\"Empowering the Future of Online Transactions\",\"sub_heading\":\"we are at the forefront of revolutionizing the way people navigate the digital financial landscape. Our mission is clear: to provide users and entrepreneurs with a secure, efficient, and user-friendly platform for conducting online transactions through virtual credit cards.\"},\"es\":{\"section_title\":\"Sobre nosotras\",\"heading\":\"Potenciando el futuro de las transacciones en l\\u00ednea\",\"sub_heading\":\"Estamos a la vanguardia de revolucionar la forma en que las personas navegan por el panorama financiero digital. Nuestra misi\\u00f3n es clara: brindar a usuarios y emprendedores una plataforma segura, eficiente y amigable para realizar transacciones en l\\u00ednea a trav\\u00e9s de tarjetas de cr\\u00e9dito virtuales.\"},\"ar\":{\"section_title\":\"\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0639\\u0646\\u0627\",\"heading\":\"\\u062a\\u0645\\u0643\\u064a\\u0646 \\u0645\\u0633\\u062a\\u0642\\u0628\\u0644 \\u0627\\u0644\\u0645\\u0639\\u0627\\u0645\\u0644\\u0627\\u062a \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a\",\"sub_heading\":\"\\u0646\\u062d\\u0646 \\u0641\\u064a \\u0637\\u0644\\u064a\\u0639\\u0629 \\u0625\\u062d\\u062f\\u0627\\u062b \\u062b\\u0648\\u0631\\u0629 \\u0641\\u064a \\u0627\\u0644\\u0637\\u0631\\u064a\\u0642\\u0629 \\u0627\\u0644\\u062a\\u064a \\u064a\\u062a\\u0646\\u0642\\u0644 \\u0628\\u0647\\u0627 \\u0627\\u0644\\u0623\\u0634\\u062e\\u0627\\u0635 \\u0641\\u064a \\u0627\\u0644\\u0645\\u0634\\u0647\\u062f \\u0627\\u0644\\u0645\\u0627\\u0644\\u064a \\u0627\\u0644\\u0631\\u0642\\u0645\\u064a. \\u0645\\u0647\\u0645\\u062a\\u0646\\u0627 \\u0648\\u0627\\u0636\\u062d\\u0629: \\u062a\\u0632\\u0648\\u064a\\u062f \\u0627\\u0644\\u0645\\u0633\\u062a\\u062e\\u062f\\u0645\\u064a\\u0646 \\u0648\\u0631\\u062c\\u0627\\u0644 \\u0627\\u0644\\u0623\\u0639\\u0645\\u0627\\u0644 \\u0628\\u0645\\u0646\\u0635\\u0629 \\u0622\\u0645\\u0646\\u0629 \\u0648\\u0641\\u0639\\u0627\\u0644\\u0629 \\u0648\\u0633\\u0647\\u0644\\u0629 \\u0627\\u0644\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0644\\u0625\\u062c\\u0631\\u0627\\u0621 \\u0627\\u0644\\u0645\\u0639\\u0627\\u0645\\u0644\\u0627\\u062a \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u0628\\u0637\\u0627\\u0642\\u0627\\u062a \\u0627\\u0644\\u0627\\u0626\\u062a\\u0645\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u064a\\u0629.\"},\"CN\":{\"section_title\":\"\\u5e7f\\u544a\\u6295\\u653e\",\"heading\":\"\\u4e3a\\u4ec0\\u4e48\\u9009\\u62e9\\u6211\\u4eec\\uff1f\",\"sub_heading\":\"\\u9009\\u62e9\\u6211\\u4eec\\u7684\\u865a\\u62df\\u4fe1\\u7528\\u5361\\u670d\\u52a1\\uff0c\\u60a8\\u5c06\\u4eab\\u53d7\\u529e\\u7406\\u7b80\\u5355\\u3001\\u4ef7\\u683c\\u5b9e\\u60e0\\u7684\\u4f18\\u52bf\\u3002\\u65e0\\u8bba\\u60a8\\u662f\\u5e7f\\u544a\\u6295\\u653e\\u8fd8\\u662f\\u5176\\u4ed6\\u5728\\u7ebf\\u6d88\\u8d39\\uff0c\\u6211\\u4eec\\u90fd\\u63d0\\u4f9b\\u7075\\u6d3b\\u7684\\u5145\\u503c\\u9009\\u9879\\u548c\\u4e13\\u5c5e\\u5ba2\\u670d\\u652f\\u6301\\uff0c\\u786e\\u4fdd\\u60a8\\u6bcf\\u4e00\\u6b65\\u90fd\\u987a\\u5229\\u65e0\\u5fe7\"}},\"items\":{\"643eb5ed48d64\":{\"language\":{\"en\":{\"title\":\"The StripCard Difference\",\"icon\":\"fas fa-check\"},\"es\":{\"title\":\"La diferencia con StripCard\",\"icon\":\"transacci\\u00f3n de recibos\"},\"ar\":{\"title\":\"\\u0627\\u0644\\u0641\\u0631\\u0642 StripCard\",\"icon\":\"fas fa-check\"},\"CN\":{\"title\":\"\\u529e\\u7406\\u7b80\\u5355\",\"icon\":\"fas fa-check\"}},\"id\":\"643eb5ed48d64\"},\"643eb61b0a83f\":{\"language\":{\"en\":{\"title\":\"Our Commitment\",\"icon\":\"fas fa-check\"},\"es\":{\"title\":\"Nuestro compromiso\",\"icon\":\"fas fa-check\"},\"ar\":{\"title\":\"\\u0627\\u0644\\u062a\\u0632\\u0627\\u0645\\u0646\\u0627\",\"icon\":\"fas fa-check\"},\"CN\":{\"title\":\"\\u4ef7\\u683c\\u5b9e\\u60e0\",\"icon\":\"fas fa-dollar-sign\"}},\"id\":\"643eb61b0a83f\"},\"643eb6396376b\":{\"language\":{\"en\":{\"title\":\"Join Us on this Journey\",\"icon\":\"fas fa-check\"},\"es\":{\"title\":\"\\u00danete a nosotros en este viaje\",\"icon\":\"fas fa-check\"},\"ar\":{\"title\":\"\\u0627\\u0646\\u0636\\u0645 \\u0625\\u0644\\u064a\\u0646\\u0627 \\u0641\\u064a \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0631\\u062d\\u0644\\u0629\",\"icon\":\"fas fa-check\"},\"CN\":{\"title\":\"\\u5145\\u503c\\u7075\\u6d3b\",\"icon\":\"far fa-credit-card\"}},\"id\":\"643eb6396376b\"},\"66cc1c1b8e66a\":{\"language\":{\"en\":{\"title\":null,\"icon\":null},\"es\":{\"title\":null,\"icon\":null},\"ar\":{\"title\":null,\"icon\":null},\"CN\":{\"title\":\"\\u4e13\\u5c5e\\u5ba2\\u670d\",\"icon\":\"far fa-comment-dots\"}},\"id\":\"66cc1c1b8e66a\"}}}', 1, NULL, NULL, '2024-08-26 04:36:14'),
(4, 'testimonials-section', '{\"language\":{\"en\":{\"title\":\"What Our Users Are Saying\",\"sub_heading\":\"Explore what our satisfied users have to say about their experiences with it.\"},\"es\":{\"title\":\"Lo que nuestras usuarias est\\u00e1n diciendo\",\"sub_heading\":\"Explore lo que nuestros usuarios satisfechos tienen que decir sobre sus experiencias con \\u00e9l.\"},\"ar\":{\"title\":\"\\u0645\\u0627 \\u064a\\u0642\\u0648\\u0644\\u0647 \\u0645\\u0633\\u062a\\u062e\\u062f\\u0645\\u0648\\u0646\\u0627\",\"sub_heading\":\"\\u0627\\u0643\\u062a\\u0634\\u0641 \\u0645\\u0627 \\u064a\\u0642\\u0648\\u0644\\u0647 \\u0645\\u0633\\u062a\\u062e\\u062f\\u0645\\u0648\\u0646\\u0627 \\u0627\\u0644\\u0631\\u0627\\u0636\\u0648\\u0646 \\u0639\\u0646 \\u062a\\u062c\\u0627\\u0631\\u0628\\u0647\\u0645 \\u0645\\u0639\\u0647.\"},\"CN\":{\"title\":\"11111111111\",\"sub_heading\":\"111111111\"}},\"items\":{\"643820a97ee03\":{\"language\":{\"en\":{\"name\":\"Sarah Williams\",\"designation\":\"Marketing Manager\",\"rating\":\"5\",\"details\":\"\\u201cStripCard has completely transformed the way we handle online transactions in our company. The security features are top-notch, and the ease of generating virtual cards makes our online purchases hassle-free. I highly recommend StripCard to anyone looking for a secure and convenient online payment solution.\\u201d\"},\"es\":{\"name\":\"Sara Williams\",\"designation\":\"Gerente de Mercadeo\",\"rating\":\"5\",\"details\":\"\\u201cStripCard ha transformado completamente la forma en que manejamos las transacciones en l\\u00ednea en nuestra empresa. Las caracter\\u00edsticas de seguridad son de primer nivel y la facilidad para generar tarjetas virtuales hace que nuestras compras en l\\u00ednea sean sencillas. Recomiendo ampliamente StripCard a cualquiera que busque una soluci\\u00f3n de pago en l\\u00ednea segura y conveniente\\u201d.\"},\"ar\":{\"name\":\"\\u0633\\u0627\\u0631\\u0629 \\u0648\\u064a\\u0644\\u064a\\u0627\\u0645\\u0632\",\"designation\":\"\\u0645\\u062f\\u064a\\u0631 \\u062a\\u0633\\u0648\\u064a\\u0642\",\"rating\":\"5\",\"details\":\"\\\"\\u0644\\u0642\\u062f \\u063a\\u064a\\u0631\\u062a StripCard \\u062a\\u0645\\u0627\\u0645\\u064b\\u0627 \\u0627\\u0644\\u0637\\u0631\\u064a\\u0642\\u0629 \\u0627\\u0644\\u062a\\u064a \\u0646\\u062a\\u0639\\u0627\\u0645\\u0644 \\u0628\\u0647\\u0627 \\u0645\\u0639 \\u0627\\u0644\\u0645\\u0639\\u0627\\u0645\\u0644\\u0627\\u062a \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a \\u0641\\u064a \\u0634\\u0631\\u0643\\u062a\\u0646\\u0627. \\u062a\\u062a\\u0645\\u064a\\u0632 \\u0645\\u064a\\u0632\\u0627\\u062a \\u0627\\u0644\\u0623\\u0645\\u0627\\u0646 \\u0628\\u0623\\u0646\\u0647\\u0627 \\u0645\\u0646 \\u0627\\u0644\\u0637\\u0631\\u0627\\u0632 \\u0627\\u0644\\u0623\\u0648\\u0644\\u060c \\u0643\\u0645\\u0627 \\u0623\\u0646 \\u0633\\u0647\\u0648\\u0644\\u0629 \\u0625\\u0646\\u0634\\u0627\\u0621 \\u0628\\u0637\\u0627\\u0642\\u0627\\u062a \\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u064a\\u0629 \\u062a\\u062c\\u0639\\u0644 \\u0639\\u0645\\u0644\\u064a\\u0627\\u062a \\u0627\\u0644\\u0634\\u0631\\u0627\\u0621 \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a \\u062e\\u0627\\u0644\\u064a\\u0629 \\u0645\\u0646 \\u0627\\u0644\\u0645\\u062a\\u0627\\u0639\\u0628. \\u0623\\u0648\\u0635\\u064a \\u0628\\u0634\\u062f\\u0629 \\u0628\\u0640 StripCard \\u0644\\u0623\\u064a \\u0634\\u062e\\u0635 \\u064a\\u0628\\u062d\\u062b \\u0639\\u0646 \\u062d\\u0644 \\u0622\\u0645\\u0646 \\u0648\\u0645\\u0631\\u064a\\u062d \\u0644\\u0644\\u062f\\u0641\\u0639 \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a.\"}},\"id\":\"643820a97ee03\",\"image\":\"2e7cc167-a7cd-4031-a97c-04ec1db1c445.webp\"},\"64382127cf532\":{\"language\":{\"en\":{\"name\":\"John Smith\",\"designation\":\"Small Business Owner\",\"rating\":\"4\",\"details\":\"\\u201cAs a small business owner, StripCard has been a game-changer. It allows me to offer convenient payment options to my clients while generating an extra revenue stream. The one-time-use codes provide peace of mind, knowing that my transactions are secure. StripCard is a win-win for both my clients and my business.\\u201d\"},\"es\":{\"name\":\"John Smith\",\"designation\":\"Propietario de un peque\\u00f1o negocio\",\"rating\":\"4\",\"details\":\"\\u201cComo propietario de una peque\\u00f1a empresa, StripCard ha cambiado las reglas del juego. Me permite ofrecer opciones de pago convenientes a mis clientes y al mismo tiempo generar un flujo de ingresos adicional. Los c\\u00f3digos de un solo uso brindan la tranquilidad de saber que mis transacciones son seguras. StripCard es beneficioso tanto para mis clientes como para mi negocio\\u201d.\"},\"ar\":{\"name\":\"\\u062c\\u0648\\u0646 \\u0633\\u0645\\u064a\\u062b\",\"designation\":\"\\u0635\\u0627\\u062d\\u0628 \\u0645\\u0634\\u0631\\u0648\\u0639 \\u0635\\u063a\\u064a\\u0631\",\"rating\":\"4\",\"details\":\"\\\"\\u0628\\u0627\\u0639\\u062a\\u0628\\u0627\\u0631\\u0647\\u0627 \\u0645\\u0627\\u0644\\u0643\\u064b\\u0627 \\u0644\\u0634\\u0631\\u0643\\u0629 \\u0635\\u063a\\u064a\\u0631\\u0629\\u060c \\u0641\\u0642\\u062f \\u063a\\u064a\\u0631\\u062a StripCard \\u0642\\u0648\\u0627\\u0639\\u062f \\u0627\\u0644\\u0644\\u0639\\u0628\\u0629. \\u0641\\u0647\\u0648 \\u064a\\u062a\\u064a\\u062d \\u0644\\u064a \\u062a\\u0642\\u062f\\u064a\\u0645 \\u062e\\u064a\\u0627\\u0631\\u0627\\u062a \\u062f\\u0641\\u0639 \\u0645\\u0646\\u0627\\u0633\\u0628\\u0629 \\u0644\\u0639\\u0645\\u0644\\u0627\\u0626\\u064a \\u0645\\u0639 \\u062a\\u0648\\u0644\\u064a\\u062f \\u062a\\u062f\\u0641\\u0642 \\u0625\\u0636\\u0627\\u0641\\u064a \\u0644\\u0644\\u0625\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a. \\u062a\\u0648\\u0641\\u0631 \\u0631\\u0645\\u0648\\u0632 \\u0627\\u0644\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0644\\u0645\\u0631\\u0629 \\u0648\\u0627\\u062d\\u062f\\u0629 \\u0631\\u0627\\u062d\\u0629 \\u0627\\u0644\\u0628\\u0627\\u0644\\u060c \\u0645\\u0639 \\u0627\\u0644\\u0639\\u0644\\u0645 \\u0623\\u0646 \\u0645\\u0639\\u0627\\u0645\\u0644\\u0627\\u062a\\u064a \\u0622\\u0645\\u0646\\u0629. \\u064a\\u0639\\u062f StripCard \\u0645\\u0631\\u0628\\u062d\\u064b\\u0627 \\u0644\\u0643\\u0644 \\u0645\\u0646 \\u0639\\u0645\\u0644\\u0627\\u0626\\u064a \\u0648\\u0639\\u0645\\u0644\\u064a.\"}},\"id\":\"64382127cf532\",\"image\":\"11a9a3a2-3061-4bac-b7ae-ef630df7f563.webp\"},\"6438252b52033\":{\"language\":{\"en\":{\"name\":\"Lisa Rodriguez\",\"designation\":\"Online Shopper\",\"rating\":\"5\",\"details\":\"\\u201cShopping online has never been this secure and straightforward. StripCard\\u2019s unique codes make me feel confident about the safety of my transactions. It\\u2019s like having an extra layer of protection. I can\\u2019t imagine going back to using my regular card for online purchases. StripCard has won me over!\\u201d\"},\"es\":{\"name\":\"Lisa Rodriguez\",\"designation\":\"Comprador en l\\u00ednea\",\"rating\":\"5\",\"details\":\"\\u201cComprar online nunca ha sido tan seguro y sencillo. Los c\\u00f3digos \\u00fanicos de StripCard me hacen sentir seguro sobre la seguridad de mis transacciones. Es como tener una capa extra de protecci\\u00f3n. No me imagino volver a utilizar mi tarjeta habitual para compras online. \\u00a1StripCard me ha convencido!\\u201d\"},\"ar\":{\"name\":\"\\u0644\\u064a\\u0632\\u0627 \\u0631\\u0648\\u062f\\u0631\\u064a\\u062c\\u064a\\u0632\",\"designation\":\"\\u0627\\u0644\\u0634\\u0631\\u0627\\u0621 \\u0639\\u0644\\u0627\\u0646\\u062a\\u0631\\u0646\\u064a\\u062a\",\"rating\":\"5\",\"details\":\"\\\"\\u0644\\u0645 \\u064a\\u0643\\u0646 \\u0627\\u0644\\u062a\\u0633\\u0648\\u0642 \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a \\u0628\\u0647\\u0630\\u0647 \\u0627\\u0644\\u062f\\u0631\\u062c\\u0629 \\u0645\\u0646 \\u0627\\u0644\\u0623\\u0645\\u0627\\u0646 \\u0648\\u0627\\u0644\\u0628\\u0633\\u0627\\u0637\\u0629 \\u0645\\u0646 \\u0642\\u0628\\u0644. \\u0631\\u0645\\u0648\\u0632 StripCard \\u0627\\u0644\\u0641\\u0631\\u064a\\u062f\\u0629 \\u062a\\u062c\\u0639\\u0644\\u0646\\u064a \\u0623\\u0634\\u0639\\u0631 \\u0628\\u0627\\u0644\\u062b\\u0642\\u0629 \\u0628\\u0634\\u0623\\u0646 \\u0633\\u0644\\u0627\\u0645\\u0629 \\u0645\\u0639\\u0627\\u0645\\u0644\\u0627\\u062a\\u064a. \\u0625\\u0646\\u0647 \\u0645\\u062b\\u0644 \\u0648\\u062c\\u0648\\u062f \\u0637\\u0628\\u0642\\u0629 \\u0625\\u0636\\u0627\\u0641\\u064a\\u0629 \\u0645\\u0646 \\u0627\\u0644\\u062d\\u0645\\u0627\\u064a\\u0629. \\u0644\\u0627 \\u0623\\u0633\\u062a\\u0637\\u064a\\u0639 \\u0623\\u0646 \\u0623\\u062a\\u062e\\u064a\\u0644 \\u0627\\u0644\\u0639\\u0648\\u062f\\u0629 \\u0625\\u0644\\u0649 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0628\\u0637\\u0627\\u0642\\u062a\\u064a \\u0627\\u0644\\u0639\\u0627\\u062f\\u064a\\u0629 \\u0644\\u0639\\u0645\\u0644\\u064a\\u0627\\u062a \\u0627\\u0644\\u0634\\u0631\\u0627\\u0621 \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a. \\u0644\\u0642\\u062f \\u0641\\u0627\\u0632 \\u0628\\u064a StripCard!\"}},\"id\":\"6438252b52033\",\"image\":\"e0140d7d-0a56-4201-b99b-27efc561f565.webp\"}}}', 1, NULL, NULL, '2024-08-26 04:31:39'),
(5, 'contact', '{\"language\":{\"en\":{\"title\":\"Contact Us\",\"heading\":\"Feel Free To Get In Touch With Us\",\"infomation\":\"We\\u2019d love to hear from you! If you have any questions or need assistance, please don\\u2019t hesitate to get in touch with us using the following contact information:\",\"address\":\"1234 Main Street City, State 56789 USA\",\"phone\":\"+1 (123) 456-7890\",\"email\":\"info@example.com\"},\"es\":{\"title\":\"Contacta con nosotra\",\"heading\":\"Si\\u00e9ntase libre de ponerse en contacto con nosotras\",\"infomation\":\"\\u00a1Nos encantar\\u00eda saber de usted! Si tiene alguna pregunta o necesita ayuda, no dude en ponerse en contacto con nosotros utilizando la siguiente informaci\\u00f3n de contacto:\",\"address\":\"1234 Main Street Ciudad, Estado 56789 EE. UU.\",\"phone\":\"+1 (123) 456-7890\",\"email\":\"info@example.com\"},\"ar\":{\"title\":\"\\u0627\\u062a\\u0635\\u0644 \\u0628\\u0646\\u0627\",\"heading\":\"\\u0644\\u0627 \\u062a\\u062a\\u0631\\u062f\\u062f \\u0641\\u064a \\u0627\\u0644\\u062a\\u0648\\u0627\\u0635\\u0644 \\u0645\\u0639\\u0646\\u0627\",\"infomation\":\"\\u0646\\u062d\\u0646 \\u0646\\u062d\\u0628 \\u0623\\u0646 \\u0646\\u0633\\u0645\\u0639 \\u0645\\u0646\\u0643! \\u0625\\u0630\\u0627 \\u0643\\u0627\\u0646 \\u0644\\u062f\\u064a\\u0643 \\u0623\\u064a \\u0623\\u0633\\u0626\\u0644\\u0629 \\u0623\\u0648 \\u0643\\u0646\\u062a \\u0628\\u062d\\u0627\\u062c\\u0629 \\u0625\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0633\\u0627\\u0639\\u062f\\u0629\\u060c \\u0641\\u0644\\u0627 \\u062a\\u062a\\u0631\\u062f\\u062f \\u0641\\u064a \\u0627\\u0644\\u0627\\u062a\\u0635\\u0627\\u0644 \\u0628\\u0646\\u0627 \\u0628\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0627\\u0644\\u0627\\u062a\\u0635\\u0627\\u0644 \\u0627\\u0644\\u062a\\u0627\\u0644\\u064a\\u0629:\",\"address\":\"1234 \\u0645\\u064a\\u0646 \\u0633\\u062a\\u0631\\u064a\\u062a \\u0633\\u064a\\u062a\\u064a\\u060c \\u0627\\u0644\\u0648\\u0644\\u0627\\u064a\\u0629 56789 \\u0627\\u0644\\u0648\\u0644\\u0627\\u064a\\u0627\\u062a \\u0627\\u0644\\u0645\\u062a\\u062d\\u062f\\u0629 \\u0627\\u0644\\u0623\\u0645\\u0631\\u064a\\u0643\\u064a\\u0629\",\"phone\":\"+1 (123) 456-7890\",\"email\":\"info@example.com\"}}}', 1, NULL, NULL, '2023-11-06 04:51:38'),
(6, 'footer-section', '{\"language\":{\"en\":{\"footer_text\":\"Copyright \\u00a9 2023 , All Rights Reserved.\",\"details\":\"Thank you for choosing StripCard as your trusted partner for secure online transactions. We are committed to providing you with a seamless and secure experience.\"},\"es\":{\"footer_text\":\"Copyright \\u00a9 2023, Todos los derechos reservados.\",\"details\":\"Gracias por elegir StripCard como su socio de confianza para transacciones seguras en l\\u00ednea. Estamos comprometidos a brindarle una experiencia fluida y segura.\"},\"ar\":{\"footer_text\":\"\\u062d\\u0642\\u0648\\u0642 \\u0627\\u0644\\u0646\\u0634\\u0631 \\u00a9 2023\\u060c \\u062c\\u0645\\u064a\\u0639 \\u0627\\u0644\\u062d\\u0642\\u0648\\u0642 \\u0645\\u062d\\u0641\\u0648\\u0638\\u0629.\",\"details\":\"\\u0646\\u0634\\u0643\\u0631\\u0643 \\u0639\\u0644\\u0649 \\u0627\\u062e\\u062a\\u064a\\u0627\\u0631 StripCard \\u0643\\u0634\\u0631\\u064a\\u0643 \\u0645\\u0648\\u062b\\u0648\\u0642 \\u0628\\u0647 \\u0644\\u0625\\u062c\\u0631\\u0627\\u0621 \\u0645\\u0639\\u0627\\u0645\\u0644\\u0627\\u062a \\u0622\\u0645\\u0646\\u0629 \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a. \\u0646\\u062d\\u0646 \\u0645\\u0644\\u062a\\u0632\\u0645\\u0648\\u0646 \\u0628\\u062a\\u0632\\u0648\\u064a\\u062f\\u0643 \\u0628\\u062a\\u062c\\u0631\\u0628\\u0629 \\u0633\\u0644\\u0633\\u0629 \\u0648\\u0622\\u0645\\u0646\\u0629.\"},\"CN\":{\"footer_text\":\"111111111\",\"details\":\"11111\"}},\"items\":{\"643ec92bddaae\":{\"language\":{\"en\":{\"name\":\"Facebook\",\"social_icon\":\"fab fa-facebook\",\"link\":\"https:\\/\\/facebook.com\\/\"},\"es\":{\"name\":\"Facebook\",\"social_icon\":\"fab fa-facebook\",\"link\":\"https:\\/\\/facebook.com\\/\"},\"ar\":{\"name\":\"\\u0641\\u064a\\u0633\\u0628\\u0648\\u0643\",\"social_icon\":\"fab fa-facebook\",\"link\":\"https:\\/\\/facebook.com\\/\"}},\"id\":\"643ec92bddaae\"},\"643ec94c4769c\":{\"language\":{\"en\":{\"name\":\"Instagram\",\"social_icon\":\"fab fa-instagram\",\"link\":\"https:\\/\\/www.instagram.com\\/\"},\"es\":{\"name\":\"Instagram\",\"social_icon\":\"fab fa-instagram\",\"link\":\"https:\\/\\/www.instagram.com\\/\"},\"ar\":{\"name\":\"\\u0627\\u0646\\u0633\\u062a\\u063a\\u0631\\u0627\\u0645\",\"social_icon\":\"fab fa-instagram\",\"link\":\"https:\\/\\/www.instagram.com\\/\"}},\"id\":\"643ec94c4769c\"},\"643ec96763812\":{\"language\":{\"en\":{\"name\":\"Twitter\",\"social_icon\":\"fab fa-twitter\",\"link\":\"https:\\/\\/twitter.com\\/login\"},\"es\":{\"name\":\"Twitter\",\"social_icon\":\"fab fa-twitter\",\"link\":\"https:\\/\\/twitter.com\\/login\"},\"ar\":{\"name\":\"\\u062a\\u0648\\u064a\\u062a\\u0631\",\"social_icon\":\"fab fa-twitter\",\"link\":\"https:\\/\\/twitter.com\\/login\"}},\"id\":\"643ec96763812\"}}}', 1, NULL, NULL, '2024-08-26 04:33:25'),
(7, 'our-features', '{\"language\":{\"en\":{\"heading\":\"Our Features\",\"sub_heading\":\"Redefining Online Transactions\",\"details\":\"Discover the unparalleled features that make StripCard the go-to platform for secure, convenient, and efficient online transactions. With our virtual credit cards, you can seamlessly shop, subscribe, and transact online, all with just a few clicks.\"},\"es\":{\"heading\":\"Nuestras caracter\\u00edsticas\",\"sub_heading\":\"Redefiniendo las transacciones en l\\u00ednea\",\"details\":\"Descubra las caracter\\u00edsticas incomparables que hacen de StripCard la plataforma ideal para transacciones en l\\u00ednea seguras, convenientes y eficientes. Con nuestras tarjetas de cr\\u00e9dito virtuales, puede comprar, suscribirse y realizar transacciones en l\\u00ednea sin problemas, todo con solo unos pocos clics.\"},\"ar\":{\"heading\":\"\\u0645\\u0645\\u064a\\u0632\\u0627\\u062a\\u0646\\u0627\",\"sub_heading\":\"\\u0625\\u0639\\u0627\\u062f\\u0629 \\u062a\\u0639\\u0631\\u064a\\u0641 \\u0627\\u0644\\u0645\\u0639\\u0627\\u0645\\u0644\\u0627\\u062a \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a\",\"details\":\"\\u0627\\u0643\\u062a\\u0634\\u0641 \\u0627\\u0644\\u0645\\u064a\\u0632\\u0627\\u062a \\u0627\\u0644\\u062a\\u064a \\u0644\\u0627 \\u0645\\u062b\\u064a\\u0644 \\u0644\\u0647\\u0627 \\u0648\\u0627\\u0644\\u062a\\u064a \\u062a\\u062c\\u0639\\u0644 StripCard \\u0645\\u0646\\u0635\\u0629 \\u0627\\u0644\\u0627\\u0646\\u062a\\u0642\\u0627\\u0644 \\u0644\\u0644\\u0645\\u0639\\u0627\\u0645\\u0644\\u0627\\u062a \\u0627\\u0644\\u0622\\u0645\\u0646\\u0629 \\u0648\\u0627\\u0644\\u0645\\u0631\\u064a\\u062d\\u0629 \\u0648\\u0627\\u0644\\u0641\\u0639\\u0627\\u0644\\u0629 \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a. \\u0628\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0628\\u0637\\u0627\\u0642\\u0627\\u062a \\u0627\\u0644\\u0627\\u0626\\u062a\\u0645\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u064a\\u0629 \\u0627\\u0644\\u062e\\u0627\\u0635\\u0629 \\u0628\\u0646\\u0627\\u060c \\u064a\\u0645\\u0643\\u0646\\u0643 \\u0627\\u0644\\u062a\\u0633\\u0648\\u0642 \\u0648\\u0627\\u0644\\u0627\\u0634\\u062a\\u0631\\u0627\\u0643 \\u0648\\u0627\\u0644\\u0645\\u0639\\u0627\\u0645\\u0644\\u0627\\u062a \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a \\u0628\\u0633\\u0644\\u0627\\u0633\\u0629\\u060c \\u0643\\u0644 \\u0630\\u0644\\u0643 \\u0628\\u0628\\u0636\\u0639 \\u0646\\u0642\\u0631\\u0627\\u062a \\u0641\\u0642\\u0637.\"},\"CN\":{\"heading\":\"\\u865a\\u62df\\u4fe1\\u7528\\u5361\",\"sub_heading\":\"\\u5168\\u7403\\u7528\\u6237\\u5747\\u53ef\\u8f7b\\u677e\\u6ce8\\u518c\\u4f7f\\u7528\",\"details\":\"\\u65e0\\u9700\\u7e41\\u7410\\u6b65\\u9aa4\\uff0c\\u6ce8\\u518c\\u5373\\u53ef\\u5f00\\u5361\"}},\"items\":{\"643eb72c2c42f\":{\"language\":{\"en\":{\"title\":\"Virtual Credit Cards\",\"sub_title\":\"Say goodbye to the limitations of physical credit cards.\"},\"es\":{\"title\":\"Tarjetas de cr\\u00e9dito virtuales\",\"sub_title\":\"Dile adi\\u00f3s a las limitaciones de las tarjetas de cr\\u00e9dito f\\u00edsicas.\"},\"ar\":{\"title\":\"\\u0628\\u0637\\u0627\\u0642\\u0627\\u062a \\u0627\\u0644\\u0627\\u0626\\u062a\\u0645\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u064a\\u0629\",\"sub_title\":\"\\u0642\\u0644 \\u0648\\u062f\\u0627\\u0639\\u064b\\u0627 \\u0644\\u0644\\u0642\\u064a\\u0648\\u062f \\u0627\\u0644\\u0645\\u0641\\u0631\\u0648\\u0636\\u0629 \\u0639\\u0644\\u0649 \\u0628\\u0637\\u0627\\u0642\\u0627\\u062a \\u0627\\u0644\\u0627\\u0626\\u062a\\u0645\\u0627\\u0646 \\u0627\\u0644\\u0645\\u0627\\u062f\\u064a\\u0629.\"},\"CN\":{\"title\":\"7X24\\u5c0f\\u65f6\\u5feb\\u901f\\u6ce8\\u518c\",\"sub_title\":\"\\u5728\\u7ebf\\u5373\\u53ef\\u63d0\\u4ea4\\u8d44\\u6599\\uff0c\\u540e\\u53f0\\u6781\\u901f\\u5ba1\\u6838\"}},\"id\":\"643eb72c2c42f\"},\"643eb745b1758\":{\"language\":{\"en\":{\"title\":\"Cutting-Edge Security\",\"sub_title\":\"We employ state-of-the-art encryption and security protocols to ensure your financial data is protected at all times.\"},\"es\":{\"title\":\"Seguridad de vanguardia\",\"sub_title\":\"Empleamos protocolos de seguridad y cifrado de \\u00faltima generaci\\u00f3n para garantizar que sus datos financieros est\\u00e9n protegidos en todo momento.\"},\"ar\":{\"title\":\"\\u0627\\u0644\\u0623\\u0645\\u0646 \\u0627\\u0644\\u0645\\u062a\\u0637\\u0648\\u0631\",\"sub_title\":\"\\u0646\\u062d\\u0646 \\u0646\\u0633\\u062a\\u062e\\u062f\\u0645 \\u0623\\u062d\\u062f\\u062b \\u0628\\u0631\\u0648\\u062a\\u0648\\u0643\\u0648\\u0644\\u0627\\u062a \\u0627\\u0644\\u062a\\u0634\\u0641\\u064a\\u0631 \\u0648\\u0627\\u0644\\u0623\\u0645\\u0627\\u0646 \\u0644\\u0636\\u0645\\u0627\\u0646 \\u062d\\u0645\\u0627\\u064a\\u0629 \\u0628\\u064a\\u0627\\u0646\\u0627\\u062a\\u0643 \\u0627\\u0644\\u0645\\u0627\\u0644\\u064a\\u0629 \\u0641\\u064a \\u062c\\u0645\\u064a\\u0639 \\u0627\\u0644\\u0623\\u0648\\u0642\\u0627\\u062a.\"},\"CN\":{\"title\":\"\\u8f7b\\u677e\\u4f7f\\u7528\",\"sub_title\":\"\\u652f\\u6301\\u5728FaceBook\\u3001OpenAi\\u3001Amazon\\u3001tiktok\\u7b49\\u5e73\\u53f0\\u4f7f\\u7528\"}},\"id\":\"643eb745b1758\"},\"643eb77aa0589\":{\"language\":{\"en\":{\"title\":\"Transparent Fee Structure\",\"sub_title\":\"It maintains a straightforward fee structure, ensuring you always know what to expect, with no surprises.\"},\"es\":{\"title\":\"Estructura de tarifas transparente\",\"sub_title\":\"Mantiene una estructura de tarifas sencilla, lo que garantiza que siempre sepa qu\\u00e9 esperar, sin sorpresas.\"},\"ar\":{\"title\":\"\\u0647\\u064a\\u0643\\u0644 \\u0631\\u0633\\u0648\\u0645 \\u0634\\u0641\\u0627\\u0641\",\"sub_title\":\"\\u0625\\u0646\\u0647 \\u064a\\u062d\\u0627\\u0641\\u0638 \\u0639\\u0644\\u0649 \\u0647\\u064a\\u0643\\u0644 \\u0631\\u0633\\u0648\\u0645 \\u0645\\u0628\\u0627\\u0634\\u0631\\u060c \\u0645\\u0645\\u0627 \\u064a\\u0636\\u0645\\u0646 \\u0623\\u0646\\u0643 \\u062a\\u0639\\u0631\\u0641 \\u062f\\u0627\\u0626\\u0645\\u064b\\u0627 \\u0645\\u0627 \\u064a\\u0645\\u0643\\u0646 \\u062a\\u0648\\u0642\\u0639\\u0647\\u060c \\u062f\\u0648\\u0646 \\u0623\\u064a \\u0645\\u0641\\u0627\\u062c\\u0622\\u062a.\"},\"CN\":{\"title\":\"\\u5361\\u6bb5\\u4e30\\u5bcc\",\"sub_title\":\"\\u591a\\u4e2a\\u5730\\u533a\\u7684\\u591a\\u79cd\\u5361\\u6bb5\\uff0c\\u6ee1\\u8db3\\u60a8\\u7684\\u591a\\u6837\\u5316\\u9700\\u6c42\"}},\"id\":\"643eb77aa0589\"},\"643eb794b9daa\":{\"language\":{\"en\":{\"title\":\"User-Friendly Interface\",\"sub_title\":\"Our platform boasts an intuitive, user-friendly interface, designed for both beginners and experienced users.\"},\"es\":{\"title\":\"Interfaz amigable\",\"sub_title\":\"Nuestra plataforma cuenta con una interfaz intuitiva y f\\u00e1cil de usar, dise\\u00f1ada tanto para principiantes como para usuarios experimentados.\"},\"ar\":{\"title\":\"\\u0648\\u0627\\u062c\\u0647\\u0629 \\u0633\\u0647\\u0644\\u0629 \\u0627\\u0644\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\",\"sub_title\":\"\\u062a\\u062a\\u0645\\u064a\\u0632 \\u0645\\u0646\\u0635\\u062a\\u0646\\u0627 \\u0628\\u0648\\u0627\\u062c\\u0647\\u0629 \\u0628\\u062f\\u064a\\u0647\\u064a\\u0629 \\u0648\\u0633\\u0647\\u0644\\u0629 \\u0627\\u0644\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\\u060c \\u0645\\u0635\\u0645\\u0645\\u0629 \\u0644\\u0643\\u0644 \\u0645\\u0646 \\u0627\\u0644\\u0645\\u0633\\u062a\\u062e\\u062f\\u0645\\u064a\\u0646 \\u0627\\u0644\\u0645\\u0628\\u062a\\u062f\\u0626\\u064a\\u0646 \\u0648\\u0630\\u0648\\u064a \\u0627\\u0644\\u062e\\u0628\\u0631\\u0629.\"},\"CN\":{\"title\":\"\\u72ec\\u7acb\\u540e\\u53f0\\u8f7b\\u677e\\u7ba1\\u7406\",\"sub_title\":\"\\u5145\\u503c\\u3001\\u5f00\\u5361\\u3001\\u4ea4\\u6613\\u8bb0\\u5f55\\u67e5\\u8be2\\u90fd\\u53ef\\u4ee5\\u5728\\u540e\\u53f0\\u5b8c\\u6210\"}},\"id\":\"643eb794b9daa\"}}}', 1, NULL, NULL, '2024-08-26 04:21:08'),
(8, 'work-section', '{\"language\":{\"en\":{\"title\":\"How It is Work\",\"sub_title\":\"Flow Our Step For Create Your Accounttest\"},\"es\":{\"title\":\"como funciona\",\"sub_title\":\"Fluya nuestro paso para crear su cuenta.\"},\"ar\":{\"title\":\"\\u0643\\u064a\\u0641 \\u064a\\u062a\\u0645 \\u0627\\u0644\\u0639\\u0645\\u0644\",\"sub_title\":\"\\u0627\\u062a\\u0628\\u0639 \\u062e\\u0637\\u0648\\u062a\\u0646\\u0627 \\u0644\\u0625\\u0646\\u0634\\u0627\\u0621 \\u062d\\u0633\\u0627\\u0628\\u0643\"},\"CN\":{\"title\":\"\\u865a\\u62df\\u5361\\u5e73\\u53f0\",\"sub_title\":\"\\u7b80\\u53553\\u6b65\\u65e2\\u53ef\\u4f7f\\u7528\"}},\"items\":{\"643eb81b49cb8\":{\"language\":{\"en\":{\"name\":\"Sign Up\",\"icon\":\"las la-user-circle\",\"details\":\"Begin by signing up on the StripCard platform. Provide the required information to create your account.\"},\"es\":{\"name\":\"Inscribirse\",\"icon\":\"las la-user-circle\",\"details\":\"Comience registr\\u00e1ndose en la plataforma StripCard. Proporcione la informaci\\u00f3n requerida para crear su cuenta.\"},\"ar\":{\"name\":\"\\u0627\\u0634\\u062a\\u0631\\u0627\\u0643\",\"icon\":\"las la-user-circle\",\"details\":\"\\u0627\\u0628\\u062f\\u0623 \\u0628\\u0627\\u0644\\u062a\\u0633\\u062c\\u064a\\u0644 \\u0641\\u064a \\u0645\\u0646\\u0635\\u0629 StripCard. \\u062a\\u0642\\u062f\\u064a\\u0645 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0627\\u0644\\u0645\\u0637\\u0644\\u0648\\u0628\\u0629 \\u0644\\u0625\\u0646\\u0634\\u0627\\u0621 \\u062d\\u0633\\u0627\\u0628\\u0643.\"},\"CN\":{\"name\":\"\\u6ce8\\u518c\\u5e73\\u53f0\",\"icon\":\"fas fa-address-card\",\"details\":\"\\u586b\\u5199\\u8d44\\u6599\\u6ce8\\u518c\\u5e73\\u53f0\"}},\"id\":\"643eb81b49cb8\"},\"643eb86734f8f\":{\"language\":{\"en\":{\"name\":\"Loading Funds\",\"icon\":\"las la-credit-card\",\"details\":\"This can be done through various payment methods, ensuring flexibility and convenience.\"},\"es\":{\"name\":\"Cargando fondos\",\"icon\":\"las la-credit-card\",\"details\":\"Esto se puede hacer a trav\\u00e9s de varios m\\u00e9todos de pago, lo que garantiza flexibilidad y comodidad.\"},\"ar\":{\"name\":\"\\u062a\\u062d\\u0645\\u064a\\u0644 \\u0627\\u0644\\u0623\\u0645\\u0648\\u0627\\u0644\",\"icon\":\"las la-credit-card\",\"details\":\"\\u0648\\u064a\\u0645\\u0643\\u0646 \\u0627\\u0644\\u0642\\u064a\\u0627\\u0645 \\u0628\\u0630\\u0644\\u0643 \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u0637\\u0631\\u0642 \\u0627\\u0644\\u062f\\u0641\\u0639 \\u0627\\u0644\\u0645\\u062e\\u062a\\u0644\\u0641\\u0629\\u060c \\u0645\\u0645\\u0627 \\u064a\\u0636\\u0645\\u0646 \\u0627\\u0644\\u0645\\u0631\\u0648\\u0646\\u0629 \\u0648\\u0627\\u0644\\u0631\\u0627\\u062d\\u0629.\"},\"CN\":{\"name\":\"\\u8d26\\u6237\\u5145\\u503c\",\"icon\":\"fas fa-dollar-sign\",\"details\":\"\\u5728\\u7ebf\\u5145\\u503c\\u3001\\u5ba2\\u670d\\u5145\\u503c\"}},\"id\":\"643eb86734f8f\"},\"643eb8a0bb232\":{\"language\":{\"en\":{\"name\":\"Apply Virtual Card\",\"icon\":\"las la-paper-plane\",\"details\":\"It mirrors your traditional credit card, allowing you to conduct online transactions securely\"},\"es\":{\"name\":\"Aplicar Tarjeta Virtual\",\"icon\":\"las la-paper-plane\",\"details\":\"Refleja su tarjeta de cr\\u00e9dito tradicional, permiti\\u00e9ndole realizar transacciones en l\\u00ednea de forma segura\"},\"ar\":{\"name\":\"\\u062a\\u0637\\u0628\\u064a\\u0642 \\u0627\\u0644\\u0628\\u0637\\u0627\\u0642\\u0629 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u064a\\u0629\",\"icon\":\"las la-paper-plane\",\"details\":\"\\u0625\\u0646\\u0647\\u0627 \\u062a\\u0639\\u0643\\u0633 \\u0628\\u0637\\u0627\\u0642\\u062a\\u0643 \\u0627\\u0644\\u0627\\u0626\\u062a\\u0645\\u0627\\u0646\\u064a\\u0629 \\u0627\\u0644\\u062a\\u0642\\u0644\\u064a\\u062f\\u064a\\u0629\\u060c \\u0645\\u0645\\u0627 \\u064a\\u0633\\u0645\\u062d \\u0644\\u0643 \\u0628\\u0625\\u062c\\u0631\\u0627\\u0621 \\u0627\\u0644\\u0645\\u0639\\u0627\\u0645\\u0644\\u0627\\u062a \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a \\u0628\\u0634\\u0643\\u0644 \\u0622\\u0645\\u0646\"},\"CN\":{\"name\":\"\\u5f00\\u5361\\u4f7f\\u7528\",\"icon\":\"fab fa-cc-visa\",\"details\":\"\\u7533\\u8bf7\\u5361\\u7247\\u65e2\\u53ef\\u4f7f\\u7528\"}},\"id\":\"643eb8a0bb232\"}}}', 1, NULL, NULL, '2024-08-26 04:26:40'),
(9, 'service-section', '{\"language\":{\"en\":{\"heading\":\"Service Provide\",\"sub_heading\":\"Our Upheld Administrations What We Serve To You\"},\"es\":{\"heading\":\"Servicio proporciona\",\"sub_heading\":\"Nuestras administraciones respaldadas Lo que le servimos\"},\"ar\":{\"heading\":\"\\u062a\\u0642\\u062f\\u064a\\u0645 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0629\",\"sub_heading\":\"\\u0625\\u062f\\u0627\\u0631\\u0627\\u062a\\u0646\\u0627 \\u0627\\u0644\\u0645\\u0639\\u062a\\u0645\\u062f\\u0629 \\u0645\\u0627 \\u0646\\u062e\\u062f\\u0645\\u0647 \\u0644\\u0643\"},\"CN\":{\"heading\":\"11111111\",\"sub_heading\":\"111111111\"}},\"items\":{\"6436efd57d87f\":{\"language\":{\"en\":{\"title\":\"Virtual Credit Card Creation\",\"sub_title\":\"Secure and convenient virtual credit card generation for online transactions, ensuring your financial data remains protected.\"},\"es\":{\"title\":\"Creaci\\u00f3n de tarjetas de cr\\u00e9dito virtuales\",\"sub_title\":\"Generaci\\u00f3n segura y conveniente de tarjetas de cr\\u00e9dito virtuales para transacciones en l\\u00ednea, lo que garantiza que sus datos financieros permanezcan protegidos.\"},\"ar\":{\"title\":\"\\u0625\\u0646\\u0634\\u0627\\u0621 \\u0628\\u0637\\u0627\\u0642\\u0629 \\u0627\\u0644\\u0627\\u0626\\u062a\\u0645\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u064a\\u0629\",\"sub_title\":\"\\u0625\\u0646\\u0634\\u0627\\u0621 \\u0628\\u0637\\u0627\\u0642\\u0627\\u062a \\u0627\\u0626\\u062a\\u0645\\u0627\\u0646 \\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u064a\\u0629 \\u0622\\u0645\\u0646\\u0629 \\u0648\\u0645\\u0631\\u064a\\u062d\\u0629 \\u0644\\u0644\\u0645\\u0639\\u0627\\u0645\\u0644\\u0627\\u062a \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a\\u060c \\u0645\\u0645\\u0627 \\u064a\\u0636\\u0645\\u0646 \\u0628\\u0642\\u0627\\u0621 \\u0628\\u064a\\u0627\\u0646\\u0627\\u062a\\u0643 \\u0627\\u0644\\u0645\\u0627\\u0644\\u064a\\u0629 \\u0645\\u062d\\u0645\\u064a\\u0629.\"}},\"id\":\"6436efd57d87f\",\"image\":\"346b95cb-e7fe-431f-be49-6ca01c362dee.webp\"},\"6436efff890e3\":{\"language\":{\"en\":{\"title\":\"Entrepreneurial Partner Program\",\"sub_title\":\"Opportunities for entrepreneurs to expand their revenue streams by offering virtual credit card services to clients.\"},\"es\":{\"title\":\"Programa de Socios Emprendedores\",\"sub_title\":\"Oportunidades para que los empresarios ampl\\u00eden sus fuentes de ingresos ofreciendo servicios de tarjetas de cr\\u00e9dito virtuales a los clientes.\"},\"ar\":{\"title\":\"\\u0628\\u0631\\u0646\\u0627\\u0645\\u062c \\u0634\\u0631\\u0643\\u0627\\u0621 \\u0631\\u064a\\u0627\\u062f\\u0629 \\u0627\\u0644\\u0623\\u0639\\u0645\\u0627\\u0644\",\"sub_title\":\"\\u0641\\u0631\\u0635 \\u0644\\u0631\\u0648\\u0627\\u062f \\u0627\\u0644\\u0623\\u0639\\u0645\\u0627\\u0644 \\u0644\\u062a\\u0648\\u0633\\u064a\\u0639 \\u0645\\u0635\\u0627\\u062f\\u0631 \\u0625\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a\\u0647\\u0645 \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u062a\\u0642\\u062f\\u064a\\u0645 \\u062e\\u062f\\u0645\\u0627\\u062a \\u0628\\u0637\\u0627\\u0642\\u0627\\u062a \\u0627\\u0644\\u0627\\u0626\\u062a\\u0645\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0641\\u062a\\u0631\\u0627\\u0636\\u064a\\u0629 \\u0644\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621.\"}},\"id\":\"6436efff890e3\",\"image\":\"e8155f74-e5d6-41eb-b880-bc3d2bf8f2e2.webp\"},\"6436f026bdfe0\":{\"language\":{\"en\":{\"title\":\"User-Friendly Interface\",\"sub_title\":\"An intuitive and easy-to-navigate platform designed for both beginners and experienced users, making online transactions a breeze.\"},\"es\":{\"title\":\"Interfaz amigable\",\"sub_title\":\"Una plataforma intuitiva y f\\u00e1cil de navegar dise\\u00f1ada tanto para principiantes como para usuarios experimentados, que facilita las transacciones en l\\u00ednea.\"},\"ar\":{\"title\":\"\\u0648\\u0627\\u062c\\u0647\\u0629 \\u0633\\u0647\\u0644\\u0629 \\u0627\\u0644\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\",\"sub_title\":\"\\u0645\\u0646\\u0635\\u0629 \\u0628\\u062f\\u064a\\u0647\\u064a\\u0629 \\u0648\\u0633\\u0647\\u0644\\u0629 \\u0627\\u0644\\u062a\\u0646\\u0642\\u0644 \\u0645\\u0635\\u0645\\u0645\\u0629 \\u0644\\u0643\\u0644 \\u0645\\u0646 \\u0627\\u0644\\u0645\\u0633\\u062a\\u062e\\u062f\\u0645\\u064a\\u0646 \\u0627\\u0644\\u0645\\u0628\\u062a\\u062f\\u0626\\u064a\\u0646 \\u0648\\u0630\\u0648\\u064a \\u0627\\u0644\\u062e\\u0628\\u0631\\u0629\\u060c \\u0645\\u0645\\u0627 \\u064a\\u062c\\u0639\\u0644 \\u0627\\u0644\\u0645\\u0639\\u0627\\u0645\\u0644\\u0627\\u062a \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a \\u0623\\u0645\\u0631\\u064b\\u0627 \\u0633\\u0647\\u0644\\u0627\\u064b.\"}},\"id\":\"6436f026bdfe0\",\"image\":\"f7676f50-3cc0-4340-99b4-b1cf27f3ab0d.webp\"},\"6436f04798830\":{\"language\":{\"en\":{\"title\":\"Financial Inclusion\",\"sub_title\":\"Access to secure online transactions for everyone, promoting financial inclusion and accessibility.\"},\"es\":{\"title\":\"Inclusi\\u00f3n financiera\",\"sub_title\":\"Acceso a transacciones en l\\u00ednea seguras para todos, promoviendo la inclusi\\u00f3n financiera y la accesibilidad.\"},\"ar\":{\"title\":\"\\u0627\\u0644\\u0634\\u0645\\u0648\\u0644 \\u0627\\u0644\\u0645\\u0627\\u0644\\u064a\",\"sub_title\":\"\\u0627\\u0644\\u0648\\u0635\\u0648\\u0644 \\u0625\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0639\\u0627\\u0645\\u0644\\u0627\\u062a \\u0627\\u0644\\u0622\\u0645\\u0646\\u0629 \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a \\u0644\\u0644\\u062c\\u0645\\u064a\\u0639\\u060c \\u0648\\u062a\\u0639\\u0632\\u064a\\u0632 \\u0627\\u0644\\u0634\\u0645\\u0648\\u0644 \\u0627\\u0644\\u0645\\u0627\\u0644\\u064a \\u0648\\u0625\\u0645\\u0643\\u0627\\u0646\\u064a\\u0629 \\u0627\\u0644\\u0648\\u0635\\u0648\\u0644.\"}},\"id\":\"6436f04798830\",\"image\":\"038289d5-72ba-43f4-90a7-db86bf8b38f7.webp\"},\"6436f066141b7\":{\"language\":{\"en\":{\"title\":\"Cutting-Edge Security\",\"sub_title\":\"State-of-the-art encryption and security measures to safeguard your data and ensure the highest levels of protection.\"},\"es\":{\"title\":\"Seguridad de vanguardia\",\"sub_title\":\"Cifrado de \\u00faltima generaci\\u00f3n y medidas de seguridad para salvaguardar sus datos y garantizar los m\\u00e1s altos niveles de protecci\\u00f3n.\"},\"ar\":{\"title\":\"\\u0627\\u0644\\u0623\\u0645\\u0646 \\u0627\\u0644\\u0645\\u062a\\u0637\\u0648\\u0631\",\"sub_title\":\"\\u0623\\u062d\\u062f\\u062b \\u0625\\u062c\\u0631\\u0627\\u0621\\u0627\\u062a \\u0627\\u0644\\u062a\\u0634\\u0641\\u064a\\u0631 \\u0648\\u0627\\u0644\\u0623\\u0645\\u0627\\u0646 \\u0644\\u062d\\u0645\\u0627\\u064a\\u0629 \\u0628\\u064a\\u0627\\u0646\\u0627\\u062a\\u0643 \\u0648\\u0636\\u0645\\u0627\\u0646 \\u0623\\u0639\\u0644\\u0649 \\u0645\\u0633\\u062a\\u0648\\u064a\\u0627\\u062a \\u0627\\u0644\\u062d\\u0645\\u0627\\u064a\\u0629.\"}},\"id\":\"6436f066141b7\",\"image\":\"0fbdbbb9-3db8-467c-a26c-613753bc8d41.webp\"},\"6436f088085ab\":{\"language\":{\"en\":{\"title\":\"Transparent Fee Structure\",\"sub_title\":\"A straightforward fee system that ensures you always know what to expect, with no hidden costs.\"},\"es\":{\"title\":\"Estructura de tarifas transparente\",\"sub_title\":\"Un sistema de tarifas sencillo que garantiza que siempre sepa qu\\u00e9 esperar, sin costos ocultos.\"},\"ar\":{\"title\":\"\\u0647\\u064a\\u0643\\u0644 \\u0631\\u0633\\u0648\\u0645 \\u0634\\u0641\\u0627\\u0641\",\"sub_title\":\"\\u0646\\u0638\\u0627\\u0645 \\u0631\\u0633\\u0648\\u0645 \\u0645\\u0628\\u0627\\u0634\\u0631 \\u064a\\u0636\\u0645\\u0646 \\u0644\\u0643 \\u062f\\u0627\\u0626\\u0645\\u064b\\u0627 \\u0645\\u0639\\u0631\\u0641\\u0629 \\u0645\\u0627 \\u064a\\u0645\\u0643\\u0646 \\u062a\\u0648\\u0642\\u0639\\u0647\\u060c \\u062f\\u0648\\u0646 \\u0623\\u064a \\u062a\\u0643\\u0627\\u0644\\u064a\\u0641 \\u0645\\u062e\\u0641\\u064a\\u0629.\"}},\"id\":\"6436f088085ab\",\"image\":\"9444c076-2eeb-460f-bfdd-0c6318439289.webp\"},\"6436f0a8c8891\":{\"language\":{\"en\":{\"title\":\"Constant Innovation\",\"sub_title\":\"Continuous evolution to meet the ever-changing needs of the digital age, offering innovative solutions for seamless transactions.\"},\"es\":{\"title\":\"Innovaci\\u00f3n constante\",\"sub_title\":\"Evoluci\\u00f3n continua para satisfacer las necesidades siempre cambiantes de la era digital, ofreciendo soluciones innovadoras para transacciones fluidas.\"},\"ar\":{\"title\":\"\\u0627\\u0644\\u0627\\u0628\\u062a\\u0643\\u0627\\u0631 \\u0627\\u0644\\u0645\\u0633\\u062a\\u0645\\u0631\",\"sub_title\":\"\\u0627\\u0644\\u062a\\u0637\\u0648\\u0631 \\u0627\\u0644\\u0645\\u0633\\u062a\\u0645\\u0631 \\u0644\\u062a\\u0644\\u0628\\u064a\\u0629 \\u0627\\u0644\\u0627\\u062d\\u062a\\u064a\\u0627\\u062c\\u0627\\u062a \\u0627\\u0644\\u0645\\u062a\\u063a\\u064a\\u0631\\u0629 \\u0644\\u0644\\u0639\\u0635\\u0631 \\u0627\\u0644\\u0631\\u0642\\u0645\\u064a\\u060c \\u0648\\u062a\\u0642\\u062f\\u064a\\u0645 \\u062d\\u0644\\u0648\\u0644 \\u0645\\u0628\\u062a\\u0643\\u0631\\u0629 \\u0644\\u0644\\u0645\\u0639\\u0627\\u0645\\u0644\\u0627\\u062a \\u0627\\u0644\\u0633\\u0644\\u0633\\u0629.\"}},\"id\":\"6436f0a8c8891\",\"image\":\"bc45f214-87ec-4bf6-8f5e-f72f30d3fcfd.webp\"},\"6436f148267e7\":{\"language\":{\"en\":{\"title\":\"24\\/7 Customer Support\",\"sub_title\":\"Round-the-clock assistance from our dedicated support team to address your inquiries and provide help when you need it\"},\"es\":{\"title\":\"Atenci\\u00f3n al cliente 24 horas al d\\u00eda, 7 d\\u00edas a la semana\",\"sub_title\":\"Asistencia las 24 horas del d\\u00eda por parte de nuestro equipo de soporte dedicado para atender sus consultas y brindarle ayuda cuando la necesite\"},\"ar\":{\"title\":\"\\u062f\\u0639\\u0645 \\u0627\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0639\\u0644\\u0649 \\u0645\\u062f\\u0627\\u0631 24 \\u0633\\u0627\\u0639\\u0629 \\u0637\\u0648\\u0627\\u0644 \\u0623\\u064a\\u0627\\u0645 \\u0627\\u0644\\u0623\\u0633\\u0628\\u0648\\u0639\",\"sub_title\":\"\\u0645\\u0633\\u0627\\u0639\\u062f\\u0629 \\u0639\\u0644\\u0649 \\u0645\\u062f\\u0627\\u0631 \\u0627\\u0644\\u0633\\u0627\\u0639\\u0629 \\u0645\\u0646 \\u0641\\u0631\\u064a\\u0642 \\u0627\\u0644\\u062f\\u0639\\u0645 \\u0627\\u0644\\u0645\\u062e\\u0635\\u0635 \\u0644\\u062f\\u064a\\u0646\\u0627 \\u0644\\u0644\\u0631\\u062f \\u0639\\u0644\\u0649 \\u0627\\u0633\\u062a\\u0641\\u0633\\u0627\\u0631\\u0627\\u062a\\u0643 \\u0648\\u062a\\u0642\\u062f\\u064a\\u0645 \\u0627\\u0644\\u0645\\u0633\\u0627\\u0639\\u062f\\u0629 \\u0639\\u0646\\u062f\\u0645\\u0627 \\u062a\\u062d\\u062a\\u0627\\u062c \\u0625\\u0644\\u064a\\u0647\\u0627\"}},\"id\":\"6436f148267e7\",\"image\":\"4582508c-2041-4829-b970-551aa019c508.webp\"}}}', 1, NULL, NULL, '2024-08-26 04:30:35'),
(10, 'start-section', '{\"images\":{\"image\":\"81cf6f08-4def-4bf5-b1dc-327817e4f804.webp\"},\"language\":{\"en\":{\"heading\":\"Ready To Join StripeCard?\",\"button_name\":\"Start Now\",\"button_link\":\"contact\"},\"es\":{\"heading\":\"contact\",\"button_name\":\"Empezar ahora\",\"button_link\":\"contact\"},\"ar\":{\"heading\":\"contact\",\"button_name\":\"\\u0627\\u0628\\u062f\\u0623 \\u0627\\u0644\\u0622\\u0646\",\"button_link\":\"contact\"},\"CN\":{\"heading\":\"111111\",\"button_name\":\"111111111111\",\"button_link\":\"11\"}}}', 1, NULL, NULL, '2024-08-26 04:32:36'),
(11, 'blog-section', '{\"language\":{\"en\":{\"title\":\"Announcement\",\"heading\":\"Our Recent Announcement\"},\"es\":{\"title\":\"Anuncio\",\"heading\":\"Nuestro anuncio reciente\"},\"ar\":{\"title\":\"\\u0625\\u0639\\u0644\\u0627\\u0646\",\"heading\":\"\\u0625\\u0639\\u0644\\u0627\\u0646\\u0646\\u0627 \\u0627\\u0644\\u0623\\u062e\\u064a\\u0631\"}}}', 1, NULL, NULL, '2023-11-06 07:08:07'),
(12, 'statistics-section', '{\"language\":{\"en\":{\"total_users\":\"100\",\"happy_users\":\"1000\",\"total_service\":\"12000\"},\"es\":{\"total_users\":\"100\",\"happy_users\":\"80\",\"total_service\":\"100\"},\"ar\":{\"total_users\":\"100\",\"happy_users\":\"1000\",\"total_service\":\"12000\"},\"CN\":{\"total_users\":\"10000\",\"happy_users\":\"5000\",\"total_service\":\"500\"}}}', 1, NULL, '2023-09-05 03:56:04', '2024-08-26 04:29:45');

-- --------------------------------------------------------

--
-- 表的结构 `stripe_virtual_cards`
--

CREATE TABLE `stripe_virtual_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `card_id` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `brand` varchar(191) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `amount` varchar(28) NOT NULL DEFAULT '0',
  `charge` varchar(28) NOT NULL DEFAULT '0',
  `maskedPan` varchar(191) DEFAULT NULL,
  `last4` varchar(191) DEFAULT NULL,
  `expiryMonth` varchar(191) DEFAULT NULL,
  `expiryYear` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `isDeleted` tinyint(1) NOT NULL DEFAULT 1,
  `card_details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `strowallet_virtual_cards`
--

CREATE TABLE `strowallet_virtual_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name_on_card` varchar(191) NOT NULL,
  `card_id` varchar(191) NOT NULL,
  `card_created_date` varchar(191) NOT NULL,
  `card_type` varchar(191) NOT NULL,
  `card_brand` varchar(191) NOT NULL,
  `card_user_id` varchar(191) NOT NULL,
  `reference` varchar(191) NOT NULL,
  `card_status` varchar(191) NOT NULL,
  `customer_id` varchar(191) NOT NULL,
  `card_name` varchar(191) DEFAULT NULL,
  `card_number` varchar(191) DEFAULT NULL,
  `last4` varchar(191) DEFAULT NULL,
  `cvv` varchar(191) DEFAULT NULL,
  `expiry` varchar(191) DEFAULT NULL,
  `customer_email` varchar(191) DEFAULT NULL,
  `balance` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `strowallet_virtual_cards`
--

INSERT INTO `strowallet_virtual_cards` (`id`, `user_id`, `name_on_card`, `card_id`, `card_created_date`, `card_type`, `card_brand`, `card_user_id`, `reference`, `card_status`, `customer_id`, `card_name`, `card_number`, `last4`, `cvv`, `expiry`, `customer_email`, `balance`, `status`, `is_active`, `created_at`, `updated_at`, `is_default`) VALUES
(1, 1, 'lariena sun', '2836866506', '2024-08-22', 'virtual', 'visa', '12d4-9290113c29e2', '27072', 'pending', '4070fc3e-1d76-46', NULL, NULL, NULL, NULL, NULL, 'sjf110@gmail.com', '20', 1, 1, '2024-08-22 03:19:40', '2024-08-22 03:19:40', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sudo_virtual_cards`
--

CREATE TABLE `sudo_virtual_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `card_id` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `business_id` varchar(191) DEFAULT NULL,
  `customer` text DEFAULT NULL,
  `account` text DEFAULT NULL,
  `fundingSource` text DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `brand` varchar(191) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `amount` varchar(28) NOT NULL DEFAULT '0',
  `charge` varchar(28) NOT NULL DEFAULT '0',
  `maskedPan` varchar(191) DEFAULT NULL,
  `last4` varchar(191) DEFAULT NULL,
  `expiryMonth` varchar(191) DEFAULT NULL,
  `expiryYear` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `isDeleted` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `billingAddress` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `temporary_datas`
--

CREATE TABLE `temporary_datas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `identifier` varchar(191) NOT NULL,
  `gateway_code` varchar(191) DEFAULT NULL,
  `currency_code` varchar(191) DEFAULT NULL,
  `data` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `temporary_datas`
--

INSERT INTO `temporary_datas` (`id`, `type`, `identifier`, `gateway_code`, `currency_code`, `data`, `created_at`, `updated_at`) VALUES
(1, 'paypal', '17Y47234RY554941J', NULL, NULL, '{\"gateway\":1,\"currency\":1,\"amount\":{\"requested_amount\":\"50\",\"sender_cur_code\":\"USD\",\"sender_cur_rate\":1,\"fixed_charge\":2,\"percent_charge\":0.5,\"total_charge\":2.5,\"total_amount\":52.5,\"exchange_rate\":1,\"will_get\":50,\"default_currency\":\"USD\"},\"response\":{\"id\":\"17Y47234RY554941J\",\"status\":\"CREATED\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/17Y47234RY554941J\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/www.sandbox.paypal.com\\/checkoutnow?token=17Y47234RY554941J\",\"rel\":\"approve\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/17Y47234RY554941J\",\"rel\":\"update\",\"method\":\"PATCH\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/17Y47234RY554941J\\/capture\",\"rel\":\"capture\",\"method\":\"POST\"}]},\"wallet_table\":\"user_wallets\",\"wallet_id\":1,\"creator_table\":\"users\",\"creator_id\":1,\"creator_guard\":\"web\"}', '2024-08-24 12:34:31', '2024-08-24 12:34:31'),
(2, 'coingate', 'GJySywonYHGE4wOe3SP5UTaVx6pFcQGjSz5yBCzwXkxJ3MFUiVhCnwzXqWgN', NULL, NULL, '{\"gateway\":15,\"currency\":17,\"amount\":{\"requested_amount\":\"100\",\"sender_cur_code\":\"USDT\",\"sender_cur_rate\":1,\"fixed_charge\":0,\"percent_charge\":1,\"total_charge\":1,\"total_amount\":101,\"exchange_rate\":1,\"will_get\":100,\"default_currency\":\"USD\"},\"response\":{\"id\":154361,\"status\":\"new\",\"title\":null,\"do_not_convert\":false,\"orderable_type\":\"ApiApp\",\"orderable_id\":1479,\"uuid\":\"3093faed-ddf6-4fcb-84ff-3fb0ab5918b8\",\"price_currency\":\"USDT\",\"price_amount\":\"101.0\",\"lightning_network\":false,\"receive_currency\":\"USD\",\"receive_amount\":\"0\",\"created_at\":\"2024-08-25T07:05:35+00:00\",\"order_id\":\"ab801389-4890-4897-b6b8-7105bbbb327f\",\"payment_url\":\"https:\\/\\/pay-sandbox.coingate.com\\/invoice\\/3093faed-ddf6-4fcb-84ff-3fb0ab5918b8\",\"underpaid_amount\":\"0\",\"overpaid_amount\":\"0\",\"is_refundable\":false,\"payment_request_uri\":null,\"refunds\":[],\"voids\":[],\"fees\":[],\"blockchain_transactions\":[],\"token\":\"ZNLTsBRaej9hnyXaR5d8RNJW2rsoww\"},\"temp_identifier\":\"GJySywonYHGE4wOe3SP5UTaVx6pFcQGjSz5yBCzwXkxJ3MFUiVhCnwzXqWgN\",\"wallet_table\":\"user_wallets\",\"wallet_id\":1,\"creator_table\":\"users\",\"creator_id\":1,\"creator_guard\":\"web\"}', '2024-08-25 05:05:36', '2024-08-25 05:05:36'),
(3, 'stripe', 'TXREF_1724586619', NULL, NULL, '{\"gateway\":2,\"currency\":3,\"amount\":{\"requested_amount\":\"15\",\"sender_cur_code\":\"USD\",\"sender_cur_rate\":1,\"fixed_charge\":2,\"percent_charge\":0.15,\"total_charge\":2.15,\"total_amount\":17.15,\"exchange_rate\":1,\"will_get\":15,\"default_currency\":\"USD\"},\"response\":{\"payment_options\":\"card\",\"amount\":\"17.15\",\"email\":\"sjf110@gmail.com\",\"tx_ref\":\"TXREF_1724586619\",\"currency\":\"USD\",\"redirect_url\":\"http:\\/\\/localhost\\/vcc\\/user\\/add-money\\/stripe\\/payment\\/success\\/TXREF_1724586619\",\"customer\":{\"email\":\"sjf110@gmail.com\",\"phone_number\":\"119197660111\",\"name\":\"lariena Sun\"},\"customizations\":{\"title\":\"Add Money\",\"description\":\"25 Aug 2024\"}},\"wallet_table\":\"user_wallets\",\"wallet_id\":1,\"creator_table\":\"users\",\"creator_id\":1,\"creator_guard\":\"web\"}', '2024-08-25 09:50:21', '2024-08-25 09:50:21'),
(4, 'razorpay', '2tcfS1eaeSXzuQsTyBfMCgHrnMjTiAN7A1x', NULL, NULL, '{\"gateway\":12,\"currency\":26,\"amount\":{\"requested_amount\":\"10\",\"sender_cur_code\":\"SAR\",\"sender_cur_rate\":3.75,\"fixed_charge\":3.75,\"percent_charge\":0.75,\"total_charge\":4.5,\"total_amount\":42,\"exchange_rate\":1,\"will_get\":10,\"default_currency\":\"USD\"},\"wallet_table\":\"user_wallets\",\"wallet_id\":1,\"creator_table\":\"users\",\"creator_id\":1,\"creator_guard\":\"web\",\"callback_url\":\"http:\\/\\/localhost\\/vcc\\/user\\/add-money\\/success\\/response\\/razorpay?token=2tcfS1eaeSXzuQsTyBfMCgHrnMjTiAN7A1x\",\"cancel_url\":\"http:\\/\\/localhost\\/vcc\\/user\\/add-money\\/cancel\\/response\\/razorpay?token=2tcfS1eaeSXzuQsTyBfMCgHrnMjTiAN7A1x\",\"razorpay_order\":{\"amount\":4200,\"amount_due\":4200,\"amount_paid\":0,\"attempts\":0,\"created_at\":1724586714,\"currency\":\"SAR\",\"entity\":\"order\",\"id\":\"order_Op7dRrutwBMxef\",\"notes\":[],\"offer_id\":null,\"receipt\":\"2tcfS1eaeSXzuQsTyBfMCgHrnMjTiAN7A1x\",\"status\":\"created\"}}', '2024-08-25 09:51:52', '2024-08-25 09:51:54'),
(5, 'razorpay', 'tzM8TS9x2hVNJDvWl7MKSjuawirXwyyzMyH', NULL, NULL, '{\"gateway\":12,\"currency\":42,\"amount\":{\"requested_amount\":\"10\",\"sender_cur_code\":\"CNY\",\"sender_cur_rate\":7.29,\"fixed_charge\":7.29,\"percent_charge\":1.4580000000000002,\"total_charge\":8.748000000000001,\"total_amount\":81.64800000000001,\"exchange_rate\":1,\"will_get\":10,\"default_currency\":\"USD\"},\"wallet_table\":\"user_wallets\",\"wallet_id\":1,\"creator_table\":\"users\",\"creator_id\":1,\"creator_guard\":\"web\",\"callback_url\":\"http:\\/\\/localhost\\/vcc\\/user\\/add-money\\/success\\/response\\/razorpay?token=tzM8TS9x2hVNJDvWl7MKSjuawirXwyyzMyH\",\"cancel_url\":\"http:\\/\\/localhost\\/vcc\\/user\\/add-money\\/cancel\\/response\\/razorpay?token=tzM8TS9x2hVNJDvWl7MKSjuawirXwyyzMyH\"}', '2024-08-25 09:58:03', '2024-08-25 09:58:03'),
(6, 'paypal', '88A46891CC4020846', NULL, NULL, '{\"gateway\":1,\"currency\":1,\"amount\":{\"requested_amount\":\"100\",\"sender_cur_code\":\"USD\",\"sender_cur_rate\":1,\"fixed_charge\":2,\"percent_charge\":1,\"total_charge\":3,\"total_amount\":103,\"exchange_rate\":1,\"will_get\":100,\"default_currency\":\"USD\"},\"response\":{\"id\":\"88A46891CC4020846\",\"status\":\"CREATED\",\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/88A46891CC4020846\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/www.sandbox.paypal.com\\/checkoutnow?token=88A46891CC4020846\",\"rel\":\"approve\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/88A46891CC4020846\",\"rel\":\"update\",\"method\":\"PATCH\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/88A46891CC4020846\\/capture\",\"rel\":\"capture\",\"method\":\"POST\"}]},\"wallet_table\":\"user_wallets\",\"wallet_id\":1,\"creator_table\":\"users\",\"creator_id\":1,\"creator_guard\":\"web\"}', '2024-08-25 09:58:15', '2024-08-25 09:58:15');

-- --------------------------------------------------------

--
-- 表的结构 `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_wallet_id` bigint(20) UNSIGNED NOT NULL,
  `payment_gateway_currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `trx_id` varchar(191) NOT NULL COMMENT 'Transaction ID',
  `request_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `payable` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `available_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `remark` varchar(191) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `reject_reason` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: Default, 1: Success, 2: Pending, 3: Hold, 4: Rejected',
  `attribute` enum('SEND','RECEIVED') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `callback_ref` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `transactions`
--

INSERT INTO `transactions` (`id`, `type`, `admin_id`, `user_id`, `user_wallet_id`, `payment_gateway_currency_id`, `trx_id`, `request_amount`, `payable`, `available_balance`, `remark`, `details`, `reject_reason`, `status`, `attribute`, `created_at`, `updated_at`, `callback_ref`) VALUES
(1, 'VIRTUAL-CARD', NULL, 1, 1, NULL, 'CB85227826', 20.00000000, 22.20000000, 177.80000000, 'CARD BUY', '{\"card_info\":{\"user_id\":1,\"name_on_card\":\"lariena sun\",\"card_id\":\"2836866506\",\"card_created_date\":\"2024-08-22\",\"card_type\":\"virtual\",\"card_brand\":\"visa\",\"card_user_id\":\"12d4-9290113c29e2\",\"reference\":\"27072\",\"card_status\":\"pending\",\"customer_id\":\"4070fc3e-1d76-46\",\"customer_email\":\"sjf110@gmail.com\",\"balance\":\"20\",\"updated_at\":\"2024-08-22T05:19:40.000000Z\",\"created_at\":\"2024-08-22T05:19:40.000000Z\",\"id\":1}}', NULL, 1, 'RECEIVED', '2024-08-22 03:19:40', NULL, NULL),
(2, 'VIRTUAL-CARD', NULL, 1, 1, NULL, 'CB83549964', 20.00000000, 22.20000000, 155.60000000, 'CARD BUY', '{\"card_info\":{\"user_id\":1,\"card_id\":\"VC-172433810065\",\"name\":\"lariena Sun\",\"card_pan\":\"400000550710807\",\"masked_card\":\"**** **** **** 0807\",\"cvv\":\"271\",\"expiration\":\"2027-08\",\"card_type\":\"Virtual\",\"name_on_card\":\"lariena Sun\",\"ref_id\":\"VC-172433810065\",\"secret\":\"VC-172433810065\",\"bg\":\"DeepBlue\",\"amount\":20,\"currency\":\"USD\",\"charge\":2.2,\"is_active\":1,\"funding\":1,\"terminate\":0,\"updated_at\":\"2024-08-22T14:48:20.000000Z\",\"created_at\":\"2024-08-22T14:48:20.000000Z\",\"id\":1}}', NULL, 1, 'RECEIVED', '2024-08-22 12:48:20', NULL, NULL),
(3, 'VIRTUAL-CARD', NULL, 1, 1, NULL, 'CB48721452', 28.00000000, 30.28000000, 125.32000000, 'CARD BUY', '{\"card_info\":{\"user_id\":1,\"card_id\":\"VC-172434060123\",\"name\":\"lariena Sun\",\"card_pan\":\"400000613661175\",\"masked_card\":\"**** **** **** 1175\",\"cvv\":\"152\",\"expiration\":\"2027-08\",\"card_type\":\"Virtual\",\"name_on_card\":\"lariena Sun\",\"ref_id\":\"VC-172434060123\",\"secret\":\"VC-172434060123\",\"bg\":\"DeepBlue\",\"amount\":28,\"currency\":\"USD\",\"charge\":2.2800000000000002,\"is_active\":1,\"funding\":1,\"terminate\":0,\"updated_at\":\"2024-08-22T15:30:01.000000Z\",\"created_at\":\"2024-08-22T15:30:01.000000Z\",\"id\":2}}', NULL, 1, 'RECEIVED', '2024-08-22 13:30:01', NULL, NULL),
(4, 'VIRTUAL-CARD', NULL, 1, 1, NULL, 'CB94842611', 15.00000000, 17.15000000, 108.17000000, 'CARD BUY', '{\"card_info\":{\"user_id\":1,\"card_id\":\"VC-172441242638\",\"name\":\"lariena Sun\",\"card_pan\":\"0000 0000 0000 0000\",\"masked_card\":\"**** **** **** 0000\",\"cvv\":\"806\",\"expiration\":\"2027-08\",\"card_type\":\"Virtual\",\"name_on_card\":\"lariena Sun\",\"ref_id\":\"VC-172441242638\",\"secret\":\"VC-172441242638\",\"bg\":\"DeepBlue\",\"amount\":15,\"currency\":\"USD\",\"charge\":2.15,\"is_active\":0,\"funding\":1,\"terminate\":0,\"updated_at\":\"2024-08-23T11:27:06.000000Z\",\"created_at\":\"2024-08-23T11:27:06.000000Z\",\"id\":3}}', NULL, 1, 'RECEIVED', '2024-08-23 09:27:06', NULL, NULL),
(5, 'VIRTUAL-CARD', NULL, 1, 1, NULL, 'CB77486839', 15.00000000, 17.15000000, 91.02000000, 'CARD BUY', '{\"card_info\":{\"user_id\":1,\"card_id\":\"VC-172441300470\",\"name\":\"lariena Sun\",\"card_pan\":\"0000 0000 0000 0000\",\"masked_card\":\"**** **** **** 0000\",\"cvv\":\"931\",\"expiration\":\"2027-08\",\"card_type\":\"Virtual\",\"name_on_card\":\"XiongCard\",\"ref_id\":\"VC-172441300470\",\"secret\":\"VC-172441300470\",\"bg\":\"DeepBlue\",\"amount\":15,\"currency\":\"USD\",\"charge\":2.15,\"is_active\":1,\"funding\":1,\"terminate\":0,\"updated_at\":\"2024-08-23T11:36:44.000000Z\",\"created_at\":\"2024-08-23T11:36:44.000000Z\",\"id\":4}}', NULL, 1, 'RECEIVED', '2024-08-23 09:36:44', NULL, NULL),
(6, 'VIRTUAL-CARD', NULL, 1, 1, NULL, 'CB18932577', 11.00000000, 13.11000000, 77.91000000, 'CARD BUY', '{\"card_info\":{\"user_id\":1,\"card_id\":\"VC-172441391662\",\"ref_id\":\"VC-172441391662\",\"secret\":\"VC-172441391662\",\"bg\":\"DeepBlue\",\"amount\":11,\"currency\":\"USD\",\"charge\":2.11,\"is_active\":0,\"funding\":1,\"terminate\":0,\"updated_at\":\"2024-08-23T11:51:56.000000Z\",\"created_at\":\"2024-08-23T11:51:56.000000Z\",\"id\":5}}', NULL, 1, 'RECEIVED', '2024-08-23 09:51:56', NULL, NULL),
(7, 'VIRTUAL-CARD', NULL, 1, 1, NULL, 'CF19278766', 10.00000000, 12.10000000, 53.71000000, 'CARD FUND', '{\"card_info\":{\"id\":1,\"user_id\":1,\"card_id\":\"VC-172433810065\",\"name\":\"lariena Sun\",\"account_id\":null,\"card_hash\":null,\"card_pan\":\"400000550710807\",\"masked_card\":\"**** **** **** 0807\",\"cvv\":\"271\",\"expiration\":\"2027-08\",\"card_type\":\"Virtual\",\"name_on_card\":\"lariena Sun\",\"callback\":null,\"ref_id\":\"VC-172433810065\",\"secret\":\"VC-172433810065\",\"city\":null,\"state\":null,\"zip_code\":null,\"address\":null,\"amount\":30,\"charge\":2.2,\"currency\":\"USD\",\"bg\":\"DeepBlue\",\"is_active\":1,\"funding\":1,\"terminate\":0,\"created_at\":\"2024-08-22T14:48:20.000000Z\",\"updated_at\":\"2024-08-23T14:35:30.000000Z\",\"is_default\":0}}', NULL, 1, 'RECEIVED', '2024-08-23 12:35:30', NULL, NULL),
(8, 'TRANSFER-MONEY', NULL, 1, 1, NULL, 'SM88267978', 10.00000000, 11.10000000, 42.61000000, 'TRANSFER MONEY To jjjj kkkk', '{\"recipient_amount\":\"10\",\"receiver\":{\"id\":2,\"firstname\":\"jjjj\",\"lastname\":\"kkkk\",\"username\":\"jjjjkkkk\",\"email\":\"84288682@qq.com\",\"mobile_code\":null,\"mobile\":null,\"full_mobile\":null,\"refferal_user_id\":null,\"image\":null,\"status\":1,\"address\":{\"country\":\"\",\"city\":\"\",\"zip\":\"\",\"state\":\"\",\"address\":\"\"},\"email_verified\":0,\"sms_verified\":1,\"kyc_verified\":0,\"ver_code\":null,\"ver_code_send_at\":null,\"two_factor_verified\":0,\"device_id\":null,\"email_verified_at\":null,\"deleted_at\":null,\"created_at\":\"2024-08-21T12:48:15.000000Z\",\"updated_at\":\"2024-08-21T12:48:15.000000Z\",\"sudo_customer\":null,\"sudo_account\":null,\"strowallet_customer\":null,\"stripe_card_holders\":null,\"stripe_connected_account\":null,\"fullname\":\"jjjj kkkk\",\"userImage\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/profile-default.webp\",\"stringStatus\":{\"class\":\"badge badge--success\",\"value\":\"Active\"},\"emailStatus\":{\"class\":\"badge badge--danger\",\"value\":\"Unverified\"},\"lastLogin\":\"08:16 AM, 22 Aug 2024\",\"kycStringStatus\":{\"class\":\"badge badge--danger\",\"value\":\"Unverified\"}}}', NULL, 1, 'SEND', '2024-08-24 09:07:15', NULL, NULL),
(9, 'TRANSFER-MONEY', NULL, 2, 2, NULL, 'SM88267978', 10.00000000, 11.10000000, 10.00000000, 'TRANSFER MONEY From lariena Sun', '{\"sender_amount\":\"10\",\"sender\":{\"id\":1,\"firstname\":\"lariena\",\"lastname\":\"Sun\",\"username\":\"lariena\",\"email\":\"sjf110@gmail.com\",\"mobile_code\":\"1\",\"mobile\":\"19197660111\",\"full_mobile\":\"119197660111\",\"refferal_user_id\":null,\"image\":null,\"status\":1,\"address\":{\"country\":\"United States\",\"state\":\"\",\"city\":\"\",\"zip\":\"\",\"address\":\"\"},\"email_verified\":1,\"sms_verified\":1,\"kyc_verified\":1,\"ver_code\":null,\"ver_code_send_at\":null,\"two_factor_verified\":0,\"device_id\":null,\"email_verified_at\":null,\"deleted_at\":null,\"created_at\":\"2024-08-21T12:06:41.000000Z\",\"updated_at\":\"2024-08-22T05:19:38.000000Z\",\"sudo_customer\":null,\"sudo_account\":null,\"strowallet_customer\":{\"customerEmail\":\"sjf110@gmail.com\",\"firstName\":\"lariena\",\"lastName\":\"Sun\",\"phoneNumber\":\"119197660111\",\"city\":\"Accra\",\"state\":\"Accra\",\"country\":\"Ghana\",\"line1\":\"Zanker\",\"zipCode\":\"95131\",\"houseNumber\":\"9197660111\",\"idNumber\":\"354697038\",\"idType\":\"PASSPORT\",\"idImage\":\"https:\\/\\/ssl.gstatic.com\\/ui\\/v1\\/icons\\/mail\\/rfr\\/logo_gmail_lockup_dark_1x_r5.png\",\"userPhoto\":\"https:\\/\\/ssl.gstatic.com\\/ui\\/v1\\/icons\\/mail\\/rfr\\/logo_gmail_lockup_dark_1x_r5.png\",\"dateOfBirth\":\"1988-06-05\",\"bitvcard_customer_id\":\"751c95b3-3422-40d3-9276-66d28e70b74a\",\"card_brand\":\"visa\"},\"stripe_card_holders\":null,\"stripe_connected_account\":null,\"fullname\":\"lariena Sun\",\"userImage\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/profile-default.webp\",\"stringStatus\":{\"class\":\"badge badge--success\",\"value\":\"Active\"},\"emailStatus\":{\"class\":\"badge badge--success\",\"value\":\"Verified\"},\"lastLogin\":\"16:02 PM, 24 Aug 2024\",\"kycStringStatus\":{\"class\":\"badge badge--success\",\"value\":\"Verified\"}}}', NULL, 1, 'RECEIVED', '2024-08-24 09:07:15', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `transaction_charges`
--

CREATE TABLE `transaction_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `percent_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `total_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `transaction_charges`
--

INSERT INTO `transaction_charges` (`id`, `transaction_id`, `percent_charge`, `fixed_charge`, `total_charge`, `created_at`, `updated_at`) VALUES
(1, 1, 0.20000000, 2.00000000, 2.20000000, '2024-08-22 03:19:40', NULL),
(2, 2, 0.20000000, 2.00000000, 2.20000000, '2024-08-22 12:48:20', NULL),
(3, 3, 0.28000000, 2.00000000, 2.28000000, '2024-08-22 13:30:01', NULL),
(4, 4, 0.15000000, 2.00000000, 2.15000000, '2024-08-23 09:27:06', NULL),
(5, 5, 0.15000000, 2.00000000, 2.15000000, '2024-08-23 09:36:44', NULL),
(6, 6, 0.11000000, 2.00000000, 2.11000000, '2024-08-23 09:51:56', NULL),
(7, 7, 0.10000000, 2.00000000, 2.10000000, '2024-08-23 12:35:30', NULL),
(8, 8, 0.10000000, 1.00000000, 1.10000000, '2024-08-24 09:07:15', NULL),
(9, 9, 0.10000000, 1.00000000, 1.10000000, '2024-08-24 09:07:15', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `transaction_devices`
--

CREATE TABLE `transaction_devices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `mac` varchar(17) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `browser` varchar(30) DEFAULT NULL,
  `os` varchar(30) DEFAULT NULL,
  `timezone` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `transaction_settings`
--

CREATE TABLE `transaction_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(50) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `fixed_charge` decimal(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `percent_charge` decimal(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `min_limit` decimal(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `max_limit` decimal(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `monthly_limit` decimal(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `daily_limit` decimal(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `transaction_settings`
--

INSERT INTO `transaction_settings` (`id`, `admin_id`, `slug`, `title`, `fixed_charge`, `percent_charge`, `min_limit`, `max_limit`, `monthly_limit`, `daily_limit`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'transfer-money', 'Transfer Money Charge', 1.00, 1.00, 10.00, 1000.00, 0.00, 0.00, 1, NULL, NULL),
(2, 1, 'virtual_card', 'Virtual Card Charges', 3.00, 8.00, 30.00, 50000.00, 0.00, 0.00, 1, NULL, '2024-08-26 04:54:18'),
(3, 1, 'reload_card', 'Card Reload Charges', 2.00, 1.00, 30.00, 50000.00, 0.00, 0.00, 1, NULL, '2024-08-26 04:56:18'),
(4, 1, 'gift_card', 'Gift Card Charges', 1.00, 1.00, 2.00, 50000.00, 0.00, 0.00, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) DEFAULT NULL,
  `username` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `mobile_code` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `full_mobile` varchar(191) DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `refferal_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = Active, 0 == Banned',
  `address` text DEFAULT NULL,
  `email_verified` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 == Verifiend, 0 == Not verifiend',
  `sms_verified` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 == Verifiend, 0 == Not verifiend',
  `kyc_verified` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Default, 1: Approved, 2: Pending, 3:Rejected',
  `ver_code` int(11) DEFAULT NULL,
  `ver_code_send_at` timestamp NULL DEFAULT NULL,
  `two_factor_verified` tinyint(1) NOT NULL DEFAULT 0,
  `device_id` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sudo_customer` text DEFAULT NULL,
  `sudo_account` text DEFAULT NULL,
  `strowallet_customer` text DEFAULT NULL,
  `stripe_card_holders` text DEFAULT NULL,
  `stripe_connected_account` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `mobile_code`, `mobile`, `full_mobile`, `password`, `refferal_user_id`, `image`, `status`, `address`, `email_verified`, `sms_verified`, `kyc_verified`, `ver_code`, `ver_code_send_at`, `two_factor_verified`, `device_id`, `email_verified_at`, `remember_token`, `deleted_at`, `created_at`, `updated_at`, `sudo_customer`, `sudo_account`, `strowallet_customer`, `stripe_card_holders`, `stripe_connected_account`) VALUES
(1, 'lariena', 'Sun', 'lariena', 'sjf110@gmail.com', '1', '19197660111', '119197660111', '$2y$10$EFuE493JdX8WS.SwY4EnxOp5Crpm0rxDxqVHHkWQWoHbjPxWO2VEO', NULL, NULL, 1, '{\"country\":\"United States\",\"state\":\"\",\"city\":\"\",\"zip\":\"\",\"address\":\"\"}', 1, 1, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2024-08-21 10:06:41', '2024-08-22 03:19:38', NULL, NULL, '{\"customerEmail\":\"sjf110@gmail.com\",\"firstName\":\"lariena\",\"lastName\":\"Sun\",\"phoneNumber\":\"119197660111\",\"city\":\"Accra\",\"state\":\"Accra\",\"country\":\"Ghana\",\"line1\":\"Zanker\",\"zipCode\":\"95131\",\"houseNumber\":\"9197660111\",\"idNumber\":\"354697038\",\"idType\":\"PASSPORT\",\"idImage\":\"https:\\/\\/ssl.gstatic.com\\/ui\\/v1\\/icons\\/mail\\/rfr\\/logo_gmail_lockup_dark_1x_r5.png\",\"userPhoto\":\"https:\\/\\/ssl.gstatic.com\\/ui\\/v1\\/icons\\/mail\\/rfr\\/logo_gmail_lockup_dark_1x_r5.png\",\"dateOfBirth\":\"1988-06-05\",\"bitvcard_customer_id\":\"751c95b3-3422-40d3-9276-66d28e70b74a\",\"card_brand\":\"visa\"}', NULL, NULL),
(2, 'jjjj', 'kkkk', 'jjjjkkkk', '84288682@qq.com', NULL, NULL, NULL, '$2y$10$DN5GjfIZYtTtcKejbsFE6ehAaYu6B9pzh/gPDTwfMJD./JEHwT/.S', NULL, NULL, 1, '{\"country\":\"\",\"city\":\"\",\"zip\":\"\",\"state\":\"\",\"address\":\"\"}', 0, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2024-08-21 10:48:15', '2024-08-21 10:48:15', NULL, NULL, NULL, NULL, NULL),
(3, '家强', '孙', 'sunjiaqiang', '842a88682@qq.com', NULL, NULL, NULL, '$2y$10$rhz8zIrvat4ndLECt2rtW.YdPe5zp.BncN8.na56MR4JhWAKp1/k2', NULL, NULL, 1, '{\"country\":\"\",\"city\":\"\",\"zip\":\"\",\"state\":\"\",\"address\":\"\"}', 0, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2024-08-21 10:54:01', '2024-08-21 10:54:01', NULL, NULL, NULL, NULL, NULL),
(4, 'lariena', 'li', 'lariena2', '5448552@qq.com', NULL, NULL, NULL, '$2y$10$XWC6QmXEXUHNhCspXgmJk.ku2bR2P6q1FMnlsjWZtbj8DUkfaZIIK', NULL, NULL, 1, '{\"country\":\"\",\"city\":\"\",\"zip\":\"\",\"state\":\"\",\"address\":\"\"}', 0, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2024-08-21 10:55:38', '2024-08-21 10:55:38', NULL, NULL, NULL, NULL, NULL),
(5, 'lariena', 'liu', 'lariena3', '123456789@qq.com', NULL, NULL, NULL, '$2y$10$chf1DGbKdzuDiiRN0kXqFu9oaPV.8vaDX5f0gbMfWsGyDNpNpd.4C', NULL, NULL, 1, '{\"country\":\"\",\"city\":\"\",\"zip\":\"\",\"state\":\"\",\"address\":\"\"}', 1, 1, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2024-08-21 12:20:40', '2024-08-21 12:20:40', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `user_authorizations`
--

CREATE TABLE `user_authorizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` int(11) NOT NULL,
  `token` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_kyc_data`
--

CREATE TABLE `user_kyc_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `reject_reason` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_login_logs`
--

CREATE TABLE `user_login_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `mac` varchar(17) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `browser` varchar(30) DEFAULT NULL,
  `os` varchar(30) DEFAULT NULL,
  `timezone` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `user_login_logs`
--

INSERT INTO `user_login_logs` (`id`, `user_id`, `ip`, `mac`, `city`, `country`, `longitude`, `latitude`, `browser`, `os`, `timezone`, `created_at`, `updated_at`) VALUES
(1, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Edge', 'Windows', 'America/New_York', '2024-08-21 10:07:35', '2024-08-21 10:07:35'),
(2, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Edge', 'Windows', 'America/New_York', '2024-08-21 10:08:01', '2024-08-21 10:08:01'),
(3, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Edge', 'Windows', 'America/New_York', '2024-08-21 10:14:30', '2024-08-21 10:14:30'),
(4, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Chrome', 'Windows', 'America/New_York', '2024-08-21 10:24:00', '2024-08-21 10:24:00'),
(5, 2, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Chrome', 'Windows', 'America/New_York', '2024-08-21 11:05:25', '2024-08-21 11:05:25'),
(6, 2, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Chrome', 'Windows', 'America/New_York', '2024-08-21 12:00:48', '2024-08-21 12:00:48'),
(7, 2, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Chrome', 'Windows', 'America/New_York', '2024-08-21 12:19:37', '2024-08-21 12:19:37'),
(8, 2, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Edge', 'Windows', 'America/New_York', '2024-08-22 00:16:17', '2024-08-22 00:16:17'),
(9, 2, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Edge', 'Windows', 'America/New_York', '2024-08-22 00:16:57', '2024-08-22 00:16:57'),
(10, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Chrome', 'Windows', 'America/New_York', '2024-08-22 00:29:53', '2024-08-22 00:29:53'),
(11, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Chrome', 'Windows', 'America/New_York', '2024-08-22 03:16:20', '2024-08-22 03:16:20'),
(12, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Chrome', 'Windows', 'America/New_York', '2024-08-22 06:23:10', '2024-08-22 06:23:10'),
(13, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Chrome', 'Windows', 'America/New_York', '2024-08-22 11:50:42', '2024-08-22 11:50:42'),
(14, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Chrome', 'Windows', 'America/New_York', '2024-08-23 09:20:02', '2024-08-23 09:20:02'),
(15, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Edge', 'Windows', 'America/New_York', '2024-08-24 08:02:32', '2024-08-24 08:02:32'),
(16, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Edge', 'Windows', 'America/New_York', '2024-08-24 11:37:52', '2024-08-24 11:37:52'),
(17, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Edge', 'Windows', 'America/New_York', '2024-08-25 04:43:24', '2024-08-25 04:43:24'),
(18, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Edge', 'Windows', 'America/New_York', '2024-08-25 09:50:03', '2024-08-25 09:50:03'),
(19, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Edge', 'Windows', 'America/New_York', '2024-08-25 13:20:12', '2024-08-25 13:20:12'),
(20, 1, '::1', '', 'New Haven', 'United States', '-72.92', '41.31', 'Edge', 'Windows', 'America/New_York', '2024-08-26 04:51:29', '2024-08-26 04:51:29');

-- --------------------------------------------------------

--
-- 表的结构 `user_mail_logs`
--

CREATE TABLE `user_mail_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `method` varchar(191) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `user_id`, `type`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 'CARD-BUY', '{\"title\":\"Buy Card\",\"message\":\"Buy card successful \",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/profile-default.webp\"}', '2024-08-22 03:19:40', '2024-08-22 03:19:40'),
(2, 1, 'CARD-BUY', '{\"title\":\"Buy Card\",\"message\":\"Buy card successful **** **** **** 0807\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/profile-default.webp\"}', '2024-08-22 12:48:20', '2024-08-22 12:48:20'),
(3, 1, 'CARD-BUY', '{\"title\":\"Buy Card\",\"message\":\"Buy card successful **** **** **** 1175\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/profile-default.webp\"}', '2024-08-22 13:30:01', '2024-08-22 13:30:01'),
(4, 1, 'CARD-BUY', '{\"title\":\"Buy Card\",\"message\":\"Buy card successful **** **** **** 0000\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/profile-default.webp\"}', '2024-08-23 09:27:06', '2024-08-23 09:27:06'),
(5, 1, 'CARD-BUY', '{\"title\":\"Buy Card\",\"message\":\"Buy card successful **** **** **** 0000\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/profile-default.webp\"}', '2024-08-23 09:36:44', '2024-08-23 09:36:44'),
(6, 1, 'CARD-BUY', '{\"title\":\"Buy Card\",\"message\":\"Buy card successful \",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/profile-default.webp\"}', '2024-08-23 09:51:56', '2024-08-23 09:51:56'),
(7, 1, 'CARD-FUND', '{\"title\":\"Card Fund\",\"message\":\"Card fund successful card: **** **** **** 0807 10 USD\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/profile-default.webp\"}', '2024-08-23 12:35:30', '2024-08-23 12:35:30'),
(8, 1, 'TRANSFER-MONEY', '{\"title\":\"Transfer Money\",\"message\":\"Transfer Money to  jjjj kkkk 10 USD successful\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/profile-default.webp\"}', '2024-08-24 09:07:15', '2024-08-24 09:07:15'),
(9, 2, 'TRANSFER-MONEY', '{\"title\":\"transfer Money\",\"message\":\"Transfer Money from lariena Sun 10 USD successful\",\"image\":\"http:\\/\\/localhost\\/vcc\\/public\\/backend\\/images\\/default\\/profile-default.webp\"}', '2024-08-24 09:07:15', '2024-08-24 09:07:15');

-- --------------------------------------------------------

--
-- 表的结构 `user_password_resets`
--

CREATE TABLE `user_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `code` bigint(20) UNSIGNED DEFAULT NULL,
  `token` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `zip_code` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `information` text DEFAULT NULL,
  `reject_reason` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_support_chats`
--

CREATE TABLE `user_support_chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_support_ticket_id` bigint(20) UNSIGNED NOT NULL,
  `sender` bigint(20) UNSIGNED NOT NULL,
  `sender_type` varchar(191) NOT NULL,
  `receiver` bigint(20) UNSIGNED DEFAULT NULL,
  `receiver_type` varchar(191) DEFAULT NULL,
  `message` text NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_support_tickets`
--

CREATE TABLE `user_support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(120) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `desc` text DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: Default, 1: Solved, 2: Active, 3: Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_support_ticket_attachments`
--

CREATE TABLE `user_support_ticket_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_support_ticket_id` bigint(20) UNSIGNED NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `attachment_info` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_wallets`
--

CREATE TABLE `user_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `balance` decimal(28,8) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `user_wallets`
--

INSERT INTO `user_wallets` (`id`, `user_id`, `currency_id`, `balance`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 42.61000000, 1, '2024-08-21 10:06:41', '2024-08-24 09:07:15'),
(2, 2, 1, 10.00000000, 1, '2024-08-21 10:48:15', '2024-08-24 09:07:15'),
(3, 3, 1, 0.00000000, 1, '2024-08-21 10:54:01', NULL),
(4, 4, 1, 0.00000000, 1, '2024-08-21 10:55:38', NULL),
(5, 5, 1, 0.00000000, 1, '2024-08-21 12:20:40', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `virtual_cards`
--

CREATE TABLE `virtual_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `card_id` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `account_id` varchar(191) DEFAULT NULL,
  `card_hash` varchar(191) DEFAULT NULL,
  `card_pan` varchar(191) DEFAULT NULL,
  `masked_card` varchar(191) DEFAULT NULL,
  `cvv` varchar(191) DEFAULT NULL,
  `expiration` varchar(191) DEFAULT NULL,
  `card_type` varchar(191) DEFAULT NULL,
  `name_on_card` varchar(191) DEFAULT NULL,
  `callback` varchar(191) DEFAULT NULL,
  `ref_id` varchar(191) DEFAULT NULL,
  `secret` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `zip_code` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `amount` varchar(28) NOT NULL DEFAULT '0',
  `charge` varchar(28) NOT NULL DEFAULT '0',
  `currency` varchar(191) DEFAULT NULL,
  `bg` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `funding` tinyint(1) NOT NULL DEFAULT 1,
  `terminate` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `virtual_cards`
--

INSERT INTO `virtual_cards` (`id`, `user_id`, `card_id`, `name`, `account_id`, `card_hash`, `card_pan`, `masked_card`, `cvv`, `expiration`, `card_type`, `name_on_card`, `callback`, `ref_id`, `secret`, `city`, `state`, `zip_code`, `address`, `amount`, `charge`, `currency`, `bg`, `is_active`, `funding`, `terminate`, `created_at`, `updated_at`, `is_default`) VALUES
(1, 1, 'VC-172433810065', 'lariena Sun', NULL, NULL, '400000550710807', '**** **** **** 0807', '271', '2027-08', 'Virtual', 'lariena Sun', NULL, 'VC-172433810065', 'VC-172433810065', NULL, NULL, NULL, NULL, '12', '2.2', 'USD', 'DeepBlue', 1, 1, 0, '2024-08-22 12:48:20', '2024-08-24 12:10:45', 1),
(2, 1, 'VC-172434060123', 'lariena Sun', NULL, NULL, '400000613661175', '**** **** **** 1175', '152', '2027-08', 'Virtual', 'lariena Sun', NULL, 'VC-172434060123', 'VC-172434060123', NULL, NULL, NULL, NULL, '28', '2.28', 'USD', 'DeepBlue', 1, 1, 0, '2024-08-22 13:30:01', '2024-08-23 12:39:05', 0),
(3, 1, 'VC-172441242638', 'lariena Sun', NULL, NULL, '0000 0000 0000 0000', '**** **** **** 0000', '806', '2027-08', 'Virtual', 'lariena Sun', NULL, 'VC-172441242638', 'VC-172441242638', NULL, NULL, NULL, NULL, '15', '2.15', 'USD', 'DeepBlue', 0, 1, 0, '2024-08-23 09:27:06', '2024-08-23 12:39:05', 0),
(4, 1, 'VC-172441300470', 'lariena Sun', NULL, NULL, '0000 0000 0000 0000', '**** **** **** 0000', '931', '2027-08', 'Virtual', 'XiongCard', NULL, 'VC-172441300470', 'VC-172441300470', NULL, NULL, NULL, NULL, '15', '2.15', 'USD', 'DeepBlue', 1, 1, 0, '2024-08-23 09:36:44', '2024-08-23 12:39:05', 0),
(5, 1, 'VC-172441391662', NULL, NULL, NULL, '4444444', NULL, '1444', '2027-08', NULL, NULL, NULL, 'VC-172441391662', 'VC-172441391662', NULL, NULL, NULL, NULL, '11', '2.11', 'USD', 'DeepBlue', 0, 1, 0, '2024-08-23 09:51:56', '2024-08-23 12:39:05', 0);

-- --------------------------------------------------------

--
-- 表的结构 `virtual_card_apis`
--

CREATE TABLE `virtual_card_apis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `card_details` text DEFAULT NULL,
  `config` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` text DEFAULT NULL,
  `card_limit` int(11) NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `virtual_card_apis`
--

INSERT INTO `virtual_card_apis` (`id`, `admin_id`, `card_details`, `config`, `created_at`, `updated_at`, `image`, `card_limit`) VALUES
(1, 1, '<p>This card is property of StripCard, Wonderland. Misuse is criminal offense. If found, please return to StripCard or to the nearest bank.</p>', '{\"flutterwave_secret_key\":\"FLWSECK_TEST-SANDBOXDEMOKEY-X\",\"flutterwave_secret_hash\":\"AYxcfvgbhnj@34\",\"flutterwave_url\":\"https:\\/\\/api.flutterwave.com\\/v3\",\"sudo_api_key\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NGI2NWExZmZjM2I2NDM5ZjdkNTZjYzIiLCJlbWFpbEFkZHJlc3MiOiJ1c2VyQGFwcGRldnMubmV0IiwianRpIjoiNjRiNjYyNjdmYzNiNjQzOWY3ZDViZjI2IiwibWVtYmVyc2hpcCI6eyJfaWQiOiI2NGI2NWExZmZjM2I2NDM5ZjdkNTZjYzUiLCJidXNpbmVzcyI6eyJfaWQiOiI2NGI2NWExZmZjM2I2NDM5ZjdkNTZjYzAiLCJuYW1lIjoiQXBwZGV2c1giLCJpc0FwcHJvdmVkIjpmYWxzZX0sInVzZXIiOiI2NGI2NWExZmZjM2I2NDM5ZjdkNTZjYzIiLCJyb2xlIjoiQVBJS2V5In0sImlhdCI6MTY4OTY3NDM0MywiZXhwIjoxNzIxMjMxOTQzfQ.MTKO352CEfxG4SUhpfAWu3mkHilLL8Y-oufD6WWCiH4\",\"sudo_vault_id\":\"tntbuyt0v9u\",\"sudo_url\":\"https:\\/\\/api.sandbox.sudo.cards\",\"sudo_mode\":\"live\",\"stripe_public_key\":\"pk_test_51NjGM4K6kUt0AggqD10PfWJcB8NxJmDhDptSqXPpX2d4Xcj7KtXxIrw1zRgK4jI5SIm9ZB7JIhmeYjcTkF7eL8pc00TgiPUGg5\",\"stripe_secret_key\":\"sk_test_51NjGM4K6kUt0Aggqfejd1Xiixa6HEjQXJNljEwt9QQPOTWoyylaIAhccSBGxWBnvDGw0fptTvGWXJ5kBO7tdpLNG00v5cWHt96\",\"stripe_url\":\"https:\\/\\/api.stripe.com\\/v1\",\"strowallet_public_key\":\"R67MNEPQV2ABQW9HDD7JQFXQ2AJMMY\",\"strowallet_secret_key\":\"AOC963E385FORPRRCXQJ698C1Q953B\",\"strowallet_url\":\"https:\\/\\/strowallet.com\\/api\\/bitvcard\\/\",\"strowallet_mode\":\"live\",\"name\":\"flutterwave\"}', '2024-08-21 08:41:28', '2024-08-23 09:36:10', 'seeder/virtual-card.webp', 10);

-- --------------------------------------------------------

--
-- 表的结构 `virtual_card_transactions`
--

CREATE TABLE `virtual_card_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trx_id` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `card_id` varchar(191) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'Pending',
  `details` text DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `gateway_reference` varchar(191) DEFAULT NULL,
  `response_message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `virtual_card_transactions`
--

INSERT INTO `virtual_card_transactions` (`id`, `trx_id`, `user_id`, `card_id`, `amount`, `currency`, `status`, `details`, `reference`, `gateway_reference`, `response_message`, `created_at`, `updated_at`, `product`) VALUES
(6, '2024AugSatfppiWb6nE0', 1, 'VC-172433810065', 2.00, 'USD', 'pending', NULL, NULL, NULL, NULL, '2024-08-24 12:02:24', '2024-08-24 12:02:24', 'Facebook Ads'),
(7, '202408242584873379', 1, 'VC-172433810065', 1.00, 'USD', 'pending', NULL, NULL, NULL, NULL, '2024-08-24 12:06:14', '2024-08-24 12:06:14', 'Facebook Ads'),
(8, '202408245332971281', 1, 'VC-172433810065', 1.00, 'USD', 'pending', NULL, NULL, NULL, NULL, '2024-08-24 12:10:16', '2024-08-24 12:10:16', 'Facebook Ads'),
(9, '202408246657645308', 1, 'VC-172433810065', 1.00, 'USD', 'pending', NULL, NULL, NULL, NULL, '2024-08-24 12:10:45', '2024-08-24 12:10:45', 'Facebook Ads');

--
-- 转储表的索引
--

--
-- 表的索引 `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_image_unique` (`image`),
  ADD KEY `admins_username_index` (`username`),
  ADD KEY `admins_email_index` (`email`),
  ADD KEY `admins_phone_index` (`phone`),
  ADD KEY `admins_admin_role_id_foreign` (`admin_role_id`);

--
-- 表的索引 `admin_has_roles`
--
ALTER TABLE `admin_has_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_has_roles_admin_id_foreign` (`admin_id`),
  ADD KEY `admin_has_roles_admin_role_id_foreign` (`admin_role_id`),
  ADD KEY `admin_has_roles_last_edit_by_foreign` (`last_edit_by`);

--
-- 表的索引 `admin_login_logs`
--
ALTER TABLE `admin_login_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_login_logs_admin_id_foreign` (`admin_id`);

--
-- 表的索引 `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_notifications_admin_id_foreign` (`admin_id`);

--
-- 表的索引 `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- 表的索引 `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD KEY `admin_roles_admin_id_foreign` (`admin_id`);

--
-- 表的索引 `admin_role_has_permissions`
--
ALTER TABLE `admin_role_has_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_role_has_permissions_admin_role_permission_id_foreign` (`admin_role_permission_id`),
  ADD KEY `admin_role_has_permissions_last_edit_by_foreign` (`last_edit_by`);

--
-- 表的索引 `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_role_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_role_permissions_slug_unique` (`slug`),
  ADD KEY `admin_role_permissions_admin_role_id_foreign` (`admin_role_id`),
  ADD KEY `admin_role_permissions_admin_id_foreign` (`admin_id`);

--
-- 表的索引 `app_onboard_screens`
--
ALTER TABLE `app_onboard_screens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_onboard_screens_image_unique` (`image`),
  ADD KEY `app_onboard_screens_last_edit_by_foreign` (`last_edit_by`);

--
-- 表的索引 `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `basic_settings`
--
ALTER TABLE `basic_settings`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_admin_id_foreign` (`admin_id`),
  ADD KEY `blogs_category_id_foreign` (`category_id`);

--
-- 表的索引 `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_categories_admin_id_foreign` (`admin_id`);

--
-- 表的索引 `category_types`
--
ALTER TABLE `category_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_types_slug_unique` (`slug`);

--
-- 表的索引 `coinbase_webhook_calls`
--
ALTER TABLE `coinbase_webhook_calls`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `crypto_assets`
--
ALTER TABLE `crypto_assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crypto_assets_payment_gateway_id_foreign` (`payment_gateway_id`);

--
-- 表的索引 `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_flag_unique` (`flag`),
  ADD KEY `currencies_admin_id_foreign` (`admin_id`),
  ADD KEY `currencies_country_index` (`country`),
  ADD KEY `currencies_name_index` (`name`),
  ADD KEY `currencies_code_index` (`code`);

--
-- 表的索引 `exchange_rates`
--
ALTER TABLE `exchange_rates`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `extensions_name_unique` (`name`);

--
-- 表的索引 `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- 表的索引 `faq_sections`
--
ALTER TABLE `faq_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faq_sections_category_id_foreign` (`category_id`);

--
-- 表的索引 `gift_cards`
--
ALTER TABLE `gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gift_cards_user_id_foreign` (`user_id`);

--
-- 表的索引 `gift_card_apis`
--
ALTER TABLE `gift_card_apis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gift_card_apis_provider_unique` (`provider`);

--
-- 表的索引 `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_name_unique` (`name`),
  ADD UNIQUE KEY `languages_code_unique` (`code`),
  ADD KEY `languages_last_edit_by_foreign` (`last_edit_by`);

--
-- 表的索引 `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- 表的索引 `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- 表的索引 `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- 表的索引 `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- 表的索引 `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_gateways_code_unique` (`code`),
  ADD KEY `payment_gateways_last_edit_by_foreign` (`last_edit_by`);

--
-- 表的索引 `payment_gateway_currencies`
--
ALTER TABLE `payment_gateway_currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_gateway_currencies_alias_unique` (`alias`);

--
-- 表的索引 `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- 表的索引 `push_notification_records`
--
ALTER TABLE `push_notification_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `push_notification_records_send_by_foreign` (`send_by`);

--
-- 表的索引 `script`
--
ALTER TABLE `script`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `setup_kycs`
--
ALTER TABLE `setup_kycs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setup_kycs_slug_unique` (`slug`);

--
-- 表的索引 `setup_pages`
--
ALTER TABLE `setup_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setup_pages_slug_unique` (`slug`),
  ADD KEY `setup_pages_last_edit_by_foreign` (`last_edit_by`);

--
-- 表的索引 `setup_seos`
--
ALTER TABLE `setup_seos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setup_seos_last_edit_by_foreign` (`last_edit_by`);

--
-- 表的索引 `site_sections`
--
ALTER TABLE `site_sections`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `stripe_virtual_cards`
--
ALTER TABLE `stripe_virtual_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stripe_virtual_cards_user_id_foreign` (`user_id`);

--
-- 表的索引 `strowallet_virtual_cards`
--
ALTER TABLE `strowallet_virtual_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strowallet_virtual_cards_user_id_foreign` (`user_id`);

--
-- 表的索引 `sudo_virtual_cards`
--
ALTER TABLE `sudo_virtual_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sudo_virtual_cards_user_id_foreign` (`user_id`);

--
-- 表的索引 `temporary_datas`
--
ALTER TABLE `temporary_datas`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_admin_id_foreign` (`admin_id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_user_wallet_id_foreign` (`user_wallet_id`),
  ADD KEY `transactions_payment_gateway_currency_id_foreign` (`payment_gateway_currency_id`);

--
-- 表的索引 `transaction_charges`
--
ALTER TABLE `transaction_charges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_charges_transaction_id_foreign` (`transaction_id`);

--
-- 表的索引 `transaction_devices`
--
ALTER TABLE `transaction_devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_devices_transaction_id_foreign` (`transaction_id`);

--
-- 表的索引 `transaction_settings`
--
ALTER TABLE `transaction_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_settings_admin_id_foreign` (`admin_id`);

--
-- 表的索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_full_mobile_unique` (`full_mobile`),
  ADD KEY `users_mobile_index` (`mobile`);

--
-- 表的索引 `user_authorizations`
--
ALTER TABLE `user_authorizations`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `user_kyc_data`
--
ALTER TABLE `user_kyc_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_kyc_data_user_id_foreign` (`user_id`);

--
-- 表的索引 `user_login_logs`
--
ALTER TABLE `user_login_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_login_logs_user_id_foreign` (`user_id`);

--
-- 表的索引 `user_mail_logs`
--
ALTER TABLE `user_mail_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_mail_logs_user_id_foreign` (`user_id`);

--
-- 表的索引 `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_notifications_user_id_foreign` (`user_id`);

--
-- 表的索引 `user_password_resets`
--
ALTER TABLE `user_password_resets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_password_resets_token_unique` (`token`),
  ADD UNIQUE KEY `user_password_resets_code_unique` (`code`),
  ADD KEY `user_password_resets_user_id_foreign` (`user_id`);

--
-- 表的索引 `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_profiles_user_id_foreign` (`user_id`);

--
-- 表的索引 `user_support_chats`
--
ALTER TABLE `user_support_chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_support_chats_user_support_ticket_id_foreign` (`user_support_ticket_id`);

--
-- 表的索引 `user_support_tickets`
--
ALTER TABLE `user_support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_support_tickets_token_unique` (`token`),
  ADD KEY `user_support_tickets_user_id_foreign` (`user_id`);

--
-- 表的索引 `user_support_ticket_attachments`
--
ALTER TABLE `user_support_ticket_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_support_ticket_attachments_user_support_ticket_id_foreign` (`user_support_ticket_id`);

--
-- 表的索引 `user_wallets`
--
ALTER TABLE `user_wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_wallets_currency_id_foreign` (`currency_id`),
  ADD KEY `user_wallets_user_id_foreign` (`user_id`);

--
-- 表的索引 `virtual_cards`
--
ALTER TABLE `virtual_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `virtual_cards_user_id_foreign` (`user_id`);

--
-- 表的索引 `virtual_card_apis`
--
ALTER TABLE `virtual_card_apis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `virtual_card_apis_admin_id_foreign` (`admin_id`);

--
-- 表的索引 `virtual_card_transactions`
--
ALTER TABLE `virtual_card_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `virtual_card_transactions_user_id_foreign` (`user_id`),
  ADD KEY `virtual_card_transactions_card_id_foreign` (`card_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `admin_has_roles`
--
ALTER TABLE `admin_has_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `admin_login_logs`
--
ALTER TABLE `admin_login_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `admin_role_has_permissions`
--
ALTER TABLE `admin_role_has_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `app_onboard_screens`
--
ALTER TABLE `app_onboard_screens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `basic_settings`
--
ALTER TABLE `basic_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `category_types`
--
ALTER TABLE `category_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `coinbase_webhook_calls`
--
ALTER TABLE `coinbase_webhook_calls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `crypto_assets`
--
ALTER TABLE `crypto_assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `exchange_rates`
--
ALTER TABLE `exchange_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- 使用表AUTO_INCREMENT `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `faq_sections`
--
ALTER TABLE `faq_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `gift_cards`
--
ALTER TABLE `gift_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `gift_card_apis`
--
ALTER TABLE `gift_card_apis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- 使用表AUTO_INCREMENT `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- 使用表AUTO_INCREMENT `payment_gateway_currencies`
--
ALTER TABLE `payment_gateway_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- 使用表AUTO_INCREMENT `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `push_notification_records`
--
ALTER TABLE `push_notification_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `script`
--
ALTER TABLE `script`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `setup_kycs`
--
ALTER TABLE `setup_kycs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `setup_pages`
--
ALTER TABLE `setup_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `setup_seos`
--
ALTER TABLE `setup_seos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `site_sections`
--
ALTER TABLE `site_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `stripe_virtual_cards`
--
ALTER TABLE `stripe_virtual_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `strowallet_virtual_cards`
--
ALTER TABLE `strowallet_virtual_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `sudo_virtual_cards`
--
ALTER TABLE `sudo_virtual_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `temporary_datas`
--
ALTER TABLE `temporary_datas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `transaction_charges`
--
ALTER TABLE `transaction_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `transaction_devices`
--
ALTER TABLE `transaction_devices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `transaction_settings`
--
ALTER TABLE `transaction_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `user_authorizations`
--
ALTER TABLE `user_authorizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `user_kyc_data`
--
ALTER TABLE `user_kyc_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `user_login_logs`
--
ALTER TABLE `user_login_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用表AUTO_INCREMENT `user_mail_logs`
--
ALTER TABLE `user_mail_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `user_password_resets`
--
ALTER TABLE `user_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `user_support_chats`
--
ALTER TABLE `user_support_chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `user_support_tickets`
--
ALTER TABLE `user_support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `user_support_ticket_attachments`
--
ALTER TABLE `user_support_ticket_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `user_wallets`
--
ALTER TABLE `user_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `virtual_cards`
--
ALTER TABLE `virtual_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `virtual_card_apis`
--
ALTER TABLE `virtual_card_apis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `virtual_card_transactions`
--
ALTER TABLE `virtual_card_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 限制导出的表
--

--
-- 限制表 `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_admin_role_id_foreign` FOREIGN KEY (`admin_role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `admin_has_roles`
--
ALTER TABLE `admin_has_roles`
  ADD CONSTRAINT `admin_has_roles_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_has_roles_admin_role_id_foreign` FOREIGN KEY (`admin_role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_has_roles_last_edit_by_foreign` FOREIGN KEY (`last_edit_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `admin_login_logs`
--
ALTER TABLE `admin_login_logs`
  ADD CONSTRAINT `admin_login_logs_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD CONSTRAINT `admin_notifications_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD CONSTRAINT `admin_roles_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `admin_role_has_permissions`
--
ALTER TABLE `admin_role_has_permissions`
  ADD CONSTRAINT `admin_role_has_permissions_admin_role_permission_id_foreign` FOREIGN KEY (`admin_role_permission_id`) REFERENCES `admin_role_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_role_has_permissions_last_edit_by_foreign` FOREIGN KEY (`last_edit_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD CONSTRAINT `admin_role_permissions_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_role_permissions_admin_role_id_foreign` FOREIGN KEY (`admin_role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `app_onboard_screens`
--
ALTER TABLE `app_onboard_screens`
  ADD CONSTRAINT `app_onboard_screens_last_edit_by_foreign` FOREIGN KEY (`last_edit_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD CONSTRAINT `blog_categories_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `crypto_assets`
--
ALTER TABLE `crypto_assets`
  ADD CONSTRAINT `crypto_assets_payment_gateway_id_foreign` FOREIGN KEY (`payment_gateway_id`) REFERENCES `payment_gateways` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `currencies`
--
ALTER TABLE `currencies`
  ADD CONSTRAINT `currencies_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `faq_sections`
--
ALTER TABLE `faq_sections`
  ADD CONSTRAINT `faq_sections_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `gift_cards`
--
ALTER TABLE `gift_cards`
  ADD CONSTRAINT `gift_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `languages`
--
ALTER TABLE `languages`
  ADD CONSTRAINT `languages_last_edit_by_foreign` FOREIGN KEY (`last_edit_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD CONSTRAINT `payment_gateways_last_edit_by_foreign` FOREIGN KEY (`last_edit_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `push_notification_records`
--
ALTER TABLE `push_notification_records`
  ADD CONSTRAINT `push_notification_records_send_by_foreign` FOREIGN KEY (`send_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `setup_pages`
--
ALTER TABLE `setup_pages`
  ADD CONSTRAINT `setup_pages_last_edit_by_foreign` FOREIGN KEY (`last_edit_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `setup_seos`
--
ALTER TABLE `setup_seos`
  ADD CONSTRAINT `setup_seos_last_edit_by_foreign` FOREIGN KEY (`last_edit_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `stripe_virtual_cards`
--
ALTER TABLE `stripe_virtual_cards`
  ADD CONSTRAINT `stripe_virtual_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `strowallet_virtual_cards`
--
ALTER TABLE `strowallet_virtual_cards`
  ADD CONSTRAINT `strowallet_virtual_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `sudo_virtual_cards`
--
ALTER TABLE `sudo_virtual_cards`
  ADD CONSTRAINT `sudo_virtual_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_payment_gateway_currency_id_foreign` FOREIGN KEY (`payment_gateway_currency_id`) REFERENCES `payment_gateway_currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_user_wallet_id_foreign` FOREIGN KEY (`user_wallet_id`) REFERENCES `user_wallets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `transaction_charges`
--
ALTER TABLE `transaction_charges`
  ADD CONSTRAINT `transaction_charges_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `transaction_devices`
--
ALTER TABLE `transaction_devices`
  ADD CONSTRAINT `transaction_devices_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `transaction_settings`
--
ALTER TABLE `transaction_settings`
  ADD CONSTRAINT `transaction_settings_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `user_kyc_data`
--
ALTER TABLE `user_kyc_data`
  ADD CONSTRAINT `user_kyc_data_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `user_login_logs`
--
ALTER TABLE `user_login_logs`
  ADD CONSTRAINT `user_login_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `user_mail_logs`
--
ALTER TABLE `user_mail_logs`
  ADD CONSTRAINT `user_mail_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD CONSTRAINT `user_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `user_password_resets`
--
ALTER TABLE `user_password_resets`
  ADD CONSTRAINT `user_password_resets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `user_support_chats`
--
ALTER TABLE `user_support_chats`
  ADD CONSTRAINT `user_support_chats_user_support_ticket_id_foreign` FOREIGN KEY (`user_support_ticket_id`) REFERENCES `user_support_tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `user_support_tickets`
--
ALTER TABLE `user_support_tickets`
  ADD CONSTRAINT `user_support_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `user_support_ticket_attachments`
--
ALTER TABLE `user_support_ticket_attachments`
  ADD CONSTRAINT `user_support_ticket_attachments_user_support_ticket_id_foreign` FOREIGN KEY (`user_support_ticket_id`) REFERENCES `user_support_tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `user_wallets`
--
ALTER TABLE `user_wallets`
  ADD CONSTRAINT `user_wallets_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `virtual_cards`
--
ALTER TABLE `virtual_cards`
  ADD CONSTRAINT `virtual_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `virtual_card_apis`
--
ALTER TABLE `virtual_card_apis`
  ADD CONSTRAINT `virtual_card_apis_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `virtual_card_transactions`
--
ALTER TABLE `virtual_card_transactions`
  ADD CONSTRAINT `virtual_card_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
