-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2021 at 10:37 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `goodgross`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verification_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `user_id`, `number`, `type`, `verification_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'P-20210518-100000', 'Personal', NULL, 'Verified', '2021-05-18 14:15:59', '2021-05-18 14:20:23'),
(2, 3, 'R-20210604-100000', 'Business', NULL, 'Verified', '2021-06-04 14:22:07', '2021-06-04 14:23:26'),
(3, 4, 'W-20210615-100000', 'Business', NULL, 'Verified', '2021-06-15 15:24:00', '2021-06-15 15:28:30'),
(4, 5, 'G-20211030-100000', 'Guest', NULL, 'Pending', '2021-10-30 05:19:51', '2021-10-30 05:19:51');

-- --------------------------------------------------------

--
-- Table structure for table `account_billings`
--

CREATE TABLE `account_billings` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line_1` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line_2` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account_billings`
--

INSERT INTO `account_billings` (`id`, `account_id`, `first_name`, `last_name`, `email`, `phone`, `address_line_1`, `address_line_2`, `country_id`, `city`, `state`, `postal_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'Umid', 'Tadjitdin', 'abc@gmail.com', '123456', 'Homme House', 'Darker Lane', 223, 'Arizona', 'Arizona', '123456', '2021-10-08 12:37:15', '2021-10-12 21:54:29'),
(2, 2, 'Tasmia', 'Tashahud', 'tasmiatashahud@gmail.com', '1234567890', '1200, Airport Rd', NULL, 223, 'Sedona', 'Arizona', '86336', '2021-10-30 05:38:23', '2021-11-04 02:52:10');

-- --------------------------------------------------------

--
-- Table structure for table `account_cards`
--

CREATE TABLE `account_cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED DEFAULT NULL,
  `card_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `security_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry_month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry_year` year(4) DEFAULT NULL,
  `is_selected` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account_cards`
--

INSERT INTO `account_cards` (`id`, `account_id`, `card_number`, `first_name`, `last_name`, `card_brand`, `security_code`, `expiry_month`, `expiry_year`, `is_selected`, `created_at`, `updated_at`) VALUES
(13, 1, '371449635398431', NULL, NULL, 'American Express', '123', 'December', 2025, 1, '2021-10-25 15:26:37', '2021-10-27 15:02:28'),
(14, 1, '2223003122003222', NULL, NULL, 'MasterCard', '123', 'December', 2026, 0, '2021-10-25 15:27:06', '2021-10-27 15:02:28'),
(26, 2, '6011111111111117', 'Harry', 'Billo', 'Discover', '123', 'December', 2027, 0, '2021-11-05 14:17:41', '2021-11-05 14:22:22'),
(27, 2, '6011000990139424', 'Manka', 'Manu', 'Discover', '123', 'December', 2024, 0, '2021-11-05 14:21:48', '2021-11-05 14:22:22'),
(28, 2, '378282246310005', 'Lira', 'Mann', 'American Express', '123', 'December', 2025, 1, '2021-11-05 14:22:22', '2021-11-05 14:22:22');

-- --------------------------------------------------------

--
-- Table structure for table `account_payment_methods`
--

CREATE TABLE `account_payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_method_id` int(10) UNSIGNED DEFAULT NULL,
  `authorization_values` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account_payment_methods`
--

INSERT INTO `account_payment_methods` (`id`, `account_id`, `payment_method_id`, `authorization_values`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '{\"client_id\":\"AaBY170KNAtOgmKNCRIfmFeWTvUt_aNRsiqs4j8_vEF9z3JUpvwvuNhXkbbUb7woMrcxokmAWsMNsO2j\",\"secret\":\"ENGrKblRXBbBdz1g4YiR8zYLzfCkXxxdPH1I1OrwS-Xdgq4PjxcgTZtoMwtvEq6Ls1qBz0KdwKjyiahl\",\"mode\":\"sandbox\"}', NULL, NULL, '2020-09-01 15:27:41', '2020-09-01 15:27:41'),
(2, 2, 2, '{\"client_id\":\"GG20\",\"secret\":\"UmidGG\",\"mode\":\"sandbox\"}', NULL, NULL, '2020-09-27 19:14:59', '2020-09-27 19:14:59');

-- --------------------------------------------------------

--
-- Table structure for table `account_shippings`
--

CREATE TABLE `account_shippings` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line_1` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line_2` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_selected` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account_shippings`
--

INSERT INTO `account_shippings` (`id`, `account_id`, `first_name`, `last_name`, `email`, `phone`, `address_line_1`, `address_line_2`, `country_id`, `city`, `state`, `postal_code`, `is_selected`, `created_at`, `updated_at`) VALUES
(6, 1, 'David', 'Dhawana', 'info@scoutbeyond.com', '123456789', 'Samoa House', 'American Lane', 223, 'Samoa', 'Alaska', '123456', 1, '2021-10-27 11:15:43', '2021-10-27 12:49:56'),
(10, 2, 'Melan', 'Jola', 'info@melanjola.com', '56931556', 'Lane 25, Parker Street', NULL, 223, 'Manda', 'Delaware', '63001', 1, '2021-11-04 01:08:41', '2021-11-04 01:34:19');

-- --------------------------------------------------------

--
-- Table structure for table `business_accounts`
--

CREATE TABLE `business_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `business_accounts`
--

INSERT INTO `business_accounts` (`id`, `account_id`, `type`, `name`, `address`, `email`, `phone`, `country`, `state`, `image`, `created_at`, `updated_at`) VALUES
(1, 2, 'Retail', 'Arizona Traders', NULL, 'tasmiatashahud@gmail.com', '+1234567890', 'United States', 'Arizona', NULL, '2021-06-04 14:22:07', '2021-06-04 14:22:07'),
(2, 3, 'Wholesale', 'Olsen Agro Industries', NULL, 'mrtest714@gmail.com', '+1963852741', 'United States', 'California', NULL, '2021-06-15 15:24:00', '2021-06-15 15:28:03');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `root_id` int(10) UNSIGNED DEFAULT NULL,
  `category_type_id` int(10) UNSIGNED DEFAULT NULL,
  `level` int(10) UNSIGNED DEFAULT NULL,
  `property_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sequence` double UNSIGNED DEFAULT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `narrative` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `root_id`, `category_type_id`, `level`, `property_ids`, `image`, `icon`, `sequence`, `status`, `narrative`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Motors', 0, 1, 1, '---', NULL, 'img/category/motors.png', 1, 'Active', '---', NULL, NULL, '2020-03-13 12:56:33', '2020-03-29 10:16:39'),
(2, 'Cars & Trucks', 1, 1, 2, '---', NULL, NULL, 1, 'Active', '---', NULL, NULL, '2020-03-13 12:57:00', '2020-03-29 10:16:47'),
(3, 'Convertible', 2, 1, 3, '1,2,3,4,5,6,21,23,25,9,10,11,12,13,14,15,16,17,18,19,20', NULL, NULL, 3, 'Active', '---', NULL, NULL, '2020-03-13 13:28:46', '2021-06-10 13:51:30'),
(4, 'Pickup', 2, 1, 3, '1,2,3,4,5,6,41,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40', NULL, NULL, 2, 'Active', '---', NULL, NULL, '2020-03-29 10:18:47', '2020-03-31 14:48:11'),
(5, 'Van', 2, 1, 3, '---', NULL, NULL, 1, 'Active', '---', NULL, NULL, '2020-03-31 14:48:39', '2020-03-31 15:21:43'),
(6, 'Animals & Fishes (Live)', 0, 2, 1, '---', NULL, NULL, 1, 'Active', '---', NULL, NULL, '2020-05-06 01:36:13', '2020-05-06 01:36:13'),
(7, 'Bovine Animals', 6, 2, 2, '35,36,37,42,43,44,47,48,49,50,51,52,53,54,55,45,46', NULL, NULL, 1, 'Active', '---', NULL, NULL, '2020-05-06 01:38:31', '2020-07-14 12:27:38'),
(8, 'Motorcycles', 1, 1, 2, '---', NULL, NULL, 2, 'Active', '---', NULL, NULL, '2020-06-01 02:07:37', '2020-06-01 02:07:37'),
(9, 'Cruiser', 8, 1, 3, '1,2,3,4,5,6,7,8,41,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,34,35,36,37,38,39,40', NULL, NULL, 4, 'Active', '---', NULL, NULL, '2020-06-01 02:09:10', '2020-06-01 02:09:10'),
(10, 'Dual Sport', 8, 1, 3, '---', NULL, NULL, 5, 'Active', '---', NULL, NULL, '2020-06-01 02:09:25', '2020-06-01 02:09:25'),
(11, 'Sport', 8, 1, 3, '---', NULL, NULL, 6, 'Active', '---', NULL, NULL, '2020-06-01 02:09:46', '2020-06-01 02:09:46'),
(12, 'Scooter', 8, 1, 3, '---', NULL, NULL, 7, 'Active', '---', NULL, NULL, '2020-06-01 02:10:38', '2020-06-01 02:10:38'),
(13, 'Classic', 8, 1, 3, '---', NULL, NULL, 8, 'Active', '---', NULL, NULL, '2020-06-01 02:11:07', '2020-06-01 02:11:07'),
(14, 'Trailers', 1, 1, 2, '---', NULL, NULL, 3, 'Active', '---', NULL, NULL, '2020-06-01 02:12:11', '2020-06-01 02:12:11'),
(15, 'Busses', 1, 1, 2, '---', NULL, NULL, 4, 'Active', '---', NULL, NULL, '2020-06-01 10:00:56', '2020-06-01 10:00:56'),
(16, 'Farming & Forestry Machinery', 1, 1, 2, '---', NULL, NULL, 5, 'Active', '---', NULL, NULL, '2020-06-01 10:02:03', '2020-06-01 10:02:03'),
(17, 'Boats', 1, 1, 2, '---', NULL, NULL, 6, 'Active', '---', NULL, NULL, '2020-06-01 10:02:34', '2020-06-01 10:02:34'),
(18, 'Commercial Trucks & Trailers', 1, 1, 2, '---', NULL, NULL, 7, 'Active', '---', NULL, NULL, '2020-06-01 10:20:15', '2020-06-01 10:20:15'),
(19, 'Light Duty Trucks', 18, 1, 3, '---', NULL, NULL, 9, 'Active', '---', NULL, NULL, '2020-06-01 13:37:27', '2020-06-01 13:37:27'),
(20, 'Medium Duty Trucks', 18, 1, 3, '---', NULL, NULL, 10, 'Active', '---', NULL, NULL, '2020-06-01 13:37:46', '2020-06-01 13:37:46'),
(21, 'Heavy Duty Trucks', 18, 1, 3, '---', NULL, NULL, 11, 'Active', '---', NULL, NULL, '2020-06-01 13:38:00', '2020-06-01 13:38:00'),
(22, 'Cell phones & Accessories', 0, 1, 1, '---', NULL, 'img/category/cell_phones_and_accessories.png', 2, 'Active', '---', NULL, NULL, '2020-06-01 13:39:58', '2020-06-01 13:39:58'),
(23, 'Electronics & Supplies', 0, 1, 1, '---', NULL, 'img/category/electronics_and_supplies.png', 3, 'Active', '---', NULL, NULL, '2020-06-01 13:40:15', '2020-06-01 13:40:15'),
(24, 'Equipments, Machines & Instruments', 0, 1, 1, '---', NULL, 'img/category/equipments_machines_and_instruments.png', 4, 'Active', '---', NULL, NULL, '2020-06-01 13:40:51', '2020-06-01 13:40:51'),
(25, 'Computers & Tablets', 0, 1, 1, '---', NULL, 'img/category/computers_and_tablets.png', 5, 'Active', '---', NULL, NULL, '2020-06-01 13:41:10', '2020-06-01 13:41:10'),
(26, 'DVDs, Movies & Music', 0, 1, 1, '---', NULL, 'img/category/dvds_movies_and_music.png', 6, 'Active', '---', NULL, NULL, '2020-06-01 13:41:26', '2020-06-01 13:41:26'),
(27, 'Books', 0, 1, 1, '---', NULL, 'img/category/books.png', 7, 'Active', '---', NULL, NULL, '2020-06-01 13:41:44', '2020-06-01 13:41:44'),
(28, 'Sports', 0, 1, 1, '---', NULL, 'img/category/sports.png', 8, 'Active', '---', NULL, NULL, '2020-06-01 13:41:53', '2020-06-01 13:41:53'),
(29, 'Home, Indoor & Outdoor', 0, 1, 1, '---', NULL, 'img/category/home_indoor_and_outdoor.png', 9, 'Active', '---', NULL, NULL, '2020-06-01 13:42:12', '2020-06-01 13:42:12'),
(30, 'Beauty & Body Care', 0, 1, 1, '---', NULL, 'img/category/beauty_and_body_care.png', 10, 'Active', '---', NULL, NULL, '2020-06-01 13:42:36', '2020-06-01 13:42:36'),
(31, 'Clothing, Shoes & Accessories', 0, 1, 1, '---', NULL, 'img/category/clothing_shoes_and_accessories.png', 11, 'Active', '---', NULL, NULL, '2020-06-01 13:42:58', '2020-06-01 13:42:58'),
(32, 'Office Supplies', 0, 1, 1, '---', NULL, 'img/category/office_supplies.png', 12, 'Active', '---', NULL, NULL, '2020-06-01 13:43:21', '2020-06-01 13:43:21'),
(33, 'Furniture & Accessories', 0, 1, 1, '---', NULL, 'img/category/furniture_and_accessories.png', 13, 'Active', '---', NULL, NULL, '2020-06-01 13:43:39', '2020-06-01 13:43:39'),
(34, 'Toys', 0, 1, 1, '---', NULL, 'img/category/toys.png', 14, 'Active', '---', NULL, NULL, '2020-06-01 13:43:59', '2020-06-01 13:43:59'),
(35, 'Tools', 0, 1, 1, '---', NULL, 'img/category/tools.png', 15, 'Active', '---', NULL, NULL, '2020-06-01 13:44:06', '2020-06-01 13:44:06'),
(36, 'Builders Hardware', 0, 1, 1, '---', NULL, 'img/category/builders_hardware.png', 16, 'Active', '---', NULL, NULL, '2020-06-01 13:44:35', '2020-06-01 13:44:35'),
(37, 'Construction, Industrial Materials', 0, 1, 1, '---', NULL, 'img/category/construction_industrial_materials.png', 17, 'Active', '---', NULL, NULL, '2020-06-01 13:44:50', '2020-06-01 13:44:50'),
(38, 'Gift, Decorations, Wrapping & Paper Products', 0, 1, 1, '---', NULL, 'img/category/gift_decorations_wrapping_and_paper_products.png', 18, 'Active', '---', NULL, NULL, '2020-06-01 13:45:06', '2020-06-01 13:45:06'),
(39, 'Kitchen, Kitchenware & Utensils', 0, 1, 1, '---', NULL, 'img/category/kitchen_kitchenware_and_utensils.png', 19, 'Active', '---', NULL, NULL, '2020-06-01 13:45:22', '2020-06-01 13:45:22'),
(40, 'Suitcases & Bags', 0, 1, 1, '---', NULL, 'img/category/suitcases_and_bags.png', 20, 'Active', '---', NULL, NULL, '2020-06-01 13:45:37', '2020-06-01 13:45:37'),
(41, 'For My Pets', 0, 1, 1, '---', NULL, 'img/category/for_my_pets.png', 21, 'Active', '---', NULL, NULL, '2020-06-01 13:45:52', '2020-06-01 13:45:52'),
(42, 'Cereal Grains and Beans', 0, 2, 1, '---', NULL, NULL, 2, 'Active', '---', NULL, NULL, '2020-06-01 13:46:33', '2020-06-01 13:46:33'),
(43, 'Agricultural Products', 0, 2, 1, '---', NULL, NULL, 3, 'Active', '---', NULL, NULL, '2020-06-01 13:48:56', '2020-06-01 13:48:56'),
(44, 'Animal Products and Feed', 0, 2, 1, '---', NULL, NULL, 4, 'Active', '---', NULL, NULL, '2020-06-01 13:49:17', '2020-06-01 13:49:17'),
(45, 'Meat, Poultry, Fish, Seafood, and Their Preparations', 0, 2, 1, '---', NULL, NULL, 5, 'Active', '---', NULL, NULL, '2020-06-01 13:49:39', '2020-06-01 13:49:39'),
(46, 'Milled Grain Products and Preparations, and Bakery Products', 0, 2, 1, '---', NULL, NULL, 6, 'Active', '---', NULL, NULL, '2020-06-01 13:49:55', '2020-06-01 13:49:55'),
(47, 'Processed Foodstuffs, Fats, Oils', 0, 2, 1, '---', NULL, NULL, 7, 'Active', '---', NULL, NULL, '2020-06-01 13:51:29', '2020-06-01 13:51:29'),
(48, 'Alcoholic Beverages, Denatured Alcohol', 0, 2, 1, '---', NULL, NULL, 8, 'Active', '---', NULL, NULL, '2020-06-01 13:51:48', '2020-06-01 13:51:48'),
(49, 'Tobacco Products', 0, 2, 1, '---', NULL, NULL, 9, 'Active', '---', NULL, NULL, '2020-06-01 13:52:03', '2020-06-01 13:52:03'),
(50, 'Natural Stones', 0, 2, 1, '---', NULL, NULL, 10, 'Active', '---', NULL, NULL, '2020-06-01 13:52:17', '2020-06-01 13:52:17'),
(51, 'Natural Sands', 0, 2, 1, '---', NULL, NULL, 11, 'Active', '---', NULL, NULL, '2020-06-01 13:52:31', '2020-06-02 13:12:23'),
(52, 'Gravel and Crushed Stone', 0, 2, 1, '---', NULL, NULL, 12, 'Active', '---', NULL, NULL, '2020-06-01 13:53:24', '2020-06-01 13:53:24'),
(53, 'Non Metallic, Minerals', 0, 2, 1, '---', NULL, NULL, 13, 'Active', '---', NULL, NULL, '2020-06-01 13:53:42', '2020-06-01 13:53:42'),
(54, 'Metals', 0, 2, 1, '---', NULL, NULL, 14, 'Active', '---', NULL, NULL, '2020-06-01 13:54:03', '2020-06-01 13:54:03'),
(55, 'Coal', 0, 2, 1, '---', NULL, NULL, 15, 'Active', '---', NULL, NULL, '2020-06-01 13:54:11', '2020-06-01 13:54:11'),
(56, 'Crude Petroleum', 0, 2, 1, '---', NULL, NULL, 16, 'Active', '---', NULL, NULL, '2020-06-01 13:54:44', '2020-06-01 13:54:44'),
(57, 'Fuel liquids', 0, 2, 1, '---', NULL, NULL, 17, 'Active', '---', NULL, NULL, '2020-06-01 13:54:59', '2020-06-01 13:54:59'),
(58, 'Fuel Oils', 0, 2, 1, '---', NULL, NULL, 18, 'Active', '---', NULL, NULL, '2020-06-01 13:55:21', '2020-06-01 13:55:21'),
(59, 'Plastics and Rubber', 0, 2, 1, '---', NULL, NULL, 19, 'Active', '---', NULL, NULL, '2020-06-01 13:55:44', '2020-06-01 13:55:44'),
(60, 'Logs and Other Wood in the Rough', 0, 2, 1, '---', NULL, NULL, 20, 'Active', '---', NULL, NULL, '2020-06-01 13:56:07', '2020-06-01 13:56:07'),
(61, 'Wood Products', 0, 2, 1, '---', NULL, NULL, 21, 'Active', '---', NULL, NULL, '2020-06-01 13:56:31', '2020-06-01 13:56:31'),
(62, 'Pulp, Newsprint, Paper, Paperboard', 0, 2, 1, '---', NULL, NULL, 22, 'Active', '---', NULL, NULL, '2020-06-01 14:09:39', '2020-06-01 14:09:39'),
(63, 'Paper or Paperboard Articles', 0, 2, 1, '---', NULL, NULL, 23, 'Active', '---', NULL, NULL, '2020-06-01 14:11:21', '2020-06-01 14:11:21'),
(64, 'Printed Products', 0, 2, 1, '---', NULL, NULL, 24, 'Active', '---', NULL, NULL, '2020-06-01 14:12:41', '2020-06-01 14:12:41'),
(65, 'Textiles, Leather, and Articles of Textiles or Leather', 0, 2, 1, '---', NULL, NULL, 25, 'Active', '---', NULL, NULL, '2020-06-01 14:12:58', '2020-06-01 14:12:58'),
(66, 'Non-Metallic Mineral Products', 0, 2, 1, '---', NULL, NULL, 26, 'Active', '---', NULL, NULL, '2020-06-01 14:13:13', '2020-06-01 14:13:13'),
(67, 'Base Metal in Primary or Semi-Finished Forms and in Finished Basic Shapes', 0, 2, 1, '---', NULL, NULL, 27, 'Active', '---', NULL, NULL, '2020-06-01 14:13:24', '2020-06-01 14:13:24'),
(68, 'Articles of Base Metal', 0, 2, 1, '---', NULL, NULL, 28, 'Active', '---', NULL, NULL, '2020-06-01 14:13:35', '2020-06-01 14:13:35'),
(69, 'Machinery', 0, 2, 1, '---', NULL, NULL, 29, 'Active', '---', NULL, NULL, '2020-06-01 14:13:46', '2020-06-01 14:13:46'),
(70, 'Electronic, Domestic Electrical Equipment, Components, Office Equipment', 0, 2, 1, '---', NULL, NULL, 30, 'Active', '---', NULL, NULL, '2020-06-01 14:13:57', '2020-06-01 14:13:57'),
(71, 'Motorized and Other Vehicles, Parts', 0, 2, 1, '---', NULL, NULL, 31, 'Active', '---', NULL, NULL, '2020-06-01 14:14:09', '2020-06-01 14:14:09'),
(72, 'Transportation Equipment, not Elsewhere Classified', 0, 2, 1, '---', NULL, NULL, 32, 'Active', '---', NULL, NULL, '2020-06-01 14:14:32', '2020-06-01 14:14:32'),
(73, 'Precision Instruments & Apparatus', 0, 2, 1, '---', NULL, NULL, 33, 'Active', '---', NULL, NULL, '2020-06-01 14:14:48', '2020-06-01 14:14:48'),
(74, 'Furniture, Mattresses & Mattress Supports, Lamps, Lighting Fittings, Illuminated Signs', 0, 2, 1, '---', NULL, NULL, 34, 'Active', '---', NULL, NULL, '2020-06-01 14:15:11', '2020-06-01 14:15:11'),
(75, 'Miscellaneous Manufactured Products', 0, 2, 1, '---', NULL, NULL, 35, 'Active', '---', NULL, NULL, '2020-06-01 14:15:21', '2020-06-01 14:15:21'),
(76, 'Waste and Scrap', 0, 2, 1, '---', NULL, NULL, 36, 'Active', '---', NULL, NULL, '2020-06-01 14:15:30', '2020-06-01 14:15:30'),
(77, 'Mixed Freight', 0, 2, 1, '---', NULL, NULL, 37, 'Active', '---', NULL, NULL, '2020-06-01 14:15:41', '2020-06-01 14:15:41'),
(78, 'Coal and Petroleum Products', 0, 2, 1, '---', NULL, NULL, 38, 'Active', '---', NULL, NULL, '2020-06-01 15:49:23', '2020-06-01 15:49:23'),
(79, 'Live Swine', 6, 2, 2, '---', NULL, NULL, 2, 'Active', '---', NULL, NULL, '2020-06-02 11:59:31', '2020-06-02 11:59:31'),
(80, 'Live Poultry', 6, 2, 2, '---', NULL, NULL, 3, 'Active', '---', NULL, NULL, '2020-06-02 11:59:38', '2020-06-02 11:59:38'),
(81, 'Live Fish, Bait and Shellfish', 6, 2, 2, '---', NULL, NULL, 4, 'Active', '---', NULL, NULL, '2020-06-02 12:00:00', '2020-06-02 12:00:00'),
(82, 'Grains', 42, 2, 2, '---', NULL, NULL, 5, 'Active', '---', NULL, NULL, '2020-06-02 12:00:28', '2020-06-02 12:00:28'),
(83, 'Beans', 42, 2, 2, '---', NULL, NULL, 6, 'Active', '---', NULL, NULL, '2020-06-02 12:00:32', '2020-06-02 12:00:32'),
(84, 'Fresh Vegetables', 43, 2, 2, '---', NULL, NULL, 7, 'Active', '---', NULL, NULL, '2020-06-02 12:00:56', '2020-06-02 12:00:56'),
(85, 'Chilled or Dried Veggies, Fungus', 43, 2, 2, '---', NULL, NULL, 8, 'Active', '---', NULL, NULL, '2020-06-02 12:01:08', '2020-06-02 12:01:08'),
(86, 'Fresh Fruits', 43, 2, 2, '26,27,28,29,30,34,36,37,38,40,41,49,31,32,42,43,45,35,44,46,47,48', NULL, NULL, 9, 'Active', '---', NULL, NULL, '2020-06-02 12:01:22', '2021-06-15 15:47:59'),
(87, 'Nuts and Dried Fruits', 43, 2, 2, '---', NULL, NULL, 10, 'Active', '---', NULL, NULL, '2020-06-02 12:01:33', '2020-06-02 12:01:33'),
(88, 'Seeds, Bulbs', 43, 2, 2, '---', NULL, NULL, 11, 'Active', '---', NULL, NULL, '2020-06-02 12:01:53', '2020-06-02 12:01:53'),
(89, 'Fresh-Cut Plants and Flowers', 43, 2, 2, '---', NULL, NULL, 12, 'Active', '---', NULL, NULL, '2020-06-02 12:02:11', '2020-06-02 12:02:11'),
(90, 'Coffee Beans, Tea Leafs', 43, 2, 2, '---', NULL, NULL, 13, 'Active', '---', NULL, NULL, '2020-06-02 12:02:21', '2020-06-02 12:02:21'),
(91, 'Agricultural Waste', 43, 2, 2, '---', NULL, NULL, 14, 'Active', '---', NULL, NULL, '2020-06-02 12:03:03', '2020-06-02 12:03:03'),
(92, 'Animal Feeds', 44, 2, 2, '---', NULL, NULL, 15, 'Active', '---', NULL, NULL, '2020-06-02 12:03:25', '2020-06-02 12:03:25'),
(93, 'Animal Products', 44, 2, 2, '---', NULL, NULL, 16, 'Active', '---', NULL, NULL, '2020-06-02 12:03:35', '2020-06-02 12:03:35'),
(94, 'Meat', 45, 2, 2, '---', NULL, NULL, 17, 'Active', '---', NULL, NULL, '2020-06-02 12:04:01', '2020-06-02 12:04:01'),
(95, 'Fish, Seafood', 45, 2, 2, '---', NULL, NULL, 18, 'Active', '---', NULL, NULL, '2020-06-02 12:04:09', '2020-06-02 12:04:09'),
(96, 'Preparations, Extracts, Juices', 45, 2, 2, '---', NULL, NULL, 19, 'Active', '---', NULL, NULL, '2020-06-02 12:04:21', '2020-06-02 12:04:21'),
(97, 'Milled Grain Products', 46, 2, 2, '---', NULL, NULL, 20, 'Active', '---', NULL, NULL, '2020-06-02 13:02:04', '2020-06-02 13:02:04'),
(98, 'Food Preparations', 46, 2, 2, '---', NULL, NULL, 21, 'Active', '---', NULL, NULL, '2020-06-02 13:02:22', '2020-06-02 13:02:22'),
(99, 'Baked Products', 46, 2, 2, '---', NULL, NULL, 22, 'Active', '---', NULL, NULL, '2020-06-02 13:02:34', '2020-06-02 13:02:34'),
(100, 'Dairy Products', 47, 2, 2, '---', NULL, NULL, 23, 'Active', '---', NULL, NULL, '2020-06-02 13:03:00', '2020-06-02 13:03:00'),
(101, 'Processed Vegetables', 47, 2, 2, '---', NULL, NULL, 24, 'Active', '---', NULL, NULL, '2020-06-02 13:03:15', '2020-06-02 13:03:15'),
(102, 'Processed Fruit', 47, 2, 2, '---', NULL, NULL, 25, 'Active', '---', NULL, NULL, '2020-06-02 13:03:32', '2020-06-02 13:03:32'),
(103, 'Processed Nuts', 47, 2, 2, '---', NULL, NULL, 26, 'Active', '---', NULL, NULL, '2020-06-02 13:03:46', '2020-06-02 13:03:46'),
(104, 'Coffee, Tea, Spices', 47, 2, 2, '---', NULL, NULL, 27, 'Active', '---', NULL, NULL, '2020-06-02 13:03:56', '2020-06-02 13:03:56'),
(105, 'Sugars, Cocoa, Confectionery', 47, 2, 2, '---', NULL, NULL, 28, 'Active', '---', NULL, NULL, '2020-06-02 13:04:17', '2020-06-02 13:04:17'),
(106, 'Edible Preparations, Vinegar & Prepared Foods', 47, 2, 2, '---', NULL, NULL, 29, 'Active', '---', NULL, NULL, '2020-06-02 13:04:34', '2020-06-02 13:04:34'),
(107, 'Water, Non-Alcoholic Beverages, Ice', 47, 2, 2, '---', NULL, NULL, 30, 'Active', '---', NULL, NULL, '2020-06-02 13:04:59', '2020-06-02 13:04:59'),
(108, 'Beer, Malt Beer', 48, 2, 2, '---', NULL, NULL, 31, 'Active', '---', NULL, NULL, '2020-06-02 13:05:23', '2020-06-02 13:05:23'),
(109, 'Wine', 48, 2, 2, '---', NULL, NULL, 32, 'Active', '---', NULL, NULL, '2020-06-02 13:06:19', '2020-06-02 13:06:19'),
(110, 'Fermented Beverages', 48, 2, 2, '---', NULL, NULL, 33, 'Active', '---', NULL, NULL, '2020-06-02 13:06:25', '2020-06-02 13:06:25'),
(111, 'Spirituous, Distillate Beverages', 48, 2, 2, '---', NULL, NULL, 34, 'Active', '---', NULL, NULL, '2020-06-02 13:06:41', '2020-06-02 13:06:41'),
(112, 'Ethyl Alcohol', 48, 2, 2, '---', NULL, NULL, 35, 'Active', '---', NULL, NULL, '2020-06-02 13:06:56', '2020-06-02 13:06:56'),
(113, 'Cigarettes', 49, 2, 2, '---', NULL, NULL, 36, 'Active', '---', NULL, NULL, '2020-06-02 13:08:13', '2020-06-02 13:08:13'),
(114, 'Tobacco Products', 49, 2, 2, '---', NULL, NULL, 37, 'Active', '---', NULL, NULL, '2020-06-02 13:08:30', '2020-06-02 13:08:30'),
(115, 'Monumental Stone', 50, 2, 2, '---', NULL, NULL, 38, 'Active', '---', NULL, NULL, '2020-06-02 13:09:15', '2020-06-02 13:09:15'),
(116, 'Building Stone', 50, 2, 2, '---', NULL, NULL, 39, 'Active', '---', NULL, NULL, '2020-06-02 13:09:30', '2020-06-02 13:09:30'),
(117, 'Calcareous Stone', 50, 2, 2, '---', NULL, NULL, 40, 'Active', '---', NULL, NULL, '2020-06-02 13:09:44', '2020-06-02 13:09:44'),
(118, 'Slate Stone', 50, 2, 2, '---', NULL, NULL, 41, 'Active', '---', NULL, NULL, '2020-06-02 13:10:09', '2020-06-02 13:10:09'),
(119, 'Silica Sands', 51, 2, 2, '---', NULL, NULL, 42, 'Active', '---', NULL, NULL, '2020-06-02 13:10:32', '2020-06-02 13:10:32'),
(120, 'Quartz Sands', 51, 2, 2, '---', NULL, NULL, 43, 'Active', '---', NULL, NULL, '2020-06-02 13:10:46', '2020-06-02 13:10:46'),
(121, 'Feldspathic Sands', 51, 2, 2, '---', NULL, NULL, 44, 'Active', '---', NULL, NULL, '2020-06-02 13:11:05', '2020-06-02 13:11:05'),
(122, 'Filter Sands', 51, 2, 2, '---', NULL, NULL, 45, 'Active', '---', NULL, NULL, '2020-06-02 13:11:22', '2020-06-02 13:11:22'),
(123, 'Fire Sands', 51, 2, 2, '---', NULL, NULL, 46, 'Active', '---', NULL, NULL, '2020-06-02 13:11:34', '2020-06-02 13:11:34'),
(124, 'Clayey, Kaolinic Sands', 51, 2, 2, '---', NULL, NULL, 47, 'Active', '---', NULL, NULL, '2020-06-02 13:11:48', '2020-06-02 13:11:48'),
(125, 'Sand/Salt Mix', 51, 2, 2, '---', NULL, NULL, 48, 'Active', '---', NULL, NULL, '2020-06-02 13:12:04', '2020-06-02 13:12:04'),
(126, 'Shoes', 31, 1, 2, '1,2,3,4,5,6,7,8,21,22,23,9,10,11,12,13,14,15,16,17,18,19,20', NULL, NULL, 8, 'Active', '---', NULL, NULL, '2020-12-19 14:26:05', '2020-12-19 14:26:46');

-- --------------------------------------------------------

--
-- Table structure for table `category_types`
--

CREATE TABLE `category_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sequence` double UNSIGNED DEFAULT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `narrative` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_types`
--

INSERT INTO `category_types` (`id`, `category_type`, `sequence`, `status`, `narrative`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Retail', NULL, 'Active', '---', 1, NULL, '2020-02-26 18:00:00', '2020-02-26 18:00:00'),
(2, 'Wholesale', NULL, 'Active', '---', 1, NULL, '2020-02-26 18:00:00', '2020-02-26 18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `connected_accounts`
--

CREATE TABLE `connected_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED DEFAULT NULL,
  `connected_account_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connected_account_object` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `connected_account_origin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `connected_accounts`
--

INSERT INTO `connected_accounts` (`id`, `account_id`, `connected_account_id`, `connected_account_object`, `connected_account_origin`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'acct_1IsZOtPtQgMLmwUt', 'Stripe\\Account JSON: {\n    \"id\": \"acct_1IsZOtPtQgMLmwUt\",\n    \"object\": \"account\",\n    \"business_profile\": {\n        \"mcc\": null,\n        \"name\": null,\n        \"product_description\": null,\n        \"support_address\": null,\n        \"support_email\": null,\n        \"support_phone\": null,\n        \"support_url\": null,\n        \"url\": null\n    },\n    \"business_type\": null,\n    \"capabilities\": {\n        \"card_payments\": \"inactive\",\n        \"transfers\": \"inactive\"\n    },\n    \"charges_enabled\": false,\n    \"country\": \"US\",\n    \"created\": 1621369224,\n    \"default_currency\": \"usd\",\n    \"details_submitted\": false,\n    \"email\": \"seaudbd@gmail.com\",\n    \"external_accounts\": {\n        \"object\": \"list\",\n        \"data\": [],\n        \"has_more\": false,\n        \"total_count\": 0,\n        \"url\": \"\\/v1\\/accounts\\/acct_1IsZOtPtQgMLmwUt\\/external_accounts\"\n    },\n    \"login_links\": {\n        \"object\": \"list\",\n        \"total_count\": 0,\n        \"has_more\": false,\n        \"url\": \"\\/v1\\/accounts\\/acct_1IsZOtPtQgMLmwUt\\/login_links\",\n        \"data\": []\n    },\n    \"metadata\": [],\n    \"payouts_enabled\": false,\n    \"requirements\": {\n        \"current_deadline\": null,\n        \"currently_due\": [\n            \"business_profile.mcc\",\n            \"business_profile.url\",\n            \"business_type\",\n            \"external_account\",\n            \"representative.first_name\",\n            \"representative.last_name\",\n            \"tos_acceptance.date\",\n            \"tos_acceptance.ip\"\n        ],\n        \"disabled_reason\": \"requirements.past_due\",\n        \"errors\": [],\n        \"eventually_due\": [\n            \"business_profile.mcc\",\n            \"business_profile.url\",\n            \"business_type\",\n            \"external_account\",\n            \"representative.first_name\",\n            \"representative.last_name\",\n            \"tos_acceptance.date\",\n            \"tos_acceptance.ip\"\n        ],\n        \"past_due\": [\n            \"business_profile.mcc\",\n            \"business_profile.url\",\n            \"business_type\",\n            \"external_account\",\n            \"representative.first_name\",\n            \"representative.last_name\",\n            \"tos_acceptance.date\",\n            \"tos_acceptance.ip\"\n        ],\n        \"pending_verification\": []\n    },\n    \"settings\": {\n        \"bacs_debit_payments\": [],\n        \"branding\": {\n            \"icon\": null,\n            \"logo\": null,\n            \"primary_color\": null,\n            \"secondary_color\": null\n        },\n        \"card_issuing\": {\n            \"tos_acceptance\": {\n                \"date\": null,\n                \"ip\": null\n            }\n        },\n        \"card_payments\": {\n            \"decline_on\": {\n                \"avs_failure\": false,\n                \"cvc_failure\": false\n            },\n            \"statement_descriptor_prefix\": null\n        },\n        \"dashboard\": {\n            \"display_name\": null,\n            \"timezone\": \"Etc\\/UTC\"\n        },\n        \"payments\": {\n            \"statement_descriptor\": null,\n            \"statement_descriptor_kana\": null,\n            \"statement_descriptor_kanji\": null\n        },\n        \"payouts\": {\n            \"debit_negative_balances\": true,\n            \"schedule\": {\n                \"delay_days\": 2,\n                \"interval\": \"daily\"\n            },\n            \"statement_descriptor\": null\n        },\n        \"sepa_debit_payments\": []\n    },\n    \"tos_acceptance\": {\n        \"date\": null,\n        \"ip\": null,\n        \"user_agent\": null\n    },\n    \"type\": \"express\"\n}', 'Stripe', 'Pending', '2021-05-18 14:20:33', '2021-05-18 14:20:33'),
(2, 2, 'acct_1IyjYCPxzSZGTLrg', 'Stripe\\Account JSON: {\n    \"id\": \"acct_1IyjYCPxzSZGTLrg\",\n    \"object\": \"account\",\n    \"business_profile\": {\n        \"mcc\": null,\n        \"name\": null,\n        \"product_description\": null,\n        \"support_address\": null,\n        \"support_email\": null,\n        \"support_phone\": null,\n        \"support_url\": null,\n        \"url\": null\n    },\n    \"business_type\": null,\n    \"capabilities\": {\n        \"card_payments\": \"inactive\",\n        \"transfers\": \"inactive\"\n    },\n    \"charges_enabled\": false,\n    \"country\": \"US\",\n    \"created\": 1622838209,\n    \"default_currency\": \"usd\",\n    \"details_submitted\": false,\n    \"email\": \"tasmiatashahud@gmail.com\",\n    \"external_accounts\": {\n        \"object\": \"list\",\n        \"data\": [],\n        \"has_more\": false,\n        \"total_count\": 0,\n        \"url\": \"\\/v1\\/accounts\\/acct_1IyjYCPxzSZGTLrg\\/external_accounts\"\n    },\n    \"login_links\": {\n        \"object\": \"list\",\n        \"total_count\": 0,\n        \"has_more\": false,\n        \"url\": \"\\/v1\\/accounts\\/acct_1IyjYCPxzSZGTLrg\\/login_links\",\n        \"data\": []\n    },\n    \"metadata\": [],\n    \"payouts_enabled\": false,\n    \"requirements\": {\n        \"current_deadline\": null,\n        \"currently_due\": [\n            \"business_profile.mcc\",\n            \"business_profile.url\",\n            \"business_type\",\n            \"external_account\",\n            \"representative.first_name\",\n            \"representative.last_name\",\n            \"tos_acceptance.date\",\n            \"tos_acceptance.ip\"\n        ],\n        \"disabled_reason\": \"requirements.past_due\",\n        \"errors\": [],\n        \"eventually_due\": [\n            \"business_profile.mcc\",\n            \"business_profile.url\",\n            \"business_type\",\n            \"external_account\",\n            \"representative.first_name\",\n            \"representative.last_name\",\n            \"tos_acceptance.date\",\n            \"tos_acceptance.ip\"\n        ],\n        \"past_due\": [\n            \"business_profile.mcc\",\n            \"business_profile.url\",\n            \"business_type\",\n            \"external_account\",\n            \"representative.first_name\",\n            \"representative.last_name\",\n            \"tos_acceptance.date\",\n            \"tos_acceptance.ip\"\n        ],\n        \"pending_verification\": []\n    },\n    \"settings\": {\n        \"bacs_debit_payments\": [],\n        \"branding\": {\n            \"icon\": null,\n            \"logo\": null,\n            \"primary_color\": null,\n            \"secondary_color\": null\n        },\n        \"card_issuing\": {\n            \"tos_acceptance\": {\n                \"date\": null,\n                \"ip\": null\n            }\n        },\n        \"card_payments\": {\n            \"decline_on\": {\n                \"avs_failure\": false,\n                \"cvc_failure\": false\n            },\n            \"statement_descriptor_prefix\": null\n        },\n        \"dashboard\": {\n            \"display_name\": null,\n            \"timezone\": \"Etc\\/UTC\"\n        },\n        \"payments\": {\n            \"statement_descriptor\": null,\n            \"statement_descriptor_kana\": null,\n            \"statement_descriptor_kanji\": null\n        },\n        \"payouts\": {\n            \"debit_negative_balances\": true,\n            \"schedule\": {\n                \"delay_days\": 2,\n                \"interval\": \"daily\"\n            },\n            \"statement_descriptor\": null\n        },\n        \"sepa_debit_payments\": []\n    },\n    \"tos_acceptance\": {\n        \"date\": null,\n        \"ip\": null,\n        \"user_agent\": null\n    },\n    \"type\": \"express\"\n}', 'Stripe', 'Pending', '2021-06-04 14:23:31', '2021-06-04 14:23:31'),
(3, 3, 'acct_1J2joBPxMRzgXwHU', 'Stripe\\Account JSON: {\n    \"id\": \"acct_1J2joBPxMRzgXwHU\",\n    \"object\": \"account\",\n    \"business_profile\": {\n        \"mcc\": null,\n        \"name\": null,\n        \"product_description\": null,\n        \"support_address\": null,\n        \"support_email\": null,\n        \"support_phone\": null,\n        \"support_url\": null,\n        \"url\": null\n    },\n    \"business_type\": null,\n    \"capabilities\": {\n        \"card_payments\": \"inactive\",\n        \"transfers\": \"inactive\"\n    },\n    \"charges_enabled\": false,\n    \"country\": \"US\",\n    \"created\": 1623792511,\n    \"default_currency\": \"usd\",\n    \"details_submitted\": false,\n    \"email\": \"mrtest714@gmail.com\",\n    \"external_accounts\": {\n        \"object\": \"list\",\n        \"data\": [],\n        \"has_more\": false,\n        \"total_count\": 0,\n        \"url\": \"\\/v1\\/accounts\\/acct_1J2joBPxMRzgXwHU\\/external_accounts\"\n    },\n    \"login_links\": {\n        \"object\": \"list\",\n        \"total_count\": 0,\n        \"has_more\": false,\n        \"url\": \"\\/v1\\/accounts\\/acct_1J2joBPxMRzgXwHU\\/login_links\",\n        \"data\": []\n    },\n    \"metadata\": [],\n    \"payouts_enabled\": false,\n    \"requirements\": {\n        \"current_deadline\": null,\n        \"currently_due\": [\n            \"business_profile.mcc\",\n            \"business_profile.url\",\n            \"business_type\",\n            \"external_account\",\n            \"representative.first_name\",\n            \"representative.last_name\",\n            \"tos_acceptance.date\",\n            \"tos_acceptance.ip\"\n        ],\n        \"disabled_reason\": \"requirements.past_due\",\n        \"errors\": [],\n        \"eventually_due\": [\n            \"business_profile.mcc\",\n            \"business_profile.url\",\n            \"business_type\",\n            \"external_account\",\n            \"representative.first_name\",\n            \"representative.last_name\",\n            \"tos_acceptance.date\",\n            \"tos_acceptance.ip\"\n        ],\n        \"past_due\": [\n            \"business_profile.mcc\",\n            \"business_profile.url\",\n            \"business_type\",\n            \"external_account\",\n            \"representative.first_name\",\n            \"representative.last_name\",\n            \"tos_acceptance.date\",\n            \"tos_acceptance.ip\"\n        ],\n        \"pending_verification\": []\n    },\n    \"settings\": {\n        \"bacs_debit_payments\": [],\n        \"branding\": {\n            \"icon\": null,\n            \"logo\": null,\n            \"primary_color\": null,\n            \"secondary_color\": null\n        },\n        \"card_issuing\": {\n            \"tos_acceptance\": {\n                \"date\": null,\n                \"ip\": null\n            }\n        },\n        \"card_payments\": {\n            \"decline_on\": {\n                \"avs_failure\": false,\n                \"cvc_failure\": false\n            },\n            \"statement_descriptor_prefix\": null\n        },\n        \"dashboard\": {\n            \"display_name\": null,\n            \"timezone\": \"Etc\\/UTC\"\n        },\n        \"payments\": {\n            \"statement_descriptor\": null,\n            \"statement_descriptor_kana\": null,\n            \"statement_descriptor_kanji\": null\n        },\n        \"payouts\": {\n            \"debit_negative_balances\": true,\n            \"schedule\": {\n                \"delay_days\": 2,\n                \"interval\": \"daily\"\n            },\n            \"statement_descriptor\": null\n        },\n        \"sepa_debit_payments\": []\n    },\n    \"tos_acceptance\": {\n        \"date\": null,\n        \"ip\": null,\n        \"user_agent\": null\n    },\n    \"type\": \"express\"\n}', 'Stripe', 'Pending', '2021-06-15 15:28:34', '2021-06-15 15:28:34');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capital` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `currency_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dialling_code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`, `capital`, `region`, `currency_code`, `currency_symbol`, `flag`, `dialling_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AF', 'Kabul', 'AS', 'AFN', '؋', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AF.svg', '+93', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(2, 'Albania', 'AL', 'Tirana', 'EU', 'ALL', 'L', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AL.svg', '+355', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(3, 'Algeria', 'DZ', 'Algiers', 'AF', 'DZD', 'د.ج', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/DZ.svg', '+213', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(4, 'American Samoa', 'AS', 'Pago Pago', 'OC', 'USD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AS.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(5, 'Andorra', 'AD', 'Andorra la Vella', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AD.svg', '+376', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:41'),
(6, 'Angola', 'AO', 'Luanda', 'AF', 'AOA', 'Kz', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AO.svg', '+244', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(7, 'Anguilla', 'AI', 'The Valley', 'NA', 'XCD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AI.svg', '+43', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(8, 'Antigua and Barbuda', 'AG', 'Saint John\'s', 'NA', 'XCD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AG.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(9, 'Argentina', 'AR', 'Buenos Aires', 'SA', 'ARS', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AR.svg', '+54', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(10, 'Armenia', 'AM', 'Yerevan', 'AS', 'AMD', NULL, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AM.svg', '+374', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(11, 'Aruba', 'AW', 'Oranjestad', 'SA', 'AWG', 'ƒ', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AW.svg', '+297', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(12, 'Australia', 'AU', 'Canberra', 'OC', 'AUD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AU.svg', '+61', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(13, 'Azerbaijan', 'AZ', 'Baku', 'AS', 'AZN', NULL, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AZ.svg', '+994', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(14, 'Bahamas', 'BS', 'Nassau', 'NA', 'BSD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BS.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(15, 'Bahrain', 'BH', 'Manama', 'AS', 'BHD', '.د.ب', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BH.svg', '+973', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(16, 'Bangladesh', 'BD', 'Dhaka', 'AS', 'BDT', '৳', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BD.svg', '+880', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(17, 'Barbados', 'BB', 'Bridgetown', 'NA', 'BBD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BB.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(18, 'Belarus', 'BY', 'Minsk', 'EU', 'BYN', 'Br', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BY.svg', '+375', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(19, 'Belgium', 'BE', 'Brussels', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BE.svg', '+32', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(20, 'Belize', 'BZ', 'Belmopan', 'NA', 'BZD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BZ.svg', '+501', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(21, 'Benin', 'BJ', 'Porto-Novo', 'AF', 'XOF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BJ.svg', '+229', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(22, 'Bermuda', 'BM', 'Hamilton', 'NA', 'BMD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BM.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(23, 'Bhutan', 'BT', 'Thimphu', 'AS', 'BTN', 'Nu.', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BT.svg', '+975', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(24, 'Bolivia (Plurinational State of)', 'BO', 'Sucre', 'SA', 'BOB', 'Bs.', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BO.svg', '+591', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(25, 'Bosnia and Herzegovina', 'BA', 'Sarajevo', 'EU', 'BAM', NULL, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BA.svg', '+387', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(26, 'Botswana', 'BW', 'Gaborone', 'AF', 'BWP', 'P', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BW.svg', '+267', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(27, 'Brazil', 'BR', 'Brasília', 'SA', 'BRL', 'R$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BR.svg', '+55', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(28, 'British Indian Ocean Territory', 'IO', 'Diego Garcia', 'AF', 'USD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IO.svg', '+246', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(29, 'Virgin Islands (British)', 'VG', 'Road Town', 'NA', 'USD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/VG.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(30, 'Virgin Islands (U.S.)', 'VI', 'Charlotte Amalie', 'NA', 'USD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/VI.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(31, 'Brunei Darussalam', 'BN', 'Bandar Seri Begawan', 'AS', 'BND', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BN.svg', '+673', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(32, 'Bulgaria', 'BG', 'Sofia', 'EU', 'BGN', 'лв', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BG.svg', '+359', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(33, 'Burkina Faso', 'BF', 'Ouagadougou', 'AF', 'XOF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BF.svg', '+226', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(34, 'Burundi', 'BI', 'Bujumbura', 'AF', 'BIF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BI.svg', '+257', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(35, 'Cambodia', 'KH', 'Phnom Penh', 'AS', 'KHR', '៛', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/KH.svg', '+855', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(36, 'Cameroon', 'CM', 'Yaoundé', 'AF', 'XAF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CM.svg', '+237', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(37, 'Canada', 'CA', 'Ottawa', 'NA', 'CAD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CA.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(38, 'Cabo Verde', 'CV', 'Praia', 'AF', 'CVE', 'Esc', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CV.svg', '+238', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(39, 'Cayman Islands', 'KY', 'George Town', 'NA', 'KYD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/KY.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(40, 'Central African Republic', 'CF', 'Bangui', 'AF', 'XAF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CF.svg', '+236', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(41, 'Central African Republic', 'CF', 'Bangui', 'AF', 'XAF', 'Fr', 'https://restcountries.eu/data/caf.svg', '+236', 'Active', '2021-11-03 13:17:12', '2021-11-03 13:17:12'),
(42, 'Chile', 'CL', 'Santiago', 'SA', 'CLP', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CL.svg', '+56', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(43, 'China', 'CN', 'Beijing', 'AS', 'CNY', '¥', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CN.svg', '+86', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(44, 'Colombia', 'CO', 'Bogotá', 'SA', 'COP', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CO.svg', '+57', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(45, 'Comoros', 'KM', 'Moroni', 'AF', 'KMF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/KM.svg', '+269', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(46, 'Congo', 'CG', 'Brazzaville', 'AF', 'XAF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CG.svg', '+242', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(47, 'Congo (Democratic Republic of the)', 'CD', 'Kinshasa', 'AF', 'CDF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CD.svg', '+243', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(48, 'Cook Islands', 'CK', 'Avarua', 'OC', 'NZD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CK.svg', '+682', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(49, 'Costa Rica', 'CR', 'San José', 'NA', 'CRC', '₡', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CR.svg', '+506', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(50, 'Croatia', 'HR', 'Zagreb', 'EU', 'HRK', 'kn', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/HR.svg', '+385', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(51, 'Cuba', 'CU', 'Havana', 'NA', 'CUC', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CU.svg', '+53', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(52, 'Cuba', 'CU', 'Havana', 'NA', 'CUC', '$', 'https://restcountries.eu/data/cub.svg', '+53', 'Active', '2021-11-03 13:17:12', '2021-11-03 13:17:12'),
(53, 'Cyprus', 'CY', 'Nicosia', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CY.svg', '+357', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(54, 'Czech Republic', 'CZ', 'Prague', 'EU', 'CZK', 'Kč', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CZ.svg', '+420', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(55, 'Denmark', 'DK', 'Copenhagen', 'EU', 'DKK', 'kr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/DK.svg', '+45', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(56, 'Djibouti', 'DJ', 'Djibouti', 'AF', 'DJF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/DJ.svg', '+253', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(57, 'Dominica', 'DM', 'Roseau', 'NA', 'XCD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/DM.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(58, 'Dominican Republic', 'DO', 'Santo Domingo', 'NA', 'DOP', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/DO.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(59, 'Ecuador', 'EC', 'Quito', 'SA', 'USD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/EC.svg', '+593', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(60, 'Egypt', 'EG', 'Cairo', 'AF', 'EGP', '£', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/EG.svg', '+20', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(61, 'El Salvador', 'SV', 'San Salvador', 'NA', 'USD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SV.svg', '+503', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(62, 'Equatorial Guinea', 'GQ', 'Malabo', 'AF', 'XAF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GQ.svg', '+240', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(63, 'Eritrea', 'ER', 'Asmara', 'AF', 'ERN', 'Nfk', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ER.svg', '+291', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(64, 'Estonia', 'EE', 'Tallinn', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/EE.svg', '+372', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(65, 'Ethiopia', 'ET', 'Addis Ababa', 'AF', 'ETB', 'Br', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ET.svg', '+251', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(66, 'Falkland Islands (Malvinas)', 'FK', 'Stanley', 'SA', 'FKP', '£', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/FK.svg', '+500', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(67, 'Faroe Islands', 'FO', 'Tórshavn', 'EU', 'DKK', 'kr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/FO.svg', '+298', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(68, 'Fiji', 'FJ', 'Suva', 'OC', 'FJD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/FJ.svg', '+679', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(69, 'Finland', 'FI', 'Helsinki', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/FI.svg', '+358', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(70, 'France', 'FR', 'Paris', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/FR.svg', '+33', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(71, 'French Guiana', 'GF', 'Cayenne', 'SA', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GF.svg', '+594', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(72, 'French Polynesia', 'PF', 'Papeetē', 'OC', 'XPF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PF.svg', '+689', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(73, 'Gabon', 'GA', 'Libreville', 'AF', 'XAF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GA.svg', '+241', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(74, 'Gambia', 'GM', 'Banjul', 'AF', 'GMD', 'D', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GM.svg', '+220', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(75, 'Georgia', 'GE', 'Tbilisi', 'AS', 'GEL', 'ლ', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GE.svg', '+995', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(76, 'Germany', 'DE', 'Berlin', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/DE.svg', '+49', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(77, 'Ghana', 'GH', 'Accra', 'AF', 'GHS', '₵', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GH.svg', '+233', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(78, 'Gibraltar', 'GI', 'Gibraltar', 'EU', 'GIP', '£', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GI.svg', '+350', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(79, 'Greece', 'GR', 'Athens', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GR.svg', '+30', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(80, 'Greenland', 'GL', 'Nuuk', 'NA', 'DKK', 'kr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GL.svg', '+299', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(81, 'Grenada', 'GD', 'St. George\'s', 'NA', 'XCD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GD.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(82, 'Guadeloupe', 'GP', 'Basse-Terre', 'NA', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GP.svg', '+590', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(83, 'Guam', 'GU', 'Hagåtña', 'OC', 'USD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GU.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(84, 'Guatemala', 'GT', 'Guatemala City', 'NA', 'GTQ', 'Q', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GT.svg', '+502', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(85, 'Guinea', 'GN', 'Conakry', 'AF', 'GNF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GN.svg', '+224', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(86, 'Guinea-Bissau', 'GW', 'Bissau', 'AF', 'XOF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GW.svg', '+245', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(87, 'Guyana', 'GY', 'Georgetown', 'SA', 'GYD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GY.svg', '+592', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(88, 'Haiti', 'HT', 'Port-au-Prince', 'Americas', 'HTG', 'G', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/HT.svg', '+509', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(89, 'Holy See', 'VA', 'Rome', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/VA.svg', '+39', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(90, 'Honduras', 'HN', 'Tegucigalpa', 'NA', 'HNL', 'L', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/HN.svg', '+504', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(91, 'Hong Kong', 'HK', 'City of Victoria', 'AS', 'HKD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/HK.svg', '+852', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(92, 'Hungary', 'HU', 'Budapest', 'EU', 'HUF', 'Ft', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/HU.svg', '+36', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(93, 'Iceland', 'IS', 'Reykjavík', 'EU', 'ISK', 'kr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IS.svg', '+354', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(94, 'India', 'IN', 'New Delhi', 'AS', 'INR', '₹', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IN.svg', '+91', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(95, 'Indonesia', 'ID', 'Jakarta', 'AS', 'IDR', 'Rp', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ID.svg', '+62', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(96, 'Côte d\'Ivoire', 'CI', 'Yamoussoukro', 'AF', 'XOF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CI.svg', '+225', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(97, 'Iran (Islamic Republic of)', 'IR', 'Tehran', 'AS', 'IRR', '﷼', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IR.svg', '+98', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(98, 'Iraq', 'IQ', 'Baghdad', 'AS', 'IQD', 'ع.د', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IQ.svg', '+964', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(99, 'Ireland', 'IE', 'Dublin', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IE.svg', '+353', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(100, 'Israel', 'IL', 'Jerusalem', 'AS', 'ILS', '₪', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IL.svg', '+972', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(101, 'Italy', 'IT', 'Rome', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IT.svg', '+39', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(102, 'Jamaica', 'JM', 'Kingston', 'NA', 'JMD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/JM.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(103, 'Japan', 'JP', 'Tokyo', 'AS', 'JPY', '¥', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/JP.svg', '+81', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(104, 'Jordan', 'JO', 'Amman', 'AS', 'JOD', 'د.ا', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/JO.svg', '+962', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(105, 'Kazakhstan', 'KZ', 'Astana', 'AS', 'KZT', NULL, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/KZ.svg', '+7', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(106, 'Kenya', 'KE', 'Nairobi', 'AF', 'KES', 'Sh', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/KE.svg', '+254', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(107, 'Kiribati', 'KI', 'South Tarawa', 'OC', 'AUD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/KI.svg', '+686', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(108, 'Kuwait', 'KW', 'Kuwait City', 'AS', 'KWD', 'د.ك', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/KW.svg', '+965', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(109, 'Kyrgyzstan', 'KG', 'Bishkek', 'AS', 'KGS', 'с', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/KG.svg', '+996', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(110, 'Lao People\'s Democratic Republic', 'LA', 'Vientiane', 'AS', 'LAK', '₭', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LA.svg', '+856', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(111, 'Latvia', 'LV', 'Riga', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LV.svg', '+371', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(112, 'Lebanon', 'LB', 'Beirut', 'AS', 'LBP', 'ل.ل', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LB.svg', '+961', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(113, 'Lesotho', 'LS', 'Maseru', 'AF', 'LSL', 'L', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LS.svg', '+266', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(114, 'Liberia', 'LR', 'Monrovia', 'AF', 'LRD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LR.svg', '+231', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(115, 'Libya', 'LY', 'Tripoli', 'AF', 'LYD', 'ل.د', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LY.svg', '+218', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(116, 'Liechtenstein', 'LI', 'Vaduz', 'EU', 'CHF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LI.svg', '+423', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(117, 'Lithuania', 'LT', 'Vilnius', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LT.svg', '+370', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(118, 'Luxembourg', 'LU', 'Luxembourg', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LU.svg', '+352', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(119, 'Macao', 'MO', '', 'AS', 'MOP', 'P', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MO.svg', '+853', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(120, 'Macedonia (the former Yugoslav Republic of)', 'MK', 'Skopje', 'EU', 'MKD', 'ден', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MK.svg', '+389', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(121, 'Madagascar', 'MG', 'Antananarivo', 'AF', 'MGA', 'Ar', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MG.svg', '+261', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(122, 'Malawi', 'MW', 'Lilongwe', 'AF', 'MWK', 'MK', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MW.svg', '+265', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(123, 'Malaysia', 'MY', 'Kuala Lumpur', 'AS', 'MYR', 'RM', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MY.svg', '+60', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(124, 'Maldives', 'MV', 'Malé', 'AS', 'MVR', '.ރ', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MV.svg', '+960', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(125, 'Mali', 'ML', 'Bamako', 'AF', 'XOF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ML.svg', '+223', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(126, 'Malta', 'MT', 'Valletta', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MT.svg', '+356', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(127, 'Marshall Islands', 'MH', 'Majuro', 'OC', 'USD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MH.svg', '+692', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(128, 'Martinique', 'MQ', 'Fort-de-France', 'Americas', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MQ.svg', '+596', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(129, 'Mauritania', 'MR', 'Nouakchott', 'AF', 'MRO', 'UM', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MR.svg', '+222', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(130, 'Mauritius', 'MU', 'Port Louis', 'AF', 'MUR', '₨', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MU.svg', '+230', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(131, 'Mayotte', 'YT', 'Mamoudzou', 'AF', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/YT.svg', '+262', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(132, 'Mexico', 'MX', 'Mexico City', 'NA', 'MXN', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MX.svg', '+52', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(133, 'Micronesia (Federated States of)', 'FM', 'Palikir', 'OC', 'USD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/FM.svg', '+691', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(134, 'Moldova (Republic of)', 'MD', 'Chișinău', 'EU', 'MDL', 'L', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MD.svg', '+373', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(135, 'Monaco', 'MC', 'Monaco', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MC.svg', '+377', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(136, 'Mongolia', 'MN', 'Ulan Bator', 'AS', 'MNT', '₮', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MN.svg', '+976', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(137, 'Montenegro', 'ME', 'Podgorica', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ME.svg', '+382', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(138, 'Montserrat', 'MS', 'Plymouth', 'NA', 'XCD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MS.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(139, 'Morocco', 'MA', 'Rabat', 'AF', 'MAD', 'د.م.', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MA.svg', '+212', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(140, 'Mozambique', 'MZ', 'Maputo', 'AF', 'MZN', 'MT', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MZ.svg', '+258', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(141, 'Myanmar', 'MM', 'Naypyidaw', 'AS', 'MMK', 'Ks', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MM.svg', '+95', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(142, 'Namibia', 'NA', 'Windhoek', 'AF', 'NAD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NA.svg', '+264', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(143, 'Nauru', 'NR', 'Yaren', 'OC', 'AUD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NR.svg', '+674', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(144, 'Nepal', 'NP', 'Kathmandu', 'AS', 'NPR', '₨', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NP.svg', '+977', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(145, 'Netherlands', 'NL', 'Amsterdam', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NL.svg', '+31', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(146, 'New Caledonia', 'NC', 'Nouméa', 'OC', 'XPF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NC.svg', '+687', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(147, 'New Zealand', 'NZ', 'Wellington', 'OC', 'NZD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NZ.svg', '+64', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(148, 'Nicaragua', 'NI', 'Managua', 'NA', 'NIO', 'C$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NI.svg', '+505', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(149, 'Niger', 'NE', 'Niamey', 'AF', 'XOF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NE.svg', '+227', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(150, 'Nigeria', 'NG', 'Abuja', 'AF', 'NGN', '₦', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NG.svg', '+234', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(151, 'Niue', 'NU', 'Alofi', 'OC', 'NZD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NU.svg', '+683', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(152, 'Norfolk Island', 'NF', 'Kingston', 'OC', 'AUD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NF.svg', '+672', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(153, 'Korea (Democratic People\'s Republic of)', 'KP', 'Pyongyang', 'AS', 'KPW', '₩', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/KP.svg', '+850', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(154, 'Northern Mariana Islands', 'MP', 'Saipan', 'OC', 'USD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MP.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(155, 'Norway', 'NO', 'Oslo', 'EU', 'NOK', 'kr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NO.svg', '+47', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(156, 'Oman', 'OM', 'Muscat', 'AS', 'OMR', 'ر.ع.', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/OM.svg', '+968', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(157, 'Pakistan', 'PK', 'Islamabad', 'AS', 'PKR', '₨', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PK.svg', '+92', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(158, 'Palau', 'PW', 'Ngerulmud', 'OC', 'USD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PW.svg', '+680', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(159, 'Palestine, State of', 'PS', 'Ramallah', 'AS', 'ILS', '₪', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PS.svg', '+970', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(160, 'Panama', 'PA', 'Panama City', 'NA', 'USD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PA.svg', '+507', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(161, 'Papua New Guinea', 'PG', 'Port Moresby', 'OC', 'PGK', 'K', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PG.svg', '+675', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(162, 'Paraguay', 'PY', 'Asunción', 'SA', 'PYG', '₲', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PY.svg', '+595', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(163, 'Peru', 'PE', 'Lima', 'SA', 'PEN', 'S/.', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PE.svg', '+51', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(164, 'Philippines', 'PH', 'Manila', 'AS', 'PHP', '₱', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PH.svg', '+63', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(165, 'Poland', 'PL', 'Warsaw', 'EU', 'PLN', 'zł', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PL.svg', '+48', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(166, 'Portugal', 'PT', 'Lisbon', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PT.svg', '+351', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(167, 'Puerto Rico', 'PR', 'San Juan', 'NA', 'USD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PR.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(168, 'Qatar', 'QA', 'Doha', 'AS', 'QAR', 'ر.ق', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/QA.svg', '+974', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(169, 'Republic of Kosovo', 'XK', 'Pristina', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/XK.svg', '+381', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(170, 'Réunion', 'RE', 'Saint-Denis', 'AF', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/RE.svg', '+262', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(171, 'Romania', 'RO', 'Bucharest', 'EU', 'RON', 'lei', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/RO.svg', '+40', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(172, 'Russian Federation', 'RU', 'Moscow', 'EU', 'RUB', '₽', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/RU.svg', '+7', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(173, 'Rwanda', 'RW', 'Kigali', 'AF', 'RWF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/RW.svg', '+250', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(174, 'Saint Barthélemy', 'BL', 'Gustavia', 'NA', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BL.svg', '+590', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(175, 'Saint Helena, Ascension and Tristan da Cunha', 'SH', 'Jamestown', 'AF', 'SHP', '£', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SH.svg', '+290', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(176, 'Saint Kitts and Nevis', 'KN', 'Basseterre', 'NA', 'XCD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/KN.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(177, 'Saint Lucia', 'LC', 'Castries', 'NA', 'XCD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LC.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(178, 'Saint Martin (French part)', 'MF', 'Marigot', 'NA', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MF.svg', '+590', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(179, 'Saint Pierre and Miquelon', 'PM', 'Saint-Pierre', 'NA', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PM.svg', '+508', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(180, 'Saint Vincent and the Grenadines', 'VC', 'Kingstown', 'NA', 'XCD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/VC.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(181, 'Samoa', 'WS', 'Apia', 'OC', 'WST', 'T', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/WS.svg', '+685', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(182, 'San Marino', 'SM', 'City of San Marino', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SM.svg', '+378', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(183, 'Sao Tome and Principe', 'ST', 'São Tomé', 'AF', 'STD', 'Db', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ST.svg', '+239', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(184, 'Saudi Arabia', 'SA', 'Riyadh', 'AS', 'SAR', 'ر.س', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SA.svg', '+966', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(185, 'Senegal', 'SN', 'Dakar', 'AF', 'XOF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SN.svg', '+221', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(186, 'Serbia', 'RS', 'Belgrade', 'EU', 'RSD', 'дин.', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/RS.svg', '+381', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(187, 'Seychelles', 'SC', 'Victoria', 'AF', 'SCR', '₨', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SC.svg', '+248', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(188, 'Sierra Leone', 'SL', 'Freetown', 'AF', 'SLL', 'Le', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SL.svg', '+232', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(189, 'Singapore', 'SG', 'Singapore', 'AS', 'SGD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SG.svg', '+65', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(190, 'Singapore', 'SG', 'Singapore', 'AS', 'SGD', '$', 'https://restcountries.eu/data/sgp.svg', '+65', 'Active', '2021-11-03 13:17:12', '2021-11-03 13:17:12'),
(191, 'Slovakia', 'SK', 'Bratislava', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SK.svg', '+421', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(192, 'Slovenia', 'SI', 'Ljubljana', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SI.svg', '+386', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(193, 'Solomon Islands', 'SB', 'Honiara', 'OC', 'SBD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SB.svg', '+677', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(194, 'Somalia', 'SO', 'Mogadishu', 'AF', 'SOS', 'Sh', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SO.svg', '+252', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(195, 'South Africa', 'ZA', 'Pretoria', 'AF', 'ZAR', 'R', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ZA.svg', '+27', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(196, 'Korea (Republic of)', 'KR', 'Seoul', 'AS', 'KRW', '₩', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/KR.svg', '+82', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(197, 'Spain', 'ES', 'Madrid', 'EU', 'EUR', '€', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ES.svg', '+34', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(198, 'Sri Lanka', 'LK', 'Colombo', 'AS', 'LKR', 'Rs', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LK.svg', '+94', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(199, 'Sudan', 'SD', 'Khartoum', 'AF', 'SDG', 'ج.س.', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SD.svg', '+249', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(200, 'Suriname', 'SR', 'Paramaribo', 'SA', 'SRD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SR.svg', '+597', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(201, 'Swaziland', 'SZ', 'Lobamba', 'AF', 'SZL', 'L', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SZ.svg', '+268', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(202, 'Sweden', 'SE', 'Stockholm', 'EU', 'SEK', 'kr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SE.svg', '+46', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(203, 'Switzerland', 'CH', 'Bern', 'EU', 'CHF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CH.svg', '+41', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(204, 'Syrian Arab Republic', 'SY', 'Damascus', 'AS', 'SYP', '£', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SY.svg', '+963', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(205, 'Taiwan', 'TW', 'Taipei', 'AS', 'TWD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TW.svg', '+886', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(206, 'Tajikistan', 'TJ', 'Dushanbe', 'AS', 'TJS', 'ЅМ', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TJ.svg', '+992', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(207, 'Tanzania', 'TZ', 'Dodoma', 'AF', 'TZS', 'Sh', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TZ.svg', '+255', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(208, 'Thailand', 'TH', 'Bangkok', 'AS', 'THB', '฿', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TH.svg', '+66', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(209, 'Timor-Leste', 'TL', 'Dili', 'AS', 'USD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TL.svg', '+670', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(210, 'Togo', 'TG', 'Lomé', 'AF', 'XOF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TG.svg', '+228', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(211, 'Tokelau', 'TK', 'Fakaofo', 'OC', 'NZD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TK.svg', '+690', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(212, 'Tonga', 'TO', 'Nuku\'alofa', 'OC', 'TOP', 'T$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TO.svg', '+676', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(213, 'Trinidad and Tobago', 'TT', 'Port of Spain', 'SA', 'TTD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TT.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(214, 'Tunisia', 'TN', 'Tunis', 'AF', 'TND', 'د.ت', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TN.svg', '+216', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(215, 'Turkey', 'TR', 'Ankara', 'AS', 'TRY', NULL, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TR.svg', '+90', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(216, 'Turkmenistan', 'TM', 'Ashgabat', 'AS', 'TMT', 'm', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TM.svg', '+993', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(217, 'Turks and Caicos Islands', 'TC', 'Cockburn Town', 'NA', 'USD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TC.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(218, 'Tuvalu', 'TV', 'Funafuti', 'OC', 'AUD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TV.svg', '+688', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(219, 'Uganda', 'UG', 'Kampala', 'AF', 'UGX', 'Sh', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/UG.svg', '+256', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(220, 'Ukraine', 'UA', 'Kiev', 'EU', 'UAH', '₴', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/UA.svg', '+380', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(221, 'United Arab Emirates', 'AE', 'Abu Dhabi', 'AS', 'AED', 'د.إ', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AE.svg', '+971', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(222, 'United Kingdom', 'GB', 'London', 'EU', 'GBP', '£', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GB.svg', '+44', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(223, 'United States', 'US', 'Washington, D.C.', 'NA', 'USD', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/US.svg', '+1', 'Active', '2021-11-03 13:17:12', '2021-11-03 13:17:12'),
(224, 'Uruguay', 'UY', 'Montevideo', 'SA', 'UYU', '$', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/UY.svg', '+598', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(225, 'Uzbekistan', 'UZ', 'Tashkent', 'AS', 'UZS', NULL, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/UZ.svg', '+998', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(226, 'Vanuatu', 'VU', 'Port Vila', 'OC', 'VUV', 'Vt', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/VU.svg', '+678', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(227, 'Venezuela (Bolivarian Republic of)', 'VE', 'Caracas', 'SA', 'VEF', 'Bs F', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/VE.svg', '+58', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(228, 'Viet Nam', 'VN', 'Hanoi', 'AS', 'VND', '₫', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/VN.svg', '+84', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(229, 'Wallis and Futuna', 'WF', 'Mata-Utu', 'OC', 'XPF', 'Fr', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/WF.svg', '+681', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(230, 'Wallis and Futuna', 'WF', 'Mata-Utu', 'OC', 'XPF', 'Fr', 'https://restcountries.eu/data/wlf.svg', '+681', 'Active', '2021-11-03 13:17:12', '2021-11-03 13:17:12'),
(231, 'Yemen', 'YE', 'Sana\'a', 'AS', 'YER', '﷼', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/YE.svg', '+967', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(232, 'Zambia', 'ZM', 'Lusaka', 'AF', 'ZMW', 'ZK', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ZM.svg', '+260', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42'),
(233, 'Zimbabwe', 'ZW', 'Harare', 'AF', 'BWP', 'P', 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ZW.svg', '+263', 'Active', '2021-11-03 13:17:12', '2021-11-03 14:21:42');

-- --------------------------------------------------------

--
-- Table structure for table `guest_accounts`
--

CREATE TABLE `guest_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `guest_accounts`
--

INSERT INTO `guest_accounts` (`id`, `account_id`, `first_name`, `last_name`, `email`, `phone`, `image`, `created_at`, `updated_at`) VALUES
(1, 4, 'Bilal', 'Mahmud', 'root@archiverz.com', '+123985563', NULL, '2021-10-30 05:19:51', '2021-10-30 05:19:51');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `root_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `menu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operation_list` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accessibilities` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accessibility_count` tinyint(3) UNSIGNED DEFAULT NULL,
  `sequence` double UNSIGNED DEFAULT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `narrative` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `root_id`, `menu`, `route_group`, `method`, `route`, `controller`, `action`, `operation_list`, `accessibilities`, `accessibility_count`, `sequence`, `status`, `narrative`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 0, 'Dashboard', 'Admin', 'get', 'admin/dashboard/{id}', 'DashboardController', 'index', NULL, NULL, NULL, 1, 'Active', '---', 1, NULL, '2019-04-01 09:13:39', '2019-04-22 07:34:58'),
(2, 0, 'Configuration', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'Active', '', 1, NULL, '2019-04-01 09:13:39', '2019-04-22 07:34:58'),
(3, 2, 'Category Type', 'Admin\\Configuration', 'get,get,get,post,post,post', 'admin/configuration/category/type/{id},admin/configuration/category/type/gets/{search_string}/{record_per_page},admin/configuration/category/type/get/{id},admin/configuration/category/type/save,admin/configuration/category/type/apply/bulk/operation,admin/configuration/category/type/delete', 'CategoryTypeController', 'index,gets,get,save,applyBulkOperation,delete', 'activeMenuValue:Configuration,activeSubMenuValue:Category Type,activeMenuId:2,activeSubMenuId:3,recordPerPage:10', NULL, NULL, 4, 'Active', '---', 1, NULL, '2019-03-30 18:00:00', '2019-04-22 01:34:59'),
(4, 2, 'Section', 'Admin\\Configuration', 'get,get,get,post,post,post', 'admin/configuration/section/{id},admin/configuration/section/gets/{search_string}/{record_per_page},admin/configuration/section/get/{id},admin/configuration/section/save,admin/configuration/section/apply/bulk/operation,admin/configuration/section/delete', 'SectionController', 'index,gets,get,save,applyBulkOperation,delete', 'activeMenuValue:Configuration,activeSubMenuValue:Section,activeMenuId:2,activeSubMenuId:4,recordPerPage:10', NULL, NULL, 4, 'Active', '---', 1, NULL, '2019-03-30 18:00:00', '2019-04-22 01:34:59'),
(5, 2, 'Property', 'Admin\\Configuration', 'get,get,get,post,post,post,get', 'admin/configuration/property/{id},admin/configuration/property/gets/{category_type_id}/{search_string}/{record_per_page},admin/configuration/property/get/{id},admin/configuration/property/save,admin/configuration/property/apply/bulk/operation,admin/configuration/property/delete,admin/configuration/property/get/sections/by/category/type/id', 'PropertyController', 'index,gets,get,save,applyBulkOperation,delete,getSectionsByCategoryTypeId', 'activeMenuValue:Configuration,activeSubMenuValue:Property,activeMenuId:2,activeSubMenuId:5,recordPerPage:10', NULL, NULL, 4, 'Active', '---', 1, NULL, '2019-03-30 18:00:00', '2019-04-22 01:34:59'),
(6, 2, 'Category', 'Admin\\Configuration', 'get,get,get,post,post,post,get,get,post', 'admin/configuration/category/{id},admin/configuration/category/gets/{category_type_id}/{level}/{search_string}/{record_per_page},admin/configuration/category/get/{id},admin/configuration/category/save,admin/configuration/category/apply/bulk/operation,admin/configuration/category/delete,admin/configuration/category/get/properties/{made_for},admin/configuration/category/get/roots/{made_for}/{level},admin/configuration/category/update/sequence', 'CategoryController', 'index,gets,get,save,applyBulkOperation,delete,getProperties,getRoots,updateSequence', 'activeMenuValue:Configuration,activeSubMenuValue:Category,activeMenuId:2,activeSubMenuId:6,recordPerPage:10', NULL, NULL, 4, 'Active', '---', 1, NULL, '2019-03-31 00:00:00', '2019-04-22 07:34:59'),
(7, 0, 'Operation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'Active', '', 1, NULL, '2019-04-01 09:13:39', '2019-04-22 07:34:58'),
(8, 7, 'Account', 'Admin\\Operation', 'get,get,get,post,post,post', 'admin/operation/account/{id},admin/operation/account/gets/{search_string}/{record_per_page},admin/operation/account/get/{id},admin/operation/account/save,admin/operation/account/apply/bulk/operation,admin/operation/account/delete', 'AccountController', 'index,gets,get,save,applyBulkOperation,delete', 'activeMenuValue:Operation,activeSubMenuValue:Account,activeMenuId:7,activeSubMenuId:8,recordPerPage:10', NULL, NULL, 4, 'Active', '---', 1, NULL, '2019-03-30 18:00:00', '2019-04-22 01:34:59'),
(9, 7, 'Posting', 'Admin\\Operation', 'get,get,post,post', 'admin/operation/posting/{id},admin/operation/posting/gets/{search_string}/{record_per_page},admin/operation/posting/apply/bulk/operation,admin/operation/posting/change/status', 'PostingController', 'index,gets,applyBulkOperation,changeStatus', 'activeMenuValue:Operation,activeSubMenuValue:Posting,activeMenuId:7,activeSubMenuId:9,recordPerPage:10', NULL, NULL, 4, 'Active', '---', 1, NULL, '2019-03-30 18:00:00', '2019-04-22 01:34:59'),
(10, 0, 'Report', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'Active', '', 1, NULL, '2019-04-01 09:13:39', '2019-04-22 07:34:58'),
(11, 10, 'Account', 'Admin\\Report', 'get,get,get,post,post,post', 'admin/report/account/{id},admin/report/account/gets/{search_string}/{record_per_page},admin/report/account/get/{id},admin/report/account/save,admin/report/account/apply/bulk/operation,admin/report/account/delete', 'AccountController', 'index,gets,get,save,applyBulkOperation,delete', 'activeMenuValue:Report,activeSubMenuValue:Account,activeMenuId:10,activeSubMenuId:11,recordPerPage:10', NULL, NULL, 4, 'Active', '---', 1, NULL, '2019-03-30 18:00:00', '2019-04-22 01:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `notification` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_dismissed` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `notification`, `is_dismissed`, `created_at`, `updated_at`) VALUES
(1, 3, 'Test Notification', 0, '2021-06-09 20:31:48', '2021-06-09 20:31:48');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sequence` double UNSIGNED DEFAULT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `narrative` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `option`, `group`, `value`, `sequence`, `status`, `narrative`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Category Level', 'Level', '5', NULL, 'Active', '---', 1, NULL, '2020-02-23 18:00:00', NULL),
(2, 'Payment Option', 'Payment', 'Centralized', NULL, 'Active', '---', 1, 1, '2020-09-20 17:15:20', '2020-09-20 17:15:20');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_object` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `transact_through` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `number`, `account_id`, `transaction_object`, `transact_through`, `status`, `created_at`, `updated_at`) VALUES
(1, '1-1635592791-51191130102021', 4, '{\"id\":\"ch_3JqFbFLPDJySyDJU06H5vMOx\",\"object\":\"charge\",\"amount\":2000000,\"amount_captured\":2000000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3JqFbFLPDJySyDJU0792Ta7x\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":null,\"phone\":null},\"calculated_statement_descriptor\":\"GOODGROSS.COM\",\"captured\":true,\"created\":1635592789,\"currency\":\"usd\",\"customer\":null,\"description\":\"Checkout\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":15,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1JqFbFLPDJySyDJUcnM2Mor8\",\"payment_method_details\":{\"card\":{\"brand\":\"mastercard\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":\"pass\"},\"country\":\"US\",\"exp_month\":12,\"exp_year\":2025,\"fingerprint\":\"LgClIJOugpipsqPy\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4444\",\"network\":\"mastercard\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":null,\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/acct_1HTHScLPDJySyDJU\\/ch_3JqFbFLPDJySyDJU06H5vMOx\\/rcpt_KVG7HX2xNzMMpA0ElutjurP6c1eDb1A\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3JqFbFLPDJySyDJU06H5vMOx\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1JqFbFLPDJySyDJUcnM2Mor8\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"MasterCard\",\"country\":\"US\",\"customer\":null,\"cvc_check\":\"pass\",\"dynamic_last4\":null,\"exp_month\":12,\"exp_year\":2025,\"fingerprint\":\"LgClIJOugpipsqPy\",\"funding\":\"credit\",\"last4\":\"4444\",\"metadata\":[],\"name\":null,\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}', 'Stripe', 'Processing', '2021-10-30 05:19:51', '2021-10-30 05:19:51'),
(2, '2-1635593937-57381130102021', 2, '{\"id\":\"ch_3JqFtjLPDJySyDJU0RFyFWoC\",\"object\":\"charge\",\"amount\":2500000,\"amount_captured\":2500000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3JqFtjLPDJySyDJU0ELg0R4P\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":null,\"phone\":null},\"calculated_statement_descriptor\":\"GOODGROSS.COM\",\"captured\":true,\"created\":1635593935,\"currency\":\"usd\",\"customer\":null,\"description\":\"Checkout\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":51,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1JqFtjLPDJySyDJUtZSrN6s9\",\"payment_method_details\":{\"card\":{\"brand\":\"discover\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":\"pass\"},\"country\":\"US\",\"exp_month\":12,\"exp_year\":2031,\"fingerprint\":\"ahAWboISJLBUDdiG\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"1117\",\"network\":\"discover\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":null,\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/acct_1HTHScLPDJySyDJU\\/ch_3JqFtjLPDJySyDJU0RFyFWoC\\/rcpt_KVGQphxPyq7hrgYg2RG0R1W5whzpjoe\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3JqFtjLPDJySyDJU0RFyFWoC\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1JqFtjLPDJySyDJUtZSrN6s9\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Discover\",\"country\":\"US\",\"customer\":null,\"cvc_check\":\"pass\",\"dynamic_last4\":null,\"exp_month\":12,\"exp_year\":2031,\"fingerprint\":\"ahAWboISJLBUDdiG\",\"funding\":\"credit\",\"last4\":\"1117\",\"metadata\":[],\"name\":null,\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}', 'Stripe', 'Processing', '2021-10-30 05:38:57', '2021-10-30 05:38:57'),
(3, '1-1635644514-54410131102021', 2, '{\"id\":\"ch_3JqT3ULPDJySyDJU0mPELt4b\",\"object\":\"charge\",\"amount\":2000000,\"amount_captured\":2000000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3JqT3ULPDJySyDJU0ZlB25Tq\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":null,\"phone\":null},\"calculated_statement_descriptor\":\"GOODGROSS.COM\",\"captured\":true,\"created\":1635644512,\"currency\":\"usd\",\"customer\":null,\"description\":\"Checkout\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":0,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1JqT3TLPDJySyDJUn7tyNOJM\",\"payment_method_details\":{\"card\":{\"brand\":\"discover\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":\"pass\"},\"country\":\"US\",\"exp_month\":12,\"exp_year\":2031,\"fingerprint\":\"ahAWboISJLBUDdiG\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"1117\",\"network\":\"discover\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":null,\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/acct_1HTHScLPDJySyDJU\\/ch_3JqT3ULPDJySyDJU0mPELt4b\\/rcpt_KVU1nDCp0gC0jF3P3ORErPiMfhdcnd4\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3JqT3ULPDJySyDJU0mPELt4b\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1JqT3TLPDJySyDJUn7tyNOJM\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Discover\",\"country\":\"US\",\"customer\":null,\"cvc_check\":\"pass\",\"dynamic_last4\":null,\"exp_month\":12,\"exp_year\":2031,\"fingerprint\":\"ahAWboISJLBUDdiG\",\"funding\":\"credit\",\"last4\":\"1117\",\"metadata\":[],\"name\":null,\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}', 'Stripe', 'Processing', '2021-10-30 19:41:54', '2021-10-30 19:41:54'),
(4, '2-1635646400-20130231102021', 2, '{\"id\":\"ch_3JqTXtLPDJySyDJU0zyjaEZJ\",\"object\":\"charge\",\"amount\":2500000,\"amount_captured\":2500000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3JqTXtLPDJySyDJU0l7BN7V3\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":null,\"phone\":null},\"calculated_statement_descriptor\":\"GOODGROSS.COM\",\"captured\":true,\"created\":1635646397,\"currency\":\"usd\",\"customer\":null,\"description\":\"Checkout\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":63,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1JqTXtLPDJySyDJUv76SSwff\",\"payment_method_details\":{\"card\":{\"brand\":\"discover\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":\"pass\"},\"country\":\"US\",\"exp_month\":12,\"exp_year\":2031,\"fingerprint\":\"ahAWboISJLBUDdiG\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"1117\",\"network\":\"discover\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":null,\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/acct_1HTHScLPDJySyDJU\\/ch_3JqTXtLPDJySyDJU0zyjaEZJ\\/rcpt_KVUWctaDtzdQa41JEic0jC78O9eP4JO\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3JqTXtLPDJySyDJU0zyjaEZJ\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1JqTXtLPDJySyDJUv76SSwff\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Discover\",\"country\":\"US\",\"customer\":null,\"cvc_check\":\"pass\",\"dynamic_last4\":null,\"exp_month\":12,\"exp_year\":2031,\"fingerprint\":\"ahAWboISJLBUDdiG\",\"funding\":\"credit\",\"last4\":\"1117\",\"metadata\":[],\"name\":null,\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}', 'Stripe', 'Processing', '2021-10-30 20:13:20', '2021-10-30 20:13:20');

-- --------------------------------------------------------

--
-- Table structure for table `order_billings`
--

CREATE TABLE `order_billings` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line_1` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line_2` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_billings`
--

INSERT INTO `order_billings` (`id`, `order_id`, `first_name`, `last_name`, `email`, `phone`, `address_line_1`, `address_line_2`, `country`, `city`, `region`, `postal_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'Bilal', 'Mahmud', 'root@archiverz.com', '+123985563', '600 E Washington St', NULL, 'United States', 'Phoenix', 'Arizona', '85004', '2021-10-30 05:19:51', '2021-10-30 05:19:51'),
(2, 2, 'Tasmia', 'Tashahud', 'tasmiatashahud@gmail.com', '+1234567890', '1200 Airport Rd', NULL, 'United States', 'Sedona', 'Arizona', '86336', '2021-10-30 05:38:57', '2021-10-30 05:38:57'),
(3, 3, 'Tasmia', 'Tashahud', 'tasmiatashahud@gmail.com', '+1234567890', '1200 Airport Rd', NULL, 'United States', 'Sedona', 'Arizona', '86336', '2021-10-30 19:41:54', '2021-10-30 19:41:54'),
(4, 4, 'Tasmia', 'Tashahud', 'tasmiatashahud@gmail.com', '+1234567890', '1200 Airport Rd', NULL, 'United States', 'Sedona', 'Arizona', '86336', '2021-10-30 20:13:20', '2021-10-30 20:13:20');

-- --------------------------------------------------------

--
-- Table structure for table `order_shippings`
--

CREATE TABLE `order_shippings` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line_1` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line_2` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_shippings`
--

INSERT INTO `order_shippings` (`id`, `order_id`, `first_name`, `last_name`, `email`, `phone`, `address_line_1`, `address_line_2`, `country`, `city`, `state`, `postal_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'Bilal', 'Mahmud', 'root@archiverz.com', '+123985563', '600 E Washington St', NULL, 'United States', 'Phoenix', 'Arizona', '85004', '2021-10-30 05:19:51', '2021-10-30 05:19:51'),
(2, 2, 'Tasmia', 'Tashahud', 'tasmiatashahud@gmail.com', '+1234567890', '1200 Airport Rd', NULL, 'United States', 'Sedona', 'Arizona', '86336', '2021-10-30 05:38:57', '2021-10-30 05:38:57'),
(3, 3, 'Tasmia', 'Tashahud', 'tasmiatashahud@gmail.com', '+1234567890', '1200 Airport Rd', NULL, 'United States', 'Sedona', 'Arizona', '86336', '2021-10-30 19:41:54', '2021-10-30 19:41:54'),
(4, 4, 'Tasmia', 'Tashahud', 'tasmiatashahud@gmail.com', '+1234567890', '1200 Airport Rd', NULL, 'United States', 'Sedona', 'Arizona', '86336', '2021-10-30 20:13:20', '2021-10-30 20:13:20');

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `price_per_unit` double DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payout_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfer_object` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_transactions`
--

INSERT INTO `order_transactions` (`id`, `order_id`, `product_id`, `quantity`, `price_per_unit`, `payment_status`, `payout_status`, `transfer_object`, `delivery_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 5000, 'Released', 'Held', NULL, 'Processing', 'Processing', '2021-10-30 05:19:51', '2021-10-30 05:19:51'),
(2, 1, 7, 1, 15000, 'Released', 'Held', NULL, 'Processing', 'Processing', '2021-10-30 05:19:51', '2021-10-30 05:19:51'),
(3, 2, 8, 1, 10000, 'Released', 'Held', NULL, 'Processing', 'Processing', '2021-10-30 05:38:57', '2021-10-30 05:38:57'),
(4, 2, 3, 1, 15000, 'Released', 'Held', NULL, 'Processing', 'Processing', '2021-10-30 05:38:57', '2021-10-30 05:38:57'),
(5, 3, 1, 1, 5000, 'Released', 'Held', NULL, 'Processing', 'Processing', '2021-10-30 19:41:54', '2021-10-30 19:41:54'),
(6, 3, 3, 1, 15000, 'Released', 'Held', NULL, 'Processing', 'Processing', '2021-10-30 19:41:54', '2021-10-30 19:41:54'),
(7, 4, 7, 1, 15000, 'Released', 'Held', NULL, 'Processing', 'Processing', '2021-10-30 20:13:20', '2021-10-30 20:13:20'),
(8, 4, 8, 1, 10000, 'Released', 'Held', NULL, 'Processing', 'Processing', '2021-10-30 20:13:20', '2021-10-30 20:13:20');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorization_keys` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `payment_method`, `icon`, `authorization_keys`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'PayPal', '<i class=\"fab fa-cc-paypal fa-2x\" style=\"color: #3b7bbf;\"></i>', 'client_id,secret,mode', 1, 1, '2020-08-29 18:00:00', '2020-08-29 18:00:00'),
(2, 'Stripe', '<i class=\"fab fa-cc-stripe fa-2x\" style=\"color: #008cdd;\"></i>', 'client_id,secret,mode', 1, 1, '2020-08-29 18:00:00', '2020-08-29 18:00:00'),
(3, 'Authorize.Net', NULL, 'login_id,transaction_key,mode', 1, 1, '2020-08-29 18:00:00', '2020-08-29 18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `personal_accounts`
--

CREATE TABLE `personal_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `personal_accounts`
--

INSERT INTO `personal_accounts` (`id`, `account_id`, `first_name`, `last_name`, `email`, `phone`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Asraf', 'Duha', 'seaudbd@gmail.com', '01776648825', NULL, '2021-05-18 14:15:59', '2021-05-18 14:15:59');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `account_id` int(10) UNSIGNED DEFAULT NULL,
  `sequence` double UNSIGNED DEFAULT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `narrative` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `account_id`, `sequence`, `status`, `narrative`, `created_at`, `updated_at`) VALUES
(1, 3, 1, NULL, 'Approved', NULL, '2021-05-20 03:04:43', '2021-05-20 03:48:47'),
(2, 3, 1, NULL, 'Approved', NULL, '2021-05-20 03:06:24', '2021-05-20 03:48:47'),
(3, 3, 1, NULL, 'Approved', NULL, '2021-05-20 03:19:32', '2021-05-20 03:48:47'),
(4, 3, 1, NULL, 'Approved', NULL, '2021-05-20 03:21:27', '2021-05-20 03:48:47'),
(5, 3, 1, NULL, 'Approved', NULL, '2021-05-20 03:22:51', '2021-05-20 03:48:47'),
(6, 3, 1, NULL, 'Approved', NULL, '2021-05-20 03:24:20', '2021-05-20 03:48:47'),
(7, 3, 1, NULL, 'Approved', NULL, '2021-05-20 03:29:14', '2021-05-20 03:48:47'),
(8, 3, 1, NULL, 'Approved', NULL, '2021-05-20 03:31:09', '2021-05-20 03:48:47'),
(9, 3, 1, NULL, 'Approved', NULL, '2021-05-29 12:04:16', '2021-05-29 12:06:45'),
(10, 3, 1, NULL, 'Approved', NULL, '2021-05-29 15:21:11', '2021-05-29 15:22:03'),
(14, 86, 2, NULL, 'Approved', NULL, '2021-06-14 02:08:41', '2021-06-14 14:41:37'),
(15, 86, 3, NULL, 'Approved', NULL, '2021-06-15 15:24:00', '2021-06-15 15:48:12');

-- --------------------------------------------------------

--
-- Table structure for table `product_properties`
--

CREATE TABLE `product_properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `property_id` int(10) UNSIGNED DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_for_product_listing` tinyint(1) DEFAULT NULL,
  `is_for_search_engine` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_properties`
--

INSERT INTO `product_properties` (`id`, `product_id`, `property_id`, `value`, `is_for_product_listing`, `is_for_search_engine`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Mazda MX-5 Miata', 1, 1, '2021-05-20 03:04:43', '2021-05-20 03:04:43'),
(2, 1, 2, 'Mazda MX-5 Miata', 1, 1, '2021-05-20 03:04:43', '2021-05-20 03:04:43'),
(3, 1, 3, 'Mazda MX-5 Miata', 0, 0, '2021-05-20 03:04:43', '2021-05-20 03:04:43'),
(4, 1, 4, 'MX5M2021', 0, 0, '2021-05-20 03:04:43', '2021-05-20 03:04:43'),
(5, 1, 5, 'img/product/original/2021/May/1-727f39579bf2caf1d184dffd70daae43e26b5bf2.jpg', 1, 0, '2021-05-20 03:04:44', '2021-05-20 03:04:44'),
(6, 1, 6, 'Brand New', 0, 0, '2021-05-20 03:04:44', '2021-05-20 03:04:44'),
(7, 1, 9, 'Japan', 0, 0, '2021-05-20 03:04:44', '2021-05-20 03:04:44'),
(8, 1, 10, NULL, 0, 0, '2021-05-20 03:04:44', '2021-05-20 03:04:44'),
(9, 1, 11, '5000', 1, 1, '2021-05-20 03:04:44', '2021-05-20 03:04:44'),
(10, 1, 12, 'Fixed Price', 0, 0, '2021-05-20 03:04:44', '2021-05-20 03:04:44'),
(11, 1, 13, 'VISA', 0, 0, '2021-05-20 03:04:44', '2021-05-20 03:04:44'),
(12, 1, 14, NULL, 0, 0, '2021-05-20 03:04:44', '2021-05-20 03:04:44'),
(13, 1, 15, 'USPS', 0, 0, '2021-05-20 03:04:44', '2021-05-20 03:04:44'),
(14, 1, 16, '0', 1, 1, '2021-05-20 03:04:44', '2021-05-20 03:04:44'),
(15, 1, 17, NULL, 0, 0, '2021-05-20 03:04:44', '2021-05-20 03:04:44'),
(16, 1, 18, '1 Business Days – 10 Business Days', 1, 0, '2021-05-20 03:04:44', '2021-05-20 03:04:44'),
(17, 1, 19, NULL, 0, 0, '2021-05-20 03:04:44', '2021-05-20 03:04:44'),
(18, 1, 20, NULL, 0, 0, '2021-05-20 03:04:44', '2021-05-20 03:04:44'),
(19, 1, 21, '100', 1, 0, '2021-05-20 03:04:44', '2021-05-20 03:04:44'),
(20, 2, 1, 'Porsche 718 Boxster', 1, 1, '2021-05-20 03:06:24', '2021-05-20 03:06:24'),
(21, 2, 2, 'Porsche 718 Boxster', 1, 1, '2021-05-20 03:06:24', '2021-05-20 03:06:24'),
(22, 2, 3, 'Porsche 718 Boxster', 0, 0, '2021-05-20 03:06:24', '2021-05-20 03:06:24'),
(23, 2, 4, 'P718B2021', 0, 0, '2021-05-20 03:06:24', '2021-05-20 03:06:24'),
(24, 2, 5, 'img/product/original/2021/May/1-c684a29aa672000cc9e4f00893a6857c84eecde5.jpg', 1, 0, '2021-05-20 03:06:25', '2021-05-20 03:06:25'),
(25, 2, 6, 'Used', 0, 0, '2021-05-20 03:06:25', '2021-05-20 03:06:25'),
(26, 2, 9, 'Germany', 0, 0, '2021-05-20 03:06:25', '2021-05-20 03:06:25'),
(27, 2, 10, NULL, 0, 0, '2021-05-20 03:06:25', '2021-05-20 03:06:25'),
(28, 2, 11, '10000', 1, 1, '2021-05-20 03:06:25', '2021-05-20 03:06:25'),
(29, 2, 12, 'Fixed Price', 0, 0, '2021-05-20 03:06:25', '2021-05-20 03:06:25'),
(30, 2, 13, 'VISA', 0, 0, '2021-05-20 03:06:25', '2021-05-20 03:06:25'),
(31, 2, 14, NULL, 0, 0, '2021-05-20 03:06:25', '2021-05-20 03:06:25'),
(32, 2, 15, 'USPS', 0, 0, '2021-05-20 03:06:25', '2021-05-20 03:06:25'),
(33, 2, 16, '0', 1, 1, '2021-05-20 03:06:25', '2021-05-20 03:06:25'),
(34, 2, 17, NULL, 0, 0, '2021-05-20 03:06:25', '2021-05-20 03:06:25'),
(35, 2, 18, '15 Business Days', 1, 0, '2021-05-20 03:06:25', '2021-05-20 03:06:25'),
(36, 2, 19, NULL, 0, 0, '2021-05-20 03:06:25', '2021-05-20 03:06:25'),
(37, 2, 20, NULL, 0, 0, '2021-05-20 03:06:25', '2021-05-20 03:06:25'),
(38, 2, 21, '75', 1, 0, '2021-05-20 03:06:25', '2021-05-20 03:06:25'),
(39, 3, 1, 'Mercedes-AMG C43', 1, 1, '2021-05-20 03:19:32', '2021-05-20 03:19:32'),
(40, 3, 2, 'Mercedes-AMG C43', 1, 1, '2021-05-20 03:19:32', '2021-05-20 03:19:32'),
(41, 3, 3, 'Mercedes-AMG C43', 0, 0, '2021-05-20 03:19:32', '2021-05-20 03:19:32'),
(42, 3, 4, 'MAMGC43', 0, 0, '2021-05-20 03:19:32', '2021-05-20 03:19:32'),
(43, 3, 5, 'img/product/original/2021/May/1-56b5ec1c86dd836cc06fa2f4890fbfa86c408684.jpg', 1, 0, '2021-05-20 03:19:33', '2021-05-20 03:19:33'),
(44, 3, 6, 'Brand New', 0, 0, '2021-05-20 03:19:33', '2021-05-20 03:19:33'),
(45, 3, 9, 'Germany', 0, 0, '2021-05-20 03:19:33', '2021-05-20 03:19:33'),
(46, 3, 10, NULL, 0, 0, '2021-05-20 03:19:33', '2021-05-20 03:19:33'),
(47, 3, 11, '15000', 1, 1, '2021-05-20 03:19:33', '2021-05-20 03:19:33'),
(48, 3, 12, 'Fixed Price', 0, 0, '2021-05-20 03:19:33', '2021-05-20 03:19:33'),
(49, 3, 13, 'VISA', 0, 0, '2021-05-20 03:19:33', '2021-05-20 03:19:33'),
(50, 3, 14, NULL, 0, 0, '2021-05-20 03:19:33', '2021-05-20 03:19:33'),
(51, 3, 15, 'USPS', 0, 0, '2021-05-20 03:19:33', '2021-05-20 03:19:33'),
(52, 3, 16, '0', 1, 1, '2021-05-20 03:19:33', '2021-05-20 03:19:33'),
(53, 3, 17, NULL, 0, 0, '2021-05-20 03:19:33', '2021-05-20 03:19:33'),
(54, 3, 18, '30 Business Days', 1, 0, '2021-05-20 03:19:33', '2021-05-20 03:19:33'),
(55, 3, 19, NULL, 0, 0, '2021-05-20 03:19:33', '2021-05-20 03:19:33'),
(56, 3, 20, NULL, 0, 0, '2021-05-20 03:19:33', '2021-05-20 03:19:33'),
(57, 3, 21, '50', 1, 0, '2021-05-20 03:19:33', '2021-05-20 03:19:33'),
(58, 4, 1, 'Lamborghini X200', 1, 1, '2021-05-20 03:21:27', '2021-05-20 03:21:27'),
(59, 4, 2, 'Lamborghini X200', 1, 1, '2021-05-20 03:21:27', '2021-05-20 03:21:27'),
(60, 4, 3, 'Lamborghini X200', 0, 0, '2021-05-20 03:21:27', '2021-05-20 03:21:27'),
(61, 4, 4, 'LX200', 0, 0, '2021-05-20 03:21:27', '2021-05-20 03:21:27'),
(62, 4, 5, 'img/product/original/2021/May/1-cf67a3ddc6d10bba2a773a01e6eb3618aa33d293.jpg', 1, 0, '2021-05-20 03:21:28', '2021-05-20 03:21:28'),
(63, 4, 6, 'Used Good Condition', 0, 0, '2021-05-20 03:21:28', '2021-05-20 03:21:28'),
(64, 4, 9, 'Italy', 0, 0, '2021-05-20 03:21:28', '2021-05-20 03:21:28'),
(65, 4, 10, NULL, 0, 0, '2021-05-20 03:21:28', '2021-05-20 03:21:28'),
(66, 4, 11, '15000', 1, 1, '2021-05-20 03:21:28', '2021-05-20 03:21:28'),
(67, 4, 12, 'Fixed Price', 0, 0, '2021-05-20 03:21:28', '2021-05-20 03:21:28'),
(68, 4, 13, 'VISA', 0, 0, '2021-05-20 03:21:28', '2021-05-20 03:21:28'),
(69, 4, 14, NULL, 0, 0, '2021-05-20 03:21:28', '2021-05-20 03:21:28'),
(70, 4, 15, 'USPS', 0, 0, '2021-05-20 03:21:28', '2021-05-20 03:21:28'),
(71, 4, 16, '10', 1, 1, '2021-05-20 03:21:28', '2021-05-20 03:21:28'),
(72, 4, 17, NULL, 0, 0, '2021-05-20 03:21:28', '2021-05-20 03:21:28'),
(73, 4, 18, 'Same Business Day', 1, 0, '2021-05-20 03:21:28', '2021-05-20 03:21:28'),
(74, 4, 19, NULL, 0, 0, '2021-05-20 03:21:28', '2021-05-20 03:21:28'),
(75, 4, 20, NULL, 0, 0, '2021-05-20 03:21:28', '2021-05-20 03:21:28'),
(76, 4, 21, '100', 1, 0, '2021-05-20 03:21:28', '2021-05-20 03:21:28'),
(77, 5, 1, 'Ferrari FX2021', 1, 1, '2021-05-20 03:22:51', '2021-05-20 03:22:51'),
(78, 5, 2, 'Ferrari FX2021', 1, 1, '2021-05-20 03:22:51', '2021-05-20 03:22:51'),
(79, 5, 3, 'Ferrari FX2021', 0, 0, '2021-05-20 03:22:51', '2021-05-20 03:22:51'),
(80, 5, 4, 'FFX2021', 0, 0, '2021-05-20 03:22:51', '2021-05-20 03:22:51'),
(81, 5, 5, 'img/product/original/2021/May/1-30db23fdc4dd77d436d2c0d7e48aaa65eedaa455.jpg', 1, 0, '2021-05-20 03:22:52', '2021-05-20 03:22:52'),
(82, 5, 6, 'Brand New', 0, 0, '2021-05-20 03:22:52', '2021-05-20 03:22:52'),
(83, 5, 9, 'Italy', 0, 0, '2021-05-20 03:22:52', '2021-05-20 03:22:52'),
(84, 5, 10, NULL, 0, 0, '2021-05-20 03:22:52', '2021-05-20 03:22:52'),
(85, 5, 11, '9999', 1, 1, '2021-05-20 03:22:52', '2021-05-20 03:22:52'),
(86, 5, 12, 'Fixed Price', 0, 0, '2021-05-20 03:22:52', '2021-05-20 03:22:52'),
(87, 5, 13, 'VISA', 0, 0, '2021-05-20 03:22:52', '2021-05-20 03:22:52'),
(88, 5, 14, NULL, 0, 0, '2021-05-20 03:22:52', '2021-05-20 03:22:52'),
(89, 5, 15, 'USPS', 0, 0, '2021-05-20 03:22:52', '2021-05-20 03:22:52'),
(90, 5, 16, '20', 1, 1, '2021-05-20 03:22:52', '2021-05-20 03:22:52'),
(91, 5, 17, NULL, 0, 0, '2021-05-20 03:22:52', '2021-05-20 03:22:52'),
(92, 5, 18, 'Same Business Day', 1, 0, '2021-05-20 03:22:52', '2021-05-20 03:22:52'),
(93, 5, 19, NULL, 0, 0, '2021-05-20 03:22:52', '2021-05-20 03:22:52'),
(94, 5, 20, NULL, 0, 0, '2021-05-20 03:22:52', '2021-05-20 03:22:52'),
(95, 5, 21, '75', 1, 0, '2021-05-20 03:22:52', '2021-05-20 03:22:52'),
(96, 6, 1, 'BMW Old Superior Dikuta Manfas 1999', 1, 1, '2021-05-20 03:24:20', '2021-05-20 03:24:20'),
(97, 6, 2, 'BMW Old Superior Dikuta Manfas 1999', 1, 1, '2021-05-20 03:24:20', '2021-05-20 03:24:20'),
(98, 6, 3, 'BMW Old Superior Dikuta Manfas 1999', 0, 0, '2021-05-20 03:24:20', '2021-05-20 03:24:20'),
(99, 6, 4, 'BMWOSDM1999', 0, 0, '2021-05-20 03:24:20', '2021-05-20 03:24:20'),
(100, 6, 5, 'img/product/original/2021/May/1-4c837612dc7243bdbf4d700f5a75df969431da9d.jpg', 1, 0, '2021-05-20 03:24:21', '2021-05-20 03:24:21'),
(101, 6, 6, 'Brand New', 0, 0, '2021-05-20 03:24:21', '2021-05-20 03:24:21'),
(102, 6, 9, 'Germany', 0, 0, '2021-05-20 03:24:21', '2021-05-20 03:24:21'),
(103, 6, 10, NULL, 0, 0, '2021-05-20 03:24:21', '2021-05-20 03:24:21'),
(104, 6, 11, '5000', 1, 1, '2021-05-20 03:24:21', '2021-05-20 03:24:21'),
(105, 6, 12, 'Fixed Price', 0, 0, '2021-05-20 03:24:21', '2021-05-20 03:24:21'),
(106, 6, 13, 'VISA', 0, 0, '2021-05-20 03:24:21', '2021-05-20 03:24:21'),
(107, 6, 14, NULL, 0, 0, '2021-05-20 03:24:21', '2021-05-20 03:24:21'),
(108, 6, 15, 'USPS', 0, 0, '2021-05-20 03:24:21', '2021-05-20 03:24:21'),
(109, 6, 16, '0', 1, 1, '2021-05-20 03:24:21', '2021-05-20 03:24:21'),
(110, 6, 17, NULL, 0, 0, '2021-05-20 03:24:21', '2021-05-20 03:24:21'),
(111, 6, 18, '30 Business Days', 1, 0, '2021-05-20 03:24:21', '2021-05-20 03:24:21'),
(112, 6, 19, NULL, 0, 0, '2021-05-20 03:24:21', '2021-05-20 03:24:21'),
(113, 6, 20, NULL, 0, 0, '2021-05-20 03:24:21', '2021-05-20 03:24:21'),
(114, 6, 21, '25', 1, 0, '2021-05-20 03:24:21', '2021-05-20 03:24:21'),
(115, 7, 1, 'Audi Manhattan Bubble Superior Danapo Lexa 2019', 1, 1, '2021-05-20 03:29:14', '2021-05-20 03:29:14'),
(116, 7, 2, 'Audi Manhattan Bubble Superior Danapo Lexa 2019', 1, 1, '2021-05-20 03:29:14', '2021-05-20 03:29:14'),
(117, 7, 3, 'Audi Manhattan Bubble Superior Danapo Lexa 2019', 0, 0, '2021-05-20 03:29:14', '2021-05-20 03:29:14'),
(118, 7, 4, 'AMBSDL2019', 0, 0, '2021-05-20 03:29:14', '2021-05-20 03:29:14'),
(119, 7, 5, 'img/product/original/2021/May/1-4b7f48626a733498b3c1a1fd00378b1eb62b1d31.jpg', 1, 0, '2021-05-20 03:29:15', '2021-05-20 03:29:15'),
(120, 7, 6, 'Brand New', 0, 0, '2021-05-20 03:29:15', '2021-05-20 03:29:15'),
(121, 7, 9, 'Germany', 0, 0, '2021-05-20 03:29:15', '2021-05-20 03:29:15'),
(122, 7, 10, NULL, 0, 0, '2021-05-20 03:29:15', '2021-05-20 03:29:15'),
(123, 7, 11, '15000', 1, 1, '2021-05-20 03:29:15', '2021-05-20 03:29:15'),
(124, 7, 12, 'Fixed Price', 0, 0, '2021-05-20 03:29:15', '2021-05-20 03:29:15'),
(125, 7, 13, 'VISA', 0, 0, '2021-05-20 03:29:15', '2021-05-20 03:29:15'),
(126, 7, 14, NULL, 0, 0, '2021-05-20 03:29:15', '2021-05-20 03:29:15'),
(127, 7, 15, 'USPS', 0, 0, '2021-05-20 03:29:15', '2021-05-20 03:29:15'),
(128, 7, 16, '0', 1, 1, '2021-05-20 03:29:15', '2021-05-20 03:29:15'),
(129, 7, 17, NULL, 0, 0, '2021-05-20 03:29:15', '2021-05-20 03:29:15'),
(130, 7, 18, '20 Business Days', 1, 0, '2021-05-20 03:29:15', '2021-05-20 03:29:15'),
(131, 7, 19, NULL, 0, 0, '2021-05-20 03:29:15', '2021-05-20 03:29:15'),
(132, 7, 20, NULL, 0, 0, '2021-05-20 03:29:15', '2021-05-20 03:29:15'),
(133, 7, 21, '10', 1, 0, '2021-05-20 03:29:15', '2021-05-20 03:29:15'),
(134, 8, 1, 'Volkswagen VXL-2019', 1, 1, '2021-05-20 03:31:09', '2021-05-20 03:31:09'),
(135, 8, 2, 'Volkswagen VXL-2019', 1, 1, '2021-05-20 03:31:09', '2021-05-20 03:31:09'),
(136, 8, 3, 'Volkswagen VXL-2019', 0, 0, '2021-05-20 03:31:09', '2021-05-20 03:31:09'),
(137, 8, 4, 'VVXL-2019', 0, 0, '2021-05-20 03:31:09', '2021-05-20 03:31:09'),
(138, 8, 5, 'img/product/original/2021/May/1-7040aaebe2bcb97128aab563601e07d2347dde98.jpg', 1, 0, '2021-05-20 03:31:10', '2021-05-20 03:31:10'),
(139, 8, 6, 'Brand New', 0, 0, '2021-05-20 03:31:10', '2021-05-20 03:31:10'),
(140, 8, 9, 'Germany', 0, 0, '2021-05-20 03:31:10', '2021-05-20 03:31:10'),
(141, 8, 10, NULL, 0, 0, '2021-05-20 03:31:10', '2021-05-20 03:31:10'),
(142, 8, 11, '10000', 1, 1, '2021-05-20 03:31:10', '2021-05-20 03:31:10'),
(143, 8, 12, 'Fixed Price', 0, 0, '2021-05-20 03:31:10', '2021-05-20 03:31:10'),
(144, 8, 13, 'VISA', 0, 0, '2021-05-20 03:31:10', '2021-05-20 03:31:10'),
(145, 8, 14, NULL, 0, 0, '2021-05-20 03:31:10', '2021-05-20 03:31:10'),
(146, 8, 15, 'USPS', 0, 0, '2021-05-20 03:31:10', '2021-05-20 03:31:10'),
(147, 8, 16, '500', 1, 1, '2021-05-20 03:31:10', '2021-05-20 03:31:10'),
(148, 8, 17, NULL, 0, 0, '2021-05-20 03:31:10', '2021-05-20 03:31:10'),
(149, 8, 18, '30 Business Days', 1, 0, '2021-05-20 03:31:10', '2021-05-20 03:31:10'),
(150, 8, 19, NULL, 0, 0, '2021-05-20 03:31:10', '2021-05-20 03:31:10'),
(151, 8, 20, NULL, 0, 0, '2021-05-20 03:31:10', '2021-05-20 03:31:10'),
(152, 8, 21, '50', 1, 0, '2021-05-20 03:31:10', '2021-05-20 03:31:10'),
(153, 1, 25, 'Mazda', 0, 1, '2021-05-21 18:34:39', '2021-05-21 18:34:39'),
(154, 2, 25, 'Porsche', 0, 1, '2021-05-21 18:34:39', '2021-05-21 18:34:39'),
(155, 3, 25, 'Mercedes Benz', 0, 1, '2021-05-21 18:34:39', '2021-05-21 18:34:39'),
(156, 4, 25, 'Lamborghini', 0, 1, '2021-05-21 18:34:39', '2021-05-21 18:34:39'),
(157, 5, 25, 'Ferrari', 0, 1, '2021-05-21 18:34:39', '2021-05-21 18:34:39'),
(158, 6, 25, 'BMW', 0, 1, '2021-05-21 18:34:39', '2021-05-21 18:34:39'),
(159, 7, 25, 'Audi', 0, 1, '2021-05-21 18:34:39', '2021-05-21 18:34:39'),
(160, 8, 25, 'Volkswagen', 0, 1, '2021-05-21 18:34:39', '2021-05-21 18:34:39'),
(161, 9, 1, 'Audi A3 2021', 1, 1, '2021-05-29 12:04:16', '2021-05-29 12:04:16'),
(162, 9, 2, 'Audi A3 2021', 1, 1, '2021-05-29 12:04:16', '2021-05-29 12:04:16'),
(163, 9, 3, 'Audi A3 2021', 0, 0, '2021-05-29 12:04:16', '2021-05-29 12:04:16'),
(164, 9, 4, 'AUDIA32021', 0, 0, '2021-05-29 12:04:16', '2021-05-29 12:04:16'),
(165, 9, 5, 'img/product/original/2021/May/1-87b18b29072ecb8b8425b213b41c129a02b71456.png,img/product/original/2021/May/1-6d0ea3f24ea46bde44363a06e374927f24a4e02e.png,img/product/original/2021/May/1-894eb68aa647642be6634e8461a3882c237e77bf.png', 1, 0, '2021-05-29 12:04:20', '2021-05-29 12:04:20'),
(166, 9, 6, 'Brand New', 0, 1, '2021-05-29 12:04:20', '2021-05-29 12:04:20'),
(167, 9, 9, 'Germany', 0, 1, '2021-05-29 12:04:20', '2021-05-29 12:04:20'),
(168, 9, 10, 'No', 0, 0, '2021-05-29 12:04:20', '2021-05-29 12:04:20'),
(169, 9, 11, '35000', 1, 1, '2021-05-29 12:04:20', '2021-05-29 12:04:20'),
(170, 9, 12, 'Fixed Price', 0, 0, '2021-05-29 12:04:20', '2021-05-29 12:04:20'),
(171, 9, 13, 'VISA', 0, 0, '2021-05-29 12:04:20', '2021-05-29 12:04:20'),
(172, 9, 14, NULL, 0, 0, '2021-05-29 12:04:20', '2021-05-29 12:04:20'),
(173, 9, 15, 'USPS', 0, 0, '2021-05-29 12:04:20', '2021-05-29 12:04:20'),
(174, 9, 16, '0', 1, 1, '2021-05-29 12:04:20', '2021-05-29 12:04:20'),
(175, 9, 17, NULL, 0, 0, '2021-05-29 12:04:20', '2021-05-29 12:04:20'),
(176, 9, 18, '1 Business Days – 10 Business Days', 1, 0, '2021-05-29 12:04:20', '2021-05-29 12:04:20'),
(177, 9, 19, NULL, 0, 0, '2021-05-29 12:04:20', '2021-05-29 12:04:20'),
(178, 9, 20, NULL, 0, 0, '2021-05-29 12:04:20', '2021-05-29 12:04:20'),
(179, 9, 21, '5', 1, 0, '2021-05-29 12:04:20', '2021-05-29 12:04:20'),
(180, 9, 25, 'Audi', 0, 1, '2021-05-29 12:04:20', '2021-05-29 12:04:20'),
(181, 10, 1, 'Audi TT 2021', 1, 1, '2021-05-29 15:21:11', '2021-05-29 15:21:11'),
(182, 10, 2, 'Audi TT 2021', 1, 1, '2021-05-29 15:21:11', '2021-05-29 15:21:11'),
(183, 10, 3, 'Audi TT 2021', 0, 0, '2021-05-29 15:21:11', '2021-05-29 15:21:11'),
(184, 10, 4, 'ATT2021', 0, 0, '2021-05-29 15:21:11', '2021-05-29 15:21:11'),
(185, 10, 5, 'img/product/original/2021/May/1-c4ef146fd517e056f4878c570768cdf7364adfbb.png,img/product/original/2021/May/1-0af213ce043b9a11ccb0fbf315af6400a23a3752.png,img/product/original/2021/May/1-2926ebfe77a52f5902469e2bd38d60fa55959fa0.png,img/product/original/2021/May/1-d90a93e0feb73170644bd650ecc567884cc81b6b.png', 1, 0, '2021-05-29 15:21:16', '2021-05-29 15:21:16'),
(186, 10, 6, 'Brand New', 0, 1, '2021-05-29 15:21:16', '2021-05-29 15:21:16'),
(187, 10, 9, 'Germany', 0, 1, '2021-05-29 15:21:16', '2021-05-29 15:21:16'),
(188, 10, 10, 'No', 0, 0, '2021-05-29 15:21:16', '2021-05-29 15:21:16'),
(189, 10, 11, '35000', 1, 1, '2021-05-29 15:21:16', '2021-05-29 15:21:16'),
(190, 10, 12, 'Fixed Price', 0, 0, '2021-05-29 15:21:16', '2021-05-29 15:21:16'),
(191, 10, 13, 'VISA', 0, 0, '2021-05-29 15:21:16', '2021-05-29 15:21:16'),
(192, 10, 14, NULL, 0, 0, '2021-05-29 15:21:16', '2021-05-29 15:21:16'),
(193, 10, 15, 'USPS', 0, 0, '2021-05-29 15:21:16', '2021-05-29 15:21:16'),
(194, 10, 16, '0', 1, 1, '2021-05-29 15:21:16', '2021-05-29 15:21:16'),
(195, 10, 17, NULL, 0, 0, '2021-05-29 15:21:16', '2021-05-29 15:21:16'),
(196, 10, 18, '20 Business Days', 1, 0, '2021-05-29 15:21:16', '2021-05-29 15:21:16'),
(197, 10, 19, NULL, 0, 0, '2021-05-29 15:21:16', '2021-05-29 15:21:16'),
(198, 10, 20, NULL, 0, 0, '2021-05-29 15:21:16', '2021-05-29 15:21:16'),
(199, 10, 21, '5', 1, 0, '2021-05-29 15:21:16', '2021-05-29 15:21:16'),
(200, 10, 25, 'Audi', 0, 1, '2021-05-29 15:21:16', '2021-05-29 15:21:16'),
(295, 14, 26, 'Royal Gala Apples', 1, 1, '2021-06-14 02:08:41', '2021-06-14 02:08:41'),
(296, 14, 27, 'Royal Gala Apples', 0, 1, '2021-06-14 02:08:41', '2021-06-14 02:08:41'),
(297, 14, 28, 'Royal Gala Apples', 0, 1, '2021-06-14 02:08:41', '2021-06-14 02:08:41'),
(298, 14, 29, 'img/product/original/2021/June/2-b2c0c46a3151dae4b173ed31c8bf4eaf58edfbf8.jpg,img/product/original/2021/June/2-ac2d25e9cb88345d0a92ecff54cfdf4c9dc2a261.jpg', 1, 0, '2021-06-14 02:08:43', '2021-06-14 02:08:43'),
(299, 14, 30, 'Royal Gala Apples', 0, 1, '2021-06-14 02:08:43', '2021-06-14 02:08:43'),
(300, 14, 31, '{\"Quantity From\":\"10\",\"Quantity To\":\"15\",\"Unit\":\"KG\",\"Currency\":\"$\",\"Price\":\"10\",\"Per Unit\":\"KG\"}', 1, 1, '2021-06-14 02:08:43', '2021-06-14 02:08:43'),
(301, 14, 32, '{\"Quantity From\":\"100\",\"Quantity To\":\"150\",\"Unit\":\"KG\",\"Currency\":\"$\",\"Price\":\"8\",\"Per Unit\":\"KG\"}', 1, 1, '2021-06-14 02:08:43', '2021-06-14 02:08:43'),
(302, 14, 34, 'Royal Gala Apples', 0, 0, '2021-06-14 02:08:43', '2021-06-14 02:08:43'),
(303, 14, 35, 'Royal Gala Apples', 0, 0, '2021-06-14 02:08:43', '2021-06-14 02:08:43'),
(304, 14, 36, 'Royal Gala Apples', 0, 0, '2021-06-14 02:08:43', '2021-06-14 02:08:43'),
(305, 14, 37, 'United States', 1, 1, '2021-06-14 02:08:43', '2021-06-14 02:08:43'),
(306, 14, 38, 'Royal Gala', 1, 1, '2021-06-14 02:08:43', '2021-06-14 02:08:43'),
(307, 14, 40, 'Sweet and Fresh', 0, 0, '2021-06-14 02:08:43', '2021-06-14 02:08:43'),
(308, 14, 41, 'Royal Gala Apples', 0, 0, '2021-06-14 02:08:43', '2021-06-14 02:08:43'),
(309, 14, 42, 'TT', 1, 0, '2021-06-14 02:08:43', '2021-06-14 02:08:43'),
(310, 14, 43, '{\"Quantity\":\"500\",\"Unit\":\"KG\",\"Time\":\"Day\"}', 1, 0, '2021-06-14 02:08:43', '2021-06-14 02:08:43'),
(311, 14, 44, 'Royal Gala Apples', 0, 0, '2021-06-14 02:08:43', '2021-06-14 02:08:43'),
(312, 14, 45, '{\"Quantity\":\"10\",\"Unit\":\"KG\"}', 1, 0, '2021-06-14 02:08:43', '2021-06-14 02:08:43'),
(313, 14, 46, 'Royal Gala Apples', 0, 0, '2021-06-14 02:08:43', '2021-06-14 02:08:43'),
(314, 14, 47, 'Royal Gala Apples', 0, 0, '2021-06-14 02:08:43', '2021-06-14 02:08:43'),
(315, 14, 48, 'Royal Gala Apples', 0, 0, '2021-06-14 02:08:43', '2021-06-14 02:08:43'),
(316, 14, 49, '5000', 0, 0, '2021-06-14 20:26:39', '2021-06-14 20:26:39'),
(317, 15, 26, 'Mixed Barries', 1, 1, '2021-06-15 15:24:00', '2021-06-15 15:24:00'),
(318, 15, 27, 'Barries', 0, 1, '2021-06-15 15:24:00', '2021-06-15 15:24:00'),
(319, 15, 28, 'Mixed Barries', 0, 1, '2021-06-15 15:24:00', '2021-06-15 15:24:00'),
(320, 15, 29, 'img/product/original/2021/June/3-9aa641228f0f45877afed35d314dbe6aa77045b4.png,img/product/original/2021/June/3-c76c98610233c3e76fd9da3f75733cd274f075b8.png,img/product/original/2021/June/3-94a35d146fb30ef2f8b971e1532b666b9ef77dee.png', 1, 0, '2021-06-15 15:24:04', '2021-06-15 15:24:04'),
(321, 15, 30, 'Barry', 0, 1, '2021-06-15 15:24:04', '2021-06-15 15:24:04'),
(322, 15, 31, '{\"Quantity From\":\"50\",\"Quantity To\":\"100\",\"Unit\":\"KG\",\"Currency\":\"$\",\"Price\":\"25\",\"Per Unit\":\"KG\"}', 1, 1, '2021-06-15 15:24:04', '2021-06-15 15:24:04'),
(323, 15, 32, '{\"Quantity From\":\"900\",\"Quantity To\":\"1000\",\"Unit\":\"KG\",\"Currency\":\"$\",\"Price\":\"20\",\"Per Unit\":\"KG\"}', 1, 1, '2021-06-15 15:24:04', '2021-06-15 15:24:04'),
(324, 15, 34, 'Mixed Barries', 0, 0, '2021-06-15 15:24:04', '2021-06-15 15:24:04'),
(325, 15, 35, 'Mixed Barries', 0, 0, '2021-06-15 15:24:04', '2021-06-15 15:24:04'),
(326, 15, 36, 'Home Cultivation', 0, 0, '2021-06-15 15:24:04', '2021-06-15 15:24:04'),
(327, 15, 37, 'United States', 1, 1, '2021-06-15 15:24:04', '2021-06-15 15:24:04'),
(328, 15, 38, 'Olsen', 1, 1, '2021-06-15 15:24:04', '2021-06-15 15:24:04'),
(329, 15, 40, 'QQ', 0, 0, '2021-06-15 15:24:04', '2021-06-15 15:24:04'),
(330, 15, 41, 'Boxed Packed', 0, 0, '2021-06-15 15:24:04', '2021-06-15 15:24:04'),
(331, 15, 42, 'PAYPAL', 1, 0, '2021-06-15 15:24:04', '2021-06-15 15:24:04'),
(332, 15, 43, '{\"Quantity\":\"5000\",\"Unit\":\"KG\",\"Time\":\"Day\"}', 1, 0, '2021-06-15 15:24:04', '2021-06-15 15:24:04'),
(333, 15, 44, '24 Hours', 0, 0, '2021-06-15 15:24:04', '2021-06-15 15:24:04'),
(334, 15, 45, '{\"Quantity\":\"50\",\"Unit\":\"KG\"}', 1, 0, '2021-06-15 15:24:04', '2021-06-15 15:24:04'),
(335, 15, 46, 'Mixed Barries', 0, 0, '2021-06-15 15:24:04', '2021-06-15 15:24:04'),
(336, 15, 47, 'Mixed Barries', 0, 0, '2021-06-15 15:24:04', '2021-06-15 15:24:04'),
(337, 15, 48, 'Free Return with Postage', 0, 0, '2021-06-15 15:24:04', '2021-06-15 15:24:04'),
(338, 15, 49, '1000000', 0, 0, '2021-06-15 21:46:35', '2021-06-15 21:46:35');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `property` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `section_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_required` tinyint(1) DEFAULT NULL,
  `is_for_search_engine` tinyint(1) DEFAULT NULL,
  `is_for_product_listing` tinyint(1) DEFAULT NULL,
  `is_for_filter` tinyint(1) DEFAULT NULL,
  `sequence` double UNSIGNED DEFAULT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `narrative` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `property`, `section_id`, `type`, `options`, `is_required`, `is_for_search_engine`, `is_for_product_listing`, `is_for_filter`, `sequence`, `status`, `narrative`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Title', 1, 'Input', NULL, 1, 1, 1, 0, NULL, 'Active', 'Title of the product. Title of the product. Title of the product. Title of the product. Title of the product. ', NULL, NULL, '2020-10-17 21:03:11', '2020-11-09 15:35:21'),
(2, 'Descriptive Title', 1, 'Textarea', NULL, 1, 1, 1, 0, NULL, 'Active', '---', NULL, NULL, '2020-10-17 21:06:35', '2020-11-09 15:36:39'),
(3, 'Keywards and Tags', 1, 'Input', NULL, 0, 0, 0, 0, NULL, 'Active', '---', NULL, NULL, '2020-10-17 21:08:16', '2020-10-17 21:08:16'),
(4, 'Custom Label (SKU)', 1, 'Input', NULL, 0, 0, 0, 0, NULL, 'Active', '---', NULL, NULL, '2020-10-17 21:09:34', '2020-10-17 21:09:34'),
(5, 'Images', 1, 'Image', NULL, 1, 0, 1, 0, NULL, 'Active', 'Please upload at least 3 and up to 5 images. The images should be the type of JPG or PNG and have the dimension from 800px X 800px to 1600px X 1600px maintaining the aspect ratio 1:1 and each file size should not exceed 1 MB.', NULL, NULL, '2020-10-17 21:10:46', '2021-05-04 12:45:46'),
(6, 'Condition', 2, 'Select Single', '[\"Brand New\",\"Used\",\"Other\",\"Open Box\",\"Refurbished\",\"For Parts Only\",\"Used Good Condition\",\"New without Box\",\"New with Tag\",\"New without Tag\"]', 1, 1, 0, 1, NULL, 'Active', '---', NULL, NULL, '2020-10-17 21:26:25', '2021-06-12 13:20:06'),
(7, 'Condition Description', 2, 'Textarea', NULL, 0, 0, 0, 0, NULL, 'Active', '---', NULL, NULL, '2020-10-17 21:36:11', '2020-10-17 21:36:11'),
(8, 'Proposition 65 Warning', 2, 'Input', NULL, 0, 0, 0, 0, NULL, 'Active', '---', NULL, NULL, '2020-10-17 21:37:07', '2020-10-17 21:37:07'),
(9, 'Country of Manufacture', 3, 'Input', NULL, 1, 1, 0, 1, NULL, 'Active', '---', NULL, NULL, '2020-10-17 21:42:17', '2021-05-20 11:03:16'),
(10, 'Bundle Items', 3, 'Radio', '[\"Yes\",\"No\"]', 0, 0, 0, 0, NULL, 'Active', '---', NULL, NULL, '2020-10-17 21:43:55', '2021-06-12 13:20:41'),
(11, 'Price', 4, 'Input', NULL, 1, 1, 1, 1, NULL, 'Active', '---', NULL, NULL, '2020-10-17 21:46:23', '2021-05-20 11:03:34'),
(12, 'Selling Arrangement', 4, 'Select Single', '[\"Fixed Price\",\"Negotiable\",\"Both\"]', 0, 0, 0, 0, NULL, 'Active', '---', NULL, NULL, '2020-10-17 21:49:16', '2021-06-12 13:20:49'),
(13, 'Payment Options', 4, 'Select Single', '[\"VISA\",\"MASTER\",\"PAYPAL\",\"CASH\",\"CHECK\"]', 0, 0, 0, 0, NULL, 'Active', '---', NULL, NULL, '2020-10-17 21:51:09', '2021-06-12 13:20:52'),
(14, 'Sales Tax', 4, 'Input', NULL, 0, 0, 0, 0, NULL, 'Active', '---', NULL, NULL, '2020-10-17 21:51:44', '2020-10-17 21:51:44'),
(15, 'Service', 5, 'Select Single', '[\"USPS\",\"UPS\",\"FedEx\"]', 0, 0, 0, 0, NULL, 'Active', '---', NULL, NULL, '2020-10-17 22:03:07', '2021-06-12 13:20:56'),
(16, 'Shipping Cost', 5, 'Input', NULL, 1, 1, 1, 0, NULL, 'Active', '---', NULL, NULL, '2020-10-17 22:03:28', '2021-05-07 15:10:07'),
(17, 'Ships From', 5, 'Input', NULL, 0, 0, 0, 0, NULL, 'Active', '---', NULL, NULL, '2020-10-17 22:05:20', '2020-10-17 22:05:20'),
(18, 'Shipping Time', 5, 'Select Single', '[\"Same Business Day\",\"1 Business Days \\u2013 10 Business Days\",\"15 Business Days\",\"20 Business Days\",\"30 Business Days\"]', 1, 0, 1, 0, NULL, 'Active', '---', NULL, NULL, '2020-10-17 22:06:49', '2021-06-12 13:21:00'),
(19, 'Return options', 5, 'Input', NULL, 0, 0, 0, 0, NULL, 'Active', '---', NULL, NULL, '2020-10-17 22:07:18', '2020-10-17 22:07:18'),
(20, 'Sell to location', 5, 'Input', NULL, 0, 0, 0, 0, NULL, 'Active', '---', NULL, NULL, '2020-10-17 22:11:21', '2020-10-17 22:11:21'),
(21, 'Quantity', 2, 'Input', NULL, 1, 0, 1, 0, NULL, 'Active', '---', NULL, NULL, '2020-11-17 13:35:47', '2020-11-17 13:35:47'),
(22, 'Size', 2, 'User Defined Input', NULL, 1, 1, 0, 1, NULL, 'Active', '---', NULL, NULL, '2020-12-19 14:18:58', '2021-05-20 11:04:22'),
(23, 'Color', 2, 'User Defined Input', NULL, 1, 1, 0, 1, NULL, 'Active', '---', NULL, NULL, '2020-12-19 14:19:32', '2021-05-20 11:04:30'),
(24, 'Minimum Order Quantity', 3, 'From To Input', NULL, 1, 0, 1, 0, NULL, 'Active', '---', NULL, NULL, '2021-01-01 12:53:17', '2021-01-01 12:53:17'),
(25, 'Brand', 2, 'Input', NULL, 1, 1, 0, 1, NULL, 'Active', '---', NULL, NULL, '2021-05-21 09:28:12', '2021-05-21 09:28:12'),
(26, 'Title', 7, 'Input', NULL, 1, 1, 1, 0, NULL, 'Active', 'Please enter product title name', NULL, NULL, '2021-06-10 14:18:53', '2021-06-10 14:18:53'),
(27, 'Keywords', 7, 'Input', NULL, 1, 1, 0, 0, NULL, 'Active', 'Please enter one keyword only', NULL, NULL, '2021-06-10 14:19:56', '2021-06-10 14:19:56'),
(28, 'Tags', 7, 'Textarea', NULL, 1, 1, 0, 0, NULL, 'Active', 'Adding more tags helps to search engine direct traffic to your product. Sample: golden apples, organic apples', NULL, NULL, '2021-06-10 14:21:21', '2021-06-10 14:21:21'),
(29, 'Images', 7, 'Image', NULL, 1, 0, 1, 0, NULL, 'Active', 'Please upload at least 3 and up to 5 images. The images should be the type of JPG or PNG and have the dimension from 800px X 800px to 1600px X 1600px maintaining the aspect ratio 1:1 and each file size should not exceed 1 MB.', NULL, NULL, '2021-06-10 14:22:09', '2021-06-10 14:22:09'),
(30, 'Product Type', 8, 'Input', NULL, 1, 1, 0, 0, NULL, 'Active', '---', NULL, NULL, '2021-06-10 14:31:11', '2021-06-10 14:31:11'),
(31, 'Min Order', 9, 'Input Group', '[\"Quantity From:Input\",\"Quantity To:Input\",{\"Unit:Select\":[\"KG\",\"Litre\",\"LBS\"]},{\"Currency:Select\":[\"$\",\"\\u00a3\",\"\\u20ac\"]},\"Price:Input\",{\"Per Unit:Select\":[\"KG\",\"Litre\",\"LBS\"]}]', 1, 1, 1, 1, NULL, 'Active', '---', NULL, NULL, '2021-06-12 12:36:10', '2021-06-12 12:36:10'),
(32, 'Max Order', 9, 'Input Group', '[\"Quantity From:Input\",\"Quantity To:Input\",{\"Unit:Select\":[\"KG\",\"Litre\",\"LBS\"]},{\"Currency:Select\":[\"$\",\"\\u00a3\",\"\\u20ac\"]},\"Price:Input\",{\"Per Unit:Select\":[\"KG\",\"Litre\",\"LBS\"]}]', 1, 1, 1, 1, NULL, 'Active', '---', NULL, NULL, '2021-06-12 12:38:42', '2021-06-12 12:38:42'),
(33, 'Style', 8, 'Input', NULL, 0, 0, 0, 0, NULL, 'Active', '---', NULL, NULL, '2021-06-12 12:41:30', '2021-06-12 12:41:30'),
(34, 'Variety', 8, 'Input', NULL, 0, 0, 0, 0, NULL, 'Active', '---', NULL, NULL, '2021-06-12 12:41:46', '2021-06-12 12:41:46'),
(35, 'FOB', 10, 'Input', NULL, 1, 0, 0, 0, NULL, 'Active', 'Free on Board or Freight on Board', NULL, NULL, '2021-06-12 12:43:16', '2021-06-12 12:59:16'),
(36, 'Cultivation Type', 8, 'Input', NULL, 0, 0, 0, 0, NULL, 'Active', '---', NULL, NULL, '2021-06-12 12:43:32', '2021-06-12 12:43:32'),
(37, 'Place of Origin', 8, 'Input', NULL, 1, 1, 1, 0, NULL, 'Active', '---', NULL, NULL, '2021-06-12 12:44:51', '2021-06-12 12:44:51'),
(38, 'Brand Name', 8, 'Input', NULL, 1, 1, 1, 1, NULL, 'Active', '---', NULL, NULL, '2021-06-12 12:45:15', '2021-06-12 12:45:15'),
(39, 'Model Number', 8, 'Input', NULL, 1, 1, 1, 0, NULL, 'Active', '---', NULL, NULL, '2021-06-12 12:45:39', '2021-06-12 12:45:39'),
(40, 'Taste', 8, 'Input', NULL, 0, 0, 0, 0, NULL, 'Active', '---', NULL, NULL, '2021-06-12 12:45:53', '2021-06-12 12:45:53'),
(41, 'Packing Details', 8, 'Textarea', NULL, 1, 0, 0, 0, NULL, 'Active', 'Please enter packaging characteristics, size, type, capacity etc.', NULL, NULL, '2021-06-12 12:47:46', '2021-06-12 12:47:46'),
(42, 'Payment Terms', 9, 'Select Single', '[\"TT\",\"DA\",\"DP\",\"LC\",\"PAYPAL\",\"MoneyGram\",\"Western Union\",\"All\",\"Other\"]', 1, 0, 1, 0, NULL, 'Active', '---', NULL, NULL, '2021-06-12 12:50:13', '2021-06-12 13:28:22'),
(43, 'Supply Ability', 9, 'Input Group', '[\"Quantity:Input\",{\"Unit:Select\":[\"KG\",\"Litre\",\"LBS\"]},{\"Time:Select\":[\"Day\",\"Week\",\"Month\",\"Quarter\",\"Year\"]}]', 1, 0, 1, 0, NULL, 'Active', '---', NULL, NULL, '2021-06-12 12:53:20', '2021-06-12 12:53:20'),
(44, 'Delivery Time', 10, 'Input', NULL, 1, 0, 0, 0, NULL, 'Active', 'Please include estimate delivery time and location', NULL, NULL, '2021-06-12 12:54:31', '2021-06-12 12:54:31'),
(45, 'MOQ', 9, 'Input Group', '[\"Quantity:Input\",{\"Unit:Select\":[\"KG\",\"Litre\",\"LBS\"]}]', 1, 0, 1, 1, NULL, 'Active', '---', NULL, NULL, '2021-06-12 12:56:17', '2021-06-12 12:56:17'),
(46, 'CIF', 10, 'Input', NULL, 1, 0, 0, 0, NULL, 'Active', 'Cost, Insurance and Freight', NULL, NULL, '2021-06-12 12:59:41', '2021-06-12 12:59:41'),
(47, 'CNF', 10, 'Input', NULL, 1, 0, 0, 0, NULL, 'Active', 'Cost Net Freight or Cost, no Insurance, Freight', NULL, NULL, '2021-06-12 12:59:58', '2021-06-12 12:59:58'),
(48, 'Return', 10, 'Textarea', NULL, 1, 0, 0, 0, NULL, 'Active', 'Please indicate whether rejected product acceptable or not, with acceptable days and in what condition', NULL, NULL, '2021-06-12 13:00:28', '2021-06-12 13:00:39'),
(49, 'Quantity', 8, 'Input', NULL, 1, 0, 0, 0, NULL, 'Active', '---', NULL, NULL, '2021-06-14 14:25:00', '2021-06-14 14:25:00');

-- --------------------------------------------------------

--
-- Table structure for table `sales_taxes`
--

CREATE TABLE `sales_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_rate` double UNSIGNED DEFAULT NULL,
  `estimated_combined_rate` double UNSIGNED DEFAULT NULL,
  `estimated_country_rate` double UNSIGNED DEFAULT NULL,
  `estimated_city_rate` double UNSIGNED DEFAULT NULL,
  `estimated_special_rate` double UNSIGNED DEFAULT NULL,
  `risk_level` double UNSIGNED DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `section` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_type_id` int(10) UNSIGNED DEFAULT NULL,
  `sequence` double UNSIGNED DEFAULT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `narrative` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section`, `category_type_id`, `sequence`, `status`, `narrative`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Product Information', 1, NULL, 'Active', 'General information of the product.', NULL, NULL, '2020-10-17 20:57:09', '2020-10-17 20:57:09'),
(2, 'Product Details', 1, NULL, 'Active', 'Completing item details help buyers to better understand your listing product and prevents further misconception. Please fill up the appropriate item places for your product.', NULL, NULL, '2020-10-17 20:58:36', '2020-10-17 20:58:36'),
(3, 'Additional Details', 1, NULL, 'Active', '---', NULL, NULL, '2020-10-17 20:58:56', '2020-10-17 20:58:56'),
(4, 'Price Details', 1, NULL, 'Active', '---', NULL, NULL, '2020-10-17 20:59:09', '2020-10-17 20:59:09'),
(5, 'Shipping Details', 1, NULL, 'Active', '---', NULL, NULL, '2020-10-17 20:59:20', '2020-10-17 20:59:20'),
(6, 'Product Description', 1, NULL, 'Active', 'Please complete your item description however you like to be detailed.', NULL, NULL, '2020-10-17 20:59:36', '2020-10-17 20:59:36'),
(7, 'Product Information', 2, NULL, 'Active', 'Helps to identify the content and rank your product in searching result', NULL, NULL, '2021-06-10 13:56:41', '2021-06-10 14:16:14'),
(8, 'Product Details', 2, NULL, 'Active', 'Complete product details help buyers to better understand your listing product and prevents further misconception', NULL, NULL, '2021-06-10 13:56:55', '2021-06-10 14:16:41'),
(9, 'Trade Details', 2, NULL, 'Active', 'Complete trade details help to find potential buyers', NULL, NULL, '2021-06-10 13:57:51', '2021-06-10 14:17:07'),
(10, 'Shipping Details', 2, NULL, 'Active', 'Please complete shipping details it will help potential buyers to make definite decision', NULL, NULL, '2021-06-10 13:58:28', '2021-06-10 14:17:23');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `state`, `status`, `created_at`, `updated_at`) VALUES
(1, 223, 'Alabama', 'Active', '2021-02-21 17:27:33', '2021-02-21 17:27:33'),
(2, 223, 'Alaska', 'Active', '2021-02-21 17:27:33', '2021-02-21 17:27:33'),
(3, 223, 'American Samoa', 'Active', '2021-02-21 17:27:33', '2021-02-21 17:27:33'),
(4, 223, 'Arizona', 'Active', '2021-02-21 17:27:34', '2021-02-21 17:27:34'),
(5, 223, 'Arkansas', 'Active', '2021-02-21 17:27:34', '2021-02-21 17:27:34'),
(6, 223, 'California', 'Active', '2021-02-21 17:27:34', '2021-02-21 17:27:34'),
(7, 223, 'Colorado', 'Active', '2021-02-21 17:27:34', '2021-02-21 17:27:34'),
(8, 223, 'Connecticut', 'Active', '2021-02-21 17:27:34', '2021-02-21 17:27:34'),
(9, 223, 'Delaware', 'Active', '2021-02-21 17:27:34', '2021-02-21 17:27:34'),
(10, 223, 'District Of Columbia', 'Active', '2021-02-21 17:27:34', '2021-02-21 17:27:34'),
(11, 223, 'Federated States Of Micronesia', 'Active', '2021-02-21 17:27:34', '2021-02-21 17:27:34'),
(12, 223, 'Florida', 'Active', '2021-02-21 17:27:34', '2021-02-21 17:27:34'),
(13, 223, 'Georgia', 'Active', '2021-02-21 17:27:34', '2021-02-21 17:27:34'),
(14, 223, 'Guam', 'Active', '2021-02-21 17:27:35', '2021-02-21 17:27:35'),
(15, 223, 'Hawaii', 'Active', '2021-02-21 17:27:35', '2021-02-21 17:27:35'),
(16, 223, 'Idaho', 'Active', '2021-02-21 17:27:35', '2021-02-21 17:27:35'),
(17, 223, 'Illinois', 'Active', '2021-02-21 17:27:35', '2021-02-21 17:27:35'),
(18, 223, 'Indiana', 'Active', '2021-02-21 17:27:35', '2021-02-21 17:27:35'),
(19, 223, 'Iowa', 'Active', '2021-02-21 17:27:35', '2021-02-21 17:27:35'),
(20, 223, 'Kansas', 'Active', '2021-02-21 17:27:35', '2021-02-21 17:27:35'),
(21, 223, 'Kentucky', 'Active', '2021-02-21 17:27:35', '2021-02-21 17:27:35'),
(22, 223, 'Louisiana', 'Active', '2021-02-21 17:27:35', '2021-02-21 17:27:35'),
(23, 223, 'Maine', 'Active', '2021-02-21 17:27:35', '2021-02-21 17:27:35'),
(24, 223, 'Marshall Islands', 'Active', '2021-02-21 17:27:35', '2021-02-21 17:27:35'),
(25, 223, 'Maryland', 'Active', '2021-02-21 17:27:35', '2021-02-21 17:27:35'),
(26, 223, 'Massachusetts', 'Active', '2021-02-21 17:27:35', '2021-02-21 17:27:35'),
(27, 223, 'Michigan', 'Active', '2021-02-21 17:27:35', '2021-02-21 17:27:35'),
(28, 223, 'Minnesota', 'Active', '2021-02-21 17:27:36', '2021-02-21 17:27:36'),
(29, 223, 'Mississippi', 'Active', '2021-02-21 17:27:36', '2021-02-21 17:27:36'),
(30, 223, 'Missouri', 'Active', '2021-02-21 17:27:36', '2021-02-21 17:27:36'),
(31, 223, 'Montana', 'Active', '2021-02-21 17:27:37', '2021-02-21 17:27:37'),
(32, 223, 'Nebraska', 'Active', '2021-02-21 17:27:37', '2021-02-21 17:27:37'),
(33, 223, 'Nevada', 'Active', '2021-02-21 17:27:37', '2021-02-21 17:27:37'),
(34, 223, 'New Hampshire', 'Active', '2021-02-21 17:27:37', '2021-02-21 17:27:37'),
(35, 223, 'New Jersey', 'Active', '2021-02-21 17:27:37', '2021-02-21 17:27:37'),
(36, 223, 'New Mexico', 'Active', '2021-02-21 17:27:38', '2021-02-21 17:27:38'),
(37, 223, 'New York', 'Active', '2021-02-21 17:27:38', '2021-02-21 17:27:38'),
(38, 223, 'North Carolina', 'Active', '2021-02-21 17:27:38', '2021-02-21 17:27:38'),
(39, 223, 'North Dakota', 'Active', '2021-02-21 17:27:38', '2021-02-21 17:27:38'),
(40, 223, 'Northern Mariana Islands', 'Active', '2021-02-21 17:27:38', '2021-02-21 17:27:38'),
(41, 223, 'Ohio', 'Active', '2021-02-21 17:27:38', '2021-02-21 17:27:38'),
(42, 223, 'Oklahoma', 'Active', '2021-02-21 17:27:38', '2021-02-21 17:27:38'),
(43, 223, 'Oregon', 'Active', '2021-02-21 17:27:38', '2021-02-21 17:27:38'),
(44, 223, 'Palau', 'Active', '2021-02-21 17:27:39', '2021-02-21 17:27:39'),
(45, 223, 'Pennsylvania', 'Active', '2021-02-21 17:27:39', '2021-02-21 17:27:39'),
(46, 223, 'Puerto Rico', 'Active', '2021-02-21 17:27:39', '2021-02-21 17:27:39'),
(47, 223, 'Rhode Island', 'Active', '2021-02-21 17:27:39', '2021-02-21 17:27:39'),
(48, 223, 'South Carolina', 'Active', '2021-02-21 17:27:39', '2021-02-21 17:27:39'),
(49, 223, 'South Dakota', 'Active', '2021-02-21 17:27:39', '2021-02-21 17:27:39'),
(50, 223, 'Tennessee', 'Active', '2021-02-21 17:27:39', '2021-02-21 17:27:39'),
(51, 223, 'Texas', 'Active', '2021-02-21 17:27:39', '2021-02-21 17:27:39'),
(52, 223, 'Utah', 'Active', '2021-02-21 17:27:39', '2021-02-21 17:27:39'),
(53, 223, 'Vermont', 'Active', '2021-02-21 17:27:39', '2021-02-21 17:27:39'),
(54, 223, 'Virgin Islands', 'Active', '2021-02-21 17:27:39', '2021-02-21 17:27:39'),
(55, 223, 'Virginia', 'Active', '2021-02-21 17:27:40', '2021-02-21 17:27:40'),
(56, 223, 'Washington', 'Active', '2021-02-21 17:27:40', '2021-02-21 17:27:40'),
(57, 223, 'West Virginia', 'Active', '2021-02-21 17:27:40', '2021-02-21 17:27:40'),
(58, 223, 'Wisconsin', 'Active', '2021-02-21 17:27:40', '2021-02-21 17:27:40'),
(59, 223, 'Wyoming', 'Active', '2021-02-21 17:27:40', '2021-02-21 17:27:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `provider_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Root', 'root@goodgross.com', 'img/application/admin_avatar.jpg', '$2y$10$91OSxMlUV/Mh8duqqMoYb.APq47xyruUh4Ff81Ud9zSkYi.MILTqO', NULL, 'Controller', 'Active', '2021-04-11 11:55:46', '2021-04-11 11:55:46'),
(2, 0, NULL, 'Asraf Duha', 'seaudbd@gmail.com', NULL, '$2y$10$6oZ/8rrX1x3jh/lwZnIZk.wO3F4DPfwbBffVYSh4Pn7UVDafCgeWW', NULL, 'Account', 'Active', '2021-05-18 14:15:59', '2021-05-18 14:20:23'),
(3, 0, NULL, 'Arizona Traders', 'tasmiatashahud@gmail.com', NULL, '$2y$10$kZeFdbtkDg7kVE3QLM8vU.bGo8gV5KaX9UgCHH1Cb3V0QPFnKQo0e', NULL, 'Account', 'Active', '2021-06-04 14:22:07', '2021-06-04 14:23:26'),
(4, 0, NULL, 'Olsen Agro Industries', 'mrtest714@gmail.com', NULL, '$2y$10$dAzfI8Mx0xUKunyRnsU3Ge70aEPygZlS3KAfHBURHNCslmWjdZjG6', NULL, 'Account', 'Active', '2021-06-15 15:24:00', '2021-06-15 15:28:30'),
(5, NULL, NULL, 'Bilal Mahmud', 'root@archiverz.com', NULL, NULL, NULL, 'Account', 'Inactive', '2021-10-30 05:19:51', '2021-10-30 05:19:51'),
(6, NULL, NULL, 'David Dhawan', 'abc@gmail.com', NULL, NULL, NULL, 'Account', 'Inactive', '2021-10-30 20:10:11', '2021-10-30 20:10:11'),
(7, NULL, NULL, 'David Dhawan', 'abc@gmail.com', NULL, NULL, NULL, 'Account', 'Inactive', '2021-10-30 20:10:37', '2021-10-30 20:10:37'),
(8, NULL, NULL, 'David Dhawan', 'abc@gmail.com', NULL, NULL, NULL, 'Account', 'Inactive', '2021-10-30 20:11:28', '2021-10-30 20:11:28'),
(9, NULL, NULL, 'David Dhawan', 'abc@gmail.com', NULL, NULL, NULL, 'Account', 'Inactive', '2021-10-30 20:12:17', '2021-10-30 20:12:17');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `user_id`, `order_transaction_id`, `type`, `title`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Transaction', 'An order for the product \"Mazda MX-5 Miata\" has been made from the account number: \"G-20211030-100000\"', NULL, '2021-10-30 05:19:51', '2021-10-30 05:19:51'),
(2, 1, 1, 'Transaction', 'An order for the product \"Mazda MX-5 Miata\" owned by the account number: \"P-20210518-100000\" has been made from the account number: \"G-20211030-100000\"', NULL, '2021-10-30 05:19:51', '2021-10-30 05:19:51'),
(3, 2, 2, 'Transaction', 'An order for the product \"Audi Manhattan Bubble Superior Danapo Lexa 2019\" has been made from the account number: \"G-20211030-100000\"', NULL, '2021-10-30 05:19:51', '2021-10-30 05:19:51'),
(4, 1, 2, 'Transaction', 'An order for the product \"Audi Manhattan Bubble Superior Danapo Lexa 2019\" owned by the account number: \"P-20210518-100000\" has been made from the account number: \"G-20211030-100000\"', NULL, '2021-10-30 05:19:51', '2021-10-30 05:19:51'),
(5, 2, 3, 'Transaction', 'An order for the product \"Volkswagen VXL-2019\" has been made from the account number: \"R-20210604-100000\"', NULL, '2021-10-30 05:38:57', '2021-10-30 05:38:57'),
(6, 1, 3, 'Transaction', 'An order for the product \"Volkswagen VXL-2019\" owned by the account number: \"P-20210518-100000\" has been made from the account number: \"R-20210604-100000\"', NULL, '2021-10-30 05:38:57', '2021-10-30 05:38:57'),
(7, 2, 4, 'Transaction', 'An order for the product \"Mercedes-AMG C43\" has been made from the account number: \"R-20210604-100000\"', NULL, '2021-10-30 05:38:57', '2021-10-30 05:38:57'),
(8, 1, 4, 'Transaction', 'An order for the product \"Mercedes-AMG C43\" owned by the account number: \"P-20210518-100000\" has been made from the account number: \"R-20210604-100000\"', NULL, '2021-10-30 05:38:57', '2021-10-30 05:38:57'),
(9, 2, 5, 'Transaction', 'An order for the product \"Mazda MX-5 Miata\" has been made from the account number: \"R-20210604-100000\"', NULL, '2021-10-30 19:41:54', '2021-10-30 19:41:54'),
(10, 1, 5, 'Transaction', 'An order for the product \"Mazda MX-5 Miata\" owned by the account number: \"P-20210518-100000\" has been made from the account number: \"R-20210604-100000\"', NULL, '2021-10-30 19:41:54', '2021-10-30 19:41:54'),
(11, 2, 6, 'Transaction', 'An order for the product \"Mercedes-AMG C43\" has been made from the account number: \"R-20210604-100000\"', NULL, '2021-10-30 19:41:54', '2021-10-30 19:41:54'),
(12, 1, 6, 'Transaction', 'An order for the product \"Mercedes-AMG C43\" owned by the account number: \"P-20210518-100000\" has been made from the account number: \"R-20210604-100000\"', NULL, '2021-10-30 19:41:54', '2021-10-30 19:41:54'),
(13, 2, 7, 'Transaction', 'An order for the product \"Audi Manhattan Bubble Superior Danapo Lexa 2019\" has been made from the account number: \"R-20210604-100000\"', NULL, '2021-10-30 20:13:20', '2021-10-30 20:13:20'),
(14, 1, 7, 'Transaction', 'An order for the product \"Audi Manhattan Bubble Superior Danapo Lexa 2019\" owned by the account number: \"P-20210518-100000\" has been made from the account number: \"R-20210604-100000\"', NULL, '2021-10-30 20:13:20', '2021-10-30 20:13:20'),
(15, 2, 8, 'Transaction', 'An order for the product \"Volkswagen VXL-2019\" has been made from the account number: \"R-20210604-100000\"', NULL, '2021-10-30 20:13:20', '2021-10-30 20:13:20'),
(16, 1, 8, 'Transaction', 'An order for the product \"Volkswagen VXL-2019\" owned by the account number: \"P-20210518-100000\" has been made from the account number: \"R-20210604-100000\"', NULL, '2021-10-30 20:13:20', '2021-10-30 20:13:20');

-- --------------------------------------------------------

--
-- Table structure for table `watched_products`
--

CREATE TABLE `watched_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `watched_products`
--

INSERT INTO `watched_products` (`id`, `account_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 2, 9, '2021-06-09 16:19:01', '2021-06-09 16:19:01'),
(2, 2, 1, '2021-06-10 13:03:48', '2021-06-10 13:03:48'),
(3, 2, 2, '2021-06-10 13:11:55', '2021-06-10 13:11:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_billings`
--
ALTER TABLE `account_billings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_cards`
--
ALTER TABLE `account_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_payment_methods`
--
ALTER TABLE `account_payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_shippings`
--
ALTER TABLE `account_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_accounts`
--
ALTER TABLE `business_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_types`
--
ALTER TABLE `category_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `connected_accounts`
--
ALTER TABLE `connected_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guest_accounts`
--
ALTER TABLE `guest_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_billings`
--
ALTER TABLE `order_billings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_shippings`
--
ALTER TABLE `order_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_accounts`
--
ALTER TABLE `personal_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_properties`
--
ALTER TABLE `product_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_taxes`
--
ALTER TABLE `sales_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `watched_products`
--
ALTER TABLE `watched_products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `account_billings`
--
ALTER TABLE `account_billings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `account_cards`
--
ALTER TABLE `account_cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `account_payment_methods`
--
ALTER TABLE `account_payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `account_shippings`
--
ALTER TABLE `account_shippings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `business_accounts`
--
ALTER TABLE `business_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `category_types`
--
ALTER TABLE `category_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `connected_accounts`
--
ALTER TABLE `connected_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT for table `guest_accounts`
--
ALTER TABLE `guest_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_billings`
--
ALTER TABLE `order_billings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_shippings`
--
ALTER TABLE `order_shippings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_accounts`
--
ALTER TABLE `personal_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_properties`
--
ALTER TABLE `product_properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=339;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `sales_taxes`
--
ALTER TABLE `sales_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `watched_products`
--
ALTER TABLE `watched_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
