-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 08, 2024 at 04:40 AM
-- Server version: 8.0.36
-- PHP Version: 8.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lablum_entertainment`
--

-- --------------------------------------------------------

--
-- Table structure for table `addcategories`
--

CREATE TABLE `addcategories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addcategories`
--

INSERT INTO `addcategories` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(2, 'Others', 'others', '2024-04-03 00:22:37', '2024-04-03 00:22:37'),
(3, 'Banner Advertisment', 'banner-advertisment', '2024-05-24 12:58:39', '2024-05-24 12:58:39');

-- --------------------------------------------------------

--
-- Table structure for table `addplans`
--

CREATE TABLE `addplans` (
  `id` bigint UNSIGNED NOT NULL,
  `advertiser_id` bigint UNSIGNED NOT NULL,
  `add_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `days_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_audiance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_age_min` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_age_max` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_status` tinyint NOT NULL DEFAULT '0',
  `avtivation_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addplans`
--

INSERT INTO `addplans` (`id`, `advertiser_id`, `add_count`, `days_count`, `target_audiance`, `target_age_min`, `target_age_max`, `location`, `payment_amount`, `add_status`, `avtivation_date`, `expire_date`, `created_at`, `updated_at`, `city`, `state`, `zipcode`) VALUES
(44, 54, '1', '120', 'CollegeStudents', '23', '45', 'Rasulgarh', '1200', 1, NULL, NULL, '2024-04-11 11:50:14', '2024-04-11 11:50:14', 'Bhubneswar', 'Odisha', '765022'),
(45, 58, '4', '120', 'CollegeStudents', '18', '35', 'Patia', '4800', 0, NULL, NULL, '2024-06-05 14:55:36', '2024-06-05 14:55:36', 'Bhubaneswar', 'Orissa', '751010'),
(46, 58, '4', '120', 'CollegeStudents', '18', '34', 'Patia', '4800', 0, NULL, NULL, '2024-06-05 14:57:57', '2024-06-05 14:57:57', 'Bhubaneswar', 'Orissa', '751010'),
(47, 58, '4', '100', 'CollegeStudents', '18', '34', 'Patia', '4000', 1, NULL, NULL, '2024-06-05 14:59:31', '2024-06-05 14:59:31', 'Bhubaneswar', 'Orissa', '751010'),
(48, 54, '5', '120', 'CollegeStudents', '18', '34', 'Patia', '6000', 0, NULL, NULL, '2024-07-25 15:05:49', '2024-07-25 15:05:49', 'Bhubaneswar', 'Orissa', '751010'),
(49, 54, '10', '120', 'CollegeStudents', '18', '34', 'Patia', '12000', 0, NULL, NULL, '2024-07-25 15:08:46', '2024-07-25 15:08:46', 'Bhubaneswar', 'Orissa', '751010');

-- --------------------------------------------------------

--
-- Table structure for table `addpricings`
--

CREATE TABLE `addpricings` (
  `id` bigint UNSIGNED NOT NULL,
  `video_count` int NOT NULL,
  `days_count` int NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addvideos`
--

CREATE TABLE `addvideos` (
  `id` bigint UNSIGNED NOT NULL,
  `adevrtiser_id` bigint UNSIGNED NOT NULL,
  `addplan_id` bigint UNSIGNED NOT NULL,
  `fb_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `insta_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `web_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `length` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addvideos`
--

INSERT INTO `addvideos` (`id`, `adevrtiser_id`, `addplan_id`, `fb_link`, `insta_link`, `web_link`, `status`, `video`, `video_type`, `length`, `created_at`, `updated_at`) VALUES
(23, 54, 44, 'https://lablum.com/about-us', 'https://lablum.com/about-us', 'https://lablum.com/about-us', 1, 'WhatsApp Video 2024-04-11 at 1.15.01 PM.mp4', 'Ads', 10, '2024-04-11 11:53:23', '2024-04-11 11:53:23'),
(24, 58, 47, 'https://www.facebook.com/Hexatech19/', 'https://www.instagram.com/hexaphortech/', 'http://luckymalls.co/', 0, 'WhatsApp Video 2024-04-11 at 1.15.01 PM.mp4', 'Sponsored', NULL, '2024-06-05 15:08:39', '2024-06-05 15:08:39');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `password`, `status`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'lablum@gmail.com', '9999999999', '$2y$12$SOP/ahpF5qmTmcuJWd9TTOrbwYx7jIYOhvUc9A0RzzaRtYlRfOKFa', 1, '2024-01-09 21:25:51', 'TfePFaA36meEhPKQjVzlW0QuHgtLHPLIRDb6wrHbl7FNHJKNnGjXCBZun21a', '2024-01-09 21:25:52', '2024-01-09 21:25:52'),
(2, 'Ravikant Kumar', 'staff1@gmail.com', '6204577138', '$2y$12$NuZSKklpvyEJ7KOmDECFtOni5nTEYQNP8xqnNtwynu2E5x7Zi2PdO', 1, NULL, NULL, '2024-06-05 15:29:24', '2024-06-05 15:29:24'),
(4, 'Sonu Kumar', 'staff2@gmail.com', '6204577137', '$2y$12$XctHWqJO4QiCIA82jSZvx.O/hZfDqd4BfPTBZ/Ka7MW0U1Op9hmwy', 1, NULL, NULL, '2024-06-05 15:32:31', '2024-06-05 15:32:31');

-- --------------------------------------------------------

--
-- Table structure for table `advertisers`
--

CREATE TABLE `advertisers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `area` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personel_documents` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approve` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advertisers`
--

INSERT INTO `advertisers` (`id`, `name`, `email`, `mobile`, `business_type`, `business_name`, `url`, `area`, `city`, `state`, `zipcode`, `business_document`, `personel_documents`, `password`, `is_approve`, `created_at`, `updated_at`) VALUES
(54, 'Lablum Entertainment', 'ravikant.hexaphor@gmail.com', '6204577138', '2', 'Short Video Application', 'https://lablum.com/', 'Palasuni', 'Bhubneswar', 'Odisha', '765022', 'business_documents/koQuQr7LC6dmgIALkbpuzoYNtEeC180uyg3kkWzP.jpg,business_documents/47g8WlIIz31GNpfOyTzIv6LMUadgKqEupMweVKd5.png', 'personal_documents/73wU5lyWtwagf9MVu7QLzKsbDbtUUzkHQW4FNZG4.png,personal_documents/UQHPKlkWu1nCoqetlfkgmk7fIevUvLmBFXU7J2iE.png', '$2y$12$mueR/U5vPSUZeHyyl7xfwentIChK6Ha0EMO51jxzzKpxQwr3jzAqq', 1, '2024-04-11 11:47:12', '2024-05-04 20:13:04'),
(55, 'Hexaphor', 'info.hexaphor@gmail.com', '8260123233', '2', 'Hexaphor Technologies Pvt Ltd', 'https://hexaphortechnologies.co.in/', 'Rasulgarh', 'Bhubaneswar', 'Odisha', '751010', 'business_documents/kyZudoa6icaznkmPACar7LoRhX1o2H4OHDrJE9tW.png', 'personal_documents/0KQ2YuqHSpBSb0jajA2hCSJUFoObU9ju6LoXcNVC.jpg', '$2y$12$gv4VoqpDGLBMrm0CL.hhS.NllmJ8DqAK3efhed/S/2VIczIMStC1.', 1, '2024-05-17 16:50:36', '2024-05-17 16:55:37'),
(56, 'Unitary Corporate', 'unitarycorporategroup@gmail.com', '9861229017', '2', 'UNITARY CORPORATE GROUPS', 'https://unitarycorporategroup.com/', 'Bhadrak', 'Bhadrak', 'Odisha', '756111', 'business_documents/PR3P0Av7REpQHPtTLr8GaMPbPPScil4ElVUwuvOz.png', 'personal_documents/gCj9RkIvUUgr8wCrNuY3JNLpzfn1dUqNWl7dZ9eX.jpg', '$2y$12$BNol6YkrKhAPQZvMmrgjE.AJXU2DeBzhhvjADTLzV0DzVAJSCIQj2', 1, '2024-05-17 17:04:10', '2024-05-17 17:06:09'),
(57, 'sdfrefvg', 'rferger@gmail.com', '21312424324', '2', 'fvfgv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$/4R9mjUNk2.1aQ9JROtx3.8s5uNgL3wwDsTCzR.OFHEN4yXafDaLG', 0, '2024-05-21 17:08:24', '2024-05-21 17:08:24'),
(58, 'Hexaphor Technologies Pvt Ltd', 'test1@gmail.com', '9439374007', '2', 'HEXAPHOR TECHNOLOGIES PVT LTD', 'https://apsdp.in/public/', 'palasuni', 'Bhubaneswar', 'Orissa', '751010', 'business_documents/vZYrhuru0Fj21PNW7b3FoxS6Yt3HcqDY8kjBrItl.png', 'personal_documents/VcVHbCipqvHJwDT8duJJSKSt0h2UYU7MupIbPd0R.png,personal_documents/QXHGvUkviTgL01YNPVKMQr3kLemZFNBX89VMD8An.jpg', '$2y$12$q.ZOww9LBopRJ/JQrqoxtO0A3reaM9akrSFV1qJs96Fvlvecuki3W', 1, '2024-06-05 14:43:42', '2024-06-05 14:52:32'),
(59, 'Ravikant Kumar', 'test1@gmail.com', '9439374007', '2', 'HEXAPHOR TECHNOLOGIES PVT LTD', 'https://apsdp.in/public/', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$sakGRYz4tlIjF7d7mt7rHuf7XvbI617SxZdRUKtnQ6AFVDWE5lPS2', 0, '2024-06-05 14:45:39', '2024-06-05 14:45:39'),
(60, 'Ravikant Kumar', 'test1@gmail.com', '9439374007', '2', 'HEXAPHOR TECHNOLOGIES PVT LTD', 'https://apsdp.in/public/', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$Q7CaMt/AA5AHWXGbJtdTPebIx3y5UrmPji6muyQtvo4NZ8hzp17f6', 0, '2024-06-05 14:46:13', '2024-06-05 14:46:13'),
(61, 'kaevovo', 'goshenvokid@gmail.com', '+959764512488', '2', 'GAW DIN BAR', 'https://www.facebook.com/doekhitrestaurant?mibextid=ZbWKwL', 'North Dagon', 'Yangon', 'Myanmar', '11421', 'business_documents/wT9MgkKto94Vha7lWETs0l4idVQ8YtW8BG9Ug55b.jpg', 'personal_documents/COgJZTtatJBTK9I5HUkr0kok7fvzCBhuRXJg2kBe.jpg', '$2y$12$DVtC8vCHRiFHlyZd54HYyeJr1PA.D2/pXdsEs.lC.kLNSCfS0Pjjq', 0, '2024-06-18 16:18:14', '2024-06-18 18:40:01'),
(62, 'kaevovo', 'goshenvokid@gmail.com', '+959764512488', '2', 'GAW DIN BAR', 'https://www.facebook.com/doekhitrestaurant?mibextid=ZbWKwL', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$yltozOaUCKOrNR6SLIG5Z.RUZc9uDLg4kyFqc/ZAMa9.OalBVMTYu', 0, '2024-06-18 16:23:31', '2024-06-18 16:23:31'),
(63, 'kaevovo', 'goshenvokid@gmail.com', '+959764512488', '2', 'GAW DIN BAR', 'https://www.facebook.com/doekhitrestaurant?mibextid=ZbWKwL', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$EUr8sS7W0mwbqTuRkyr2NecC6xSkCXNf0MW/TbSaZgem4UBaaIV8e', 0, '2024-06-18 18:39:27', '2024-06-18 18:39:27'),
(64, 'Hexaphor Technologies Pvt Ltd', 'admin@gmail.com', '9439374007', '3', 'HEXAPHOR TECHNOLOGIES PVT LTD', 'https://apsdp.in/public/', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$RFG0jYKguGbJzN4xcd5Aiehr.b.VNsn7j6fF2w5cx5h1UMrQYaTX.', 0, '2024-07-18 15:41:18', '2024-07-18 15:41:18'),
(65, 'gBZyBYhBxRZ', 'gregoryah_gregory26@outlook.com', '6969045226', '2', 'ByCGSkcNbbDYY', 'hrTKkDpHCyqG', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$YrNMB0aOpI6LNV4d1neHk.MEupdLpbrBJTbnnQVUJuBdXFdxzan.2', 0, '2024-09-21 02:18:43', '2024-09-21 02:18:43'),
(66, 'gBZyBYhBxRZ', 'gregoryah_gregory26@outlook.com', '6969045226', '2', 'ByCGSkcNbbDYY', 'hrTKkDpHCyqG', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$5fPXkyuay8ZI4cF7dTAUuO9y/qHESvBFdA/.9py.YvtLFVASWeiQG', 0, '2024-09-21 02:18:43', '2024-09-21 02:18:43'),
(67, 'WXpcdqGc', 'james2j_strunkfg@outlook.com', '8051163975', '2', 'OwAFuyaNCMiC', 'tMraLkasj', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$wYSh71VA07XquNooSmX0IeLNx4YGnIwHho3obAfMH2q6dj3VcF862', 0, '2024-09-24 05:29:18', '2024-09-24 05:29:18'),
(68, 'WXpcdqGc', 'james2j_strunkfg@outlook.com', '8051163975', '2', 'OwAFuyaNCMiC', 'tMraLkasj', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$lN.V3Ta9vZDSXbyc9cvfBeAVvAjUuCl10wSSmluc2vvs6RnKNhYxW', 0, '2024-09-24 05:29:19', '2024-09-24 05:29:19'),
(69, 'GtCKOOWCQNV', 'hendersonkatie289887@yahoo.com', '9477697118', '2', 'ntfWTnKC', 'iywRgKnv', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$4juUoB0JC49jsRuWyj7miuS1dSyt3BLQuj5sdcQUm.9A9yMsiWGkS', 0, '2024-09-27 15:09:26', '2024-09-27 15:09:26'),
(70, 'GtCKOOWCQNV', 'hendersonkatie289887@yahoo.com', '9477697118', '2', 'ntfWTnKC', 'iywRgKnv', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$8BmumHoCudnLVf4vUry8r.VhTorDtvoyDHI29BszwHqRk8yio4oYS', 0, '2024-09-27 15:09:28', '2024-09-27 15:09:28'),
(71, 'ezOuofoYpnJBmm', 'changeddi4372@gmail.com', '4175196362', '2', 'BfthOswuSUMz', 'wOsyMyPRYcxicZc', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$.dzJWHbjQEFKSQe7ud6Oh.f36wEU3L4Btp.hcrJAovJZYQB6ovhq.', 0, '2024-10-03 01:37:43', '2024-10-03 01:37:43'),
(72, 'ezOuofoYpnJBmm', 'changeddi4372@gmail.com', '4175196362', '2', 'BfthOswuSUMz', 'wOsyMyPRYcxicZc', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$HBfwA84QtTq0x2HoJVFDdOrOuuOd1b6aGK1qYM/VHR0KQFKb0Bqya', 0, '2024-10-03 01:37:45', '2024-10-03 01:37:45'),
(73, 'cyeanplAbDcp', 'merriweather.stephen4823@yahoo.com', '3886357027', '2', 'MLRLbiulU', 'fBpIUlDx', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$srg83k0XYF8adSstoUZiCudnv8rKT2bYlUznwm780cWtVpt/4eA2S', 0, '2024-10-05 18:17:19', '2024-10-05 18:17:19'),
(74, 'cyeanplAbDcp', 'merriweather.stephen4823@yahoo.com', '3886357027', '2', 'MLRLbiulU', 'fBpIUlDx', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$m12G5uusolB8k9nsWrVEUe6GI7EmUsCdzvPrh3L4cOD7dYbt21bZK', 0, '2024-10-05 18:17:20', '2024-10-05 18:17:20'),
(75, 'kfMGhKAkwoYd', 'melissa_lee2000@yahoo.com', '9278719325', '2', 'uvBAfsutZZlyQ', 'RjVANxhrjpsjF', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$vz0PJW8Yhez0t5cmIHNCC.ukkU9kzz4cauKIwkF2VrLEXpXnZ5fWO', 0, '2024-10-11 07:18:27', '2024-10-11 07:18:27'),
(76, 'kfMGhKAkwoYd', 'melissa_lee2000@yahoo.com', '9278719325', '2', 'uvBAfsutZZlyQ', 'RjVANxhrjpsjF', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$a77HH7V0lyy5lGDc6XSq8uU4cp2S8shl3mUw6sTj64a6LcLhldpQe', 0, '2024-10-11 07:18:30', '2024-10-11 07:18:30'),
(77, 'gFlPgpDnXp', 'mariroswp124@gmail.com', '6238851544', '2', 'lnLZeJBWdo', 'ZyvAxlclsF', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$ye8N2Ru.PrhAJZ1fbD8sB.eGTYb0ZoQbCr4FyFAaXUW0jbKMzEQ0q', 0, '2024-10-21 04:02:51', '2024-10-21 04:02:51'),
(78, 'gFlPgpDnXp', 'mariroswp124@gmail.com', '6238851544', '2', 'lnLZeJBWdo', 'ZyvAxlclsF', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$czm8dRyt6EZxzk3tFprLtOZinv6qwZO/sRcj5VdqAnfooa6boqc5y', 0, '2024-10-21 04:02:53', '2024-10-21 04:02:53'),
(79, 'mqQvTlsewnd', 'bentongovard2000@gmail.com', '9216933874', '2', 'xLZWYMwaXzdG', 'EoxstPhwZWwuRJ', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$z6B613ZnrhbHTMlYEsPOoOH3OiNNAxiIcA2CotCbqvEyedxeUk8u.', 0, '2024-10-25 12:55:34', '2024-10-25 12:55:34'),
(80, 'mqQvTlsewnd', 'bentongovard2000@gmail.com', '9216933874', '2', 'xLZWYMwaXzdG', 'EoxstPhwZWwuRJ', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$QurqZZXb2ruTwWWbyXNaF.4QNxUCH88RTrc9/JwWOVo/gbA0f6yme', 0, '2024-10-25 12:55:36', '2024-10-25 12:55:36'),
(81, 'wxLHpTqzA', 'st.fiofab@yahoo.com', '6099574628', '2', 'ICDAXsaCQdJz', 'jrgMGcpWwWab', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$fuHTaDTZoSvWKR7dRO89ke4o8vmq2oQ74hGC6EteyH/9lusjJzoX2', 0, '2024-10-28 20:01:21', '2024-10-28 20:01:21'),
(82, 'wxLHpTqzA', 'st.fiofab@yahoo.com', '6099574628', '2', 'ICDAXsaCQdJz', 'jrgMGcpWwWab', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$BiYvmonP7PAgigE.xtcdFeFJmL7ejbCVk4z6jYZrPyJvfpaKvBmmK', 0, '2024-10-28 20:01:22', '2024-10-28 20:01:22'),
(83, 'WYnBxGLyXODy', 'michael80doneys4e@outlook.com', '9490064916', '2', 'DrhrEThcJatPD', 'VYbMlHxouTs', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$sCaU/UN8zkyJdeWwvfWC2ujfA8EcyYF7SaJuUg4JiLphILpL6GYDK', 0, '2024-11-04 00:35:19', '2024-11-04 00:35:19'),
(84, 'WYnBxGLyXODy', 'michael80doneys4e@outlook.com', '9490064916', '2', 'DrhrEThcJatPD', 'VYbMlHxouTs', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$/3k7Wi2facayu.m/tedzHeDVE/rAgyU3H.Sxn9aHYKD4rlCxxLpiS', 0, '2024-11-04 00:35:21', '2024-11-04 00:35:21'),
(85, 'dmdFRLIp', 'idetanormanjl8313@gmail.com', '9320291272', '2', 'iKwoHUoUdoP', 'eohvfwOCUGwMm', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$7VYJvIiIrYB7gmbEOB5dveDvmxLU8RblT2NXTghudnNouq4vBbbX2', 0, '2024-11-05 17:29:33', '2024-11-05 17:29:33'),
(86, 'dmdFRLIp', 'idetanormanjl8313@gmail.com', '9320291272', '2', 'iKwoHUoUdoP', 'eohvfwOCUGwMm', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$PC3AV7rbhENa8AI0EkgE8.y/LSMWq3kowo/eOZNPaPRvVUdadxtIi', 0, '2024-11-05 17:29:33', '2024-11-05 17:29:33'),
(87, 'GGvKSTjquFGo', 'stuartpirs296@gmail.com', '8016466346', '2', 'ugiXSplHq', 'wmIPZnjUcNmhv', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$AnRtZ41MxXnZtoZ.yyxG9egB.Kvk8N/BrdnaBd1PUW4KjNjgZiFYS', 0, '2024-11-08 03:02:41', '2024-11-08 03:02:41'),
(88, 'GGvKSTjquFGo', 'stuartpirs296@gmail.com', '8016466346', '2', 'ugiXSplHq', 'wmIPZnjUcNmhv', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$d6SIF7Krx5QXdRHZbnuBme37K2KJ5Wj2DV6hKNY8wQarGHPTrGM42', 0, '2024-11-08 03:02:43', '2024-11-08 03:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `bankcodes`
--

CREATE TABLE `bankcodes` (
  `id` bigint UNSIGNED NOT NULL,
  `bankName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bankCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bankcodes`
--

INSERT INTO `bankcodes` (`id`, `bankName`, `bankCode`, `created_at`, `updated_at`) VALUES
(1, 'State Bank of India', '1229', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(2, 'Punjab National Bank', '1212', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(3, 'Bank of India', '1135', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(4, 'Bank of Baroda', '1134', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(5, 'Union Bank Of India', '1269', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(6, 'Allahabad Bank', '1125', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(7, 'Central Bank of India', '1147', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(8, 'UCO Bank', '1268', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(9, 'ICICI Bank', '1165', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(10, 'Janaseva Sahakari Bank(Borivali) Ltd.', '1595', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(11, 'The Kodungallur Town Co-operative Bank Ltd', '1596', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(12, 'Ellaquai Dehati Bank', '1597', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(13, 'ANGUL CENTRAL CO-OP BANK LTD', '1598', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(14, 'ASKA CENTRAL CO-OP BANK LTD', '1599', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(15, 'BALASORE BHADRAK CENTRAL CO-OP BANK', '1600', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(16, 'BANKI CENTRAL CO-OP BANK LTD', '1601', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(17, 'BERHAMPORE CENTRAL CO-OP BANK LTD', '1602', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(18, 'BHAWANIPATNA CENTRAL CO-OP BANK LTD', '1603', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(19, 'BOLANGIR CENTRAL CO-OP BANK LTD', '1604', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(20, 'BOUDH CENTRAL CO-OP BANK LTD', '1605', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(21, 'CUTTACK CENTRAL CO-OP BANK LTD', '1606', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(22, 'KEONJHAR CENTRAL CO-OP BANK LTD', '1607', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(23, 'KHURDA CENTRAL CO-OP BANK LTD', '1608', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(24, 'KORAPUT CENTRAL CO-OP BANK LTD', '1609', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(25, 'MAYURBHANJ CENTRAL CO-OP BANK LTD', '1610', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(26, 'NAYAGARH CENTRAL CO-OP BANK LTD', '1611', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(27, 'SAMBALPUR CENTRAL CO-OP BANK LTD', '1612', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(28, 'SAMRUDDHI SAHKARI BANK(SPO-TJSB)', '1613', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(29, 'SUNDARGARH CENTRAL CO-OP BANK LTD', '1614', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(30, 'BHAVNAGAR DISTRICT CENTRAL COOPERATIVE BANK LIMITE', '1615', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(31, 'THE SABARKNTHA DCCB LTD(SPO-GSC)', '1616', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(32, 'UNITED PURI NIMAPARA CENTRAL CO-OP', '1617', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(33, 'Bihar State Co-operative Bank Ltd', '1618', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(34, 'RAJARAMBAPU SAHAKARI BANK LTD', '1619', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(35, 'District Co Operative Bank Ltd., Dehradun', '1620', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(36, 'Godavari Urban Co-Op. Bank Ltd,Vazirabad', '1621', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(37, 'Junagadh Commercial Cooperative Bank LTD', '1622', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(38, 'Almora Zila Sahakari Bank Ltd.', '1623', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(39, 'Bhagini Nivedita Sahakari Bank Ltd., Pune', '1624', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(40, 'Unjha Nagarik Sahakari Bank Ltd., Unjha', '1625', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(41, 'Chaitanya Godavari Grameena Bank', '1626', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(42, 'C.G. RAJYA SAHAKARI BANK MYDT. RAIPUR', '1627', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(43, 'Samata sahakari Bank Ltd', '1628', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(44, 'Shrimant Malojiraje sahakari Bank Ltd., Phaltan', '1629', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(45, 'Pune merchants co-operative bank Ltd.', '1630', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(46, 'Rajkot District Central Cooperative Bank', '1631', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(47, 'Sundarlal Sawaji URBAN Cooperative Bank Ltd', '1632', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(48, 'The Bhavana Rishi Co Op Urban Bank Ltd', '1633', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(49, 'Sampada Sahakari Bank Ltd', '1634', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(50, 'THE KARNAVATI CO-OPERATIVE BANK LTD.', '1635', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(51, 'Madhya Pradesh Rajya Sahakari Bank Maryadit', '1636', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(52, 'The Yavatmal Urban Co-Op. Bank Ltd.', '1637', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(53, 'The Udupi town cooperative Bank ltd', '1638', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(54, 'Vallabh Vidyanagar Commercial Co-operative Bank Lt', '1639', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(55, 'Valmiki Urban Cooperative Bank, Pathri', '1640', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(56, 'Vasavamba Urban Cooperative Bank Ltd', '1641', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(57, 'Veraval Mercantile Co Operative Bank', '1642', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(58, 'United Bank Of India', '1270', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(59, 'United Bank Of India', '1132', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(60, 'Nagaland Rural Bank', '1646', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(61, 'Balotra Urban Co-operative Bank Ltd', '1647', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(62, 'Baroda Central Cooperative Bank', '1648', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(63, 'Abhinandan Urban Co.Op. Bank Ltd', '1649', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(64, 'Latur Urban Coop Bank', '1650', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(65, 'Bhadradri Cooperative Urban Bank Ltd', '1651', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(66, 'Bhatpara Naihati Co-operative Bank Ltd.', '1652', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(67, 'Belagavi Shree Basveshwar Co-op Bank Ltd', '1653', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(68, 'Bhilwara Urban Co-operative Bank Ltd', '1654', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(69, 'Sumerpur Merchantile Urban Co-op. Bank Ltd.', '1655', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(70, 'The Eenadu Coop Urban Bank Ltd.', '1656', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(71, 'Central Co-Operative Bank Ltd,Ara', '1657', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(72, 'Darussalam Co-Operative Urban Bank Ltd.', '1658', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(73, 'FINGROWTH CO-OPERATIVE BANK LTD.', '1659', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(74, 'Gadchirolli District Central Cooperative Bank', '1660', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(75, 'IDUKKI DISTRICT CO OPERATIVE BANK LTD', '1661', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(76, 'Fincare Small Finance Bank Limited', '1662', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(77, 'Kakatiya Urban Cooperative Bank Ltd', '1663', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(78, 'SHREE WARANA SAHAKARI BANK LTD, WARANANAGAR', '1664', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(79, 'Khagaria District Central Co-Operative Bank Ltd', '1665', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(80, 'Kozhikode District Cooperative Bank', '1666', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(81, 'Kranthi Urban Cooperative Bank Ltd', '1667', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(82, 'LAKHIMPUR URBAN CO-OPERATIVE BANK LTD., LAKHIMPUR-', '1668', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(83, 'The Panchsheel Merc. CO. Op. Bank Ltd', '1669', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(84, 'Adarniya PD Patil Bank', '1670', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(85, 'M S Co-Operative Bank Limited', '1671', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(86, 'Maharashtra State Cooperative Bank', '1672', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(87, 'Mahaveer Cooperative Urban BANK ltd', '1673', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(88, 'Manjeri Co-operative Urban Bank Ltd.', '1674', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(89, 'NAINITAL DISTRICT CO OPERATIVE BANK LTD', '1675', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(90, 'Pali Urban Cooperative Bank Ltd', '1676', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(91, 'Deendayal Nagari Sahakari Bank Ltd', '1677', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(92, 'Peoples Urban Co-operative Bank Ltd', '1678', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(93, 'Prime Co-operative Bank Ltd.', '1679', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(94, 'Shri Adinath Cooperative bank Ltd', '1680', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(95, 'Sterling Urban Co-Operative Bank Ltd.', '1681', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(96, 'Textile Traders Co Operative Bank Ltd.', '1682', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(97, 'Manorma Co-Op. Bank Ltd.,Solapur', '1683', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(98, 'The aurangabad district central co-operative bank ', '1684', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(99, 'Coastal Local Area Bank', '1685', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(100, 'The Banaskantha District Central Co-operative Bank', '1686', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(101, 'The Surat Mercantile Co Op Bank Ltd.', '1687', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(102, 'Chittorgarh Urban Co-Op Bank Ltd', '1688', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(103, 'The Bhagyalaksmi Mahila Sahakari Bank Ltd  Nanded', '1689', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(104, 'The Bhandara District Central Cooperative Bank Ltd', '1690', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(105, 'The Bharat Co-Operative Bank Ltd', '1691', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(106, 'The Bharuch District Central Cooperative Bank Ltd.', '1692', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(107, 'The Business Co-operative Bank', '1693', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(108, 'Sarvodaya Sahakari Bank Ltd', '1694', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(109, 'Ambajogai Peoples Co-Op. Bank Ltd', '1695', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(110, 'The Chandigarh State Cooperative Bank Ltd', '1696', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(111, 'Mansing Co –op. Bank Ltd, Dudhondi', '1697', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(112, 'The Gandevi People’s Co-Operative Bank Limited', '1698', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(113, 'The Baroda City Co Op Bank Ltd', '1699', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(114, 'Shri Janata Sahakari Bank Ltd.,Halol', '1700', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(115, 'The Jalgaon District Central Co-operative bank ltd', '1701', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(116, 'Adarsh Mahila Nagari Sahakari Bank Ltd.,Aurangabad', '1702', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(117, 'The Kanakamahalakshmi Co-Operative Bank Ltd', '1703', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(118, 'Aman Sahakari Bank Ltd., Ichalkaranji', '1704', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(119, 'Associate Co. Op. Bank Ltd', '1705', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(120, 'The Kanara District Central Cooperative Bank Ltd.,', '1706', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(121, 'The kangra District central cooperative Bank Ltd', '1707', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(122, 'The Kolhapur Urban Cooperative Bank Ltd., Kolhapur', '1708', '2024-04-27 04:38:36', '2024-04-27 04:38:36'),
(123, 'Emirates NBD Bank (P J S C)', '1709', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(124, 'The Madanapalle Cooperative Town bank Ltd', '1710', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(125, 'The Mangalore Catholic Co-Operative Bank Ltd', '1711', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(126, 'Uttarkashi Zila Sahakari Bank Ltd., Uttarkashi', '1712', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(127, 'Shri  Anand Nagari Sahakari Bank Limited', '1713', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(128, 'The Mannmandir Co-Operative Bank Ltd., Vita', '1714', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(129, 'The Meghalaya Cooperative Apex Bank Ltd.', '1715', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(130, 'The Mehsana District Central Co-operative Bank Ltd', '1716', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(131, 'The Deola Merchant Coop Bank Ltd', '1717', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(132, 'The Muslim Cooperative Bank ltd', '1718', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(133, 'The Nasik Merchants Co Operative Bank Ltd.,Nashik', '1719', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(134, 'The Navnirman Co-Operative Bank Ltd', '1720', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(135, 'The Nawada Central Co-operative Bank Ltd', '1721', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(136, 'The Nawanagar Cooperative Bank', '1722', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(137, 'The Ottapalam Co-operative Urban Bank Ltd', '1723', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(138, 'The Rohika Central Cooperative Bank Ltd, Madhubani', '1724', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(139, 'The Sangamner Merchants Co Operative Bank Ltd', '1725', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(140, 'Khattri Co-op urban bank Ltd', '1726', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(141, 'Patan Nagarik Sahakari Bank Ltd', '1727', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(142, 'The Nagar sahakari bank ltd. Gorakhpur', '1728', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(143, 'SARASPUR NAGRIK SAHAAKRI BANK', '1729', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(144, 'Nilambur Urban Co-op Bank Ltd', '1730', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(145, 'The SSK Co Operative Bank Ltd', '1731', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(146, 'MALVIYA URBAN COOP BANK LTD', '1732', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(147, 'Shree Panchganga  Nagari Sahakari Bank', '1733', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(148, 'THE FINANCIAL COOP BANK LTD', '1734', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(149, 'THE MANIPUR STATE COOP BANK', '1735', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(150, 'KHEDA PEOPLES CO-OP BANK LTD', '1736', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(151, 'MANVI PATTANA SOUHARDA SAHKARI BANK', '1737', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(152, 'The Urban Cooperative Bank Ltd.,Dharangaon', '1738', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(153, 'The Washim Urban Co-Operative Bank Ltd ; Washim', '1739', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(154, 'Uttrakhand Co-operative Bank Ltd.', '1740', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(155, 'Jana Small Finance Bank Ltd', '1741', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(156, 'Nirmal urban Co-op Bank, Nagpur', '1742', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(157, 'SANDUR PATTANA SOUHARDA SAHAKARI BANK LTD', '1743', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(158, 'The Ranuj Nagrik Sahakari Bank Ltd', '1744', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(159, 'The Uttarsanda People’s Co-Op. Bank Ltd', '1745', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(160, 'Dr.Appashab urf Sa.Re.Patil Jasingpur Udgaon Sahak', '1746', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(161, 'Janata Sahakari Bank Ltd., Ajara', '1747', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(162, 'Kurla Nagrik Sahakari Bank Ltd', '1748', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(163, 'Vikas  Souharda co-operative bank Ltd.', '1749', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(164, 'Wai Urban Cooperative Bank Ltd', '1750', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(165, 'JALGAON JANATA SAHAKARI BANK LTD, JALGAON', '1751', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(166, 'Janakalyan Sahakari Bank Ltd.', '1752', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(167, 'Canara Bank', '1145', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(168, 'HDFC Bank', '1161', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(169, 'AXIS BANK', '1280', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(170, 'Bank of Maharashtra', '1136', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(171, 'Indian Bank', '1168', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(172, 'Indian Overseas Bank', '1169', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(173, 'Indusind Bank', '1170', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(174, 'Integral Urban Coop Bank Ltd', '1171', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(175, 'Irinjalakuda Town Co-operative Bank Ltd', '1172', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(176, 'J&K Grameen Bank', '1173', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(177, 'Jalna Merchant Cooperative Bank Ltd, Jalna', '1174', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(178, 'Jalore Nagrik Sahakari Bank Ltd', '1175', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(179, 'Jammu And Kashmir Bank', '1176', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(180, 'Janata Co-operative Bank Ltd, Malegaon', '1177', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(181, 'Janata Sahakari Bank Ltd', '1178', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(182, 'Kallappanna Awade Ichalkaranji Janata Sahkari Bank', '1179', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(183, 'Karnatak vikas Gramin Bank', '1180', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(184, 'Karnataka Bank', '1181', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(185, 'Karur Vysya Bank', '1182', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(186, 'Kaveri Grameena Bank', '1183', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(187, 'Kerala Gramin Bank', '1184', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(188, 'Kotak Mahindra Bank', '1185', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(189, 'KOTTAYAM CO OPERATIVE URBAN BANK LTD', '1186', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(190, 'Lakshmi Vilas Bank', '1187', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(191, 'Langpi Dehangi Rural Bank', '1188', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(192, 'Lokmangal Co-op Bank Ltd', '1189', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(193, 'Madhyanchal Gramin Bank', '1190', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(194, 'Mahanagar Co-operative Bank', '1191', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(195, 'Maharashtra Grameen Bank', '1192', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(196, 'Maratha Co-operative Bank Ltd', '1193', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(197, 'Meghalaya Rural Bank', '1194', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(198, 'Mehsana Urban Co-Operative Bank', '1195', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(199, 'Mizoram Rural Bank', '1196', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(200, 'NKGSB Co-operative Bank', '1197', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(201, 'Nutan Nagarik Sahakari Bank Ltd', '1198', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(202, 'Odisha Gramya Bank', '1199', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(203, 'Oriental Bank Of Commerce', '1200', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(204, 'Pandharpur Merchant Co-operative Bank', '1201', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(205, 'Parshwanath Co-operative Bank Ltd', '1202', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(206, 'Pavana Sahakari Bank Ltd-Pune', '1203', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(207, 'Poornawadi Nagarik Sahakari Bank Maryadit', '1204', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(208, 'PRAGATHI KRISHNA GRAMIN BANK', '1205', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(209, 'Pragathi Krishna Gramin Bank', '1206', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(210, 'Prathama Bank', '1207', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(211, 'Pune Cantonment Sahakari Bank Ltd', '1208', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(212, 'Pune Peoples Co-operative Bank Ltd', '1209', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(213, 'Punjab and Sind Bank', '1211', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(214, 'Barclays Bank', '1137', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(215, 'Baroda Gujarat Gramin Bank', '1138', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(216, 'Baroda Rajasthan Kshetriya Gramin Bank', '1139', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(217, 'Baroda Uttar Pradesh Gramin Bank', '1140', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(218, 'Bassein Catholic Co-operative Bank Ltd', '1141', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(219, 'Bharatiya Mahila Bank', '1142', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(220, 'BNP Paribas', '1143', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(221, 'Catholic Syrian Bank', '1146', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(222, 'Bandhan Bank limited', '1133', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(223, 'AMBARNATH JAI HIND COOP BANK LTD', '1126', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(224, 'Andhra Bank', '1127', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(225, 'Andhra Pradesh Grameena Vikas Bank', '1128', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(226, 'Andhra Pragathi Grameena Bank', '1129', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(227, 'Apna Sahakari Bank Ltd', '1130', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(228, 'Arunachal Pradesh Rural Bank', '1131', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(229, 'Aryavat Gramin Bank', '1102', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(230, 'Baitarani Gramya Bank', '1103', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(231, 'BANGIYA GRAMIN VIKASH BANK', '1104', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(232, 'Bihar kshetriya Gramin Bank', '1105', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(233, 'Development Bank of Singapore', '1106', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(234, 'Development Bank of Singapore', '1107', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(235, 'Ing Vysya Bank', '1108', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(236, 'Janaseva Sahakari Bank Ltd', '1109', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(237, 'Janaseva Sahakari Bank Ltd', '1110', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(238, 'Kalinga Gramya Bank', '1111', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(239, 'Kalyan Janata Sahakari Bank', '1112', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(240, 'Madhya Bihar Gramin Bank', '1113', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(241, 'PASCHIM BANGA GRAMIN BANK', '1114', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(242, 'Samastipur kshetriya Gramin Bank', '1115', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(243, 'SHIVALIK MERCANTILE CO OPERATIVE BANK LTD', '1116', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(244, 'THE AKOLA DISTRICT CENTRAL COOPERATIVE BANK', '1117', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(245, 'THE SINDHUDURG DISTRICT CENTRAL COOP BANK', '1118', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(246, 'THE WEST BENGAL STATE COOPERATIVE BANK', '1119', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(247, 'Uttar Bihar Gramin Bank', '1120', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(248, 'Abhyudaya Co-operative Bank', '1122', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(249, 'Ahmedabad District Cooperative Bank', '1123', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(250, 'Ahmednagar Merchant Co-op Bank Ltd', '1124', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(251, 'Utkal Grameen Bank', '1271', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(252, 'UTTARAKHAND GRAMIN BANK', '1272', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(253, 'Vananchal Gramin Bank', '1273', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(254, 'Vijaya Bank', '1274', '2024-04-27 04:38:37', '2024-04-27 04:38:37'),
(255, 'Yes Bank', '1275', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(256, 'Kashi Gomti Samyut Grameen Bank', '1276', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(257, 'Purvanchal Bank', '1277', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(258, 'PRIMECOOPERATIVEBANKLTD', '1278', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(259, 'JHARKHAND GRAMIN BANK', '1279', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(260, 'Chhattisgarh Rajya Gramin Bank', '1148', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(261, 'Citi Bank', '1149', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(262, 'City Union Bank', '1150', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(263, 'Corporation Bank', '1151', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(264, 'Cosmos Bank', '1152', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(265, 'DBS BANK LTD', '1153', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(266, 'DCB Bank Ltd', '1154', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(267, 'Dena Bank', '1155', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(268, 'Dhanalakshmi Bank', '1156', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(269, 'Dombivli Nagarik Sahakari Bank', '1157', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(270, 'Dr Annasaheb Chougule Urban Co-op Bank Ltd', '1158', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(271, 'Federal Bank', '1159', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(272, 'Gopinath Patil Parsik Janata Sahakari Bank Ltd', '1160', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(273, 'Raipur Urban Merchantile Co-operative Bank Ltd', '1213', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(274, 'Rajapur Urban Co-op Bank Ltd', '1214', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(275, 'Rajgurunagar Sahakari Bank Ltd', '1216', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(276, 'RBL Bank Limited', '1217', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(277, 'Saraswat Co-Operative Bank', '1218', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(278, 'Saurashtra Gramin Bank', '1219', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(279, 'Shivajirao Bhosale Sahakari Bank Ltd', '1220', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(280, 'Shri Arihant Co-operative Bank Ltd', '1221', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(281, 'Shri Basaveshwar Sahakari Bank Niyamit, Bagalkot', '1222', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(282, 'Shri Mahalaxmi Co-operative Bank', '1223', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(283, 'Shri Veershaiv Co-operative Bank Ltd', '1224', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(284, 'South Indian Bank', '1225', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(285, 'Standard Chartered Bank', '1226', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(286, 'State Bank Of Bikaner & Jaipur', '1227', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(287, 'State Bank of Hyderabad', '1228', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(288, 'State Bank of Mysore', '1230', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(289, 'State Bank of Patiala', '1231', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(290, 'State Bank of Travancore', '1232', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(291, 'SUCO Souharda Sahakari Bank', '1233', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(292, 'Sudha Cooperative Urban Bank Ltd', '1234', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(293, 'Sutlej Gramin Bank', '1235', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(294, 'Suvarnayug Sahakari Bank Ltd', '1236', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(295, 'SVC Co-op Bank Limited', '1237', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(296, 'Syndicate Bank', '1238', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(297, 'Tamilnaad Mercantile Bank', '1239', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(298, 'Telangana Grameena bank', '1240', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(299, 'Thane Bharat Sahakari Bank Ltd', '1241', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(300, 'The Adarsh Urban Co-op Bank Ltd, Hyderabad', '1242', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(301, 'The AP Mahesh Co-operative Urban Bank Ltd', '1243', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(302, 'The Bharat Co-operative Bank (Mumbai) Ltd', '1244', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(303, 'The Chikhli Urban Co-op Bank Ltd', '1245', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(304, 'The Gayatri Co-Operative Urban Bank Ltd', '1246', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(305, 'The Gopalganj Central Gramin Bank', '1247', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(306, 'The Greater Bombay Co-operative Bank', '1248', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(307, 'The Gujarat State Co-op Bank Ltd', '1249', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(308, 'The Hasti Co-op Bank Ltd', '1250', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(309, 'The Jalgaon Peoples Co-op Bank Ltd', '1251', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(310, 'The Kalupur Commercial Co-Op Bank Ltd', '1252', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(311, 'The Mayani Urban Co-operative Bank Ltd', '1253', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(312, 'The Municipal Co-operative Bank Ltd', '1254', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(313, 'The Nainital Bank Ltd', '1255', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(314, 'The National Co-Operative Bank Ltd', '1256', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(315, 'The Pandharpur Urban Co-op Bank Ltd', '1257', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(316, 'The Pochampally Co-operative Urban bank Ltd', '1258', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(317, 'The Shirpur Peoples Co-Op Bank Ltd', '1259', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(318, 'The Surat District Co-op Bank Ltd', '1260', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(319, 'The SUTEX Co-operative Bank Ltd', '1261', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(320, 'The Varachha Co-op Bank Ltd', '1262', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(321, 'The Vasai Vikas Co-op Bank Ltd', '1263', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(322, 'The Vishweshwar Sahakari Bank Ltd', '1264', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(323, 'The Yadagiri Lakshmi Narasimha Swamy Co-Op Urban B', '1265', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(324, 'Thrissur District Co-operative Bank', '1266', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(325, 'TJSB Sahakari Bank Ltd', '1267', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(326, 'HSBC Bank', '1163', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(327, 'Hutatma Sahakari Bank Ltd', '1164', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(328, 'IDBI Bank', '1166', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(329, 'IDFC bank', '1167', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(330, 'Utkarsh Small Finance Bank', '1643', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(331, 'AKOLA MERCHANT COOP BANK LTD', '1645', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(332, 'SARVA UP GRAMIN BANK', '1281', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(333, 'SANGLI URBAN CO OPERATIVE BANK LIMITED', '1282', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(334, 'FINO PAYMENTS BANK', '1283', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(335, 'PAYTM PAYMENTS BANK', '1284', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(336, 'AIRTEL PAYMENTS BANK', '1285', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(337, 'ASSAM GRAMIN VIKASH BANK', '1286', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(338, 'THE SATARA DISTRICT CENTRAL CO OPERATIVE BANK LTD', '1287', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(339, 'MUMBAI DISTRICT CENTRAL CO OP BANK LTD', '1288', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(340, 'THE CHEMBUR NAGARIK SAHAKARI BANK', '1289', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(341, 'DEUTSCHE BANK', '1290', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(342, 'SARVA HARYANA GRAMIN BANK', '1291', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(343, 'SHUSHRUTI SOUAHRDA SAHAKRA BANK', '1292', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(344, 'THE SIWAN CNETRAL CO OPERATIVE BANK LTD', '1293', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(345, 'UTTAR BANGA KSHETRIYA GRAMIN BANK', '1294', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(346, 'RAJASTHAN MARUDHARA GRAMIN BANK', '1295', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(347, 'SATPURA NARMADA KSHETRIYA GRAMIN BANK', '1296', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(348, 'DIST COOP BANK LTD LAKHIMPUR KHIRI', '1297', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(349, 'RAE BARELI DISTRICT COOPERATIVE BANK LTD', '1298', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(350, 'VIDHARBHA KONKAN GRAMIN BANK HO NAGPUR', '1299', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(351, 'RAMPUR ZILA SAHAKARI BANK LTD', '1300', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(352, 'SINDHUDURG DIST CENT COOP BANK LTD', '1301', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(353, 'SHAHJAHANPUR DISTRICT CENTRAL CO OPERATIVE BANK LT', '1302', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(354, 'ETAH DISTRICT COOPERATIVE BANK LTD', '1303', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(355, 'ETAWAH DISTRICT CO OPERATIVE BANK LTD', '1304', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(356, 'VASAI JANATA SAHKARI BANK LTD', '1305', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(357, 'THE DISTRICT COOPERATIVE BANK LTD', '1306', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(358, 'THE DISTRICT COOPERATIVE BANK LTD', '1307', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(359, 'DISTRICT CO OPERATIVE BANK', '1308', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(360, 'TEHRI GARHWAL ZILA SAHKARI BANK LIMITED', '1309', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(361, 'THE NEW URBAN CO OP BANK LTD', '1310', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(362, 'THE DISTRICT COOPERATIVE BANK LTD', '1311', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(363, 'RATNAGIRI DISTRICT CENTRAL CO OPERATIVE BANK LTD', '1312', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(364, 'PUNE DISTRICT CENTRAL CO OP BANK', '1313', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(365, 'KRISHNA GRAMEENA BANK', '1314', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(366, 'ZILA SAHKARI BANK LTD', '1315', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(367, 'MALAD SAHKARI BANK LTD', '1316', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(368, 'THE HP STATE CO OP BANK BO TUNDI', '1317', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(369, 'JAMIA COOPERATIVE BANK LIMITED', '1318', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(370, 'PRAGATHI GRAMIN BANK', '1319', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(371, 'THE BICHOLIUM URBAN COOP BANK LTD', '1320', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(372, 'THE BIHAR AWAMI COOP BANK LTD', '1321', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(373, 'UDHAM SINGH NAGAR DISTRICT CO OPERATIVE BANK LTD', '1322', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(374, 'MAHESH SAHAKARI BANK LTD', '1323', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(375, 'JAIPUR THAR GRAMIN BANK', '1324', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(376, 'THE HOSHIARPUR CENTRAL COOPERATIVE BANK LTD', '1325', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(377, 'THE JANATA CO OPERATIVE BANK LTD', '1326', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(378, 'MODEL CO OP BANK LTD', '1327', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(379, 'THE VSV CO OPERATIVE BANK LTD', '1328', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(380, 'BOMBAY MERCANTILE CO OP BANK', '1329', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(381, 'THE PURNIA DISTRICT CENTRAL CO OPERATIVE BANK LTD', '1330', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(382, 'THE BURDWAN CENTRAL COOP BANK LTD', '1331', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(383, 'ADARSH CO OPERATIVE BANK LTD', '1332', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(384, 'THE GAYATRI CO OP URBAN BANK', '1333', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(385, 'CITIZEN CO OPERATIVE BANK LTD', '1334', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(386, 'SHARAD SAHAKARI BANK LTD', '1335', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(387, 'THE JAMSHEDPUR URBAN COOP BANK LTD', '1336', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(388, 'THE FAZILKA CENTRAL COOPERATIVE BANK LTD', '1337', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(389, 'THE ASSAM COOP APEX BANK LTD', '1338', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(390, 'THE SONEPAT CENTRAL COOPERATIVE BANK LTD', '1339', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(391, 'ANDAMAN AND NICOBAR STATE COOP BANK LTD', '1340', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(392, 'AKHAND ANAND CO OP BANK LTD', '1341', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(393, 'KANPUR ZILLA SAHAKARI BANK LTD', '1342', '2024-04-27 04:38:38', '2024-04-27 04:38:38'),
(394, 'MEWAR AANCHALIK GRAMIN BANK', '1343', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(395, 'THE BARAMATI SAHAKARI BANK LTD', '1344', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(396, 'THE MALKAPUR URB COOP BANK LTD', '1345', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(397, 'JILA SAHKARI KENDRIYA BANK', '1346', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(398, 'SHARDA GRAMIN BANK', '1347', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(399, 'NEFT MALWA GRAMIN BANK', '1348', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(400, 'HIMACHAL GRAMIN BANK', '1349', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(401, 'PARSIK JANATA SAHAKARI BANK LTD', '1350', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(402, 'THE SANGLI DISTRICT CENTRAL CO OP BANK LTD', '1351', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(403, 'CMS NATIONAL OPERATING CENTRE MMR', '1352', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(404, 'PILIBHIT DISTRICT CO OPERATIVE BANK LTD', '1353', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(405, 'THE GOA STATE COOP BANK', '1355', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(406, 'THE RAJASTHAN STATE COOPERATIVE BANK LTD', '1356', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(407, 'AU SMALL FINANCE BANK LIMITED', '1357', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(408, 'KHALILABAD NAGAR SAH BANK', '1358', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(409, 'THE VILLUPURAM DISTRICT CENTRAL COOPERATIVE BANK L', '1359', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(410, 'THE AJARA URBAN CO OP BANK LTD', '1360', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(411, 'ABN Amro Bank Credit Card', '1361', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(412, 'Abu Dhabi Commercial Bank ', '1362', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(413, 'Adarsh Mahila Mercantile Co-Op Bank', '1363', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(414, 'Aditya Birla Idea Payments Bank', '1364', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(415, 'Ahmedabad Mercantile Co-Op Bank ', '1365', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(416, 'Aircel Smart Money  ', '1366', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(417, 'Akola District Central Co-Op Bank', '1367', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(418, 'Akola Janata Commercial Co-Op Bank', '1368', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(419, 'Almora Urban Co-Op Bank ', '1369', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(420, 'Ambarnath Jai Hind Co-Op Bank', '1370', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(421, 'American Express Credit Card', '1371', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(422, 'Andhra Bank Credit Card', '1372', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(423, 'Andhra Pradesh State Co-Op Bank', '1373', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(424, 'Annasaheb Savant Co Op Urban Bank  ', '1374', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(425, 'Assam Co-Op Apex Bank ', '1375', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(426, 'Bajaj Finance Bank  ', '1376', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(427, 'Ballia Etawah Gramin Bank ', '1377', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(428, 'Bank of America  ', '1378', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(429, 'Bank of Bahrain and Kuwait', '1379', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(430, 'Bank Of Baroda Credit Card', '1380', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(431, 'Bank of Ceylon  ', '1381', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(432, 'Bank of Nova Scotia ', '1383', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(433, 'Bank of Tokyo-Mitsubishi UFJ ', '1384', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(434, 'Baramati Sahakari Bank  ', '1385', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(435, 'Barclays Credit Card', '1386', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(436, 'Baroda Rajasthan Gramin Bank', '1387', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(437, 'Bhagalpur Central Co-Op Bank ', '1388', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(438, 'Bharat Co-Op Bank, Mumbai ', '1389', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(439, 'BHARUCH DISTRICT CENTRAL CO-OP. BANK LTD  ', '1390', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(440, 'Bijnor Urban Co-Op Bank ', '1391', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(441, 'Canara Bank Credit Card', '1392', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(442, 'Capital Small Finance Bank ', '1393', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(443, 'Central madhya pradesh gramin bank', '1394', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(444, 'Chaitanya Godavari Grameena Bank ', '1395', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(445, 'CHARTERED SAHAKARI BANK NIYAMITHA ', '1396', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(446, 'Chickmangalur Kodagu Gramin Bank ', '1397', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(447, 'Chinatrust Commercial Bank  ', '1398', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(448, 'Citibank Credit Card', '1399', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(449, 'Contai Co Operative Bank Ltd', '1400', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(450, 'Credit Agricole Corp and Investment Bank  ', '1401', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(451, 'Dapoli Urban Co-Op Bank ', '1402', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(452, 'Deccan Merchants Co-Op Bank ', '1403', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(453, 'Delhi State Co-Op Bank ', '1404', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(454, 'Dena Gujarat Gramin Bank ', '1405', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(455, 'Deposit Insurance and Credit Guarantee Corporation', '1406', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(456, 'Deutsche Bank AG  ', '1407', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(457, 'Development Credit Bank  ', '1408', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(458, 'District Co-Op Bank, Agra ', '1409', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(459, 'Dombivli East', '1410', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(460, 'Durg Rajnandgaon Gramin Bank ', '1411', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(461, 'Ellaqui Dehati Bank  ', '1412', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(462, 'Equitas Small Finance Bank ', '1413', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(463, 'ESAF Small Finance Bank ', '1414', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(464, 'Firstrand Bank', '1415', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(465, 'Gayatri Bank', '1416', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(466, 'Greater Bombay Co-Op Bank ', '1417', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(467, 'Gujarat State Co-Op Bank ', '1418', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(468, 'Gurgaon Gramin Bank  ', '1419', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(469, 'Hadoti Kshetriya Gramin Bank ', '1420', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(470, 'Hamirpur District Co-Op Bank, Mahoba', '1421', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(471, 'Hasti Co-Op Bank  ', '1422', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(472, 'Himachal Pradesh State Co-Op Bank', '1423', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(473, 'Hindusthan Co-Op Bank  ', '1424', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(474, 'Home Credit Finance Bank ', '1425', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(475, 'India Post Payments Bank ', '1429', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(476, 'Indrayani Co Op Bank Ltd', '1430', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(477, 'Jalaun District Co-Op Bank ', '1432', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(478, 'Jalgaon Peoples Co-Op Bank ', '1433', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(479, 'Janakalyan Sahakari Bank  ', '1434', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(480, 'Janata Sahakari Bank, Osmanabad ', '1435', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(481, 'Janata Sahakari Bank, Pune ', '1436', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(482, 'Jhabua Dhar Kshetriya Gramin Bank', '1437', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(483, 'Jharkhand State Co-Op Bank ', '1438', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(484, 'Jijamata Mahila Sah Bank Ltd Pune  ', '1439', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(485, 'Jila Sahakari Kendriya Bank Mydt Tikamgarh  ', '1440', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(486, 'Jila Sahkari Kendriya Bank Maryadit', '1441', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(487, 'Jio Payments Bank Limited ', '1442', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(488, 'JP Morgan Chase Bank ', '1443', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(489, 'Kaira District Central Co-Op Bank', '1444', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(490, 'Kalupur Commercial Co-Op Bank ', '1445', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(491, 'Kanaka Mahalakshmi Co-Op Bank ', '1446', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(492, 'Kangra Central Co-Op Bank ', '1447', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(493, 'Kangra Co-Op Bank  ', '1448', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(494, 'Kapole Co-Op Bank  ', '1449', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(495, 'Karad Urban Co-Op Bank ', '1450', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(496, 'Karnala Nagari Sahakari Bank ', '1451', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(497, 'Karnataka State Apex Co-Op ', '1452', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(498, 'Karnataka State Co-Op Apex Bank', '1453', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(499, 'Karnataka Vikas Grameena Bank ', '1454', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(500, 'Khalilabad Nagar Sah Bank,Semariawa     ', '1455', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(501, 'Kokan Mercantile Co Op Bank Ltd  ', '1456', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(502, 'Kolhapur Mahila Sahakari Bank Ltd', '1457', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(503, 'Kurmanchal Nagar Sahkari Bank ', '1459', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(504, 'Madhya Bharat Gramin Bank ', '1460', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(505, 'Madhyanchal Gramin Bank, Sagar ', '1461', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(506, 'Mahakaushal Kshetriya Gramin Bank ', '1462', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(507, 'Maharashtra State Co-Op Bank ', '1463', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(508, 'Malad Sahkari Bank  ', '1464', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(509, 'Malda District Central Co-Op Bank', '1465', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(510, 'Malwa Gramin Bank  ', '1466', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(511, 'Manipur Rural ANK  ', '1467', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(512, 'Manvi Pattana Souharda Sahakari Bank', '1468', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(513, 'Pavana Sahakari Bank  ', '1469', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(514, 'Pithoragarh Jila Sahkari Bank ', '1470', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(515, 'Pochampally Co-Op Urban Bank ', '1471', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(516, 'Prerana Co Operative Bank Ltd', '1472', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(517, 'Prime Co-Op Bank  ', '1473', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(518, 'Priyadarshani Nagari Sahakari Bank', '1474', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(519, 'Puduvai Bharathiar Grama Bank ', '1475', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(520, 'Markandey Nagari Sahakari Bank ', '1476', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(521, 'Mashreq Bank PSC  ', '1477', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(522, 'Mayani Urban Co-Op Bank ', '1478', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(523, 'MEGHALAYA COOP APEX BANK ', '1479', '2024-04-27 04:38:39', '2024-04-27 04:38:39'),
(524, 'MG Baroda Gramin Bank ', '1480', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(525, 'MGCB Main   ', '1481', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(526, 'Mizuho Corporate Bank  ', '1482', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(527, 'Mogaveera Co-Op Bank  ', '1483', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(528, 'Moradabad Zila Sahkari Bank ', '1484', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(529, 'Municipal Co-Op Bank  ', '1485', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(530, 'Murshidabad District Central Co-Op Bank', '1486', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(531, 'Nagar Sahkari Bank  ', '1487', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(532, 'Nainital Almora Kshetriya Gramin Bank', '1488', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(533, 'Nainital Bank   ', '1489', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(534, 'Nanded Disctrict Central Co-Op Bank', '1490', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(535, 'Narmada Jhabua Gramin Bank ', '1491', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(536, 'Narmada Malwa Gramin Bank ', '1492', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(537, 'Nashik Merchants Co-Op Bank ', '1493', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(538, 'National Co-Op Bank  ', '1494', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(539, 'Neelachal Gramya Bank  ', '1495', '2024-04-27 04:38:40', '2024-04-27 04:38:40');
INSERT INTO `bankcodes` (`id`, `bankName`, `bankCode`, `created_at`, `updated_at`) VALUES
(540, 'New India Co-Op Bank ', '1496', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(541, 'Noble Co-Op Bank  ', '1497', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(542, 'North Malabar Gramin Bank ', '1498', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(543, 'Odisha State Co-Op Bank ', '1499', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(544, 'Oman International Bank Saog ', '1500', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(545, 'Pachora Peoples Co-Op Bank ', '1501', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(546, 'Pallavan Grama Bank  ', '1502', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(547, 'Pandharpur Merchant Co-Op Bank ', '1503', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(548, 'Pandharpur Urban Co-Op Bank ', '1504', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(549, 'Pandyan Gramin Bank  ', '1505', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(550, 'Panipat Urban Co-Op Bank ', '1506', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(551, 'Parvatiya Gramin Bank  ', '1507', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(552, 'Shri Chhatrapati Rajarshi Shahu Urban Co-Op Bank ', '1508', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(553, 'Siwan Central Co-Op Bank ', '1509', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(554, 'Societe Generale   ', '1510', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(555, 'Solapur Janata Sahakari Bank ', '1511', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(556, 'South Malabar Gramin Bank ', '1512', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(557, 'State Bank of Mauritius ', '1515', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(558, 'Surat District Co-Op Bank ', '1516', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(559, 'Surat National Co-Op Bank ', '1517', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(560, 'Surguja Kshetriya Gramin Bank ', '1518', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(561, 'Suryoday Small Finance Bank ', '1519', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(562, 'Sutex Co-Op Bank  ', '1520', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(563, 'Telangana State Co-Op Apex Bank', '1521', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(564, 'Thane Bharat Sahakari Bank ', '1522', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(565, 'Thane Janata Sahakari Bank ', '1523', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(566, 'The Bhagyodaya Co Op Bank Ltd  ', '1524', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(567, 'The Gandhinagar Nagrik Cooperative Bank Ltd  ', '1525', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(568, 'THE GANDHINAGAR URBAN CO. BANK LTD  ', '1526', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(569, 'The Khamgaon Urban Co-Operative Bank Ltd  ', '1527', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(570, 'The Muslim Co Operative Bank Ltd  ', '1528', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(571, 'The Punjab State Co Op Bank  ', '1529', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(572, 'The Thane District Central Co-Op Bank  ', '1530', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(573, 'The Udaipur Mahila Samridhi Urban Cooperative Bank', '1531', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(574, 'Titwala    ', '1532', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(575, 'Tripura Gramin Bank  ', '1533', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(576, 'Triveni Kshetriya Gramin Bank ', '1534', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(577, 'UBS AG   ', '1535', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(578, 'Udaipur Urban Co-Op Bank ', '1536', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(579, 'Ujjivan Small Finance Bank ', '1537', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(580, 'Urban Co-Op Bank  ', '1538', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(581, 'Urban Co-Op Bank, Siddharthanagar ', '1539', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(582, 'Varachha Co-Op Bank  ', '1541', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(583, 'Vasai Vikas Co-Op Bank ', '1542', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(584, 'Vidharbha Kshetriya Gramin Bank  ', '1543', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(585, 'Vidisha Bhopal Kshetriya Gramin Bank', '1544', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(586, 'VIJAY COMMERCIAL CO-OPERATIVE BANK ', '1545', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(587, 'Zila Sahakari Bank Haridwar ', '1546', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(588, 'Zila Sahakari Bank Ltd,Moradabad ', '1547', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(589, 'Zila Sahakari Bank Ltd,Rampur ', '1548', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(590, 'Zila Sahkari Bank, Lucknow ', '1549', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(591, 'Zoroastrian Co-Op Bank  ', '1550', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(592, 'Vikas Souharda Co-Op Bank ', '1552', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(593, 'Vishweshwar Sahakari Bank Ltd ', '1553', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(594, 'Visveshwaraya Gramin Bank  ', '1554', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(595, 'Wainganga Krishna Gramin Bank ', '1555', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(596, 'West Bengal State Co-Op Bank', '1556', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(597, 'Yadagiri Lakshmi Narasimha Swamy Co-Op Urban Bank ', '1557', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(598, 'Vaidyanath Urban Co-Op Bank ', '1558', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(599, 'VALSAD DISTRICT CENTRAL CO-OPERATIVE BANK LTD  ', '1559', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(600, 'The Ratnakar Bank Ltd ', '1560', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(601, 'The Co-operative Bank of Rajkot Gandhigram  ', '1561', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(602, 'Swarna Bharat Trust Cyber Grameen', '1562', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(603, 'Tamilnadu State Apex Co-Op Bank', '1563', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(604, 'Rajarshi Shahu Sah Bank, Pune', '1564', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(605, 'Rajasthan Gramin Bank  ', '1565', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(606, 'Rajkot Nagarik Sahakari Bank ', '1567', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(607, 'Reserve Bank of India ', '1568', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(608, 'Rewa-Sidhi Gramin Bank  ', '1569', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(609, 'Royal Bank of Scotland ', '1570', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(610, 'Rushikulya Gramin Bank  ', '1571', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(611, 'Sabarkantha District Central Co-Op Bank', '1572', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(612, 'Sadhana Sahakari Bank  ', '1573', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(613, 'Sahebrao Deshmukh Co-Op Bank ', '1574', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(614, 'Saibaba Nagari Sahakari Bank Ltd', '1575', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(615, 'Samarth Sahakari Bank Ltd ', '1576', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(616, 'Sangamner Merchant Co-Op Bank ', '1577', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(617, 'Sant Sopankaka Sahkari Bank, Saswad', '1578', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(618, 'Sapthagiri Grameena Bank  ', '1579', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(619, 'Sardar Bhiladwala Pardi Peoples Co-Op Bank  ', '1580', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(620, 'Seva Vikas Co-Op Bank ', '1581', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(621, 'Shamrao Vithal Co-Op Bank ', '1582', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(622, 'Shinhan Bank   ', '1583', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(623, 'Shirpur Peoples Co-Op Bank ', '1584', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(624, 'Shree Mahalaxmi Co-Op Bank ', '1585', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(625, 'Shree Sharada Sahakari Bank ', '1586', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(626, 'Shree Veershaiv Co-Op Bank ', '1587', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(627, 'Shreyas Gramin Bank  ', '1588', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(628, 'Saurashtra Co-Op Bank  ', '1589', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(629, 'Punjab Gramin Bank  ', '1590', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(630, 'Purvanchal Gramin Bank  ', '1592', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(631, 'Raigad District Central Co-Op Bank', '1593', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(632, 'NAGAR URBAN CO OPERATIVE BANK', '1594', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(633, 'THE SATARA SAHAKARI BANK', '1753', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(634, 'KOLHAPUR DISTRICT CENTRAL CO OP BANK LTD', '1754', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(635, 'MAHESH URBAN COP BANK LTD', '1755', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(636, 'ANDHRA PRADESH STATE CO-OP BANK', '1756', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(637, 'TELANGANA STATE CO-OP APEX BANK', '1757', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(638, 'Karad Urban Co-Operative Bank Ltd', '1758', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(639, 'Himatnagar Nagrik Sahakari Bank Ltd.,Himatnagar', '1759', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(640, 'The Union Co-Operative Bank Ltd.', '1760', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(641, 'Sardargunj Mercantile Co-operative Bank Limited', '1761', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(642, 'The Ahmednagar District Central Co-op bank ltd.', '1762', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(643, 'Shree Kadi Nagarik Sahakari Bank Ltd.', '1763', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(644, 'Citizens Co-Operative Bank Ltd', '1764', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(645, 'Jawahar Sahakari Bank Limited., Hupari.', '1765', '2024-04-27 04:38:40', '2024-04-27 04:38:40'),
(646, 'URBAN CO-OPERATIVE BANK LTD. BAREILLY', '1766', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(647, 'North East Small Finance Bank Ltd', '1767', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(648, 'Alappuzha District Co-Operative Bank Ltd', '1768', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(649, 'CHAMOLI ZILA SAHKARI BANK LTD.', '1769', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(650, 'NAVSARJAN INDL CO OP BANK LTD', '1770', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(651, 'Kankaria Maninagar Nagrik Sahakari Bank Ltd', '1771', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(652, 'The Sarvodaya Nagrik Sahkari bank Ltd', '1772', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(653, 'BHOPAL COOPERATIVE CENTRAL BANK LIMITED', '1773', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(654, 'Kashmir Mercantile Co-op. Bank LTd., Kashmir', '1774', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(655, 'The Sevalia Urban Coop Bank Ltd', '1775', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(656, 'Bapuji Cooperative Bank Ltd', '1776', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(657, 'The Rajkot Commercial Co op Bank Ltd.', '1777', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(658, 'Uttarakhand State Cooperative Bank Ltd', '1778', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(659, 'THE BARDOLI NAGRIK SAHAKARI BANK', '1779', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(660, 'NATIONAL URBAN COOPERATIVE BANK LIMITED', '1780', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(661, 'THE SITAMARHI CENTRAL CO OPERATIVE BANK', '1781', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(662, 'THE AMBALA CENTRAL COOPERATIVE BANK LTD', '1782', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(663, 'Gujarat Ambuja Co-Op. Bank Ltd', '1783', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(664, 'The Tiruvalla East Co-Operative Bank', '1784', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(665, 'The Gandhi Cooperative Urban Bank Ltd', '1785', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(666, 'The Anand Mercantile Cooperative Bank Limited', '1786', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(667, 'Nagrik Sahakari Bank Maryadhit Vidisha', '1787', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(668, 'BANDA URBAN COOP BANK', '1788', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(669, 'MAHANAGAR CO OP BANK LTD', '1789', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(670, 'THE PALI CENTRAL CO OPERATIVE BANK LTD', '1790', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(671, 'THE BHATKAL URBAN COOPERATIVE BANK LTD', '1791', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(672, 'CENTRAL MADHYA PRADESH GRAMIN BANK', '1792', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(673, 'DMK JAOLI BANK', '1793', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(674, 'THE TEXCO BANK', '1794', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(675, 'THE BEGUSARAI DISTRICT CENTRAL CO OPERATIVE BANK', '1795', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(676, 'SAHKARI BANK LTD', '1796', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(677, 'THE AMRITSAR CENTRAL COOPERATIVE BANK LTD', '1797', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(678, 'THE KANGRA COOPERATIVE BANK LTD', '1798', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(679, 'THE NAVAL DOCKYARD CO OPERATIVE BANK LTD', '1799', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(680, 'CITIZENCREDIT CO OPERATIVE BANK LTD', '1800', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(681, 'THE SOUTH CANARA DISTRICT CENTRAL CO OPERATIVE BAN', '1801', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(682, 'THE SURAT PEOPLES CO OP BANK LTD', '1802', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(683, 'PIMPRI CHINCHWAD SAHAKARI BANK', '1803', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(684, 'THE FATEHABAD CENTRAL COOPERATIVE BANK LTD', '1804', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(685, 'THE MANSA CENTRAL COOPERATIVE BANK LTD', '1805', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(686, 'NSDL PAYMENTS BANK LIMITED', '1806', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(687, 'JOGINDRA CENTRAL COOP BANK', '1807', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(688, 'UJJIVAN SMALL FINANCE BANK LIMITED', '1808', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(689, 'SURAT NATIONAL COOPERATIVE BANK LIMITED', '1809', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(690, 'NARMADA JHABUA GRAMIN BANK', '1810', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(691, 'THE PANCHKULA CENTRAL COOPERATIVE BANK LTD', '1811', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(692, 'THE KRISHNA DISTRICT CO OPERATIVE CENTRAL BANK LTD', '1812', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(693, 'KRISHNA BHIMA SAMRUDDHI BANK', '1813', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(694, 'THE DINDIGUL CENTRAL COOPERATIVE BANK LTD', '1814', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(695, 'THE LAKSHMI VILAS BANK LTD', '1815', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(696, 'THE HISAR CENTRAL COOPERATIVE BANK LTD', '1816', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(697, 'Australia And New Zealand Banking Group Limited', '1817', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(698, 'Bank Internasional Indonesia', '1818', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(699, 'Cauvery Kalpatharu Grameena Bank', '1819', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(700, 'Citizen Co-Op Bank, Noida', '1820', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(701, 'Citizen Credit Co-op Bank Ltd', '1821', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(702, 'Credit Card - HDFC Bank', '1827', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(703, 'Credit Card - HSBC', '1828', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(704, 'Credit Card - ICICI Bank', '1829', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(705, 'Credit Card - IDBI Bank', '1830', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(706, 'Credit Card - Indusind Bank', '1831', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(707, 'Credit Card - Kotak Mahindra Bank', '1832', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(708, 'Credit Card - PNB Bank', '1833', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(709, 'Credit Card - SBI', '1834', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(710, 'Credit Card - Standard Chartered', '1835', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(711, 'Credit Card - UTI/ Axis Bank', '1836', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(712, 'Credit Card - Vijaya Bank', '1837', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(713, 'Credit Suisse Ag', '1838', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(714, 'Deccan Grameena Bank', '1839', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(715, 'Deogiri Nagari Sahakari Bank Ltd', '1840', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(716, 'Dicgc', '1841', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(717, 'Doha Bank', '1842', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(718, 'Durgapur Steel Peoples Cooperative Bank Ltd', '1843', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(719, 'Emirates Nbd India', '1844', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(720, 'Export Import Bank Of India', '1845', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(721, 'Haryana Gramin Bank', '1846', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(722, 'HSBC', '1847', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(723, 'Indusind Bank Limited', '1848', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(724, 'Industrial And Commercial Bank Of China Limited', '1849', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(725, 'Janata Sahakari Bank Ltd (Pune)', '1850', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(726, 'Janata Sahakari Bank Ltd,Ajara', '1851', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(727, 'Jijamata Mahila Sah Bank Ltd Pune', '1852', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(728, 'Kashi Gomati Samyut Gramin Bank', '1853', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(729, 'Krishna Gramin Bank', '1854', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(730, 'Markandey Nagari Sahakari Bank', '1855', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(731, 'Mg Baroda Gramin Bank', '1856', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(732, 'Nashik Merchants Co-Op Bank ', '1857', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(733, 'National Australia Bank Limited', '1858', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(734, 'National Bank For Agriculture And Rural Developmen', '1859', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(735, 'Nkgsb Co-op Bank Ltd', '1860', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(736, 'Purvanchal Gramin Bank', '1861', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(737, 'Qatar Natoinal Bank SAQ', '1862', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(738, 'RBL Bank Credit Card', '1863', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(739, 'Samarth Sahakari Bank Ltd', '1864', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(740, 'Shikshak Sahakari Bank Limited', '1865', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(741, 'Siwan Central Co-Op Bank', '1866', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(742, 'Small Industries Development Bank Of India', '1867', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(743, 'Solapur Janata Sahakari Bank Limited', '1868', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(744, 'Sumerpur Merchantile Urban Co-op. Bank Ltd', '1869', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(745, 'Surat National Co-op Bank', '1870', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(746, 'The Chembur Nagarik Sahakari Bank Ltd', '1871', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(747, 'The Commercial Co-op Bank Limited,Kolhapur', '1872', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(748, 'The Eenadu Co-op Urban Bank Ltd', '1873', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(749, 'The Ernakulam District Co-Operative Bank Ltd', '1874', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(750, 'The Kurla Nagarik Sahakari Bank Ltd', '1875', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(751, 'The Nainital Bank Limited', '1876', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(752, 'The National Co-operative Bank Ltd.', '1877', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(753, 'The Saraswat Co-operative Bank Ltd', '1878', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(754, 'The Shirpur peoples co-op bank ltd', '1879', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(755, 'The United Coop Bank Ltd', '1880', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(756, 'The Uttarsanda Peoples Co Op Bank Ltd', '1881', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(757, 'The Washim Urban Co-Operative Bank Ltd,Washim', '1882', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(758, 'Thrissur District Central Co-op Bank Ltd', '1883', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(759, 'Tripura Gramin Bank', '1884', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(760, 'Triveni Kshetriya Gramin Bank', '1885', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(761, 'Tumkur Grain Merchants Cooperative Bank Ltd', '1886', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(762, 'Unjha Nagarik Sahakari Bank Ltd.', '1887', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(763, 'Urban Co-Op Bank', '1888', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(764, 'UTTAR DAUDPUR SAMABAY KRISHI UNNAYAN SAMITY LTD', '1889', '2024-04-27 04:38:41', '2024-04-27 04:38:41'),
(765, 'Uttaranchal Gramin Bank', '1890', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(766, 'Westpac Banking Corporation', '1891', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(767, 'Zila Sahakari Bank Haridwar', '1892', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(768, 'IDFC FIRST BANK CREDIT CARD', '1893', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(769, 'THE AHMEDABAD MERCANTILE CO OP BANK LTD', '1894', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(770, 'NAGPUR NAGRIK SAHAKARI BANK LTD', '1895', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(771, 'JILA SAHAKARI KENDRIYA BANK', '1896', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(772, 'THE BHIWANI CENTRAL COOPERATIVE BANK LTD', '1897', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(773, 'TIRUPATI URBAN CO OP BANK', '1898', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(774, 'NAVI MUMBAI CO OP BANK LTD', '1899', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(775, 'KANNUR DISTRICT CO OPERATIVE BANK', '1900', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(776, 'SIKKIMSTATE COOPERATIVE BANK LTD', '1901', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(777, 'TAMLUK GHATAL CENTRAL CO OPERATIVE BANK LTD', '1902', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(778, 'DAKSHIN BIHAR GRAMIN BANK', '1903', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(779, 'UTTAR PRADESH COOPERATIVE BANK LTD', '1904', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(780, 'KARNATAKA GRAMIN BANK', '1905', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(781, 'TAMIL NADU GRAMIN BANK', '1906', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(782, 'THE CHENNAI CENTRAL COOPERATIVE BANK LTD', '1907', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(783, 'THE COIMBATORE DISTRICT CENTRAL COOPERATIVE BANK', '1908', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(784, 'THE CUDDALORE DISTRICT CENTRAL COOPERATIVE BANK LT', '1909', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(785, 'THE DHARMAPURI DISTRICT CENTRAL COOPERATIVE BANK L', '1910', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(786, 'THE ERODE DISTRICT CENTRAL COOPERATIVE BANK LTD', '1911', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(787, 'THE KANCHIPURAM CENTRAL COOPERATIVE BANK LTD', '1912', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(788, 'THE KANYAKUMARI DISTRICT CENTRAL COOPERATIVE BANK ', '1913', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(789, 'THE KUMBAKONAM CENTRAL COOPERATIVE BANK LTD', '1914', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(790, 'THE PUDUKKOTTAI DISTRICT CENTRAL COOPERATIVE BANK ', '1915', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(791, 'Credit Card - AU small finance bank', '1916', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(792, 'YES Bank Credit Card', '1917', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(793, 'Union Bank of India Credit Card', '1919', '2024-04-27 04:38:42', '2024-04-27 04:38:42'),
(794, 'FEDERAL BANK - CREDIT CARD', '1920', '2024-04-27 04:38:42', '2024-04-27 04:38:42');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ifsc_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `beneficiaryId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `user_id`, `account_name`, `ifsc_code`, `bank_name`, `account_no`, `bank_status`, `beneficiaryId`, `created_at`, `updated_at`) VALUES
(56, 200, 'Shakeelahamad  .', 'KKBK0000493', 'KOTAK MAHINDRA BANK LIMITED', '4248604181', '1', 'AES_86957729', '2024-09-16 14:53:16', '2024-09-16 14:53:16'),
(57, 189, 'Ravikant Kumar', 'KKBK0005702', 'KOTAK MAHINDRA BANK LIMITED', '4248471738', '1', 'AES_86957737', '2024-09-16 14:53:38', '2024-09-16 14:53:38'),
(58, 198, 'Mr. Tarun Kumar Sahoo', 'SBIN0061698', 'STATE BANK OF INDIA', '39456956480', '1', 'AES_86957849', '2024-09-16 14:59:06', '2024-09-16 14:59:06');

-- --------------------------------------------------------

--
-- Table structure for table `banneradds`
--

CREATE TABLE `banneradds` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `com_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `view_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banneradds`
--

INSERT INTO `banneradds` (`id`, `name`, `com_name`, `business_type`, `banner`, `url`, `amount`, `active_date`, `expire_date`, `status`, `view_count`, `created_at`, `updated_at`) VALUES
(2, 'Lablum Entertainment', 'Unitary Corporate Group', 'Short Video Application', 'banners/VtxhzjMZwCkqDhYgOaTWkAoqBESxsCXmAE3vLGPW.png', 'https://lablum.com/', NULL, '2024-05-31', '2024-06-13', 0, '165', '2024-05-31 10:22:51', '2024-06-08 14:49:30'),
(3, 'Lablum Entertainment', 'Unitary Corporate Group', 'Short Video Application', 'banners/CPEdg9qIsDV1YZdS7okweswc3EjY3riSN33ye0nN.jpg', 'https://lablum.com/', NULL, '2024-06-09', '2024-07-31', 1, '1604', '2024-06-08 14:51:03', '2024-11-04 23:01:25');

-- --------------------------------------------------------

--
-- Table structure for table `blockmessages`
--

CREATE TABLE `blockmessages` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blockusers`
--

CREATE TABLE `blockusers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `block_id` bigint UNSIGNED NOT NULL,
  `block_uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `blocked_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogcategories`
--

CREATE TABLE `blogcategories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogcategories`
--

INSERT INTO `blogcategories` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(4, 'LabLum Short Video', 'lablum-short-video', '2024-04-30 14:06:42', '2024-04-30 14:20:06'),
(5, 'Short Video', 'short-video', '2024-09-25 09:36:00', '2024-09-25 09:39:57'),
(6, 'Short Video Maker', 'short-video-maker', '2024-10-07 11:29:02', '2024-10-07 11:29:26');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `slug`, `thumbnail`, `category_id`, `tag`, `meta_description`, `description`, `image1`, `image2`, `created_at`, `updated_at`) VALUES
(10, 'Unlocking the Power of Short Videos', 'unlocking-the-power-of-short-videos', 'thumbnails/s40NYH4nA1ilz8qGa4kNw2txCf0mgZqM2RiFRiiF.png', 5, NULL, 'In an ever-evolving digital landscape, the power of short videos has proven to be an unparalleled ability to engage audiences, increase engagement, and deliver messages with precision. With the rise of social media platforms that prioritize concise and engaging content, short videos benefit brands, creators, and individuals alike. Enter Lablum, a new app designed to harness the power of short videos, has changed how you create, share, and engage with your audience.', '<h3>The Unmatched Influence of Short Videos</h3><p>We have changed the way we consume content with short videos. Their short duration, typically a few seconds to two minutes, is well suited to a fast-paced digital environment and the reduced attention span of an online audience. This format allows for fast, impactful, immediate dissemination of information and the greater potential to reach a wider audience. Short videos provide a versatile and effective way to deliver a message and stir emotions, whether for entertainment, education, or marketing.</p><h4>&nbsp;</h4><h3>Why Lablum Stands Out?</h3><p>Lablum is now rising as the prerequisite in the short video maker, offering features and extensive access that set it apart from several other platforms. There are many reasons as to why Lablum should be everyone\'s go-to app for creating and sharing short videos:</p><p>&nbsp;</p><ul><li>User-Friendly Frontier: Lablum incorporates an instinctive design, which makes it accessible for users of all proficiency. Whether one is an amateur creator in the world of video content, Lablum makes the process smooth and entertaining.</li><li>Watch and Earn- Lablum offers a unique opportunity for its users to watch short videos and earn money. Generally, a short video platform/app lets the creator earn through his content. With Lablum, now users get rewarded heftily just for watching a short video content. This one-of-a-kind feature helps the users to engage better with their favourite creator and with Lablum.</li><li>Modified Editing Tools: Lablum gives you access to a suite of progressive editing tools that enable you to design professional-quality videos without the need for extravagant software. From cropping and editing to adding special effects and soundtracks, Lablum gives you the power of an expert video editor in your hands.</li><li>Engagement-Boosting Features: Lablum highlights the value of engagement. The app offers distinct features curated to maximize viewer engagement, such as negotiable call-to-action buttons, interactive polls, and direct messaging access, assuring that your short videos engage along with informing.&nbsp;</li><li>Cross-Platform Sharing: In today\'s interconnected world, having access to circulate content across several platforms is key. Lablum makes it convenient to spread your short videos across channels and also helps amplify the same.&nbsp;</li></ul><p>&nbsp;</p><ul><li>Community and Collaboration: Lablum is not just a tool but fosters a community of creators and viewers. The platform invites collaborative opportunities through its distinct features that allow co-creation, feedback, and sharing.&nbsp;</li></ul><p>&nbsp;</p><h3>The advantages of employing short videos with Lablum:</h3><h4>&nbsp;</h4><ul><li>Increased Engagement: Shorter format videos usually gain more traction than long format videos as they don\'t require much time. The features at Lablum are designed such that they can be capitalized along with ensuring that the content resonates with the audience.&nbsp;</li></ul><p>&nbsp;</p><ul><li>Wider Reach: The broad nature of shareable content of short videos gives the users at Lablum the full potential to reach a global audience. The cross-platform sharing capabilities at Lablum make it even more convenient to achieve versatile exposure.&nbsp;</li></ul><p>&nbsp;</p><ul><li>Versatility: It doesn\'t matter whether one is promoting a product, sharing a tutorial or narrating a story, the tool kit at Lablum curated especially for these techniques takes care of all of it to meet the objectives.&nbsp;</li></ul><p>&nbsp;</p><ul><li>Cost-Effectiveness: Lablum intends to create a world of cost-effective alternatives to conventional video making, thereby offering high-quality results without huge cost-cutting.&nbsp;</li></ul><p>&nbsp;</p><ul><li>Community Building: Lablum enables the creating of content and helps build and keep together a community of followers and fellow creators. This helps foster a sense of belonging and extensive support.&nbsp;</li></ul><h4>&nbsp;</h4><p>Getting ahead in the dynamic world of digital content means using the latest tools and resources. Short videos represent the frontier of online communication’s appeal, and Lablum is your key to unlocking its full potential. With user-friendly interfaces, advanced editing tools, and community-focused features, Lablum empowers you to create stories that inspire, motivate, and engage.</p><p>Ready to take your digital content to the next level? Download Lablum today and start harnessing the power of short videos to tell your story, engage audiences, and reach productivity goals. Lablum is more than just an app—it’s your gateway to the future of short video content. Join the revolution&nbsp;and change the way you interact with the world.&nbsp;</p><p>Start your journey with Lablum, where each short video is a step towards greater engagement, greater reach, and unmatched storytelling. Download Lablum now and unlock the power of short videos today.</p><p>By integrating the key aspects of short video creation and sharing, alongside the unique benefits Lablum offers, we aim to not only inform but also inspire readers to explore the world of short videos through the Lablum app, ultimately driving downloads and active engagement on the platform.</p><h4>&nbsp;</h4>', 'gallery/y0RRDooUoMkTb1opvMSRpHL07OPrtWPV3bk3ZxhD.png', NULL, '2024-04-30 14:08:05', '2024-09-25 09:42:14'),
(11, 'The Rise of Short Video Content: Why It\'s Here to Stay', 'the-rise-of-short-video-content-why-its-here-to-stay', 'thumbnails/TSQtm7rQv1aEMHd31bjZm7mMkH93cRQnTdaMJNRb.jpg', 5, NULL, 'Short video content has become a dominant force in digital media. It\'s easy to create and consume, and it\'s an effective marketing tool. Businesses are investing heavily in short video ads to reach their audience and boost brand awareness.', '<p>Once upon a time, we used to read Books for our entertainment, then came the era of Radio, Television, and Movies. If we talk about today’s time, it’s social media that is ruling the roost. The thing to notice here is the considerable drop in our attention span. From reading books for days to watching movies or television for hours to now watching short videos for a few seconds. Short videos are not just a trend, it\'s here to stay.</p><p>In the last few years, social media has dominated the entertainment scene across the globe. Especially during the tremulous COVID-19 period, it was a rage among people. Short videos helped people in their quarantine time. Today, we are in 2024, and we’ve left the coronavirus far behind, but even today the popularity of Short Videos or reels is sky-high. The short videos are easy to make, easy to watch, and you are entertained in a few seconds.</p><p>Today not only social media influencers are using short videos to entertain/educate their audience, but are used by many companies as a marketing tool to sell their product. One of the reasons behind the popularity of short videos is the rise in the use of smart phones. One cannot stay away from their mobile device for a minute. Whenever one has time he/she turns on the phone and starts scrolling reels on Instagram or shorts on YouTube. This is used very intelligently by companies and marketing personalities to promote their product.&nbsp;</p><p>According to a study, around 85% of marketers use short videos as an effective strategy to boost their product. The study also highlights the fact that the viewers consume short videos more than texts and retain 95% of information from them. This report proves that short videos are used not only for entertainment but also to boost brand identity. The short-form content is grabbing people’s attention and hence has become an effective marketing tool.&nbsp;</p><p>The social media has taken a large chunk of the TV audience away. It\'s because of the lengthy ads that run during a TV program. On the other hand, if you look at social media, the videos on it have minimal advertisements that run for a few seconds. These ads are also considered as an effective marketing strategy, as it doesn\'t eat away a lot of the viewer\'s time. According to another study, the expenditure on these short video ads is predicted to shoot up to $100 Billion this year. These statistics prove that short videos are important for businesses to market their product. It shows that people are spending a lot of money on making these videos because they are very good at helping to advertise and sell products.</p><p>In conclusion, the rise of short video content is not merely a fleeting trend but a testament to the evolving landscape of digital media. Its popularity stems from the inherent ability to captivate audiences with brief, yet impactful, narratives that fit seamlessly into our fast-paced lives. Platforms like TikTok, Instagram Reels, and YouTube Shorts have proven that short videos are not only effective in engaging viewers but also in driving brand awareness and creativity. This format’s success is rooted in its accessibility, ease of creation, and the way it leverages the instant gratification sought by modern consumers.&nbsp;</p><p>As technology advances and user preferences continue to shift, short videos are poised to remain a dominant force in content creation. For businesses and creators alike, embracing this trend offers a valuable opportunity to connect with audiences in meaningful ways, ensuring that short video content is here to stay as a cornerstone of digital engagement and marketing strategies. &nbsp;</p><p>&nbsp;</p>', 'gallery/OxBOHP3rMLvfTpeHXEKk6D0053t7xJFuW36DZkp9.jpg', NULL, '2024-09-25 09:39:03', '2024-09-25 09:39:03'),
(12, 'Top Trends in Short Video Creation You Need to Know', 'top-trends-in-short-video-creation-you-need-to-know', 'thumbnails/4l2VTzwA2aDCet9T8jZE4slXuUEEykLf4Tkffp9K.jpg', 5, NULL, 'The realm of social media is an ever-changing field. Marketers, brands, and influencers need to stay put with the latest trends in short video creation. In this blog, we will learn about the latest trends in the short video space. We will also discuss the trends in detail and know the reason behind the popularity of short videos.', '<p>In 2024 short-form videos are the king of all content. This form of content is used extensively by marketers and influencers today to promote their products or to engage with their audience. Platforms like Google are also showing their support for short-form videos, let\'s find out what trends you can follow to create content!</p><p>&nbsp;</p><h3>What is Short Form Content?</h3><p>The social media Realm defines short-form content or short videos as videos that range anything between 30 seconds to one minute in length. These videos are generally, crisp, to the point, entertaining, and easy to share.&nbsp;</p><h3>Reasons Behind its Popularity?</h3><p>As mentioned earlier these short videos are crisp and engaging. But what also works in its favor is that it is easy to make. The creator/ brand can make more videos in a very short time. For example earlier if the creator/ brand used to make 1 video in a day, with the emergence of short videos they could produce 10-15 videos. The short-form content is not very time-consuming and the viewer can scroll the entire day without noticing the time, this helps the brands to make their presence felt online.&nbsp;</p><p>&nbsp;</p><h3>Top Trends in Short Video Creation You Must Know</h3><p>&nbsp;</p><h4>Challenge on Social Media</h4><p>The short-form content went viral a few years ago. The content was based on dance, song, and enacting movie scenes and dialogues. Brands today make their own challenges, using their own songs, dances, filters, etc. It helps them to engage with the audience, promote their product, and go viral.</p><p>According to a report by HubSpot, around 20% of marketers created brand challenges and 42% performed better than expected. The marketers also believe that these challenges are one of the most effective social media trends this year.</p><h4>Influencer Marketing</h4><p>After the film stars and cricketers, the most popular celebrities are arguably the social media influencers. Their popularity is on the rise day by day. Especially among the youth and teenagers, they are a rage. Looking at this trend and the massive viewership that these influencers generate, brands are looking to capitalize on it. The brands are promoting their product through social media influencers.&nbsp;</p><p>According to a survey, 88% of companies using influencer marketing say it\'s effective and around 55% said they will invest more in 2024. This belief in the influencers proves that Influencer marketing is here to stay.</p><h4>Behind the Scene Videos (BTS)&nbsp;</h4><p>In a world of cutthroat competition, brands tend to cheat their consumers. Therefore, consumers seek transparency. But the problem is the short videos only have a few seconds to connect with their audience. Here Behind the scenes (BTS) videos come in handy. Believe it or not, consumers feel more connected and trust you more when they see what you do behind the product.</p><p>According to a study by Sprout Social Study, it was found that 70% of consumers felt more connected to those whose leadership or CEO was active on social media platforms. It is crucial that brands go out and share more BTS videos on social media. It will not only help them promote their brand but also build trust among the consumer.</p><h4>How-to and Educational Videos</h4><p>Remember the time when cooking shows were a craze? Or the time when we as children used to cling to our TV sets to watch MAD on Pogo? The similarities between these shows were, that they taught us something, they added value to our lives. The cooking shows taught us how to cook delicious food whereas M.A.D taught us art and craft. It is believed that this trend of educational and How-to videos is going to make a comeback in the digital space.</p><p>In 2024 brands are likely to shift their how-to’s, DIYs, and educational videos. According to a report by HubSpot, 32% of marketers said that they produced educational videos, and around 57% said it was effective in building a stronger brand presence.&nbsp; As said earlier, these videos add value to the audience’s life. It helps them in their day-to-day lives. These videos affect the decision-making of a buyer. If done properly it can turn the audience into customers.</p><h4>Conclusion</h4><p>In conclusion, staying in the loop with the current trends helps the brands immensely to market their business. Today social media is used by everyone. From teenagers to senior citizens everybody uses social media. If brands use these trends well, it is not wrong to say that the sky is the limit.&nbsp;</p>', 'gallery/yc4vxtWV5ib09tpQ5ufDB7DOw6DmoIWTpNBXrTGC.jpg', NULL, '2024-10-01 15:04:11', '2024-10-01 15:04:11'),
(13, 'Creating Viral Content with Short Video Makers: A Guide', 'creating-viral-content-with-short-video-makers:-a-guide', 'thumbnails/CLvtb1kDC390P7p6JnRM9M53LDvlrQF8rESzXM7Z.jpg', 6, NULL, 'Short video maker guide: Create viral content with tips on audience understanding, creative production, and optimization.', '<p>In today\'s world pacing towards a digital landscape, crisp and short videos act as a major tool in impactful online content. Many platforms such as Instagram, and&nbsp;YouTube shorts have changed the way the creators engage with their subscribers or their audience. This in turn makes it vital for everyone to curate viral content to figure out&nbsp;the nuances of the form. The short-form video makers are enabled with intuitive strengths and can leverage the quality of captivating content that grasps the attention of the audience within seconds. In order to make the videos viral one needs to follow certain strategies that will help strengthen the potential for virality.<br><br>Starting with understanding the target audience, it is a crucial step in the concerned field. Before delving into the intricacies of video creation, it is required to thoroughly research the kind of content that resonates with the demographic. The next step is to analyze trendy current topics in everyone\'s particular niche and figure out the content that will help gain traction. A well-made short video incorporates relativity with creativity, eventually taking into consideration the humor, emotions, and unique perspectives that gain viewership. In addition to these steps, it is necessary to keep in touch with ongoing platform-specific trends and challenges as these elements can bring in a sense of inspiration and increase the chances of the content being widely shared.</p><p>&nbsp;</p><p>Once the art of finalizing the concept is done, the next step would be to optimize the production and editing process. <a href=\"https://play.google.com/store/apps/details?id=com.lablum.entertainment&amp;pcampaignid=web_share\">Short video makers</a> frequently come with features like templates, filters, and&nbsp;soundtracks that make the process rather seamless. These tools can streamline the workflow and can elevate the quality of videos. In conclusion, it is essential to remember that the first few seconds of every video are crucial as that is the time to lure the audience into watching the entire video. This is why it is only fair that a strategic blend of audience understanding, creative production, and effective management techniques are implemented. By recognizing what captivates the viewers and then making use of the specific tools, the chances of putting together shareable content can be maximized. This field requires staying ahead of trends and fostering a genuine correlation with the audience.&nbsp;</p><p>&nbsp;</p><p>Lastly, it is important to remember that making viral content with short videos is a mix of creativity, strategic planning, and continuity. With the evolution of the digital landscape, short videos have now taken over the digital market for content creators to interact with their audiences within a short period of time. Achieving success in this fast-paced environment hampers the understanding of the target audience, keeping in touch with the trends and continually improvising with fresh ideas.&nbsp;</p><p>Curating viral content starts with relatable and influential storytelling, even within the short span of platforms such as Instagram reels and YouTube Shorts. Elevating humor, emotions and unique perspectives grasps the attention of the audience and boosts accessibility. In addition to this, keeping up with platform-specific current trends and challenges ensures that the content retains relevance.</p><p>The first few split seconds of the short videos are always crucial which is why creators use eye-catching visuals, trending music and other strategic tactics. The video-making applications also provide a wide range of features such as templates, filters, and soundtracks that help in making the content attractive.&nbsp;</p><p>Optimizing the content with the help of the right hashtags, keywords, and trends is also equally vital. Engaging directly with the audiences and keeping in touch with them via social media posts helps boost engagement.</p><p>Virality is rooted in a blend of factors like creativity, timing, and relevance. By staying way ahead of trends, setting new trends, experimenting, and creating honest connections with the audience can levitate the chances of virtualizing the videos. With the right approach, short videos can become the next versatile tool for building brands and strengthening audience engagement.</p>', 'gallery/qOXsaMLx9ciDEkFux2Krul7FEqjnHdhcvLboqFKt.jpg', NULL, '2024-10-07 11:30:42', '2024-10-07 11:32:11'),
(14, 'How to choose the best Short Video Maker for your content', 'how-to-choose-the-best-short-video-maker-for-your-content', 'thumbnails/iB7evZUAuJ94hXcVJC7IBMqJUsCHNI327IJzPBIr.png', 6, NULL, 'Discover the perfect short video maker with our guide! Learn to choose tools that fit your content needs, offering ease of use, templates, and customization options.', '<p>In the world of fast-paced digital space, short-form video is ruling the social media platforms. The audiences on Instagram Reels and YouTube Shorts prefer bite-sized videos for both entertainment and informative content. The short form content is also used by businesses and creators for engagement and marketing purposes. However, producing high-quality short videos that captivate your audience requires the right tools. The challenge is knowing how to choose the best short video maker for your specific content needs.</p><p>In this blog, we’ll help you make a decision when selecting a short video maker:-</p><h3><strong>&nbsp;Understanding Video Needs</strong></h3><h4>The step to choosing the perfect video maker is to assess your content needs. Analyse and ask these questions yourself:</h4><p>&nbsp;</p><ul><li>The main purpose of your videos (e.g., promotion, education, entertainment)</li><li>Platforms that will be used to share the videos (e.g., Instagram, TikTok, YouTube)</li><li>Specific Formats such as vertical or square video formats</li><li>Customizations required in terms of editing, transitions, and effects</li></ul><p>By identifying what you require and your&nbsp;preferred platforms, you can choose the video maker that best aligns with your goals.</p><h3><strong>&nbsp;An Easy-to-use UI</strong></h3><p>&nbsp;</p><p>A user-friendly interface is essential, especially if you\'re not an experienced video editor. Look for short video makers that offer intuitive drag-and-drop features, clear navigation, and simple editing tools. The software should enable you to create videos quickly without having to go through a steep learning curve. Many video makers, such as InShot, Canva, and Vimeo Create, are designed with beginners in mind, offering pre-made templates and easy-to-use controls. If you’re looking for more advanced editing features, tools like Adobe Premiere Rush or Final Cut Pro offer more customization options while still being relatively easy to use for intermediate users.</p><p>&nbsp;</p><h3><strong>&nbsp;Templates and customization options&nbsp;</strong></h3><p>Pre-made templates save you a lot of time. Especially in creating content quickly. Look for video creators that offer a variety of templates to suit different types of content. Whether it\'s a promotional video, a tutorial, or a social media challenge. These templates help you create professional-looking videos without requiring advanced editing skills. However, make sure that the video producer provides flexibility in customization as well. You should be able to customize colors, fonts, and&nbsp;text animations. and changing images to align videos with your brand or creative vision Some platforms have branding tools. This allows all videos to include the same brand logo, fonts, and colors.</p><p>&nbsp;</p><h3><strong>&nbsp;Features and Special Effects&nbsp;</strong></h3><p>Short movies are powerful when they’re engaging, so the video maker you select has to offer features that help you create dynamic content material. Consider whether the tool gives: Text overlays: Adding captions or titles helps bring your message, mainly for customers who watch films without sound. Transitions and animations: Smooth transitions and animations could make your video look polished and expert. Music library: Music complements the mood and engagement of your video. An integrated library of royalty-unfastened songs is a plus. Filters and outcomes: These can elevate the culture of your video. Look for equipment that provides numerous filters, outcomes, and stickers to add persona to your content. Popular equipment like Veed.Io and Kapwing offers an extensive library of consequences and editing gear, even as Adobe Premiere Rush and iMovie provide more control over advanced features for greater specific customizations.&nbsp;</p><p>&nbsp;</p><h3><strong>&nbsp;Platform compatibility and export options&nbsp;</strong></h3><p>Before choosing a short video maker Make sure that your preferred social media platform is supported in terms of export options and aspect ratio. A good video maker will let you export your videos in a variety of formats. Including vertical format square and horizontal Check if the tool integrates easily with your social platforms. Some video creators have direct export options. This allows you to upload videos to platforms like Instagram, TikTok, YouTube, and Facebook without leaving the editor.</p><p>&nbsp;</p><h4>Conclusion</h4><p>&nbsp;</p><p>In Conclusion, Choosing the best short video maker for your content comes down to understanding your needs, the tool’s ease of use, available features, and value for money. Whether you’re a beginner or an advanced user, finding the right tool will make your video creation process smoother and more enjoyable, helping you create content that stands out and engages your audience effectively.</p>', 'gallery/gNb1NJGcyjvsP5BFKPFBaXgNfzDmF7ecltsxS8Yn.png', NULL, '2024-10-15 16:56:29', '2024-10-15 16:56:29'),
(16, 'Key Features to Look for in a Short Video Maker App', 'key-features-to-look-for-in-a-short-video-maker-app', 'thumbnails/zyM3km8rPz94uhuYW5fFbdX9dJuI93M8gj1olkWA.png', 6, NULL, 'Short video maker app guide. Find the best app for your needs. User-friendly interface, pre-made templates, editing tools, audio options, social media integration, and performance.', '<p>In the age of trending short and crisp content, video-making has become a prerequisite for people and businesses interested in the field. It does not matter whether one is a content creator, marketer, or strategist, having access to the appropriate application for curating videos is pivotal to ensuring the&nbsp;high quality of the videos. In a market of innumerable applications, it can be difficult and confusing to pick the one that caters to our needs. This blog provides a framework and guides you through the specific features to be aware of while choosing the most suitable application for your video creation process.<br><br>&nbsp;</p><h3><strong>1. User-friendly interface&nbsp;</strong></h3><p>The first and foremost factor that stands out in any application is its user-friendly interface. The application needs to be intuitive, thereby enabling the&nbsp;creation of videos with convenience. Precisely the application should have vividly labeled icons, simple and clear functions, and a menu that is easy to work with. A well-established interface lessens the chances of slow learning so that individuals can focus on their creativity rather than specifying on the technical aspects.&nbsp;</p><p>&nbsp;</p><h3><strong>2. Pre-Made Templates</strong></h3><p>Previously made templates are a blessing in disguise. Whenever you are in a rush to make content and there is a time crunch you can tap on readymade templates and advertise your personal projects. It helps save time and work more&nbsp;efficiently than ever. Templates are the safest bet which is why individuals should look for apps that have a wide range of separately tailored themes for industries, travel, food, lifestyle, and business.&nbsp;</p><p>These templates should be customizable thereby ensuring the potential future changes as per brand vision. This feature assures authenticity in videos while also saving a lot of time.&nbsp;</p><h3><strong>3. Editing Tools and Effects</strong></h3><p>Advanced editing tools and effects are essential for creating dynamic and engaging videos. Look for features like:</p><p>- Cutting and trimming:&nbsp;These basic tools allow you to remove unwanted parts of your video and focus on key moments.</p><p>- Transitions: Smooth transitions between clips help maintain the flow of your video.</p><p>- Text overlays: Adding text to highlight important messages, captions, or subtitles can improve accessibility and clarity.</p><p>- Filters and effects:&nbsp;Colour filters, slow-motion, and other effects can enhance the visual appeal of your content, making it more eye-catching and professional.</p><p>- Speed control: The ability to adjust the speed of your clips allows you to create dramatic slow-motion scenes or fast-paced action sequences.</p><p>&nbsp;</p><p>A short video maker app with comprehensive editing tools and effects gives you the creative freedom to produce standout videos.</p><p>&nbsp;</p><h3><strong>4. Audio Options</strong></h3><p>Great visuals need to be paired with great audio. An ideal short video maker app should provide a wide range of audio options, such as:</p><p>- Music library: Built-in royalty-free music that you can add to your video is a must. Ensure the app offers diverse tracks suitable for different moods and styles.</p><p>- Voiceover capabilities: Look for an app that allows you to record voiceovers directly within the app, making it easier to narrate or explain your video content.</p><p>- Sound effects:&nbsp;These can add an extra layer of engagement, bringing your video to life.</p><p>Quality audio can elevate your video content, making it more engaging and professional.</p><p>&nbsp;</p><h3><strong>5. Social Media Integration</strong></h3><p>In today\'s digital age, seamless social media integration is crucial. The app should allow you to export your videos in high resolution and upload them directly to your preferred social media platforms, such as Instagram, TikTok, Facebook, or YouTube.</p><p>Apps with built-in social sharing features can save you time and effort by eliminating the need to download, save, and manually upload videos to each platform. Some apps even come with scheduling tools, so you can plan your content in advance.</p><p>&nbsp;</p><h3><strong>&nbsp;6. Performance and Speed</strong></h3><p>Nothing is more frustrating than an app that lags, crashes, or freezes while you\'re working on a project. Choose a short video maker app that is well-optimized for performance, ensuring that you can edit and export videos smoothly, even on devices with lower specifications.</p><p>Check reviews for feedback on the app’s performance, especially regarding speed when rendering or exporting videos.</p><p>&nbsp;</p><h4>Conclusion</h4><p>Choosing the right short video-making app can make all the difference in the quality and success of your content. By prioritizing features such as a user-friendly interface Powerful editing tools, Audio options, Aspect ratio flexibility, and social media integration, You\'ll be well-equipped to create professional videos that capture attention and drive engagement as you explore. And don\'t forget to consider performance and price. This will ensure that your app meets your creative needs and budget.</p>', 'gallery/4eeCwKQaLfWd9lJdhRuy4Z1CRIWQWUoUvPgmdvTN.png', NULL, '2024-10-26 11:53:38', '2024-10-26 11:53:38');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(2, NULL, '#Dog Care', '#dog-care', 'storage/category_image/1712657386.png', '2024-04-09 04:39:46', '2024-04-09 04:43:40'),
(3, NULL, '#foodblogging', '#foodblogging', 'storage/category_image/1712658307.jpg', '2024-04-09 04:55:07', '2024-04-09 04:55:07'),
(4, NULL, '#Rider', '#rider', 'storage/category_image/1712658355.jpg', '2024-04-09 04:55:55', '2024-04-09 04:55:55'),
(85, 'CRAFTS', '#crafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(86, 'CRAFTS', '#artsandcrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(87, 'CRAFTS', '#craftsmanship', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(88, 'CRAFTS', '#craftsposure', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(89, 'CRAFTS', '#craftsman', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(90, 'CRAFTS', '#papercrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(91, 'CRAFTS', '#handmadecrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(92, 'CRAFTS', '#diycrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(93, 'CRAFTS', '#handicrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(94, 'CRAFTS', '#kidscrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(95, 'CRAFTS', '#danandphilcrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(96, 'CRAFTS', '#handcrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(97, 'CRAFTS', '#craftsupplies', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(98, 'CRAFTS', '#christmascrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(99, 'CRAFTS', '#craftshow', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(100, 'CRAFTS', '#craftspirits', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(101, 'CRAFTS', '#leathercrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(102, 'CRAFTS', '#aircrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(103, 'CRAFTS', '#woodcrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(104, 'CRAFTS', '#cricutcrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(105, 'CRAFTS', '#minecraftserver', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(106, 'CRAFTS', '#5minutecrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(107, 'CRAFTS', '#craftsmen', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(108, 'CRAFTS', '#resincrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(109, 'CRAFTS', '#craftsph', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(110, 'CRAFTS', '#craftsforkids', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(111, 'CRAFTS', '#instacrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(112, 'CRAFTS', '#minecrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(113, 'CRAFTS', '#minecraftskin', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(114, 'CRAFTS', '#stylecraftspecialdk', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(115, 'CRAFTS', '#artandcrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(116, 'CRAFTS', '#kidscrafts101', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(117, 'CRAFTS', '#craftsy', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(118, 'CRAFTS', '#halloweencrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(119, 'CRAFTS', '#craftshop', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(120, 'CRAFTS', '#artsncrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(121, 'CRAFTS', '#moderncraftsman', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(122, 'CRAFTS', '#craftsportswear', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(123, 'CRAFTS', '#americancrafts', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(124, 'CRAFTS', '#craftsmanhome', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(125, 'CRAFTS', '#crafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(126, 'CRAFTS', '#papercrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(127, 'CRAFTS', '#bushcrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(128, 'CRAFTS', '#resincrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(129, 'CRAFTS', '#soapcrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(130, 'CRAFTS', '#handcrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(131, 'CRAFTS', '#wildcrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(132, 'CRAFTS', '#leathercrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(133, 'CRAFTS', '#ilovecrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(134, 'CRAFTS', '#craftingismytherapy', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(135, 'CRAFTS', '#woodcrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(136, 'CRAFTS', '#craftingideas', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(137, 'CRAFTS', '#craftingfun', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(138, 'CRAFTS', '#papercraftingaddict', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(139, 'CRAFTS', '#happycrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(140, 'CRAFTS', '#sewmuchcrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(141, 'CRAFTS', '#christmascrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(142, 'CRAFTS', '#lovecrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(143, 'CRAFTS', '#craftingwithkids', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(144, 'CRAFTS', '#craftingtime', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(145, 'CRAFTS', '#craftingeek', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(146, 'CRAFTS', '#craftingthefutureoffood', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(147, 'CRAFTS', '#craftingcommunity', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(148, 'CRAFTS', '#craftingisfun', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(149, 'CRAFTS', '#cricutcrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(150, 'CRAFTS', '#craftingabetteryou', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(151, 'CRAFTS', '#craftingsupplies', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(152, 'CRAFTS', '#witchcrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(153, 'CRAFTS', '#minecrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(154, 'CRAFTS', '#craftingfantastic', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(155, 'CRAFTS', '#craftingislife', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(156, 'CRAFTS', '#latenightcrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(157, 'CRAFTS', '#cardcrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(158, 'CRAFTS', '#covidcrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(159, 'CRAFTS', '#craftinglife', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(160, 'CRAFTS', '#craftingmama', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(161, 'CRAFTS', '#diycrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(162, 'CRAFTS', '#bahancrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(163, 'CRAFTS', '#craftingmom', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(164, 'CRAFTS', '#coronacrafting', NULL, NULL, '2024-05-17 05:34:07', '2024-05-17 05:34:07'),
(165, 'COMEDY HASHTAG', '#meme', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(166, 'COMEDY HASHTAG', '#funny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(167, 'COMEDY HASHTAG', '#humor', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(168, 'COMEDY HASHTAG', '#lol', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(169, 'COMEDY HASHTAG', '#memes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(170, 'COMEDY HASHTAG', '#funnymemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(171, 'COMEDY HASHTAG', '#bestmemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(172, 'COMEDY HASHTAG', '#memvideo', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(173, 'COMEDY HASHTAG', '#freshmemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(174, 'COMEDY HASHTAG', '#lmao', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(175, 'COMEDY HASHTAG', '#comedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(176, 'COMEDY HASHTAG', '#dankmemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(177, 'COMEDY HASHTAG', '#fun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(178, 'COMEDY HASHTAG', '#tiktok', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(179, 'COMEDY HASHTAG', '#love', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(180, 'COMEDY HASHTAG', '#memesdaily', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(181, 'COMEDY HASHTAG', '#dank', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(182, 'COMEDY HASHTAG', '#viral', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(183, 'COMEDY HASHTAG', '#edgymemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(184, 'COMEDY HASHTAG', '#offensivememes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(185, 'COMEDY HASHTAG', '#explorepage', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(186, 'COMEDY HASHTAG', '#dankmeme', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(187, 'COMEDY HASHTAG', '#funnymeme', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(188, 'COMEDY HASHTAG', '#fortnite', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(189, 'COMEDY HASHTAG', '#haha', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(190, 'COMEDY HASHTAG', '#edgy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(191, 'COMEDY HASHTAG', '#dailymemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(192, 'COMEDY HASHTAG', '#anime', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(193, 'COMEDY HASHTAG', '#cringe', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(194, 'COMEDY HASHTAG', '#offensive', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(195, 'COMEDY HASHTAG', '#comedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(196, 'COMEDY HASHTAG', '#standupcomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(197, 'COMEDY HASHTAG', '#comedyclub', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(198, 'COMEDY HASHTAG', '#comedyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(199, 'COMEDY HASHTAG', '#instacomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(200, 'COMEDY HASHTAG', '#ivgcomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(201, 'COMEDY HASHTAG', '#comedyvideo', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(202, 'COMEDY HASHTAG', '#comedyshow', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(203, 'COMEDY HASHTAG', '#comedycentral', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(204, 'COMEDY HASHTAG', '#tamilcomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(205, 'COMEDY HASHTAG', '#hoodcomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(206, 'COMEDY HASHTAG', '#comedymemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(207, 'COMEDY HASHTAG', '#naijacomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(208, 'COMEDY HASHTAG', '#comedylife', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(209, 'COMEDY HASHTAG', '#telugucomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(210, 'COMEDY HASHTAG', '#comedyposts', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(211, 'COMEDY HASHTAG', '#sketchcomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(212, 'COMEDY HASHTAG', '#comedynight', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(213, 'COMEDY HASHTAG', '#gujjucomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(214, 'COMEDY HASHTAG', '#igcomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(215, 'COMEDY HASHTAG', '#comedypics', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(216, 'COMEDY HASHTAG', '#comedyindia', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(217, 'COMEDY HASHTAG', '#malayalamcomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(218, 'COMEDY HASHTAG', '#marathicomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(219, 'COMEDY HASHTAG', '#vadivelucomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(220, 'COMEDY HASHTAG', '#purecomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(221, 'COMEDY HASHTAG', '#comedywoman', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(222, 'COMEDY HASHTAG', '#comedygold', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(223, 'COMEDY HASHTAG', '#blackcomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(224, 'COMEDY HASHTAG', '#comedyvine', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(225, 'COMEDY HASHTAG', '#comedypodcast', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(226, 'COMEDY HASHTAG', '#livecomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(227, 'COMEDY HASHTAG', '#womenincomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(228, 'COMEDY HASHTAG', '#romanticcomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(229, 'COMEDY HASHTAG', '#justcomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(230, 'COMEDY HASHTAG', '#comedyskit', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(231, 'COMEDY HASHTAG', '#darkcomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(232, 'COMEDY HASHTAG', '#improvcomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(233, 'COMEDY HASHTAG', '#vadivelcomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(234, 'COMEDY HASHTAG', '#tiktokcomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(235, 'COMEDY HASHTAG', '#funny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(236, 'COMEDY HASHTAG', '#funnymemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(237, 'COMEDY HASHTAG', '#funnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(238, 'COMEDY HASHTAG', '#funnymeme', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(239, 'COMEDY HASHTAG', '#funnyshit', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(240, 'COMEDY HASHTAG', '#funnypictures', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(241, 'COMEDY HASHTAG', '#instafunny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(242, 'COMEDY HASHTAG', '#toofunny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(243, 'COMEDY HASHTAG', '#funnyposts', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(244, 'COMEDY HASHTAG', '#funnyvideo', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(245, 'COMEDY HASHTAG', '#funnyaf', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(246, 'COMEDY HASHTAG', '#funnyquotes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(247, 'COMEDY HASHTAG', '#funnycat', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(248, 'COMEDY HASHTAG', '#funnypics', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(249, 'COMEDY HASHTAG', '#ifunny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(250, 'COMEDY HASHTAG', '#funnyface', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(251, 'COMEDY HASHTAG', '#pubgfunny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(252, 'COMEDY HASHTAG', '#funnyfaces', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(253, 'COMEDY HASHTAG', '#funnydog', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(254, 'COMEDY HASHTAG', '#sofunny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(255, 'COMEDY HASHTAG', '#funnytumblr', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(256, 'COMEDY HASHTAG', '#funnycats', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(257, 'COMEDY HASHTAG', '#funnymoments', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(258, 'COMEDY HASHTAG', '#funnypic', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(259, 'COMEDY HASHTAG', '#fortnitefunny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(260, 'COMEDY HASHTAG', '#funnypost', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(261, 'COMEDY HASHTAG', '#funnydogs', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(262, 'COMEDY HASHTAG', '#tumblrfunny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(263, 'COMEDY HASHTAG', '#funnytextpost', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(264, 'COMEDY HASHTAG', '#funnymemesdaily', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(265, 'COMEDY HASHTAG', '#pubgfunnymoments', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(266, 'COMEDY HASHTAG', '#funnyanimals', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(267, 'COMEDY HASHTAG', '#funnyday', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(268, 'COMEDY HASHTAG', '#funnystuff', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(269, 'COMEDY HASHTAG', '#funnytextposts', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(270, 'COMEDY HASHTAG', '#funnyjokes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(271, 'COMEDY HASHTAG', '#funnyvines', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(272, 'COMEDY HASHTAG', '#funnygirl', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(273, 'COMEDY HASHTAG', '#funnyvids', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(274, 'COMEDY HASHTAG', '#funnypicture', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(275, 'COMEDY HASHTAG', '#fun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(276, 'COMEDY HASHTAG', '#funny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(277, 'COMEDY HASHTAG', '#sundayfunday', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(278, 'COMEDY HASHTAG', '#funnymemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(279, 'COMEDY HASHTAG', '#funtimes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(280, 'COMEDY HASHTAG', '#funnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(281, 'COMEDY HASHTAG', '#instafun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(282, 'COMEDY HASHTAG', '#funday', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(283, 'COMEDY HASHTAG', '#funnymeme', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(284, 'COMEDY HASHTAG', '#funnyshit', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(285, 'COMEDY HASHTAG', '#familyfun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(286, 'COMEDY HASHTAG', '#funk', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(287, 'COMEDY HASHTAG', '#havingfun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(288, 'COMEDY HASHTAG', '#summerfun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(289, 'COMEDY HASHTAG', '#funtime', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(290, 'COMEDY HASHTAG', '#havefun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(291, 'COMEDY HASHTAG', '#funkopop', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(292, 'COMEDY HASHTAG', '#funnypictures', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(293, 'COMEDY HASHTAG', '#funko', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(294, 'COMEDY HASHTAG', '#funinthesun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(295, 'COMEDY HASHTAG', '#itsmorefuninthephilippines', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(296, 'COMEDY HASHTAG', '#somuchfun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(297, 'COMEDY HASHTAG', '#instafunny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(298, 'COMEDY HASHTAG', '#functionaltraining', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(299, 'COMEDY HASHTAG', '#justforfun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(300, 'COMEDY HASHTAG', '#toofunny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(301, 'COMEDY HASHTAG', '#funnyposts', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(302, 'COMEDY HASHTAG', '#winterfun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(303, 'COMEDY HASHTAG', '#funcional', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(304, 'COMEDY HASHTAG', '#funnyvideo', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(305, 'COMEDY HASHTAG', '#funnight', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(306, 'COMEDY HASHTAG', '#fundraiser', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(307, 'COMEDY HASHTAG', '#funky', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(308, 'COMEDY HASHTAG', '#girlsjustwannahavefun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(309, 'COMEDY HASHTAG', '#weekendfun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(310, 'COMEDY HASHTAG', '#funnyaf', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(311, 'COMEDY HASHTAG', '#funnyquotes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(312, 'COMEDY HASHTAG', '#yogafun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(313, 'COMEDY HASHTAG', '#skateboardingisfun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(314, 'COMEDY HASHTAG', '#funnycat', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(315, 'COMEDY HASHTAG', '#comedyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(316, 'COMEDY HASHTAG', '#comedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(317, 'COMEDY HASHTAG', '#funnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(318, 'COMEDY HASHTAG', '#funny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(319, 'COMEDY HASHTAG', '#memes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(320, 'COMEDY HASHTAG', '#funnymemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(321, 'COMEDY HASHTAG', '#comedymemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(322, 'COMEDY HASHTAG', '#tiktok', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(323, 'COMEDY HASHTAG', '#trending', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(324, 'COMEDY HASHTAG', '#meme', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(325, 'COMEDY HASHTAG', '#viral', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(326, 'COMEDY HASHTAG', '#comedyvideo', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(327, 'COMEDY HASHTAG', '#fun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(328, 'COMEDY HASHTAG', '#comedyclub', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(329, 'COMEDY HASHTAG', '#instagram', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(330, 'COMEDY HASHTAG', '#memesdaily', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(331, 'COMEDY HASHTAG', '#love', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(332, 'COMEDY HASHTAG', '#follow', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(333, 'COMEDY HASHTAG', '#comedian', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(334, 'COMEDY HASHTAG', '#jokes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(335, 'COMEDY HASHTAG', '#comedyshow', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(336, 'COMEDY HASHTAG', '#explorepage', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(337, 'COMEDY HASHTAG', '#funnyvideo', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(338, 'COMEDY HASHTAG', '#laugh', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(339, 'COMEDY HASHTAG', '#lol', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(340, 'COMEDY HASHTAG', '#like', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(341, 'COMEDY HASHTAG', '#dankmemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(342, 'COMEDY HASHTAG', '#instagood', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(343, 'COMEDY HASHTAG', '#funnyshit', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(344, 'COMEDY HASHTAG', '#explore', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(345, 'COMEDY HASHTAG', '#humor', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(346, 'COMEDY HASHTAG', '#youtube', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(347, 'COMEDY HASHTAG', '#viralvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(348, 'COMEDY HASHTAG', '#likes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(349, 'COMEDY HASHTAG', '#followforfollowback', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(350, 'COMEDY HASHTAG', '#comedycentral', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(351, 'COMEDY HASHTAG', '#video', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(352, 'COMEDY HASHTAG', '#india', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(353, 'COMEDY HASHTAG', '#comedyposts', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(354, 'COMEDY HASHTAG', '#lmao', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(355, 'COMEDY HASHTAG', '#comedians', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(356, 'COMEDY HASHTAG', '#standupcomedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(357, 'COMEDY HASHTAG', '#funnymeme', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(358, 'COMEDY HASHTAG', '#vines', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(359, 'COMEDY HASHTAG', '#tiktokindia', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(360, 'COMEDY HASHTAG', '#bollywood', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(361, 'COMEDY HASHTAG', '#tundeednut', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(362, 'COMEDY HASHTAG', '#likeforlikes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(363, 'COMEDY HASHTAG', '#comment', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(364, 'COMEDY HASHTAG', '#gujju', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(365, 'COMEDY HASHTAG', '#actor', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(366, 'COMEDY HASHTAG', '#followback', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(367, 'COMEDY HASHTAG', '#funnyposts', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(368, 'COMEDY HASHTAG', '#reels', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(369, 'COMEDY HASHTAG', '#bhfyp', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(370, 'COMEDY HASHTAG', '#comedyvine', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(371, 'COMEDY HASHTAG', '#memepage', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(372, 'COMEDY HASHTAG', '#comedyskit', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(373, 'COMEDY HASHTAG', '#comedyreels', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(374, 'COMEDY HASHTAG', '#comedylife', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(375, 'COMEDY HASHTAG', '#comedyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(376, 'COMEDY HASHTAG', '#meme', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(377, 'COMEDY HASHTAG', '#viral', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(378, 'COMEDY HASHTAG', '#explorepage', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(379, 'COMEDY HASHTAG', '#india', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(380, 'COMEDY HASHTAG', '#likes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(381, 'COMEDY HASHTAG', '#followback', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(382, 'COMEDY HASHTAG', '#tiktok', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(383, 'COMEDY HASHTAG', '#trending', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(384, 'COMEDY HASHTAG', '#video', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(385, 'COMEDY HASHTAG', '#dankmemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(386, 'COMEDY HASHTAG', '#youtube', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(387, 'COMEDY HASHTAG', '#funnymemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(388, 'COMEDY HASHTAG', '#memesdaily', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(389, 'COMEDY HASHTAG', '#comment', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(390, 'COMEDY HASHTAG', '#humor', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(391, 'COMEDY HASHTAG', '#comedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(392, 'COMEDY HASHTAG', '#lmao', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(393, 'COMEDY HASHTAG', '#bollywood', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(394, 'COMEDY HASHTAG', '#actor', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(395, 'COMEDY HASHTAG', '#laugh', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(396, 'COMEDY HASHTAG', '#comedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(397, 'COMEDY HASHTAG', '#funny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(398, 'COMEDY HASHTAG', '#lol', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(399, 'COMEDY HASHTAG', '#love', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(400, 'COMEDY HASHTAG', '#memes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(401, 'COMEDY HASHTAG', '#music', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(402, 'COMEDY HASHTAG', '#meme', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(403, 'COMEDY HASHTAG', '#funnymemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(404, 'COMEDY HASHTAG', '#comedian', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(405, 'COMEDY HASHTAG', '#art', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(406, 'COMEDY HASHTAG', '#lmao', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(407, 'COMEDY HASHTAG', '#humor', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(408, 'COMEDY HASHTAG', '#jokes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(409, 'COMEDY HASHTAG', '#fun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(410, 'COMEDY HASHTAG', '#explore', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(411, 'COMEDY HASHTAG', '#follow', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(412, 'COMEDY HASHTAG', '#california', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(413, 'COMEDY HASHTAG', '#newyork', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(414, 'COMEDY HASHTAG', '#losangeles', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(415, 'COMEDY HASHTAG', '#laugh', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(416, 'COMEDY HASHTAG', '#hilarious', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(417, 'COMEDY HASHTAG', '#nyc', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(418, 'COMEDY HASHTAG', '#instagood', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(419, 'COMEDY HASHTAG', '#video', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(420, 'COMEDY HASHTAG', '#funnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(421, 'COMEDY HASHTAG', '#dankmemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(422, 'COMEDY HASHTAG', '#atlanta', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(423, 'COMEDY HASHTAG', '#chicago', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(424, 'COMEDY HASHTAG', '#memesdaily', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(425, 'COMEDY HASHTAG', '#hollywood', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(426, 'COMEDY HASHTAG', '#funnyclips', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(427, 'COMEDY HASHTAG', '#funyvideo', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(428, 'COMEDY HASHTAG', '#funniestvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(429, 'COMEDY HASHTAG', '#comedyvideo', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(430, 'COMEDY HASHTAG', '#hahaha', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(431, 'COMEDY HASHTAG', '#funnyvideoclips', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(432, 'COMEDY HASHTAG', '#funnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(433, 'COMEDY HASHTAG', '#funnypics', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(434, 'COMEDY HASHTAG', '#funny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(435, 'COMEDY HASHTAG', '#funnyfails', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(436, 'COMEDY HASHTAG', '#pandatheatre', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(437, 'COMEDY HASHTAG', '#panda', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(438, 'COMEDY HASHTAG', '#ipanda', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(439, 'COMEDY HASHTAG', '#animal', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(440, 'COMEDY HASHTAG', '#pet', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(441, 'COMEDY HASHTAG', '#adorable', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(442, 'COMEDY HASHTAG', '#china', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(443, 'COMEDY HASHTAG', '#travel', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(444, 'COMEDY HASHTAG', '#cute', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(445, 'COMEDY HASHTAG', '#babypanda', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(446, 'COMEDY HASHTAG', '#videooftheday', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(447, 'COMEDY HASHTAG', '#sichuan', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(448, 'COMEDY HASHTAG', '#funnyvideo', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(449, 'COMEDY HASHTAG', '#animalvideo', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(450, 'COMEDY HASHTAG', '#cuteness', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(451, 'COMEDY HASHTAG', '#cutenessoverloadmy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(452, 'COMEDY HASHTAG', '#cutenessoverloadher', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(453, 'COMEDY HASHTAG', '#rookiefeed_follow', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(454, 'COMEDY HASHTAG', '#instadog', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(455, 'COMEDY HASHTAG', '#funnyvids', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(456, 'COMEDY HASHTAG', '#funnyvideo', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(457, 'COMEDY HASHTAG', '#funny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(458, 'COMEDY HASHTAG', '#funnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(459, 'COMEDY HASHTAG', '#lol', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(460, 'COMEDY HASHTAG', '#memes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(461, 'COMEDY HASHTAG', '#meme', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(462, 'COMEDY HASHTAG', '#comedy', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(463, 'COMEDY HASHTAG', '#funnymemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(464, 'COMEDY HASHTAG', '#fun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(465, 'COMEDY HASHTAG', '#memesdaily', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(466, 'COMEDY HASHTAG', '#funnymeme', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(467, 'COMEDY HASHTAG', '#lmao', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(468, 'COMEDY HASHTAG', '#dankmemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(469, 'COMEDY HASHTAG', '#funnyshit', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(470, 'COMEDY HASHTAG', '#video', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(471, 'COMEDY HASHTAG', '#viral', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(472, 'COMEDY HASHTAG', '#funnyposts', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(473, 'COMEDY HASHTAG', '#humor', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(474, 'COMEDY HASHTAG', '#laugh', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(475, 'COMEDY HASHTAG', '#instagood', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(476, 'COMEDY HASHTAG', '#videos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(477, 'COMEDY HASHTAG', '#funnyclips', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(478, 'COMEDY HASHTAG', '#comedyvideo', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(479, 'COMEDY HASHTAG', '#music', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(480, 'COMEDY HASHTAG', '#hilarious', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(481, 'COMEDY HASHTAG', '#follow', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(482, 'COMEDY HASHTAG', '#followme', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(483, 'COMEDY HASHTAG', '#funnyaf', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(484, 'COMEDY HASHTAG', '#baseball', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(485, 'COMEDY HASHTAG', '#lmfao', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(486, 'COMEDY HASHTAG', '#funnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(487, 'COMEDY HASHTAG', '#funnyvideosdaily', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(488, 'COMEDY HASHTAG', '#funnyvideosclips', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(489, 'COMEDY HASHTAG', '#pubgfunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(490, 'COMEDY HASHTAG', '#btsfunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(491, 'COMEDY HASHTAG', '#punjabifunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(492, 'COMEDY HASHTAG', '#telugufunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(493, 'COMEDY HASHTAG', '#tiktokfunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(494, 'COMEDY HASHTAG', '#funnyvideosv', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(495, 'COMEDY HASHTAG', '#indianfunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(496, 'COMEDY HASHTAG', '#leagueoflegendsfunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(497, 'COMEDY HASHTAG', '#funnyvideosclip', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(498, 'COMEDY HASHTAG', '#kannadafunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(499, 'COMEDY HASHTAG', '#afghanfunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(500, 'COMEDY HASHTAG', '#marathifunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(501, 'COMEDY HASHTAG', '#kevinhartfunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(502, 'COMEDY HASHTAG', '#dogfunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(503, 'COMEDY HASHTAG', '#bestfunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(504, 'COMEDY HASHTAG', '#funnyvideos2018', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(505, 'COMEDY HASHTAG', '#funnyvideoshiphop', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(506, 'COMEDY HASHTAG', '#funnyvideos2019', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(507, 'COMEDY HASHTAG', '#hindifunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(508, 'COMEDY HASHTAG', '#funnyvideosandmemes_', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(509, 'COMEDY HASHTAG', '#naijafunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(510, 'COMEDY HASHTAG', '#funnyvideoslel', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(511, 'COMEDY HASHTAG', '#tamilfunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(512, 'COMEDY HASHTAG', '#desifunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(513, 'COMEDY HASHTAG', '#funnyvideosever', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(514, 'COMEDY HASHTAG', '#funnyvideostags', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(515, 'COMEDY HASHTAG', '#pakistanifunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(516, 'COMEDY HASHTAG', '#funnyvideoswithsuaven2g', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(517, 'COMEDY HASHTAG', '#blackfunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(518, 'COMEDY HASHTAG', '#funnyvideosmemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(519, 'COMEDY HASHTAG', '#funnyvideosinhindi', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(520, 'COMEDY HASHTAG', '#funnyvideoshd', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(521, 'COMEDY HASHTAG', '#kidsfunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(522, 'COMEDY HASHTAG', '#funnyvideos2020', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(523, 'COMEDY HASHTAG', '#funnyvideosdownload', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(524, 'COMEDY HASHTAG', '#fortnitefunnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(525, 'COMEDY HASHTAG', '#funnyvideos2017', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(526, 'COMEDY HASHTAG', '#funny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(527, 'COMEDY HASHTAG', '#funnymemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(528, 'COMEDY HASHTAG', '#funnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(529, 'COMEDY HASHTAG', '#funnymeme', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(530, 'COMEDY HASHTAG', '#funnyshit', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(531, 'COMEDY HASHTAG', '#funnypictures', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(532, 'COMEDY HASHTAG', '#instafunny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(533, 'COMEDY HASHTAG', '#toofunny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(534, 'COMEDY HASHTAG', '#funnyposts', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(535, 'COMEDY HASHTAG', '#funnyvideo', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(536, 'COMEDY HASHTAG', '#funnyaf', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(537, 'COMEDY HASHTAG', '#funnyquotes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(538, 'COMEDY HASHTAG', '#funnycat', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(539, 'COMEDY HASHTAG', '#funnypics', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(540, 'COMEDY HASHTAG', '#ifunny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(541, 'COMEDY HASHTAG', '#funnyface', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(542, 'COMEDY HASHTAG', '#pubgfunny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(543, 'COMEDY HASHTAG', '#funnyfaces', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(544, 'COMEDY HASHTAG', '#funnydog', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(545, 'COMEDY HASHTAG', '#sofunny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(546, 'COMEDY HASHTAG', '#funnytumblr', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(547, 'COMEDY HASHTAG', '#funnycats', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(548, 'COMEDY HASHTAG', '#funnymoments', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(549, 'COMEDY HASHTAG', '#funnypic', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(550, 'COMEDY HASHTAG', '#fortnitefunny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(551, 'COMEDY HASHTAG', '#funnypost', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(552, 'COMEDY HASHTAG', '#funnydogs', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(553, 'COMEDY HASHTAG', '#tumblrfunny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(554, 'COMEDY HASHTAG', '#funnytextpost', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(555, 'COMEDY HASHTAG', '#funnymemesdaily', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(556, 'COMEDY HASHTAG', '#pubgfunnymoments', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(557, 'COMEDY HASHTAG', '#funnyanimals', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(558, 'COMEDY HASHTAG', '#funnyday', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(559, 'COMEDY HASHTAG', '#funnystuff', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(560, 'COMEDY HASHTAG', '#funnytextposts', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(561, 'COMEDY HASHTAG', '#funnyjokes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(562, 'COMEDY HASHTAG', '#funnyvines', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(563, 'COMEDY HASHTAG', '#funnygirl', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(564, 'COMEDY HASHTAG', '#funnyvids', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(565, 'COMEDY HASHTAG', '#funnypicture', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(566, 'COMEDY HASHTAG', '#fun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(567, 'COMEDY HASHTAG', '#funny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(568, 'COMEDY HASHTAG', '#sundayfunday', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(569, 'COMEDY HASHTAG', '#funnymemes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(570, 'COMEDY HASHTAG', '#funtimes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(571, 'COMEDY HASHTAG', '#funnyvideos', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(572, 'COMEDY HASHTAG', '#instafun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(573, 'COMEDY HASHTAG', '#funday', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(574, 'COMEDY HASHTAG', '#funnymeme', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(575, 'COMEDY HASHTAG', '#funnyshit', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(576, 'COMEDY HASHTAG', '#familyfun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(577, 'COMEDY HASHTAG', '#funk', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(578, 'COMEDY HASHTAG', '#havingfun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(579, 'COMEDY HASHTAG', '#summerfun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(580, 'COMEDY HASHTAG', '#funtime', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(581, 'COMEDY HASHTAG', '#havefun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(582, 'COMEDY HASHTAG', '#funkopop', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(583, 'COMEDY HASHTAG', '#funnypictures', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(584, 'COMEDY HASHTAG', '#funko', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(585, 'COMEDY HASHTAG', '#funinthesun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(586, 'COMEDY HASHTAG', '#itsmorefuninthephilippines', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(587, 'COMEDY HASHTAG', '#somuchfun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(588, 'COMEDY HASHTAG', '#instafunny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(589, 'COMEDY HASHTAG', '#functionaltraining', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(590, 'COMEDY HASHTAG', '#justforfun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(591, 'COMEDY HASHTAG', '#toofunny', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(592, 'COMEDY HASHTAG', '#funnyposts', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(593, 'COMEDY HASHTAG', '#winterfun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(594, 'COMEDY HASHTAG', '#funcional', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(595, 'COMEDY HASHTAG', '#funnyvideo', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(596, 'COMEDY HASHTAG', '#funnight', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(597, 'COMEDY HASHTAG', '#fundraiser', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(598, 'COMEDY HASHTAG', '#funky', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(599, 'COMEDY HASHTAG', '#girlsjustwannahavefun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(600, 'COMEDY HASHTAG', '#weekendfun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(601, 'COMEDY HASHTAG', '#funnyaf', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(602, 'COMEDY HASHTAG', '#funnyquotes', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(603, 'COMEDY HASHTAG', '#yogafun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(604, 'COMEDY HASHTAG', '#skateboardingisfun', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(605, 'COMEDY HASHTAG', '#funnycat', NULL, NULL, '2024-05-31 12:11:37', '2024-05-31 12:11:37'),
(606, 'FITNESS', '#fitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16');
INSERT INTO `categories` (`id`, `title`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(607, 'FITNESS', '#fitnessmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(608, 'FITNESS', '#fitnessmodel', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(609, 'FITNESS', '#fitnessaddict', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(610, 'FITNESS', '#fitnessgirl', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(611, 'FITNESS', '#fitnessjourney', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(612, 'FITNESS', '#instafitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(613, 'FITNESS', '#fitnesslife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(614, 'FITNESS', '#fitnesslifestyle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(615, 'FITNESS', '#fitnessgoals', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(616, 'FITNESS', '#igfitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(617, 'FITNESS', '#fitnessfreak', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(618, 'FITNESS', '#fitnessfood', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(619, 'FITNESS', '#fitnessgear', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(620, 'FITNESS', '#polefitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(621, 'FITNESS', '#bodyfitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(622, 'FITNESS', '#bikinifitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(623, 'FITNESS', '#zumbafitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(624, 'FITNESS', '#instagramfitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(625, 'FITNESS', '#modafitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(626, 'FITNESS', '#fitnessgirls', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(627, 'FITNESS', '#fitnessfreaks', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(628, 'FITNESS', '#gayfitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(629, 'FITNESS', '#healthandfitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(630, 'FITNESS', '#fitnessbody', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(631, 'FITNESS', '#fitnesscoach', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(632, 'FITNESS', '#fitnessblogger', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(633, 'FITNESS', '#myfitnesspal', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(634, 'FITNESS', '#fitnesstrainer', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(635, 'FITNESS', '#fitnessmodels', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(636, 'FITNESS', '#fitnessphysique', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(637, 'FITNESS', '#fitnesswomen', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(638, 'FITNESS', '#anytimefitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(639, 'FITNESS', '#functionalfitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(640, 'FITNESS', '#veganfitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(641, 'FITNESS', '#lafitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(642, 'FITNESS', '#planetfitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(643, 'FITNESS', '#mensfitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(644, 'FITNESS', '#fitnessfirst', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(645, 'FITNESS', '#fitnessfun', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(646, 'FITNESS', '#gym', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(647, 'FITNESS', '#gymlife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(648, 'FITNESS', '#edgymemes', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(649, 'FITNESS', '#gymmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(650, 'FITNESS', '#gymrat', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(651, 'FITNESS', '#gymtime', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(652, 'FITNESS', '#gymnastics', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(653, 'FITNESS', '#gymshark', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(654, 'FITNESS', '#gymflow', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(655, 'FITNESS', '#gymgirl', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(656, 'FITNESS', '#edgymeme', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(657, 'FITNESS', '#gymaddict', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(658, 'FITNESS', '#gymnast', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(659, 'FITNESS', '#gymfreak', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(660, 'FITNESS', '#gymwear', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(661, 'FITNESS', '#gymselfie', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(662, 'FITNESS', '#homegym', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(663, 'FITNESS', '#goldsgym', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(664, 'FITNESS', '#edgymemesforedgyteens', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(665, 'FITNESS', '#gymlifestyle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(666, 'FITNESS', '#instagym', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(667, 'FITNESS', '#gymjunkie', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(668, 'FITNESS', '#gymmemes', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(669, 'FITNESS', '#gymlove', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(670, 'FITNESS', '#gymsharkwomen', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(671, 'FITNESS', '#gymaholic', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(672, 'FITNESS', '#gymgirls', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(673, 'FITNESS', '#gymlover', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(674, 'FITNESS', '#gymnastic', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(675, 'FITNESS', '#gymfit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(676, 'FITNESS', '#garagegym', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(677, 'FITNESS', '#gymrats', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(678, 'FITNESS', '#gymclothes', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(679, 'FITNESS', '#gymislife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(680, 'FITNESS', '#gymfood', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(681, 'FITNESS', '#gymgear', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(682, 'FITNESS', '#rhythmicgymnastics', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(683, 'FITNESS', '#gymboree', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(684, 'FITNESS', '#gymbunny', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(685, 'FITNESS', '#gaygym', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(686, 'FITNESS', '#workout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(687, 'FITNESS', '#workoutmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(688, 'FITNESS', '#workouts', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(689, 'FITNESS', '#streetworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(690, 'FITNESS', '#homeworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(691, 'FITNESS', '#preworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(692, 'FITNESS', '#postworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(693, 'FITNESS', '#workouttime', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(694, 'FITNESS', '#workoutroutine', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(695, 'FITNESS', '#absworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(696, 'FITNESS', '#backworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(697, 'FITNESS', '#coreworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(698, 'FITNESS', '#hiitworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(699, 'FITNESS', '#morningworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(700, 'FITNESS', '#homeworkouts', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(701, 'FITNESS', '#workoutathome', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(702, 'FITNESS', '#legworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(703, 'FITNESS', '#cardioworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(704, 'FITNESS', '#workoutoftheday', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(705, 'FITNESS', '#iworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(706, 'FITNESS', '#girlswhoworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(707, 'FITNESS', '#chestworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(708, 'FITNESS', '#workoutvideo', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(709, 'FITNESS', '#shoulderworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(710, 'FITNESS', '#bootyworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(711, 'FITNESS', '#fullbodyworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(712, 'FITNESS', '#workoutwednesday', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(713, 'FITNESS', '#workoutvideos', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(714, 'FITNESS', '#bodyweightworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(715, 'FITNESS', '#workoutfit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(716, 'FITNESS', '#athomeworkouts', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(717, 'FITNESS', '#athomeworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(718, 'FITNESS', '#postworkoutmeal', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(719, 'FITNESS', '#afterworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(720, 'FITNESS', '#abworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(721, 'FITNESS', '#gymworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(722, 'FITNESS', '#armworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(723, 'FITNESS', '#workoutflow', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(724, 'FITNESS', '#workoutclothes', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(725, 'FITNESS', '#calisthenicsworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(726, 'FITNESS', '#workout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(727, 'FITNESS', '#workoutmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(728, 'FITNESS', '#workouts', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(729, 'FITNESS', '#streetworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(730, 'FITNESS', '#homeworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(731, 'FITNESS', '#preworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(732, 'FITNESS', '#postworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(733, 'FITNESS', '#workouttime', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(734, 'FITNESS', '#workoutroutine', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(735, 'FITNESS', '#absworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(736, 'FITNESS', '#backworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(737, 'FITNESS', '#coreworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(738, 'FITNESS', '#hiitworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(739, 'FITNESS', '#morningworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(740, 'FITNESS', '#homeworkouts', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(741, 'FITNESS', '#workoutathome', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(742, 'FITNESS', '#legworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(743, 'FITNESS', '#cardioworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(744, 'FITNESS', '#workoutoftheday', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(745, 'FITNESS', '#iworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(746, 'FITNESS', '#girlswhoworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(747, 'FITNESS', '#chestworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(748, 'FITNESS', '#workoutvideo', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(749, 'FITNESS', '#shoulderworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(750, 'FITNESS', '#bootyworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(751, 'FITNESS', '#fullbodyworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(752, 'FITNESS', '#workoutwednesday', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(753, 'FITNESS', '#workoutvideos', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(754, 'FITNESS', '#bodyweightworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(755, 'FITNESS', '#workoutfit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(756, 'FITNESS', '#athomeworkouts', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(757, 'FITNESS', '#athomeworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(758, 'FITNESS', '#postworkoutmeal', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(759, 'FITNESS', '#afterworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(760, 'FITNESS', '#abworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(761, 'FITNESS', '#gymworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(762, 'FITNESS', '#armworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(763, 'FITNESS', '#workoutflow', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(764, 'FITNESS', '#workoutclothes', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(765, 'FITNESS', '#calisthenicsworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(766, 'FITNESS', '#fitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(767, 'FITNESS', '#fit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(768, 'FITNESS', '#fitfam', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(769, 'FITNESS', '#outfit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(770, 'FITNESS', '#fitnessmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(771, 'FITNESS', '#fitspo', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(772, 'FITNESS', '#crossfit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(773, 'FITNESS', '#outfitoftheday', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(774, 'FITNESS', '#instafit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(775, 'FITNESS', '#fitnessmodel', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(776, 'FITNESS', '#graffiti', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(777, 'FITNESS', '#fitnessaddict', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(778, 'FITNESS', '#fitlife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(779, 'FITNESS', '#getfit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(780, 'FITNESS', '#fitgirl', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(781, 'FITNESS', '#fitnessgirl', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(782, 'FITNESS', '#fitmom', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(783, 'FITNESS', '#fitnessjourney', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(784, 'FITNESS', '#fitspiration', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(785, 'FITNESS', '#instafitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(786, 'FITNESS', '#fitgirls', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(787, 'FITNESS', '#fitnesslife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(788, 'FITNESS', '#fitfood', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(789, 'FITNESS', '#outfits', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(790, 'FITNESS', '#fitnesslifestyle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(791, 'FITNESS', '#outfitpost', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(792, 'FITNESS', '#outfitinspiration', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(793, 'FITNESS', '#graffitiart', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(794, 'FITNESS', '#fitnessgoals', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(795, 'FITNESS', '#fitchick', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(796, 'FITNESS', '#igfitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(797, 'FITNESS', '#fitnessfreak', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(798, 'FITNESS', '#todaysoutfit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(799, 'FITNESS', '#outfitinspo', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(800, 'FITNESS', '#fitnessfood', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(801, 'FITNESS', '#stayfit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(802, 'FITNESS', '#fitchicks', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(803, 'FITNESS', '#igfit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(804, 'FITNESS', '#outfitideas', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(805, 'FITNESS', '#crossfitgirls', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(806, 'FITNESS', '#fitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(807, 'FITNESS', '#gym', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(808, 'FITNESS', '#workout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(809, 'FITNESS', '#fitnessmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(810, 'FITNESS', '#fit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(811, 'FITNESS', '#motivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(812, 'FITNESS', '#bodybuilding', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(813, 'FITNESS', '#training', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(814, 'FITNESS', '#health', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(815, 'FITNESS', '#fitfam', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(816, 'FITNESS', '#healthylifestyle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(817, 'FITNESS', '#love', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(818, 'FITNESS', '#lifestyle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(819, 'FITNESS', '#gymlife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(820, 'FITNESS', '#gymmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(821, 'FITNESS', '#sport', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(822, 'FITNESS', '#instagood', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(823, 'FITNESS', '#healthy', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(824, 'FITNESS', '#muscle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(825, 'FITNESS', '#personaltrainer', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(826, 'FITNESS', '#crossfit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(827, 'FITNESS', '#fitnessmodel', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(828, 'FITNESS', '#exercise', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(829, 'FITNESS', '#weightloss', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(830, 'FITNESS', '#fitnessjourney', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(831, 'FITNESS', '#fashion', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(832, 'FITNESS', '#instagram', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(833, 'FITNESS', '#wellness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(834, 'FITNESS', '#model', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(835, 'FITNESS', '#yoga', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(836, 'FITNESS', '#Yoga', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(837, 'FITNESS', '#Yogi', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(838, 'FITNESS', '#Yogalife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(839, 'FITNESS', '#Yogalove', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(840, 'FITNESS', '#Yogainspiration', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(841, 'FITNESS', '#Yogafit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(842, 'FITNESS', '#Yogaeverydamnday', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(843, 'FITNESS', '#Yogalove', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(844, 'FITNESS', '#Yogagirl', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(845, 'FITNESS', '#Yogagram', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(846, 'FITNESS', '#Yogaeverywhere', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(847, 'FITNESS', '#Ashtanga', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(848, 'FITNESS', '#Asana', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(849, 'FITNESS', '#Vinyasa', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(850, 'FITNESS', '#Bhakti', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(851, 'FITNESS', '#Pranayama', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(852, 'FITNESS', '#YogaFlow', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(853, 'FITNESS', '#YogaChallenge', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(854, 'FITNESS', '#Yogapants', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(855, 'FITNESS', '#Yogaposes', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(856, 'FITNESS', '#SelfLove', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(857, 'FITNESS', '#Namaste', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(858, 'FITNESS', '#Flexibility', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(859, 'FITNESS', '#PracticeDaily', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(860, 'FITNESS', '#Meditation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(861, 'FITNESS', '#YogisOfIG', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(862, 'FITNESS', '#Yogaholic', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(863, 'FITNESS', '#BendDontBreak', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(864, 'FITNESS', '#MyYogaLife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(865, 'FITNESS', '#SelfPractice', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(866, 'FITNESS', '#Workout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(867, 'FITNESS', '#Workouts', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(868, 'FITNESS', '#Workoutmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(869, 'FITNESS', '#Gym', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(870, 'FITNESS', '#Gymlife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(871, 'FITNESS', '#Gymmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(872, 'FITNESS', '#Gymtime', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(873, 'FITNESS', '#Gymrat', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(874, 'FITNESS', '#Physique', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(875, 'FITNESS', '#Shredded', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(876, 'FITNESS', '#Ripped', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(877, 'FITNESS', '#Gainz', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(878, 'FITNESS', '#Gains', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(879, 'FITNESS', '#Gymjunkie', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(880, 'FITNESS', '#Gymaddict', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(881, 'FITNESS', '#GirlsWhoLift', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(882, 'FITNESS', '#Workoutvideos', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(883, 'FITNESS', '#Workhardplayhard', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(884, 'FITNESS', '#Workoutroutine', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(885, 'FITNESS', '#Workouttime', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(886, 'FITNESS', '#Workoutclothes', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(887, 'FITNESS', '#Gymfit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(888, 'FITNESS', '#Muscle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(889, 'FITNESS', '#Train', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(890, 'FITNESS', '#Training', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(891, 'FITNESS', '#NoPainNoGain', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(892, 'FITNESS', '#GetStrong', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(893, 'FITNESS', '#Trainingday', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(894, 'FITNESS', '#TrainHard', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(895, 'FITNESS', '#Bodybuilding', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(896, 'FITNESS', '#Bodybuildingmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(897, 'FITNESS', '#Bodybuildinglifestlye', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(898, 'FITNESS', '#Strongwomen', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(899, 'FITNESS', '#Powerlifter', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(900, 'FITNESS', '#Powerbuilding', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(901, 'FITNESS', '#Liftingweights', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(902, 'FITNESS', '#Weightlifting', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(903, 'FITNESS', '#Olympiclifting', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(904, 'FITNESS', '#Olympicweightlifting', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(905, 'FITNESS', '#Powerliftingmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(906, 'FITNESS', '#Squats', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(907, 'FITNESS', '#Benchpress', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(908, 'FITNESS', '#Absworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(909, 'FITNESS', '#Legworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(910, 'FITNESS', '#Legday', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(911, 'FITNESS', '#ChestDay', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(912, 'FITNESS', '#Backday', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(913, 'FITNESS', '#Arms', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(914, 'FITNESS', '#Shoulderworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(915, 'FITNESS', '#Glutes', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(916, 'FITNESS', '#Lats', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(917, 'FITNESS', '#Pullups', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(918, 'FITNESS', '#Deadlift', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(919, 'FITNESS', '#Biceps', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(920, 'FITNESS', '#Running', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(921, 'FITNESS', '#Run', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(922, 'FITNESS', '#RunnersOfInstagram', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(923, 'FITNESS', '#FurtherFasterStronger', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(924, 'FITNESS', '#RunningMotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(925, 'FITNESS', '#Marathon', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(926, 'FITNESS', '#MarathonTraining', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(927, 'FITNESS', '#SeenOnMyRun', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(928, 'FITNESS', '#TrailRunning', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(929, 'FITNESS', '#InstaRunners', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(930, 'FITNESS', '#CrossCountry', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(931, 'FITNESS', '#Instarunners', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(932, 'FITNESS', '#LoveRunning', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(933, 'FITNESS', '#RunnerLife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(934, 'FITNESS', '#RunningCommunity', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(935, 'FITNESS', '#RunningShoes', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(936, 'FITNESS', '#RunItFast', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(937, 'FITNESS', '#fitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(938, 'FITNESS', '#igfitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(939, 'FITNESS', '#fitnessplayground', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(940, 'FITNESS', '#gymlife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(941, 'FITNESS', '#workingout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(942, 'FITNESS', '#fitnesspeople', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(943, 'FITNESS', '#fitnessgoals', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(944, 'FITNESS', '#followfit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(945, 'FITNESS', '#fithumans', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(946, 'FITNESS', '#fithour', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(947, 'FITNESS', '#fitnesstime', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(948, 'FITNESS', '#fitnesspowers', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(949, 'FITNESS', '#fitnesseducation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(950, 'FITNESS', '#fitnessclassroom', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(951, 'FITNESS', '#fitnessofinstagram', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(952, 'FITNESS', '#fitnessbased', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(953, 'FITNESS', '#fitnessthatlives', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(954, 'FITNESS', '#workout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(955, 'FITNESS', '#fitnessschool', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(956, 'FITNESS', '#fitnessfollow', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(957, 'FITNESS', '#gymnasium', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(958, 'FITNESS', '#fitnessisalifestyle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(959, 'FITNESS', '#gymlife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(960, 'FITNESS', '#workingout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(961, 'FITNESS', '#fitnesspeople', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(962, 'FITNESS', '#fitnessgoals', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(963, 'FITNESS', '#followfit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(964, 'FITNESS', '#fithumans', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(965, 'FITNESS', '#fithour', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(966, 'FITNESS', '#fitnesstime', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(967, 'FITNESS', '#fitfood', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(968, 'FITNESS', '#glutenfreefitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(969, 'FITNESS', '#healthyeating', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(970, 'FITNESS', '#healthyrecipes', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(971, 'FITNESS', '#fitnessnutrition', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(972, 'FITNESS', '#paleofitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(973, 'FITNESS', '#veganfitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(974, 'FITNESS', '#fitnessinstructor', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(975, 'FITNESS', '#fitnessknows', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(976, 'FITNESS', '#fitnessballroom', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(977, 'FITNESS', '#indoorfitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(978, 'FITNESS', '#fitnessittoday', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(979, 'FITNESS', '#fitnessglobal', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(980, 'FITNESS', '#fitnessexercise', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(981, 'FITNESS', '#fitnessyoga', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(982, 'FITNESS', '#calisthenics', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(983, 'FITNESS', '#physical', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(984, 'FITNESS', '#obesityends', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(985, 'FITNESS', '#fitnessrehearsal', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(986, 'FITNESS', '#fitnessexertion', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(987, 'FITNESS', '#sport', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(988, 'FITNESS', '#healthit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(989, 'FITNESS', '#fitnessworks', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(990, 'FITNESS', '#immune', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(991, 'FITNESS', '#fitnesssystem', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(992, 'FITNESS', '#fitnesssweat', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(993, 'FITNESS', '#fitnweight', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(994, 'FITNESS', '#fitnesspage', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(995, 'FITNESS', '#muscleit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(996, 'FITNESS', '#exercising', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(997, 'FITNESS', '#gym', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(998, 'FITNESS', '#gymshark', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(999, 'FITNESS', '#fashion', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1000, 'FITNESS', '#gymrat', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1001, 'FITNESS', '#gymflow', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1002, 'FITNESS', '#gymgirl', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1003, 'FITNESS', '#gymnasticsshoutouts', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1004, 'FITNESS', '#photooftheday', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1005, 'FITNESS', '#gymmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1006, 'FITNESS', '#fit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1007, 'FITNESS', '#fitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1008, 'FITNESS', '#fitnessmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1009, 'FITNESS', '#love', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1010, 'FITNESS', '#gymtime', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1011, 'FITNESS', '#gymaddict', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1012, 'FITNESS', '#gymlife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1013, 'FITNESS', '#training', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1014, 'FITNESS', '#bodybuilding', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1015, 'FITNESS', '#gymnastics', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1016, 'FITNESS', '#workout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1017, 'FITNESS', '#instagood', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1018, 'FITNESS', '#photography', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1019, 'FITNESS', '#muscle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1020, 'FITNESS', '#gymnast', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1021, 'FITNESS', '#fitspo', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1022, 'FITNESS', '#fitfam', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1023, 'FITNESS', '#motivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1024, 'FITNESS', '#gym', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1025, 'FITNESS', '#gymrat', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1026, 'FITNESS', '#physique', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1027, 'FITNESS', '#gymshark', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1028, 'FITNESS', '#girl', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1029, 'FITNESS', '#work', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1030, 'FITNESS', '#mondaymotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1031, 'FITNESS', '#strength', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1032, 'FITNESS', '#entrepreneur', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1033, 'FITNESS', '#fashion', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1034, 'FITNESS', '#life', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1035, 'FITNESS', '#fitlife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1036, 'FITNESS', '#personaltrainer', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1037, 'FITNESS', '#instamood', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1038, 'FITNESS', '#beauty', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1039, 'FITNESS', '#cardio', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1040, 'FITNESS', '#instafit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1041, 'FITNESS', '#buff', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1042, 'FITNESS', '#model', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1043, 'FITNESS', '#triceps', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1044, 'FITNESS', '#love', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1045, 'FITNESS', '#shredded', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1046, 'FITNESS', '#abs', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1047, 'FITNESS', '#train', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1048, 'FITNESS', '#lifestyle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1049, 'FITNESS', '#workout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1050, 'FITNESS', '#legday', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1051, 'FITNESS', '#healthy', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1052, 'FITNESS', '#homeworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1053, 'FITNESS', '#gym', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1054, 'FITNESS', '#gymsharktrain', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1055, 'FITNESS', '#gymclass', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1056, 'FITNESS', '#gymmemes', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1057, 'FITNESS', '#gymlife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1058, 'FITNESS', '#gymfamily', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1059, 'FITNESS', '#gymnasticsfails', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1060, 'FITNESS', '#gymislife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1061, 'FITNESS', '#gymleggings', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1062, 'FITNESS', '#gymnasticslife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1063, 'FITNESS', '#gymmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1064, 'FITNESS', '#gymlifestyle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1065, 'FITNESS', '#gymfreak', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1066, 'FITNESS', '#gymproblems', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1067, 'FITNESS', '#gyminspiration', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1068, 'FITNESS', '#gymgoals', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1069, 'FITNESS', '#gymclothes', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1070, 'FITNESS', '#gymnasticbodies', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1071, 'FITNESS', '#gymnasticsshoutouts', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1072, 'FITNESS', '#gymmom', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1073, 'FITNESS', '#gymsharkwomen', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1074, 'FITNESS', '#gymnastics', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1075, 'FITNESS', '#gymtips', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1076, 'FITNESS', '#gymqueen', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1077, 'FITNESS', '#gymadvice', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1078, 'FITNESS', '#gymgear', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1079, 'FITNESS', '#gymno', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1080, 'FITNESS', '#gymfood', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1081, 'FITNESS', '#gymgirl', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1082, 'FITNESS', '#gym', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1083, 'FITNESS', '#fitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1084, 'FITNESS', '#workout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1085, 'FITNESS', '#fit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1086, 'FITNESS', '#motivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1087, 'FITNESS', '#fitnessmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1088, 'FITNESS', '#gymlife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1089, 'FITNESS', '#bodybuilding', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1090, 'FITNESS', '#training', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1091, 'FITNESS', '#gymmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1092, 'FITNESS', '#muscle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1093, 'FITNESS', '#fitfam', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1094, 'FITNESS', '#photography', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1095, 'FITNESS', '#health', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1096, 'FITNESS', '#lifestyle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1097, 'FITNESS', '#abs', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1098, 'FITNESS', '#fitspo', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1099, 'FITNESS', '#instagram', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1100, 'FITNESS', '#healthy', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1101, 'FITNESS', '#life', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1102, 'FITNESS', '#sport', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1103, 'FITNESS', '#fitnessmodel', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1104, 'FITNESS', '#exercise', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1105, 'FITNESS', '#fitnesslife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1106, 'FITNESS', '#instagood', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1107, 'FITNESS', '#love', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1108, 'FITNESS', '#selfie', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1109, 'FITNESS', '#bodybuilder', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1110, 'FITNESS', '#fitnessaddict', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1111, 'FITNESS', '#gym', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1112, 'FITNESS', '#gymlife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1113, 'FITNESS', '#gymmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1114, 'FITNESS', '#gymtime', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1115, 'FITNESS', '#gymrat', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1116, 'FITNESS', '#gymnastics', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1117, 'FITNESS', '#gymshark', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1118, 'FITNESS', '#gymgirl', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1119, 'FITNESS', '#gymflow', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1120, 'FITNESS', '#gymaddict', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1121, 'FITNESS', '#gymnast', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1122, 'FITNESS', '#gymfreak', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1123, 'FITNESS', '#gymselfie', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1124, 'FITNESS', '#gymlifestyle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1125, 'FITNESS', '#gymlover', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1126, 'FITNESS', '#gymsharkwomen', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1127, 'FITNESS', '#gymmemes', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1128, 'FITNESS', '#gymjunkie', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1129, 'FITNESS', '#gymlove', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1130, 'FITNESS', '#gymgirls', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1131, 'FITNESS', '#gymclothes', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1132, 'FITNESS', '#gymrats', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1133, 'FITNESS', '#gymworkout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1134, 'FITNESS', '#fitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1135, 'FITNESS', '#abs', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1136, 'FITNESS', '#barbell', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1137, 'FITNESS', '#motivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1138, 'FITNESS', '#fitnesslifestyle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1139, 'FITNESS', '#fitnessmodel', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1140, 'FITNESS', '#fitnessjourney', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1141, 'FITNESS', '#fitnesslife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1142, 'FITNESS', '#love', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1143, 'FITNESS', '#fitnessgoals', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1144, 'FITNESS', '#fitnessmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1145, 'FITNESS', '#anaerobic', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1146, 'FITNESS', '#fashion', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1147, 'FITNESS', '#gymlife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1148, 'FITNESS', '#gym', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1149, 'FITNESS', '#fitnessfreak', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1150, 'FITNESS', '#aerobic', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1151, 'FITNESS', '#instagood', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1152, 'FITNESS', '#training', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1153, 'FITNESS', '#fitnessaddict', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1154, 'FITNESS', '#fitnessgirl', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1155, 'FITNESS', '#bodybuilding', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1156, 'FITNESS', '#fitfam', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1157, 'FITNESS', '#fit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1158, 'FITNESS', '#fitnessfood', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1159, 'FITNESS', '#workout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1160, 'FITNESS', '#fitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1161, 'FITNESS', '#yoga', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1162, 'FITNESS', '#happy', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1163, 'FITNESS', '#muscle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1164, 'FITNESS', '#gymmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16');
INSERT INTO `categories` (`id`, `title`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(1165, 'FITNESS', '#healthy', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1166, 'FITNESS', '#emagrecimento', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1167, 'FITNESS', '#nutrition', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1168, 'FITNESS', '#fitnessmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1169, 'FITNESS', '#photography', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1170, 'FITNESS', '#style', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1171, 'FITNESS', '#fitfamgermany', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1172, 'FITNESS', '#fitnessjourney', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1173, 'FITNESS', '#motivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1174, 'FITNESS', '#followforfollowback', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1175, 'FITNESS', '#cute', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1176, 'FITNESS', '#instagood', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1177, 'FITNESS', '#life', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1178, 'FITNESS', '#fitnessaddict', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1179, 'FITNESS', '#wellness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1180, 'FITNESS', '#love', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1181, 'FITNESS', '#sunset', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1182, 'FITNESS', '#shredded', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1183, 'FITNESS', '#personaltrainer', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1184, 'FITNESS', '#fitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1185, 'FITNESS', '#fitnesslifestyle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1186, 'FITNESS', '#fitnessjourney', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1187, 'FITNESS', '#fitnesslover', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1188, 'FITNESS', '#fitnessfood', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1189, 'FITNESS', '#fitnessgym', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1190, 'FITNESS', '#fitnesslife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1191, 'FITNESS', '#fitnessaddicted', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1192, 'FITNESS', '#fitnesschallenge', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1193, 'FITNESS', '#fitnessmodels', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1194, 'FITNESS', '#fitnessgirlsmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1195, 'FITNESS', '#fitnessgoal', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1196, 'FITNESS', '#fitnessjunkie', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1197, 'FITNESS', '#fitnessmalaysia', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1198, 'FITNESS', '#fitnesscoach', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1199, 'FITNESS', '#fitnessaddicts', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1200, 'FITNESS', '#fitnessquotes', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1201, 'FITNESS', '#fitnessinfluencer', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1202, 'FITNESS', '#fitnessclub', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1203, 'FITNESS', '#fitnessmotivations', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1204, 'FITNESS', '#fitnesspark', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1205, 'FITNESS', '#fitnessworld', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1206, 'FITNESS', '#fitnessvideos', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1207, 'FITNESS', '#fitnessgear', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1208, 'FITNESS', '#fitnesscolombia', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1209, 'FITNESS', '#fitnessphysique', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1210, 'FITNESS', '#fitnesstransformation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1211, 'FITNESS', '#fitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1212, 'FITNESS', '#gym', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1213, 'FITNESS', '#fitnessmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1214, 'FITNESS', '#workout', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1215, 'FITNESS', '#motivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1216, 'FITNESS', '#bodybuilding', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1217, 'FITNESS', '#fit', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1218, 'FITNESS', '#fitfam', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1219, 'FITNESS', '#training', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1220, 'FITNESS', '#love', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1221, 'FITNESS', '#gymlife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1222, 'FITNESS', '#instagood', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1223, 'FITNESS', '#fashion', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1224, 'FITNESS', '#follow', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1225, 'FITNESS', '#lifestyle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1226, 'FITNESS', '#healthy', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1227, 'FITNESS', '#healthylifestyle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1228, 'FITNESS', '#life', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1229, 'FITNESS', '#health', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1230, 'FITNESS', '#personaltrainer', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1231, 'FITNESS', '#sport', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1232, 'FITNESS', '#fitnessjourney', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1233, 'FITNESS', '#happy', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1234, 'FITNESS', '#fitness', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1235, 'FITNESS', '#fitnessmotivation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1236, 'FITNESS', '#fitnessmodel', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1237, 'FITNESS', '#fitnessaddict', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1238, 'FITNESS', '#fitnessgirl', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1239, 'FITNESS', '#fitnessjourney', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1240, 'FITNESS', '#fitnesslife', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1241, 'FITNESS', '#fitnesslifestyle', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1242, 'FITNESS', '#fitnessgoals', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1243, 'FITNESS', '#fitnessfreak', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1244, 'FITNESS', '#fitnessfood', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1245, 'FITNESS', '#fitnessgear', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1246, 'FITNESS', '#fitnesscoach', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1247, 'FITNESS', '#fitnessbody', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1248, 'FITNESS', '#fitnessblogger', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1249, 'FITNESS', '#fitnessmodels', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1250, 'FITNESS', '#fitnesstips', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1251, 'FITNESS', '#fitnessphysique', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1252, 'FITNESS', '#fitnesswear', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1253, 'FITNESS', '#fitnesslover', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1254, 'FITNESS', '#fitnessgoal', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1255, 'FITNESS', '#fitnessfirst', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1256, 'FITNESS', '#fitnesstransformation', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1257, 'FITNESS', '#fitnesslove', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1258, 'FITNESS', '#fitnessboy', NULL, NULL, '2024-05-31 12:12:16', '2024-05-31 12:12:16'),
(1259, 'FOOD VLOGING', '#foodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1260, 'FOOD VLOGING', '#foodvlog', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1261, 'FOOD VLOGING', '#foodvloger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1262, 'FOOD VLOGING', '#foodvlogs', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1263, 'FOOD VLOGING', '#foodvloggers', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1264, 'FOOD VLOGING', '#jakartafoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1265, 'FOOD VLOGING', '#indianfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1266, 'FOOD VLOGING', '#foodvloggerindonesia', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1267, 'FOOD VLOGING', '#foodvlogging', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1268, 'FOOD VLOGING', '#thefoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1269, 'FOOD VLOGING', '#foodvloggersurabaya', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1270, 'FOOD VLOGING', '#amyfoodvlogs', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1271, 'FOOD VLOGING', '#atlantafoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1272, 'FOOD VLOGING', '#mumbaifoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1273, 'FOOD VLOGING', '#pngfoodvlogs', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1274, 'FOOD VLOGING', '#veganfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1275, 'FOOD VLOGING', '#bukanfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1276, 'FOOD VLOGING', '#chizzysussexfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1277, 'FOOD VLOGING', '#canberrafoodvlog', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1278, 'FOOD VLOGING', '#cbrfoodvlog', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1279, 'FOOD VLOGING', '#disneyfoodvlog', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1280, 'FOOD VLOGING', '#veganfoodvlog', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1281, 'FOOD VLOGING', '#myfoodvlog', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1282, 'FOOD VLOGING', '#nigerianfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1283, 'FOOD VLOGING', '#png_foodvlogs', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1284, 'FOOD VLOGING', '#pakistanifoodvlogs', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1285, 'FOOD VLOGING', '#foodvloggger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1286, 'FOOD VLOGING', '#newfoodvlog', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1287, 'FOOD VLOGING', '#cebufoodvlog', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1288, 'FOOD VLOGING', '#torontofoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1289, 'FOOD VLOGING', '#instafoodvlogs', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1290, 'FOOD VLOGING', '#dubaifoodvlog', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1291, 'FOOD VLOGING', '#calicutfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1292, 'FOOD VLOGING', '#irishfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1293, 'FOOD VLOGING', '#japanesefoodvlog', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1294, 'FOOD VLOGING', '#foodvlogvlog', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1295, 'FOOD VLOGING', '#italianfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1296, 'FOOD VLOGING', '#ineedtostartmyownfoodvlog', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1297, 'FOOD VLOGING', '#returnofthesuperfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1298, 'FOOD VLOGING', '#pngfoodvlogs', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1299, 'FOOD VLOGING', '#foodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1300, 'FOOD VLOGING', '#foodvloggers', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1301, 'FOOD VLOGING', '#jakartafoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1302, 'FOOD VLOGING', '#indianfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1303, 'FOOD VLOGING', '#foodvloggerindonesia', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1304, 'FOOD VLOGING', '#thefoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1305, 'FOOD VLOGING', '#foodvloggersurabaya', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1306, 'FOOD VLOGING', '#atlantafoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1307, 'FOOD VLOGING', '#mumbaifoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1308, 'FOOD VLOGING', '#veganfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1309, 'FOOD VLOGING', '#bukanfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1310, 'FOOD VLOGING', '#chizzysussexfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1311, 'FOOD VLOGING', '#nigerianfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1312, 'FOOD VLOGING', '#torontofoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1313, 'FOOD VLOGING', '#calicutfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1314, 'FOOD VLOGING', '#irishfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1315, 'FOOD VLOGING', '#italianfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1316, 'FOOD VLOGING', '#returnofthesuperfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1317, 'FOOD VLOGING', '#swfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1318, 'FOOD VLOGING', '#greekfoodvloggers', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1319, 'FOOD VLOGING', '#greekfoodvlogger', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1320, 'FOOD VLOGING', '#foodvloggerâ', NULL, NULL, '2024-05-31 12:12:42', '2024-05-31 12:12:42'),
(1321, 'SUNSET', '#sunset', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1322, 'SUNSET', '#sunsets', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1323, 'SUNSET', '#sunsetlovers', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1324, 'SUNSET', '#sunset_pics', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1325, 'SUNSET', '#sunsetporn', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1326, 'SUNSET', '#sunsetlover', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1327, 'SUNSET', '#all_sunsets', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1328, 'SUNSET', '#sunset_madness', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1329, 'SUNSET', '#sunsetphotography', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1330, 'SUNSET', '#sunset_vision', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1331, 'SUNSET', '#sunset🌅', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1332, 'SUNSET', '#sunrise_sunsets_aroundworld', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1333, 'SUNSET', '#sunrise_and_sunsets', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1334, 'SUNSET', '#sunset_hub', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1335, 'SUNSET', '#sunsetbeach', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1336, 'SUNSET', '#sunsetsniper', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1337, 'SUNSET', '#sunset_ig', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1338, 'SUNSET', '#ig_sunsetshots', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1339, 'SUNSET', '#sunset_stream', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1340, 'SUNSET', '#instasunsets', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1341, 'SUNSET', '#sunrise_sunset_photogroup', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1342, 'SUNSET', '#sunsetsky', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1343, 'SUNSET', '#sunsethunter', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1344, 'SUNSET', '#super_photosunsets', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1345, 'SUNSET', '#instasunset', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1346, 'SUNSET', '#beautifulsunset', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1347, 'SUNSET', '#scenicsunset', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1348, 'SUNSET', '#ig_sunset', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1349, 'SUNSET', '#sunsetview', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1350, 'SUNSET', '#sunset_love', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1351, 'SUNSET', '#sunset_lovers', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1352, 'SUNSET', '#sunsets_oftheworld', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1353, 'SUNSET', '#igsunset', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1354, 'SUNSET', '#loves_skyandsunset', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1355, 'SUNSET', '#sunset_captures', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1356, 'SUNSET', '#sunsets_captures', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1357, 'SUNSET', '#sunset_lovee', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1358, 'SUNSET', '#bns_sunset', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1359, 'SUNSET', '#tgif_sunset', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1360, 'SUNSET', '#sunset_madness_', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1361, 'SUNSET', '#sunset', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1362, 'SUNSET', '#photography', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1363, 'SUNSET', '#sunsets', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1364, 'SUNSET', '#photo', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1365, 'SUNSET', '#sunsetporn', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1366, 'SUNSET', '#naturephotography', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1367, 'SUNSET', '#picoftheday', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1368, 'SUNSET', '#instagood', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1369, 'SUNSET', '#sunset_vision', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1370, 'SUNSET', '#sunset🌅', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1371, 'SUNSET', '#travel', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1372, 'SUNSET', '#sunset_pics', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1373, 'SUNSET', '#sunsetlover', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1374, 'SUNSET', '#sunsets_captures', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1375, 'SUNSET', '#sunsetlovers', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1376, 'SUNSET', '#sunset_madness', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1377, 'SUNSET', '#landscape', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1378, 'SUNSET', '#outdoors', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1379, 'SUNSET', '#art', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1380, 'SUNSET', '#summer', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1381, 'SUNSET', '#life', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1382, 'SUNSET', '#nature', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1383, 'SUNSET', '#sunset_hub', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1384, 'SUNSET', '#sky', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1385, 'SUNSET', '#sunsetphotography', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1386, 'SUNSET', '#sunsetsky', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1387, 'SUNSET', '#beautiful', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1388, 'SUNSET', '#sunset', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1389, 'SUNSET', '#sunsetporn', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1390, 'SUNSET', '#sunset_pics', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1391, 'SUNSET', '#art', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1392, 'SUNSET', '#sunset🌅', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1393, 'SUNSET', '#nature', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1394, 'SUNSET', '#travel', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1395, 'SUNSET', '#photography', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1396, 'SUNSET', '#fotografie', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1397, 'SUNSET', '#sunsetlovers', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1398, 'SUNSET', '#sunsets', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1399, 'SUNSET', '#naturephotography', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1400, 'SUNSET', '#sunset_vision', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1401, 'SUNSET', '#sunsetphotography', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1402, 'SUNSET', '#sunset_madness', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1403, 'SUNSET', '#sunset_ig', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1404, 'SUNSET', '#sunsetlover', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1405, 'SUNSET', '#landscape', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1406, 'SUNSET', '#beautiful', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1407, 'SUNSET', '#sunset_hub', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1408, 'SUNSET', '#fashion', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1409, 'SUNSET', '#photooftheday', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1410, 'SUNSET', '#love', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1411, 'SUNSET', '#landscapephotography', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1412, 'SUNSET', '#sky', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1413, 'SUNSET', '#instagood', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1414, 'SUNSET', '#instagram', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1415, 'SUNSET', '#sunset', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1416, 'SUNSET', '#travel', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1417, 'SUNSET', '#fitness', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1418, 'SUNSET', '#love', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1419, 'SUNSET', '#l', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1420, 'SUNSET', '#adventure', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1421, 'SUNSET', '#travelphotography', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1422, 'SUNSET', '#like', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1423, 'SUNSET', '#fotografie', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1424, 'SUNSET', '#ootd', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1425, 'SUNSET', '#fun', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1426, 'SUNSET', '#lol', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1427, 'SUNSET', '#explore', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1428, 'SUNSET', '#life', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1429, 'SUNSET', '#beautiful', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1430, 'SUNSET', '#photograph', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1431, 'SUNSET', '#igers', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1432, 'SUNSET', '#nikon', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1433, 'SUNSET', '#beauty', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1434, 'SUNSET', '#smile', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1435, 'SUNSET', '#canon', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1436, 'SUNSET', '#instahub', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1437, 'SUNSET', '#instagood', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1438, 'SUNSET', '#sunset', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1439, 'SUNSET', '#sunset_hunter', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1440, 'SUNSET', '#sunsets_captures', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1441, 'SUNSET', '#sunset🌅', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1442, 'SUNSET', '#sunset_ig', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1443, 'SUNSET', '#sunsetview', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1444, 'SUNSET', '#sunsetmag', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1445, 'SUNSET', '#sunsetting', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1446, 'SUNSET', '#sunset_love', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1447, 'SUNSET', '#sunsethunter', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1448, 'SUNSET', '#sunsetsnipers', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1449, 'SUNSET', '#sunset_captures', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1450, 'SUNSET', '#sunset_oftheworld', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1451, 'SUNSET', '#sunsetvideo', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1452, 'SUNSET', '#sunsetwedding', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1453, 'SUNSET', '#sunsetsea', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1454, 'SUNSET', '#sunsetlover', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1455, 'SUNSET', '#sunsetgram', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1456, 'SUNSET', '#sunsetlandscape', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1457, 'SUNSET', '#sunsetpic', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1458, 'SUNSET', '#sunsetoftheday', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1459, 'SUNSET', '#sunsetstrip', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1460, 'SUNSET', '#sunsetsky', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1461, 'SUNSET', '#sunsetclouds', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1462, 'SUNSET', '#sunset_universe', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1463, 'SUNSET', '#sunsetpainting', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1464, 'SUNSET', '#sunsetporn', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1465, 'SUNSET', '#sunsetaddict', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1466, 'SUNSET', '#sunset', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1467, 'SUNSET', '#sunset_hunter', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1468, 'SUNSET', '#sunsets_captures', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1469, 'SUNSET', '#sunset🌅', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1470, 'SUNSET', '#sunset_ig', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1471, 'SUNSET', '#sunsetview', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1472, 'SUNSET', '#sunsetmag', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1473, 'SUNSET', '#sunsetting', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1474, 'SUNSET', '#sunset_love', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1475, 'SUNSET', '#sunsethunter', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1476, 'SUNSET', '#sunsetsnipers', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1477, 'SUNSET', '#sunset_captures', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1478, 'SUNSET', '#sunset_oftheworld', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1479, 'SUNSET', '#sunsetvideo', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1480, 'SUNSET', '#sunsetwedding', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1481, 'SUNSET', '#sunsetsea', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1482, 'SUNSET', '#sunsetlover', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1483, 'SUNSET', '#sunsetgram', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1484, 'SUNSET', '#sunsetlandscape', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1485, 'SUNSET', '#sunsetpic', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1486, 'SUNSET', '#sunsetoftheday', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1487, 'SUNSET', '#sunsetstrip', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1488, 'SUNSET', '#sunsetsky', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1489, 'SUNSET', '#sunsetclouds', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1490, 'SUNSET', '#sunset_universe', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1491, 'SUNSET', '#sunsetpainting', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1492, 'SUNSET', '#sunsetporn', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1493, 'SUNSET', '#sunsetaddict', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1494, 'SUNSET', '#sunset', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1495, 'SUNSET', '#nature', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1496, 'SUNSET', '#travel', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1497, 'SUNSET', '#photography', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1498, 'SUNSET', '#landscape', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1499, 'SUNSET', '#photooftheday', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1500, 'SUNSET', '#naturephotography', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1501, 'SUNSET', '#beautiful', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1502, 'SUNSET', '#instagood', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1503, 'SUNSET', '#landscapephotography', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1504, 'SUNSET', '#sky', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1505, 'SUNSET', '#travelphotography', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1506, 'SUNSET', '#photo', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1507, 'SUNSET', '#naturelovers', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1508, 'SUNSET', '#art', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1509, 'SUNSET', '#clouds', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1510, 'SUNSET', '#photographer', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1511, 'SUNSET', '#picoftheday', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1512, 'SUNSET', '#mountains', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1513, 'SUNSET', '#love', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1514, 'SUNSET', '#summer', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1515, 'SUNSET', '#adventure', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1516, 'SUNSET', '#bhfyp', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1517, 'SUNSET', '#ig', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1518, 'SUNSET', '#sun', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1519, 'SUNSET', '#sunsetphotography', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1520, 'SUNSET', '#instagram', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1521, 'SUNSET', '#sunset', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1522, 'SUNSET', '#sunsets', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1523, 'SUNSET', '#sunsetlovers', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1524, 'SUNSET', '#sunsetphotography', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1525, 'SUNSET', '#sunset_pics', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1526, 'SUNSET', '#sunsetlover', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1527, 'SUNSET', '#sunsetporn', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1528, 'SUNSET', '#sunset_madness', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1529, 'SUNSET', '#sunset_vision', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1530, 'SUNSET', '#sunset🌅', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1531, 'SUNSET', '#sunset_hub', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1532, 'SUNSET', '#sunsetbeach', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1533, 'SUNSET', '#sunsetsniper', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1534, 'SUNSET', '#sunset_ig', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1535, 'SUNSET', '#sunset_stream', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1536, 'SUNSET', '#sunsetsky', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1537, 'SUNSET', '#sunsethunter', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1538, 'SUNSET', '#sunsets_captures', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1539, 'SUNSET', '#sunsetview', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1540, 'SUNSET', '#sunsets_oftheworld', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1541, 'SUNSET', '#sunset_love', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1542, 'SUNSET', '#sunset_lovers', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1543, 'SUNSET', '#sunsetgram', NULL, NULL, '2024-05-31 12:13:07', '2024-05-31 12:13:07'),
(1544, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1545, 'NATURE', '#naturephotography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1546, 'NATURE', '#naturelovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1547, 'NATURE', '#naturelover', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1548, 'NATURE', '#natureza', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1549, 'NATURE', '#instanature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1550, 'NATURE', '#mothernature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1551, 'NATURE', '#nature_perfection', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1552, 'NATURE', '#naturegram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1553, 'NATURE', '#nature_brilliance', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1554, 'NATURE', '#natureaddict', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1555, 'NATURE', '#lovenature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1556, 'NATURE', '#naturephoto', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1557, 'NATURE', '#nature_shooters', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1558, 'NATURE', '#naturelove', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1559, 'NATURE', '#natureporn', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1560, 'NATURE', '#natureshots', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1561, 'NATURE', '#nature_lovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1562, 'NATURE', '#vsconature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1563, 'NATURE', '#bestnatureshot', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1564, 'NATURE', '#rsa_nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1565, 'NATURE', '#beautifulnature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1566, 'NATURE', '#nature_seekers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1567, 'NATURE', '#ig_nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1568, 'NATURE', '#naturehippys', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1569, 'NATURE', '#instanaturelover', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1570, 'NATURE', '#nature_good', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1571, 'NATURE', '#nature_sultans', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1572, 'NATURE', '#natureonly', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1573, 'NATURE', '#naturewalk', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1574, 'NATURE', '#naturel', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1575, 'NATURE', '#fiftyshades_of_nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1576, 'NATURE', '#allnatureshots', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1577, 'NATURE', '#nature_wizards', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1578, 'NATURE', '#beautyofnature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1579, 'NATURE', '#naturebeauty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1580, 'NATURE', '#naturesbeauty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1581, 'NATURE', '#ig_naturelovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1582, 'NATURE', '#ilovenature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1583, 'NATURE', '#natureart', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1584, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1585, 'NATURE', '#travel', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1586, 'NATURE', '#photography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1587, 'NATURE', '#naturephotography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1588, 'NATURE', '#photooftheday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1589, 'NATURE', '#love', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1590, 'NATURE', '#beautiful', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1591, 'NATURE', '#instagood', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1592, 'NATURE', '#picoftheday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1593, 'NATURE', '#adventure', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1594, 'NATURE', '#landscape', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1595, 'NATURE', '#travelphotography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1596, 'NATURE', '#art', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1597, 'NATURE', '#summer', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1598, 'NATURE', '#sunset', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1599, 'NATURE', '#explore', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1600, 'NATURE', '#wanderlust', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1601, 'NATURE', '#beach', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1602, 'NATURE', '#travelgram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1603, 'NATURE', '#hiking', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1604, 'NATURE', '#instagram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1605, 'NATURE', '#outdoors', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1606, 'NATURE', '#naturelovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1607, 'NATURE', '#photo', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1608, 'NATURE', '#happy', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1609, 'NATURE', '#ocean', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1610, 'NATURE', '#mountains', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1611, 'NATURE', '#sky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1612, 'NATURE', '#california', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1613, 'NATURE', '#fashion', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1614, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1615, 'NATURE', '#photooftheday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1616, 'NATURE', '#photography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1617, 'NATURE', '#love', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1618, 'NATURE', '#travel', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1619, 'NATURE', '#instagood', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1620, 'NATURE', '#picoftheday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1621, 'NATURE', '#naturephotography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1622, 'NATURE', '#beautiful', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1623, 'NATURE', '#instagram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1624, 'NATURE', '#travelphotography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1625, 'NATURE', '#art', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1626, 'NATURE', '#summer', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1627, 'NATURE', '#landscape', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1628, 'NATURE', '#photo', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1629, 'NATURE', '#follow', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1630, 'NATURE', '#sky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1631, 'NATURE', '#bhfyp', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1632, 'NATURE', '#sunset', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1633, 'NATURE', '#fashion', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1634, 'NATURE', '#wanderlust', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1635, 'NATURE', '#ig', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1636, 'NATURE', '#india', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1637, 'NATURE', '#like', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1638, 'NATURE', '#travelgram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1639, 'NATURE', '#photographer', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1640, 'NATURE', '#mountains', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1641, 'NATURE', '#naturelovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1642, 'NATURE', '#happy', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1643, 'NATURE', '#instadaily', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1644, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1645, 'NATURE', '#naturephotography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1646, 'NATURE', '#instanature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1647, 'NATURE', '#instagramnature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1648, 'NATURE', '#naturelife', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1649, 'NATURE', '#naturel', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1650, 'NATURE', '#naturelovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1651, 'NATURE', '#naturepic', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1652, 'NATURE', '#natureshots', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1653, 'NATURE', '#naturekind', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1654, 'NATURE', '#natureatmosphere', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1655, 'NATURE', '#natureofinstagram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1656, 'NATURE', '#naturegram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1657, 'NATURE', '#natureart', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1658, 'NATURE', '#natureporn', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1659, 'NATURE', '#natureheals', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1660, 'NATURE', '#naturebeauty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1661, 'NATURE', '#naturepictures', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1662, 'NATURE', '#naturephotos', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1663, 'NATURE', '#naturetime', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1664, 'NATURE', '#naturepage', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1665, 'NATURE', '#naturepost', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1666, 'NATURE', '#natureaddict', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1667, 'NATURE', '#natureperfection', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1668, 'NATURE', '#natureseekers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1669, 'NATURE', '#landscape', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1670, 'NATURE', '#naturecontent', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1671, 'NATURE', '#naturephotograph', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1672, 'NATURE', '#naturefeel', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1673, 'NATURE', '#naturevibes', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1674, 'NATURE', '#wildlife', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1675, 'NATURE', '#creation', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1676, 'NATURE', '#cosmos', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1677, 'NATURE', '#world', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1678, 'NATURE', '#planet', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1679, 'NATURE', '#disposition', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1680, 'NATURE', '#quality', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1681, 'NATURE', '#fungus', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1682, 'NATURE', '#macrocosm', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1683, 'NATURE', '#animality', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1684, 'NATURE', '#latitude', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1685, 'NATURE', '#context', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1686, 'NATURE', '#ape', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1687, 'NATURE', '#manner', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1688, 'NATURE', '#sort', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1689, 'NATURE', '#subject', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1690, 'NATURE', '#naturalenvironment', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1691, 'NATURE', '#unique', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1692, 'NATURE', '#solarsystem', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1693, 'NATURE', '#ice', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1694, 'NATURE', '#extent', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1695, 'NATURE', '#essence', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1696, 'NATURE', '#causalagent', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1697, 'NATURE', '#northernhemisphere', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1698, 'NATURE', '#civilization', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1699, 'NATURE', '#ecology', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1700, 'NATURE', '#dna', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1701, 'NATURE', '#flora', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1702, 'NATURE', '#organism', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1703, 'NATURE', '#extinctionevent', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1704, 'NATURE', '#liquid', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1705, 'NATURE', '#holoceneextinction', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1706, 'NATURE', '#river', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1707, 'NATURE', '#ozonelayer', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1708, 'NATURE', '#pond', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1709, 'NATURE', '#wild', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1710, 'NATURE', '#ecosystem', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1711, 'NATURE', '#iceage', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1712, 'NATURE', '#genetics', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1713, 'NATURE', '#beauty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35');
INSERT INTO `categories` (`id`, `title`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(1714, 'NATURE', '#zoo', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1715, 'NATURE', '#latin', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1716, 'NATURE', '#animal', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1717, 'NATURE', '#current', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1718, 'NATURE', '#consciousness', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1719, 'NATURE', '#supernatural', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1720, 'NATURE', '#temperate', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1721, 'NATURE', '#equator', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1722, 'NATURE', '#tropical', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1723, 'NATURE', '#subtropical', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1724, 'NATURE', '#archaea', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1725, 'NATURE', '#crust', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1726, 'NATURE', '#mantle', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1727, 'NATURE', '#bacteria', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1728, 'NATURE', '#worldocean', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1729, 'NATURE', '#mining', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1730, 'NATURE', '#organisms', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1731, 'NATURE', '#complexion', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1732, 'NATURE', '#temperament', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1733, 'NATURE', '#cause', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1734, 'NATURE', '#type', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1735, 'NATURE', '#deposition', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1736, 'NATURE', '#physis', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1737, 'NATURE', '#sediment', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1738, 'NATURE', '#lava', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1739, 'NATURE', '#intrusion', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1740, 'NATURE', '#dike', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1741, 'NATURE', '#sill', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1742, 'NATURE', '#deformation', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1743, 'NATURE', '#metamorphism', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1744, 'NATURE', '#landform', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1745, 'NATURE', '#extension', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1746, 'NATURE', '#volcano', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1747, 'NATURE', '#habitat', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1748, 'NATURE', '#comet', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1749, 'NATURE', '#supercontinent', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1750, 'NATURE', '#pangaea', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1751, 'NATURE', '#illnatured', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1752, 'NATURE', '#goodnatured', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1753, 'NATURE', '#bird', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1754, 'NATURE', '#particular', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1755, 'NATURE', '#aspects', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1756, 'NATURE', '#dinosaur', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1757, 'NATURE', '#paleoclimatology', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1758, 'NATURE', '#mammal', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1759, 'NATURE', '#aspect', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1760, 'NATURE', '#lithification', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1761, 'NATURE', '#view', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1762, 'NATURE', '#algae', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1763, 'NATURE', '#important', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1764, 'NATURE', '#unusual', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1765, 'NATURE', '#true', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1766, 'NATURE', '#knowledge', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1767, 'NATURE', '#describe', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1768, 'NATURE', '#batholith', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1769, 'NATURE', '#laccolith', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1770, 'NATURE', '#gas', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1771, 'NATURE', '#rather', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1772, 'NATURE', '#perspective', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1773, 'NATURE', '#very', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1774, 'NATURE', '#common', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1775, 'NATURE', '#air', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1776, 'NATURE', '#particularly', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1777, 'NATURE', '#purely', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1778, 'NATURE', '#sense', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1779, 'NATURE', '#scientist', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1780, 'NATURE', '#nitrogen', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1781, 'NATURE', '#exists', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1782, 'NATURE', '#describes', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1783, 'NATURE', '#considered', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1784, 'NATURE', '#innate', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1785, 'NATURE', '#indeed', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1786, 'NATURE', '#forms', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1787, 'NATURE', '#example', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1788, 'NATURE', '#behavior', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1789, 'NATURE', '#strikeslip', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1790, 'NATURE', '#experience', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1791, 'NATURE', '#peculiar', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1792, 'NATURE', '#ultraviolet', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1793, 'NATURE', '#means', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1794, 'NATURE', '#this', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1795, 'NATURE', '#troposphere', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1796, 'NATURE', '#describing', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1797, 'NATURE', '#ideal', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1798, 'NATURE', '#beyond', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1799, 'NATURE', '#understanding', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1800, 'NATURE', '#practical', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1801, 'NATURE', '#fact', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1802, 'NATURE', '#extremely', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1803, 'NATURE', '#truly', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1804, 'NATURE', '#creating', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1805, 'NATURE', '#is', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1806, 'NATURE', '#especially', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1807, 'NATURE', '#temperature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1808, 'NATURE', '#refers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1809, 'NATURE', '#certain', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1810, 'NATURE', '#concept', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1811, 'NATURE', '#naturism', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1812, 'NATURE', '#examples', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1813, 'NATURE', '#relation', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1814, 'NATURE', '#metaphor', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1815, 'NATURE', '#regard', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1816, 'NATURE', '#characterized', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1817, 'NATURE', '#tornado', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1818, 'NATURE', '#entirely', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1819, 'NATURE', '#described', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1820, 'NATURE', '#highly', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1821, 'NATURE', '#hurricane', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1822, 'NATURE', '#historical', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1823, 'NATURE', '#naturalism', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1824, 'NATURE', '#fyp', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1825, 'NATURE', '#foryoupage', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1826, 'NATURE', '#funny', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1827, 'NATURE', '#cow', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1828, 'NATURE', '#pnw', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1829, 'NATURE', '#oregon', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1830, 'NATURE', '#pnwlife', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1831, 'NATURE', '#pnwwonderland', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1832, 'NATURE', '#granolagirl', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1833, 'NATURE', '#fish', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1834, 'NATURE', '#fishing', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1835, 'NATURE', '#fishtok', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1836, 'NATURE', '#florida', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1837, 'NATURE', '#offshore', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1838, 'NATURE', '#boat', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1839, 'NATURE', '#bass', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1840, 'NATURE', '#bassfishing', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1841, 'NATURE', '#amazon', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1842, 'NATURE', '#miama', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1843, 'NATURE', '#wildlife', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1844, 'NATURE', '#peacock', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1845, 'NATURE', '#viral', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1846, 'NATURE', '#elk', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1847, 'NATURE', '#animals', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1848, 'NATURE', '#cuteanimals', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1849, 'NATURE', '#foryou', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1850, 'NATURE', '#iceland', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1851, 'NATURE', '#studlagil', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1852, 'NATURE', '#studlagilcanyon', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1853, 'NATURE', '#icelandadventure', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1854, 'NATURE', '#icelandic', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1855, 'NATURE', '#icelandtiktok', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1856, 'NATURE', '#icelandtravel', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1857, 'NATURE', '#travel', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1858, 'NATURE', '#traveltok', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1859, 'NATURE', '#travellife', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1860, 'NATURE', '#travelbucketlist', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1861, 'NATURE', '#traveler', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1862, 'NATURE', '#bucketlist', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1863, 'NATURE', '#traveltips', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1864, 'NATURE', '#icelandphotographer', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1865, 'NATURE', '#icelandtrip', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1866, 'NATURE', '#beekeeper', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1867, 'NATURE', '#savethebees', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1868, 'NATURE', '#snake', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1869, 'NATURE', '#elkbugle', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1870, 'NATURE', '#bugle', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1871, 'NATURE', '#rut', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1872, 'NATURE', '#bull', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1873, 'NATURE', '#bullelk', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1874, 'NATURE', '#wildlifephotography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1875, 'NATURE', '#naturesounds', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1876, 'NATURE', '#loon', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1877, 'NATURE', '#baby', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1878, 'NATURE', '#babies', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1879, 'NATURE', '#outdoors', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1880, 'NATURE', '#cute', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1881, 'NATURE', '#cutebaby', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1882, 'NATURE', '#geography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1883, 'NATURE', '#countries', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1884, 'NATURE', '#worldmap', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1885, 'NATURE', '#top5', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1886, 'NATURE', '#unitedstates', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1887, 'NATURE', '#california', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1888, 'NATURE', '#bestnature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1889, 'NATURE', '#1', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1890, 'NATURE', '#beetok', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1891, 'NATURE', '#bees', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1892, 'NATURE', '#bugs', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1893, 'NATURE', '#satisfying', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1894, 'NATURE', '#queenbee', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1895, 'NATURE', '#argentina', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1896, 'NATURE', '#colors', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1897, 'NATURE', '#fall', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1898, 'NATURE', '#autumn', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1899, 'NATURE', '#patagonia', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1900, 'NATURE', '#mountain', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1901, 'NATURE', '#hiking', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1902, 'NATURE', '#photography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1903, 'NATURE', '#mountains', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1904, 'NATURE', '#cerrotorre', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1905, 'NATURE', '#elchalten', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1906, 'NATURE', '#shark', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1907, 'NATURE', '#greatwhite', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1908, 'NATURE', '#greatwhiteshark', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1909, 'NATURE', '#whiteshark', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1910, 'NATURE', '#ocean', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1911, 'NATURE', '#crane', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1912, 'NATURE', '#bird', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1913, 'NATURE', '#birds', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1914, 'NATURE', '#prairiedog', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1915, 'NATURE', '#livingmybestlife', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1916, 'NATURE', '#animalsdoingthings', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1917, 'NATURE', '#nationalgeographic', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1918, 'NATURE', '#mood', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1919, 'NATURE', '#pets', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1920, 'NATURE', '#funnyanimals', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1921, 'NATURE', '#animalsinfluence', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1922, 'NATURE', '#animal', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1923, 'NATURE', '#aerialphotograph', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1924, 'NATURE', '#naturephotography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1925, 'NATURE', '#hikewithpk', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1926, 'NATURE', '#naturelovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1927, 'NATURE', '#wildlife', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1928, 'NATURE', '#narure', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1929, 'NATURE', '#naturepics', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1930, 'NATURE', '#amazingnature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1931, 'NATURE', '#naturecaptures', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1932, 'NATURE', '#tree', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1933, 'NATURE', '#tation', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1934, 'NATURE', '#mixplor', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1935, 'NATURE', '#sunset', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1936, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1937, 'NATURE', '#photography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1938, 'NATURE', '#naturephotography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1939, 'NATURE', '#castle', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1940, 'NATURE', '#travel', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1941, 'NATURE', '#forest', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1942, 'NATURE', '#naturelover', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1943, 'NATURE', '#weroamgermany', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1944, 'NATURE', '#color', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1945, 'NATURE', '#folkgreen', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1946, 'NATURE', '#roamtheplanet', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1947, 'NATURE', '#exploretherewards', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1948, 'NATURE', '#modernoutdoors', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1949, 'NATURE', '#naturparkfichtelgebirge', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1950, 'NATURE', '#themoderndayexplorer', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1951, 'NATURE', '#moodygrams', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1952, 'NATURE', '#vibesofvisuals', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1953, 'NATURE', '#wekeepmoments', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1954, 'NATURE', '#liveforthestory', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1955, 'NATURE', '#moodnation', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1956, 'NATURE', '#mountainstories', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1957, 'NATURE', '#folkscenery', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1958, 'NATURE', '#travelingcapitólio', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1959, 'NATURE', '#queroferiasagora', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1960, 'NATURE', '#canyonsdolagodefurnas', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1961, 'NATURE', '#capitoliomg', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1962, 'NATURE', '#minasgerais', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1963, 'NATURE', '#serradacanastra', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1964, 'NATURE', '#americadosul', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1965, 'NATURE', '#ficaemcasa', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1966, 'NATURE', '#southamerica', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1967, 'NATURE', '#brasil', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1968, 'NATURE', '#brazil', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1969, 'NATURE', '#blogueirosdeviagens', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1970, 'NATURE', '#blogdeturismo', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1971, 'NATURE', '#travelblog', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1972, 'NATURE', '#travelgram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1973, 'NATURE', '#traveller', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1974, 'NATURE', '#wanderlust', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1975, 'NATURE', '#traveladdict', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1976, 'NATURE', '#travelporn', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1977, 'NATURE', '#respirandoviagem', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1978, 'NATURE', '#viajantedeasas', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1979, 'NATURE', '#temqueir', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1980, 'NATURE', '#dicasdemochileiros', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1981, 'NATURE', '#queromaisferias', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1982, 'NATURE', '#vivendoepostando', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1983, 'NATURE', '#natureza', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1984, 'NATURE', '#tripadoissmutlu', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1985, 'NATURE', '#wonderearthclub', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1986, 'NATURE', '#goodevening', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1987, 'NATURE', '#goodnight', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1988, 'NATURE', '#landscape', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1989, 'NATURE', '#view', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1990, 'NATURE', '#riverdale', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1991, 'NATURE', '#tree', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1992, 'NATURE', '#views', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1993, 'NATURE', '#iyiakşamlar', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1994, 'NATURE', '#gmz_ug', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1995, 'NATURE', '#trilhando', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1996, 'NATURE', '#trilhandotrilhas', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1997, 'NATURE', '#trilhandomontanhas', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1998, 'NATURE', '#trekking', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(1999, 'NATURE', '#trekkingbrasil', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2000, 'NATURE', '#trekkinglovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2001, 'NATURE', '#camping', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2002, 'NATURE', '#campinglife', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2003, 'NATURE', '#campingcollective', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2004, 'NATURE', '#hiking', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2005, 'NATURE', '#hikingadventures', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2006, 'NATURE', '#awesomelifestyle', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2007, 'NATURE', '#earthfocus', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2008, 'NATURE', '#lifestyle', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2009, 'NATURE', '#bestoftheday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2010, 'NATURE', '#instagood', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2011, 'NATURE', '#photooftheday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2012, 'NATURE', '#picoftheday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2013, 'NATURE', '#happy', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2014, 'NATURE', '#me', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2015, 'NATURE', '#beautiful', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2016, 'NATURE', '#follow', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2017, 'NATURE', '#followme', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2018, 'NATURE', '#sunnydaymükemmelliğe', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2019, 'NATURE', '#istanbul', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2020, 'NATURE', '#sultanahmetэто', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2021, 'NATURE', '#пляжбаунти', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2022, 'NATURE', '#мысфиолент', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2023, 'NATURE', '#севастополь', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2024, 'NATURE', '#крым', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2025, 'NATURE', '#отдыхвкрыму', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2026, 'NATURE', '#походыпокрыму', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2027, 'NATURE', '#crimea', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2028, 'NATURE', '#fitnessgirl', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2029, 'NATURE', '#crimeatrip', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2030, 'NATURE', '#russia', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2031, 'NATURE', '#crimeaphoto', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2032, 'NATURE', '#kukartamardin', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2033, 'NATURE', '#smile', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2034, 'NATURE', '#sunnyday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2035, 'NATURE', '#weekendvibes', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2036, 'NATURE', '#summervibes', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2037, 'NATURE', '#sunday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2038, 'NATURE', '#lookoftheday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2039, 'NATURE', '#germanbloggergirls', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2040, 'NATURE', '#instainspo', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2041, 'NATURE', '#blogstyle', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2042, 'NATURE', '#instamood', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2043, 'NATURE', '#natureisbeautiful', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2044, 'NATURE', '#naturelover', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2045, 'NATURE', '#naturelovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2046, 'NATURE', '#naturephotography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2047, 'NATURE', '#natureshots', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2048, 'NATURE', '#naturegram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2049, 'NATURE', '#nature_perfection', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2050, 'NATURE', '#nature_lovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2051, 'NATURE', '#naturehippys', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2052, 'NATURE', '#nature_shooters', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2053, 'NATURE', '#natureonly', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2054, 'NATURE', '#natureseekers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2055, 'NATURE', '#natureporn', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2056, 'NATURE', '#nature_brilliance', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2057, 'NATURE', '#nature_good', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2058, 'NATURE', '#nature_of_our_world', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2059, 'NATURE', '#nature_seekers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2060, 'NATURE', '#nature_captures', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2061, 'NATURE', '#nature_skyshotz', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2062, 'NATURE', '#natureaddict', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2063, 'NATURE', '#naturebeauty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2064, 'NATURE', '#natureshooters', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2065, 'NATURE', '#natureonly', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2066, 'NATURE', '#ilovenature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2067, 'NATURE', '#ilovenaturewalks', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2068, 'NATURE', '#lovingnature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2069, 'NATURE', '#lovingnaturesbeauty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2070, 'NATURE', '#happynature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2071, 'NATURE', '#intonature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2072, 'NATURE', '#thenaturalworld', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2073, 'NATURE', '#naturegeography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2074, 'NATURE', '#naturecolors', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2075, 'NATURE', '#naturehub', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2076, 'NATURE', '#naturewalk', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2077, 'NATURE', '#naturevideo', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2078, 'NATURE', '#natureview', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2079, 'NATURE', '#natureinspired', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2080, 'NATURE', '#forest', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2081, 'NATURE', '#tree', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2082, 'NATURE', '#woods', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2083, 'NATURE', '#field (also plural)', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2084, 'NATURE', '#meadow', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2085, 'NATURE', '#leaves', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2086, 'NATURE', '#grass', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2087, 'NATURE', '#sky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2088, 'NATURE', '#sunset(s)', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2089, 'NATURE', '#sunsetporn', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2090, 'NATURE', '#sunset_madness', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2091, 'NATURE', '#sunsetlovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2092, 'NATURE', '#sunrise', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2093, 'NATURE', '#sunrise_sunsets_aroundworld', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2094, 'NATURE', '#sunrise_and_sunsets', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2095, 'NATURE', '#horizon', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2096, 'NATURE', '#redsky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2097, 'NATURE', '#sundown', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2098, 'NATURE', '#hikingadventures', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2099, 'NATURE', '#hiking', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2100, 'NATURE', '#walking', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2101, 'NATURE', '#trails', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2102, 'NATURE', '#waterfall (also plural)', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2103, 'NATURE', '#waterfallwednesday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2104, 'NATURE', '#waterfallhike', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2105, 'NATURE', '#hikingtrail', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2106, 'NATURE', '#hike', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2107, 'NATURE', '#hikingday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2108, 'NATURE', '#naturelover', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2109, 'NATURE', '#naturephotos', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2110, 'NATURE', '#natureaddict', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2111, 'NATURE', '#natureshot', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2112, 'NATURE', '#adventure', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2113, 'NATURE', '#outdooradventure', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2114, 'NATURE', '#mountainlife', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2115, 'NATURE', '#discovererth', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2116, 'NATURE', '#neverstopexploring', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2117, 'NATURE', '#planttrees', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2118, 'NATURE', '#mountains', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2119, 'NATURE', '#clouds', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2120, 'NATURE', '#beach', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2121, 'NATURE', '#trees', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2122, 'NATURE', '#wildlife', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2123, 'NATURE', '#explore', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2124, 'NATURE', '#amazing', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2125, 'NATURE', '#travel', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2126, 'NATURE', '#wildlifephotography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2127, 'NATURE', '#plants', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2128, 'NATURE', '#landscapephotography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2129, 'NATURE', '#view', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2130, 'NATURE', '#sand', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2131, 'NATURE', '#seashore', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2132, 'NATURE', '#wave', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2133, 'NATURE', '#forests', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2134, 'NATURE', '#habitat', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2135, 'NATURE', '#ecology', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2136, 'NATURE', '#mountainphoto', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2137, 'NATURE', '#sunrise', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2138, 'NATURE', '#inspiration', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2139, 'NATURE', '#photooftheday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2140, 'NATURE', '#summer', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2141, 'NATURE', '#sky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2142, 'NATURE', '#earth', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2143, 'NATURE', '#sun', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2144, 'NATURE', '#wanderlust', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2145, 'NATURE', '#snow', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2146, 'NATURE', '#goodvibes', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2147, 'NATURE', '#peace', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2148, 'NATURE', '#natureza', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2149, 'NATURE', '#travelling', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2150, 'NATURE', '#leaf', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2151, 'NATURE', '#camping', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2152, 'NATURE', '#trekking', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2153, 'NATURE', '#gorgeous', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2154, 'NATURE', '#natureonly', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2155, 'NATURE', '#winter', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2156, 'NATURE', '#warm', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2157, 'NATURE', '#boating', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2158, 'NATURE', '#sailing', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2159, 'NATURE', '#solotravel', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2160, 'NATURE', '#discover', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2161, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2162, 'NATURE', '#green', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2163, 'NATURE', '#naturephotography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2164, 'NATURE', '#lovenature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2165, 'NATURE', '#landscape', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2166, 'NATURE', '#beautiful', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2167, 'NATURE', '#travelphotography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2168, 'NATURE', '#outdoors', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2169, 'NATURE', '#beauty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2170, 'NATURE', '#tree', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2171, 'NATURE', '#animals', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2172, 'NATURE', '#ocean', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2173, 'NATURE', '#forest', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2174, 'NATURE', '#naturelovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2175, 'NATURE', '#sea', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2176, 'NATURE', '#lake', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2177, 'NATURE', '#water', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2178, 'NATURE', '#sunset', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2179, 'NATURE', '#autumn', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2180, 'NATURE', '#life', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2181, 'NATURE', '#naturephoto', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2182, 'NATURE', '#animal', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2183, 'NATURE', '#travelgram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2184, 'NATURE', '#instanature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2185, 'NATURE', '#naturegeography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2186, 'NATURE', '#flowers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2187, 'NATURE', '#instatree', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2188, 'NATURE', '#naturephotograpy', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2189, 'NATURE', '#naturelove', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2190, 'NATURE', '#givebacktonature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2191, 'NATURE', '#woodlands_and_water', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2192, 'NATURE', '#wildernesstones', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2193, 'NATURE', '#liveoutdoors', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2194, 'NATURE', '#roamtheplanet', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2195, 'NATURE', '#earthofficial', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2196, 'NATURE', '#beautifulmatters', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2197, 'NATURE', '#FeatheredFriends', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2198, 'NATURE', '#WildlifeConservation', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2199, 'NATURE', '#NatureLove', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2200, 'NATURE', '#NatureLover', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2201, 'NATURE', '#NatureBeauty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2202, 'NATURE', '#trees_woodland_forests', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2203, 'NATURE', '#woodlands_and_water', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2204, 'NATURE', '#woodlandandwater', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2205, 'NATURE', '#fotofanatics_nature_', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2206, 'NATURE', '#happyday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2207, 'NATURE', '#flowers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2208, 'NATURE', '#mothernature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2209, 'NATURE', '#natureporn', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2210, 'NATURE', '#nature_shooters', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2211, 'NATURE', '#beautifulday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2212, 'NATURE', '#nature_perfection', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2213, 'NATURE', '#nice', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2214, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2215, 'NATURE', '#sunrise', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2216, 'NATURE', '#day', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2217, 'NATURE', '#sky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2218, 'NATURE', '#happylife', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2219, 'NATURE', '#instatag', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2220, 'NATURE', '#aihashtag', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2221, 'NATURE', '#natureza', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2222, 'NATURE', '#weather', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2223, 'NATURE', '#naturehippys', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2224, 'NATURE', '#naturelover', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2225, 'NATURE', '#sun', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2226, 'NATURE', '#tree', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2227, 'NATURE', '#real', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2228, 'NATURE', '#pretty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2229, 'NATURE', '#outdoors', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2230, 'NATURE', '#photooftheday @aihashtag', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2231, 'NATURE', '#blue', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2232, 'NATURE', '#natureaddict', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2233, 'NATURE', '#sunset', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2234, 'NATURE', '#naturelovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2235, 'NATURE', '#beautiful', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2236, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2237, 'NATURE', '#envywear', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2238, 'NATURE', '#PleaseForgiveMe', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2239, 'NATURE', '#sky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2240, 'NATURE', '#sun', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2241, 'NATURE', '#summer', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2242, 'NATURE', '#beach', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2243, 'NATURE', '#beautiful', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2244, 'NATURE', '#pretty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2245, 'NATURE', '#sunset', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2246, 'NATURE', '#sunrise', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2247, 'NATURE', '#blue', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2248, 'NATURE', '#flowers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2249, 'NATURE', '#night', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2250, 'NATURE', '#tree', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2251, 'NATURE', '#twilight', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2252, 'NATURE', '#clouds', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2253, 'NATURE', '#beauty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2254, 'NATURE', '#light', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2255, 'NATURE', '#cloudporn', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2256, 'NATURE', '#photooftheday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2257, 'NATURE', '#love', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2258, 'NATURE', '#green', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2259, 'NATURE', '#skylovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2260, 'NATURE', '#dusk', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2261, 'NATURE', '#weather', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2262, 'NATURE', '#day', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2263, 'NATURE', '#red', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2264, 'NATURE', '#mothernature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2265, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2266, 'NATURE', '#beach', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2267, 'NATURE', '#sun', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2268, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2269, 'NATURE', '#water', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2270, 'NATURE', '#envywear', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2271, 'NATURE', '#PleaseForgiveMe', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2272, 'NATURE', '#ocean', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2273, 'NATURE', '#lake', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2274, 'NATURE', '#instagood', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2275, 'NATURE', '#photooftheday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2276, 'NATURE', '#beautiful', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2277, 'NATURE', '#sky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2278, 'NATURE', '#clouds', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35');
INSERT INTO `categories` (`id`, `title`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(2279, 'NATURE', '#cloudporn', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2280, 'NATURE', '#fun', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2281, 'NATURE', '#pretty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2282, 'NATURE', '#sand', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2283, 'NATURE', '#reflection', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2284, 'NATURE', '#amazing', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2285, 'NATURE', '#beauty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2286, 'NATURE', '#beautiful', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2287, 'NATURE', '#shore', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2288, 'NATURE', '#waterfoam', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2289, 'NATURE', '#seashore', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2290, 'NATURE', '#waves', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2291, 'NATURE', '#wave', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2292, 'NATURE', '#beach', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2293, 'NATURE', '#travel', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2294, 'NATURE', '#summer', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2295, 'NATURE', '#sea', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2296, 'NATURE', '#flowers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2297, 'NATURE', '#flower', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2298, 'NATURE', '#envywear', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2299, 'NATURE', '#PleaseForgiveMe', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2300, 'NATURE', '#petal', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2301, 'NATURE', '#petals', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2302, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2303, 'NATURE', '#beautiful', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2304, 'NATURE', '#love', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2305, 'NATURE', '#pretty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2306, 'NATURE', '#plants', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2307, 'NATURE', '#blossom', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2308, 'NATURE', '#sopretty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2309, 'NATURE', '#spring', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2310, 'NATURE', '#summer', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2311, 'NATURE', '#flowerstagram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2312, 'NATURE', '#flowersofinstagram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2313, 'NATURE', '#flowerstyles gf', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2314, 'NATURE', '#flowerslovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2315, 'NATURE', '#flowerporn', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2316, 'NATURE', '#botanical', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2317, 'NATURE', '#floral', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2318, 'NATURE', '#florals', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2319, 'NATURE', '#flowermagic', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2320, 'NATURE', '#instablooms', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2321, 'NATURE', '#bloom', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2322, 'NATURE', '#blooms', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2323, 'NATURE', '#botanical', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2324, 'NATURE', '#floweroftheday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2325, 'NATURE', '#flowers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2326, 'NATURE', '#sunset', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2327, 'NATURE', '#sunrise', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2328, 'NATURE', '#sun', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2329, 'NATURE', '#envywear', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2330, 'NATURE', '#PleaseForgiveMe', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2331, 'NATURE', '#pretty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2332, 'NATURE', '#beautiful', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2333, 'NATURE', '#red', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2334, 'NATURE', '#orange', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2335, 'NATURE', '#pink', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2336, 'NATURE', '#sky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2337, 'NATURE', '#skyporn', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2338, 'NATURE', '#cloudporn', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2339, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2340, 'NATURE', '#clouds', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2341, 'NATURE', '#horizon', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2342, 'NATURE', '#photooftheday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2343, 'NATURE', '#instagood', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2344, 'NATURE', '#gorgeous', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2345, 'NATURE', '#warm', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2346, 'NATURE', '#view', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2347, 'NATURE', '#night', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2348, 'NATURE', '#morning', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2349, 'NATURE', '#silhouette', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2350, 'NATURE', '#instasky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2351, 'NATURE', '#all sunsets', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2352, 'NATURE', '#sunset', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2353, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2354, 'NATURE', '#photography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2355, 'NATURE', '#sky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2356, 'NATURE', '#Blue', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2357, 'NATURE', '#Water', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2358, 'NATURE', '#Liquid', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2359, 'NATURE', '#Beautiful', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2360, 'NATURE', '#Amazing', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2361, 'NATURE', '#Awesome', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2362, 'NATURE', '#Nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2363, 'NATURE', '#Love', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2364, 'NATURE', '#View', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2365, 'NATURE', '#Green', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2366, 'NATURE', '#splash', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2367, 'NATURE', '#cold', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2368, 'NATURE', '#pretty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2369, 'NATURE', '#beauty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2370, 'NATURE', '#rocks', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2371, 'NATURE', '#reflection', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2372, 'NATURE', '#scenic', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2373, 'NATURE', '#NatureLover', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2374, 'NATURE', '#Cool', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2375, 'NATURE', '#Crystal', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2376, 'NATURE', '#naturelovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2377, 'NATURE', '#nature seekers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2378, 'NATURE', '#natureonly', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2379, 'NATURE', '#nature shooters', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2380, 'NATURE', '#blue', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2381, 'NATURE', '#love', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2382, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2383, 'NATURE', '#photography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2384, 'NATURE', '#sky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2385, 'NATURE', '#art', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2386, 'NATURE', '#Tree', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2387, 'NATURE', '#Trees', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2388, 'NATURE', '#Green', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2389, 'NATURE', '#brown', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2390, 'NATURE', '#tall', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2391, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2392, 'NATURE', '#beautiful', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2393, 'NATURE', '#love', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2394, 'NATURE', '#amazing', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2395, 'NATURE', '#Awesome', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2396, 'NATURE', '#leafs', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2397, 'NATURE', '#TreePorn', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2398, 'NATURE', '#TreesofInstagram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2399, 'NATURE', '#Treeslover', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2400, 'NATURE', '#Pretty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2401, 'NATURE', '#NatureLover', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2402, 'NATURE', '#naturegram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2403, 'NATURE', '#naturelove', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2404, 'NATURE', '#naturephoto', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2405, 'NATURE', '#treestagram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2406, 'NATURE', '#treescape', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2407, 'NATURE', '#naturelovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2408, 'NATURE', '#naturelover', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2409, 'NATURE', '#nature seekers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2410, 'NATURE', '#natureonly', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2411, 'NATURE', '#nature shooters', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2412, 'NATURE', '#tree', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2413, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2414, 'NATURE', '#trees', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2415, 'NATURE', '#photography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2416, 'NATURE', '#sea', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2417, 'NATURE', '#beach', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2418, 'NATURE', '#sand', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2419, 'NATURE', '#water', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2420, 'NATURE', '#waves', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2421, 'NATURE', '#wave', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2422, 'NATURE', '#blue', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2423, 'NATURE', '#love', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2424, 'NATURE', '#naturelovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2425, 'NATURE', '#seascape', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2426, 'NATURE', '#photooftheday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2427, 'NATURE', '#beautiful', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2428, 'NATURE', '#cloud', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2429, 'NATURE', '#natureza', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2430, 'NATURE', '#light', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2431, 'NATURE', '#dusk', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2432, 'NATURE', '#skypainters', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2433, 'NATURE', '#clouds', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2434, 'NATURE', '#seaside', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2435, 'NATURE', '#skylovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2436, 'NATURE', '#ocean', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2437, 'NATURE', '#amazing', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2438, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2439, 'NATURE', '#ripples', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2440, 'NATURE', '#gorgeous', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2441, 'NATURE', '#instagood', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2442, 'NATURE', '#tweegram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2443, 'NATURE', '#blue', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2444, 'NATURE', '#clouds', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2445, 'NATURE', '#sea', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2446, 'NATURE', '#Waterfall', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2447, 'NATURE', '#Pour', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2448, 'NATURE', '#Drizzle', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2449, 'NATURE', '#Blue', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2450, 'NATURE', '#Water', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2451, 'NATURE', '#Liquid', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2452, 'NATURE', '#Beautiful', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2453, 'NATURE', '#Amazing', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2454, 'NATURE', '#Awesome', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2455, 'NATURE', '#Nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2456, 'NATURE', '#Love', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2457, 'NATURE', '#View', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2458, 'NATURE', '#Green', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2459, 'NATURE', '#splash', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2460, 'NATURE', '#cold', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2461, 'NATURE', '#pretty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2462, 'NATURE', '#beauty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2463, 'NATURE', '#rocks', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2464, 'NATURE', '#reflection', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2465, 'NATURE', '#scenic', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2466, 'NATURE', '#naturelovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2467, 'NATURE', '#naturelover', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2468, 'NATURE', '#nature seekers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2469, 'NATURE', '#natureonly', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2470, 'NATURE', '#nature shooters', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2471, 'NATURE', '#NatureLover', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2472, 'NATURE', '#waterfall', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2473, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2474, 'NATURE', '#travel', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2475, 'NATURE', '#naturephotography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2476, 'NATURE', '#clouds', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2477, 'NATURE', '#cloud', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2478, 'NATURE', '#cloudporn', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2479, 'NATURE', '#weather', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2480, 'NATURE', '#lookup', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2481, 'NATURE', '#sky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2482, 'NATURE', '#skies', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2483, 'NATURE', '#skyporn', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2484, 'NATURE', '#cloudy', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2485, 'NATURE', '#instacloud', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2486, 'NATURE', '#instaclouds', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2487, 'NATURE', '#instagood', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2488, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2489, 'NATURE', '#beautiful', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2490, 'NATURE', '#blue', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2491, 'NATURE', '#skyline', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2492, 'NATURE', '#horizon', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2493, 'NATURE', '#overcast', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2494, 'NATURE', '#instasky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2495, 'NATURE', '#epicsky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2496, 'NATURE', '#crazyclouds', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2497, 'NATURE', '#photooftheday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2498, 'NATURE', '#cloud skye', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2499, 'NATURE', '#skyback', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2500, 'NATURE', '#insta sky lovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2501, 'NATURE', '#iskyhub', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2502, 'NATURE', '#clouds', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2503, 'NATURE', '#sky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2504, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2505, 'NATURE', '#sunset', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2506, 'NATURE', '#sky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2507, 'NATURE', '#clouds', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2508, 'NATURE', '#fabskyshots', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2509, 'NATURE', '#bluesky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2510, 'NATURE', '#cloudstagram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2511, 'NATURE', '#beautiful', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2512, 'NATURE', '#cloudporn', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2513, 'NATURE', '#skyporn', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2514, 'NATURE', '#air', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2515, 'NATURE', '#blue', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2516, 'NATURE', '#white', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2517, 'NATURE', '#ic skies', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2518, 'NATURE', '#beauty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2519, 'NATURE', '#global sky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2520, 'NATURE', '#igworldsky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2521, 'NATURE', '#thebestskyever', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2522, 'NATURE', '#iskyhub', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2523, 'NATURE', '#cloudwhisperers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2524, 'NATURE', '#photowall sky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2525, 'NATURE', '#sky captures', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2526, 'NATURE', '#naturegram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2527, 'NATURE', '#skylines', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2528, 'NATURE', '#skyview', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2529, 'NATURE', '#instadaily', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2530, 'NATURE', '#horizon', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2531, 'NATURE', '#amazing', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2532, 'NATURE', '#sky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2533, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2534, 'NATURE', '#sunset', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2535, 'NATURE', '#photography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2536, 'NATURE', '#landscape', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2537, 'NATURE', '#amazing', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2538, 'NATURE', '#view', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2539, 'NATURE', '#trip', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2540, 'NATURE', '#tree', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2541, 'NATURE', '#sky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2542, 'NATURE', '#mountains', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2543, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2544, 'NATURE', '#landscape lovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2545, 'NATURE', '#landscapelovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2546, 'NATURE', '#landscape lover', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2547, 'NATURE', '#landscapehunter', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2548, 'NATURE', '#landscapes', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2549, 'NATURE', '#landscapestyles', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2550, 'NATURE', '#trees', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2551, 'NATURE', '#naturelovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2552, 'NATURE', '#naturelover', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2553, 'NATURE', '#nature seekers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2554, 'NATURE', '#natureonly', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2555, 'NATURE', '#nature shooters', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2556, 'NATURE', '#nature prefection', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2557, 'NATURE', '#naturediversity', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2558, 'NATURE', '#naturephotography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2559, 'NATURE', '#naturewalk', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2560, 'NATURE', '#naturegram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2561, 'NATURE', '#naturelove', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2562, 'NATURE', '#naturephoto', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2563, 'NATURE', '#landscape', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2564, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2565, 'NATURE', '#photography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2566, 'NATURE', '#naturewalk', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2567, 'NATURE', '#naturegram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2568, 'NATURE', '#naturelove', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2569, 'NATURE', '#natureonly', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2570, 'NATURE', '#natureporn', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2571, 'NATURE', '#bestnatureshot', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2572, 'NATURE', '#natureshots', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2573, 'NATURE', '#naturephoto', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2574, 'NATURE', '#earthpix', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2575, 'NATURE', '#nakedplanet', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2576, 'NATURE', '#nature_lovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2577, 'NATURE', '#naturesbeauty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2578, 'NATURE', '#natureaddict', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2579, 'NATURE', '#wildlifephotography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2580, 'NATURE', '#discoverglobe', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2581, 'NATURE', '#ilovenature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2582, 'NATURE', '#earthofficial', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2583, 'NATURE', '#marvelshots', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2584, 'NATURE', '#naturehippys', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2585, 'NATURE', '#nationalgeographic', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2586, 'NATURE', '#fantastic_earth', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2587, 'NATURE', '#theworldshotz', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2588, 'NATURE', '#awesome_earthpix', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2589, 'NATURE', '#natgeoyourshot', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2590, 'NATURE', '#natgeotravel', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2591, 'NATURE', '#theglobewanderer', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2592, 'NATURE', '#earthfocus', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2593, 'NATURE', '#justbreathing', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2594, 'NATURE', '#outdoorslife', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2595, 'NATURE', '#discoverearth', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2596, 'NATURE', '#natureshot', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2597, 'NATURE', '#nature_of_our_world', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2598, 'NATURE', '#natureisbeautiful', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2599, 'NATURE', '#naturebeauty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2600, 'NATURE', '#earthpics', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2601, 'NATURE', '#places_wow', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2602, 'NATURE', '#fiftyshades_of_nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2603, 'NATURE', '#adventurethatislife', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2604, 'NATURE', '#ourplanetdaily', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2605, 'NATURE', '#stayandwander', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2606, 'NATURE', '#naturepics', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2607, 'NATURE', '#naturepic', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2608, 'NATURE', '#natures_hub', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2609, 'NATURE', '#awesomeglobe', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2610, 'NATURE', '#natureperfection', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2611, 'NATURE', '#natgeohub', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2612, 'NATURE', '#natgeowild', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2613, 'NATURE', '#natgeolandscape', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2614, 'NATURE', '#natgeocreative', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2615, 'NATURE', '#earth_portraits', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2616, 'NATURE', '#beautyofnature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2617, 'NATURE', '#natureloversgallery', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2618, 'NATURE', '#naturephotos', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2619, 'NATURE', '#natureview', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2620, 'NATURE', '#earthpics', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2621, 'NATURE', '#awesomeglobe', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2622, 'NATURE', '#ilovenature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2623, 'NATURE', '#justbreathing', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2624, 'NATURE', '#naturehippys', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2625, 'NATURE', '#naturehub', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2626, 'NATURE', '#natureloversgallery', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2627, 'NATURE', '#natureview', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2628, 'NATURE', '#natureheals', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2629, 'NATURE', '#naturephotos', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2630, 'NATURE', '#natureisart', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2631, 'NATURE', '#nature_photo', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2632, 'NATURE', '#naturelife', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2633, 'NATURE', '#igworldglobal', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2634, 'NATURE', '#wildlife_seekers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2635, 'NATURE', '#respectnature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2636, 'NATURE', '#dream_spots', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2637, 'NATURE', '#endangered', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2638, 'NATURE', '#wildlifeonearth', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2639, 'NATURE', '#wildlifeaddicts', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2640, 'NATURE', '#wildlifephoto', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2641, 'NATURE', '#wildlifephotographer', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2642, 'NATURE', '#mthrworld', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2643, 'NATURE', '#majestic_earth', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2644, 'NATURE', '#natureisamazing', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2645, 'NATURE', '#pocket_world', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2646, 'NATURE', '#ig_divineshots', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2647, 'NATURE', '#visual_heaven', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2648, 'NATURE', '#justbreathing', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2649, 'NATURE', '#loveearth', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2650, 'NATURE', '#outdoorsy', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2651, 'NATURE', '#outdoorfun', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2652, 'NATURE', '#mountainscape', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2653, 'NATURE', '#earthexperience', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2654, 'NATURE', '#nature', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2655, 'NATURE', '#instagood', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2656, 'NATURE', '#photography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2657, 'NATURE', '#sun', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2658, 'NATURE', '#photooftheday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2659, 'NATURE', '#sunset', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2660, 'NATURE', '#photo', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2661, 'NATURE', '#sky', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2662, 'NATURE', '#amazing', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2663, 'NATURE', '#pretty', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2664, 'NATURE', '#view', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2665, 'NATURE', '#naturephotography', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2666, 'NATURE', '#fun', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2667, 'NATURE', '#art', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2668, 'NATURE', '#winter', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2669, 'NATURE', '#wildlife', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2670, 'NATURE', '#blue', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2671, 'NATURE', '#pink', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2672, 'NATURE', '#ocean', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2673, 'NATURE', '#picture', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2674, 'NATURE', '#sea', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2675, 'NATURE', '#instagram', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2676, 'NATURE', '#night', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2677, 'NATURE', '#naturelovers', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2678, 'NATURE', '#landscape', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2679, 'NATURE', '#snow', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2680, 'NATURE', '#canon', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2681, 'NATURE', '#picoftheday', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2682, 'NATURE', '#instadaily', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2683, 'NATURE', '#vscocam', NULL, NULL, '2024-05-31 12:13:35', '2024-05-31 12:13:35'),
(2684, 'Trending', '#free', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2685, 'Trending', '#love', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2686, 'Trending', '#giveaway', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2687, 'Trending', '#freedom', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2688, 'Trending', '#follow', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2689, 'Trending', '#music', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2690, 'Trending', '#life', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2691, 'Trending', '#like', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2692, 'Trending', '#instagood', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2693, 'Trending', '#art', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2694, 'Trending', '#instagram', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2695, 'Trending', '#nature', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2696, 'Trending', '#happy', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2697, 'Trending', '#freebies', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2698, 'Trending', '#photography', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2699, 'Trending', '#fashion', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2700, 'Trending', '#freefire', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2701, 'Trending', '#usa', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2702, 'Trending', '#beauty', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2703, 'Trending', '#lifestyle', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2704, 'Trending', '#gratis', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2705, 'Trending', '#win', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2706, 'Trending', '#hiphop', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2707, 'Trending', '#travel', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2708, 'Trending', '#freestyle', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2709, 'Trending', '#style', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2710, 'Trending', '#motivation', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2711, 'Trending', '#photooftheday', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2712, 'Trending', '#giveaways', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2713, 'Trending', '#rap', NULL, NULL, '2024-09-10 14:19:57', '2024-09-10 14:19:57'),
(2714, 'Popular', '#sale', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2715, 'Popular', '#fun', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2716, 'Popular', '#summer', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2717, 'Popular', '#amazon', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2718, 'Popular', '#couponcommunity', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2719, 'Popular', '#beautiful', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2720, 'Popular', '#live', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2721, 'Popular', '#money', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2722, 'Popular', '#me', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2723, 'Popular', '#followforfollowback', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2724, 'Popular', '#bhfyp', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2725, 'Popular', '#freestuff', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2726, 'Popular', '#new', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2727, 'Popular', '#freefirebrasil', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2728, 'Popular', '#likeforlikes', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2729, 'Popular', '#covid', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2730, 'Popular', '#online', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2731, 'Popular', '#anime', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2732, 'Popular', '#freebie', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2733, 'Popular', '#artist', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2734, 'Popular', '#picoftheday', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2735, 'Popular', '#a', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2736, 'Popular', '#repost', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2737, 'Popular', '#contest', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2738, 'Popular', '#fitness', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2739, 'Popular', '#peace', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2740, 'Popular', '#coupons', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2741, 'Popular', '#explore', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2742, 'Popular', '#model', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2743, 'Popular', '#deals', NULL, NULL, '2024-09-10 14:20:26', '2024-09-10 14:20:26'),
(2744, 'Best', '#free', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2745, 'Best', '#new', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2746, 'Best', '#bhfyp', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2747, 'Best', '#usa', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2748, 'Best', '#live', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2749, 'Best', '#hiphop', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2750, 'Best', '#peace', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2751, 'Best', '#sale', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2752, 'Best', '#rap', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2753, 'Best', '#money', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2754, 'Best', '#freedom', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2755, 'Best', '#giveaway', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2756, 'Best', '#free', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2757, 'Best', '#online', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2758, 'Best', '#freefire', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2759, 'Best', '#freestyle', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2760, 'Best', '#win', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2761, 'Best', '#amazon', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2762, 'Best', '#covid', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2763, 'Best', '#contest', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2764, 'Best', '#freeshipping', NULL, NULL, '2024-09-10 14:20:48', '2024-09-10 14:20:48'),
(2765, 'Medium difficulty hashtags', '#free', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2766, 'Medium difficulty hashtags', '#freeshipping', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2767, 'Medium difficulty hashtags', '#freetime', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2768, 'Medium difficulty hashtags', '#gratis', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2769, 'Medium difficulty hashtags', '#freefirebrasil', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2770, 'Medium difficulty hashtags', '#freelance', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2771, 'Medium difficulty hashtags', '#freefiregame', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2772, 'Medium difficulty hashtags', '#couponcommunity', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2773, 'Medium difficulty hashtags', '#freefireindonesia', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2774, 'Medium difficulty hashtags', '#FreeSpirit', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2775, 'Medium difficulty hashtags', '#freeongkir', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2776, 'Medium difficulty hashtags', '#freezing', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2777, 'Medium difficulty hashtags', '#freehand', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2778, 'Medium difficulty hashtags', '#freeride', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2779, 'Medium difficulty hashtags', '#freefirebooyah', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2780, 'Medium difficulty hashtags', '#giveaways', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2781, 'Medium difficulty hashtags', '#freefirememes', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2782, 'Medium difficulty hashtags', '#freefirememe', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2783, 'Medium difficulty hashtags', '#freepalestine', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2784, 'Medium difficulty hashtags', '#freefireindo', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2785, 'Medium difficulty hashtags', '#freelancer', NULL, NULL, '2024-09-10 14:23:47', '2024-09-10 14:23:47'),
(2786, 'Exact hashtags', '#free', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2787, 'Exact hashtags', '#freedom', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2788, 'Exact hashtags', '#freefire', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2789, 'Exact hashtags', '#freestyle', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2790, 'Exact hashtags', '#freeshipping', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2791, 'Exact hashtags', '#freetime', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2792, 'Exact hashtags', '#freefirebrasil', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2793, 'Exact hashtags', '#freelance', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2794, 'Exact hashtags', '#freefiregame', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2795, 'Exact hashtags', '#freefireindonesia', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2796, 'Exact hashtags', '#FreeSpirit', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2797, 'Exact hashtags', '#freeongkir', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2798, 'Exact hashtags', '#freezing', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2799, 'Exact hashtags', '#freehand', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2800, 'Exact hashtags', '#freeride', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2801, 'Exact hashtags', '#freefirebooyah', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2802, 'Exact hashtags', '#freefirememes', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2803, 'Exact hashtags', '#freefirememe', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2804, 'Exact hashtags', '#freepalestine', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2805, 'Exact hashtags', '#freefireindo', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2806, 'Exact hashtags', '#freelancer', NULL, NULL, '2024-09-10 14:24:20', '2024-09-10 14:24:20'),
(2807, 'General Lifestyle', '#Lifestyle', NULL, NULL, '2024-09-10 14:25:02', '2024-09-10 14:25:02'),
(2808, 'General Lifestyle', '#DailyLife', NULL, NULL, '2024-09-10 14:25:02', '2024-09-10 14:25:02'),
(2809, 'General Lifestyle', '#LifeInStyle', NULL, NULL, '2024-09-10 14:25:02', '2024-09-10 14:25:02'),
(2810, 'General Lifestyle', '#MyLifestyle', NULL, NULL, '2024-09-10 14:25:02', '2024-09-10 14:25:02'),
(2811, 'General Lifestyle', '#LivingMyBestLife', NULL, NULL, '2024-09-10 14:25:02', '2024-09-10 14:25:02'),
(2812, 'General Lifestyle', '#LivingWell', NULL, NULL, '2024-09-10 14:25:02', '2024-09-10 14:25:02'),
(2813, 'General Lifestyle', '#ModernLife', NULL, NULL, '2024-09-10 14:25:02', '2024-09-10 14:25:02'),
(2814, 'General Lifestyle', '#LifeGoals', NULL, NULL, '2024-09-10 14:25:02', '2024-09-10 14:25:02'),
(2815, 'General Lifestyle', '#LifestyleInspo', NULL, NULL, '2024-09-10 14:25:02', '2024-09-10 14:25:02'),
(2816, 'General Lifestyle', '#TheGoodLife', NULL, NULL, '2024-09-10 14:25:02', '2024-09-10 14:25:02'),
(2817, 'General Lifestyle', '#LifeAndStyle', NULL, NULL, '2024-09-10 14:25:02', '2024-09-10 14:25:02'),
(2818, 'General Lifestyle', '#ChasingDreams', NULL, NULL, '2024-09-10 14:25:02', '2024-09-10 14:25:02'),
(2819, 'General Lifestyle', '#SimplyLiving', NULL, NULL, '2024-09-10 14:25:02', '2024-09-10 14:25:02'),
(2820, 'General Lifestyle', '#ThisIsLife', NULL, NULL, '2024-09-10 14:25:02', '2024-09-10 14:25:02'),
(2821, 'General Lifestyle', '#LiveYourLife', NULL, NULL, '2024-09-10 14:25:02', '2024-09-10 14:25:02'),
(2822, 'General Lifestyle', '#EverydayLiving', NULL, NULL, '2024-09-10 14:25:02', '2024-09-10 14:25:02'),
(2823, 'General Lifestyle', '#LivingIntentionally', NULL, NULL, '2024-09-10 14:25:02', '2024-09-10 14:25:02'),
(2824, 'Daily Routine & Activities', '#MorningRoutine', NULL, NULL, '2024-09-10 14:25:26', '2024-09-10 14:25:26'),
(2825, 'Daily Routine & Activities', '#DailyRoutine', NULL, NULL, '2024-09-10 14:25:26', '2024-09-10 14:25:26'),
(2826, 'Daily Routine & Activities', '#MorningVibes', NULL, NULL, '2024-09-10 14:25:26', '2024-09-10 14:25:26'),
(2827, 'Daily Routine & Activities', '#DailyVibes', NULL, NULL, '2024-09-10 14:25:26', '2024-09-10 14:25:26'),
(2828, 'Daily Routine & Activities', '#DayInTheLife', NULL, NULL, '2024-09-10 14:25:26', '2024-09-10 14:25:26'),
(2829, 'Daily Routine & Activities', '#RiseAndShine', NULL, NULL, '2024-09-10 14:25:26', '2024-09-10 14:25:26'),
(2830, 'Daily Routine & Activities', '#DailyGrind', NULL, NULL, '2024-09-10 14:25:26', '2024-09-10 14:25:26'),
(2831, 'Daily Routine & Activities', '#DailyHustle', NULL, NULL, '2024-09-10 14:25:26', '2024-09-10 14:25:26'),
(2832, 'Daily Routine & Activities', '#DayByDay', NULL, NULL, '2024-09-10 14:25:26', '2024-09-10 14:25:26'),
(2833, 'Daily Routine & Activities', '#DailyMoments', NULL, NULL, '2024-09-10 14:25:26', '2024-09-10 14:25:26'),
(2834, 'Daily Routine & Activities', '#LiveWell', NULL, NULL, '2024-09-10 14:25:26', '2024-09-10 14:25:26');
INSERT INTO `categories` (`id`, `title`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(2835, 'Daily Routine & Activities', '#RoutineGoals', NULL, NULL, '2024-09-10 14:25:26', '2024-09-10 14:25:26'),
(2836, 'Daily Routine & Activities', '#WakeUpAndGo', NULL, NULL, '2024-09-10 14:25:26', '2024-09-10 14:25:26'),
(2837, 'Health & Wellness', '#HealthyLiving', NULL, NULL, '2024-09-10 14:25:55', '2024-09-10 14:25:55'),
(2838, 'Health & Wellness', '#HealthAndWellness', NULL, NULL, '2024-09-10 14:25:55', '2024-09-10 14:25:55'),
(2839, 'Health & Wellness', '#WellnessJourney', NULL, NULL, '2024-09-10 14:25:55', '2024-09-10 14:25:55'),
(2840, 'Health & Wellness', '#HolisticLiving', NULL, NULL, '2024-09-10 14:25:55', '2024-09-10 14:25:55'),
(2841, 'Health & Wellness', '#WellBeing', NULL, NULL, '2024-09-10 14:25:55', '2024-09-10 14:25:55'),
(2842, 'Health & Wellness', '#MindfulLiving', NULL, NULL, '2024-09-10 14:25:55', '2024-09-10 14:25:55'),
(2843, 'Health & Wellness', '#HealthyHabits', NULL, NULL, '2024-09-10 14:25:55', '2024-09-10 14:25:55'),
(2844, 'Health & Wellness', '#SelfCare', NULL, NULL, '2024-09-10 14:25:55', '2024-09-10 14:25:55'),
(2845, 'Health & Wellness', '#SelfLove', NULL, NULL, '2024-09-10 14:25:55', '2024-09-10 14:25:55'),
(2846, 'Health & Wellness', '#PositiveMindset', NULL, NULL, '2024-09-10 14:25:55', '2024-09-10 14:25:55'),
(2847, 'Health & Wellness', '#MentalWellness', NULL, NULL, '2024-09-10 14:25:55', '2024-09-10 14:25:55'),
(2848, 'Health & Wellness', '#SelfImprovement', NULL, NULL, '2024-09-10 14:25:55', '2024-09-10 14:25:55'),
(2849, 'Health & Wellness', '#EmotionalWellbeing', NULL, NULL, '2024-09-10 14:25:55', '2024-09-10 14:25:55'),
(2850, 'Health & Wellness', '#HealthyMind', NULL, NULL, '2024-09-10 14:25:55', '2024-09-10 14:25:55'),
(2851, 'Health & Wellness', '#MindBodySoul', NULL, NULL, '2024-09-10 14:25:55', '2024-09-10 14:25:55'),
(2852, 'Health & Wellness', '#MentalHealthMatters', NULL, NULL, '2024-09-10 14:25:55', '2024-09-10 14:25:55'),
(2853, 'Health & Wellness', '#WellnessGoals', NULL, NULL, '2024-09-10 14:25:55', '2024-09-10 14:25:55'),
(2854, 'Self-Improvement & Personal Growth', '#Motivation', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2855, 'Self-Improvement & Personal Growth', '#SelfGrowth', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2856, 'Self-Improvement & Personal Growth', '#PersonalDevelopment', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2857, 'Self-Improvement & Personal Growth', '#Inspiration', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2858, 'Self-Improvement & Personal Growth', '#Mindset', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2859, 'Self-Improvement & Personal Growth', '#GoalSetting', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2860, 'Self-Improvement & Personal Growth', '#DreamBig', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2861, 'Self-Improvement & Personal Growth', '#GrindAndShine', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2862, 'Self-Improvement & Personal Growth', '#StayMotivated', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2863, 'Self-Improvement & Personal Growth', '#ManifestingDreams', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2864, 'Self-Improvement & Personal Growth', '#SelfBetterment', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2865, 'Self-Improvement & Personal Growth', '#GrowthMindset', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2866, 'Self-Improvement & Personal Growth', '#SuccessMindset', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2867, 'Self-Improvement & Personal Growth', '#LevelUp', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2868, 'Self-Improvement & Personal Growth', '#PersonalGrowth', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2869, 'Self-Improvement & Personal Growth', '#DreamChaser', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2870, 'Self-Improvement & Personal Growth', '#BetterEveryDay', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2871, 'Self-Improvement & Personal Growth', '#KeepGrowing', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2872, 'Self-Improvement & Personal Growth', '#NeverStopLearning', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2873, 'Self-Improvement & Personal Growth', '#BecomeYourBestSelf', NULL, NULL, '2024-09-10 14:26:26', '2024-09-10 14:26:26'),
(2874, 'Positive Vibes & Inspiration', '#PositiveVibes', NULL, NULL, '2024-09-10 14:26:52', '2024-09-10 14:26:52'),
(2875, 'Positive Vibes & Inspiration', '#GoodVibesOnly', NULL, NULL, '2024-09-10 14:26:52', '2024-09-10 14:26:52'),
(2876, 'Positive Vibes & Inspiration', '#Vibes', NULL, NULL, '2024-09-10 14:26:52', '2024-09-10 14:26:52'),
(2877, 'Positive Vibes & Inspiration', '#SpreadPositivity', NULL, NULL, '2024-09-10 14:26:52', '2024-09-10 14:26:52'),
(2878, 'Positive Vibes & Inspiration', '#GoodEnergy', NULL, NULL, '2024-09-10 14:26:52', '2024-09-10 14:26:52'),
(2879, 'Positive Vibes & Inspiration', '#HighVibes', NULL, NULL, '2024-09-10 14:26:52', '2024-09-10 14:26:52'),
(2880, 'Positive Vibes & Inspiration', '#PositiveThoughts', NULL, NULL, '2024-09-10 14:26:52', '2024-09-10 14:26:52'),
(2881, 'Positive Vibes & Inspiration', '#StayPositive', NULL, NULL, '2024-09-10 14:26:52', '2024-09-10 14:26:52'),
(2882, 'Positive Vibes & Inspiration', '#InspireOthers', NULL, NULL, '2024-09-10 14:26:52', '2024-09-10 14:26:52'),
(2883, 'Positive Vibes & Inspiration', '#BeTheLight', NULL, NULL, '2024-09-10 14:26:52', '2024-09-10 14:26:52'),
(2884, 'Positive Vibes & Inspiration', '#AttitudeOfGratitude', NULL, NULL, '2024-09-10 14:26:52', '2024-09-10 14:26:52'),
(2885, 'Positive Vibes & Inspiration', '#Positivity', NULL, NULL, '2024-09-10 14:26:52', '2024-09-10 14:26:52'),
(2886, 'Positive Vibes & Inspiration', '#VibeCheck', NULL, NULL, '2024-09-10 14:26:52', '2024-09-10 14:26:52'),
(2887, 'Positive Vibes & Inspiration', '#PositiveEnergy', NULL, NULL, '2024-09-10 14:26:52', '2024-09-10 14:26:52'),
(2888, 'Positive Vibes & Inspiration', '#ChooseHappiness', NULL, NULL, '2024-09-10 14:26:52', '2024-09-10 14:26:52'),
(2889, 'Positive Vibes & Inspiration', '#GratefulHeart', NULL, NULL, '2024-09-10 14:26:52', '2024-09-10 14:26:52'),
(2890, 'Mindfulness & Minimalism', '#Mindfulness', NULL, NULL, '2024-09-10 14:27:16', '2024-09-10 14:27:16'),
(2891, 'Mindfulness & Minimalism', '#MindfulLiving', NULL, NULL, '2024-09-10 14:27:16', '2024-09-10 14:27:16'),
(2892, 'Mindfulness & Minimalism', '#SimplifyLife', NULL, NULL, '2024-09-10 14:27:16', '2024-09-10 14:27:16'),
(2893, 'Mindfulness & Minimalism', '#Minimalism', NULL, NULL, '2024-09-10 14:27:16', '2024-09-10 14:27:16'),
(2894, 'Mindfulness & Minimalism', '#IntentionalLiving', NULL, NULL, '2024-09-10 14:27:16', '2024-09-10 14:27:16'),
(2895, 'Mindfulness & Minimalism', '#LiveWithPurpose', NULL, NULL, '2024-09-10 14:27:16', '2024-09-10 14:27:16'),
(2896, 'Mindfulness & Minimalism', '#BePresent', NULL, NULL, '2024-09-10 14:27:16', '2024-09-10 14:27:16'),
(2897, 'Mindfulness & Minimalism', '#StayGrounded', NULL, NULL, '2024-09-10 14:27:16', '2024-09-10 14:27:16'),
(2898, 'Mindfulness & Minimalism', '#BreatheInBreatheOut', NULL, NULL, '2024-09-10 14:27:16', '2024-09-10 14:27:16'),
(2899, 'Mindfulness & Minimalism', '#PeaceOfMind', NULL, NULL, '2024-09-10 14:27:16', '2024-09-10 14:27:16'),
(2900, 'Mindfulness & Minimalism', '#Clarity', NULL, NULL, '2024-09-10 14:27:16', '2024-09-10 14:27:16'),
(2901, 'Mindfulness & Minimalism', '#FocusOnWhatMatters', NULL, NULL, '2024-09-10 14:27:16', '2024-09-10 14:27:16'),
(2902, 'Mindfulness & Minimalism', '#LessIsMore', NULL, NULL, '2024-09-10 14:27:16', '2024-09-10 14:27:16'),
(2903, 'Mindfulness & Minimalism', '#SlowLiving', NULL, NULL, '2024-09-10 14:27:16', '2024-09-10 14:27:16'),
(2904, 'Mindfulness & Minimalism', '#BalancedLife', NULL, NULL, '2024-09-10 14:27:16', '2024-09-10 14:27:16'),
(2905, 'Work-Life Balance & Productivity', '#WorkLifeBalance', NULL, NULL, '2024-09-10 14:27:39', '2024-09-10 14:27:39'),
(2906, 'Work-Life Balance & Productivity', '#LifeBalance', NULL, NULL, '2024-09-10 14:27:39', '2024-09-10 14:27:39'),
(2907, 'Work-Life Balance & Productivity', '#BalancedLifestyle', NULL, NULL, '2024-09-10 14:27:39', '2024-09-10 14:27:39'),
(2908, 'Work-Life Balance & Productivity', '#WorkHardPlayHard', NULL, NULL, '2024-09-10 14:27:39', '2024-09-10 14:27:39'),
(2909, 'Work-Life Balance & Productivity', '#TimeManagement', NULL, NULL, '2024-09-10 14:27:39', '2024-09-10 14:27:39'),
(2910, 'Work-Life Balance & Productivity', '#StayProductive', NULL, NULL, '2024-09-10 14:27:39', '2024-09-10 14:27:39'),
(2911, 'Work-Life Balance & Productivity', '#GetItDone', NULL, NULL, '2024-09-10 14:27:39', '2024-09-10 14:27:39'),
(2912, 'Work-Life Balance & Productivity', '#HustleAndFlow', NULL, NULL, '2024-09-10 14:27:39', '2024-09-10 14:27:39'),
(2913, 'Work-Life Balance & Productivity', '#ProductivityHacks', NULL, NULL, '2024-09-10 14:27:39', '2024-09-10 14:27:39'),
(2914, 'Work-Life Balance & Productivity', '#WorkSmart', NULL, NULL, '2024-09-10 14:27:39', '2024-09-10 14:27:39'),
(2915, 'Work-Life Balance & Productivity', '#EfficientLiving', NULL, NULL, '2024-09-10 14:27:39', '2024-09-10 14:27:39'),
(2916, 'Work-Life Balance & Productivity', '#TimeForMe', NULL, NULL, '2024-09-10 14:27:39', '2024-09-10 14:27:39'),
(2917, 'Work-Life Balance & Productivity', '#MeTime', NULL, NULL, '2024-09-10 14:27:39', '2024-09-10 14:27:39'),
(2918, 'Work-Life Balance & Productivity', '#WorkLifeHarmony', NULL, NULL, '2024-09-10 14:27:39', '2024-09-10 14:27:39'),
(2919, 'Work-Life Balance & Productivity', '#WellBalanced', NULL, NULL, '2024-09-10 14:27:39', '2024-09-10 14:27:39'),
(2920, 'Motivation & Goal Setting', '#Goals', NULL, NULL, '2024-09-10 14:28:05', '2024-09-10 14:28:05'),
(2921, 'Motivation & Goal Setting', '#GoalGetter', NULL, NULL, '2024-09-10 14:28:05', '2024-09-10 14:28:05'),
(2922, 'Motivation & Goal Setting', '#DreamChaser', NULL, NULL, '2024-09-10 14:28:05', '2024-09-10 14:28:05'),
(2923, 'Motivation & Goal Setting', '#SetGoals', NULL, NULL, '2024-09-10 14:28:05', '2024-09-10 14:28:05'),
(2924, 'Motivation & Goal Setting', '#GoalDigger', NULL, NULL, '2024-09-10 14:28:05', '2024-09-10 14:28:05'),
(2925, 'Motivation & Goal Setting', '#VisionBoard', NULL, NULL, '2024-09-10 14:28:05', '2024-09-10 14:28:05'),
(2926, 'Motivation & Goal Setting', '#PlanAndExecute', NULL, NULL, '2024-09-10 14:28:05', '2024-09-10 14:28:05'),
(2927, 'Motivation & Goal Setting', '#CrushingIt', NULL, NULL, '2024-09-10 14:28:05', '2024-09-10 14:28:05'),
(2928, 'Motivation & Goal Setting', '#BigDreams', NULL, NULL, '2024-09-10 14:28:05', '2024-09-10 14:28:05'),
(2929, 'Motivation & Goal Setting', '#AchieveGreatness', NULL, NULL, '2024-09-10 14:28:05', '2024-09-10 14:28:05'),
(2930, 'Motivation & Goal Setting', '#SuccessDriven', NULL, NULL, '2024-09-10 14:28:05', '2024-09-10 14:28:05'),
(2931, 'Motivation & Goal Setting', '#GoForIt', NULL, NULL, '2024-09-10 14:28:05', '2024-09-10 14:28:05'),
(2932, 'Motivation & Goal Setting', '#MakeItHappen', NULL, NULL, '2024-09-10 14:28:05', '2024-09-10 14:28:05'),
(2933, 'Motivation & Goal Setting', '#GoalCrusher', NULL, NULL, '2024-09-10 14:28:05', '2024-09-10 14:28:05'),
(2934, 'Motivation & Goal Setting', '#SuccessGoals', NULL, NULL, '2024-09-10 14:28:05', '2024-09-10 14:28:05'),
(2935, 'Motivation & Goal Setting', '#DreamBigWorkHard', NULL, NULL, '2024-09-10 14:28:05', '2024-09-10 14:28:05'),
(2936, 'Personal Fashion & Style', '#Style', NULL, NULL, '2024-09-10 14:28:27', '2024-09-10 14:28:27'),
(2937, 'Personal Fashion & Style', '#MyStyle', NULL, NULL, '2024-09-10 14:28:27', '2024-09-10 14:28:27'),
(2938, 'Personal Fashion & Style', '#LifestyleBlog', NULL, NULL, '2024-09-10 14:28:27', '2024-09-10 14:28:27'),
(2939, 'Personal Fashion & Style', '#OutfitInspo', NULL, NULL, '2024-09-10 14:28:27', '2024-09-10 14:28:27'),
(2940, 'Personal Fashion & Style', '#PersonalStyle', NULL, NULL, '2024-09-10 14:28:27', '2024-09-10 14:28:27'),
(2941, 'Personal Fashion & Style', '#WhatIWore', NULL, NULL, '2024-09-10 14:28:27', '2024-09-10 14:28:27'),
(2942, 'Personal Fashion & Style', '#OOTD (Outfit Of The Day)', NULL, NULL, '2024-09-10 14:28:27', '2024-09-10 14:28:27'),
(2943, 'Personal Fashion & Style', '#DressToImpress', NULL, NULL, '2024-09-10 14:28:27', '2024-09-10 14:28:27'),
(2944, 'Personal Fashion & Style', '#StylishLiving', NULL, NULL, '2024-09-10 14:28:27', '2024-09-10 14:28:27'),
(2945, 'Personal Fashion & Style', '#EffortlessStyle', NULL, NULL, '2024-09-10 14:28:27', '2024-09-10 14:28:27'),
(2946, 'Personal Fashion & Style', '#LifeInStyle', NULL, NULL, '2024-09-10 14:28:27', '2024-09-10 14:28:27'),
(2947, 'Personal Fashion & Style', '#StyleGoals', NULL, NULL, '2024-09-10 14:28:27', '2024-09-10 14:28:27'),
(2948, 'Personal Fashion & Style', '#FashionAndLifestyle', NULL, NULL, '2024-09-10 14:28:27', '2024-09-10 14:28:27'),
(2949, 'Personal Fashion & Style', '#EverydayFashion', NULL, NULL, '2024-09-10 14:28:27', '2024-09-10 14:28:27'),
(2950, 'Family, Friends & Relationships', '#FamilyLife', NULL, NULL, '2024-09-10 14:28:50', '2024-09-10 14:28:50'),
(2951, 'Family, Friends & Relationships', '#FamilyTime', NULL, NULL, '2024-09-10 14:28:50', '2024-09-10 14:28:50'),
(2952, 'Family, Friends & Relationships', '#FriendsAndFamily', NULL, NULL, '2024-09-10 14:28:50', '2024-09-10 14:28:50'),
(2953, 'Family, Friends & Relationships', '#LoveAndFamily', NULL, NULL, '2024-09-10 14:28:50', '2024-09-10 14:28:50'),
(2954, 'Family, Friends & Relationships', '#QualityTime', NULL, NULL, '2024-09-10 14:28:50', '2024-09-10 14:28:50'),
(2955, 'Family, Friends & Relationships', '#MakingMemories', NULL, NULL, '2024-09-10 14:28:50', '2024-09-10 14:28:50'),
(2956, 'Family, Friends & Relationships', '#CherishEveryMoment', NULL, NULL, '2024-09-10 14:28:50', '2024-09-10 14:28:50'),
(2957, 'Family, Friends & Relationships', '#FamilyGoals', NULL, NULL, '2024-09-10 14:28:50', '2024-09-10 14:28:50'),
(2958, 'Family, Friends & Relationships', '#Besties', NULL, NULL, '2024-09-10 14:28:50', '2024-09-10 14:28:50'),
(2959, 'Family, Friends & Relationships', '#FriendshipGoals', NULL, NULL, '2024-09-10 14:28:50', '2024-09-10 14:28:50'),
(2960, 'Family, Friends & Relationships', '#SupportSystem', NULL, NULL, '2024-09-10 14:28:50', '2024-09-10 14:28:50'),
(2961, 'Family, Friends & Relationships', '#SquadGoals', NULL, NULL, '2024-09-10 14:28:50', '2024-09-10 14:28:50'),
(2962, 'Family, Friends & Relationships', '#BondingTime', NULL, NULL, '2024-09-10 14:28:50', '2024-09-10 14:28:50'),
(2963, 'Family, Friends & Relationships', '#MyPeople', NULL, NULL, '2024-09-10 14:28:50', '2024-09-10 14:28:50'),
(2964, 'Family, Friends & Relationships', '#TogetherWeThrive', NULL, NULL, '2024-09-10 14:28:50', '2024-09-10 14:28:50'),
(2965, 'Hobbies & Interests', '#HobbyLife', NULL, NULL, '2024-09-10 14:29:08', '2024-09-10 14:29:08'),
(2966, 'Hobbies & Interests', '#PassionProject', NULL, NULL, '2024-09-10 14:29:08', '2024-09-10 14:29:08'),
(2967, 'Hobbies & Interests', '#DoingWhatILove', NULL, NULL, '2024-09-10 14:29:08', '2024-09-10 14:29:08'),
(2968, 'Hobbies & Interests', '#MyHobby', NULL, NULL, '2024-09-10 14:29:08', '2024-09-10 14:29:08'),
(2969, 'Hobbies & Interests', '#PursueYourPassion', NULL, NULL, '2024-09-10 14:29:08', '2024-09-10 14:29:08'),
(2970, 'Hobbies & Interests', '#CreativeLiving', NULL, NULL, '2024-09-10 14:29:08', '2024-09-10 14:29:08'),
(2971, 'Hobbies & Interests', '#HobbyGoals', NULL, NULL, '2024-09-10 14:29:08', '2024-09-10 14:29:08'),
(2972, 'Hobbies & Interests', '#ChaseHappiness', NULL, NULL, '2024-09-10 14:29:08', '2024-09-10 14:29:08'),
(2973, 'Hobbies & Interests', '#UnwindAndRelax', NULL, NULL, '2024-09-10 14:29:08', '2024-09-10 14:29:08'),
(2974, 'Hobbies & Interests', '#HobbyTime', NULL, NULL, '2024-09-10 14:29:08', '2024-09-10 14:29:08'),
(2975, 'Hobbies & Interests', '#WeekendVibes', NULL, NULL, '2024-09-10 14:29:08', '2024-09-10 14:29:08'),
(2976, 'Hobbies & Interests', '#HappyPlace', NULL, NULL, '2024-09-10 14:29:08', '2024-09-10 14:29:08');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commentlikes`
--

CREATE TABLE `commentlikes` (
  `id` bigint UNSIGNED NOT NULL,
  `comment_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `like_status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commentreports`
--

CREATE TABLE `commentreports` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `comment_id` bigint UNSIGNED DEFAULT NULL,
  `reply_id` bigint UNSIGNED DEFAULT NULL,
  `type` tinyint NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commentreports`
--

INSERT INTO `commentreports` (`id`, `user_id`, `comment_id`, `reply_id`, `type`, `message`, `created_at`, `updated_at`) VALUES
(11, 196, 165, NULL, 0, 'Scam or fraud', '2024-09-20 14:49:41', '2024-09-20 14:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `comment`, `created_at`, `updated_at`) VALUES
(149, 182, 74, '🔥', '2024-09-17 16:46:34', '2024-09-17 16:46:34'),
(151, 188, 48, 'hii', '2024-09-17 18:52:32', '2024-09-17 18:52:32'),
(155, 196, 22, 'Good', '2024-09-17 21:48:59', '2024-09-17 21:48:59'),
(156, 196, 22, '😍🔥ksks', '2024-09-17 21:49:28', '2024-09-17 21:49:28'),
(157, 196, 44, '❤️🔥', '2024-09-17 21:49:49', '2024-09-17 21:49:49'),
(158, 196, 20, 'testing', '2024-09-17 21:55:15', '2024-09-17 21:55:15'),
(159, 196, 20, '🔥🔥', '2024-09-17 21:55:23', '2024-09-17 21:55:23'),
(160, 196, 20, '👋👋😍', '2024-09-17 21:55:36', '2024-09-17 21:55:36'),
(161, 196, 20, '😂😂😂', '2024-09-17 21:56:35', '2024-09-17 21:56:35'),
(162, 196, 37, 'hey', '2024-09-18 09:09:20', '2024-09-18 09:09:20'),
(163, 196, 37, '😍😍', '2024-09-18 09:09:24', '2024-09-18 09:09:24'),
(164, 189, 67, 'test', '2024-09-18 09:13:10', '2024-09-18 09:13:10'),
(165, 189, 93, 'hlo', '2024-09-18 09:14:13', '2024-09-18 09:14:13'),
(166, 196, 28, 'hdhsjjsj', '2024-09-18 11:12:16', '2024-09-18 11:12:16'),
(167, 196, 28, 'hcjjd', '2024-09-18 11:12:47', '2024-09-18 11:12:47'),
(168, 196, 25, '😍😍👍', '2024-09-18 13:14:57', '2024-09-18 13:14:57'),
(169, 188, 33, '🙏', '2024-09-18 13:36:48', '2024-09-18 13:36:48'),
(170, 188, 33, 'Jai ganesh', '2024-09-18 13:37:22', '2024-09-18 13:37:22'),
(171, 187, 42, 'bappa', '2024-09-19 20:32:19', '2024-09-19 20:32:19'),
(172, 187, 42, 'bappa', '2024-09-19 20:32:26', '2024-09-19 20:32:26'),
(173, 196, 93, 'hii', '2024-09-20 12:49:48', '2024-09-20 12:49:48'),
(174, 196, 40, '🔥🔥🔥', '2024-09-20 14:24:06', '2024-09-20 14:24:06'),
(175, 196, 54, '😁😁🤣🤣', '2024-09-20 14:36:26', '2024-09-20 14:36:26'),
(176, 196, 54, 'mbbm', '2024-09-20 14:36:31', '2024-09-20 14:36:31'),
(177, 196, 89, '😂😂', '2024-09-20 14:38:05', '2024-09-20 14:38:05'),
(178, 196, 19, '🙏', '2024-09-20 14:44:35', '2024-09-20 14:44:35'),
(179, 200, 54, '😂', '2024-09-24 20:47:41', '2024-09-24 20:47:41'),
(180, 189, 75, 'Herooo', '2024-09-25 20:16:53', '2024-09-25 20:16:53'),
(181, 180, 66, '❤️❤️', '2024-09-25 23:25:29', '2024-09-25 23:25:29'),
(182, 196, 48, '😍😍😍', '2024-09-27 21:13:18', '2024-09-27 21:13:18'),
(183, 180, 74, '🔥🔥🔥', '2024-09-29 15:56:55', '2024-09-29 15:56:55');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(2, 'Vida Zinnbauer', 'vida.zinnbauer@googlemail.com', '9707817263', 'Query regarding lablum.com', 'Hi there,\r\n\r\nI\'ve just been on lablum.com and wondered if you\'d ever considered writing an eBook?\r\n\r\nOur software allows you to turn lablum.com into a fully designed eBook. Just provide the content source, and the AI will do the rest.\r\n   \r\n1. Generate unique and human-like content, ensuring your eBook is engaging and informative.\r\n2. Create stunning 3D eCovers to grab attention and make your book stand out.\r\n3. Publish your eBook instantly on a built-in marketplace with potential buyers.\r\n4. Distribute your book to over 50 publications to increase your reach and drive traffic.\r\n\r\nThe price is just $16.95 but the price rises shortly.\r\n\r\nLearn more: https://furtherinfo.org/zfqs\r\n\r\nRegards,\r\nVida', '2024-04-15 16:09:29', '2024-04-15 16:09:29'),
(3, 'Danielle Simpson', 'simpsondanielle800@gmail.com', '143461782', 'Explainer Video for lablum.com?', 'Hi,\r\n\r\nI just visited lablum.com and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nI can show you some previous videos we\'ve done if you want me to send some over. Let me know if you\'re interested in seeing samples of our previous work.\r\n\r\nRegards,\r\nDanielle', '2024-04-16 01:01:11', '2024-04-16 01:01:11'),
(4, 'Emily Jones', 'emilyjones2250@gmail.com', '7771523427', 'YouTube Promotion: Grow your subscribers by 700-1500 each month', 'Hi there,\r\n\r\nWe run a Youtube  growth service, where we can increase your subscriber count safely and practically. \r\n\r\n- Guaranteed: We guarantee to gain you 700-1500 new subscribers each month.\r\n- Real, human subscribers who subscribe because they are interested in your channel/videos.\r\n- Safe: All actions are done, without using any automated tasks / bots.\r\n\r\nOur price is just $60 (USD) per month and we can start immediately.\r\n\r\nWe also grow Instagram followers (300-1000 for $60).\r\n\r\nGet in touch if you would like to know more.\r\n\r\nKind Regards,\r\nEmily', '2024-04-16 05:22:13', '2024-04-16 05:22:13'),
(5, 'RichardWouri', 'yasen.krasen.13+99559@mail.ru', '85795781915', 'Mjewdjwjdw jwksqkowjfjj kkepwlw3jreklm kwldewkdjr3kdw2o keo2kswlkforejw', 'Odowidjwoidwo wojdwkslqmwjfbjjdwkd jkwlsqswknfbjwjdmkqendj kedwjdbwhbdqjswkdwjfj eqwkdwknf lablum.com', '2024-04-22 18:46:59', '2024-04-22 18:46:59'),
(6, 'Eu Business Registry', 'contact@ebrmail.info', '7203001382', 'Update your details for lablum.com for 2024!', 'Hello,\r\n\r\nPlease update your company details for the Eu Business Registry for 2024!\r\n\r\nTo check your details now, please visit  https://www.ebrupdate.com/\r\n\r\nUpdating is free of charge!\r\n\r\nPlease return the completed form to: contact@infoebr.com\r\n\r\nRegards,\r\n\r\nEu Business Register - Data Accuracy Division', '2024-04-25 00:46:08', '2024-04-25 00:46:08'),
(7, 'Bobbyced', 'sfdsdfsdfd@gmail.com', '84272925537', 'new scientific political system', 'Hello! Company Political Science a completely new scientific political system, which has never been seen before in the history of mankind. The document contains 10 pages of detailed description. You can buy this sex-free document for 950$, payment bitcoin. To obtain and pay for it, go to the proxy-tunneled self-hosted site, click Visit Site, register without using personal data, make payment and download the document. Thank you in advance. \r\n \r\nSelf-hosted website:  https://dzt69hg.localto.net/ \r\nIf pages don\'t load - refresh.', '2024-05-06 08:34:44', '2024-05-06 08:34:44'),
(8, 'Amelia Brown', 'ameliabrown0325@gmail.com', '3855563705', 'Youtube Promotion: Grow your subscribers by 700 each month', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically. \r\n\r\n- We guarantee to gain you 700+ new subscribers per month.\r\n- People subscribe because they are interested in your videos/channel, increasing video likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you\'d like to see some of our previous work, let me know, and we can discuss it further.\r\n\r\nKind Regards,\r\nAmelia', '2024-05-07 20:48:56', '2024-05-07 20:48:56'),
(9, 'Isla Holtzmann', 'isla.holtzmann@gmail.com', '4169295703', 'Your Secret Weapon for a Killer WordPress Site', 'Hey there,\r\n\r\nImagine your WordPress site powered by AI!\r\n\r\nOur plugin writes captivating content, designs stunning visuals, and automates marketing tasks - all within your Wordpress dashboard.\r\n\r\nMore info:  https://furtherinfo.org/wpg\r\n\r\nSincerely,\r\n\r\nIsla', '2024-05-17 17:40:55', '2024-05-17 17:40:55'),
(10, 'Dora Verburen', 'doraverburen@gmail.com', '+18777151071', 'FYI got an error on your webpage', 'Hi\r\n\r\nI was doing some research for a client. As I was browsing through your website, I experienced an issue accessing lablum.com.\r\n\r\nI understand it can be difficult to keep track of every aspect of a website.\r\n\r\nFor my own needs, I regularly turn to tools like https://websitecheckhealth.com to ensure I\'m getting the most out of my health-related websites. It offers a comprehensive report at no cost.\r\n\r\nIf you need any assistance in this area, feel free to reach out.\r\n\r\nWarm regards, Dora', '2024-05-17 23:08:59', '2024-05-17 23:08:59'),
(11, 'Amelia Brown', 'ameliabrown0325@gmail.com', '7247814961', 'Youtube Promotion: Grow your subscribers by 700 each month', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically. \r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nAmelia\r\n\r\nUnsubscribe: https://removeme.click/yt/unsubscribe.php?d=lablum.com', '2024-06-02 04:30:26', '2024-06-02 04:30:26'),
(12, 'Abel Shimp', 'shimp.abel@googlemail.com', '614701278', 'Turn lablum.com into an eBook: Easy & Engaging!', 'Hi there,\r\n\r\nI recently came across your website on lablum.com and found it very interesting. I was curious, have you ever considered creating an eBook out of your website content?\r\n\r\nThere are tools available, that allow you to easily convert website content into a well-designed eBook. This could be a great way to repurpose your existing content and potentially reach a new audience.\r\n\r\nOf course, I understand this might not be something you\'re interested in, but I just wanted to share the possibility!\r\n\r\nAnyway, here is the tool I had in mind. It\'s only $16.95 so worth checking out: \r\nhttps://furtherinfo.org/lgb7\r\n\r\nBest regards,\r\nAbel\r\n\r\nUnsubscribe: https://removeme.click/wp/unsubscribe.php?d=lablum.com', '2024-06-03 13:26:16', '2024-06-03 13:26:16'),
(13, 'Cathleen Pierson', 'pierson.cathleen40@googlemail.com', '98761124', 'Tired of Monthly Hosting Fees?', 'Hi there,\r\n\r\nAre you tired of paying monthly fees for website hosting, cloud storage, and funnels?\r\n\r\nWe offer a revolutionary solution: host unlimited websites, files, and videos for a single, low one-time fee. No more monthly payments.\r\n\r\nHere\'s what you get:\r\n\r\nUltra-fast hosting powered by Intel® Xeon® CPU technology\r\nUnlimited website hosting\r\nUnlimited cloud storage\r\nUnlimited video hosting\r\nUnlimited funnel creation\r\nFree SSL certificates for all domains and files\r\n99.999% uptime guarantee\r\n24/7 customer support\r\nEasy-to-use cPanel\r\n365-day money-back guarantee\r\n\r\nPlus, get these exclusive bonuses when you act now:\r\n\r\n60+ reseller licenses (sell hosting to your clients!)\r\n10 Fast-Action Bonuses worth over $19,997 (including AI tools, traffic generation, and more!)\r\n\r\nDon\'t miss out on this limited-time offer! The price is about to increase, and this one-time fee won\'t last forever.\r\n\r\nClick here to learn more: https://furtherinfo.org/yarx\r\n\r\nCathleen', '2024-06-10 13:05:53', '2024-06-10 13:05:53'),
(14, 'Amelia Brown', 'ameliabrown0325@gmail.com', '5198219317', 'Youtube Promotion: Grow your subscribers by 700 each month', 'Hi there,\r\n\r\nWe run a Youtube growth service, where we can increase your subscriber count safely and practically. \r\n\r\n- Guaranteed: We guarantee to gain you 700-1500 new subscribers each month.\r\n- Real, human subscribers who subscribe because they are interested in your channel/videos.\r\n- Safe: All actions are done, without using any automated tasks / bots.\r\n\r\nOur price is just $60 (USD) per month and we can start immediately.\r\n\r\nIf you are interested then we can discuss further.\r\n\r\nKind Regards,\r\nAmelia\r\n\r\nUnsubscribe: https://removeme.click/yt/unsubscribe.php?d=lablum.com', '2024-06-15 12:01:37', '2024-06-15 12:01:37'),
(15, 'Stevon Garmon', 'stevon+te54@gmail.com', '3660382128', 'Dear lablum.com Owner!', 'I recently visited your website and had a couple of questions. Is this the best way to reach you?', '2024-06-18 12:27:15', '2024-06-18 12:27:15'),
(16, 'Joanna Riggs', 'joannariggs278@gmail.com', '9084376431', 'Video Promotion for your website', 'Hi,\r\n\r\nI just visited lablum.com and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur videos cost just $195 for a 30 second video ($239 for 60 seconds) and include a full script, voice-over and video.\r\n\r\nI can show you some previous videos we\'ve done if you want me to send some over. Let me know if you\'re interested in seeing samples of our previous work.\r\n\r\nRegards,\r\nJoanna\r\n\r\nUnsubscribe: https://removeme.click/ev/unsubscribe.php?d=lablum.com', '2024-06-29 02:57:05', '2024-06-29 02:57:05'),
(17, 'K Paul', 'letsgetuoptimize@gmail.com', '(949) 508-0277', 'Re: SEO Services', 'Hey team lablum.com,\r\n\r\nI was looking at your website and realized that despite having a good design; it was not ranking high on any of the Search Engines (Google, Yahoo & Bing) for most of the keywords related to your business.\r\n\r\nWe can place your website on Google\'s 1st page.\r\n\r\n? Top ranking on Google search!\r\n? Improve website clicks and views!\r\n? Increase Your Leads, clients & Revenue!\r\n\r\nI can send you more details on the packages/Portfolio/past work details.\r\n\r\nWell wishes,\r\nK Paul\r\n\r\n\r\n\r\n\r\n\r\nIf you don’t want me to contact you again about this, reply with “unsubscribe”', '2024-07-01 14:24:47', '2024-07-01 14:24:47'),
(18, 'Lucy Johnson', 'lucyjohnson.web@gmail.com', '+1 213 262 0124', 'Re: Website Design & development service!', 'Hey,\r\n\r\nI was just browsing your website and I came up with a great plan to re-develop your website using the latest technology to generate additional revenue and beat your opponents.\r\n\r\nI\'m an excellent web developer capable of almost anything you can come up with, and my costs are affordable for nearly everyone.\r\n\r\nI would be happy to send you \"Quotes\", “Proposal” Past work Details, \"Our Packages\", and “Offers”!\r\n\r\nThanks in advance,\r\nLucy (Business Development Executive)\r\n\r\n\r\n\r\nYour Website : lablum.com', '2024-07-05 16:00:09', '2024-07-05 16:00:09'),
(19, 'Joanna Riggs', 'joannariggs278@gmail.com', '291091328', 'Video Promotion for your website', 'Hi,\r\n\r\nI just visited lablum.com and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur prices start from just $195.\r\n\r\nLet me know if you\'re interested in seeing samples of our previous work.\r\n\r\nRegards,\r\nJoanna', '2024-07-06 08:42:16', '2024-07-06 08:42:16'),
(20, 'Amandasweefs1', 'amandaImpomi2@gmail.com', '86488876415', 'Hey stud, ready for love?', 'Hey darling, want to hang out? -  https://is.gd/2xVU7z?utetlyDer', '2024-07-07 09:01:25', '2024-07-07 09:01:25'),
(21, 'Amelia Brown', 'ameliabrown0325@gmail.com', '4405332257', 'Youtube Promotion: 700 new subscribers each month', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically. \r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nAmelia\r\n\r\nUnsubscribe: https://removeme.click/yt/unsubscribe.php?d=lablum.com', '2024-07-08 01:54:37', '2024-07-08 01:54:37'),
(22, 'Julian Decker', 'moveyou938+j0k@gmail.com', '224923874', 'Your product is too expensive', 'Just thought I\'d let you know. When you registered lablum.com with GoDaddy you were charged their first-year domain product price When you go to renew the domain, It always goes up.\r\nThat\'s on top of any increase for other products like Hosting, SSL Certificate or Email service you have.\r\n\r\nThere\'s no rush now but, you have until 12/17/2026 to avoid overpaying their domain renewal fees \r\nI kept making that same mistake year after year. I wish that was all I made, but sadly that\'s just 1 of the 6 I was guilty of.\r\nMaybe the article I wrote could help you avoid the other 5? \r\nhttps://BeWebsiteWise.com\r\n\r\nThanks\r\nJulian\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nTo opt out of future communications click the link below. \r\nhttps://optoutform.net/?site=http://lablum.com/\r\n\r\n\r\n\r\n\r\nGLBL \r\n300 Lafollette Station Dr \r\nFloyds Knobs, IN 47119', '2024-07-09 05:59:20', '2024-07-09 05:59:20'),
(23, 'Jay Paul', 'webbgrow3@gmail.com', '1234567890', 'Re: Innovative Website Redevelopment Proposal', 'Dear Sir/Maam,\r\n\r\nwww.lablum.com\r\n\r\nI have thoroughly reviewed your current website and believe there is a significant opportunity to enhance it with cutting-edge technology.\r\n\r\nThis redevelopment is not only poised to boost revenue but also to provide a competitive edge in your industry.\r\n\r\nI\'m an excellent web developer capable of almost anything you can come up with, and my costs are affordable for nearly everyone.\r\n\r\nI would be happy to send you \"Quotes\", “Proposal” Past work Details, \"Our Packages\", and “Offers”!\r\n\r\nWarm regards,\r\nJay Paul (Web Solution Manager)\r\n\r\n\r\n\r\n\r\n\r\nIf you don’t want me to contact you again about this, reply with “unsubscribe”', '2024-07-11 13:08:36', '2024-07-11 13:08:36'),
(24, 'Stacy Clayton', 'clayton.stacy32@gmail.com', '523836294', 'Tired of Monthly Hosting Fees?', 'Hi there,\r\n\r\nAre you tired of paying monthly fees for website hosting, cloud storage, and funnels?\r\n\r\nWe offer a revolutionary solution: host unlimited websites, files, and videos for a single, low one-time fee. No more monthly payments.\r\n\r\nLearn more: https://furtherinfo.org/0wg3\r\n\r\nHere\'s what you get:\r\n\r\nUltra-fast hosting powered by Intel® Xeon® CPU technology\r\nUnlimited website hosting\r\nUnlimited cloud storage\r\nUnlimited video hosting\r\nUnlimited funnel creation\r\nFree SSL certificates for all domains and files\r\n99.999% uptime guarantee\r\n24/7 customer support\r\nEasy-to-use cPanel\r\n365-day money-back guarantee\r\n\r\nPlus, get these exclusive bonuses when you act now:\r\n\r\n60+ reseller licenses (sell hosting to your clients!)\r\n10 Fast-Action Bonuses worth over $19,997 (including AI tools, traffic generation, and more!)\r\n\r\nDon\'t miss out on this limited-time offer! The price is about to increase, and this one-time fee won\'t last forever.\r\n\r\nClick here to learn more: https://furtherinfo.org/0wg3\r\n\r\nStacy\r\n\r\n\r\nIf you do not wish to receive any further offers:\r\nhttps://removeme.click/wp/unsubscribe.php?d=lablum.com', '2024-07-12 10:17:46', '2024-07-12 10:17:46'),
(25, 'Ken Ziemba', 'kenp2024@aol.com', '26128436', 'Just found this site', 'Was just browsing the site and was impressed the layout. Nicely design and great user experience. Just had to drop a message, have a great day! 8dfds87a', '2024-07-16 06:55:55', '2024-07-16 06:55:55'),
(26, 'Tracyges', 'yasen.krasen.13+71247@mail.ru', '85183856585', 'Mjewdjwjdw jwksqkowjfjj kkepwlw3jreklm kwldewkdjr3kdw2o keo2kswlkforejw', 'Ofedkwdkjwkjdkwjdkjw jdwidjwijdwfw fjdkqwasqfoewofjewof ojqwejfqwkdokjwofjewofjewoi lablum.com', '2024-07-16 09:46:55', '2024-07-16 09:46:55'),
(27, 'Guimabremi', 'chebakulinakarasevna@gmail.com', '88689572823', 'teens got fucked', 'teen anal porn sex \r\n \r\nhttps://2econd.ru/bitrix/redirect.php?goto=https://xpornotube.xyz/\r\nhttp://liveartuk.org/?URL=https://xteentube.xyz/\r\nhttps://bereg-nv.ru/bitrix/redirect.php?goto=https://xteentube.xyz/\r\nhttps://signin.bradley.edu/cas/after_application_logout.jsp?applicationName=Bradley%20Sakai&applicationURL=https://xteentube.xyz/\r\nhttps://tavernhg.com/?URL=https://xteentube.xyz/\r\nhttps://locking-stumps.co.uk/warrington/primary/lockingstumps/site/pages/dates/schoolcalendar/CookiePolicy.action?backto=https://anal2tube.xyz/\r\nhttps://insta360rus.ru/bitrix/redirect.php?goto=https://xpornotube.xyz/\r\nhttp://tvoku.ru/proxy.php?link=https://xpornotube.xyz/', '2024-07-16 22:27:20', '2024-07-16 22:27:20'),
(28, 'Felicity Sauncho', 'felicitysauncho@gmail.com', '8013476653', 'Youtube Promotion: Grow your subscribers by 700 each month', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically. \r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nFelicity', '2024-07-20 20:12:13', '2024-07-20 20:12:13'),
(29, 'Sam Morris', 'applicationdevelopment03@gmail.com', '1234567890', 'Re: Innovative Website Redevelopment Proposal', 'Hey \r\n\r\nwww.lablum.com\r\n\r\nI was just browsing your website and I came up with a great plan to re-develop your website using the latest technology to generate additional revenue and beat your opponents.\r\n\r\nI\'m an excellent web developer capable of almost anything you can come up with, and my costs are affordable for nearly everyone.\r\n\r\nI would be happy to send you “Proposal” Past work Details, \"Our Packages\"!\r\n\r\nWarm regards,\r\nSam Morris (Web Solution Manager)\r\n\r\n\r\n\r\n\r\n\r\nIf you don’t want me to contact you again about this, reply with “Opt-Out”', '2024-07-30 14:42:36', '2024-07-30 14:42:36'),
(30, 'Greg Di Bruno', 'info@letsgetuoptimize.com', '(267) 972-1898', 'Re: The visibility and SEO of your website', 'Hey team lablum.com,\r\n\r\nI was looking at your website and realized that despite having a good design; it was not ranking high on any of the Search Engines (Google, Yahoo & Bing) for most of the keywords related to your business.\r\n\r\nWe can place your website on Google\'s 1st page.\r\n\r\n? Top ranking on Google search!\r\n? Improve website clicks and views!\r\n? Increase Your Leads, clients & Revenue!\r\n\r\nIf interested, May I send you a proposal & charges?\r\n\r\nRegards,\r\nGreg Di Bruno\r\nSenior Services Consultant - Let’s Get You Optimize\r\nEmail: info@letsgetuoptimize.com\r\nPhone: (267) 972-1898\r\n\r\n\r\n\r\n\r\n\r\nIf you don’t want me to contact you again about this, reply with “unsubscribe”', '2024-08-02 11:45:34', '2024-08-02 11:45:34'),
(31, 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregister.info/', 'submissions@searchindex.site', '322917499', 'Add lablum.com to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregister.info/', '2024-08-04 04:39:34', '2024-08-04 04:39:34'),
(32, 'Joanna Riggs', 'joannariggs278@gmail.com', '96383278', 'Explainer Video for your website', 'Hi,\r\n\r\nI just visited lablum.com and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur videos cost just $195 for a 30 second video ($239 for 60 seconds) and include a full script, voice-over and video.\r\n\r\nI can show you some previous videos we\'ve done if you want me to send some over. Let me know if you\'re interested in seeing samples of our previous work.\r\n\r\nRegards,\r\nJoanna', '2024-08-04 16:58:35', '2024-08-04 16:58:35'),
(33, 'Thomasbum', 'gngaeg1@icloud.com', '83234321675', 'Lucky You iPhone 16 Pro Max', 'You’ve Won Big iPhone 16 Pro Max http://www.saftrack.com/contentviewer.asp?content=https%3A%2F%2Ftelegra.ph%2Fiphone-07-06-5%3F2419', '2024-08-06 01:59:29', '2024-08-06 01:59:29'),
(34, 'Amelia Brown', 'ameliabrown12784@gmail.com', '7941985905', 'YouTube Promotion: 700-1500 new subscribers each month', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically. \r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nAmelia', '2024-08-06 03:32:15', '2024-08-06 03:32:15'),
(35, 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregistry.net/', 'milo.rinaldi@yahoo.com', '3372369320', 'Add lablum.com to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregistry.net/', '2024-08-07 22:15:26', '2024-08-07 22:15:26'),
(36, 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregistry.net/', 'tesha.meister@outlook.com', '7809839864', 'Add lablum.com to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregistry.net/', '2024-08-08 20:48:13', '2024-08-08 20:48:13'),
(37, 'Greg Di Bruno', 'info@letsgetuoptimize.com', '(267) 972-1898', 'SEO expansion for website', 'Hey team lablum.com,\r\n\r\nI was looking at your website and realized that despite having a good design; it was not ranking high on any of the Search Engines (Google, Yahoo & Bing) for most of the keywords related to your business.\r\n\r\nWe can place your website on Google\'s 1st page.\r\n\r\n*  Top ranking on Google search!\r\n*  Improve website clicks and views!\r\n*  Increase Your Leads, clients & Revenue!\r\n\r\n If you are interested, I will send you our SEO Packages and Cost. \r\n\r\nWell wishes,\r\nGreg Di Bruno\r\nSenior Services Consultant - Let’s Get You Optimize\r\nEmail: info@letsgetuoptimize.com\r\nPhone: (267) 972-1898\r\n\r\n\r\n\r\n\r\nIf you don’t want me to contact you again about this, reply with “unsubscribe”', '2024-08-09 15:39:44', '2024-08-09 15:39:44'),
(38, 'Katelyn Raiden', 'katelynraiden@gmail.com', '662100918', 'YouTube Promotion: 700-1500 new subscribers each month', 'Hi there,\r\n\r\nWe run a Youtube growth service, where we can increase your subscriber count safely and practically. \r\n\r\n- Guaranteed: We guarantee to gain you 700-1500 new subscribers each month.\r\n- Real, human subscribers who subscribe because they are interested in your channel/videos.\r\n- Safe: All actions are done, without using any automated tasks / bots.\r\n\r\nOur price is just $60 (USD) per month and we can start immediately.\r\n\r\nIf you are interested then we can discuss further.\r\n\r\nKind Regards,\r\nKatelyn', '2024-08-12 11:41:02', '2024-08-12 11:41:02'),
(39, 'JerryHab', 'simrankaur852821@gmail.com', '88869436165', 'CLAIM YOUR $50,000 JACKPOT URGENTLY', 'Swift Claim: Get Your $50,000 Prize Now https://script.google.com/macros/s/AKfycbw1MS3HesW11FjLDhN0phaAyqVaYl1MBF_oYopCbiCFPX_jH7ES7hg3CXOVVz8cZv-4Vg/exec', '2024-08-14 04:53:47', '2024-08-14 04:53:47'),
(40, 'Greg Di Bruno', 'info@letsgetuoptimize.com', '9497671355', 'Re: SEO Packages and Costs', 'Hey team lablum.com,\r\n\r\nI was looking at your website and realized that despite having a good design; it was not ranking high on any of the Search Engines (Google, Yahoo & Bing) for most of the keywords related to your business.\r\n\r\nWe can place your website on Google\'s 1st page.\r\n\r\n*  Top ranking on Google search!\r\n*  Improve website clicks and views!\r\n*  Increase Your Leads, clients & Revenue!\r\n\r\nInterested? Please provide your name, contact information, and email.\r\n\r\nWell wishes,\r\nGreg Di Bruno\r\nSenior Services Consultant - Let’s Get You Optimize\r\nEmail: info@letsgetuoptimize.com\r\nPhone: 9497671355\r\n\r\n\r\n\r\n\r\nIf you don’t want me to contact you again about this, reply with “unsubscribe”', '2024-08-16 14:54:24', '2024-08-16 14:54:24'),
(41, 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregistry.net/', 'arnette.peebles@yahoo.com', '7653311598', 'Add lablum.com to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregistry.net/', '2024-08-18 22:54:53', '2024-08-18 22:54:53'),
(42, 'Greg Di Bruno', 'letsgetuoptimize@gmail.com', '9497671355', 'Re: Want to more clients and customers?', 'Hey team lablum.com,\r\n\r\nI was looking at your website and realized that despite having a good design; it was not ranking high on any of the Search Engines (Google, Yahoo & Bing) for most of the keywords related to your business.\r\n\r\nWe can place your website on Google\'s 1st page.\r\n\r\n? Top ranking on Google search!\r\n? Improve website clicks and views!\r\n? Increase Your Leads, clients & Revenue!\r\n\r\nIf interested, May I send you a proposal & charges?\r\n\r\nRegards,\r\nGreg Di Bruno\r\nSenior Services Consultant - Let’s Get You Optimize\r\nEmail: info@letsgetuoptimize.com\r\nPhone: 9497671355\r\n\r\n\r\n\r\n\r\n\r\nIf you don’t want me to contact you again about this, reply with “unsubscribe”', '2024-08-20 15:37:31', '2024-08-20 15:37:31'),
(43, 'ThomasLom', 'aeonbry02@yahoo.com', '88311464265', 'Withdraw Urgently: Your Balance Is Just $50,000', 'CRITICAL: WITHDRAW NOW—YOUR BALANCE IS $50,000 https://script.google.com/macros/s/AKfycbwRdahLDA80YFe1ix0pVuuy7nehfAyfpGQai8vLF_OdsJIv3Ox5KgZ7XJbM6Usb9Ub2/exec', '2024-08-23 09:58:37', '2024-08-23 09:58:37'),
(44, 'ThomasLom', 'monica_uresti@yahoo.com', '85133757993', 'Withdraw Immediately: Your Balance Is $50,000', 'WITHDRAW NOW: BALANCE IS $50,000 https://script.google.com/macros/s/AKfycbxpZSSRH2phjPYLm58w3q9P-iwH7AS7hF_T4hEtjSjUlag1crNhha7yR-MuMDh1p2sB/exec', '2024-08-24 18:54:15', '2024-08-24 18:54:15'),
(45, 'AlbertdgdgfBrabe', 'vfssffssdfdsffffd@gmail.com', '89464491521', 'Personal free prediction from Blind Saint Sergius', 'This horoscope prediction is still a top secret! Blind clairvoyant Saint Sergius from Ternopil, Ukraine - decided that his gift should not be wasted, so he remotely helps everyone anyone who wants it. People live in different parts of the country and the world, and not always they have the opportunity to visit the clairvoyant in person. Saint Sergius only needs a small amount of information to read to read your destiny imprint and give you a diagnostic session. It\'s completely free of charge! \r\nIt is impossible to discuss horoscope with friends and relatives, because so YOU change the true the course of things, violating your destined path. \r\n \r\n \r\n<a href=\"https://intznak.site/goroskop/xrumer/1/\">Get horoscope on our website! Click on link</a> -   https://intznak.site/goroskop/xrumer/1/ \r\n<a href=\"https://intznak.site/goroskop/xrumer/1/\">Get horoscope on our website! Click on link</a> -   https://intznak.site/goroskop/xrumer/1/ \r\nGet help', '2024-08-28 01:03:04', '2024-08-28 01:03:04'),
(46, 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregistry.net/', 'elmo.grimstone@gmail.com', '61213245', 'Add lablum.com to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregistry.net/', '2024-08-28 22:01:37', '2024-08-28 22:01:37'),
(47, 'Roxanne Gilyard', 'roxanne.gilyard@msn.com', '278123551', 'Supercharge Your Online Presence with Mintsuite – Limited Time Offer!', 'Hi there,\r\n\r\nWe’re excited to introduce Mintsuite, the ultimate platform to enhance your online presence and drive results. Mintsuite empowers you to create stunning websites, manage social media like a pro, and generate traffic effortlessly.\r\n\r\nCreate Stunning Websites\r\nManage Social Media Effortlessly\r\nGenerate Unlimited Traffic\r\n\r\nGrab Mintsuite now for just $18 (normally $180)!\r\n\r\nCheck out the amazing features of Mintsuite here: https://furtherinfo.org/mintsuite\r\n\r\nThanks for your time,\r\nRoxanne', '2024-09-03 08:02:07', '2024-09-03 08:02:07'),
(48, 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregistry.net/', 'maricela.iqbal@gmail.com', '3633202982', 'Add lablum.com to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregistry.net/', '2024-09-08 04:00:29', '2024-09-08 04:00:29'),
(49, 'DavidTen', 'kayleighbpsteamship@gmail.com', '84259498843', 'Aloha  i am write about your the price', 'Hi, I wanted to know your price.', '2024-09-09 01:30:38', '2024-09-09 01:30:38'),
(50, 'TedTen', 'kayleighbpsteamship@gmail.com', '87126948131', 'Hi  i am writing about your the price', 'Здравейте, исках да знам цената ви.', '2024-09-10 05:17:36', '2024-09-10 05:17:36'),
(51, 'Denaciple', 'ch.e.ba.k.u.li.n.a.ka.ras.ev.n.a@gmail.com', '83915784238', 'Mysimba - Quick and Easy Weight Lass', 'Mysimba - Quick and Easy Weight Lass \r\n \r\nMysimba is a medicine used along with diet and exercise to help manage weight in adults: \r\n \r\nwho are obese (have a body-mass index - BMI - of 30 or more); \r\nwho are overweight (have a BMI between 27 and 30) and have weight-related complications such as diabetes, abnormally high levels of fat in the blood, or high blood pressure. \r\nBMI is a measurement that indicates body weight relative to height. \r\n \r\nMysimba contains the active substances naltrexone and bupropion. \r\n \r\nhttps://cutt.ly/RezL73vz', '2024-09-11 16:53:54', '2024-09-11 16:53:54'),
(52, 'Katelyn Raiden', 'katelynraiden@gmail.com', '3239312842', 'YouTube Promotion: Grow your subscribers by 700-1500 each month', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically. \r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nKatelyn', '2024-09-14 10:07:58', '2024-09-14 10:07:58'),
(53, 'Valeron83How', 'menhos7@rambler.ru', '82472731334', 'Real money games', 'Hello. \r\n7Slots is a young online casino brand with a huge selection of gambling games, including both the latest hits and classic slots, as well as roulette, blackjack, poker and baccarat. Welcome bonus now - $1200 + 300FS. Register here:  https://dub.sh/Tm2uIwS', '2024-09-14 13:46:08', '2024-09-14 13:46:08'),
(54, 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregistry.net/', 'abel.motter@gmail.com', '96921064', 'Add lablum.com to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregistry.net/', '2024-09-17 21:31:41', '2024-09-17 21:31:41'),
(55, 'TedTen', 'kayleighbpsteamship@gmail.com', '83178773318', 'Hello    wrote about your the prices', 'Sawubona, bengifuna ukwazi intengo yakho.', '2024-09-21 21:46:44', '2024-09-21 21:46:44'),
(56, 'Irma Dowdle', 'irma.dowdle@googlemail.com', '2914783245', 'Is Spotify Dead?', 'Hi Lablum,\r\n\r\nThat’s a bold question… But it\'s only logical.\r\n\r\nEspecially since just today, Seyi opened the doors to his new AI Sonic App… \r\n\r\nIt’s the only app that can allow you to build a “music, podcast, & live radio” hypermedia streaming platform that lets you stream over 100 million songs, playlists, genre, radio, and podcasts… \r\n\r\n=>>> https://sonic-music-streaming-app.blogspot.com/\r\n\r\nAnd then fill it with hundreds of monthly paying customers… \r\n…without paying for ads, or doing SEO. \r\n\r\nThey leverage a library with over 600,000,000 (six hundred million) paying customers \r\n\r\nTo fill your platform in just minutes… \r\n\r\n\r\nIt literally does all the work for you, and gives you a Spotify-killer platform in just a matter of seconds… \r\n\r\nYou don’t need to code anything \r\nYou don’t need to design anything\r\nYou don’t need to record or edit anything\r\nYou don’t need to pay any royalties \r\nYou don’t need to market anything\r\n\r\nAll you need is to just enter a keyword, and that’s it… \r\n\r\n=>>> https://sonic-music-streaming-app.blogspot.com/\r\n\r\nSonic will give you a profitable Hypermedia streaming platform that will make you thousands of dollars monthly… \r\n\r\nBest part? Sonic will also transform your Hypermedia streaming platform into iOS and Android mobile apps at the click of a button… \r\nGiving you extra exposure to billions of potential customers easily…\r\n\r\nRight now, you can create your account with Sonic, and get unheard-of discount of 94%... \r\n\r\nNot just that, you will be able to also secure your copy of a bonus bundle that Seyi prepared for you… \r\n\r\nWorth over $14,000 \r\n\r\n>> Click on this link, and watch Sonic build an entire platform in under 60 seconds… \r\n\r\n=>>> https://sonic-music-streaming-app.blogspot.com/\r\n\r\nCheers,\r\n[Irma Dowdle]', '2024-09-23 20:49:45', '2024-09-23 20:49:45'),
(57, 'DavidTen', 'kayleighbpsteamship@gmail.com', '88885848493', 'Aloha    write about     price for reseller', 'Ողջույն, ես ուզում էի իմանալ ձեր գինը.', '2024-09-24 05:36:41', '2024-09-24 05:36:41'),
(58, 'Joanna Riggs', 'joannariggs278@gmail.com', '22598059', 'Explainer Video for your website?', 'Hi,\r\n\r\nI just visited lablum.com and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur prices start from just $195.\r\n\r\nWe have produced over 500 videos to date and work with both non-animated and animated formats:\r\n\r\nNon-animated example:\r\nhttps://www.youtube.com/watch?v=bA2DyChM4Oc\r\n\r\nAnimated example:\r\nhttps://www.youtube.com/watch?v=JG33_MgGjfc\r\n\r\nLet me know if you\'re interested in learning more and/or have any questions.\r\n\r\nRegards,\r\nJoanna\r\n\r\nUnsubscribe: https://removeme.live/unsubscribe.php?d=lablum.com', '2024-09-27 09:00:41', '2024-09-27 09:00:41'),
(59, 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregistry.net/', 'katherina.strickland@googlemail.com', '267843891', 'Add lablum.com to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregistry.net/', '2024-09-28 00:18:23', '2024-09-28 00:18:23'),
(60, 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregister.info/', 'submissions@searchindex.site', '6507208051', 'Add lablum.com to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregister.info/', '2024-09-28 08:47:56', '2024-09-28 08:47:56'),
(61, 'TedTen', 'kayleighbpsteamship@gmail.com', '82891754366', 'Hallo    wrote about your   prices', 'Hi, ego volo scire vestri pretium.', '2024-09-28 11:04:38', '2024-09-28 11:04:38'),
(62, 'Felicity Sauncho', 'felicitysauncho@gmail.com', '339232739', 'YouTube Promotion: 700-1500 new subscribers each month', 'Hi there,\r\n\r\nWe run a Youtube growth service, where we can increase your subscriber count safely and practically. \r\n\r\n- Guaranteed: We guarantee to gain you 700-1500 new subscribers each month.\r\n- Real, human subscribers who subscribe because they are interested in your channel/videos.\r\n- Safe: All actions are done, without using any automated tasks / bots.\r\n\r\nOur price is just $60 (USD) per month and we can start immediately.\r\n\r\nIf you are interested then we can discuss further.\r\n\r\nKind Regards,\r\nFelicity', '2024-09-28 15:46:36', '2024-09-28 15:46:36'),
(63, 'Meredith Utter', 'meredith.utter44@gmail.com', '95739883', 'How I Make $1,233 Daily Using This Simple AI Tool', 'Hey Lablum,\r\n\r\nAre you dreaming of financial freedom? I’ve been in your shoes. But now, I’m waking up every day to $1,233 in passive income—effortlessly.\r\n\r\nHow? It’s all thanks to AI Traffic Secrets —a powerful collection of AI tools and training that skyrocketed my business. These tools work seamlessly, automating my traffic, boosting engagement, and driving consistent income.\r\n\r\n=>> https://ai-traffic-secrets.blogspot.com/\r\n\r\nThe best part? I use these tools every day. They’re designed to be simple and effective, so you can start generating results right away—no tech expertise required!\r\n\r\nIf you’re ready to unleash the full potential of AI and make passive income while you sleep, check out AI Traffic Secrets today!\r\n\r\n=>> https://ai-traffic-secrets.blogspot.com/\r\n\r\nCheers,  \r\n[Meredith Utter]', '2024-09-29 05:05:22', '2024-09-29 05:05:22'),
(64, 'DavidTen', 'kayleighbpsteamship@gmail.com', '81674777925', 'Hi, i am write about     price for reseller', 'Hi, ego volo scire vestri pretium.', '2024-10-01 04:15:56', '2024-10-01 04:15:56'),
(65, '<strong><a href=\"https://pr-site.com\">primer-1</a></strong>', 'thomaskingial13@gmail.com', '89865295978', '<strong><a href=\"https://pr-site.com\">primer-6</a></strong>', '<strong><a href=\"https://pr-site.com\">primer-8</a></strong>', '2024-10-02 19:12:35', '2024-10-02 19:12:35'),
(66, 'Rodrick Nyholm', 'nyholm.rodrick@outlook.com', '(17) 4893-2504', 'Hello lablum.com Owner!', 'Are you still looking at getting your website done/ completed? Contact e.solus@gmail.com\r\n\r\nStruggling to rank on Google? Our SEO experts can help. Contact es.olus@gmail.com', '2024-10-04 16:08:45', '2024-10-04 16:08:45'),
(67, 'Joanna Riggs', 'joannariggs278@gmail.com', '3610691605', 'Video Promotion for lablum.com', 'Hi,\r\n\r\nI just visited lablum.com and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nWe have produced over 500 videos to date and work with both non-animated and animated formats:\r\n\r\nNon-animated example:\r\nhttps://www.youtube.com/watch?v=bA2DyChM4Oc\r\n\r\nAnimated example:\r\nhttps://www.youtube.com/watch?v=JG33_MgGjfc\r\n\r\nOur videos cost just $195 for a 30 second video ($239 for 60 seconds) and include a full script, voice-over and video.\r\n\r\nRegards,\r\nJoanna\r\n\r\nUnsubscribe: https://removeme.live/unsubscribe.php?d=lablum.com', '2024-10-05 02:07:41', '2024-10-05 02:07:41'),
(68, 'TedTen', 'kayleighbpsteamship@gmail.com', '89128131732', 'Aloha, i am write about your   price for reseller', 'Ndewo, achọrọ m ịmara ọnụahịa gị.', '2024-10-05 23:35:18', '2024-10-05 23:35:18'),
(69, 'Lottie Thompson', 'lottiethompson@mail.co.uk', '3748422391', 'Facebook Promotion: Grow your followers by 400 each month', 'Hi, I hope you are well.\r\n\r\nWe run a Facebook service, which increases your number of fans/followers safely and practically.\r\n\r\nThis can be for a page, a group, or an individual profile.\r\n\r\n- 400+ followers per month.\r\n- Real people who follow your page/group/profile because they are interested in what you do (no bots/fakes)\r\n- No automated techniques, everything is safe and manual.\r\n\r\nOur price is just $60 (USD) per month, with no contract.\r\n\r\nWe also offer an introductory trial, so you can see the process yourself first, risk-free.\r\n\r\nIf you are interested, just reply back and we can discuss further.\r\n\r\nKind Regards,\r\nLottie', '2024-10-06 13:56:27', '2024-10-06 13:56:27'),
(70, 'Denaciple', 'ch.eb.aku.lin.a.k.ar.ase.vn.a@gmail.com', '84246172563', 'Mysimba - Quick and Easy Weight Lass', 'Mysimba - Quick and Easy Weight Lass \r\n \r\nMysimba is a medicine used along with diet and exercise to help manage weight in adults: \r\n \r\nwho are obese (have a body-mass index - BMI - of 30 or more); \r\nwho are overweight (have a BMI between 27 and 30) and have weight-related complications such as diabetes, abnormally high levels of fat in the blood, or high blood pressure. \r\nBMI is a measurement that indicates body weight relative to height. \r\n \r\nMysimba contains the active substances naltrexone and bupropion. \r\n \r\nhttps://cutt.ly/RezL73vz', '2024-10-07 00:14:18', '2024-10-07 00:14:18'),
(71, 'MasonTen', 'agavapicod390@gmail.com', '87556399828', 'Hi, i am write about   the price for reseller', 'Ola, quería saber o seu prezo.', '2024-10-08 12:38:18', '2024-10-08 12:38:18'),
(72, 'MasonTen', 'somasesokiyo31@gmail.com', '88615171558', 'Hi    wrote about your   prices', 'Salut, ech wollt Äre Präis wëssen.', '2024-10-14 02:17:17', '2024-10-14 02:17:17'),
(73, 'TedTen', 'axobajigufo34@gmail.com', '87539411754', 'Hello, i writing about     prices', 'Kaixo, zure prezioa jakin nahi nuen.', '2024-10-14 12:15:04', '2024-10-14 12:15:04'),
(74, 'Bemi Brook', 'bemibrooks.dev@gmail.com', '1234567890', 'Re: Boost Your Google Ranking', 'Hi lablum.com,\r\n\r\n Looking to boost your visibility on Google? Our digital marketing agency offers expert keyword research, tailored SEO strategies, and detailed reporting.\r\n\r\n•	SEO: Full packages to improve your search rankings.\r\n\r\n•	SMO: Engage audiences on Facebook, Twitter, LinkedIn, and YouTube.\r\n\r\n•	PPC: Drive traffic with targeted ads.\r\n\r\n•	Web Design: Responsive and user-friendly designs.\r\n\r\nIf interested, please reply with your name, phone number, and email.\r\n\r\nBest,\r\nBemi Brook', '2024-10-15 03:35:13', '2024-10-15 03:35:13'),
(75, 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://SearchRegister.org/', 'caitlyn.hargreaves@gmail.com', '96702675', 'Add lablum.com to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://SearchRegister.org/', '2024-10-16 22:30:31', '2024-10-16 22:30:31'),
(76, 'DavidTen', 'ibucezevuda439@gmail.com', '84919349576', 'Hallo, i write about   the prices', 'Ndewo, achọrọ m ịmara ọnụahịa gị.', '2024-10-19 12:13:43', '2024-10-19 12:13:43'),
(77, 'Vincent Baltzell', 'baltzell.vincent@gmail.com', '044 930 17 82', 'Dear lablum.com Administrator.', 'If you are reading this message, That means my marketing is working. I can make your ad message reach 5 million sites in the same manner for just $50. It\'s the most affordable way to market your business or services. Contact me by email virgo.t3@gmail.com or skype me at live:.cid.dbb061d1dcb9127a\r\n\r\nP.S: Speical Offer - ONLY for 24 hours - 10 Million Sites for the same money $50', '2024-10-19 19:55:17', '2024-10-19 19:55:17'),
(78, 'Michealreips', 'raymondStide@gmail.com', '81314135295', 'We guarantee the successful delivery of your emails.', 'Salutations! lablum.com \r\n \r\nDid you know that it is possible to send proposal totally lawful and regular? \r\nWhen such messages are sent, no personal data is used, and they are securely sent to forms that have been specifically designed to receive messages and appeals. Messages sent via Feedback Forms are unlikely to get into spam, as they are viewed as important. \r\nEnjoy our service for free today! \r\nWe can forward up to 50,000 messages for you. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis offer is automatically generated. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:contactform_18 \r\nWhatsApp - +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\nWe only use chat for communication.', '2024-10-20 20:52:33', '2024-10-20 20:52:33'),
(79, 'TedTen', 'axobajigufo34@gmail.com', '81921852659', 'Aloha  i write about your   price', 'Sveiki, es gribēju zināt savu cenu.', '2024-10-21 19:44:21', '2024-10-21 19:44:21'),
(80, 'Hildegarde Hollins', 'morrismi1@outlook.com', '(11) 2833-3831', 'To the lablum.com Administrator.', 'My name is Ahmet. I\'m a bank staff in a Turkish bank. I\'ve been looking for someone who has the same nationality as you. A citizen of your country died in the recent earthquake in Turkey, he had in our bank fixed deposit of $11.5 million. \r\n\r\nMy Bank management is yet to know of his death. If my bank executive finds out about his death ,They would use the funds for themselves and get richer and I would like to prevent that from happening only if I get your cooperation, I knew about it because I was his account manager. Last week my bank management held a meeting for the purpose of a bank audit to note the dormant and abandoned deposit accounts.  I know this will happen and that\'s why I\'m looking for a solution to deal with this situation because if my bank discovers his death, they will divert the funds to the board of directors.  I don\'t want that to happen. \r\n \r\nI request your cooperation to introduce you as the kin/heir of the account as you are of the same nationality as him.  There is no risk;  the transaction is carried out under a legal agreement that protects you from infringement. I suggest we split the funds, 60/40 and 40 for me. I need this fund for my daughter\'s surgery so keep this info confidential. email me so i can provide you with more info  ahmetaksoy1925@outlook.com', '2024-10-23 09:34:55', '2024-10-23 09:34:55'),
(81, 'DavidTen', 'ibucezevuda439@gmail.com', '84298271853', 'Hello, i writing about your   price for reseller', 'Γεια σου, ήθελα να μάθω την τιμή σας.', '2024-10-24 03:01:47', '2024-10-24 03:01:47'),
(82, 'MasonTen', 'yawiviseya67@gmail.com', '88911497315', 'Hi, i writing about   the price for reseller', 'Ndewo, achọrọ m ịmara ọnụahịa gị.', '2024-10-25 08:28:17', '2024-10-25 08:28:17'),
(83, 'Mauricio Brophy', 'brophy.mauricio@gmail.com', '03.24.65.70.40', 'Hello lablum.com Admin!', 'Unlock Stress-Free Website Management—Just $25/Month\r\n\r\nExperience worry-free web hosting with our fully managed service designed to keep your website secure, fast, and always up-to-date. For only $25/month, we handle everything—WordPress core, PHP, plugin, and theme updates—along with daily offsite backups, powerful firewall protection, and proactive malware removal.\r\n\r\nPlus, our free migration service ensures your current website transitions to our optimized server with zero downtime. With 24/7 monitoring, a dedicated server, and weekly performance reports, you stay informed without lifting a finger.\r\n\r\nStop wasting time on tech headaches—let us handle it all for you!\r\n\r\nhttps://bestwebsite.link/hosting', '2024-10-25 08:33:23', '2024-10-25 08:33:23');
INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(84, 'RobertTeX', 'dvdvvevveve@gmail.com', '82462696748', 'Be careful Kamala Harris it\'s russian spy!', 'President of Russia support Kamala Harris \r\n \r\nhttps://www.oklahoman.com/story/news/2024/09/06/did-vladimir-putin-endorse-kamala-harris-fact-check-conference-comment-russia/75106285007/', '2024-10-25 19:59:06', '2024-10-25 19:59:06'),
(85, 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://SearchRegister.net', 'hardy.maisie@googlemail.com', '249385646', 'Add lablum.com to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://SearchRegister.net', '2024-10-25 22:42:51', '2024-10-25 22:42:51'),
(86, 'Von Rust', 'allenjeremy183@gmail.com', '0354 4718508', 'Opportunity for Businesses Outside the USA.', 'Do you own and operate a business outside the USA? My name is Jeremy\r\nAllen from BNF Investments LLC, a Florida based Investment Company.\r\nWe are expanding our operations outside the USA hence; we are actively\r\nlooking for serious business owners operating outside the USA who are in\r\nneed of business funding or investments in their businesses for quick\r\naccess to funding.\r\n\r\nGet back to me if you are interested through my email:\r\njallen@bnfinvestmentsllc.com', '2024-10-26 07:41:37', '2024-10-26 07:41:37'),
(87, 'MasonTen', 'ebojajuje04@gmail.com', '85812633116', 'Aloha,   wrote about your   prices', 'Hi, მინდოდა ვიცოდე თქვენი ფასი.', '2024-10-26 15:42:51', '2024-10-26 15:42:51'),
(88, 'Manual Marvin', 'marvin.manual@gmail.com', '02.90.50.25.93', 'To the lablum.com Owner!', 'We understand that as a financial institution, that people value reliable and trustworthy partners. At First Asia Finance International Limited, we offer the best financial solutions for companies, businesses and individuals seeking loans.\r\n\r\nWe have a variety of financial services such as Business Loan, Project Loan, Corporate Loan and Non-recourse Loan.\r\n\r\nWe also lease and monetize Standby Letter of Credit (SBLC) and Bank Guarantee (BG), With us you can trust that our services will meet your needs. \r\n\r\nBroker, financial consultant and intermediaried are welocme and 100% protected to bring their clients who are seeking loan or any financial instrument and for every successfull business you bring to us, you will get a agreed percentage commission.\r\n\r\n\r\nEmail: info@firstasiafinance-hk.com\r\ntelephone: +852 8003 9924\r\nWebsite: https://www.firstasiafinance-hk.com\r\n\r\nRegards,\r\n\r\nCherry Lee\r\nblueprint consultant/financial Advisor\r\ncherry4lee@gmail.com', '2024-10-30 07:25:45', '2024-10-30 07:25:45'),
(89, 'Felicity Sauncho', 'felicitysauncho@gmail.com', '47082534', 'YouTube Promotion: Grow your subscribers by 700-1500 each month', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically.\r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\n The price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nFelicity', '2024-10-30 22:00:40', '2024-10-30 22:00:40'),
(90, 'Savannah Chavarria', 'chavarria.savannah@gmail.com', '2146348683', 'Hello lablum.com Admin.', 'Looking to get millions of people to click on your website affordably? Visit: http://h8xshg.contactblastingworks.my', '2024-10-31 07:55:55', '2024-10-31 07:55:55'),
(91, 'TedTen', 'axobajigufo34@gmail.com', '86891957863', 'Hello  i write about your   price', 'Hallo, ek wou jou prys ken.', '2024-10-31 09:48:28', '2024-10-31 09:48:28'),
(92, 'MasonTen', 'duqotayowud23@gmail.com', '84472236539', 'Hi  i wrote about   the prices', 'হাই, আমি আপনার মূল্য জানতে চেয়েছিলাম.', '2024-11-01 04:25:54', '2024-11-01 04:25:54'),
(93, 'TedTen', 'axobajigufo34@gmail.com', '81472373887', 'Hi  i wrote about     prices', 'Hej, jeg ønskede at kende din pris.', '2024-11-02 19:15:01', '2024-11-02 19:15:01'),
(94, 'Ceciltot', 'sharonforet1900@microoremail.ru', '88295256223', 'Онлайн магазин баз для Xrumer и GSA', 'Лучшие базы для Xrumer и GSA Search Engine Ranker по самым лучшим ценам \r\nhttps://dseo24.monster \r\nОнлайн магазин баз для Xrumer и GSA     лучшие цены', '2024-11-03 04:11:20', '2024-11-03 04:11:20'),
(95, 'Tracyges', 'yasen.krasen.13+97658@mail.ru', '87279683775', 'Ofiefheufjwoidjwi hfjsfoiewhgifewhfjasifdj qwoifjwkawdkkwefuhfkwoapdfweh jfkewijfgrogr', 'Ojwdjiowkdeofjeij ifsfhoewdfeifhweui hieojkaskdfwjfghewejif eiwhfufdawdijwehfuihewguih jeifjeweijeruigherug lablum.com', '2024-11-03 10:03:05', '2024-11-03 10:03:05'),
(96, 'MasonTen', 'somasesokiyo31@gmail.com', '84673811186', 'Hello  i writing about your the price for reseller', 'Hi, I wanted to know your price.', '2024-11-03 23:20:35', '2024-11-03 23:20:35'),
(97, 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://SearchRegister.info/', 'submissions@searchindex.site', '9104225197', 'Add lablum.com to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://SearchRegister.info/', '2024-11-05 01:09:38', '2024-11-05 01:09:38'),
(98, 'DavidTen', 'ibucezevuda439@gmail.com', '83843259432', 'Aloha  i writing about your the price for reseller', 'Zdravo, htio sam znati vašu cijenu.', '2024-11-05 16:52:16', '2024-11-05 16:52:16'),
(99, 'Matt Carnahan', 'carnahan.toni@gmail.com', '026 730 76 49', 'Hello lablum.com Admin!', 'Hello\r\n\r\nI hope this message finds you well. My name is Mathew Lundgren, and I am a Research Assistant in the Research and Development Department at Newton Laboratories Pro Ltd, a leading biopharmaceutical company based in London, England. I am reaching out to explore a potential partnership opportunity. \r\n\r\nWe are currently seeking a reliable business representative in your region to assist us in sourcing essential raw materials used in the production of high-quality antiviral vaccines, cancer treatments, and other life-saving pharmaceutical products. While this may be outside of your primary area of expertise, it offers a unique opportunity to diversify your business interests and generate additional income.\r\n\r\nOur company has been actively searching for a reputable supplier but has yet to establish a direct source. \r\n\r\nHowever, I have identified a local supplier who offers the necessary materials at a significantly lower cost compared to our previous purchases. This could present a mutually beneficial opportunity for both parties.\r\n\r\nIf you are interested in learning more about the profit structure and the specifics of this potential collaboration, please feel free to reach out. \r\n\r\nI would be happy to provide additional details at your convenience.\r\n\r\nThank you for considering this partnership, and I look forward to your response.\r\n\r\nMathew Lundgren\r\nResearch & Dev Dept\r\nNewton Laboratories Pro Ltd UK\r\n2 Kensington High Street,\r\nLondon, England, W8 4PT\r\nUnited Kingdom\r\nEmail: mathewlundgren@thegrampians.net', '2024-11-05 20:15:26', '2024-11-05 20:15:26'),
(100, 'ArchieTen', 'ebojajuje04@gmail.com', '86727597554', 'Hallo  i am writing about your   price', 'Hallo, ek wou jou prys ken.', '2024-11-07 22:05:51', '2024-11-07 22:05:51'),
(101, 'Dastrtneill', 'nik@don-rem.ru', '84269858433', 'webdesinnw.dn.ua', 'Hello. . [url=https://nw.dn.ua/]nw.dn.ua[/url] \r\n<a href=https://nw.dn.ua/>nw.dn.ua</a> \r\nhttps://nw.dn.ua   zwz4763574', '2024-11-08 02:36:57', '2024-11-08 02:36:57');

-- --------------------------------------------------------

--
-- Table structure for table `earnings`
--

CREATE TABLE `earnings` (
  `id` bigint UNSIGNED NOT NULL,
  `from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_points` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewer_points` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `earnings`
--

INSERT INTO `earnings` (`id`, `from`, `to`, `creator_points`, `viewer_points`, `created_at`, `updated_at`) VALUES
(15, '5', '30', '0.5', '.10', '2024-09-16 12:14:34', '2024-09-28 14:35:10'),
(16, '31', '60', '.6', '.20', '2024-09-16 12:14:51', '2024-09-28 14:36:43'),
(17, '61', '90', '.7', '.30', '2024-09-16 12:15:10', '2024-09-28 14:37:24'),
(18, '91', '120', '.8', '.40', '2024-09-16 12:15:54', '2024-09-28 14:38:05');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `follower_id` bigint UNSIGNED NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`id`, `user_id`, `follower_id`, `status`, `created_at`, `updated_at`) VALUES
(218, 180, 198, 'true', '2024-09-16 11:20:45', '2024-09-16 11:20:45'),
(219, 198, 180, 'true', '2024-09-16 11:30:45', '2024-09-16 11:30:45'),
(220, 200, 180, 'true', '2024-09-16 11:41:53', '2024-09-16 11:41:53'),
(223, 200, 196, 'true', '2024-09-17 14:35:07', '2024-09-17 14:35:07'),
(235, 188, 198, 'true', '2024-09-18 15:04:04', '2024-09-18 15:04:04'),
(236, 188, 185, 'true', '2024-09-18 15:04:16', '2024-09-18 15:04:16'),
(241, 196, 180, 'true', '2024-09-19 15:48:29', '2024-09-19 15:48:29'),
(242, 185, 188, 'true', '2024-09-20 21:03:27', '2024-09-20 21:03:27'),
(243, 185, 196, 'true', '2024-09-20 21:04:19', '2024-09-20 21:04:19'),
(255, 188, 189, 'true', '2024-09-23 12:00:53', '2024-09-23 12:00:53'),
(256, 189, 188, 'true', '2024-09-23 12:04:07', '2024-09-23 12:04:07'),
(260, 188, 196, 'true', '2024-09-23 14:03:29', '2024-09-23 14:03:29'),
(261, 207, 185, 'true', '2024-09-25 16:06:42', '2024-09-25 16:06:42'),
(262, 185, 207, 'true', '2024-09-25 16:17:15', '2024-09-25 16:17:15'),
(263, 188, 207, 'true', '2024-09-25 17:08:04', '2024-09-25 17:08:04'),
(264, 208, 189, 'true', '2024-09-25 20:33:11', '2024-09-25 20:33:11'),
(265, 189, 208, 'true', '2024-09-25 20:33:27', '2024-09-25 20:33:27'),
(266, 185, 210, 'true', '2024-09-26 21:23:48', '2024-09-26 21:23:48'),
(267, 214, 185, 'true', '2024-09-30 11:21:20', '2024-09-30 11:21:20'),
(268, 207, 188, 'true', '2024-10-01 11:43:24', '2024-10-01 11:43:24'),
(269, 185, 214, 'true', '2024-10-01 11:46:55', '2024-10-01 11:46:55'),
(270, 180, 196, 'true', '2024-10-06 10:56:39', '2024-10-06 10:56:39'),
(271, 189, 196, 'true', '2024-10-07 14:42:49', '2024-10-07 14:42:49');

-- --------------------------------------------------------

--
-- Table structure for table `gsts`
--

CREATE TABLE `gsts` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_type` tinyint NOT NULL,
  `payment_for` tinyint NOT NULL,
  `tax_percentage` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gsts`
--

INSERT INTO `gsts` (`id`, `payment_type`, `payment_for`, `tax_percentage`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 21, '2024-04-05 03:16:25', '2024-04-05 05:01:46'),
(2, 2, 3, 18, '2024-05-27 14:14:49', '2024-05-27 14:14:49'),
(3, 2, 3, 15, '2024-05-29 13:42:06', '2024-05-29 13:42:06');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  `add_id` bigint DEFAULT NULL,
  `like_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`, `add_id`, `like_status`, `created_at`, `updated_at`) VALUES
(453, 180, 24, NULL, '1', '2024-09-16 11:58:17', '2024-09-16 11:58:17'),
(454, 198, 57, NULL, '1', '2024-09-16 13:04:22', '2024-09-16 13:04:22'),
(455, 198, 23, NULL, '1', '2024-09-16 16:06:26', '2024-09-16 16:06:26'),
(457, 200, 37, NULL, '1', '2024-09-16 16:06:45', '2024-09-16 16:06:45'),
(458, 198, 55, NULL, '1', '2024-09-16 16:07:04', '2024-09-16 16:07:04'),
(459, 198, 56, NULL, '1', '2024-09-16 16:07:12', '2024-09-16 16:07:12'),
(461, 198, 60, NULL, '1', '2024-09-16 16:07:54', '2024-09-16 16:07:54'),
(462, 198, 66, NULL, '1', '2024-09-16 16:08:02', '2024-09-16 16:08:02'),
(463, 198, 74, NULL, '1', '2024-09-16 16:09:02', '2024-09-16 16:09:02'),
(464, 198, 75, NULL, '1', '2024-09-16 16:09:17', '2024-09-16 16:09:17'),
(465, 200, 82, NULL, '1', '2024-09-17 13:59:00', '2024-09-17 13:59:00'),
(466, 200, 63, NULL, '1', '2024-09-17 14:34:08', '2024-09-17 14:34:08'),
(467, 182, 74, NULL, '1', '2024-09-17 16:46:33', '2024-09-17 16:46:33'),
(469, 182, 48, NULL, '1', '2024-09-17 16:51:14', '2024-09-17 16:51:14'),
(471, 196, 20, NULL, '1', '2024-09-17 21:56:22', '2024-09-17 21:56:22'),
(472, 189, 93, NULL, '1', '2024-09-18 09:14:05', '2024-09-18 09:14:05'),
(486, 188, NULL, 23, '1', '2024-09-18 11:55:48', '2024-09-18 11:55:48'),
(508, 189, 86, NULL, '1', '2024-09-18 14:41:39', '2024-09-18 14:41:39'),
(509, 188, 95, NULL, '1', '2024-09-18 16:06:04', '2024-09-18 16:06:04'),
(510, 187, 43, NULL, '1', '2024-09-18 16:17:32', '2024-09-18 16:17:32'),
(511, 187, 101, NULL, '1', '2024-09-18 16:19:30', '2024-09-18 16:19:30'),
(512, 196, 73, NULL, '1', '2024-09-18 16:36:35', '2024-09-18 16:36:35'),
(513, 200, 35, NULL, '1', '2024-09-19 15:30:32', '2024-09-19 15:30:32'),
(515, 187, 35, NULL, '1', '2024-09-19 15:39:21', '2024-09-19 15:39:21'),
(518, 188, 131, NULL, '1', '2024-09-20 20:42:08', '2024-09-20 20:42:08'),
(522, 185, 86, NULL, '1', '2024-09-20 20:50:20', '2024-09-20 20:50:20'),
(527, 185, 20, NULL, '1', '2024-09-20 20:56:09', '2024-09-20 20:56:09'),
(528, 185, 22, NULL, '1', '2024-09-20 20:56:20', '2024-09-20 20:56:20'),
(530, 185, 83, NULL, '1', '2024-09-20 21:04:10', '2024-09-20 21:04:10'),
(531, 185, 33, NULL, '1', '2024-09-20 21:05:02', '2024-09-20 21:05:02'),
(532, 185, 51, NULL, '1', '2024-09-20 21:05:06', '2024-09-20 21:05:06'),
(533, 185, NULL, 23, '1', '2024-09-20 21:06:11', '2024-09-20 21:06:11'),
(534, 185, 113, NULL, '1', '2024-09-20 21:06:22', '2024-09-20 21:06:22'),
(535, 185, 105, NULL, '1', '2024-09-20 21:06:27', '2024-09-20 21:06:27'),
(536, 185, 19, NULL, '1', '2024-09-20 21:07:25', '2024-09-20 21:07:25'),
(537, 185, 100, NULL, '1', '2024-09-20 21:07:40', '2024-09-20 21:07:40'),
(538, 185, 108, NULL, '1', '2024-09-20 21:09:44', '2024-09-20 21:09:44'),
(539, 188, 132, NULL, '1', '2024-09-20 21:10:54', '2024-09-20 21:10:54'),
(540, 188, 133, NULL, '1', '2024-09-20 21:11:02', '2024-09-20 21:11:02'),
(542, 189, NULL, 23, '1', '2024-09-21 08:58:47', '2024-09-21 08:58:47'),
(587, 196, 68, NULL, '1', '2024-09-21 13:40:55', '2024-09-21 13:40:55'),
(588, 185, 43, NULL, '1', '2024-09-21 15:00:21', '2024-09-21 15:00:21'),
(593, 187, 53, NULL, '1', '2024-09-21 21:20:09', '2024-09-21 21:20:09'),
(595, 185, 135, NULL, '1', '2024-09-22 22:33:07', '2024-09-22 22:33:07'),
(596, 180, 140, NULL, '1', '2024-09-23 09:37:31', '2024-09-23 09:37:31'),
(597, 180, 138, NULL, '1', '2024-09-23 09:37:39', '2024-09-23 09:37:39'),
(598, 180, 137, NULL, '1', '2024-09-23 09:38:00', '2024-09-23 09:38:00'),
(599, 180, 136, NULL, '1', '2024-09-23 09:38:03', '2024-09-23 09:38:03'),
(600, 200, 140, NULL, '1', '2024-09-23 09:38:31', '2024-09-23 09:38:31'),
(603, 188, 19, NULL, '1', '2024-09-23 12:04:18', '2024-09-23 12:04:18'),
(604, 185, 138, NULL, '1', '2024-09-23 12:35:53', '2024-09-23 12:35:53'),
(605, 185, 95, NULL, '1', '2024-09-23 12:36:06', '2024-09-23 12:36:06'),
(606, 185, 115, NULL, '1', '2024-09-23 12:39:00', '2024-09-23 12:39:00'),
(609, 185, 137, NULL, '1', '2024-09-23 12:40:36', '2024-09-23 12:40:36'),
(610, 185, 136, NULL, '1', '2024-09-23 12:40:44', '2024-09-23 12:40:44'),
(611, 185, 88, NULL, '1', '2024-09-23 12:41:59', '2024-09-23 12:41:59'),
(612, 185, 68, NULL, '1', '2024-09-23 12:42:27', '2024-09-23 12:42:27'),
(613, 185, 64, NULL, '1', '2024-09-23 12:42:53', '2024-09-23 12:42:53'),
(616, 189, 120, NULL, '1', '2024-09-23 13:56:17', '2024-09-23 13:56:17'),
(619, 189, 21, NULL, '1', '2024-09-23 13:56:46', '2024-09-23 13:56:46'),
(620, 196, 135, NULL, '1', '2024-09-23 13:57:52', '2024-09-23 13:57:52'),
(621, 188, 135, NULL, '1', '2024-09-23 14:02:36', '2024-09-23 14:02:36'),
(622, 185, 79, NULL, '1', '2024-09-23 14:02:59', '2024-09-23 14:02:59'),
(623, 185, 87, NULL, '1', '2024-09-23 14:03:38', '2024-09-23 14:03:38'),
(624, 188, 88, NULL, '1', '2024-09-23 14:03:48', '2024-09-23 14:03:48'),
(625, 185, 62, NULL, '1', '2024-09-23 14:03:53', '2024-09-23 14:03:53'),
(626, 185, 48, NULL, '1', '2024-09-23 14:03:57', '2024-09-23 14:03:57'),
(627, 185, 40, NULL, '1', '2024-09-23 14:05:13', '2024-09-23 14:05:13'),
(628, 188, 87, NULL, '1', '2024-09-23 14:05:14', '2024-09-23 14:05:14'),
(629, 185, 96, NULL, '1', '2024-09-23 14:05:39', '2024-09-23 14:05:39'),
(630, 185, 25, NULL, '1', '2024-09-23 14:06:18', '2024-09-23 14:06:18'),
(631, 185, 47, NULL, '1', '2024-09-23 14:06:59', '2024-09-23 14:06:59'),
(632, 189, 68, NULL, '1', '2024-09-24 00:01:57', '2024-09-24 00:01:57'),
(634, 187, 131, NULL, '1', '2024-09-24 17:52:42', '2024-09-24 17:52:42'),
(635, 200, 95, NULL, '1', '2024-09-24 20:46:55', '2024-09-24 20:46:55'),
(636, 182, 103, NULL, '1', '2024-09-25 06:08:41', '2024-09-25 06:08:41'),
(637, 189, 144, NULL, '1', '2024-09-25 08:45:01', '2024-09-25 08:45:01'),
(638, 198, 128, NULL, '1', '2024-09-25 08:51:05', '2024-09-25 08:51:05'),
(639, 198, 116, NULL, '1', '2024-09-25 08:51:29', '2024-09-25 08:51:29'),
(640, 198, 38, NULL, '1', '2024-09-25 08:52:05', '2024-09-25 08:52:05'),
(641, 207, 35, NULL, '1', '2024-09-25 16:06:02', '2024-09-25 16:06:02'),
(642, 207, 137, NULL, '1', '2024-09-25 16:07:42', '2024-09-25 16:07:42'),
(643, 185, 35, NULL, '1', '2024-09-25 16:08:03', '2024-09-25 16:08:03'),
(644, 207, 136, NULL, '1', '2024-09-25 16:08:28', '2024-09-25 16:08:28'),
(646, 207, 134, NULL, '1', '2024-09-25 16:09:06', '2024-09-25 16:09:06'),
(647, 207, 138, NULL, '1', '2024-09-25 16:10:59', '2024-09-25 16:10:59'),
(648, 207, 97, NULL, '1', '2024-09-25 16:11:25', '2024-09-25 16:11:25'),
(649, 185, 147, NULL, '1', '2024-09-25 16:18:03', '2024-09-25 16:18:03'),
(650, 185, 146, NULL, '1', '2024-09-25 16:18:29', '2024-09-25 16:18:29'),
(651, 185, 132, NULL, '1', '2024-09-25 16:20:20', '2024-09-25 16:20:20'),
(652, 207, 100, NULL, '1', '2024-09-25 16:20:43', '2024-09-25 16:20:43'),
(653, 207, 147, NULL, '1', '2024-09-25 16:20:54', '2024-09-25 16:20:54'),
(654, 207, 83, NULL, '1', '2024-09-25 16:21:36', '2024-09-25 16:21:36'),
(655, 207, 39, NULL, '1', '2024-09-25 16:21:53', '2024-09-25 16:21:53'),
(656, 207, 127, NULL, '1', '2024-09-25 16:22:22', '2024-09-25 16:22:22'),
(657, 185, 101, NULL, '1', '2024-09-25 16:22:29', '2024-09-25 16:22:29'),
(658, 207, 91, NULL, '1', '2024-09-25 16:23:00', '2024-09-25 16:23:00'),
(660, 207, 115, NULL, '1', '2024-09-25 16:23:29', '2024-09-25 16:23:29'),
(661, 185, 148, NULL, '1', '2024-09-25 16:23:57', '2024-09-25 16:23:57'),
(662, 185, 129, NULL, '1', '2024-09-25 16:26:24', '2024-09-25 16:26:24'),
(663, 207, 148, NULL, '1', '2024-09-25 16:27:42', '2024-09-25 16:27:42'),
(664, 207, 149, NULL, '1', '2024-09-25 16:34:24', '2024-09-25 16:34:24'),
(665, 188, 149, NULL, '1', '2024-09-25 17:07:42', '2024-09-25 17:07:42'),
(668, 189, 75, NULL, '1', '2024-09-25 20:16:25', '2024-09-25 20:16:25'),
(669, 208, 128, NULL, '1', '2024-09-25 20:32:37', '2024-09-25 20:32:37'),
(670, 209, 115, NULL, '1', '2024-09-25 20:48:38', '2024-09-25 20:48:38'),
(671, 180, 103, NULL, '1', '2024-09-25 23:22:39', '2024-09-25 23:22:39'),
(672, 180, 75, NULL, '1', '2024-09-25 23:22:45', '2024-09-25 23:22:45'),
(673, 180, 49, NULL, '1', '2024-09-25 23:23:01', '2024-09-25 23:23:01'),
(674, 180, 146, NULL, '1', '2024-09-25 23:24:34', '2024-09-25 23:24:34'),
(675, 180, 66, NULL, '1', '2024-09-25 23:25:18', '2024-09-25 23:25:18'),
(676, 188, 134, NULL, '1', '2024-09-26 07:09:46', '2024-09-26 07:09:46'),
(677, 188, 148, NULL, '1', '2024-09-26 07:10:06', '2024-09-26 07:10:06'),
(678, 188, 150, NULL, '1', '2024-09-26 07:32:41', '2024-09-26 07:32:41'),
(679, 189, 157, NULL, '1', '2024-09-26 08:32:24', '2024-09-26 08:32:24'),
(680, 198, 145, NULL, '1', '2024-09-26 09:20:12', '2024-09-26 09:20:12'),
(682, 210, 40, NULL, '1', '2024-09-26 20:23:26', '2024-09-26 20:23:26'),
(683, 185, 72, NULL, '1', '2024-09-26 21:22:57', '2024-09-26 21:22:57'),
(684, 185, 31, NULL, '1', '2024-09-26 21:24:12', '2024-09-26 21:24:12'),
(685, 185, 142, NULL, '1', '2024-09-26 21:24:23', '2024-09-26 21:24:23'),
(686, 189, 142, NULL, '1', '2024-09-26 21:24:45', '2024-09-26 21:24:45'),
(687, 189, 82, NULL, '1', '2024-09-26 21:24:49', '2024-09-26 21:24:49'),
(688, 189, 20, NULL, '1', '2024-09-26 21:24:52', '2024-09-26 21:24:52'),
(689, 185, 102, NULL, '1', '2024-09-26 21:25:18', '2024-09-26 21:25:18'),
(691, 189, 154, NULL, '1', '2024-09-26 21:25:31', '2024-09-26 21:25:31'),
(692, 189, 64, NULL, '1', '2024-09-26 21:25:35', '2024-09-26 21:25:35'),
(693, 189, 27, NULL, '1', '2024-09-26 21:25:38', '2024-09-26 21:25:38'),
(694, 185, 57, NULL, '1', '2024-09-26 21:26:07', '2024-09-26 21:26:07'),
(695, 185, 73, NULL, '1', '2024-09-26 21:26:50', '2024-09-26 21:26:50'),
(696, 185, 65, NULL, '1', '2024-09-26 21:27:07', '2024-09-26 21:27:07'),
(697, 185, 91, NULL, '1', '2024-09-26 21:28:07', '2024-09-26 21:28:07'),
(698, 180, 27, NULL, '1', '2024-09-26 21:41:30', '2024-09-26 21:41:30'),
(699, 180, 141, NULL, '1', '2024-09-26 21:41:41', '2024-09-26 21:41:41'),
(700, 180, 74, NULL, '1', '2024-09-26 21:42:22', '2024-09-26 21:42:22'),
(701, 180, 80, NULL, '1', '2024-09-26 21:43:03', '2024-09-26 21:43:03'),
(702, 187, 136, NULL, '1', '2024-09-26 23:03:16', '2024-09-26 23:03:16'),
(703, 211, 152, NULL, '1', '2024-09-27 06:47:56', '2024-09-27 06:47:56'),
(704, 211, 153, NULL, '1', '2024-09-27 06:48:25', '2024-09-27 06:48:25'),
(705, 211, 80, NULL, '1', '2024-09-27 06:48:57', '2024-09-27 06:48:57'),
(706, 211, 116, NULL, '1', '2024-09-27 06:49:05', '2024-09-27 06:49:05'),
(707, 211, NULL, 23, '1', '2024-09-27 06:49:12', '2024-09-27 06:49:12'),
(708, 189, 115, NULL, '1', '2024-09-27 08:28:53', '2024-09-27 08:28:53'),
(709, 189, 104, NULL, '1', '2024-09-27 08:29:01', '2024-09-27 08:29:01'),
(710, 189, 138, NULL, '1', '2024-09-27 08:29:07', '2024-09-27 08:29:07'),
(711, 189, 85, NULL, '1', '2024-09-27 08:29:23', '2024-09-27 08:29:23'),
(713, 189, 128, NULL, '1', '2024-09-27 08:29:45', '2024-09-27 08:29:45'),
(714, 189, 24, NULL, '1', '2024-09-27 08:29:51', '2024-09-27 08:29:51'),
(715, 189, 119, NULL, '1', '2024-09-27 08:31:35', '2024-09-27 08:31:35'),
(716, 189, 146, NULL, '1', '2024-09-27 08:31:44', '2024-09-27 08:31:44'),
(717, 189, 83, NULL, '1', '2024-09-27 08:32:29', '2024-09-27 08:32:29'),
(718, 189, 52, NULL, '1', '2024-09-27 08:32:36', '2024-09-27 08:32:36'),
(719, 211, 45, NULL, '1', '2024-09-27 08:36:11', '2024-09-27 08:36:11'),
(720, 211, 109, NULL, '1', '2024-09-27 08:36:15', '2024-09-27 08:36:15'),
(721, 211, 61, NULL, '1', '2024-09-27 08:36:18', '2024-09-27 08:36:18'),
(722, 211, 154, NULL, '1', '2024-09-27 08:36:34', '2024-09-27 08:36:34'),
(723, 211, 40, NULL, '1', '2024-09-27 08:36:45', '2024-09-27 08:36:45'),
(725, 210, 121, NULL, '1', '2024-09-27 09:22:55', '2024-09-27 09:22:55'),
(726, 189, 121, NULL, '1', '2024-09-27 09:23:25', '2024-09-27 09:23:25'),
(727, 210, 151, NULL, '1', '2024-09-27 09:23:45', '2024-09-27 09:23:45'),
(728, 210, 21, NULL, '1', '2024-09-27 09:25:02', '2024-09-27 09:25:02'),
(730, 212, 126, NULL, '1', '2024-09-27 10:00:51', '2024-09-27 10:00:51'),
(731, 212, 89, NULL, '1', '2024-09-27 10:01:16', '2024-09-27 10:01:16'),
(732, 189, 108, NULL, '1', '2024-09-27 19:45:18', '2024-09-27 19:45:18'),
(733, 185, 82, NULL, '1', '2024-09-27 20:19:54', '2024-09-27 20:19:54'),
(734, 196, 48, NULL, '1', '2024-09-27 21:13:05', '2024-09-27 21:13:05'),
(735, 196, 62, NULL, '1', '2024-09-27 21:13:49', '2024-09-27 21:13:49'),
(738, 189, 42, NULL, '1', '2024-09-28 14:21:48', '2024-09-28 14:21:48'),
(739, 189, 46, NULL, '1', '2024-09-28 14:21:52', '2024-09-28 14:21:52'),
(740, 187, 132, NULL, '1', '2024-09-28 14:23:38', '2024-09-28 14:23:38'),
(741, 214, 87, NULL, '1', '2024-09-29 13:49:46', '2024-09-29 13:49:46'),
(742, 180, 114, NULL, '1', '2024-09-29 15:51:17', '2024-09-29 15:51:17'),
(743, 180, 26, NULL, '1', '2024-09-29 15:51:47', '2024-09-29 15:51:47'),
(744, 180, NULL, 23, '1', '2024-09-29 15:52:33', '2024-09-29 15:52:33'),
(746, 189, 56, NULL, '1', '2024-09-29 16:44:16', '2024-09-29 16:44:16'),
(747, 180, 152, NULL, '1', '2024-09-29 21:48:02', '2024-09-29 21:48:02'),
(748, 180, 151, NULL, '1', '2024-09-29 21:52:13', '2024-09-29 21:52:13'),
(749, 180, 104, NULL, '1', '2024-09-29 21:52:33', '2024-09-29 21:52:33'),
(750, 180, 41, NULL, '1', '2024-09-29 21:57:32', '2024-09-29 21:57:32'),
(751, 180, 144, NULL, '1', '2024-09-29 21:59:06', '2024-09-29 21:59:06'),
(752, 185, 152, NULL, '1', '2024-09-30 15:02:32', '2024-09-30 15:02:32'),
(753, 207, 158, NULL, '1', '2024-09-30 15:09:22', '2024-09-30 15:09:22'),
(755, 185, 98, NULL, '1', '2024-09-30 21:12:42', '2024-09-30 21:12:42'),
(756, 185, 71, NULL, '1', '2024-09-30 21:14:18', '2024-09-30 21:14:18'),
(757, 185, 134, NULL, '1', '2024-09-30 21:19:19', '2024-09-30 21:19:19'),
(758, 185, 151, NULL, '1', '2024-10-01 11:42:38', '2024-10-01 11:42:38'),
(759, 185, 163, NULL, '1', '2024-10-01 11:44:25', '2024-10-01 11:44:25'),
(760, 185, 154, NULL, '1', '2024-10-01 11:44:32', '2024-10-01 11:44:32'),
(761, 185, 153, NULL, '1', '2024-10-01 11:44:37', '2024-10-01 11:44:37'),
(762, 185, 150, NULL, '1', '2024-10-01 11:44:48', '2024-10-01 11:44:48'),
(763, 185, 103, NULL, '1', '2024-10-02 10:46:17', '2024-10-02 10:46:17'),
(764, 185, 53, NULL, '1', '2024-10-02 10:47:03', '2024-10-02 10:47:03'),
(765, 180, 85, NULL, '1', '2024-10-06 10:56:34', '2024-10-06 10:56:34'),
(767, 180, 45, NULL, '1', '2024-10-06 10:58:24', '2024-10-06 10:58:24'),
(768, 180, 112, NULL, '1', '2024-10-06 10:58:53', '2024-10-06 10:58:53'),
(770, 189, 162, NULL, '1', '2024-10-07 14:40:53', '2024-10-07 14:40:53'),
(771, 180, 162, NULL, '1', '2024-10-07 14:50:31', '2024-10-07 14:50:31'),
(772, 180, 20, NULL, '1', '2024-10-07 14:50:46', '2024-10-07 14:50:46'),
(773, 180, 110, NULL, '1', '2024-10-07 14:50:59', '2024-10-07 14:50:59'),
(774, 180, 71, NULL, '1', '2024-10-07 14:51:10', '2024-10-07 14:51:10'),
(775, 189, 161, NULL, '1', '2024-10-07 15:14:46', '2024-10-07 15:14:46'),
(776, 189, 99, NULL, '1', '2024-10-10 21:22:11', '2024-10-10 21:22:11'),
(777, 189, 171, NULL, '1', '2024-10-10 21:24:28', '2024-10-10 21:24:28'),
(778, 187, 31, NULL, '1', '2024-10-11 11:21:23', '2024-10-11 11:21:23'),
(782, 218, NULL, 23, '1', '2024-10-12 07:00:33', '2024-10-12 07:00:33'),
(783, 185, 24, NULL, '1', '2024-10-15 00:06:14', '2024-10-15 00:06:14'),
(784, 185, 28, NULL, '1', '2024-10-15 00:06:18', '2024-10-15 00:06:18'),
(785, 188, 170, NULL, '1', '2024-10-15 20:37:00', '2024-10-15 20:37:00'),
(786, 189, 19, NULL, '1', '2024-10-16 22:20:37', '2024-10-16 22:20:37'),
(787, 189, 143, NULL, '1', '2024-10-16 22:20:40', '2024-10-16 22:20:40'),
(788, 180, 172, NULL, '1', '2024-10-19 19:59:04', '2024-10-19 19:59:04'),
(789, 188, 136, NULL, '1', '2024-10-22 08:55:14', '2024-10-22 08:55:14'),
(790, 181, 138, NULL, '1', '2024-10-22 13:16:04', '2024-10-22 13:16:04'),
(791, 188, 159, NULL, '1', '2024-11-04 23:01:09', '2024-11-04 23:01:09');

-- --------------------------------------------------------

--
-- Table structure for table `livestreams`
--

CREATE TABLE `livestreams` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `live_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mail_types`
--

CREATE TABLE `mail_types` (
  `mail_type_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mail_type` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `active` tinyint NOT NULL DEFAULT '0' COMMENT '1: yes, 0: no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_11_29_113430_create_admins_table', 1),
(6, '2023_12_05_085039_create_staffs_table', 1),
(7, '2023_12_18_073353_create_categories_table', 1),
(8, '2023_12_19_074319_create_mail_types_table', 1),
(9, '2024_01_22_103129_create_posts_table', 2),
(10, '2024_02_23_100044_add_thumbnail_to_posts_table', 3),
(11, '2024_02_23_073610_add_thumbnail_to_posts_table', 4),
(12, '2024_02_29_083100_create_songs_table', 5),
(13, '2024_02_29_104323_create_follows_table', 6),
(14, '2024_03_05_095124_create_saveposts_table', 7),
(15, '2024_03_06_084345_create_advertisers_table', 8),
(16, '2024_03_11_055833_create_views_table', 9),
(17, '2024_03_11_060434_create_wallets_table', 10),
(18, '2024_03_11_125322_create_blogcategories_table', 11),
(19, '2024_03_12_083257_create_blogs_table', 12),
(20, '2024_03_15_051557_create_earnings_table', 13),
(21, '2024_03_18_093048_create_contacts_table', 14),
(22, '2024_03_21_070447_create_banks_table', 15),
(23, '2024_03_21_080213_create_verifies_table', 16),
(24, '2024_03_25_063852_create_addplans_table', 17),
(25, '2024_03_27_112211_create_addvideos_table', 18),
(26, '2024_03_29_061014_create_payments_table', 19),
(27, '2024_03_30_070046_create_replycomments_table', 20),
(28, '2024_03_30_073835_create_commentlikes_table', 21),
(29, '2024_04_01_100247_create_terms_table', 22),
(30, '2024_04_02_084326_create_addpricings_table', 23),
(31, '2024_04_02_093456_create_addcategories_table', 24),
(32, '2024_04_04_082209_create_notifications_table', 25),
(33, '2024_04_05_070437_create_gsts_table', 26),
(34, '2024_04_05_070103_create_taxes_table', 27),
(35, '2024_04_05_115351_create_taxcharges_table', 28);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 1),
(2, 'App\\Models\\Admin', 1),
(3, 'App\\Models\\Admin', 1),
(4, 'App\\Models\\Admin', 1),
(5, 'App\\Models\\Admin', 1),
(6, 'App\\Models\\Admin', 1),
(7, 'App\\Models\\Admin', 1),
(8, 'App\\Models\\Admin', 1),
(9, 'App\\Models\\Admin', 1),
(10, 'App\\Models\\Admin', 1),
(11, 'App\\Models\\Admin', 1),
(12, 'App\\Models\\Admin', 1),
(13, 'App\\Models\\Admin', 1),
(14, 'App\\Models\\Admin', 1),
(15, 'App\\Models\\Admin', 1),
(16, 'App\\Models\\Admin', 1),
(17, 'App\\Models\\Admin', 1),
(18, 'App\\Models\\Admin', 1),
(19, 'App\\Models\\Admin', 1),
(20, 'App\\Models\\Admin', 1),
(21, 'App\\Models\\Admin', 1),
(22, 'App\\Models\\Admin', 1),
(23, 'App\\Models\\Admin', 1),
(24, 'App\\Models\\Admin', 1),
(25, 'App\\Models\\Admin', 1),
(26, 'App\\Models\\Admin', 1),
(27, 'App\\Models\\Admin', 1),
(28, 'App\\Models\\Admin', 1),
(29, 'App\\Models\\Admin', 1),
(30, 'App\\Models\\Admin', 1),
(31, 'App\\Models\\Admin', 1),
(32, 'App\\Models\\Admin', 1),
(33, 'App\\Models\\Admin', 1),
(34, 'App\\Models\\Admin', 1),
(35, 'App\\Models\\Admin', 1),
(36, 'App\\Models\\Admin', 1),
(37, 'App\\Models\\Admin', 1),
(38, 'App\\Models\\Admin', 1),
(39, 'App\\Models\\Admin', 1),
(40, 'App\\Models\\Admin', 1),
(41, 'App\\Models\\Admin', 1),
(42, 'App\\Models\\Admin', 1),
(43, 'App\\Models\\Admin', 1),
(44, 'App\\Models\\Admin', 1),
(45, 'App\\Models\\Admin', 1),
(46, 'App\\Models\\Admin', 1),
(47, 'App\\Models\\Admin', 1),
(48, 'App\\Models\\Admin', 1),
(49, 'App\\Models\\Admin', 1),
(50, 'App\\Models\\Admin', 1),
(51, 'App\\Models\\Admin', 1),
(52, 'App\\Models\\Admin', 1),
(53, 'App\\Models\\Admin', 1),
(54, 'App\\Models\\Admin', 1),
(55, 'App\\Models\\Admin', 1),
(56, 'App\\Models\\Admin', 1),
(57, 'App\\Models\\Admin', 1),
(58, 'App\\Models\\Admin', 1),
(59, 'App\\Models\\Admin', 1),
(60, 'App\\Models\\Admin', 1),
(61, 'App\\Models\\Admin', 1),
(62, 'App\\Models\\Admin', 1),
(63, 'App\\Models\\Admin', 1),
(64, 'App\\Models\\Admin', 1),
(65, 'App\\Models\\Admin', 1),
(66, 'App\\Models\\Admin', 1),
(67, 'App\\Models\\Admin', 1),
(68, 'App\\Models\\Admin', 1),
(69, 'App\\Models\\Admin', 1),
(70, 'App\\Models\\Admin', 1),
(71, 'App\\Models\\Admin', 1),
(72, 'App\\Models\\Admin', 1),
(73, 'App\\Models\\Admin', 1),
(74, 'App\\Models\\Admin', 1),
(75, 'App\\Models\\Admin', 1),
(76, 'App\\Models\\Admin', 1),
(77, 'App\\Models\\Admin', 1),
(78, 'App\\Models\\Admin', 1),
(79, 'App\\Models\\Admin', 1),
(80, 'App\\Models\\Admin', 1),
(81, 'App\\Models\\Admin', 1),
(82, 'App\\Models\\Admin', 1),
(83, 'App\\Models\\Admin', 1),
(1, 'App\\Models\\Admin', 2),
(2, 'App\\Models\\Admin', 2),
(3, 'App\\Models\\Admin', 2),
(4, 'App\\Models\\Admin', 2),
(5, 'App\\Models\\Admin', 2),
(6, 'App\\Models\\Admin', 2),
(7, 'App\\Models\\Admin', 2),
(8, 'App\\Models\\Admin', 2),
(9, 'App\\Models\\Admin', 2),
(10, 'App\\Models\\Admin', 2),
(11, 'App\\Models\\Admin', 2),
(12, 'App\\Models\\Admin', 2),
(13, 'App\\Models\\Admin', 2),
(14, 'App\\Models\\Admin', 2),
(15, 'App\\Models\\Admin', 2),
(16, 'App\\Models\\Admin', 2),
(17, 'App\\Models\\Admin', 2),
(18, 'App\\Models\\Admin', 2),
(19, 'App\\Models\\Admin', 2),
(20, 'App\\Models\\Admin', 2),
(21, 'App\\Models\\Admin', 2),
(22, 'App\\Models\\Admin', 2),
(23, 'App\\Models\\Admin', 2),
(24, 'App\\Models\\Admin', 2),
(25, 'App\\Models\\Admin', 2),
(26, 'App\\Models\\Admin', 2),
(27, 'App\\Models\\Admin', 2),
(28, 'App\\Models\\Admin', 2),
(43, 'App\\Models\\Admin', 2),
(44, 'App\\Models\\Admin', 2),
(47, 'App\\Models\\Admin', 2),
(53, 'App\\Models\\Admin', 2),
(54, 'App\\Models\\Admin', 2),
(55, 'App\\Models\\Admin', 2),
(56, 'App\\Models\\Admin', 2),
(57, 'App\\Models\\Admin', 2),
(58, 'App\\Models\\Admin', 2),
(59, 'App\\Models\\Admin', 2),
(62, 'App\\Models\\Admin', 2),
(63, 'App\\Models\\Admin', 2),
(64, 'App\\Models\\Admin', 2),
(65, 'App\\Models\\Admin', 2),
(66, 'App\\Models\\Admin', 2),
(67, 'App\\Models\\Admin', 2),
(68, 'App\\Models\\Admin', 2),
(69, 'App\\Models\\Admin', 2),
(70, 'App\\Models\\Admin', 2),
(71, 'App\\Models\\Admin', 2),
(72, 'App\\Models\\Admin', 2),
(73, 'App\\Models\\Admin', 2),
(74, 'App\\Models\\Admin', 2),
(75, 'App\\Models\\Admin', 2),
(76, 'App\\Models\\Admin', 2),
(77, 'App\\Models\\Admin', 2),
(80, 'App\\Models\\Admin', 2),
(81, 'App\\Models\\Admin', 2),
(82, 'App\\Models\\Admin', 2),
(83, 'App\\Models\\Admin', 2),
(1, 'App\\Models\\Admin', 4);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 1),
(2, 'App\\Models\\Admin', 2),
(3, 'App\\Models\\Admin', 2),
(4, 'App\\Models\\Admin', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_dp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notification` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `path_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `fcm_token`, `user_dp`, `notification`, `title`, `thumbnail`, `path_url`, `created_at`, `updated_at`) VALUES
(98, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Started Following You', 'Follow', 'a', NULL, '2024-09-16 11:20:29', '2024-09-16 11:20:29'),
(99, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Started Following You', 'Follow', 'a', NULL, '2024-09-16 11:20:46', '2024-09-16 11:20:46'),
(100, '180', 'd2KFx6V6RHGZy343ph7NiA:APA91bFAkOQU0XKSTabp4lKsD6ioX_viAopck0ltf8mRdnS1KnA9PKJOgIlMZJIZNeIgzx3Ror_2XJevveqYLqT6rFe4hAIPW_oho96PnidnlSJ3pYSekjs9x88Fjai_3CjfOVQD2aSo', 'https://lablum.com/storage/profile_pic/198/1719897370.jpg', 'Tarun kumar sahoo Started Following You', 'Follow', 'a', NULL, '2024-09-16 11:30:46', '2024-09-16 11:30:46'),
(101, '180', 'd2KFx6V6RHGZy343ph7NiA:APA91bFAkOQU0XKSTabp4lKsD6ioX_viAopck0ltf8mRdnS1KnA9PKJOgIlMZJIZNeIgzx3Ror_2XJevveqYLqT6rFe4hAIPW_oho96PnidnlSJ3pYSekjs9x88Fjai_3CjfOVQD2aSo', NULL, 'Ayasakanta Mohanty Started Following You', 'Follow', 'a', NULL, '2024-09-16 11:41:56', '2024-09-16 11:41:56'),
(102, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/jOa3RJa1lKlHRu7E8ZhvSJEZ0dL7QCTWs2Yk9zSF.png', NULL, '2024-09-16 11:43:35', '2024-09-16 11:43:35'),
(103, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/jOa3RJa1lKlHRu7E8ZhvSJEZ0dL7QCTWs2Yk9zSF.png', NULL, '2024-09-16 11:43:38', '2024-09-16 11:43:38'),
(104, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/OULxzmUQRupKO2J13EzhYVQHuEzVfhhMxcjh6N5Y.png', NULL, '2024-09-16 11:43:41', '2024-09-16 11:43:41'),
(105, '180', 'd2KFx6V6RHGZy343ph7NiA:APA91bFAkOQU0XKSTabp4lKsD6ioX_viAopck0ltf8mRdnS1KnA9PKJOgIlMZJIZNeIgzx3Ror_2XJevveqYLqT6rFe4hAIPW_oho96PnidnlSJ3pYSekjs9x88Fjai_3CjfOVQD2aSo', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/r16qInaAoFE840cgVIFm1ngag3M1TfJ6CMmAoQsR.png', NULL, '2024-09-16 11:43:44', '2024-09-16 11:43:44'),
(106, '189', 'e2jtN1FMQ2iAsYr74sBDzc:APA91bHHUNJrO_--mr1OZmMscMELqnY4_FEds9jd8s48XyTOd8c1epg0Q6yHFaWpHDFosdXhmhNeBvRSnBwhXy1_V7lGvACsEJkigUSYKwSsEu64owOaNZTitlBWYjIJPAViWpRQsmWJ', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/ZkISJFHS6pRElsJlvPszz8wYmxIOV5aGydETqcYy.png', NULL, '2024-09-16 11:43:47', '2024-09-16 11:43:47'),
(107, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/jupTLt6NIGWCf2pySENW1AbsMDsWCGhrkC1WVHtG.png', NULL, '2024-09-16 11:43:49', '2024-09-16 11:43:49'),
(108, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/W5AS8xzQyi1B1Acn4Dv6NUf7VsDFvQe4FCozqlaE.png', NULL, '2024-09-16 11:43:52', '2024-09-16 11:43:52'),
(109, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/kWCzOh3GlAO9OfI0Q8W8TZNwmDmsyHMb5id3Y6Tf.png', NULL, '2024-09-16 11:43:55', '2024-09-16 11:43:55'),
(110, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/aFI0plrfmclqGeKOey184lG5hc7zKGIvAArms7AU.png', NULL, '2024-09-16 11:44:08', '2024-09-16 11:44:08'),
(111, '180', 'd2KFx6V6RHGZy343ph7NiA:APA91bFAkOQU0XKSTabp4lKsD6ioX_viAopck0ltf8mRdnS1KnA9PKJOgIlMZJIZNeIgzx3Ror_2XJevveqYLqT6rFe4hAIPW_oho96PnidnlSJ3pYSekjs9x88Fjai_3CjfOVQD2aSo', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/dm3JIWtswHuHObemg92q6uKT44fESqgf0zpRBoC3.png', NULL, '2024-09-16 11:44:11', '2024-09-16 11:44:11'),
(112, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Started Following You', 'Follow', 'a', NULL, '2024-09-16 11:47:35', '2024-09-16 11:47:35'),
(113, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Ayasakanta Mohanty Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/YUbY4ASuTCT5N6HZT4IruIRCEDvLkQWXda92XfDe.png', NULL, '2024-09-16 16:06:45', '2024-09-16 16:06:45'),
(114, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Ayasakanta Mohanty Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/YUbY4ASuTCT5N6HZT4IruIRCEDvLkQWXda92XfDe.png', NULL, '2024-09-16 16:06:47', '2024-09-16 16:06:47'),
(115, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', 'https://lablum.com/storage/profile_pic/182/1718178162.jpg', 'Lablum Demo Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/vnpoy1nLq6JwnFxxxIZhMBLigqpnUR5D71hSUXpy.png', NULL, '2024-09-17 16:46:37', '2024-09-17 16:46:37'),
(116, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', 'https://lablum.com/storage/profile_pic/182/1718178162.jpg', 'Lablum Demo Commented on Your Post', 'Comment', 'https://lablum.com/storage/thumbnail/vnpoy1nLq6JwnFxxxIZhMBLigqpnUR5D71hSUXpy.png', NULL, '2024-09-17 16:46:37', '2024-09-17 16:46:37'),
(117, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Commented on Your Post', 'Comment', 'https://lablum.com/storage/thumbnail/FrL2JHv0LL7PeAcHbLUMzl5RGMvjTzfvD6hB8hwB.png', NULL, '2024-09-17 21:49:01', '2024-09-17 21:49:01'),
(118, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Commented on Your Post', 'Comment', 'https://lablum.com/storage/thumbnail/FrL2JHv0LL7PeAcHbLUMzl5RGMvjTzfvD6hB8hwB.png', NULL, '2024-09-17 21:49:29', '2024-09-17 21:49:29'),
(119, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Pradosh Pattanaik Commented on Your Post', 'Comment', 'https://lablum.com/storage/thumbnail/b0StRjAuKsoGOBBEYeHOLSkMAXxvavRinWCLQGDM.png', NULL, '2024-09-17 21:49:50', '2024-09-17 21:49:50'),
(120, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Commented on Your Post', 'Comment', 'https://lablum.com/storage/thumbnail/NvN08BhXIC8nU6Z0tb9QFRNQT3JFQerzVSMlvibB.png', NULL, '2024-09-17 21:55:17', '2024-09-17 21:55:17'),
(121, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Commented on Your Post', 'Comment', 'https://lablum.com/storage/thumbnail/NvN08BhXIC8nU6Z0tb9QFRNQT3JFQerzVSMlvibB.png', NULL, '2024-09-17 21:55:24', '2024-09-17 21:55:24'),
(122, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Commented on Your Post', 'Comment', 'https://lablum.com/storage/thumbnail/NvN08BhXIC8nU6Z0tb9QFRNQT3JFQerzVSMlvibB.png', NULL, '2024-09-17 21:55:37', '2024-09-17 21:55:37'),
(123, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/NvN08BhXIC8nU6Z0tb9QFRNQT3JFQerzVSMlvibB.png', NULL, '2024-09-17 21:56:23', '2024-09-17 21:56:23'),
(124, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Commented on Your Post', 'Comment', 'https://lablum.com/storage/thumbnail/NvN08BhXIC8nU6Z0tb9QFRNQT3JFQerzVSMlvibB.png', NULL, '2024-09-17 21:56:35', '2024-09-17 21:56:35'),
(125, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-17 22:41:59', '2024-09-17 22:41:59'),
(126, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-17 22:42:01', '2024-09-17 22:42:01'),
(127, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-17 22:42:04', '2024-09-17 22:42:04'),
(128, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-17 22:42:07', '2024-09-17 22:42:07'),
(129, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-17 22:42:09', '2024-09-17 22:42:09'),
(130, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Commented on Your Post', 'Comment', 'https://lablum.com/storage/thumbnail/xwmWrEBO2j5dyGK8paI8GbFAheGJCXLTzX5VqTZL.png', NULL, '2024-09-18 09:13:12', '2024-09-18 09:13:12'),
(131, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/JWKbow9cwJ63Dw4VsC9lKXGEUYHl0hi9Z7BKOHFm.png', NULL, '2024-09-18 09:14:07', '2024-09-18 09:14:07'),
(132, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Commented on Your Post', 'Comment', 'https://lablum.com/storage/thumbnail/JWKbow9cwJ63Dw4VsC9lKXGEUYHl0hi9Z7BKOHFm.png', NULL, '2024-09-18 09:14:14', '2024-09-18 09:14:14'),
(133, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/CM77G1BWa8uAfBsly5pjO4UJxDyiZLEGMRt9XvDz.png', NULL, '2024-09-18 12:09:51', '2024-09-18 12:09:51'),
(134, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/CM77G1BWa8uAfBsly5pjO4UJxDyiZLEGMRt9XvDz.png', NULL, '2024-09-18 12:09:52', '2024-09-18 12:09:52'),
(135, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/oPNRIsoz4gPpZKpcvwf3GgLQBzOKYI8SMVj9jpuG.png', NULL, '2024-09-18 12:42:50', '2024-09-18 12:42:50'),
(136, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/oPNRIsoz4gPpZKpcvwf3GgLQBzOKYI8SMVj9jpuG.png', NULL, '2024-09-18 12:43:09', '2024-09-18 12:43:09'),
(137, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/oPNRIsoz4gPpZKpcvwf3GgLQBzOKYI8SMVj9jpuG.png', NULL, '2024-09-18 12:43:11', '2024-09-18 12:43:11'),
(138, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/oPNRIsoz4gPpZKpcvwf3GgLQBzOKYI8SMVj9jpuG.png', NULL, '2024-09-18 12:43:21', '2024-09-18 12:43:21'),
(139, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/oPNRIsoz4gPpZKpcvwf3GgLQBzOKYI8SMVj9jpuG.png', NULL, '2024-09-18 12:43:24', '2024-09-18 12:43:24'),
(140, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/oPNRIsoz4gPpZKpcvwf3GgLQBzOKYI8SMVj9jpuG.png', NULL, '2024-09-18 12:43:25', '2024-09-18 12:43:25'),
(141, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/oPNRIsoz4gPpZKpcvwf3GgLQBzOKYI8SMVj9jpuG.png', NULL, '2024-09-18 12:43:31', '2024-09-18 12:43:31'),
(142, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/oPNRIsoz4gPpZKpcvwf3GgLQBzOKYI8SMVj9jpuG.png', NULL, '2024-09-18 12:43:46', '2024-09-18 12:43:46'),
(143, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/oPNRIsoz4gPpZKpcvwf3GgLQBzOKYI8SMVj9jpuG.png', NULL, '2024-09-18 12:43:55', '2024-09-18 12:43:55'),
(144, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/oPNRIsoz4gPpZKpcvwf3GgLQBzOKYI8SMVj9jpuG.png', NULL, '2024-09-18 12:43:58', '2024-09-18 12:43:58'),
(145, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/oPNRIsoz4gPpZKpcvwf3GgLQBzOKYI8SMVj9jpuG.png', NULL, '2024-09-18 12:44:01', '2024-09-18 12:44:01'),
(146, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/oPNRIsoz4gPpZKpcvwf3GgLQBzOKYI8SMVj9jpuG.png', NULL, '2024-09-18 12:44:04', '2024-09-18 12:44:04'),
(147, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/oPNRIsoz4gPpZKpcvwf3GgLQBzOKYI8SMVj9jpuG.png', NULL, '2024-09-18 12:44:05', '2024-09-18 12:44:05'),
(148, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/oPNRIsoz4gPpZKpcvwf3GgLQBzOKYI8SMVj9jpuG.png', NULL, '2024-09-18 12:44:08', '2024-09-18 12:44:08'),
(149, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/oPNRIsoz4gPpZKpcvwf3GgLQBzOKYI8SMVj9jpuG.png', NULL, '2024-09-18 12:44:16', '2024-09-18 12:44:16'),
(150, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/oPNRIsoz4gPpZKpcvwf3GgLQBzOKYI8SMVj9jpuG.png', NULL, '2024-09-18 12:44:18', '2024-09-18 12:44:18'),
(151, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-18 12:45:59', '2024-09-18 12:45:59'),
(152, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-18 12:46:01', '2024-09-18 12:46:01'),
(153, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-18 12:46:02', '2024-09-18 12:46:02'),
(154, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-18 12:46:03', '2024-09-18 12:46:03'),
(155, '180', 'd2KFx6V6RHGZy343ph7NiA:APA91bFAkOQU0XKSTabp4lKsD6ioX_viAopck0ltf8mRdnS1KnA9PKJOgIlMZJIZNeIgzx3Ror_2XJevveqYLqT6rFe4hAIPW_oho96PnidnlSJ3pYSekjs9x88Fjai_3CjfOVQD2aSo', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/OHJxh2tyWwId0xFmsYJDHPsjS8285TOljBefmEmx.png', NULL, '2024-09-18 13:15:37', '2024-09-18 13:15:37'),
(156, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Started Following You', 'Follow', 'a', NULL, '2024-09-18 13:35:54', '2024-09-18 13:35:54'),
(157, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Prabhat bhoi Commented on Your Post', 'Comment', 'https://lablum.com/storage/thumbnail/KjAgm5xAiPru7nQYHqeKpjiMJusUoObsHNZawmBu.png', NULL, '2024-09-18 13:36:49', '2024-09-18 13:36:49'),
(158, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Started Following You', 'Follow', 'a', NULL, '2024-09-18 13:36:57', '2024-09-18 13:36:57'),
(159, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Prabhat bhoi Commented on Your Post', 'Comment', 'https://lablum.com/storage/thumbnail/KjAgm5xAiPru7nQYHqeKpjiMJusUoObsHNZawmBu.png', NULL, '2024-09-18 13:37:23', '2024-09-18 13:37:23'),
(160, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/qkJPcK2cJzkop9lBWl3aJbRLPHPAOnXA9aDqbxlO.png', NULL, '2024-09-18 14:41:41', '2024-09-18 14:41:41'),
(161, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-18 15:04:05', '2024-09-18 15:04:05'),
(162, '185', 'dGxfzl8zTJyJ3jLuk-6YzH:APA91bEiAQWyjx7OAw7wgojgFYBQkMxQVbxWtsWkS3Oa5mafil8jJXRavhcpAd1FRFlceOdEgEgeqCM6fYqshAbT-Nnu1ebZifr_C0aWWRMnEqw9aF9PhLPT24GsIjj_JhiLV4Wfg25d', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-18 15:04:18', '2024-09-18 15:04:18'),
(163, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-18 15:04:19', '2024-09-18 15:04:19'),
(164, '189', 'e2jtN1FMQ2iAsYr74sBDzc:APA91bHHUNJrO_--mr1OZmMscMELqnY4_FEds9jd8s48XyTOd8c1epg0Q6yHFaWpHDFosdXhmhNeBvRSnBwhXy1_V7lGvACsEJkigUSYKwSsEu64owOaNZTitlBWYjIJPAViWpRQsmWJ', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-18 15:04:20', '2024-09-18 15:04:20'),
(165, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/b5EUH2nypT2Ax8cniojwPWC0MtP2M1tDDMpXckm6.png', NULL, '2024-09-18 16:06:06', '2024-09-18 16:06:06'),
(166, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-18 21:50:43', '2024-09-18 21:50:43'),
(167, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-18 21:50:45', '2024-09-18 21:50:45'),
(168, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Ayasakanta Mohanty Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/6kdqGrSn0OL6FObRQMOGRtWbLJsNJtc3DSOIuqTn.png', NULL, '2024-09-19 15:30:35', '2024-09-19 15:30:35'),
(169, '180', 'd2KFx6V6RHGZy343ph7NiA:APA91bFAkOQU0XKSTabp4lKsD6ioX_viAopck0ltf8mRdnS1KnA9PKJOgIlMZJIZNeIgzx3Ror_2XJevveqYLqT6rFe4hAIPW_oho96PnidnlSJ3pYSekjs9x88Fjai_3CjfOVQD2aSo', NULL, 'Pradosh Pattanaik Started Following You', 'Follow', 'a', NULL, '2024-09-19 15:48:30', '2024-09-19 15:48:30'),
(170, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/JcJqzJKfbDfXs3EWMm6GLXkMn9R36QnDojc9C2Vd.png', NULL, '2024-09-20 12:50:44', '2024-09-20 12:50:44'),
(171, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Pradosh Pattanaik Commented on Your Post', 'Comment', 'https://lablum.com/storage/thumbnail/8scLnVVTA1aiXHpbAVO4Tc4bwxQou5bVNvxy9vkP.png', NULL, '2024-09-20 14:24:07', '2024-09-20 14:24:07'),
(172, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-20 20:37:40', '2024-09-20 20:37:40'),
(173, '185', 'dGxfzl8zTJyJ3jLuk-6YzH:APA91bEiAQWyjx7OAw7wgojgFYBQkMxQVbxWtsWkS3Oa5mafil8jJXRavhcpAd1FRFlceOdEgEgeqCM6fYqshAbT-Nnu1ebZifr_C0aWWRMnEqw9aF9PhLPT24GsIjj_JhiLV4Wfg25d', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/XpVS2tm2W7EhehHIlPISUtjHIiirRC6T7nDlRooa.png', NULL, '2024-09-20 20:42:09', '2024-09-20 20:42:09'),
(174, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/8p7e2WjKVISAhhwgzgXb6D6nEnoTQDLYe43Ikm9w.png', NULL, '2024-09-20 20:49:26', '2024-09-20 20:49:26'),
(175, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/Sc2emPiYHGc5VoVmujeUBDn3Z8bXiYFXGjpsMWdz.png', NULL, '2024-09-20 20:49:55', '2024-09-20 20:49:55'),
(176, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/qkJPcK2cJzkop9lBWl3aJbRLPHPAOnXA9aDqbxlO.png', NULL, '2024-09-20 20:50:21', '2024-09-20 20:50:21'),
(177, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-20 20:50:34', '2024-09-20 20:50:34'),
(178, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', NULL, '2024-09-20 20:51:16', '2024-09-20 20:51:16'),
(179, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/5UpSS4UKkSmVqhVLJhT9expFAREeTZwfCWGLZwmR.png', NULL, '2024-09-20 20:51:38', '2024-09-20 20:51:38'),
(180, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/Yl5BLBic0xcCb1IkCGbPu0Y0tznQ3MLol8GqG0D0.png', NULL, '2024-09-20 20:51:46', '2024-09-20 20:51:46'),
(181, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/PVNDxLXKCk2SeBGPWLWunZaGRahTPwsndJ2ImVhl.png', NULL, '2024-09-20 20:51:57', '2024-09-20 20:51:57'),
(182, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/NvN08BhXIC8nU6Z0tb9QFRNQT3JFQerzVSMlvibB.png', NULL, '2024-09-20 20:56:10', '2024-09-20 20:56:10'),
(183, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/FrL2JHv0LL7PeAcHbLUMzl5RGMvjTzfvD6hB8hwB.png', NULL, '2024-09-20 20:56:21', '2024-09-20 20:56:21'),
(184, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/PVNDxLXKCk2SeBGPWLWunZaGRahTPwsndJ2ImVhl.png', NULL, '2024-09-20 20:57:00', '2024-09-20 20:57:00'),
(185, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/Yl5BLBic0xcCb1IkCGbPu0Y0tznQ3MLol8GqG0D0.png', NULL, '2024-09-20 20:57:28', '2024-09-20 20:57:28'),
(186, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/5UpSS4UKkSmVqhVLJhT9expFAREeTZwfCWGLZwmR.png', NULL, '2024-09-20 20:57:58', '2024-09-20 20:57:58'),
(187, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', NULL, '2024-09-20 20:58:03', '2024-09-20 20:58:03'),
(188, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', NULL, '2024-09-20 21:03:05', '2024-09-20 21:03:05'),
(189, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Started Following You', 'Follow', 'a', NULL, '2024-09-20 21:03:07', '2024-09-20 21:03:07'),
(190, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Started Following You', 'Follow', 'a', NULL, '2024-09-20 21:03:28', '2024-09-20 21:03:28'),
(191, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/Oq9cN61kcskOKEgQa3jzVvgGvSfeydSR7p9ht1yH.png', NULL, '2024-09-20 21:04:11', '2024-09-20 21:04:11'),
(192, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Started Following You', 'Follow', 'a', NULL, '2024-09-20 21:04:21', '2024-09-20 21:04:21'),
(193, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/iH354HJAVPn7dVCTwLNcbD6n4LIihwFUuvBrLkZe.png', NULL, '2024-09-20 21:05:07', '2024-09-20 21:05:07'),
(194, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/gF19zt6sssB6LXPXLhNExpahQaVBDbwuETktWho1.png', NULL, '2024-09-20 21:06:23', '2024-09-20 21:06:23'),
(195, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/1iY6Zv3qhReQOyKpXF3OTMB6djH9kPXhBVoIZezG.png', NULL, '2024-09-20 21:06:28', '2024-09-20 21:06:28'),
(196, '189', 'e2jtN1FMQ2iAsYr74sBDzc:APA91bHHUNJrO_--mr1OZmMscMELqnY4_FEds9jd8s48XyTOd8c1epg0Q6yHFaWpHDFosdXhmhNeBvRSnBwhXy1_V7lGvACsEJkigUSYKwSsEu64owOaNZTitlBWYjIJPAViWpRQsmWJ', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/MZLMwhKjEli6oFrdiVG9w5mhu1zexxPD6v9ROUyD.png', NULL, '2024-09-20 21:07:27', '2024-09-20 21:07:27'),
(197, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/4v6IJho1J6i20XePwszkzHCdgNhwsnHNsODjIj6U.png', NULL, '2024-09-20 21:07:41', '2024-09-20 21:07:41'),
(198, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/3toREqGdU1K4YGzeOrmakjSPESHRPGsvDlyWocQI.png', NULL, '2024-09-20 21:09:45', '2024-09-20 21:09:45'),
(199, '185', 'dGxfzl8zTJyJ3jLuk-6YzH:APA91bEiAQWyjx7OAw7wgojgFYBQkMxQVbxWtsWkS3Oa5mafil8jJXRavhcpAd1FRFlceOdEgEgeqCM6fYqshAbT-Nnu1ebZifr_C0aWWRMnEqw9aF9PhLPT24GsIjj_JhiLV4Wfg25d', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/j8yYpRKJxWJ5dZwUkWR3gNFec4r0NM8R1TpUi8kh.png', NULL, '2024-09-20 21:10:55', '2024-09-20 21:10:55'),
(200, '185', 'dGxfzl8zTJyJ3jLuk-6YzH:APA91bEiAQWyjx7OAw7wgojgFYBQkMxQVbxWtsWkS3Oa5mafil8jJXRavhcpAd1FRFlceOdEgEgeqCM6fYqshAbT-Nnu1ebZifr_C0aWWRMnEqw9aF9PhLPT24GsIjj_JhiLV4Wfg25d', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/sbcAVeTLd08AZjToxa6aEihwmuM9huYMv8rfpzDT.png', NULL, '2024-09-20 21:11:03', '2024-09-20 21:11:03'),
(201, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/FrL2JHv0LL7PeAcHbLUMzl5RGMvjTzfvD6hB8hwB.png', NULL, '2024-09-21 09:06:59', '2024-09-21 09:06:59'),
(202, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/FrL2JHv0LL7PeAcHbLUMzl5RGMvjTzfvD6hB8hwB.png', NULL, '2024-09-21 09:07:22', '2024-09-21 09:07:22'),
(203, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/FrL2JHv0LL7PeAcHbLUMzl5RGMvjTzfvD6hB8hwB.png', NULL, '2024-09-21 09:07:27', '2024-09-21 09:07:27'),
(204, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/PVNDxLXKCk2SeBGPWLWunZaGRahTPwsndJ2ImVhl.png', NULL, '2024-09-21 10:41:49', '2024-09-21 10:41:49'),
(205, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 10:42:40', '2024-09-21 10:42:40'),
(206, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 10:42:42', '2024-09-21 10:42:42'),
(207, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 10:42:46', '2024-09-21 10:42:46'),
(208, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/PVNDxLXKCk2SeBGPWLWunZaGRahTPwsndJ2ImVhl.png', NULL, '2024-09-21 10:43:05', '2024-09-21 10:43:05'),
(209, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 10:43:16', '2024-09-21 10:43:16'),
(210, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 10:43:19', '2024-09-21 10:43:19'),
(211, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 10:45:45', '2024-09-21 10:45:45'),
(212, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 10:53:16', '2024-09-21 10:53:16'),
(213, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 10:53:18', '2024-09-21 10:53:18'),
(214, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 11:10:59', '2024-09-21 11:10:59'),
(215, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 11:14:19', '2024-09-21 11:14:19'),
(216, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 11:19:44', '2024-09-21 11:19:44'),
(217, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 11:25:34', '2024-09-21 11:25:34'),
(218, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 11:29:16', '2024-09-21 11:29:16'),
(219, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', NULL, '2024-09-21 11:30:30', '2024-09-21 11:30:30'),
(220, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', NULL, '2024-09-21 11:32:27', '2024-09-21 11:32:27'),
(221, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', NULL, '2024-09-21 11:37:14', '2024-09-21 11:37:14'),
(222, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', NULL, '2024-09-21 11:37:58', '2024-09-21 11:37:58'),
(223, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', NULL, '2024-09-21 11:39:40', '2024-09-21 11:39:40'),
(224, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', NULL, '2024-09-21 11:41:31', '2024-09-21 11:41:31'),
(225, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', NULL, '2024-09-21 11:43:01', '2024-09-21 11:43:01'),
(226, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', NULL, '2024-09-21 11:43:39', '2024-09-21 11:43:39'),
(227, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', NULL, '2024-09-21 11:50:22', '2024-09-21 11:50:22'),
(228, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', NULL, '2024-09-21 11:53:52', '2024-09-21 11:53:52'),
(229, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', NULL, '2024-09-21 11:54:10', '2024-09-21 11:54:10'),
(230, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', NULL, '2024-09-21 11:58:54', '2024-09-21 11:58:54'),
(231, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', NULL, '2024-09-21 12:14:57', '2024-09-21 12:14:57'),
(232, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 13:10:40', '2024-09-21 13:10:40'),
(233, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 13:12:53', '2024-09-21 13:12:53');
INSERT INTO `notifications` (`id`, `user_id`, `fcm_token`, `user_dp`, `notification`, `title`, `thumbnail`, `path_url`, `created_at`, `updated_at`) VALUES
(234, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 13:14:17', '2024-09-21 13:14:17'),
(235, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 13:14:58', '2024-09-21 13:14:58'),
(236, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 13:23:01', '2024-09-21 13:23:01'),
(237, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 13:26:53', '2024-09-21 13:26:53'),
(238, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 13:32:03', '2024-09-21 13:32:03'),
(239, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 13:33:52', '2024-09-21 13:33:52'),
(240, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 13:37:08', '2024-09-21 13:37:08'),
(241, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 13:37:34', '2024-09-21 13:37:34'),
(242, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-21 13:40:57', '2024-09-21 13:40:57'),
(243, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/JcJqzJKfbDfXs3EWMm6GLXkMn9R36QnDojc9C2Vd.png', NULL, '2024-09-21 15:00:23', '2024-09-21 15:00:23'),
(244, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', NULL, '2024-09-21 15:17:53', '2024-09-21 15:17:53'),
(245, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', 'https://lablum.com/storage/profile_pic/187/1722013404.jpg', 'Rikara Samanatray Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/TWogJ6a4iX5NXAeEv99pqSM83KbeZLEuzdpKEWFD.png', NULL, '2024-09-21 21:20:11', '2024-09-21 21:20:11'),
(246, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/I30it4e4lLetA67u33ktm3S8i3X9Wpff7UluGgDb.png', NULL, '2024-09-22 22:33:09', '2024-09-22 22:33:09'),
(247, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/8p7e2WjKVISAhhwgzgXb6D6nEnoTQDLYe43Ikm9w.png', NULL, '2024-09-22 22:35:26', '2024-09-22 22:35:26'),
(248, '200', 'fafnI53wQoK5k-Musd_tz-:APA91bFxxpp4Ihq4sl4x9Ar1bcyQEqlFD0Jtgcyso9TaVnzOqnfYtNwxofIezFQz-bYUfuqaU5P8q_jO7i_xrSR4tx0zXEC3sKfIaXLpX07EGmhlIbJ6BoEYWhdIviSmxjnUKYulIKGd', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/G2tTY5jt86bD3aeG0l3iyzyYWIhNuy8eLZDckbuo.png', NULL, '2024-09-23 09:37:33', '2024-09-23 09:37:33'),
(249, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/MmXPxMU35Wfu1KulsjdQA8cHFMNgHeOZQVp6lwuH.png', NULL, '2024-09-23 09:37:40', '2024-09-23 09:37:40'),
(250, '185', 'dGxfzl8zTJyJ3jLuk-6YzH:APA91bEiAQWyjx7OAw7wgojgFYBQkMxQVbxWtsWkS3Oa5mafil8jJXRavhcpAd1FRFlceOdEgEgeqCM6fYqshAbT-Nnu1ebZifr_C0aWWRMnEqw9aF9PhLPT24GsIjj_JhiLV4Wfg25d', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/E9UYWfsnX2vdPTfuhxypKk27AUMPPEYGPWxV9SQx.png', NULL, '2024-09-23 09:38:01', '2024-09-23 09:38:01'),
(251, '185', 'dGxfzl8zTJyJ3jLuk-6YzH:APA91bEiAQWyjx7OAw7wgojgFYBQkMxQVbxWtsWkS3Oa5mafil8jJXRavhcpAd1FRFlceOdEgEgeqCM6fYqshAbT-Nnu1ebZifr_C0aWWRMnEqw9aF9PhLPT24GsIjj_JhiLV4Wfg25d', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/D0eBdS79Y9uPy5TgOIhZ9bIzMVtlHuGLy8oXwrwT.png', NULL, '2024-09-23 09:38:04', '2024-09-23 09:38:04'),
(252, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-23 10:43:18', '2024-09-23 10:43:18'),
(253, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/I30it4e4lLetA67u33ktm3S8i3X9Wpff7UluGgDb.png', NULL, '2024-09-23 10:43:33', '2024-09-23 10:43:33'),
(254, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/I30it4e4lLetA67u33ktm3S8i3X9Wpff7UluGgDb.png', NULL, '2024-09-23 10:55:41', '2024-09-23 10:55:41'),
(255, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-23 11:19:58', '2024-09-23 11:19:58'),
(256, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-23 11:34:09', '2024-09-23 11:34:09'),
(257, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-23 11:44:19', '2024-09-23 11:44:19'),
(258, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Started Following You', 'Follow', 'a', NULL, '2024-09-23 11:45:52', '2024-09-23 11:45:52'),
(259, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Started Following You', 'Follow', 'a', NULL, '2024-09-23 11:46:25', '2024-09-23 11:46:25'),
(260, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Started Following You', 'Follow', 'a', NULL, '2024-09-23 11:48:40', '2024-09-23 11:48:40'),
(261, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Started Following You', 'Follow', 'a', NULL, '2024-09-23 11:50:21', '2024-09-23 11:50:21'),
(262, '189', 'e2jtN1FMQ2iAsYr74sBDzc:APA91bHHUNJrO_--mr1OZmMscMELqnY4_FEds9jd8s48XyTOd8c1epg0Q6yHFaWpHDFosdXhmhNeBvRSnBwhXy1_V7lGvACsEJkigUSYKwSsEu64owOaNZTitlBWYjIJPAViWpRQsmWJ', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-23 11:53:03', '2024-09-23 11:53:03'),
(263, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Started Following You', 'Follow', 'a', NULL, '2024-09-23 11:54:27', '2024-09-23 11:54:27'),
(264, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Started Following You', 'Follow', 'a', NULL, '2024-09-23 11:58:49', '2024-09-23 11:58:49'),
(265, '189', 'e2jtN1FMQ2iAsYr74sBDzc:APA91bHHUNJrO_--mr1OZmMscMELqnY4_FEds9jd8s48XyTOd8c1epg0Q6yHFaWpHDFosdXhmhNeBvRSnBwhXy1_V7lGvACsEJkigUSYKwSsEu64owOaNZTitlBWYjIJPAViWpRQsmWJ', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-23 12:00:54', '2024-09-23 12:00:54'),
(266, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Started Following You', 'Follow', 'a', NULL, '2024-09-23 12:04:08', '2024-09-23 12:04:08'),
(267, '189', 'e2jtN1FMQ2iAsYr74sBDzc:APA91bHHUNJrO_--mr1OZmMscMELqnY4_FEds9jd8s48XyTOd8c1epg0Q6yHFaWpHDFosdXhmhNeBvRSnBwhXy1_V7lGvACsEJkigUSYKwSsEu64owOaNZTitlBWYjIJPAViWpRQsmWJ', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/MZLMwhKjEli6oFrdiVG9w5mhu1zexxPD6v9ROUyD.png', NULL, '2024-09-23 12:04:19', '2024-09-23 12:04:19'),
(268, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-23 12:29:09', '2024-09-23 12:29:09'),
(269, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-23 12:29:16', '2024-09-23 12:29:16'),
(270, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-23 12:29:48', '2024-09-23 12:29:48'),
(271, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/MmXPxMU35Wfu1KulsjdQA8cHFMNgHeOZQVp6lwuH.png', NULL, '2024-09-23 12:35:55', '2024-09-23 12:35:55'),
(272, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/b5EUH2nypT2Ax8cniojwPWC0MtP2M1tDDMpXckm6.png', NULL, '2024-09-23 12:36:07', '2024-09-23 12:36:07'),
(273, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/bBaqpOzvxf3So2nZnl71RWSAUsBhvTKZNu65v2cI.png', NULL, '2024-09-23 12:39:01', '2024-09-23 12:39:01'),
(274, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/8p7e2WjKVISAhhwgzgXb6D6nEnoTQDLYe43Ikm9w.png', NULL, '2024-09-23 12:42:00', '2024-09-23 12:42:00'),
(275, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/Sc2emPiYHGc5VoVmujeUBDn3Z8bXiYFXGjpsMWdz.png', NULL, '2024-09-23 12:42:10', '2024-09-23 12:42:10'),
(276, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', NULL, '2024-09-23 12:42:28', '2024-09-23 12:42:28'),
(277, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', NULL, '2024-09-23 12:42:56', '2024-09-23 12:42:56'),
(278, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/I30it4e4lLetA67u33ktm3S8i3X9Wpff7UluGgDb.png', NULL, '2024-09-23 14:02:40', '2024-09-23 14:02:40'),
(279, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/wmMKfaWmjOAX7x8oGdq5Kx320blj85yeNyo1gGiJ.png', NULL, '2024-09-23 14:03:01', '2024-09-23 14:03:01'),
(280, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-23 14:03:30', '2024-09-23 14:03:30'),
(281, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/Sc2emPiYHGc5VoVmujeUBDn3Z8bXiYFXGjpsMWdz.png', NULL, '2024-09-23 14:03:41', '2024-09-23 14:03:41'),
(282, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/5UpSS4UKkSmVqhVLJhT9expFAREeTZwfCWGLZwmR.png', NULL, '2024-09-23 14:03:54', '2024-09-23 14:03:54'),
(283, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/Yl5BLBic0xcCb1IkCGbPu0Y0tznQ3MLol8GqG0D0.png', NULL, '2024-09-23 14:03:58', '2024-09-23 14:03:58'),
(284, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/8scLnVVTA1aiXHpbAVO4Tc4bwxQou5bVNvxy9vkP.png', NULL, '2024-09-23 14:05:14', '2024-09-23 14:05:14'),
(285, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/ediiJl00RHnKUTy1IOHPiRcIn9SCOYDxLIL9PFzU.png', NULL, '2024-09-23 14:05:40', '2024-09-23 14:05:40'),
(286, '196', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/dYr8AGz6urpYoWP7IwZHXcnKP4oTlKLcgCF18iEY.png', NULL, '2024-09-23 14:06:19', '2024-09-23 14:06:19'),
(287, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/PVNDxLXKCk2SeBGPWLWunZaGRahTPwsndJ2ImVhl.png', NULL, '2024-09-23 14:07:00', '2024-09-23 14:07:00'),
(288, '185', 'dGxfzl8zTJyJ3jLuk-6YzH:APA91bEiAQWyjx7OAw7wgojgFYBQkMxQVbxWtsWkS3Oa5mafil8jJXRavhcpAd1FRFlceOdEgEgeqCM6fYqshAbT-Nnu1ebZifr_C0aWWRMnEqw9aF9PhLPT24GsIjj_JhiLV4Wfg25d', 'https://lablum.com/storage/profile_pic/187/1722013404.jpg', 'Rikara Samanatray Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/XpVS2tm2W7EhehHIlPISUtjHIiirRC6T7nDlRooa.png', NULL, '2024-09-24 17:52:45', '2024-09-24 17:52:45'),
(289, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Ayasakanta Mohanty Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/b5EUH2nypT2Ax8cniojwPWC0MtP2M1tDDMpXckm6.png', NULL, '2024-09-24 20:46:58', '2024-09-24 20:46:58'),
(290, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/182/1718178162.jpg', 'Lablum Demo Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/UqZFRITb3pEX5Ia5mJslcaTfHqLYf5YUGckFR35U.png', NULL, '2024-09-25 06:08:42', '2024-09-25 06:08:42'),
(291, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/198/1719897370.jpg', 'Tarun kumar sahoo Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/0BBs6ZHeQSfyG4ZuQdyJot5vdN6jQPmpXjy7AjLV.png', NULL, '2024-09-25 08:51:31', '2024-09-25 08:51:31'),
(292, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/198/1719897370.jpg', 'Tarun kumar sahoo Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/GejsL7WkgXfjjMxVMeKPmWNBp9bzIoN6mohcIQAu.png', NULL, '2024-09-25 08:52:06', '2024-09-25 08:52:06'),
(293, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Jhili Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/6kdqGrSn0OL6FObRQMOGRtWbLJsNJtc3DSOIuqTn.png', NULL, '2024-09-25 16:06:03', '2024-09-25 16:06:03'),
(294, '185', 'dGxfzl8zTJyJ3jLuk-6YzH:APA91bEiAQWyjx7OAw7wgojgFYBQkMxQVbxWtsWkS3Oa5mafil8jJXRavhcpAd1FRFlceOdEgEgeqCM6fYqshAbT-Nnu1ebZifr_C0aWWRMnEqw9aF9PhLPT24GsIjj_JhiLV4Wfg25d', NULL, 'Jhili Nayak Started Following You', 'Follow', 'a', NULL, '2024-09-25 16:06:43', '2024-09-25 16:06:43'),
(295, '185', 'dGxfzl8zTJyJ3jLuk-6YzH:APA91bEiAQWyjx7OAw7wgojgFYBQkMxQVbxWtsWkS3Oa5mafil8jJXRavhcpAd1FRFlceOdEgEgeqCM6fYqshAbT-Nnu1ebZifr_C0aWWRMnEqw9aF9PhLPT24GsIjj_JhiLV4Wfg25d', NULL, 'Jhili Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/E9UYWfsnX2vdPTfuhxypKk27AUMPPEYGPWxV9SQx.png', NULL, '2024-09-25 16:07:43', '2024-09-25 16:07:43'),
(296, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/6kdqGrSn0OL6FObRQMOGRtWbLJsNJtc3DSOIuqTn.png', NULL, '2024-09-25 16:08:06', '2024-09-25 16:08:06'),
(297, '185', 'dGxfzl8zTJyJ3jLuk-6YzH:APA91bEiAQWyjx7OAw7wgojgFYBQkMxQVbxWtsWkS3Oa5mafil8jJXRavhcpAd1FRFlceOdEgEgeqCM6fYqshAbT-Nnu1ebZifr_C0aWWRMnEqw9aF9PhLPT24GsIjj_JhiLV4Wfg25d', NULL, 'Jhili Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/D0eBdS79Y9uPy5TgOIhZ9bIzMVtlHuGLy8oXwrwT.png', NULL, '2024-09-25 16:08:29', '2024-09-25 16:08:29'),
(298, '185', 'dGxfzl8zTJyJ3jLuk-6YzH:APA91bEiAQWyjx7OAw7wgojgFYBQkMxQVbxWtsWkS3Oa5mafil8jJXRavhcpAd1FRFlceOdEgEgeqCM6fYqshAbT-Nnu1ebZifr_C0aWWRMnEqw9aF9PhLPT24GsIjj_JhiLV4Wfg25d', NULL, 'Jhili Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/TwjHAtxCTKZdhwzEIO09AMNLo7p2Ds0teLyP9Wgb.png', NULL, '2024-09-25 16:09:04', '2024-09-25 16:09:04'),
(299, '185', 'dGxfzl8zTJyJ3jLuk-6YzH:APA91bEiAQWyjx7OAw7wgojgFYBQkMxQVbxWtsWkS3Oa5mafil8jJXRavhcpAd1FRFlceOdEgEgeqCM6fYqshAbT-Nnu1ebZifr_C0aWWRMnEqw9aF9PhLPT24GsIjj_JhiLV4Wfg25d', NULL, 'Jhili Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/TwjHAtxCTKZdhwzEIO09AMNLo7p2Ds0teLyP9Wgb.png', NULL, '2024-09-25 16:09:07', '2024-09-25 16:09:07'),
(300, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Jhili Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/MmXPxMU35Wfu1KulsjdQA8cHFMNgHeOZQVp6lwuH.png', NULL, '2024-09-25 16:11:00', '2024-09-25 16:11:00'),
(301, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Jhili Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/Yar0Vc4YyFWk8MjrkWZ97Ki0khpJaXhQthwLQSki.png', NULL, '2024-09-25 16:11:26', '2024-09-25 16:11:26'),
(302, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Started Following You', 'Follow', 'a', NULL, '2024-09-25 16:17:17', '2024-09-25 16:17:17'),
(303, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/A4gIq2iRR2JNAyrRnM76OHxeVSnhP3gEu3Y2qshv.png', NULL, '2024-09-25 16:18:04', '2024-09-25 16:18:04'),
(304, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/08p9mIPQzlBZdUZBAVsTjiioJzvoMnvTkdv8InfT.png', NULL, '2024-09-25 16:18:30', '2024-09-25 16:18:30'),
(305, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/207/1727266600.jpg', 'Jhili Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/4v6IJho1J6i20XePwszkzHCdgNhwsnHNsODjIj6U.png', NULL, '2024-09-25 16:20:44', '2024-09-25 16:20:44'),
(306, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/DFrygfrBJyj6DE3tmlrXb5yc1YDsXnZYDMTxIODm.png', NULL, '2024-09-25 16:22:30', '2024-09-25 16:22:30'),
(307, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/oPNRIsoz4gPpZKpcvwf3GgLQBzOKYI8SMVj9jpuG.png', NULL, '2024-09-25 16:23:22', '2024-09-25 16:23:22'),
(308, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/207/1727266600.jpg', 'Jhili Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/bBaqpOzvxf3So2nZnl71RWSAUsBhvTKZNu65v2cI.png', NULL, '2024-09-25 16:23:30', '2024-09-25 16:23:30'),
(309, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/id95SxmZMbLub8cq5ws1LN9gLTdyb3V1Ivzifk39.png', NULL, '2024-09-25 16:23:58', '2024-09-25 16:23:58'),
(310, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/jG8Yb8kRGm9gtu30t8LabyGz0h25nF6aixtsTvso.png', NULL, '2024-09-25 17:07:45', '2024-09-25 17:07:45'),
(311, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', NULL, 'Prabhat bhoi Started Following You', 'Follow', 'a', NULL, '2024-09-25 17:08:06', '2024-09-25 17:08:06'),
(312, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/FvrB27csGyB1G1R0rBs2RYkbAXIkZPCWGyFqvnwk.png', NULL, '2024-09-25 18:07:44', '2024-09-25 18:07:44'),
(313, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/FvrB27csGyB1G1R0rBs2RYkbAXIkZPCWGyFqvnwk.png', NULL, '2024-09-25 18:07:47', '2024-09-25 18:07:47'),
(314, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/038zwysgqH69XdvzfeB2csq5Zf6wNtjXYezTHCYr.png', NULL, '2024-09-25 20:16:26', '2024-09-25 20:16:26'),
(315, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Commented on Your Post', 'Comment', 'https://lablum.com/storage/thumbnail/038zwysgqH69XdvzfeB2csq5Zf6wNtjXYezTHCYr.png', NULL, '2024-09-25 20:16:54', '2024-09-25 20:16:54'),
(316, '189', 'e2jtN1FMQ2iAsYr74sBDzc:APA91bHHUNJrO_--mr1OZmMscMELqnY4_FEds9jd8s48XyTOd8c1epg0Q6yHFaWpHDFosdXhmhNeBvRSnBwhXy1_V7lGvACsEJkigUSYKwSsEu64owOaNZTitlBWYjIJPAViWpRQsmWJ', NULL, 'Arvind Kumar Started Following You', 'Follow', 'a', NULL, '2024-09-25 20:33:12', '2024-09-25 20:33:12'),
(317, '208', 'f_Lq89QfSDe2tjookZ9tp6:APA91bGHMg_SElylQ25LF0ME8LmCT3toFXOP3uVZ0qAkCB-aK8kOYBw0azq-VlmnvPEXXZvu98zzJ9SVwrHRfRK2gsf1d3BGo7twca06mJG4xtcV50L_kBIZLX6GWxD_im-jq1pl0bIw', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Started Following You', 'Follow', 'a', NULL, '2024-09-25 20:33:28', '2024-09-25 20:33:28'),
(318, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Bharati Biswal Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/bBaqpOzvxf3So2nZnl71RWSAUsBhvTKZNu65v2cI.png', NULL, '2024-09-25 20:48:39', '2024-09-25 20:48:39'),
(319, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/UqZFRITb3pEX5Ia5mJslcaTfHqLYf5YUGckFR35U.png', NULL, '2024-09-25 23:22:41', '2024-09-25 23:22:41'),
(320, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/038zwysgqH69XdvzfeB2csq5Zf6wNtjXYezTHCYr.png', NULL, '2024-09-25 23:22:46', '2024-09-25 23:22:46'),
(321, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/08p9mIPQzlBZdUZBAVsTjiioJzvoMnvTkdv8InfT.png', NULL, '2024-09-25 23:24:35', '2024-09-25 23:24:35'),
(322, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/yrb4HqhD5vNnSl0w4jq2Kb0IgeqRsl2NJlNJaYhR.png', NULL, '2024-09-25 23:25:19', '2024-09-25 23:25:19'),
(323, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Commented on Your Post', 'Comment', 'https://lablum.com/storage/thumbnail/yrb4HqhD5vNnSl0w4jq2Kb0IgeqRsl2NJlNJaYhR.png', NULL, '2024-09-25 23:25:31', '2024-09-25 23:25:31'),
(324, '185', 'dGxfzl8zTJyJ3jLuk-6YzH:APA91bEiAQWyjx7OAw7wgojgFYBQkMxQVbxWtsWkS3Oa5mafil8jJXRavhcpAd1FRFlceOdEgEgeqCM6fYqshAbT-Nnu1ebZifr_C0aWWRMnEqw9aF9PhLPT24GsIjj_JhiLV4Wfg25d', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/TwjHAtxCTKZdhwzEIO09AMNLo7p2Ds0teLyP9Wgb.png', NULL, '2024-09-26 07:09:51', '2024-09-26 07:09:51'),
(325, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/id95SxmZMbLub8cq5ws1LN9gLTdyb3V1Ivzifk39.png', NULL, '2024-09-26 07:10:07', '2024-09-26 07:10:07'),
(326, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', NULL, 'Prabhat bhoi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/2jTQWbe2TTYjovvjRJ3GyksSnVgY0vORxstM1uXn.png', NULL, '2024-09-26 07:32:43', '2024-09-26 07:32:43'),
(327, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Anita das Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/8scLnVVTA1aiXHpbAVO4Tc4bwxQou5bVNvxy9vkP.png', NULL, '2024-09-26 20:23:25', '2024-09-26 20:23:25'),
(328, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Anita das Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/8scLnVVTA1aiXHpbAVO4Tc4bwxQou5bVNvxy9vkP.png', NULL, '2024-09-26 20:23:28', '2024-09-26 20:23:28'),
(329, '210', 'fmlTJhrIQCm-XU8TenQJXT:APA91bEd1H2veFO247h7MFdowpKoksMblRmU87SXfagnKJ0Tw4Lgz4UUoKc2v77yoH_Q_IGCCqmHDR_OPDPMk75Hlgq0ptfrUGCCWt0KlWxWEaATK5pIa_eHCc84ssQd3iiJWrGQ2OEm', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Started Following You', 'Follow', 'a', NULL, '2024-09-26 21:23:49', '2024-09-26 21:23:49'),
(330, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/CM77G1BWa8uAfBsly5pjO4UJxDyiZLEGMRt9XvDz.png', NULL, '2024-09-26 21:24:14', '2024-09-26 21:24:14'),
(331, '189', 'e2jtN1FMQ2iAsYr74sBDzc:APA91bHHUNJrO_--mr1OZmMscMELqnY4_FEds9jd8s48XyTOd8c1epg0Q6yHFaWpHDFosdXhmhNeBvRSnBwhXy1_V7lGvACsEJkigUSYKwSsEu64owOaNZTitlBWYjIJPAViWpRQsmWJ', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/EjNq5w6ThUTbR0h2hIzn37LPXo5fTS5wRpHBOZBj.png', NULL, '2024-09-26 21:24:24', '2024-09-26 21:24:24'),
(332, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/NvN08BhXIC8nU6Z0tb9QFRNQT3JFQerzVSMlvibB.png', NULL, '2024-09-26 21:24:53', '2024-09-26 21:24:53'),
(333, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/nR3btfgZeVHlGqj6ulwBuasS894nM0vZE2f5nf90.png', NULL, '2024-09-26 21:25:19', '2024-09-26 21:25:19'),
(334, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/9rsefTE7xgBj0V9mdDSSVIE8fo1vXIAAQuKO5uS5.png', NULL, '2024-09-26 21:25:32', '2024-09-26 21:25:32'),
(335, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', NULL, '2024-09-26 21:25:36', '2024-09-26 21:25:36'),
(336, '180', 'd2KFx6V6RHGZy343ph7NiA:APA91bFAkOQU0XKSTabp4lKsD6ioX_viAopck0ltf8mRdnS1KnA9PKJOgIlMZJIZNeIgzx3Ror_2XJevveqYLqT6rFe4hAIPW_oho96PnidnlSJ3pYSekjs9x88Fjai_3CjfOVQD2aSo', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/5g4SWIzYZ4NRw9nW2LINvl3EDOytsFdLz59VlN14.png', NULL, '2024-09-26 21:25:39', '2024-09-26 21:25:39'),
(337, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/rWx3lGvq30UHCaVBXGUY5xJ1ak7CslkhiTFebDJR.png', NULL, '2024-09-26 21:26:09', '2024-09-26 21:26:09'),
(338, '189', 'e2jtN1FMQ2iAsYr74sBDzc:APA91bHHUNJrO_--mr1OZmMscMELqnY4_FEds9jd8s48XyTOd8c1epg0Q6yHFaWpHDFosdXhmhNeBvRSnBwhXy1_V7lGvACsEJkigUSYKwSsEu64owOaNZTitlBWYjIJPAViWpRQsmWJ', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/Vpb4SDenVStyDjQxGU8vpONBE4gBGX8jOvcFlSud.png', NULL, '2024-09-26 21:41:43', '2024-09-26 21:41:43'),
(339, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/vnpoy1nLq6JwnFxxxIZhMBLigqpnUR5D71hSUXpy.png', NULL, '2024-09-26 21:42:23', '2024-09-26 21:42:23'),
(340, '185', 'dGxfzl8zTJyJ3jLuk-6YzH:APA91bEiAQWyjx7OAw7wgojgFYBQkMxQVbxWtsWkS3Oa5mafil8jJXRavhcpAd1FRFlceOdEgEgeqCM6fYqshAbT-Nnu1ebZifr_C0aWWRMnEqw9aF9PhLPT24GsIjj_JhiLV4Wfg25d', 'https://lablum.com/storage/profile_pic/187/1722013404.jpg', 'Rikara Samanatray Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/D0eBdS79Y9uPy5TgOIhZ9bIzMVtlHuGLy8oXwrwT.png', NULL, '2024-09-26 23:03:18', '2024-09-26 23:03:18'),
(341, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', NULL, 'Rudranarayan Rout Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/i6X8UhNSEO47iiWR1O05AMz8odrbF1rdIHPP1e3e.png', NULL, '2024-09-27 06:47:58', '2024-09-27 06:47:58'),
(342, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', NULL, 'Rudranarayan Rout Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/7cYaKwQh1xaXVoMMQ2CiKJXupwsGJkG49W15Zmge.png', NULL, '2024-09-27 06:48:26', '2024-09-27 06:48:26'),
(343, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Rudranarayan Rout Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/0BBs6ZHeQSfyG4ZuQdyJot5vdN6jQPmpXjy7AjLV.png', NULL, '2024-09-27 06:49:07', '2024-09-27 06:49:07'),
(344, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/bBaqpOzvxf3So2nZnl71RWSAUsBhvTKZNu65v2cI.png', NULL, '2024-09-27 08:28:55', '2024-09-27 08:28:55'),
(345, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/qbN2ofjSF6Sd1wX0wX4gd1Xa2hUvy9QI2oINWHPU.png', NULL, '2024-09-27 08:29:01', '2024-09-27 08:29:01'),
(346, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/MmXPxMU35Wfu1KulsjdQA8cHFMNgHeOZQVp6lwuH.png', NULL, '2024-09-27 08:29:08', '2024-09-27 08:29:08'),
(347, '180', 'd2KFx6V6RHGZy343ph7NiA:APA91bFAkOQU0XKSTabp4lKsD6ioX_viAopck0ltf8mRdnS1KnA9PKJOgIlMZJIZNeIgzx3Ror_2XJevveqYLqT6rFe4hAIPW_oho96PnidnlSJ3pYSekjs9x88Fjai_3CjfOVQD2aSo', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/U2iQzzpHXbXc10TpQvxG8WByA0wM2Ov5kbwebWRe.png', NULL, '2024-09-27 08:29:52', '2024-09-27 08:29:52'),
(348, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/08p9mIPQzlBZdUZBAVsTjiioJzvoMnvTkdv8InfT.png', NULL, '2024-09-27 08:31:45', '2024-09-27 08:31:45'),
(349, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Rudranarayan Rout Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/OEqgCJ6zvcy7jtfwItbsW7eHPTBAB5bwg9DoHyo7.png', NULL, '2024-09-27 08:36:17', '2024-09-27 08:36:17'),
(350, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Rudranarayan Rout Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/C1QDursqfTvZIxyYXwP3ykzSrFx3IRnhGk1qc2QS.png', NULL, '2024-09-27 08:36:17', '2024-09-27 08:36:17'),
(351, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', NULL, 'Rudranarayan Rout Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/9rsefTE7xgBj0V9mdDSSVIE8fo1vXIAAQuKO5uS5.png', NULL, '2024-09-27 08:36:36', '2024-09-27 08:36:36'),
(352, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Rudranarayan Rout Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/8scLnVVTA1aiXHpbAVO4Tc4bwxQou5bVNvxy9vkP.png', NULL, '2024-09-27 08:36:48', '2024-09-27 08:36:48'),
(353, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', NULL, 'Anita das Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/oPNRIsoz4gPpZKpcvwf3GgLQBzOKYI8SMVj9jpuG.png', NULL, '2024-09-27 09:21:04', '2024-09-27 09:21:04'),
(354, '189', 'e2jtN1FMQ2iAsYr74sBDzc:APA91bHHUNJrO_--mr1OZmMscMELqnY4_FEds9jd8s48XyTOd8c1epg0Q6yHFaWpHDFosdXhmhNeBvRSnBwhXy1_V7lGvACsEJkigUSYKwSsEu64owOaNZTitlBWYjIJPAViWpRQsmWJ', NULL, 'Anita das Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/GTrX16vbIIP6GMck2b6sDyMzgFampWl0sycIYZiR.png', NULL, '2024-09-27 09:22:56', '2024-09-27 09:22:56'),
(355, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', NULL, 'Anita das Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/QTskCosOC3jNlZm06A2DvToHCajCNQSYHBnJ6NRp.png', NULL, '2024-09-27 09:23:46', '2024-09-27 09:23:46'),
(356, '189', 'e2jtN1FMQ2iAsYr74sBDzc:APA91bHHUNJrO_--mr1OZmMscMELqnY4_FEds9jd8s48XyTOd8c1epg0Q6yHFaWpHDFosdXhmhNeBvRSnBwhXy1_V7lGvACsEJkigUSYKwSsEu64owOaNZTitlBWYjIJPAViWpRQsmWJ', NULL, 'Anita das Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/ERE7GPlAdWmHFte0NRcupYevjxBWptF3hyQqMtvz.png', NULL, '2024-09-27 09:25:03', '2024-09-27 09:25:03'),
(357, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/3toREqGdU1K4YGzeOrmakjSPESHRPGsvDlyWocQI.png', NULL, '2024-09-27 19:45:20', '2024-09-27 19:45:20'),
(358, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/Yl5BLBic0xcCb1IkCGbPu0Y0tznQ3MLol8GqG0D0.png', NULL, '2024-09-27 21:13:07', '2024-09-27 21:13:07'),
(359, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Commented on Your Post', 'Comment', 'https://lablum.com/storage/thumbnail/Yl5BLBic0xcCb1IkCGbPu0Y0tznQ3MLol8GqG0D0.png', NULL, '2024-09-27 21:13:19', '2024-09-27 21:13:19'),
(360, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Pradosh Pattanaik Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/5UpSS4UKkSmVqhVLJhT9expFAREeTZwfCWGLZwmR.png', NULL, '2024-09-27 21:13:50', '2024-09-27 21:13:50'),
(361, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/pp4HwpDTNTLAXqapyRftIeSJs2XTmhanHOh065ol.png', NULL, '2024-09-28 14:21:43', '2024-09-28 14:21:43'),
(362, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/pp4HwpDTNTLAXqapyRftIeSJs2XTmhanHOh065ol.png', NULL, '2024-09-28 14:21:46', '2024-09-28 14:21:46'),
(363, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/pp4HwpDTNTLAXqapyRftIeSJs2XTmhanHOh065ol.png', NULL, '2024-09-28 14:21:49', '2024-09-28 14:21:49');
INSERT INTO `notifications` (`id`, `user_id`, `fcm_token`, `user_dp`, `notification`, `title`, `thumbnail`, `path_url`, `created_at`, `updated_at`) VALUES
(364, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/9BvtYrEP7t0crD56CXn0QiRPQPC0S3BSnCo5FXLi.png', NULL, '2024-09-28 14:21:53', '2024-09-28 14:21:53'),
(365, '185', 'dGxfzl8zTJyJ3jLuk-6YzH:APA91bEiAQWyjx7OAw7wgojgFYBQkMxQVbxWtsWkS3Oa5mafil8jJXRavhcpAd1FRFlceOdEgEgeqCM6fYqshAbT-Nnu1ebZifr_C0aWWRMnEqw9aF9PhLPT24GsIjj_JhiLV4Wfg25d', 'https://lablum.com/storage/profile_pic/187/1722013404.jpg', 'Rikara Samanatray Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/j8yYpRKJxWJ5dZwUkWR3gNFec4r0NM8R1TpUi8kh.png', NULL, '2024-09-28 14:23:39', '2024-09-28 14:23:39'),
(366, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'Arpita pradhan Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/Sc2emPiYHGc5VoVmujeUBDn3Z8bXiYFXGjpsMWdz.png', NULL, '2024-09-29 13:49:56', '2024-09-29 13:49:56'),
(367, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/3kuYW80JG7UiaBMWLeXPeUrgZfxY6wZw56WRDVoU.png', NULL, '2024-09-29 15:51:19', '2024-09-29 15:51:19'),
(368, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Commented on Your Post', 'Comment', 'https://lablum.com/storage/thumbnail/vnpoy1nLq6JwnFxxxIZhMBLigqpnUR5D71hSUXpy.png', NULL, '2024-09-29 15:56:56', '2024-09-29 15:56:56'),
(369, '180', 'd2KFx6V6RHGZy343ph7NiA:APA91bFAkOQU0XKSTabp4lKsD6ioX_viAopck0ltf8mRdnS1KnA9PKJOgIlMZJIZNeIgzx3Ror_2XJevveqYLqT6rFe4hAIPW_oho96PnidnlSJ3pYSekjs9x88Fjai_3CjfOVQD2aSo', 'https://lablum.com/storage/profile_pic/187/1722013404.jpg', 'Rikara Samanatray Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/OHJxh2tyWwId0xFmsYJDHPsjS8285TOljBefmEmx.png', NULL, '2024-09-29 16:34:47', '2024-09-29 16:34:47'),
(370, '198', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/jRJRBbBZpF94zRF0z6BtyzkToF8flWyx8Ty5Stlf.png', NULL, '2024-09-29 16:44:18', '2024-09-29 16:44:18'),
(371, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/i6X8UhNSEO47iiWR1O05AMz8odrbF1rdIHPP1e3e.png', NULL, '2024-09-29 21:48:04', '2024-09-29 21:48:04'),
(372, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/QTskCosOC3jNlZm06A2DvToHCajCNQSYHBnJ6NRp.png', NULL, '2024-09-29 21:52:14', '2024-09-29 21:52:14'),
(373, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/180/1721894069.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/qbN2ofjSF6Sd1wX0wX4gd1Xa2hUvy9QI2oINWHPU.png', NULL, '2024-09-29 21:52:34', '2024-09-29 21:52:34'),
(374, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/180/1727632618.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/lGmlg1cFO4zWuEj6kbn0Q8Djm2JxLk7OvJpDwjda.png', NULL, '2024-09-29 21:57:33', '2024-09-29 21:57:33'),
(375, '189', 'e2jtN1FMQ2iAsYr74sBDzc:APA91bHHUNJrO_--mr1OZmMscMELqnY4_FEds9jd8s48XyTOd8c1epg0Q6yHFaWpHDFosdXhmhNeBvRSnBwhXy1_V7lGvACsEJkigUSYKwSsEu64owOaNZTitlBWYjIJPAViWpRQsmWJ', 'https://lablum.com/storage/profile_pic/180/1727632618.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/uL0sqHNGjR4e7eq7lOgvhVIKuV0kEATdxNfERNMb.png', NULL, '2024-09-29 21:59:07', '2024-09-29 21:59:07'),
(376, '185', 'dGxfzl8zTJyJ3jLuk-6YzH:APA91bEiAQWyjx7OAw7wgojgFYBQkMxQVbxWtsWkS3Oa5mafil8jJXRavhcpAd1FRFlceOdEgEgeqCM6fYqshAbT-Nnu1ebZifr_C0aWWRMnEqw9aF9PhLPT24GsIjj_JhiLV4Wfg25d', NULL, 'Arpita pradhan Started Following You', 'Follow', 'a', NULL, '2024-09-30 11:21:23', '2024-09-30 11:21:23'),
(377, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/i6X8UhNSEO47iiWR1O05AMz8odrbF1rdIHPP1e3e.png', NULL, '2024-09-30 15:02:34', '2024-09-30 15:02:34'),
(378, '212', 'euSF5uRrTEu_OFP32986qN:APA91bHH0zCTO3g-cfDW9dgIrBmYAox5xhE-GnRfKBOol8V8YDViV7RuYv97Yqu--vedR0Fh1xQDIRx0bgCxQjmLzB7BnDD0EJFfdqT6dhl4xDnHfGVRb6o2y5Lp9IWci2mGOhY_JTeR', 'https://lablum.com/storage/profile_pic/207/1727266600.jpg', 'Jhili Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/pYizHdmbRc6Fd6vHsrq8Fhgr1bTgE26vhe1HyYju.png', NULL, '2024-09-30 15:09:26', '2024-09-30 15:09:26'),
(379, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/Kj7Z7bENhw2czKzwLsawd6bBCjRNwpH0oIS399az.png', NULL, '2024-09-30 21:12:44', '2024-09-30 21:12:44'),
(380, '180', 'd2KFx6V6RHGZy343ph7NiA:APA91bFAkOQU0XKSTabp4lKsD6ioX_viAopck0ltf8mRdnS1KnA9PKJOgIlMZJIZNeIgzx3Ror_2XJevveqYLqT6rFe4hAIPW_oho96PnidnlSJ3pYSekjs9x88Fjai_3CjfOVQD2aSo', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/OHJxh2tyWwId0xFmsYJDHPsjS8285TOljBefmEmx.png', NULL, '2024-09-30 21:14:19', '2024-09-30 21:14:19'),
(381, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/QTskCosOC3jNlZm06A2DvToHCajCNQSYHBnJ6NRp.png', NULL, '2024-10-01 11:42:40', '2024-10-01 11:42:40'),
(382, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/207/1727266600.jpg', 'Jhili Nayak Started Following You', 'Follow', 'a', NULL, '2024-10-01 11:43:25', '2024-10-01 11:43:25'),
(383, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/YCVLAkSd1ulWuICYivc1D7cbSQFP6dB0dOb1fzjk.png', NULL, '2024-10-01 11:44:27', '2024-10-01 11:44:27'),
(384, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/9rsefTE7xgBj0V9mdDSSVIE8fo1vXIAAQuKO5uS5.png', NULL, '2024-10-01 11:44:34', '2024-10-01 11:44:34'),
(385, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/7cYaKwQh1xaXVoMMQ2CiKJXupwsGJkG49W15Zmge.png', NULL, '2024-10-01 11:44:39', '2024-10-01 11:44:39'),
(386, '207', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/2jTQWbe2TTYjovvjRJ3GyksSnVgY0vORxstM1uXn.png', NULL, '2024-10-01 11:44:49', '2024-10-01 11:44:49'),
(387, '214', 'egN8vEq8Q6uuMVyKOvoctB:APA91bF3Z_lE7UQN2StrqO49mGiVqeNgESwRSx4mwwWorjNWPyVz7KLtI1vJTxOIjMV8tfqM6FMJOkA51JD3z7eaidg2LOT6G15zbl52e2XFnb2-We4YKvnMOPPX4B_n6RI2j08R11w4', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Started Following You', 'Follow', 'a', NULL, '2024-10-01 11:46:56', '2024-10-01 11:46:56'),
(388, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/UqZFRITb3pEX5Ia5mJslcaTfHqLYf5YUGckFR35U.png', NULL, '2024-10-02 10:46:19', '2024-10-02 10:46:19'),
(389, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/180/1727632618.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/OEqgCJ6zvcy7jtfwItbsW7eHPTBAB5bwg9DoHyo7.png', NULL, '2024-10-06 10:58:25', '2024-10-06 10:58:25'),
(390, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/180/1727632618.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/RGDPm8b9WwPintRLBJ2Gfc5lPki7Y0zl8EFARHIk.png', NULL, '2024-10-06 10:58:54', '2024-10-06 10:58:54'),
(391, '180', 'd2KFx6V6RHGZy343ph7NiA:APA91bFAkOQU0XKSTabp4lKsD6ioX_viAopck0ltf8mRdnS1KnA9PKJOgIlMZJIZNeIgzx3Ror_2XJevveqYLqT6rFe4hAIPW_oho96PnidnlSJ3pYSekjs9x88Fjai_3CjfOVQD2aSo', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/2noX3TNcovb4s07RK4Z31rwjHBRUAA3LAoHp53s2.png', NULL, '2024-10-07 14:40:55', '2024-10-07 14:40:55'),
(392, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'https://lablum.com/storage/profile_pic/180/1727632618.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/NvN08BhXIC8nU6Z0tb9QFRNQT3JFQerzVSMlvibB.png', NULL, '2024-10-07 14:50:48', '2024-10-07 14:50:48'),
(393, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/180/1727632618.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/V4lo5N8MScY6yUlq3J5ELiJpazFGEwRn5LtIgp5H.png', NULL, '2024-10-07 14:51:00', '2024-10-07 14:51:00'),
(394, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/qFIPIWcYf9pwbQaPHFt6GDQ7givrGp1YqltP8Tu5.png', NULL, '2024-10-10 21:22:12', '2024-10-10 21:22:12'),
(395, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'pratibha devi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/qbN2ofjSF6Sd1wX0wX4gd1Xa2hUvy9QI2oINWHPU.png', NULL, '2024-10-12 06:58:28', '2024-10-12 06:58:28'),
(396, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'pratibha devi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/qkJPcK2cJzkop9lBWl3aJbRLPHPAOnXA9aDqbxlO.png', NULL, '2024-10-12 06:58:37', '2024-10-12 06:58:37'),
(397, '188', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', NULL, 'pratibha devi Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/qkJPcK2cJzkop9lBWl3aJbRLPHPAOnXA9aDqbxlO.png', NULL, '2024-10-12 06:58:51', '2024-10-12 06:58:51'),
(398, '180', 'd2KFx6V6RHGZy343ph7NiA:APA91bFAkOQU0XKSTabp4lKsD6ioX_viAopck0ltf8mRdnS1KnA9PKJOgIlMZJIZNeIgzx3Ror_2XJevveqYLqT6rFe4hAIPW_oho96PnidnlSJ3pYSekjs9x88Fjai_3CjfOVQD2aSo', 'https://lablum.com/storage/profile_pic/185/1719497215.jpg', 'Laxmipriya Nayak Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/U2iQzzpHXbXc10TpQvxG8WByA0wM2Ov5kbwebWRe.png', NULL, '2024-10-15 00:06:16', '2024-10-15 00:06:16'),
(399, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'https://lablum.com/storage/profile_pic/189/1719287743.jpg', 'Ravikant Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/XPcCLBUHPJwfvBj5l6KStMaan0K33uueuJSz6iKK.png', NULL, '2024-10-16 22:20:42', '2024-10-16 22:20:42'),
(400, '218', 'crgzl5_7Q4md0w1QyTY9vQ:APA91bF0T2lc8fofi7jjcoS4r8TqVWrNOLctm0Is38eNnYtWPF86066BVAhOsU6CoM5POdOLVARnSDGEbXJTZrueT0v8uBqhNwNJ5t_V7C86i84uiAluxiaW6GFFK2Mdl3FLM4fJoBCI', 'https://lablum.com/storage/profile_pic/180/1727632618.jpg', 'Rakesh Kumar Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/QCTRnORL12OCCZWWPLCPPcCPdDekCp197ttatSXo.png', NULL, '2024-10-19 19:59:06', '2024-10-19 19:59:06'),
(401, '185', 'dGxfzl8zTJyJ3jLuk-6YzH:APA91bEiAQWyjx7OAw7wgojgFYBQkMxQVbxWtsWkS3Oa5mafil8jJXRavhcpAd1FRFlceOdEgEgeqCM6fYqshAbT-Nnu1ebZifr_C0aWWRMnEqw9aF9PhLPT24GsIjj_JhiLV4Wfg25d', NULL, 'Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/D0eBdS79Y9uPy5TgOIhZ9bIzMVtlHuGLy8oXwrwT.png', NULL, '2024-10-22 08:55:18', '2024-10-22 08:55:18'),
(402, '187', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', NULL, 'Poonam Jena Liked Your Post', 'Like', 'https://lablum.com/storage/thumbnail/MmXPxMU35Wfu1KulsjdQA8cHFMNgHeOZQVp6lwuH.png', NULL, '2024-10-22 13:16:11', '2024-10-22 13:16:11');

-- --------------------------------------------------------

--
-- Table structure for table `officialpayments`
--

CREATE TABLE `officialpayments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `razorpay_payment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otherlinks`
--

CREATE TABLE `otherlinks` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `otherlinks`
--

INSERT INTO `otherlinks` (`id`, `name`, `url`, `created_at`, `updated_at`) VALUES
(1, 'Payout Bill', 'https://razorpay.com/?utm_source=google&utm_medium=cpc&utm_campaign=RPSME-RPPerf-GSearchBrand-Prospect-Dweb-Core&utm_adgroup=brandsearch_core_exact&utm_content=RPSME-Brand-010223&utm_term=razorpay&utm_gclid=CjwKCAjw57exBhAsEiwAaIxaZl60RLIE_NwN-6SEv0q89w_f8WZkMHjZsUHEqUKU8txWQTNMjZSZFhoCUv0QAvD_BwE&utm_campaignID=400139470&utm_adgroupID=27293859910&utm_adID=689518700854&utm_network=g&utm_device=c&utm_matchtype=e&utm_devicemodel=&utm_adposition=&utm_location=9149988&gad_source=1&gclid=CjwKCAjw57exBhAsEiwAaIxaZl60RLIE_NwN-6SEv0q89w_f8WZkMHjZsUHEqUKU8txWQTNMjZSZFhoCUv0QAvD_BwE', '2024-04-29 01:28:23', '2024-04-29 02:55:36');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `r_payment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advertiser_id` bigint UNSIGNED DEFAULT NULL,
  `addplan_id` bigint UNSIGNED DEFAULT NULL,
  `invoice_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefill_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefill_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefill_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advertisment_coast` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_tax_amounts` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json_response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `invoice_sent` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'admin', NULL, NULL),
(2, 'role_view', 'admin', NULL, NULL),
(3, 'role_create', 'admin', NULL, NULL),
(4, 'role_permission', 'admin', NULL, NULL),
(5, 'user_view', 'admin', NULL, NULL),
(6, 'user_create', 'admin', NULL, NULL),
(7, 'user_edit', 'admin', NULL, NULL),
(8, 'add_organization', 'admin', NULL, NULL),
(9, 'edit_organization', 'admin', NULL, NULL),
(10, 'delete_organization', 'admin', NULL, NULL),
(11, 'add_post_category', 'admin', NULL, NULL),
(12, 'edit_post_category', 'admin', NULL, NULL),
(13, 'real_user_view', 'admin', NULL, NULL),
(14, 'filter_user', 'admin', NULL, NULL),
(15, 'download_today_user', 'admin', NULL, NULL),
(16, 'download_bydate_user', 'admin', NULL, NULL),
(17, 'filter_fake_user', 'admin', NULL, NULL),
(18, 'download_today_fake_user', 'admin', NULL, NULL),
(19, 'download_bydate_fake_user', 'admin', NULL, NULL),
(20, 'fake_user', 'admin', NULL, NULL),
(21, 'real_post', 'admin', NULL, NULL),
(22, 'filter_post_date', 'admin', NULL, NULL),
(23, 'filter_fake_post', 'admin', NULL, NULL),
(24, 'fake_post', 'admin', NULL, NULL),
(25, 'update_post_isactive', 'admin', NULL, NULL),
(26, 'song_list', 'admin', NULL, NULL),
(27, 'create_song', 'admin', NULL, NULL),
(28, 'edit_song', 'admin', NULL, NULL),
(29, 'category_list', 'admin', NULL, NULL),
(30, 'create_category', 'admin', NULL, NULL),
(31, 'edit_category', 'admin', NULL, NULL),
(32, 'like_post', 'admin', NULL, NULL),
(33, 'comment_post', 'admin', NULL, NULL),
(34, 'watch_list', 'admin', NULL, NULL),
(35, 'advertisement_list', 'admin', NULL, NULL),
(36, 'add_advertiser', 'admin', NULL, NULL),
(37, 'update_advertiser_isactive', 'admin', NULL, NULL),
(38, 'show_plan', 'admin', NULL, NULL),
(39, 'plan_videos', 'admin', NULL, NULL),
(40, 'update_videos_status', 'admin', NULL, NULL),
(41, 'delete_add_video', 'admin', NULL, NULL),
(42, 'show_payment_details', 'admin', NULL, NULL),
(43, 'create_advertisement_pricing', 'admin', NULL, NULL),
(44, 'advertisement_pricing_list', 'admin', NULL, NULL),
(45, 'edit_advertisement_pricing', 'admin', NULL, NULL),
(46, 'create_advertisement_category', 'admin', NULL, NULL),
(47, 'advertisement_category_list', 'admin', NULL, NULL),
(48, 'edit_advertisement_category', 'admin', NULL, NULL),
(49, 'blog_list', 'admin', NULL, NULL),
(50, 'create_blog', 'admin', NULL, NULL),
(51, 'edit_blog', 'admin', NULL, NULL),
(52, 'delete_blog', 'admin', NULL, NULL),
(53, 'earning_points_list', 'admin', NULL, NULL),
(54, 'create_earning_points', 'admin', NULL, NULL),
(55, 'edit_earning_points', 'admin', NULL, NULL),
(56, 'user_wallet_list', 'admin', NULL, NULL),
(57, 'search_user_wallet', 'admin', NULL, NULL),
(58, 'official_verification', 'admin', NULL, NULL),
(59, 'update_verify_status', 'admin', NULL, NULL),
(60, 'term_policy_list', 'admin', NULL, NULL),
(61, 'create_term_policy', 'admin', NULL, NULL),
(62, 'edit_term_policy', 'admin', NULL, NULL),
(63, 'gst_list', 'admin', NULL, NULL),
(64, 'create_gst', 'admin', NULL, NULL),
(65, 'edit_gst', 'admin', NULL, NULL),
(66, 'tax_list', 'admin', NULL, NULL),
(67, 'create_tax', 'admin', NULL, NULL),
(68, 'edit_tax', 'admin', NULL, NULL),
(69, 'taxcharges_list', 'admin', NULL, NULL),
(70, 'create_taxcharges', 'admin', NULL, NULL),
(71, 'edit_taxcharges', 'admin', NULL, NULL),
(72, 'advertisement_billing_transaction', 'admin', NULL, NULL),
(73, 'download_payment', 'admin', NULL, NULL),
(74, 'show_today_addtransaction', 'admin', NULL, NULL),
(75, 'download_today_addtransaction', 'admin', NULL, NULL),
(76, 'download_bydate_addtransaction', 'admin', NULL, NULL),
(77, 'otherlinks_list', 'admin', NULL, NULL),
(78, 'create_otherlinks', 'admin', NULL, NULL),
(79, 'edit_otherlinks', 'admin', NULL, NULL),
(80, 'update_password', 'admin', NULL, NULL),
(81, 'withdrawal_history', 'admin', NULL, NULL),
(82, 'download_today_withdrawal', 'admin', NULL, NULL),
(83, 'download_bydate_withdrawal', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `postreports`
--

CREATE TABLE `postreports` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `postreports`
--

INSERT INTO `postreports` (`id`, `user_id`, `post_id`, `message`, `created_at`, `updated_at`) VALUES
(20, '196', '22', 'It\'s a Spam', '2024-09-18 13:34:31', '2024-09-18 13:34:31');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `like_count` int UNSIGNED DEFAULT NULL,
  `comment_count` int UNSIGNED DEFAULT NULL,
  `share_count` int NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `length` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `like_count`, `comment_count`, `share_count`, `title`, `description`, `video`, `length`, `thumbnail`, `active`, `created_at`, `updated_at`) VALUES
(19, 189, NULL, 1, 2, '#Jai Sree Ganesh🙏🙏🙏🙏🙏', NULL, 'post/video_1726473221_ya9a6uCOga.mp4', '15', 'MZLMwhKjEli6oFrdiVG9w5mhu1zexxPD6v9ROUyD.png', 1, '2024-09-16 11:53:44', '2024-10-07 10:18:24'),
(20, 188, NULL, 4, 0, 'motivation', NULL, 'post/video_1726473258_WC1bjyKBO8.mp4', '71', 'NvN08BhXIC8nU6Z0tb9QFRNQT3JFQerzVSMlvibB.png', 1, '2024-09-16 11:54:26', '2024-09-17 21:56:35'),
(21, 189, NULL, NULL, 0, 'Love You Maa🙏🙏', NULL, 'post/video_1726473330_50CcQxdRNx.mp4', '45', 'ERE7GPlAdWmHFte0NRcupYevjxBWptF3hyQqMtvz.png', 1, '2024-09-16 11:55:36', '2024-09-16 11:55:36'),
(22, 188, NULL, 2, 0, 'life speech', NULL, 'post/video_1726473347_SYN0EIRTZD.mp4', '18', 'FrL2JHv0LL7PeAcHbLUMzl5RGMvjTzfvD6hB8hwB.png', 1, '2024-09-16 11:55:52', '2024-09-17 21:49:28'),
(23, 198, NULL, NULL, 16, 'sooraj hua madham', NULL, 'post/video_1726473367_mxHmhkHUXv.mp4', '37', 'oPNRIsoz4gPpZKpcvwf3GgLQBzOKYI8SMVj9jpuG.png', 1, '2024-09-16 11:56:12', '2024-09-27 08:31:52'),
(24, 180, NULL, NULL, 0, 'Jamming session with my brothers', '#song #jamming #tabla', 'post/video_1726473477_PIcsfuAKms.mp4', '104', 'U2iQzzpHXbXc10TpQvxG8WByA0wM2Ov5kbwebWRe.png', 1, '2024-09-16 11:58:04', '2024-09-16 11:58:04'),
(25, 196, NULL, 1, 0, 'automatic', NULL, 'post/video_1726473589_RgqGkeovtD.mp4', '12', 'dYr8AGz6urpYoWP7IwZHXcnKP4oTlKLcgCF18iEY.png', 1, '2024-09-16 11:59:54', '2024-09-18 13:14:57'),
(26, 196, NULL, NULL, 0, 'protection', NULL, 'post/video_1726473633_oCuTkC7v6I.mp4', '18', '3yS9Ajoxz2ebrz8KcjZQj22WTaGn1RdfjmeSjg7J.png', 1, '2024-09-16 12:00:37', '2024-09-16 12:00:37'),
(27, 180, NULL, NULL, 0, 'Happy Birthday brother 🎂🎂🎂', '#birthday', 'post/video_1726473655_jQHQgS2lRy.mp4', '36', '5g4SWIzYZ4NRw9nW2LINvl3EDOytsFdLz59VlN14.png', 1, '2024-09-16 12:01:01', '2024-09-16 12:01:01'),
(28, 196, NULL, 2, 0, 'rain', NULL, 'post/video_1726473680_V6fWrFpEV1.mp4', '13', '20XHfFSZ6lvCXc1hijwBXBK5T9c72Ir725yROYSS.png', 1, '2024-09-16 12:01:24', '2024-09-18 11:12:47'),
(29, 196, NULL, NULL, 0, 'strong tv', NULL, 'post/video_1726473761_ba9qKOJxZP.mp4', '11', 'S7KP4TAdpozbFIqwPHaAgTQLetnKsUG00WwJmaWx.png', 1, '2024-09-16 12:02:45', '2024-09-16 12:02:45'),
(30, 196, NULL, NULL, 0, 'Cr7', NULL, 'post/video_1726473799_73Fx7bralD.mp4', '8', 'zQ509YgBhPOYGFHl5GB06vcUmpisNJu42I0PnJdc.png', 1, '2024-09-16 12:03:23', '2024-09-16 12:03:23'),
(31, 187, NULL, NULL, 0, 'funny video', NULL, 'post/video_1726473803_MCjN5MKoS3.mp4', '6', 'CM77G1BWa8uAfBsly5pjO4UJxDyiZLEGMRt9XvDz.png', 1, '2024-09-16 12:03:26', '2024-09-16 12:03:26'),
(32, 196, NULL, NULL, 0, 'cute', NULL, 'post/video_1726473860_7pGz0nwWa2.mp4', '16', '3LsjGxM5DqdrFJtazclXanEsuV6zKwGV8xol3fs5.png', 1, '2024-09-16 12:04:25', '2024-09-16 12:04:25'),
(33, 187, NULL, 2, 0, 'Bappa', NULL, 'post/video_1726473890_TiP5ldfH7o.mp4', '15', 'KjAgm5xAiPru7nQYHqeKpjiMJusUoObsHNZawmBu.png', 1, '2024-09-16 12:04:55', '2024-09-18 13:37:22'),
(34, 196, NULL, NULL, 0, 'Marvel', NULL, 'post/video_1726473913_ewOfxJSTgr.mp4', '17', 'yaHDBrMvuXcqKsiI4BuwjR6s1X1XKRtpPN4NQMz4.png', 1, '2024-09-16 12:05:17', '2024-09-16 12:05:17'),
(35, 187, NULL, NULL, 0, 'quote', NULL, 'post/video_1726473939_d0l9fdekVO.mp4', '15', '6kdqGrSn0OL6FObRQMOGRtWbLJsNJtc3DSOIuqTn.png', 1, '2024-09-16 12:05:43', '2024-09-16 12:05:43'),
(36, 196, NULL, NULL, 0, 'Ye kiski galti', NULL, 'post/video_1726473963_AE0WV43WFW.mp4', '18', '0Zoh4kWkrWubXtitu0S6CgoxyYRdMqc7vOBhRKs4.png', 1, '2024-09-16 12:06:07', '2024-09-16 12:06:07'),
(37, 196, NULL, 2, 0, 'important work', NULL, 'post/video_1726474016_MSusYgWXXG.mp4', '16', 'YUbY4ASuTCT5N6HZT4IruIRCEDvLkQWXda92XfDe.png', 1, '2024-09-16 12:07:00', '2024-09-18 09:09:24'),
(38, 187, NULL, NULL, 0, '🤟🤟', NULL, 'post/video_1726474039_fHhIt4mxh1.mp4', '15', 'GejsL7WkgXfjjMxVMeKPmWNBp9bzIoN6mohcIQAu.png', 1, '2024-09-16 12:07:23', '2024-09-16 12:07:23'),
(39, 196, NULL, NULL, 0, 'sector 36', NULL, 'post/video_1726474069_EFNV69rSUB.mp4', '19', 'Vfq6CQjkhn1CLHbMbPnlDCkxAYaQKuyUM7pf3ncX.png', 1, '2024-09-16 12:07:55', '2024-09-16 12:07:55'),
(40, 187, NULL, 1, 0, 'inspirational video', NULL, 'post/video_1726474186_dgy0n7c0YL.mp4', '49', '8scLnVVTA1aiXHpbAVO4Tc4bwxQou5bVNvxy9vkP.png', 1, '2024-09-16 12:09:52', '2024-09-20 14:24:06'),
(41, 187, NULL, NULL, 0, 'video', NULL, 'post/video_1726474480_lXhI2ua48f.mp4', '39', 'lGmlg1cFO4zWuEj6kbn0Q8Djm2JxLk7OvJpDwjda.png', 1, '2024-09-16 12:14:47', '2024-09-16 12:14:47'),
(42, 187, NULL, 2, 0, 'puja', NULL, 'post/video_1726474605_6E5lwmrkWE.mp4', '15', 'pp4HwpDTNTLAXqapyRftIeSJs2XTmhanHOh065ol.png', 1, '2024-09-16 12:16:49', '2024-09-19 20:32:26'),
(43, 187, NULL, NULL, 0, 'khudurkuni osa', NULL, 'post/video_1726474713_ZyWDLAtgcj.mp4', '15', 'JcJqzJKfbDfXs3EWMm6GLXkMn9R36QnDojc9C2Vd.png', 1, '2024-09-16 12:18:37', '2024-09-16 12:18:37'),
(44, 187, NULL, 1, 0, '✨✨', NULL, 'post/video_1726474805_DoMK3vaZJU.mp4', '15', 'b0StRjAuKsoGOBBEYeHOLSkMAXxvavRinWCLQGDM.png', 1, '2024-09-16 12:20:09', '2024-09-17 21:49:49'),
(45, 187, NULL, NULL, 0, 'funny video', NULL, 'post/video_1726475194_ow669bm4Ze.mp4', '12', 'OEqgCJ6zvcy7jtfwItbsW7eHPTBAB5bwg9DoHyo7.png', 1, '2024-09-16 12:26:38', '2024-09-16 12:26:38'),
(46, 187, NULL, NULL, 0, 'video', NULL, 'post/video_1726475407_E88dyJnjHT.mp4', '20', '9BvtYrEP7t0crD56CXn0QiRPQPC0S3BSnCo5FXLi.png', 1, '2024-09-16 12:30:12', '2024-09-16 12:30:12'),
(47, 188, NULL, NULL, 0, 'Popcorn 🍿', '#foodblogging', 'post/video_1726475828_JPC8JeyihM.mp4', '10', 'PVNDxLXKCk2SeBGPWLWunZaGRahTPwsndJ2ImVhl.png', 1, '2024-09-16 12:37:12', '2024-09-16 12:37:12'),
(48, 188, NULL, 6, 0, 'Easy Crafts', '#crafts', 'post/video_1726475902_C4Czug2hXF.mp4', '31', 'Yl5BLBic0xcCb1IkCGbPu0Y0tznQ3MLol8GqG0D0.png', 1, '2024-09-16 12:38:27', '2024-09-27 21:13:18'),
(49, 180, NULL, NULL, 0, '#1st show at Bangalore 😎😎', '#song #openmic #classical #tabla', 'post/video_1726475915_t1srgz52KP.mp4', '82', 'L5VPVf2MneyxKyia3o32LNgzEcxfO7JWDynp6SEj.png', 1, '2024-09-16 12:38:43', '2024-09-16 12:38:43'),
(50, 187, NULL, NULL, 0, 'funny video 2', NULL, 'post/video_1726475925_uUoZlPMm6F.mp4', '11', 'QrTPy8VYpuIoRtmVgxuJIwxBeADhqfVPi7aRD61W.png', 1, '2024-09-16 12:38:49', '2024-09-16 12:38:49'),
(51, 196, NULL, NULL, 0, 'speed', NULL, 'post/video_1726476369_Fd43PMVtxn.mp4', '6', 'iH354HJAVPn7dVCTwLNcbD6n4LIihwFUuvBrLkZe.png', 1, '2024-09-16 12:46:13', '2024-09-16 12:46:13'),
(52, 196, NULL, NULL, 0, 'yeah', NULL, 'post/video_1726476533_LNGR2aW5qa.mp4', '68', 'gf7YB8Frghv2VaLxcJdvSESNTIM3HsWBsnq0IaW1.png', 1, '2024-09-16 12:48:59', '2024-09-16 12:48:59'),
(53, 196, NULL, NULL, 0, 'om Ganesh', NULL, 'post/video_1726476627_OyGYsb60Qb.mp4', '43', 'TWogJ6a4iX5NXAeEv99pqSM83KbeZLEuzdpKEWFD.png', 1, '2024-09-16 12:50:34', '2024-09-16 12:50:34'),
(54, 196, NULL, 3, 0, 'ho gya reels', NULL, 'post/video_1726476741_jKsbqQbR7C.mp4', '13', 'nWT9t6q4zxHu0GWJP0xbG1WLj0Xmr0IH7bAC3l1k.png', 1, '2024-09-16 12:52:25', '2024-09-24 20:47:41'),
(55, 198, NULL, NULL, 0, '🥲🥲', NULL, 'post/video_1726477317_d3geFhxXC1.mp4', '7', '9HCMU3W8hMEiL271sUoWsKQ4Qwa1qvUcoGgic8dK.png', 1, '2024-09-16 13:02:01', '2024-09-16 13:02:01'),
(56, 198, NULL, NULL, 0, 'abhi to sept agya 🥺🥺', NULL, 'post/video_1726477367_gc1qRXdE2Y.mp4', '15', 'jRJRBbBZpF94zRF0z6BtyzkToF8flWyx8Ty5Stlf.png', 1, '2024-09-16 13:02:52', '2024-09-16 13:02:52'),
(57, 198, NULL, NULL, 0, 'milenge hum nhi', NULL, 'post/video_1726477442_0s2WWWbdnj.mp4', '27', 'rWx3lGvq30UHCaVBXGUY5xJ1ak7CslkhiTFebDJR.png', 1, '2024-09-16 13:04:07', '2024-09-16 13:04:07'),
(58, 198, NULL, NULL, 0, 'option', NULL, 'post/video_1726477679_4RZxvnl63r.mp4', '38', '8V01KUmD4kD4cjAubWboOL3WzYVK8ZhIHPeCin5y.png', 1, '2024-09-16 13:08:05', '2024-09-16 13:08:05'),
(59, 196, NULL, NULL, 0, 'saap', NULL, 'post/video_1726477733_nI9zfR0g6x.mp4', '7', 'GIFjswyZJXBOw8K5QAxMI4015C4xaWAVzG9bjkW6.png', 1, '2024-09-16 13:08:56', '2024-09-16 13:08:56'),
(60, 198, NULL, NULL, 0, 'ofc time', NULL, 'post/video_1726477734_ypgj2SRDvj.mp4', '12', 'FvrB27csGyB1G1R0rBs2RYkbAXIkZPCWGyFqvnwk.png', 1, '2024-09-16 13:08:58', '2024-09-16 13:08:58'),
(61, 196, NULL, NULL, 0, 'speed test', NULL, 'post/video_1726477783_KGZUdvapB4.mp4', '7', 'BKff7gdPSz22ROv8nmVPk9nzB3s10HluhB8e5nvZ.png', 1, '2024-09-16 13:09:47', '2024-09-16 13:09:47'),
(62, 188, NULL, NULL, 0, 'scenery', '#scenic', 'post/video_1726477794_z4RxvAqxYk.mp4', '8', '5UpSS4UKkSmVqhVLJhT9expFAREeTZwfCWGLZwmR.png', 1, '2024-09-16 13:09:58', '2024-09-16 13:09:58'),
(63, 196, NULL, NULL, 0, 'Desi Spiderman', NULL, 'post/video_1726477834_O4jpTYU1IQ.mp4', '15', 'uy996zSnCjIFDWYR8Myci4qmpU9nY3zXchOzYf1F.png', 1, '2024-09-16 13:10:38', '2024-09-16 13:10:38'),
(64, 188, NULL, NULL, 0, 'love', '#love', 'post/video_1726477875_5zUbXB3tA5.mp4', '15', 'h3GZCPFkgnP4qxmmXNKpI3wlTiG2Poqijsh7FgsR.png', 1, '2024-09-16 13:11:19', '2024-09-16 13:11:19'),
(65, 196, NULL, NULL, 0, 'reels', NULL, 'post/video_1726477885_KWdebNjnfv.mp4', '14', 'v1Idy4XOvs7WiJkTMruH81eBNRQE2qKwrkNCY5bQ.png', 1, '2024-09-16 13:11:30', '2024-09-16 13:11:30'),
(66, 198, NULL, 1, 0, 'childhood memories', NULL, 'post/video_1726477909_MLNN5oEKJ1.mp4', '59', 'yrb4HqhD5vNnSl0w4jq2Kb0IgeqRsl2NJlNJaYhR.png', 1, '2024-09-16 13:11:56', '2024-09-25 23:25:29'),
(67, 196, NULL, 1, 0, 'calculator', NULL, 'post/video_1726477935_3tayXocZ8F.mp4', '15', 'xwmWrEBO2j5dyGK8paI8GbFAheGJCXLTzX5VqTZL.png', 1, '2024-09-16 13:12:19', '2024-09-18 09:13:10'),
(68, 188, NULL, NULL, 0, 'Cheese Cake', '#foodblogging', 'post/video_1726477958_RbkwX2strO.mp4', '44', 'wPYUjrv6AzSjnDV5XzxatCaAao8dOAytTSw24DQ8.png', 1, '2024-09-16 13:12:44', '2024-09-16 13:12:44'),
(69, 196, NULL, NULL, 0, 'Cricket', NULL, 'post/video_1726477987_MH3uQwOGrN.mp4', '15', 'lg6f5FknIw6uBjUH5fyW7iWaDz275g3x0JYG97l6.png', 1, '2024-09-16 13:13:12', '2024-09-16 13:13:12'),
(71, 180, NULL, NULL, 0, 'Open Mic🔥🔥', '#openmic', 'post/video_1726478069_pzP01nefAc.mp4', '154', 'OHJxh2tyWwId0xFmsYJDHPsjS8285TOljBefmEmx.png', 1, '2024-09-16 13:14:39', '2024-09-16 13:14:39'),
(72, 196, NULL, NULL, 0, 'no brakes', NULL, 'post/video_1726478077_RiIXdaSlQR.mp4', '34', 'encsftUMNxKzodzwrmFb7w3TJ4D6oA4bX8Lxbv7i.png', 1, '2024-09-16 13:14:42', '2024-09-16 13:14:42'),
(73, 196, NULL, NULL, 0, 'wheelies', NULL, 'post/video_1726478134_V2Up2nzlyy.mp4', '12', 'kKssxDE2dYDcONIy6JJZdSj31LPRJCvdJZbNzKb2.png', 1, '2024-09-16 13:15:38', '2024-09-16 13:15:38'),
(74, 198, NULL, 2, 0, 'tere ishq', NULL, 'post/video_1726478135_KTtuD7P2mI.mp4', '15', 'vnpoy1nLq6JwnFxxxIZhMBLigqpnUR5D71hSUXpy.png', 1, '2024-09-16 13:15:38', '2024-09-29 15:56:55'),
(75, 198, NULL, 1, 0, 'sajde', NULL, 'post/video_1726478213_ujYYHjxrFP.mp4', '15', '038zwysgqH69XdvzfeB2csq5Zf6wNtjXYezTHCYr.png', 1, '2024-09-16 13:16:56', '2024-09-25 20:16:53'),
(76, 196, NULL, NULL, 0, 'mario', NULL, 'post/video_1726478945_dETje41kBz.mp4', '10', 'IIuquSTgxbNFLVBuZvcLXq30XC4gA9pTz9wgMx55.png', 1, '2024-09-16 13:29:09', '2024-09-16 13:29:09'),
(78, 196, NULL, NULL, 0, 'Shadi dance', NULL, 'post/video_1726479152_XDeOCBkZrz.mp4', '24', 'YmR9d8h81ck46hM3QROx40n2mrDzyM6ctgVW1Iue.png', 1, '2024-09-16 13:32:37', '2024-09-16 13:32:37'),
(79, 196, NULL, NULL, 0, 'le beta...', NULL, 'post/video_1726479237_DJtN6d5dEw.mp4', '7', 'wmMKfaWmjOAX7x8oGdq5Kx320blj85yeNyo1gGiJ.png', 1, '2024-09-16 13:34:01', '2024-09-16 13:34:01'),
(80, 196, NULL, NULL, 0, 'English fight', NULL, 'post/video_1726479326_1Uf1MOEiO9.mp4', '14', 'ZUZOYxCsY7e40lGmkC27nB3eMeK7r9WUuwFk22ey.png', 1, '2024-09-16 13:35:30', '2024-09-16 13:35:30'),
(81, 196, NULL, NULL, 0, '😂😂😂', NULL, 'post/video_1726479591_nQq4ENcTGb.mp4', '8', 'sSMa6TdhTDJjGwg5NjmPsc8dVON7ZlPT7MCbew7D.png', 1, '2024-09-16 13:39:54', '2024-09-16 13:39:54'),
(82, 196, NULL, NULL, 0, '😆😆', NULL, 'post/video_1726479640_XQjp0iVe5z.mp4', '9', '5Q4U5JlfgrvrdNtc79CAnaDRl31cnloWti6VVdil.png', 1, '2024-09-16 13:40:44', '2024-09-16 13:40:44'),
(83, 196, NULL, NULL, 0, '😁😁', NULL, 'post/video_1726479778_zbzpDXndHD.mp4', '12', 'Oq9cN61kcskOKEgQa3jzVvgGvSfeydSR7p9ht1yH.png', 1, '2024-09-16 13:43:02', '2024-09-16 13:43:02'),
(85, 196, NULL, NULL, 0, 'Desi Bieber', NULL, 'post/video_1726490497_qJz61E80jI.mp4', '18', 'F7xC9nxXx0pSUwsBDC30gWLvtdIHNKygbN9IqpL2.png', 1, '2024-09-16 16:41:41', '2024-09-16 16:41:41'),
(86, 188, NULL, NULL, 0, 'career guide', NULL, 'post/video_1726490605_ybTRtSvkJ3.mp4', '16', 'qkJPcK2cJzkop9lBWl3aJbRLPHPAOnXA9aDqbxlO.png', 1, '2024-09-16 16:43:29', '2024-09-16 16:43:29'),
(87, 188, NULL, NULL, 0, 'Top Countries', NULL, 'post/video_1726490706_p8kQHEgks7.mp4', '16', 'Sc2emPiYHGc5VoVmujeUBDn3Z8bXiYFXGjpsMWdz.png', 1, '2024-09-16 16:45:10', '2024-09-16 16:45:10'),
(88, 188, NULL, NULL, 0, 'Stock info', NULL, 'post/video_1726490791_C99sLDIhyW.mp4', '27', '8p7e2WjKVISAhhwgzgXb6D6nEnoTQDLYe43Ikm9w.png', 1, '2024-09-16 16:46:35', '2024-09-16 16:46:35'),
(89, 196, NULL, 1, 0, 'fishing', NULL, 'post/video_1726491360_ygYwHYfeaF.mp4', '21', '0Be7Z2oQQJd1p6q85Ym7C02JNHxGSQaolCbeQELI.png', 1, '2024-09-16 16:56:05', '2024-09-20 14:38:05'),
(90, 196, NULL, NULL, 0, 'nothing', NULL, 'post/video_1726491422_TZcC8SxO7w.mp4', '23', 'GQldayyYLTt3kF9VgqR1DZR8ruSmg8PzleD86vws.png', 1, '2024-09-16 16:57:15', '2024-09-16 16:57:15'),
(91, 196, NULL, NULL, 0, 'swimming', NULL, 'post/video_1726491493_5gSZjgi8VU.mp4', '10', 'lqsmwCrZgrad8HKXwxN7oIueg49WYzxxkc2chnwG.png', 1, '2024-09-16 16:58:17', '2024-09-16 16:58:17'),
(92, 196, NULL, NULL, 0, 'cycle', NULL, 'post/video_1726491537_WgxKB0lqbr.mp4', '6', 'JZl53VWXfgnIUGuLNBbYnB7mV9CsfuaZ2qHBDBTj.png', 1, '2024-09-16 16:59:01', '2024-09-16 16:59:01'),
(93, 196, NULL, 2, 0, 'off-road', NULL, 'post/video_1726491593_jSUvclI1xP.mp4', '17', 'JWKbow9cwJ63Dw4VsC9lKXGEUYHl0hi9Z7BKOHFm.png', 1, '2024-09-16 16:59:59', '2024-09-20 12:49:48'),
(94, 196, NULL, NULL, 0, 'ninja', NULL, 'post/video_1726491636_XYcJlbqJa0.mp4', '6', '1bEwtSeZs223owq1YmOUWfr06051GzxRoahKqXW8.png', 1, '2024-09-16 17:00:40', '2024-09-16 17:00:40'),
(95, 187, NULL, NULL, 0, 'devotion', NULL, 'post/video_1726500556_OTwN2b4da3.mp4', '15', 'b5EUH2nypT2Ax8cniojwPWC0MtP2M1tDDMpXckm6.png', 1, '2024-09-16 19:29:21', '2024-09-16 19:29:21'),
(96, 187, NULL, NULL, 0, '😆😆', NULL, 'post/video_1726500993_0qMXcPIJrs.mp4', '15', 'ediiJl00RHnKUTy1IOHPiRcIn9SCOYDxLIL9PFzU.png', 1, '2024-09-16 19:36:39', '2024-09-16 19:36:39'),
(97, 187, NULL, NULL, 0, '🙂🙂', NULL, 'post/video_1726501166_PCHq9gVjE8.mp4', '8', 'Yar0Vc4YyFWk8MjrkWZ97Ki0khpJaXhQthwLQSki.png', 1, '2024-09-16 19:39:30', '2024-09-16 19:39:30'),
(98, 187, NULL, NULL, 0, 'quotes', NULL, 'post/video_1726501368_XEPkrvhlIJ.mp4', '18', 'Kj7Z7bENhw2czKzwLsawd6bBCjRNwpH0oIS399az.png', 1, '2024-09-16 19:42:53', '2024-09-16 19:42:53'),
(99, 187, NULL, NULL, 1, '✌✌', NULL, 'post/video_1726504510_2wy2OFgOAv.mp4', '18', 'qFIPIWcYf9pwbQaPHFt6GDQ7givrGp1YqltP8Tu5.png', 1, '2024-09-16 20:35:14', '2024-09-20 15:40:12'),
(100, 187, NULL, NULL, 0, '😂😂', NULL, 'post/video_1726540483_qoo7l8vcFW.mp4', '15', '4v6IJho1J6i20XePwszkzHCdgNhwsnHNsODjIj6U.png', 1, '2024-09-17 06:34:48', '2024-09-17 06:34:48'),
(101, 187, NULL, NULL, 0, '✨✨', NULL, 'post/video_1726571838_Oq1HzW478h.mp4', '6', 'DFrygfrBJyj6DE3tmlrXb5yc1YDsXnZYDMTxIODm.png', 1, '2024-09-17 15:17:22', '2024-09-17 15:17:22'),
(102, 187, NULL, NULL, 0, '🌼🌼', NULL, 'post/video_1726573112_doyz68k0y2.mp4', '34', 'nR3btfgZeVHlGqj6ulwBuasS894nM0vZE2f5nf90.png', 1, '2024-09-17 15:38:37', '2024-09-17 15:38:37'),
(103, 187, NULL, NULL, 0, '💐💐', NULL, 'post/video_1726596631_Bi5gf5PTzN.mp4', '15', 'UqZFRITb3pEX5Ia5mJslcaTfHqLYf5YUGckFR35U.png', 1, '2024-09-17 22:10:35', '2024-09-17 22:10:35'),
(104, 187, NULL, NULL, 1, '😂😂', NULL, 'post/video_1726596797_E0NeKiixoC.mp4', '6', 'qbN2ofjSF6Sd1wX0wX4gd1Xa2hUvy9QI2oINWHPU.png', 1, '2024-09-17 22:13:21', '2024-09-18 13:08:00'),
(105, 187, NULL, NULL, 0, '⭐⭐', NULL, 'post/video_1726596978_xPE6yQrf9n.mp4', '15', '1iY6Zv3qhReQOyKpXF3OTMB6djH9kPXhBVoIZezG.png', 1, '2024-09-17 22:16:23', '2024-09-17 22:16:23'),
(106, 187, NULL, NULL, 0, '🌼🌼', NULL, 'post/video_1726597077_50FViCH80d.mp4', '8', 'DPHhVaEchq8jZttqLeuhOMvwOt2zA7txTKQUo92I.png', 1, '2024-09-17 22:18:01', '2024-09-17 22:18:01'),
(107, 187, NULL, NULL, 0, '❣️❣️❣️', NULL, 'post/video_1726597199_DtrdYiyfDW.mp4', '12', 'rAVpVm5rcacfYIzytX5bkDGouKmIfZIxHeqrANWF.png', 1, '2024-09-17 22:20:03', '2024-09-17 22:20:03'),
(108, 187, NULL, NULL, 0, '🌸🌸', NULL, 'post/video_1726597498_bWzzsOdkqM.mp4', '48', '3toREqGdU1K4YGzeOrmakjSPESHRPGsvDlyWocQI.png', 1, '2024-09-17 22:25:05', '2024-09-17 22:25:05'),
(109, 187, NULL, NULL, 0, '🌻🌻', NULL, 'post/video_1726597640_JU9r5PZo6j.mp4', '14', 'C1QDursqfTvZIxyYXwP3ykzSrFx3IRnhGk1qc2QS.png', 1, '2024-09-17 22:27:25', '2024-09-17 22:27:25'),
(110, 187, NULL, NULL, 0, '🌺🌺', NULL, 'post/video_1726597817_77IzqWdUlx.mp4', '7', 'V4lo5N8MScY6yUlq3J5ELiJpazFGEwRn5LtIgp5H.png', 1, '2024-09-17 22:30:21', '2024-09-17 22:30:21'),
(111, 187, NULL, NULL, 0, '☘️☘️', NULL, 'post/video_1726598269_narRCNoJHv.mp4', '9', 'oh8rElH3o9gMsTFineAb0I4c6w7RqKFfoXTROkPk.png', 1, '2024-09-17 22:37:54', '2024-09-17 22:37:54'),
(112, 187, NULL, NULL, 0, '🐰🐰', NULL, 'post/video_1726598516_BURCtKO4Wz.mp4', '11', 'RGDPm8b9WwPintRLBJ2Gfc5lPki7Y0zl8EFARHIk.png', 1, '2024-09-17 22:42:00', '2024-09-17 22:42:00'),
(113, 187, NULL, NULL, 0, ', ✨✨', NULL, 'post/video_1726600669_UFQdguLqxv.mp4', '7', 'gF19zt6sssB6LXPXLhNExpahQaVBDbwuETktWho1.png', 1, '2024-09-17 23:17:52', '2024-09-17 23:17:52'),
(114, 187, NULL, NULL, 0, '🙂🙂', NULL, 'post/video_1726600759_zOG1Ku9axd.mp4', '23', '3kuYW80JG7UiaBMWLeXPeUrgZfxY6wZw56WRDVoU.png', 1, '2024-09-17 23:19:22', '2024-09-17 23:19:22'),
(115, 187, NULL, NULL, 0, '✨✨', NULL, 'post/video_1726600841_z33IxMzVko.mp4', '7', 'bBaqpOzvxf3So2nZnl71RWSAUsBhvTKZNu65v2cI.png', 1, '2024-09-17 23:20:45', '2024-09-17 23:20:45'),
(116, 187, NULL, NULL, 0, '⭐⭐', NULL, 'post/video_1726600921_wyBxWhjMHS.mp4', '10', '0BBs6ZHeQSfyG4ZuQdyJot5vdN6jQPmpXjy7AjLV.png', 1, '2024-09-17 23:22:05', '2024-09-17 23:22:05'),
(118, 187, NULL, NULL, 0, 'unemployed matlab bhagwaan ke bache 😟', NULL, 'post/video_1726601509_pFaBJ3wQJ7.mp4', '11', 'NzR0zMBQaAr6tZkdSuQfekTimjB3RzJnJdll7kJT.png', 1, '2024-09-17 23:31:53', '2024-09-17 23:31:53'),
(119, 196, NULL, NULL, 0, 'evening', NULL, 'post/video_1726662087_E2Auwdxol1.mp4', '15', 'GUzbDTI8EOESH6Y6tofE5Kgr1cf2Q02obwSDYJVp.png', 1, '2024-09-18 16:21:31', '2024-09-18 16:21:31'),
(120, 189, NULL, NULL, 0, '#Mujhe #dil ki bimari hai##', NULL, 'post/video_1726773845_HZfKzyZGqE.mp4', '30', 'tEWWnVB4rU0djL6VeiLIH2HbxtRB082Idof9stdf.png', 1, '2024-09-19 23:24:09', '2024-09-19 23:24:09'),
(121, 189, NULL, NULL, 0, 'TESTING', NULL, 'post/video_1726810454_NnGeoyMOjJ.mp4', '14', 'GTrX16vbIIP6GMck2b6sDyMzgFampWl0sycIYZiR.png', 1, '2024-09-20 09:34:17', '2024-09-20 09:34:17'),
(122, 196, NULL, NULL, 0, 'crazy dance', '#craftsmanship', 'post/video_1726834624_BJVaKU6Elu.mp4', '25', 'qWKluXwCqWIeyEy1fyMQowoBX1SjvIIyFvWaPGn4.png', 1, '2024-09-20 16:17:10', '2024-09-20 16:17:10'),
(123, 196, NULL, NULL, 0, 'Filmy Entry', NULL, 'post/video_1726835185_hP9guamqkV.mp4', '8', 'WrABdOwQz0RcRamp7zTKifgfx7VExCQS22g23mey.png', 1, '2024-09-20 16:26:29', '2024-09-20 16:26:29'),
(124, 196, NULL, NULL, 0, 'Brake fail', NULL, 'post/video_1726835292_BRw3pBZOEi.mp4', '10', 'yEkoSuJbQclgdr8zMgT7MhCrLu28cPKQv1RHqm9x.png', 1, '2024-09-20 16:28:16', '2024-09-20 16:28:16'),
(125, 196, NULL, NULL, 0, 'Black Ship', NULL, 'post/video_1726835364_reRmnLm2ME.mp4', '14', 'Jhwi9PUzAHM3XHFsUcyQBaiDkjy11DgYoz3wNA15.png', 1, '2024-09-20 16:29:29', '2024-09-20 16:29:29'),
(126, 196, NULL, NULL, 0, 'Swing', NULL, 'post/video_1726836107_ttjn00mW41.mp4', '19', '4Mem4MXWkQeJsycyi5KUZUQEldGh7apgpkZgk4Gu.png', 1, '2024-09-20 16:41:52', '2024-09-20 16:41:52'),
(127, 196, NULL, NULL, 0, 'Flex', NULL, 'post/video_1726836236_19OUZOM37L.mp4', '15', '1wmEYSSLIHw6R6VraJd3ANvl0RQCTx1Crr68asfa.png', 1, '2024-09-20 16:44:00', '2024-09-20 16:44:00'),
(128, 196, NULL, NULL, 1, 'wheelies', NULL, 'post/video_1726836313_PvxXHCfwSZ.mp4', '16', 'scv5DoxEcHfG4BP2XYS1JQQuYDCPIyFiiimJ96Y0.png', 1, '2024-09-20 16:45:18', '2024-09-25 20:32:55'),
(129, 196, NULL, NULL, 0, 'Rainy weather', NULL, 'post/video_1726836555_tqMexkTpAh.mp4', '16', 'EjhgHZWEhEGrxiHjvGCtHqdqdifRv6X3GWsl2j8X.png', 1, '2024-09-20 16:49:19', '2024-09-20 16:49:19'),
(130, 196, NULL, NULL, 0, 'RR', NULL, 'post/video_1726836751_05mRuykunj.mp4', '15', '4jCQSdjg5GrJyuEpCmSE1Qv7Hrd4sMjy3MCCv5nw.png', 1, '2024-09-20 16:52:36', '2024-09-20 16:52:36'),
(131, 185, NULL, NULL, 0, 'chin tapak dam dam 😜😜', '#khudurukuni', 'post/video_1726850446_4DT4rM3I1E.mp4', '8', 'XpVS2tm2W7EhehHIlPISUtjHIiirRC6T7nDlRooa.png', 1, '2024-09-20 20:40:50', '2024-09-20 20:40:50'),
(132, 185, NULL, NULL, 0, 'Shree Radharani 🥹🙏🏻', '#shreeradharani #radha #shreeradha #radhika #krishnapriya #mohanmohini', 'post/video_1726850861_R5eq5H1m0s.mp4', '15', 'j8yYpRKJxWJ5dZwUkWR3gNFec4r0NM8R1TpUi8kh.png', 1, '2024-09-20 20:47:45', '2024-09-20 20:47:45'),
(133, 185, NULL, NULL, 0, 'Truly deeply Madly', '#true #truelove #love #loveforever', 'post/video_1726852171_28a5iOejsT.mp4', '30', 'sbcAVeTLd08AZjToxa6aEihwmuM9huYMv8rfpzDT.png', 1, '2024-09-20 21:09:35', '2024-09-20 21:09:35'),
(134, 185, NULL, NULL, 0, 'it\'s not just earrings it\'s emotions 🥹🫰🏻🤌🏻❤️', '#girls #girlsasthestic', 'post/video_1726852389_rcLVkjFrBa.mp4', '8', 'TwjHAtxCTKZdhwzEIO09AMNLo7p2Ds0teLyP9Wgb.png', 1, '2024-09-20 21:13:13', '2024-09-20 21:13:13'),
(135, 196, NULL, NULL, 0, 'Speed', NULL, 'post/video_1726887469_tTiZKrTghq.mp4', '15', 'I30it4e4lLetA67u33ktm3S8i3X9Wpff7UluGgDb.png', 1, '2024-09-21 06:57:53', '2024-09-21 06:57:53'),
(136, 185, NULL, NULL, 0, '❤️🧿♾️', '#love', 'post/video_1726915374_iYaH8XIENN.mp4', '14', 'D0eBdS79Y9uPy5TgOIhZ9bIzMVtlHuGLy8oXwrwT.png', 1, '2024-09-21 14:42:59', '2024-09-21 14:42:59'),
(137, 185, NULL, NULL, 0, '❤️@anuk♾️🧿', '#love #loveforever lovelife forever foreverbond', 'post/video_1726917407_9mgoPgOZoJ.mp4', '15', 'E9UYWfsnX2vdPTfuhxypKk27AUMPPEYGPWxV9SQx.png', 1, '2024-09-21 15:16:51', '2024-09-21 15:16:51'),
(138, 187, NULL, NULL, 0, 'nature 🌸✨', NULL, 'post/video_1726939110_LXPFuCDMWV.mp4', '12', 'MmXPxMU35Wfu1KulsjdQA8cHFMNgHeOZQVp6lwuH.png', 1, '2024-09-21 21:18:34', '2024-09-21 21:18:34'),
(140, 200, NULL, NULL, 0, 'kabaddi ✨', NULL, 'post/video_1727027661_0yIrhf5o3y.mp4', '5', 'G2tTY5jt86bD3aeG0l3iyzyYWIhNuy8eLZDckbuo.png', 1, '2024-09-22 21:54:25', '2024-09-22 21:54:25'),
(141, 189, NULL, NULL, 0, '😂😂🤣🤣😂😂', NULL, 'post/video_1727121875_iYhr5U6cG6.mp4', '24', 'Vpb4SDenVStyDjQxGU8vpONBE4gBGX8jOvcFlSud.png', 1, '2024-09-24 00:04:40', '2024-09-24 00:04:40'),
(142, 189, NULL, NULL, 0, '💔💔💔💔💔💔💔', NULL, 'post/video_1727153695_IJuLkZ0naw.mp4', '46', 'EjNq5w6ThUTbR0h2hIzn37LPXo5fTS5wRpHBOZBj.png', 1, '2024-09-24 08:55:01', '2024-09-24 08:55:01'),
(143, 187, NULL, NULL, 0, '✨✨', NULL, 'post/video_1727196178_AiMG37qEjn.mp4', '15', 'XPcCLBUHPJwfvBj5l6KStMaan0K33uueuJSz6iKK.png', 1, '2024-09-24 20:43:02', '2024-09-24 20:43:02'),
(144, 189, NULL, NULL, 0, 'Swag', NULL, 'post/video_1727239471_IPbHz1lEiZ.mp4', '14', 'uL0sqHNGjR4e7eq7lOgvhVIKuV0kEATdxNfERNMb.png', 1, '2024-09-25 08:44:35', '2024-09-25 08:44:35'),
(145, 198, NULL, NULL, 0, 'story of freedom 🤣🤣', '#freedom #comedyindia #tiktokcomedy', 'post/video_1727240288_JcC138pXBH.mp4', '45', '6w5HWyB83uY1o6m0PBodZTYl349hqYvsxLM2F8O3.png', 1, '2024-09-25 08:58:14', '2024-09-25 08:58:14'),
(146, 207, NULL, NULL, 0, 'Nari Shakti', NULL, 'post/video_1727266234_p9OTmOcavk.mp4', '8', '08p9mIPQzlBZdUZBAVsTjiioJzvoMnvTkdv8InfT.png', 1, '2024-09-25 16:10:38', '2024-09-25 16:10:38'),
(147, 207, NULL, NULL, 0, 'BGMI', NULL, 'post/video_1727266476_MK71Evpj0J.mp4', '15', 'A4gIq2iRR2JNAyrRnM76OHxeVSnhP3gEu3Y2qshv.png', 1, '2024-09-25 16:14:40', '2024-09-25 16:14:40'),
(148, 207, NULL, NULL, 0, 'Nari Shakti', NULL, 'post/video_1727266817_HnQXgAio9t.mp4', '42', 'id95SxmZMbLub8cq5ws1LN9gLTdyb3V1Ivzifk39.png', 1, '2024-09-25 16:20:22', '2024-09-25 16:20:22'),
(149, 207, NULL, NULL, 1, 'BGMI comedy 🤣', NULL, 'post/video_1727267605_aYh6ipSGdv.mp4', '60', 'jG8Yb8kRGm9gtu30t8LabyGz0h25nF6aixtsTvso.png', 1, '2024-09-25 16:33:33', '2024-09-25 16:34:12'),
(150, 207, NULL, NULL, 0, 'Mata Rani a rahi hai', NULL, 'post/video_1727272042_UKVRYX6TrF.mp4', '20', '2jTQWbe2TTYjovvjRJ3GyksSnVgY0vORxstM1uXn.png', 1, '2024-09-25 17:47:27', '2024-09-25 17:47:27'),
(151, 207, NULL, NULL, 0, '😃😃😃😃', NULL, 'post/video_1727272491_fJ6DRZ3QEP.mp4', '19', 'QTskCosOC3jNlZm06A2DvToHCajCNQSYHBnJ6NRp.png', 1, '2024-09-25 17:54:55', '2024-09-25 17:54:55'),
(152, 207, NULL, NULL, 0, '😍😍😍😍', NULL, 'post/video_1727272602_QuwOOEe1l2.mp4', '32', 'i6X8UhNSEO47iiWR1O05AMz8odrbF1rdIHPP1e3e.png', 1, '2024-09-25 17:56:48', '2024-09-25 17:56:48'),
(153, 207, NULL, NULL, 0, '🤔🤔🤔', NULL, 'post/video_1727272871_NXxxxMAbOU.mp4', '19', '7cYaKwQh1xaXVoMMQ2CiKJXupwsGJkG49W15Zmge.png', 1, '2024-09-25 18:01:15', '2024-09-25 18:01:15'),
(154, 207, NULL, NULL, 0, '🥹🥹🥹', NULL, 'post/video_1727279344_oAxqNBTj1l.mp4', '18', '9rsefTE7xgBj0V9mdDSSVIE8fo1vXIAAQuKO5uS5.png', 1, '2024-09-25 19:49:08', '2024-09-25 19:49:08'),
(155, 189, NULL, NULL, 0, 'OMM NAMAH SHIVAY 🙏🙏', NULL, 'post/video_1727280964_hK31JWl0zK.mp4', '35', 'xseXJVtzKIkshBh8b622bOQkvkZe6zIjklPSH8Yy.png', 1, '2024-09-25 20:16:09', '2024-09-25 20:16:09'),
(156, 189, NULL, NULL, 0, '👉👉Milenge hum nhi 💪💪🍷🍷🍾🍾', NULL, 'post/video_1727281108_dKr2J0xVqB.mp4', '15', '7euKCwVjF57x2emIbX8E98bPQSlXR4pvYUzOWBqJ.png', 1, '2024-09-25 20:18:32', '2024-09-25 20:18:32'),
(157, 189, NULL, NULL, 0, '##Swag', NULL, 'post/video_1727281188_t0WlLtirZV.mp4', '15', 'CSBhgd8QYuWmbXeigey1asFZJZtlwFx9vBZmY6vO.png', 1, '2024-09-25 20:19:51', '2024-09-25 20:19:51'),
(158, 212, NULL, NULL, 0, 'When children with phone', '#kidscrafts #funnymemes #funny', 'post/video_1727416590_oSMKneD2IL.mp4', '34', 'pYizHdmbRc6Fd6vHsrq8Fhgr1bTgE26vhe1HyYju.png', 1, '2024-09-27 09:56:35', '2024-09-27 09:56:35'),
(159, 188, NULL, NULL, 0, 'true facts about friendship', NULL, 'post/video_1727454081_9PZ4g3hL2j.mp4', '67', 'duQQ9nMJ7RG1QOA0mbBBP8t3t3nl7730LAnPI7FK.png', 1, '2024-09-27 20:21:27', '2024-09-27 20:21:27'),
(160, 196, NULL, NULL, 0, 'R1M wheelies', NULL, 'post/video_1727456279_IYDypbgFH2.mp4', '22', 'GZRAAqjYdsuB8fJMQ9jyz80w9uwQJbaVkOz50hcd.png', 1, '2024-09-27 20:58:04', '2024-09-27 20:58:04'),
(161, 189, NULL, NULL, 0, '#BHUMIHAR', NULL, 'post/video_1727613988_LtTPdwxiJ3.mp4', '13', 'BSfb0oVOctuHThiprnQ2mW0DAiF5gK8rZbVLbLEK.png', 1, '2024-09-29 16:46:32', '2024-09-29 16:46:32'),
(162, 180, NULL, NULL, 0, 'Lehera do.....', '#music #independence #jamming', 'post/video_1727632314_zwG6aPZIm0.mp4', '57', '2noX3TNcovb4s07RK4Z31rwjHBRUAA3LAoHp53s2.png', 1, '2024-09-29 21:52:00', '2024-09-29 21:52:00'),
(163, 207, NULL, NULL, 0, '😂😂😂', NULL, 'post/video_1727694532_JdPTTD869y.mp4', '15', 'YCVLAkSd1ulWuICYivc1D7cbSQFP6dB0dOb1fzjk.png', 1, '2024-09-30 15:08:56', '2024-09-30 15:08:56'),
(164, 185, NULL, NULL, 0, 'Ishqbaaz 🫰🏻❤️ 🥹Anika ♾️ Shivaay 🥹', NULL, 'post/video_1727716740_UbVTWLS75p.mp4', '15', 'rgoSy9COMscTJe5T8u8hfVCuUnDx9iS9BDqBSde5.png', 1, '2024-09-30 21:19:04', '2024-09-30 21:19:04'),
(165, 185, NULL, NULL, 0, 'Maa is coming 🥹❤️🙏🏻', NULL, 'post/video_1727768520_25wW1NH1wb.mp4', '21', 'cvCkQCfDA5P0ZsH6ns3pFYayZZltaPyL2jLR2S6Q.png', 1, '2024-10-01 11:42:05', '2024-10-01 11:42:05'),
(166, 198, NULL, NULL, 0, 'happy bday bhai 🎂🎂', '#indianfunnyvideos', 'post/video_1727845482_ALrkl1g3KA.mp4', '6', '4LJphCUsCjxk30ipgfOzjMueuKLQaSlGs6mSfjLZ.png', 1, '2024-10-02 09:04:45', '2024-10-02 09:04:45'),
(167, 185, NULL, NULL, 0, 'Subho Mahalaya 🙏🏻♥️🙏🏻', 'Dusshera', 'post/video_1727851546_UiOtvHR9Pr.mp4', '33', 'prchVfN5AqHg8V624xyBr33VyrguKuh5SgsoZYtu.png', 1, '2024-10-02 10:45:52', '2024-10-02 10:45:52'),
(168, 187, NULL, NULL, 0, '✨✨', NULL, 'post/video_1728055779_gpHNbzljyZ.mp4', '13', 'd15pWZFbx7VUn3R4WMddOOgW3pZLVAwStBXRv8Qw.png', 1, '2024-10-04 19:29:43', '2024-10-04 19:29:43'),
(170, 188, NULL, NULL, 0, 'vvhkhcbn', NULL, 'post/video_1728301011_OfXzjlXhzX.mp4', '32', 'npEAJj8IAvD1npk6GArGMloveznQ2JAmlOOZfyfF.png', 1, '2024-10-07 15:36:57', '2024-10-07 15:36:57'),
(171, 189, NULL, NULL, 0, '#Patna 👑👑', NULL, 'post/video_1728581037_Fa0bmlMlyU.mp4', '15', 'mqCiEx8Ge4EyUBTD583skf4Dz6nCBNC7xJIFyqDC.png', 1, '2024-10-10 21:24:01', '2024-10-10 21:24:01'),
(172, 218, NULL, NULL, 0, 'sad', NULL, 'post/video_1728702830_94nbU7qroW.mp4', '15', 'QCTRnORL12OCCZWWPLCPPcCPdDekCp197ttatSXo.png', 1, '2024-10-12 07:13:52', '2024-10-12 07:13:52'),
(173, 185, NULL, NULL, 0, 'Cuttack Dusshera vibes 💕', NULL, 'post/video_1728936464_JOhWOqZRPl.mp4', '11', '5zY7gW5u0H6FjveH2ss5MRhHdaYMgKth0Xp7Z76m.png', 1, '2024-10-15 00:07:48', '2024-10-15 00:07:48'),
(178, 187, NULL, NULL, 0, 'Mr least', NULL, '0', '58', 'lDVT5fK5pFPC2NL569hAn4F20KqbBwkRfzdnKNyQ.png', 1, '2024-10-28 22:09:12', '2024-10-28 22:09:12');

-- --------------------------------------------------------

--
-- Table structure for table `posttags`
--

CREATE TABLE `posttags` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posttags`
--

INSERT INTO `posttags` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(85, '24', '198', '2024-09-16 11:58:04', '2024-09-16 11:58:04'),
(86, '27', '198', '2024-09-16 12:01:01', '2024-09-16 12:01:01'),
(87, '122', '180', '2024-09-20 16:17:10', '2024-09-20 16:17:10'),
(88, '132', '188', '2024-09-20 20:47:45', '2024-09-20 20:47:45'),
(89, '134', '188', '2024-09-20 21:13:13', '2024-09-20 21:13:13'),
(90, '136', '188', '2024-09-21 14:42:59', '2024-09-21 14:42:59'),
(91, '137', '188', '2024-09-21 15:16:51', '2024-09-21 15:16:51'),
(92, '145', '180', '2024-09-25 08:58:14', '2024-09-25 08:58:14'),
(93, '166', '180', '2024-10-02 09:04:45', '2024-10-02 09:04:45');

-- --------------------------------------------------------

--
-- Table structure for table `replycomments`
--

CREATE TABLE `replycomments` (
  `id` bigint UNSIGNED NOT NULL,
  `comment_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `replycomments`
--

INSERT INTO `replycomments` (`id`, `comment_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(7, 149, 182, 'test', '2024-09-17 16:47:16', '2024-09-17 16:47:16'),
(8, 149, 182, 'test', '2024-09-17 16:47:16', '2024-09-17 16:47:16'),
(9, 149, 182, 'test', '2024-09-17 16:47:16', '2024-09-17 16:47:16'),
(10, 149, 182, 'test', '2024-09-17 16:47:16', '2024-09-17 16:47:16'),
(11, 149, 182, 'test', '2024-09-17 16:47:16', '2024-09-17 16:47:16'),
(12, 149, 182, 'test', '2024-09-17 16:47:16', '2024-09-17 16:47:16'),
(13, 149, 182, 'test', '2024-09-17 16:47:16', '2024-09-17 16:47:16'),
(16, 164, 189, 'hlo', '2024-09-18 09:13:17', '2024-09-18 09:13:17'),
(18, 156, 188, 'ok', '2024-09-18 14:18:03', '2024-09-18 14:18:03'),
(19, 177, 196, 'hbbbbbnb', '2024-09-20 14:38:30', '2024-09-20 14:38:30'),
(20, 178, 196, '🙏🙏', '2024-09-20 14:44:52', '2024-09-20 14:44:52');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '2024-05-07 00:30:28', '2024-05-07 00:30:28'),
(2, 'Accountant', 'admin', '2024-05-07 01:05:17', '2024-05-07 01:05:17'),
(3, 'Manager', 'admin', '2024-06-05 15:25:25', '2024-06-05 15:25:25'),
(4, 'Marketing Staff', 'admin', '2024-06-05 15:29:51', '2024-06-05 15:29:51'),
(5, 'Sales Staff', 'admin', '2024-06-05 15:30:03', '2024-06-05 15:30:03');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(1, 2),
(43, 2),
(44, 2),
(47, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 2),
(66, 2),
(67, 2),
(68, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(73, 2),
(74, 2),
(75, 2),
(76, 2),
(77, 2),
(80, 2),
(81, 2),
(82, 2),
(83, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(1, 4),
(1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `saveposts`
--

CREATE TABLE `saveposts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `saveposts`
--

INSERT INTO `saveposts` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(38, 188, 71, '2024-09-18 13:20:15', '2024-09-18 13:20:15'),
(41, 188, 135, '2024-09-23 10:55:48', '2024-09-23 10:55:48'),
(42, 188, 19, '2024-09-23 12:03:57', '2024-09-23 12:03:57'),
(44, 182, 101, '2024-09-25 06:07:17', '2024-09-25 06:07:17'),
(45, 196, 159, '2024-09-27 20:59:24', '2024-09-27 20:59:24');

-- --------------------------------------------------------

--
-- Table structure for table `shares`
--

CREATE TABLE `shares` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shares`
--

INSERT INTO `shares` (`id`, `user_id`, `post_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 198, 23, 'true', '2024-09-16 16:06:59', '2024-09-16 16:06:59'),
(2, 188, 23, 'true', '2024-09-18 12:00:12', '2024-09-18 12:00:12'),
(3, 188, 23, 'true', '2024-09-18 12:00:20', '2024-09-18 12:00:20'),
(4, 188, 23, 'true', '2024-09-18 12:00:22', '2024-09-18 12:00:22'),
(5, 188, 23, 'true', '2024-09-18 12:00:30', '2024-09-18 12:00:30'),
(6, 188, 23, 'true', '2024-09-18 12:00:36', '2024-09-18 12:00:36'),
(7, 188, 23, 'true', '2024-09-18 12:02:50', '2024-09-18 12:02:50'),
(8, 188, 23, 'true', '2024-09-18 12:02:54', '2024-09-18 12:02:54'),
(9, 188, 23, 'true', '2024-09-18 12:04:21', '2024-09-18 12:04:21'),
(10, 188, 104, 'true', '2024-09-18 13:08:00', '2024-09-18 13:08:00'),
(11, 196, 19, 'true', '2024-09-19 15:47:49', '2024-09-19 15:47:49'),
(12, 196, 99, 'true', '2024-09-20 15:40:12', '2024-09-20 15:40:12'),
(13, 189, 23, 'true', '2024-09-25 14:28:34', '2024-09-25 14:28:34'),
(14, 189, 23, 'true', '2024-09-25 14:28:39', '2024-09-25 14:28:39'),
(15, 189, 23, 'true', '2024-09-25 14:28:40', '2024-09-25 14:28:40'),
(16, 189, 23, 'true', '2024-09-25 14:29:18', '2024-09-25 14:29:18'),
(17, 189, 23, 'true', '2024-09-25 14:29:29', '2024-09-25 14:29:29'),
(18, 189, 23, 'true', '2024-09-25 14:30:27', '2024-09-25 14:30:27'),
(19, 207, 149, 'true', '2024-09-25 16:34:12', '2024-09-25 16:34:12'),
(20, 208, 128, 'true', '2024-09-25 20:32:55', '2024-09-25 20:32:55'),
(21, 189, 23, 'true', '2024-09-27 08:31:52', '2024-09-27 08:31:52'),
(22, 188, 19, 'true', '2024-10-07 10:18:24', '2024-10-07 10:18:24');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `music` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `singer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `title`, `image`, `music`, `singer`, `created_at`, `updated_at`) VALUES
(26, 'Breaking Bollywood', 'Q9jUwW4mnMgWJdDdEZU1zRpuQdg3nAf4orKkIP5C.webp', 'Breaking Bollywood.mp3', 'Kmaclaoud', '2024-09-16 14:29:15', '2024-09-16 14:29:15'),
(27, 'Bollywood Entrance', 'fkuVxuqLX34q9YihbLvSJvRMGnARl2kyRcIonRnl.webp', 'Bollywood Entrance.mp3', 'StudioKolomna', '2024-09-16 14:31:01', '2024-09-16 14:31:01'),
(28, 'Tasvir', 'c6cCitKcfCSzZCnLUJUoGYtUgwvBxiFaiDNeBI0n.webp', 'Tasvir.mp3', 'Prazkhanal', '2024-09-16 14:32:06', '2024-09-16 14:32:06'),
(29, 'Saanjh Sunheri', 'QtBkXUkie4IXZ5HKjWFjDJkYeh0qwWE2bG9Nu9YQ.webp', 'Saanjh Sunheri.mp3', '80Electronic', '2024-09-16 14:37:08', '2024-09-16 14:37:08'),
(30, 'Tere Sang', 'WoS66mvdfaWdrArZT9Xellnvso8XsBRMh2XYafsh.webp', 'Tere Sang.mp3', '80Electronics', '2024-09-16 14:38:34', '2024-09-16 14:38:34'),
(31, 'Dhol bajega aur taal badhega', '7voCncbKG0v8HcykN9yLUjme8vztQXEHrjwTSYnS.jpg', 'Dhol bajega aur taal badhega.mp3', 'Trans', '2024-09-16 14:41:48', '2024-09-16 14:41:48'),
(32, 'Yaar Rus Jave | Indian Pop Music', 'VkuwjRDxTgPWRILp6P4zSsDReqiwUm5JRg6k3zaq.jpg', 'Yaar Rus Jave | Indian Pop Music.mp3', 'Prazkhanal', '2024-09-16 14:44:33', '2024-09-16 14:44:33'),
(33, 'Aaja Ve', 'HlQ9vIJs1QWQ88MBmRBUzot3gUZs1pzFLfcBmu9d.jpg', 'Aaja Ve.mp3', 'TheAmericanRecord3', '2024-09-16 14:45:34', '2024-09-16 14:45:34');

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ph_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Odisha', 'OR', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(2, 'Andhra Pradesh', 'AP', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(3, 'Arunachal Pradesh', 'AR', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(4, 'Assam', 'AS', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(5, 'Bihar', 'BR', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(6, 'Chandigarh', 'CH', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(7, 'Chhattisgarh', 'CT', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(8, 'Dadra and Nagar Haveli', 'DN', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(9, 'Daman and Diu', 'DD', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(10, 'Delhi', 'DL', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(11, 'Goa', 'GA', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(12, 'Gujarat', 'GJ', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(13, 'Haryana', 'HR', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(14, 'Himachal Pradesh', 'HP', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(15, 'Jammu and Kashmir', 'JK', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(16, 'Jharkhand', 'JH', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(17, 'Karnataka', 'KA', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(18, 'Kerala', 'KL', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(19, 'Ladakh', 'LA', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(20, 'Lakshadweep', 'LD', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(21, 'Madhya Pradesh', 'MP', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(22, 'Maharashtra', 'MH', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(23, 'Manipur', 'MN', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(24, 'Meghalaya', 'ML', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(25, 'Mizoram', 'MZ', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(26, 'Nagaland', 'NL', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(27, 'Odisha', 'OR', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(28, 'Puducherry', 'PY', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(29, 'Punjab', 'PB', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(30, 'Rajasthan', 'RJ', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(31, 'Sikkim', 'SK', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(32, 'Tamil Nadu', 'TN', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(33, 'Telangana', 'TG', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(34, 'Tripura', 'TR', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(35, 'Uttar Pradesh', 'UP', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(36, 'Uttarakhand', 'UT', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(37, 'West Bengal', 'WB', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(38, 'Andaman and Nicobar Islands', 'AN', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(39, 'Andhra Pradesh', 'AP', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(40, 'Arunachal Pradesh', 'AR', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(41, 'Assam', 'AS', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(42, 'Bihar', 'BR', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(43, 'Chandigarh', 'CH', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(44, 'Chhattisgarh', 'CT', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(45, 'Dadra and Nagar Haveli', 'DN', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(46, 'Daman and Diu', 'DD', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(47, 'Delhi', 'DL', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(48, 'Goa', 'GA', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(49, 'Gujarat', 'GJ', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(50, 'Haryana', 'HR', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(51, 'Himachal Pradesh', 'HP', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(52, 'Jammu and Kashmir', 'JK', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(53, 'Jharkhand', 'JH', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(54, 'Karnataka', 'KA', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(55, 'Kerala', 'KL', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(56, 'Ladakh', 'LA', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(57, 'Lakshadweep', 'LD', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(58, 'Madhya Pradesh', 'MP', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(59, 'Maharashtra', 'MH', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(60, 'Manipur', 'MN', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(61, 'Meghalaya', 'ML', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(62, 'Mizoram', 'MZ', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(63, 'Nagaland', 'NL', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(64, 'Andaman and Nicobar Islands', 'AN', '2024-01-12 18:09:43', '2024-01-12 18:09:43'),
(65, 'Puducherry', 'PY', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(66, 'Punjab', 'PB', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(67, 'Rajasthan', 'RJ', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(68, 'Sikkim', 'SK', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(69, 'Tamil Nadu', 'TN', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(70, 'Telangana', 'TG', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(71, 'Tripura', 'TR', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(72, 'Uttar Pradesh', 'UP', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(73, 'Uttarakhand', 'UT', '2024-01-12 18:14:43', '2024-01-12 18:14:43'),
(74, 'West Bengal', 'WB', '2024-01-12 18:14:43', '2024-01-12 18:14:43');

-- --------------------------------------------------------

--
-- Table structure for table `taxcharges`
--

CREATE TABLE `taxcharges` (
  `id` bigint UNSIGNED NOT NULL,
  `tax_id` bigint UNSIGNED NOT NULL,
  `payment_type` tinyint NOT NULL,
  `payment_for` tinyint NOT NULL,
  `tax_percentage` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxcharges`
--

INSERT INTO `taxcharges` (`id`, `tax_id`, `payment_type`, `payment_for`, `tax_percentage`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 30, '2024-04-05 06:46:39', '2024-04-05 07:18:51'),
(2, 2, 1, 1, 18, '2024-04-05 07:19:13', '2024-04-05 07:19:13'),
(3, 2, 2, 3, 10, '2024-05-27 14:14:30', '2024-05-27 14:14:30'),
(4, 3, 2, 3, 12, '2024-05-29 13:44:03', '2024-05-29 13:44:03');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `tax_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `tax_type`, `created_at`, `updated_at`) VALUES
(1, 'PLATFORM CHARGE', '2024-04-05 05:35:01', '2024-04-05 06:21:08'),
(2, 'TDS', '2024-04-05 06:20:54', '2024-04-05 06:20:54'),
(3, 'VAT', '2024-05-29 13:43:18', '2024-05-29 13:43:18');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`id`, `type`, `terms`, `created_at`, `updated_at`) VALUES
(6, 'terms', '<p><strong>LabLum Terms and Conditions</strong><br />\r\n<strong>1. Acceptance of Terms<br />\r\nBy accessing or using the LabLum app, you agree to be bound by these Terms and Conditions (&quot;Terms&quot;). If you do not agree to these Terms, do not use the LabLum app.<br />\r\n2. Description of Service<br />\r\nLabLum is a short video-sharing platform where users can watch, create, and share videos. Users may earn money by participating in various activities on the app, such as watching videos, creating content, and engaging with advertisements.<br />\r\n3. Eligibility<br />\r\nYou must be at least 13 years old to use LabLum. If you are under 18, you must have parental or guardian consent to use the app.<br />\r\n4. Account Registration<br />\r\nTo use certain features of LabLum, you must register for an account. You agree to provide accurate, current, and complete information during the registration process and to update such information to keep it accurate, current, and complete. You are responsible for safeguarding your account and are fully responsible for any activities that occur under your account.<br />\r\n5. User Conduct<br />\r\nYou agree not to:<br />\r\nUse the app for any illegal or unauthorized purpose.<br />\r\nPost, upload, or share content that is offensive, obscene, defamatory, threatening, or otherwise violates any laws or regulations.<br />\r\nHarass, abuse, or harm another person.<br />\r\nImpersonate any person or entity, or falsely state or otherwise misrepresent yourself or your affiliation with any person or entity.<br />\r\n6. Content Ownership and Rights<br />\r\nUsers retain ownership of the content they create and share on LabLum. By posting content on LabLum, you grant LabLum a worldwide, non-exclusive, royalty-free license to use, distribute, modify, and display your content in connection with the operation of the app.<br />\r\n7. Earnings and Payments<br />\r\nUsers may earn money by participating in activities on LabLum. The amount of money earned and the method of payment are determined by LabLum and may change at any time. LabLum reserves the right to withhold payments for any reason, including suspected fraudulent activity.<br />\r\n8. Advertising<br />\r\nLabLum may display advertisements and promotions. By using the app, you agree to the placement of such advertisements and promotions.<br />\r\n9. Termination<br />\r\nLabLum reserves the right to terminate or suspend your account at any time, with or without cause or notice. Upon termination, your right to use the app will immediately cease.<br />\r\n10. Limitation of Liability<br />\r\nLabLum shall not be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly, or any loss of data, use, goodwill, or other intangible losses, resulting from (a) your use or inability to use the app; (b) any unauthorized access to or use of our servers and/or any personal information stored therein; (c) any interruption or cessation of transmission to or from the app; (d) any bugs, viruses, trojan horses, or the like that may be transmitted to or through the app by any third party; (e) any errors or omissions in any content or for any loss or damage incurred as a result of the use of any content posted, emailed, transmitted, or otherwise made available through the app; and/or (f) the defamatory, offensive, or illegal conduct of any third party.<br />\r\n11. Changes to Terms<br />\r\nLabLum may modify these Terms at any time. Changes will be effective immediately upon posting. Your continued use of the app following the posting of changes constitutes your acceptance of those changes.<br />\r\n12. Governing Law<br />\r\nThese Terms and any action related thereto will be governed by the laws of Imdia without regard to its conflict of law provisions.<br />\r\n13. Contact Information<br />\r\nIf you have any questions about these Terms, please contact us atsupport@lablum.com.</strong></p>', '2024-06-28 10:05:02', '2024-06-28 10:15:47'),
(7, 'privacy', '<p><u><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Privacy policy of Lablum</strong></span></span></u><br />\r\n<span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Lablum values your privacy and is committed to protecting your personal information. Our privacy policy outlines how we collect, use, and safeguard your data when you use our app.<br />\r\nWHAT DO WE DO WITH YOUR INFORMATION:<br />\r\nWhen you Use our application, we also automatically receive your computer&rsquo;s/Mobile&#39;s internet protocol (IP) address in order to provide us with information that helps us learn about your browser and operating system.<br />\r\nEmail marketing (if applicable): With your permission, we may send you emails about our app, new features and other updates.<br />\r\ninformation collection: We collect personal information you provide to us, such as your name, email address, and payment information. We also collect data automatically when you use the app, including your device information, usage patterns, and location data if you enable location services.<br />\r\nUse of Information: We use the information collected to provide and improve our services, personalize your experience, communicate with you, and process payments. We may also use your data for marketing purposes, but you can opt out of these communications.<br />\r\nData Sharing: We may share your information with third-party service providers who assist us in operating the app, conducting business, or servicing you. We may also share data for legal reasons or in connection with a merger, acquisition, or sale of assets.<br />\r\nData Security: Lablum employs industry-standard security measures to protect your data from unauthorized access, disclosure, alteration, or destruction.<br />\r\nChildren&#39;s Privacy: Lablum is not intended for use by children under the age of 13, and we do not knowingly collect personal information from minors.<br />\r\nYour Choices: You can review and update your personal information in the app settings. You can also opt out of certain data collection and marketing communications.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>CONSENT:<br />\r\nHow do you get my consent?<br />\r\nIf we ask for your personal information for a secondary reason, like marketing, we will either ask you directly for your expressed consent or provide you with an opportunity to say no,If user wishes to be specifically contacted via any one preferred channel, lablum will be obliged to do so.<br />\r\nHow do I withdraw my consent?<br />\r\nIf after you opt-in, you change your mind, you may withdraw your consent for us to contact you, for the continued collection, use or disclosure of your information, at anytime, by contacting us at [ phone no] or e-mailing us at: [mail id].<br />\r\nDISCLOSURE:<br />\r\nWe may disclose your personal information if we are required by law to do so or if you violate our Terms of Service.<br />\r\nLINKS:<br />\r\nWhen you click on links on our app, they may, sometimes, direct you away from our application. We are not responsible for the privacy practices of other sites and encourage you to read their privacy statements.<br />\r\nSECURITY:<br />\r\nTo protect your personal information, we take reasonable precautions and follow industry best practices to make sure it is not inappropriately lost, misused, accessed, disclosed, altered or destroyed.<br />\r\nCOOKIES:<br />\r\nWe use cookies to maintain session of your user. It is not used to personally identify you on other websites.<br />\r\nAGE OF CONSENT:<br />\r\nBy using this site, you represent that you are at least the age of majority in your state or province of residence, or that you are the age of majority in your state or province of residence and you have given us your consent to allow any of your minor dependents to use this site.<br />\r\nChanges to Privacy Policy: We may update our privacy policy from time to time, and any changes will be posted on our website and within the app.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>By using Lablum, you consent to the terms of our privacy policy. If you have any questions or concerns about your privacy, please contact us at . Mail id.</strong></span></span></p>', '2024-06-28 10:05:50', '2024-06-28 10:05:50'),
(8, 'advertisment', '<h3><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\"><strong>LabLum Advertisement Policy</strong></span></span></h3>\r\n\r\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">This Advertisement Policy outlines the rules and guidelines for businesses and individuals who wish to create and manage advertisements on <strong>LabLum</strong>. By using LabLum&rsquo;s advertisement services, you agree to adhere to this policy and all platform guidelines.</span></span></p>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">1. <strong>Eligibility</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">To create and manage advertisements on LabLum, users must have a <strong>registered business account</strong>.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">All information provided during registration must be accurate and up to date. LabLum reserves the right to verify the legitimacy of any business or individual using the advertisement service.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">2. <strong>Creating an Advertisement</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Advertisers can create campaigns by choosing specific <strong>target areas</strong>, <strong>target audience</strong>, and <strong>time periods</strong> for the ad to run.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">LabLum allows advertisers to customize the audience by selecting demographic filters such as <strong>age, gender, location, and interests</strong>.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Advertisers are responsible for ensuring their ads comply with <strong>LabLum&rsquo;s guidelines</strong> and all relevant legal regulations.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">3. <strong>Ad Approval Process</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">All ads submitted to LabLum are subject to an internal <strong>review and approval</strong> process. Ads will be reviewed for compliance with our <strong>advertising standards</strong> and policies.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Ads that do not meet the necessary criteria may be <strong>rejected</strong>. LabLum will notify advertisers of the reasons for rejection, and they may edit and resubmit the ad for review.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">4. <strong>Prohibited Content</strong></span></span></h4>\r\n\r\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">The following types of content are prohibited in advertisements on LabLum:</span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\"><strong>Misleading or false information</strong>: Ads must not contain deceptive, fraudulent, or misleading claims.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\"><strong>Offensive or inappropriate content</strong>: Ads must not promote hate speech, violence, harassment, or discrimination based on race, ethnicity, religion, gender, sexual orientation, or disability.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\"><strong>Explicit or adult content</strong>: Ads containing nudity, sexual content, or explicit language are strictly prohibited.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\"><strong>Illegal activities</strong>: Ads promoting illegal products or services (e.g., drugs, weapons, or counterfeit goods) are banned.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\"><strong>Sensitive content</strong>: Content related to politics, social issues, or controversial topics may be restricted or rejected.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">5. <strong>Ad Targeting Guidelines</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Advertisers are required to use <strong>responsible targeting</strong> practices. All ads must be aimed at audiences appropriate for the content being promoted.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">The targeting criteria selected (age, location, gender, etc.) must be accurate and not misleading.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Advertisers cannot use targeting options to exploit vulnerable groups or discriminate against any audience.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">6. <strong>Ad Performance and Reporting</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Once an ad is live, advertisers can access real-time performance reports through their <strong>dashboard</strong>. Metrics such as <strong>impressions, clicks, reach, and engagement</strong> will be available to help advertisers measure their ad effectiveness.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">LabLum provides detailed analytics to allow advertisers to adjust their campaigns for better performance.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">7. <strong>Payment and Billing</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Advertisers will be charged based on the selected pricing model: <strong>pay-per-click (PPC)</strong> or <strong>cost-per-thousand-impressions (CPM)</strong>.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">All ad campaigns must be pre-funded or linked to a valid payment method.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Payment will be processed upon ad approval, and all <strong>fees are non-refundable</strong>. This includes situations where ads are later suspended or removed due to policy violations.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">8. <strong>Ad Suspension and Termination</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">LabLum reserves the right to <strong>suspend or terminate</strong> advertisements that violate any part of this policy.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Ads may be suspended for reasons including, but not limited to:</span></span>\r\n	<ul>\r\n		<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Violations of LabLum&rsquo;s community standards or advertising guidelines.</span></span></li>\r\n		<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Fraudulent or deceptive activity.</span></span></li>\r\n		<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Use of bots or artificial engagement to manipulate ad performance.</span></span></li>\r\n	</ul>\r\n	</li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Advertisers whose accounts are found to repeatedly violate policies may have their <strong>advertising privileges revoked</strong>.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">9. <strong>Content Ownership and Licensing</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Advertisers retain ownership of the content they upload, but by submitting an ad, they grant LabLum a <strong>non-exclusive, worldwide, royalty-free license</strong> to use, reproduce, and display the ad across the platform for promotional and operational purposes.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Advertisers are responsible for ensuring they have the right to use all materials (e.g., images, music, trademarks) included in their advertisements.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">10. <strong>Disclaimers and Liability</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">LabLum does not guarantee any specific outcomes (e.g., clicks, sales, conversions) from ad campaigns.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">LabLum is not liable for any losses or damages resulting from ad performance, including incorrect targeting or unexpected campaign results.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Advertisers are responsible for any legal consequences arising from the content of their ads.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">11. <strong>Modifications to Advertisement Policy</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">LabLum reserves the right to modify or update this Advertisement Policy at any time. Advertisers will be notified of any significant changes through email or in-app notifications.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Continued use of the advertisement service after policy updates constitutes acceptance of the revised terms.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">12. <strong>Support and Queries</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">For any questions or issues related to advertisements, advertisers can reach out to <strong>LabLum&rsquo;s support team</strong> through the <strong>Help &amp; Support</strong> section in the app or via email at <strong>support@lablum.com</strong>.</span></span></li>\r\n</ul>', '2024-06-28 10:06:40', '2024-09-10 10:50:40'),
(9, 'privacy', '<p><u><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Privacy policy of Lablum</strong></span></span></u><br />\r\n<span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Lablum values your privacy and is committed to protecting your personal information. Our privacy policy outlines how we collect, use, and safeguard your data when you use our app.<br />\r\nWHAT DO WE DO WITH YOUR INFORMATION:<br />\r\nWhen you Use our application, we also automatically receive your computer&rsquo;s/Mobile&#39;s internet protocol (IP) address in order to provide us with information that helps us learn about your browser and operating system.<br />\r\nEmail marketing (if applicable): With your permission, we may send you emails about our app, new features and other updates.<br />\r\ninformation collection: We collect personal information you provide to us, such as your name, email address, and payment information. We also collect data automatically when you use the app, including your device information, usage patterns, and location data if you enable location services.<br />\r\nUse of Information: We use the information collected to provide and improve our services, personalize your experience, communicate with you, and process payments. We may also use your data for marketing purposes, but you can opt out of these communications.<br />\r\nData Sharing: We may share your information with third-party service providers who assist us in operating the app, conducting business, or servicing you. We may also share data for legal reasons or in connection with a merger, acquisition, or sale of assets.<br />\r\nData Security: Lablum employs industry-standard security measures to protect your data from unauthorized access, disclosure, alteration, or destruction.<br />\r\nChildren&#39;s Privacy: Lablum is not intended for use by children under the age of 13, and we do not knowingly collect personal information from minors.<br />\r\nYour Choices: You can review and update your personal information in the app settings. You can also opt out of certain data collection and marketing communications.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>CONSENT:<br />\r\nHow do you get my consent?<br />\r\nIf we ask for your personal information for a secondary reason, like marketing, we will either ask you directly for your expressed consent or provide you with an opportunity to say no,If user wishes to be specifically contacted via any one preferred channel, lablum will be obliged to do so.<br />\r\nHow do I withdraw my consent?<br />\r\nIf after you opt-in, you change your mind, you may withdraw your consent for us to contact you, for the continued collection, use or disclosure of your information, at anytime, by contacting us at [ phone no] or e-mailing us at: [mail id].<br />\r\nDISCLOSURE:<br />\r\nWe may disclose your personal information if we are required by law to do so or if you violate our Terms of Service.<br />\r\nLINKS:<br />\r\nWhen you click on links on our app, they may, sometimes, direct you away from our application. We are not responsible for the privacy practices of other sites and encourage you to read their privacy statements.<br />\r\nSECURITY:<br />\r\nTo protect your personal information, we take reasonable precautions and follow industry best practices to make sure it is not inappropriately lost, misused, accessed, disclosed, altered or destroyed.<br />\r\nCOOKIES:<br />\r\nWe use cookies to maintain session of your user. It is not used to personally identify you on other websites.<br />\r\nAGE OF CONSENT:<br />\r\nBy using this site, you represent that you are at least the age of majority in your state or province of residence, or that you are the age of majority in your state or province of residence and you have given us your consent to allow any of your minor dependents to use this site.<br />\r\nChanges to Privacy Policy: We may update our privacy policy from time to time, and any changes will be posted on our website and within the app.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>By using Lablum, you consent to the terms of our privacy policy. If you have any questions or concerns about your privacy, please contact us at support@lablum.com</strong></span></span></p>', '2024-06-28 10:08:37', '2024-06-28 10:08:37'),
(10, 'privacy', '<p><u><span style=\"font-size:16px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Privacy policy of Lablum</strong></span></span></u></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Lablum values your privacy and is committed to protecting your personal information. Our privacy policy outlines how we collect, use, and safeguard your data when you use our app.<br />\r\nWHAT DO WE DO WITH YOUR INFORMATION:</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>&nbsp;When you use our application, we also automatically receive your computer&rsquo;s/Mobile&#39;s internet protocol (IP) address in order to provide us with information that helps us learn about your browser and operating system.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Email marketing: We may send you emails about our app, new features, and other updates with your permission.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Information collection: We collect personal information you provide to us, such as your name, email address, and payment information. We also collect data automatically when you use the app, including your device information, usage patterns.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Use of Information: We use the information collected to provide and improve our services, personalize your experience, communicate with you, and process payments. We may also use your data for marketing purposes, but you can opt out of these communications.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Data Sharing: We may share your information with third-party service providers who assist us in operating the app, conducting business, or servicing you. We may also share data for legal reasons or in connection with a merger, acquisition, or sale of assets.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Data Security: Lablum employs industry-standard security measures to protect your data from unauthorized access, disclosure, alteration, or destruction.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Children&#39;s Privacy: Lablum is not intended for use by children under the age of 13, and we do not knowingly collect personal information from minors.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Your Choices: You can review and update your personal information in the app settings. You can also opt out of certain data collection and marketing communications.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>CONSENT:</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>&nbsp;How do you get my consent?</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>&nbsp;If we ask for your personal information for a secondary reason, like marketing, we will either ask you directly for your expressed consent or provide you with an opportunity to say no, If the user wishes to be specifically contacted via any one preferred channel, lablum will be obliged to do so.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>&nbsp;How do I withdraw my consent?&nbsp;</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>If you change your mind after you opt-in, you may withdraw your consent for us to contact you, for the continued collection, use, or disclosure of your information, at any time, by e-mailing us at: support@lablum.com. &nbsp;</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>DISCLOSURE:</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>&nbsp;We may disclose your personal information if we are required by law to do so or if you violate our Terms of Service.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>LINKS:</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>&nbsp;When you click on links on our app, they may, sometimes, direct you away from our application. We are not responsible for the privacy practices of other sites and encourage you to read their privacy statements.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>SECURITY:</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>&nbsp;To protect your personal information, we take reasonable precautions and follow industry best practices to make sure it is not inappropriately lost, misused, accessed, disclosed, altered, or destroyed.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>COOKIES:</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>&nbsp;We use cookies to maintain the session of your user. It is not used to personally identify you on other websites.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>ACCOUNT DELETION AND DATA RETENTION:</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>When you request to delete your account within the app, all your data, including your profile information, uploaded videos, wallet balances, and any other associated content, will be permanently deleted from our servers. This action is irreversible, and you will no longer be able to access or retrieve any of your data.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>However, in compliance with legal obligations in India, we retain certain data even after account deletion. This data is securely stored and encrypted, ensuring its protection. We may be required to provide this information to government authorities if requested, particularly in cases involving criminal activity, terrorism, or actions that pose a threat to society or the country. We are committed to keeping this retained data secure and only accessible under lawful conditions.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>AGE OF CONSENT:</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>By using this site, you represent that you are at least the age of majority in your state or province of residence, or that you are the age of majority in your state or province of residence and you have given us your consent to allow any of your minor dependents to use this site.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>Changes to Privacy Policy:&nbsp;</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>We may update our privacy policy from time to time, and any changes will be posted on our website and within the app.</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>By using Lablum, you consent to the terms of our privacy policy. If you have any questions or concerns about your privacy, please contact us at: support@lablum.com.</strong></span></span></p>', '2024-06-28 10:08:49', '2024-09-10 11:01:29'),
(11, 'creator', '<h3><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\"><strong>LabLum Creator Policy</strong></span></span></h3>\r\n\r\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Welcome to <strong>LabLum</strong> &ndash; where content creators can showcase their creativity and earn rewards! As a content creator on LabLum, you play a vital role in shaping our community. Please read the following Creator Policy carefully to understand your rights, responsibilities, and earning guidelines.</span></span></p>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">1. <strong>Eligibility as a Content Creator</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">To become a content creator on LabLum, you must register an account and adhere to all platform guidelines.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Ensure that your account information, including bank details, is accurate to receive earnings without delays.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">2. <strong>Content Upload Guidelines</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">As a content creator, you can upload videos, images, and other media content that aligns with LabLum&rsquo;s community standards.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">All content must be original and adhere to copyright laws. Do not upload plagiarized or unlicensed content.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Content must be respectful, free of offensive material, and follow the <strong>LabLum Community Guidelines</strong>. LabLum reserves the right to remove content that violates these rules.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">3. <strong>Earnings and Monetization</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">You earn rewards based on the <strong>views and likes</strong> your content receives. The more engagement your content attracts, the more you can earn.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Your earnings are automatically added to your LabLum wallet and can be withdrawn anytime. Withdrawals will be processed, and the funds will reach your bank account within <strong>7-14 days</strong>.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Earnings may be subject to taxes and deductions as per local regulations. LabLum is not responsible for handling tax obligations, and creators are advised to consult local tax authorities.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">4. <strong>Withdrawal of Earnings</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">To withdraw earnings, you must ensure your account is in good standing and your bank details are up to date.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">LabLum ensures the timely transfer of funds within <strong>7-14 days</strong> after a withdrawal request, but processing times may vary depending on banking channels.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">You can track your earnings and withdrawal status within the app.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">5. <strong>Content Ownership and Rights</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">As a creator, you retain ownership of the content you upload. However, by posting on LabLum, you grant the platform a <strong>non-exclusive, worldwide, royalty-free license</strong> to use, distribute, and display your content for promotional purposes.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">LabLum will not sell or distribute your content outside of the platform without your consent.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">6. <strong>Prohibited Content</strong></span></span></h4>\r\n\r\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Creators are prohibited from uploading content that includes:</span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Hate speech, offensive or discriminatory remarks.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Violence, abuse, or any form of harassment.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Nudity, explicit material, or content that violates any local laws.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Spam or misleading information.</span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Failure to comply with these content rules may result in the removal of your content and/or suspension of your account.</span></span></p>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">7. <strong>Account Suspension and Termination</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">LabLum reserves the right to suspend or terminate accounts that violate the Creator Policy or the LabLum Community Guidelines.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Any fraudulent activity, including the use of bots, buying likes/views, or artificially inflating engagement, will result in the immediate termination of your account and forfeiture of any pending earnings.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">If your account is terminated, you may lose access to any pending earnings and content posted on the platform.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">8. <strong>Official Blue Tick Verification</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Content creators may apply for <strong>Official Blue Tick Verification</strong> through a one-time payment of <strong>₹99</strong> (subject to change). Approval of the blue tick is at the discretion of the LabLum admin team, and verification is only granted to eligible creators.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">The payment is non-refundable, and blue tick eligibility is based on content quality, activity, and compliance with platform guidelines.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">9. <strong>Policy Updates</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">LabLum reserves the right to update this Creator Policy at any time. Any changes will be communicated through in-app notifications or email. Continued use of the platform indicates your acceptance of any updated policies.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">10. <strong>Support and Disputes</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">For any concerns, disputes, or queries related to your account, earnings, or content, you can reach out to our support team via the <strong>Help &amp; Support</strong> section within the app or email us at <strong>support@lablum.com</strong>.</span></span></li>\r\n</ul>', '2024-06-28 10:11:22', '2024-09-10 10:44:42'),
(12, 'viewer', '<h3><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\"><strong>LabLum Viewer Policy</strong></span></span></h3>\r\n\r\n<p><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Welcome to <strong>LabLum</strong>! As a valued viewer on our platform, we want to ensure that your experience is smooth, rewarding, and enjoyable. Please read our Viewer Policy carefully to understand your rights and responsibilities when engaging with content on LabLum.</span></span></p>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">1. <strong>Earning Rewards as a Viewer</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\"><strong>Watch and Earn</strong>: Viewers can earn rewards by watching videos and other content completely. Partial viewing or skipping the video will result in <strong>no rewards</strong>.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">To qualify for rewards, you must watch the video until the end without skipping.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">The earned rewards will be added to your LabLum wallet, which you can withdraw anytime following LabLum&rsquo;s standard withdrawal process.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">2. <strong>Eligibility for Rewards</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Only fully watched videos are eligible for rewards. If you exit, pause, or skip the video before completion, the viewing session will not count, and no rewards will be credited.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">You must ensure that your account is in good standing and active to participate in the rewards program.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">3. <strong>Withdrawal of Earnings</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">You can withdraw your earned rewards from the LabLum wallet at any time. The withdrawal will be processed, and funds will be transferred to your registered bank account within <strong>7-14 days</strong>.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Ensure your bank account information is accurate to avoid any delays in receiving your funds.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">4. <strong>Code of Conduct</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">As a viewer, you are expected to engage with content responsibly and respectfully.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Any misuse of the platform, such as attempting to manipulate views or rewards, may result in the suspension or termination of your account.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">5. <strong>No Tolerance for Fraudulent Activity</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">LabLum has a <strong>zero-tolerance policy</strong> for fraudulent activities such as fake viewing patterns, bots, or other dishonest practices.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">If any fraudulent activity is detected, your account may be subject to a permanent ban, and any pending rewards will be forfeited.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">6. <strong>Content Guidelines</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">As a viewer, you may provide feedback on the content you watch. However, make sure that your comments and interactions follow LabLum&rsquo;s community guidelines.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Avoid using offensive language, hate speech, or any form of harassment in your comments. We are committed to maintaining a positive and respectful community for all users.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">7. <strong>Policy Changes</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">LabLum reserves the right to modify this Viewer Policy at any time. Any changes will be communicated through in-app notifications or email. Continued use of the platform after updates to the policy implies your acceptance of the changes.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">8. <strong>Account Responsibility</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">You are responsible for maintaining the security of your LabLum account. Do not share your account details with others.</span></span></li>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">Any activity or rewards associated with your account are your responsibility, so ensure your viewing habits align with LabLum&rsquo;s policies.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">9. <strong>Support</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:14px\">For any questions, concerns, or issues related to rewards, viewing content, or account management, please contact our support team via the <strong>Help &amp; Support</strong> section within the app or email us at <strong>support@lablum.com</strong></span></span></li>\r\n</ul>', '2024-06-28 10:12:21', '2024-09-10 10:40:58');
INSERT INTO `terms` (`id`, `type`, `terms`, `created_at`, `updated_at`) VALUES
(13, 'official', '<h3><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><strong>LabLum Official Blue Tick Verification &ndash; Terms and Conditions</strong></span></span></h3>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">By applying for LabLum&#39;s <strong>Official Blue Tick Verification</strong>, you agree to the following terms and conditions. Please read these terms carefully before proceeding with your application.</span></span></p>\r\n\r\n<h4><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">1. <strong>Eligibility</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">To be considered for verification, your LabLum account must meet the platform&#39;s eligibility requirements, including but not limited to activity, authenticity, and content quality.</span></span></li>\r\n	<li><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">The decision to grant the blue tick badge is solely at the discretion of LabLum&#39;s admin team.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">2. <strong>One-Time Payment</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">The fee for applying for the <strong>Blue Tick Verification</strong> is a <strong>one-time payment of ₹99</strong>. This amount may change in the future at LabLum&rsquo;s discretion.</span></span></li>\r\n	<li><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">Payment does not guarantee approval. The blue tick badge is only issued after the admin team has reviewed and approved your application.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">3. <strong>Non-Refundable Fee</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">The ₹99 payment is non-refundable, regardless of whether your application is approved or denied. Ensure that your account meets LabLum&rsquo;s guidelines before applying.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">4. <strong>Admin Review</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">All applications will be reviewed by LabLum&#39;s admin team to ensure that the account complies with our verification criteria.</span></span></li>\r\n	<li><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">Admins reserve the right to reject any application without providing detailed reasons for the decision.</span></span></li>\r\n	<li><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">LabLum reserves the right to revoke the blue tick if the account is found violating any of the platform&rsquo;s community guidelines in the future.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">5. <strong>Verification Criteria</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">Your account must represent a real person, business, or entity.</span></span></li>\r\n	<li><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">Your account should be active and in good standing with no violations of LabLum&rsquo;s terms of service.</span></span></li>\r\n	<li><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">The decision to award the blue tick is based on various factors, including the originality of content, account engagement, and authenticity.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">6. <strong>Changes to the Terms</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">LabLum reserves the right to modify or update these terms and conditions at any time. Any changes will be communicated through the app, and users are advised to review these terms periodically.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">7. <strong>Validity of Blue Tick</strong></span></span></h4>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">Once granted, the blue tick is valid for the lifetime of the account, provided that the user complies with LabLum&rsquo;s guidelines and terms of service.</span></span></li>\r\n	<li><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">LabLum reserves the right to remove the blue tick if any suspicious activity or violation of terms is detected on the account.</span></span></li>\r\n</ul>\r\n\r\n<h4><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">8. <strong>Contact Information</strong></span></span></h4>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">For any inquiries regarding the blue tick verification process, you can contact our support team through the app&#39;s help section or by emailing <strong>support@lablum.com .</strong></span></span></p>', '2024-09-05 16:51:51', '2024-09-10 10:33:52');

-- --------------------------------------------------------

--
-- Table structure for table `userdatas`
--

CREATE TABLE `userdatas` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userdatas`
--

INSERT INTO `userdatas` (`id`, `user_id`, `document_id1`, `document_id2`, `father_name`, `name`, `address`, `dob`, `gender`, `created_at`, `updated_at`) VALUES
(4, '189', '785323704432', NULL, 'S/O: Dhananjay Kumar', 'Ravikant Kumar', 'chichaura, Chichwara, Konch, Gaya, Chechaura, Bihar, India, 824207', '12-08-2001', 'M', '2024-09-16 12:07:50', '2024-09-16 12:07:50'),
(6, '200', '785801995930', 'FWNPM4554B', 'S/O Rashmi Ranjan Mohanty', 'Ayasakanta Mohanty', 'ROHIA, ROHIA, JAGATSINGHPUR, NAUGAON, Rohia, Naugaon, Jagatsinghapur, Rohia, Odisha, India, 754113', '02-04-2001', 'M', '2024-09-16 14:54:04', '2024-09-16 14:54:04'),
(7, '198', '460652879060', NULL, 'C/O: Sarat Chandra Sahoo', 'Tarun Kumar Sahoo', 'At/Po-Bainchua, Padia Sahi, Bainchua, Balianta, Khorda, Bhainchua, Odisha, India, 752100', '18-07-2001', 'M', '2024-09-16 14:57:39', '2024-09-16 14:57:39');

-- --------------------------------------------------------

--
-- Table structure for table `userreports`
--

CREATE TABLE `userreports` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `report_id` bigint UNSIGNED NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'm:Male, f:Female, ot:Others',
  `bio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_dp` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `dob` date DEFAULT NULL,
  `country` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `languages` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `app_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fcm_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `login_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'G: google, FB: Facebook, IN: Insta,  OT: OTP',
  `time_zone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `player_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `uuid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ios_uuid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `verification_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `verification_time` datetime DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '0' COMMENT '1: yes, 0: no',
  `deleted` tinyint NOT NULL DEFAULT '0',
  `last_active` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email_verified` int NOT NULL DEFAULT '0',
  `kyc_status` tinyint NOT NULL DEFAULT '0',
  `kyc_date` date DEFAULT NULL,
  `document_id1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_id2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `fname`, `lname`, `email`, `mobile`, `gender`, `bio`, `user_dp`, `password`, `dob`, `country`, `languages`, `app_token`, `fcm_token`, `login_type`, `time_zone`, `player_id`, `uuid`, `ios_uuid`, `verification_code`, `verification_time`, `active`, `deleted`, `last_active`, `created_at`, `updated_at`, `email_verified`, `kyc_status`, `kyc_date`, `document_id1`, `document_id2`) VALUES
(180, '@rakesh', 'Rakesh', 'Kumar', 'rakesh23@gmail.com', '9777266646', 'm', 'Heavy Developer', '1727632618.jpg', '$2y$12$526/hOPMJLkopVSXanxv1ODTwR.RYRGmsn3ut.XVZ8CLhvE.hQKZa', '2001-03-19', '', '', 'MGi2CXeLp69O3hMcDVRrYYu4uiUqcJNnwwwMt7uShz9He6q6ZXjNvA4bGCXg', 'd2KFx6V6RHGZy343ph7NiA:APA91bFAkOQU0XKSTabp4lKsD6ioX_viAopck0ltf8mRdnS1KnA9PKJOgIlMZJIZNeIgzx3Ror_2XJevveqYLqT6rFe4hAIPW_oho96PnidnlSJ3pYSekjs9x88Fjai_3CjfOVQD2aSo', 'O', '', '', '0nHZ5FWRX1MGfQHvsYFLI67DMHl2', '', '', NULL, 1, 0, '2024-09-25 04:56:27', '2024-06-08 06:38:08', '2024-09-29 17:56:58', 0, 0, NULL, NULL, NULL),
(181, '@poonam24', 'Poonam', 'Jena', 'poonam@gmail.com', '9861023541', 'f', NULL, NULL, '$2y$12$k2aXH9sP8c7EAeTmdo7kquQl02fmIsCz/jlKb8Zg7jtXDE0fneLnu', '2024-04-16', '', '', 'JHUsrBIbdBQFMUYO9tlbp6w7V12UmaulV7C3E326i3wSZwVIym12NiWhYnbW', 'dL2-gzgeSWe6A0aHyC9Dxg:APA91bGwl8wQbqpvDU57g5TVEnApZXJKxf5FV_RDZoJlXfVK7tLpMli7vTqGFggzZK9GOTqFqBZTAyzts46LWuJGFh4PRCRJA6C--tfZdh59HAQe6rVOlP9BY0n9GId4Y5oxCWBFJRUV', 'O', '', '', 'JxfQw21Re8hcbwHIqZAF7zgNwWM2', '', '', NULL, 1, 0, '2024-10-17 13:09:59', '2024-06-08 09:21:41', '2024-09-25 05:16:43', 0, 0, NULL, NULL, NULL),
(182, '@demo', 'Lablum', 'Demo', 'demo123@gmail.com', '8984277134', 'm', NULL, '1718178162.jpg', '$2y$12$S.DZZ4Jw8SY1sUi5SHwcvO2ejRYC3GskeWTf1z.Hg9jCYPs4i4ZD.', '2000-06-01', '', '', 'GEspmRgYrsjIP9vD6l1zM1LXqNIcdtxDqt6zxiq1612qEjdFETRXr3V32CrY', 'cnW5VEiaQTC2Ws1gUJdFSB:APA91bE-iosfHeR_eMFoQb9dmeliVEdfx5P5ZCEptz9SpDU0PEU9OFRfDUOGqrgesQqxheCugfMDXubXe8ZS-xXPRj7q_Ev-GyHyVUKJ42Zag_oPLe70umHJ94sySF-F06rhvZ2aQ9t-', 'O', '', '', 'RwkLsrbKuKc04I11CRmifg0KAZ02', '', '', NULL, 1, 0, '2024-09-25 02:03:13', '2024-06-12 07:41:59', '2024-06-12 07:42:42', 0, 0, NULL, NULL, NULL),
(183, '@universalboss47', 'Universal', 'Boss', 'universalboss47@gmail.com', '6398076321', 'm', NULL, NULL, '$2y$12$3TBt94oBqUiqp7n09WXLB.KUF2Xec6oJld8DmMJE4CoHKG4V3CcQG', '1988-06-19', '', '', 'eK4ZKczSskMRNKGGiSvuvEiYLFqovBIoBbpHkxpQWtamai59aTclOKocPwts', NULL, 'O', '', '', 'cmFHYyad8JU9HCL2sOBgTeIab4H2', '', '', NULL, 1, 0, NULL, '2024-06-19 06:11:17', '2024-06-19 06:11:17', 0, 0, NULL, NULL, NULL),
(184, '@dilmaangemore58', 'Dil maange', 'More', 'dilmaangemore58@gmail.com', '6398653702', 'm', NULL, NULL, '$2y$12$DvZ5iB7ckniteBTPConvM.4x31k46WFkOxyWcgXIH0eApPHy6e3xa', '2006-07-13', '', '', 'g8bNF3heABfp73XLOAjtRhyL1C1xbRjCjTp1S5PEroqJBaMtoA2CAa9XQwux', 'fdjYzDmMR3OVSzWAE8jmb0:APA91bE8AMhlT7gTVolUvgLxBSAIwdTeKdnJ4pzqppgz2RPdhNK6fm8sy9nUltH2GliYFKBWnavjs7Y8PW9KrwqTitq7XEhqzb8TxV0Ebf1c3GJB_3k2VjURXSiIQD6PwN3_F3-SmVaQ', 'O', '', '', 'TRHWxZC8zZZwe9JsfW0YaxhE6vr1', '', '', NULL, 1, 0, NULL, '2024-06-20 04:25:19', '2024-06-20 04:25:19', 0, 0, NULL, NULL, NULL),
(185, '@laxmi0714', 'Laxmipriya', 'Nayak', 'laxmipriyan08@gmail.com', '7978895983', 'f', 'hello 🫰🏻\n14/12/2k🎂👸🏻\nfav day 7/sep❤️💕\nmusic lover 🎧🎶💕\nArtist 🎨🖌️🫰🏻\nLove to sewing 🧵 🪡 💕\n\"Sewing my way through life\'s fabric | Fashion enthusiast\"❤️🪡🫰🏻🧵', '1719497215.jpg', '$2y$12$XyDKsVfHLRtMNoTD9w5nBOOIW/u967kzdBqetgP.omiT.X0lNyX4C', '2000-12-14', '', '', 'ScXS9qihgCwjmhq9bHdjkVYRz9K5426BlFhQ3PMI60fcP9SzqputQWnL7xTo', 'dGxfzl8zTJyJ3jLuk-6YzH:APA91bEiAQWyjx7OAw7wgojgFYBQkMxQVbxWtsWkS3Oa5mafil8jJXRavhcpAd1FRFlceOdEgEgeqCM6fYqshAbT-Nnu1ebZifr_C0aWWRMnEqw9aF9PhLPT24GsIjj_JhiLV4Wfg25d', 'O', '', '', 'WuQRxdjZ9oVvaAPgQvMtzPkH0032', '', '', NULL, 1, 0, '2024-09-23 10:02:47', '2024-06-20 04:53:48', '2024-08-03 17:46:57', 0, 0, NULL, NULL, NULL),
(186, 'ashirbad@123', 'Ashirbad', 'behera', 'ashirbadbehera691@gmil.com', '8480135738', 'm', NULL, '1718880063.jpg', '$2y$12$EgrHPcw9.d7FHswVXWM4xONwZ6V2BNKxPOFzJg/pF0BLSjSNiVIxW', '2001-02-06', '', '', 'ZthftXXnbclKYzlbRm46zzorIgfaNfWccemmzpfx0h2XPaxGG3euzxh8PZgu', NULL, 'O', '', '', 'YImDMr9NOKfYKHsXU79LMdiFMjM2', '', '', NULL, 1, 0, '2024-06-20 10:38:39', '2024-06-20 05:06:14', '2024-06-20 10:41:03', 0, 0, NULL, NULL, NULL),
(187, 'rikara@samant', 'Rikara', 'Samanatray', 'biswalrihana@gmail.com', '7008250368', 'f', NULL, '1722013404.jpg', '$2y$12$6kiyCoe9RyTRC5l3bXxRmOU5uEQ/RU/3jaKP0VJ9eNQVZRTHqThEm', '1999-08-06', '', '', 'D3LkRjhjNJGUkFaEKzjqCKRgtmvtLrvf2FxzDiwBsRYYmi5xzde7Cwd7XLCK', 'dH8QgJr1TtGJ8H4KLer-sg:APA91bErMJLI8eEWKJ-95GIB18fqCLgbIJi5ZxGnQgUe5oO2wUsDtgCgzYstMvIliLCBLVQscubDhfeUvbsgot42Q61cZfARTzYlGkteq80SXIm6FVm6UvokBFXYLhlr3HuB0jAe3ES6', 'O', '', '', 'gfSgPlF0FJM71IejNks0LYOw9qY2', '', '', NULL, 1, 0, '2024-08-29 16:30:13', '2024-06-20 05:06:27', '2024-08-29 16:27:23', 0, 0, NULL, NULL, NULL),
(188, '@prabhat', 'Prabhat', 'bhoi', 'prabhat2000@gmail.com', '9348941650', 'm', NULL, NULL, '$2y$12$a2e0kJ0gX2VyfMePea01J.BzFFtJSZvKFS7Tq/weMR/OW.biVA27i', '2000-12-07', '', '', '1PCUZtfPck2jT8uh26prIZSaA3hQHf8cNMQGJvjMLolmiWwTu8ozM0ytO5Ay', 'ejg_RmHhQRuQUa48kol8xC:APA91bFfnM9wjYg2V78MMtMHXsVDxKrwRV4m6v8JFdxDuhUcAJkx1qMo7PzgSJC125VR5bvISWRK8EpykO5bO5iu9hDzwAGd_JzQwgShde23zZ2UETrCImVTxsk6rvodJ6oKViINxpr3', 'O', '', '', 'O2vER52utlf21QaT9oOEKQAkpmv2', '', '', NULL, 1, 0, '2024-11-04 06:24:56', '2024-06-20 05:08:39', '2024-09-16 09:26:36', 0, 0, NULL, NULL, NULL),
(189, '@bhumihar_chora', 'Ravikant', 'Kumar', 'rks9546vskp@gmail.com', '6204577138', 'm', 'Software developer', '1719287743.jpg', '$2y$12$9dHeiz4m7C9yXMpiTup7XezlSfEWIPktsPSVGa9jfGZUHwpwYPYPy', '2001-08-12', '', '', 'eu44UAQQXucRtdOoRNBcVmwumb8iAwClZY4srpowrGdQDZtfh8Edo4rJZXcU', 'e2jtN1FMQ2iAsYr74sBDzc:APA91bHHUNJrO_--mr1OZmMscMELqnY4_FEds9jd8s48XyTOd8c1epg0Q6yHFaWpHDFosdXhmhNeBvRSnBwhXy1_V7lGvACsEJkigUSYKwSsEu64owOaNZTitlBWYjIJPAViWpRQsmWJ', 'O', '', '', 'QiAth8fP8pN4L2GX8MBwqtJUDDA3', '', '', NULL, 1, 0, '2024-10-07 10:36:23', '2024-06-20 05:11:31', '2024-09-25 16:27:52', 0, 1, '2024-09-16', '785323704432', NULL),
(190, '@crazyxyz', 'Crazy', 'xyz', 'crazyxyz58@gmail.com', '6372797588', 'm', NULL, NULL, '$2y$12$SnMYW4YbJc5hNDSl8Ihsbe5D5rc3NZshH5maRF7Ynn5BhEIn2zIK6', '1994-07-14', '', '', 'J2VEyX8RrENnjAAl4QBpcvsreqBJ92SpZUwFlqUdWtQWjDBWVK2VGEu2OXFP', 'de8sHF3fTCyolPLdewUdXO:APA91bGeQWVqVUlcmShXyYCKn2YdtSbenqbDDu16G6TR_18OfP1SixHjziXaPL_D8fZcWatV_zoyPJib-RcOs1-JCg-BldCNad2ORUCakRO1QWp6pKqfvZJOH_Ckxp6fCKGfbcPeMuoa', 'O', '', '', 'TsbZ6StE4Wfv3juEP4OkOIoS1CQ2', '', '', NULL, 1, 0, '2024-06-20 05:28:10', '2024-06-20 05:19:47', '2024-06-20 05:27:55', 0, 0, NULL, NULL, NULL),
(191, '@mitali', 'Mitali madhusmita', 'Dash', 'madhusmitadashmitali123@gmail.com', '8984236532', 'f', NULL, NULL, '$2y$12$9/HFbFh.bo.OZ4.7OslxIOG5uynm.6EvoVNFOTPTqgjf6kyjzqpnK', '1998-05-05', '', '', 'iZfNCR1zv1eD33uIpIFO55wlxORUvYfxIxpIQPit5nRw455cwnDMujaJxfSa', 'eV101iqsRzibmi5LbIBF7o:APA91bFdl3zPsORv2qEj9MtZ7hdD7P9OAmrbeu2XgGbQ_ypme4GPvhfTZkRy8PQmriHBSVU9JDauUlwpWG2W0GjMKuH9ZChoowHM_ibHc6KrHE9QEGVyxfw7tlZWNiPKElmxRt2mbT1I', 'O', '', '', 'D1z5EfcN4UNdMYDyaYe5tZjEE5o1', '', '', NULL, 1, 0, '2024-08-23 14:31:29', '2024-06-20 07:14:52', '2024-06-20 07:14:52', 0, 0, NULL, NULL, NULL),
(192, '@rashmi', 'Rashmi', 'Maharana', 'rashmiranjan.maharana@gmail.com', '7972222500', 'm', NULL, NULL, '$2y$12$qJjQJWm8iCmbaG7SOqtJRuh6yJYVM7VcnJXy93sjvh9tcm9q6XCJC', '1985-06-26', '', '', 'gKbZYZ1S6GD4Jy4yvnquWlq1uyE1JCH7IzWgjWL5HL5QlfmYb0Krk1GP9AtE', 'cKx3N-oeSFaUv4p5CJipk4:APA91bET0eddoM89RMUQWUfEd8j7M1AbbT5GkFnlJp5HrHxA8ecGfvHrfpGOCL5rgI2RJNbt1Kgk9wSFa4rRj_QRA2Mo_YPRY89LPqAX1jKGdNYGY6S456Y_woEtcjhfvpGOP42Rn89c', 'O', '', '', 'TyQmVArGIueWEyVh1m5wVvozm652', '', '', NULL, 1, 0, '2024-08-23 13:00:14', '2024-06-20 17:00:34', '2024-08-23 12:59:26', 0, 0, NULL, NULL, NULL),
(193, '@abinash', 'abinash', 'pala', 'abinashpala@gmail.com', '7809514975', 'm', NULL, NULL, '$2y$12$pREu20OV36B0lQ6UjWDYieTQea/eWDog8XSgMvMe0/GvHen.T2dcC', '2024-06-01', '', '', 'MpNWKywMoAzYPeoGJbnP1GZmIocduYqv6aWE2QNntPWV16o6aUYFY52TiCCT', NULL, 'O', '', '', 'zRjJbv8YWJNQSH05ZIUxXujSWiA3', '', '', NULL, 1, 0, NULL, '2024-06-21 05:39:18', '2024-06-21 05:39:18', 0, 0, NULL, NULL, NULL),
(194, '@apsdp', 'APSDP', 'Solutions', 'info.apsdpsolutions@gnail.com', '7653831475', 'm', NULL, NULL, '$2y$12$SOO5v2OiOsghbxocQd4xK./uZErQP3McMkKnvUDHTHXoEF8znnQPC', '2000-10-01', '', '', '83NQ6ibALNng6lbvmxqN4KFPCkV3tiC8tGKKQPBWJNcjFfUnbc4VnGdrkouF', 'dxEEDPnUT2aDUQmPOc1rwz:APA91bHoLTykM9VnM1by8YGaRiNs8aGMvmQLma-lrwFImialQuT9HIdIEeNLDvPA2HadddelqL1qddVPeteKlV7vEsid5rsG9Zju4hy0LIUOGKJOntwD4je6QA6S4Da5G-JNWZR8CoM1', 'O', '', '', 'fj2ud448exN35CgusbESEpIUDvc2', '', '', NULL, 1, 0, NULL, '2024-06-21 07:25:33', '2024-06-21 07:25:33', 0, 0, NULL, NULL, NULL),
(195, '@padmalaya', 'Padmalaya', 'Das', 'padmalayadash204@gmail.com', '7978180664', 'm', NULL, NULL, '$2y$12$uaxrbYZ..vnp3dmbh2Ye3uIdgPlRf9bJtmC3PkDrc.O.c/tlZ535G', '1991-10-02', '', '', 'zZPtSoemAjivzESycFLLk17fVI7kYRRcB45IVH1NuOLuhNRLviXulCZ81576', 'f1LNxoRFRa6k1Jetq7vGE_:APA91bE8XTevrxtZMT13jWOJZdVbVD_O-_4Q50UvxtP9pW9M_WKpMthJ4E69CL8BZOyUpVIBGsW6tlsqdmwYt59tiX1VxPOrUeB9EPbU5MmbuU-PsUFbrPrk818LYSsHDHFYN8Ef3u9d', 'O', '', '', 'eKRMgLNBqHXNatx63wA1o83p3W33', '', '', NULL, 1, 0, NULL, '2024-06-24 05:37:00', '2024-06-24 05:37:00', 0, 0, NULL, NULL, NULL),
(196, '@pradosh6290', 'Pradosh', 'Pattanaik', 'pradosh.hexaphor@gmail.com', '7008361554', 'm', NULL, NULL, '$2y$12$xOJGwttxd7AvtNTSiM/fTe53hpHXBzV.0Mkj4K97E3PdtWaRFt1jK', '1997-12-05', '', '', 'r7dhl2PSb1mkSpdnAKSkGiTSKurULLna509WjBl90OxPF2hKTzcaw55zCHPm', 'fkJrUE8SRayRh0Lmdilh8S:APA91bEoV_NrG1XmQFlb-bcFuCiIw2Tidbd9p3yES1fTDulNOrv44LS9oe8d_TvokYktkQ_jmpUEHRqaL-VyTEO_9FfjMvTxopyFGOBVD1H57Te-i6KKlkEB_dm9LhcCHpD1PCQZ8XG5', 'O', '', '', 'X71UDgtbI0UDrl09i5jcogx52sd2', '', '', NULL, 1, 0, '2024-10-22 07:29:56', '2024-06-25 05:01:20', '2024-06-25 05:01:20', 0, 0, NULL, NULL, NULL),
(198, '@tarun_k_sahoo', 'Tarun kumar', 'sahoo', 'tarunsahoo2014@gmail.com', '7735337054', 'm', NULL, '1719897370.jpg', '$2y$12$R3ZfxS3PBZ4j4bf0R7SmDu3xYbpmDnozlaKBWF5XUV285IyPc/Om6', '2001-07-18', '', '', 'q6dZC3KG0dJh2kEgXGIfBaheymkConHSDELH3JfWNNDTJujgnNIX0s9ynhT8', 'f1HyHLYwTZGLtllqvwueW6:APA91bEwZIethZLfk0DnaRfzI8Ikr9_UA6ySWWkhWaOKwl3j8jLAS5SSvsfBOVqA-3brcbP02OJl-jvE-7RtzPWLFuu9yhJXQLcBraxXhp4jDt2-nY2QfuXtI_tLAqpUgbluBViKNU7x', 'O', '', '', 'qOsop889NCZo97YbfA7g2Kn8DrD2', '', '', NULL, 1, 0, '2024-09-25 04:49:07', '2024-06-25 05:17:37', '2024-09-16 10:57:39', 0, 1, '2024-09-16', '460652879060', NULL),
(199, '@johny', 'Ashish kumar', 'Sarangi', 'ashishsarangi1994@gmail.com', '8917244158', 'm', NULL, NULL, '$2y$12$.IRGlRy4CNX/WJh6z7iYUOvpV436pAzEDk7.N96Y9c9cxEwmXzEEy', '1994-09-11', '', '', 'wglLrc5inATh81Nhv4MyxmIcc68fQ86YDpekwCPv8UEuIItGoSDEI6rwLKjs', 'fc25rE8KS_q-FWsQPmdS-h:APA91bFGoOpt5Scp_8ERz5XyJiImjx0ih48_7-V5Kn6k2AQ78K8peqItnR5CzPBuZ73OySbY1798JkeZKvDpqNK40nUM12KkAytqofr9Dg94DtHVSX-raUHeULicFtRsV8YnVxfdvOb1', 'O', '', '', 'h0QpP5vfqfebme1nSK2vwn0sfkK2', '', '', NULL, 1, 0, '2024-08-23 12:57:17', '2024-06-25 05:18:21', '2024-08-23 12:56:55', 0, 0, NULL, NULL, NULL),
(200, 'ayasakanta@123', 'Ayasakanta', 'Mohanty', 'rockymohanty42@gmail.com', '6371407520', 'm', NULL, NULL, '$2y$12$h5QTnUD4Snh5n.SV2wGcTu2jYUbHt9iY9.WOIjisn31Gzks1Obj7K', '2001-02-04', '', '', 'ciUbzoPZNjFzyLCu9KfiybxgICi38aMQeWVddLWVKhpPKyg0WB0Hy6H7LWui', 'fafnI53wQoK5k-Musd_tz-:APA91bFxxpp4Ihq4sl4x9Ar1bcyQEqlFD0Jtgcyso9TaVnzOqnfYtNwxofIezFQz-bYUfuqaU5P8q_jO7i_xrSR4tx0zXEC3sKfIaXLpX07EGmhlIbJ6BoEYWhdIviSmxjnUKYulIKGd', 'O', '', '', '332zgQBhEaVbZWjDFPqmLZerSW33', '', '', NULL, 1, 0, '2024-09-16 10:51:38', '2024-06-25 05:36:28', '2024-09-16 10:54:04', 0, 1, '2024-09-16', '785801995930', 'FWNPM4554B'),
(201, '@saleshexa', 'sales', 'hexa', 'sales.hexaphor@gmail.com', '8328915782', 'm', NULL, NULL, '$2y$12$qxFLVzGX0x02Jv/PtXKVGOJoF3lTXcfHG.RY8MO3Y/tpBMPRRTo9G', '2000-06-25', '', '', 'xbpY2mI2w6TUDYtLpQ8Fty6wuF3dByOPf7k6jk9XjPEmGJzgHP7PY35mHILK', 'eRYQGYgnRfuNIm_GLGxlSJ:APA91bHbZp43K9_TLREheUchm11FnfO_2Nomb8dK2kZUddN_MQjE7rS7iH8fF0Wwih9bHv4ubsXk-qRSf4yvy9PJ00tEyMRbBij6xIU1j5cjaOYZRRa6SRyRzhxeL_s8u__Q9N30EJtL', 'O', '', '', 'Gc4ZuMTomLVw5zUDF0AdVVzfTek2', '', '', NULL, 1, 0, NULL, '2024-06-25 05:57:08', '2024-06-25 05:57:08', 0, 0, NULL, NULL, NULL),
(202, '@techcutiosity', 'Techcuriosity', 'Technology', 'info.techcuriosity@gmail.com', '8984277127', 'm', 'Digital Transformation', '1719408729.jpg', '$2y$12$le.0hJeBdpO92Y.2/ScXmuk/WCqL06Wlu5oandWwkZ1d2.7zwRGhW', '2000-06-10', '', '', 'GKA5XhheuWIfuwChJhbHf7t92QcJV2G5mro7Qd16ONZzpZaG9pPuLOVJIQL1', 'eopRmkZcQxaINaL3v76vWL:APA91bH75ex0rkkt3EguppohonXWy6zctJ4QrSbm8-QcshUmRunv0Hp2mhwe5qSw_uTAVhHvoZ49N0dWdgAE_gToAHHbLIyM86t52gCAPi2qwMgGJuCaOh5nBjtuYSUh0rMpsAWga_Xb', 'O', '', '', 'pfcYe1CMC4X6qarHL349w3Ca7Pw2', '', '', NULL, 1, 0, NULL, '2024-06-26 13:29:53', '2024-06-26 13:32:09', 0, 0, NULL, NULL, NULL),
(203, '@dipak', 'Dipak', 'Das', 'dipakkudas07@gmail.com', '6370924881', 'm', NULL, NULL, '$2y$12$PkQQK1gyAYnWDnE/GVIpFuWhVm3Ahx0sIyAGOapRKp8kwb1hk8Jsu', '1991-08-22', '', '', 'hnrZTr0IJbZFG1A28OcRC7H4wQYkWB892MRXNVT8IAZjD60dlpATdAIBLFCj', 'cKc-nUZGS5CgUEAmgcSHnA:APA91bEysuLr0Uds10B32QNdrWg7Txw7wA6stPWX_HBg2-3QXUfmG5T9OoxsAXHAZSp2RsnePgMfj3-16fgNqYEb5RYo88-yeaH9Qnj2mdZSNoFcxKA6Pw4WzzacODbWcSCdFfx1AKC7', 'O', '', '', '0mHPKlca8wQh1o6e75e21XaQcWF3', '', '', NULL, 1, 0, NULL, '2024-06-27 04:26:48', '2024-06-27 04:26:48', 0, 0, NULL, NULL, NULL),
(204, '@sonali', 'Sonali', 'Nanda', 'sonalinanda0205@gmail.com', '9938003538', 'f', NULL, NULL, '$2y$12$fqriUsHR4uElQHYDfSLuE.cYsisvdPWgJpmpgbg25GVTvR08wF54S', '2000-05-02', '', '', 'm2pwqxs9DPBKpxCwqoBaaDdtD3R9WqGDQxi1UxWAOhojVuQ2UrwFFsX48YuK', NULL, 'O', '', '', 'mkqNLzKCAXMQ5NvE5OqOSLBSlsz2', '', '', NULL, 1, 1, '2024-08-16 08:41:49', '2024-06-27 05:39:33', '2024-08-16 08:42:21', 0, 0, NULL, NULL, NULL),
(205, '@smileymistty', 'Smiley', 'Mistty', 'dashmanisha72@gmail.com', '7751919788', 'f', NULL, NULL, '$2y$12$Dy/ppgfy321t00ePSPvzleuzev8EHVr4HR6GOKz9ATMGHobz4RJqS', '2001-08-18', '', '', 'vz8VUr0hwfVIhuq72ODGsuaqz38FJvRas2BAhyYv13Cg5zXY6QMqeJkJkQt4', 'd9esw__JTSuGIyxNmtXm3t:APA91bHrcjs7Mt-ZEFOtmfNQfu4B-kV6i0ii9F2h_VI4GA8O4vgiPcbfoOaXYzSFWESau-BrdKno0CrUKpKjpH2XS8p2gWfhRWIPj_M0taFd0pObPhMX3qO5q2CUzpWRGXxkrb8lCiXy', 'O', '', '', '1WMJg8qAcSONscZE9c3dXJtfSVf2', '', '', NULL, 1, 0, NULL, '2024-06-27 15:40:00', '2024-06-27 15:40:00', 0, 0, NULL, NULL, NULL),
(206, '@barsha', 'Nimai', 'jal', 'nimaicharan9556@gmail.com', '9556016772', 'm', NULL, NULL, '$2y$12$x9rUhwOw6o8TKoPOfbDOM.JHfvfEbrgX//aRKw.a1805mqGJMI.my', '1987-08-14', '', '', 'CIjb9AljxATxhKmyvaxMDGDIm48kYyUCOmQ9XNr33KghiEXBIDy0MAIPHeu9', 'dYV25hBZTDG0ZIVm7NFfbG:APA91bGoRN767I6Fom0zx6tceyh-Kj70nYx7mQ78J7KnItQvTv4Lwk_qItlY--GWAmfpKjlawiqmyhEI-kWql0YFNmHVR87K3nZ5Y6Zil8_fI37KJjN4fEgZriVRfknE0hujyAKGJZPm', 'O', '', '', '3GsphVmkLraixj0ZjlxMBl6rCVm2', '', '', NULL, 1, 0, NULL, '2024-08-08 10:26:48', '2024-08-08 10:26:48', 0, 0, NULL, NULL, NULL),
(207, '@jhilinayak14', 'Jhili', 'Nayak', 'nayakjhili33@gmail.com', '7978308554', 'f', NULL, '1727266600.jpg', '$2y$12$LN2xeVGMX92DEQHXoFofF.L8l3pC70R4QoudjQHDK2Vev2x1Q0KX6', '1980-10-05', '', '', 'fyOp8DrsC9dYMFtDC2mVVnPAU4VRVWl5OI5WlCCY5JXeizkO7ZVpQaLfM2qR', 'fyX9DV_rSyCxNvmaN0_dMe:APA91bFWlTOyCQHLsutuV32eMx1Gwharo5mbURwv93qrl2ulL5eDYY-tQVngTnqzKwc81JSDIsxzoejYOmFOc_f632-WpJPrn1fNtSNevo6jugZHWioINrVqcjKoi2sDZxPe2g4cknR6', 'O', '', '', 'WTw2tcV3gFSRdQvRUcml7ujSyvv1', '', '', NULL, 1, 0, NULL, '2024-09-25 12:03:58', '2024-09-25 12:16:40', 0, 0, NULL, NULL, NULL),
(208, '@arvind', 'Arvind', 'Kumar', 'arvindkumarissuperman@gmail.com', '7665275982', 'm', NULL, NULL, '$2y$12$B3swK3bNusoGKE2veABYrex4PLXnXkjbdbKbZ7I47Sli6omz5efTq', '1999-09-25', '', '', 'jL5tjJ9Ot8B523VOLv9vgEMKsAe7wXtqDWNswu5Me5IhwOWduhoqrEs6ARTq', 'f_Lq89QfSDe2tjookZ9tp6:APA91bGHMg_SElylQ25LF0ME8LmCT3toFXOP3uVZ0qAkCB-aK8kOYBw0azq-VlmnvPEXXZvu98zzJ9SVwrHRfRK2gsf1d3BGo7twca06mJG4xtcV50L_kBIZLX6GWxD_im-jq1pl0bIw', 'O', '', '', 'YGcoebTZpyOGqISyz8r7oHuyfy22', '', '', NULL, 1, 0, NULL, '2024-09-25 16:27:24', '2024-09-25 16:27:24', 0, 0, NULL, NULL, NULL),
(209, '@bharat', 'Bharati', 'Biswal', 'bharatibiswal@gmail.com', '8249857950', 'f', NULL, NULL, '$2y$12$VfPX7jPHLfvYb/TBkRJFpOOAyQ3hJZQl0l5A9uo6ThBCowV.FQ3Ba', '1989-09-14', '', '', 'i2dO6dhO9hFMrXLE3mdQ3vtAwVhoHcf2Ys9gX9zboopBH1xXPxSl4lrQcUSt', 'dkQZnwkfRS2oTQ56NmhFK6:APA91bH8ICfrUXvdh7uef-T4ur8HYlg0E1y9wFQdtDY-VCpuu0hVzdQNwS4JaD-BIpj_NZJRljcTrPlccP__Cck85tK2ENuOe8OUSzpRp2TqiukBbjzfKzazHJpKZLdW8j28_dmUbPmY', 'O', '', '', 'Eg6h6vbDsqdBIgIskpGd50iE20u2', '', '', NULL, 1, 0, NULL, '2024-09-25 16:47:57', '2024-09-25 16:47:57', 0, 0, NULL, NULL, NULL),
(210, '@anita', 'Anita', 'das', 'anitadas101975@gmail.com', '9348081369', 'f', NULL, NULL, '$2y$12$py0ln6TzwqvlUMNYECj8EOd3TEr5GO00FytevWoycY5Po6zveEVDG', '1975-08-10', '', '', 'KWRvEgydK87PWOjTlUSJVHNLPMcz0inrTPLFvsJjUunQuagmPzrzMOetgqeG', NULL, 'O', '', '', 'G77t5oFbtgME4tNWrvU7mqr97Wj2', '', '', NULL, 1, 0, NULL, '2024-09-26 16:12:59', '2024-09-26 16:12:59', 0, 0, NULL, NULL, NULL),
(211, '@rudranarayan', 'Rudranarayan', 'Rout', 'rudranarayanrout024@gmail.com', '9556425403', 'm', NULL, NULL, '$2y$12$P9HXEQCbpnOyoqg1m1p7/OyabrvCXdO5e/6R5l0JeLO7odQ7TfiaK', '2006-09-07', '', '', 'OvFseFPZwew1NcNc0n92N6134yF8oqO6b8yN08HjHmap1G3La1CZLhz9sJLa', 'dEqaGtMSRwqqTLrFIgs2IT:APA91bHJBKqjxdcd_o0NHjal7JPNzivI6HdX-sQjKxFYzMDd7IEJ_l16ClwDOjkad3mho2_CbSS7ogDkt83TaFhTcdQh1G1LnPIsgMlqSBNo8CwTQ3oFC4HC0JAg53un520AfFM6JR8i', 'O', '', '', 'LWLt5zP8f0OegvChzXxg4FyVgig2', '', '', NULL, 1, 0, NULL, '2024-09-27 01:08:35', '2024-09-27 01:08:35', 0, 0, NULL, NULL, NULL),
(212, '@aksahoo', 'Ananta', 'Sahoo', 'aksahoo296@gmail.com', '9658738624', 'm', NULL, NULL, '$2y$12$5zwA8an5RSDcXJZEogOFwe929Fv2Vi3K8YsYvjO0JrTpW3U3deaba', '1998-09-10', '', '', 'f7vWJXvq139et5ZuPRBzbxMZNctQPLdBAqpMK08AbEldVDZC8SWiTTaPdrKp', 'euSF5uRrTEu_OFP32986qN:APA91bHH0zCTO3g-cfDW9dgIrBmYAox5xhE-GnRfKBOol8V8YDViV7RuYv97Yqu--vedR0Fh1xQDIRx0bgCxQjmLzB7BnDD0EJFfdqT6dhl4xDnHfGVRb6o2y5Lp9IWci2mGOhY_JTeR', 'O', '', '', 'pBvX4g7iJlgwZ9Zbk0oUVjKaK342', '', '', NULL, 1, 0, NULL, '2024-09-27 05:52:30', '2024-09-27 05:52:30', 0, 0, NULL, NULL, NULL),
(213, '@pall', 'pallabi', 'dhali', 'dhalipallabi8@gmail.com', '7846814553', 'f', NULL, NULL, '$2y$12$RlVX3XOCwlhKlQeNU9W2GeCnpvWy/Bc2rW5m/5tGZR/HmOCpoDDKK', '2000-09-28', '', '', 'jCaE2x8AXjurcdwnEzv2TNFLiatQwKfweWDlpR1zubUJenzuyWu3xN6LXMRM', 'e3r15bf2TYG5B1qdlUvJEC:APA91bGXtXheGwJQFV0qmLfnlmAB17ftMmYWRSnIUwRt8ji4fez-2AlLp9hsKpBu2K88_kk-FNlFZQ8eHCWhdATsafFrkdA-aGUMvVq7D68mJ1tkPUHLud_kM15kzEqpDtYACzbKdXVO', 'O', '', '', 'IR6WMHVpTsQ7cAcgXFUSf6uiMLu1', '', '', NULL, 1, 0, '2024-10-26 08:46:53', '2024-09-28 06:25:36', '2024-10-26 08:46:26', 0, 0, NULL, NULL, NULL),
(214, '@pilumiku', 'Arpita', 'pradhan', 'arpitapradhan0414@gmail.com', '6371333582', 'f', NULL, NULL, '$2y$12$TnxCSc6f7/GhivR1oD6nve685uDGb6YGR7jp86KtEHaS2x4VKBgdG', '1993-09-22', '', '', 'hxynkYD7CZMPSDdet6BsO9BslDCa5iq6Ywf7ZWYDYVp4u40CU0ysjwoBdAaE', 'egN8vEq8Q6uuMVyKOvoctB:APA91bF3Z_lE7UQN2StrqO49mGiVqeNgESwRSx4mwwWorjNWPyVz7KLtI1vJTxOIjMV8tfqM6FMJOkA51JD3z7eaidg2LOT6G15zbl52e2XFnb2-We4YKvnMOPPX4B_n6RI2j08R11w4', 'O', '', '', 'oeyyWfEOFGN3PxLzOkZVcGA0BSX2', '', '', NULL, 1, 0, NULL, '2024-09-29 09:49:30', '2024-09-29 09:49:30', 0, 0, NULL, NULL, NULL),
(215, '@hello', 'hii', 'hellohello', 'manjugupta4001@gmail.com', '9942980277', 'm', NULL, NULL, '$2y$12$b1DMrb59y8LzIrrI0OCXB.s/Rb4Q4w1Z/BIUVEdjhTuvxjdFRXzoq', '2024-10-07', '', '', 'KlQff6wTCaMv1ZnEXmNjhWu6pksTtgRG94fUCpkzppozcUdVdoFMSV9Y4M2D', 'dDcaV-xkQ9-i-HaJOrvzd-:APA91bGDeJutBlrrCnwPrkShgwcbWZDKUhROjgoNURs-_OIHVeaJUtXdpBOb9ah0R-X-chCXo01LfwxU2n8yEG4odIdjgWb1cMIo11v_eB0tGb3aLYFZ0i3VmBR_ygPkskUC80PdAYFB', 'O', '', '', 'GMcOoCRyXPZ5Rj3Y0TNtjDQVbNt1', '', '', NULL, 1, 0, NULL, '2024-10-07 13:15:45', '2024-10-07 13:15:45', 0, 0, NULL, NULL, NULL),
(216, '@nskteamind', 'NSK team india', 'nsk', 'ohomastiimasti@gmail.com', '6266322897', 'm', 'hiii, i am new please supporting guys , iam short video creator and watcher', NULL, '$2y$12$GbSAe8bBvA0zR7m/IVXGtuUvejTQcfOj5CTF9x7FHSsHLb8caU1hW', '2024-10-08', '', '', 'd2Uz0fCFjPMUwOwh2FdIEtc6zS1JbxppFz2yCY2kfHSLOBIg28LeRMrbhpPx', 'dC9IlWMrRG-VV-HR0IRu_I:APA91bHMJQoRaqgCL4rekEjeHOD2Qb-P4Xs4ieGORyKjpwpUjHDToBX-v4gVdGjhkhIeCrkKORDHXXZ6ExaMXA07ovMZssbq9YGIm-cRlQFNfcU43c9QQRD6sapVx2IssiLDG_BMx8a5', 'O', '', '', '6YbdyBy4SggWHcXNCNP4V1IlwT52', '', '', NULL, 1, 0, NULL, '2024-10-08 00:57:31', '2024-10-08 01:01:37', 0, 0, NULL, NULL, NULL),
(217, '@dukepaul196', 'duke', 'paul', 'dukepaul196@gmail.com', '8917470136', 'm', NULL, NULL, '$2y$12$Mro4j1v8d7C9kKl59up6JeWzGDqTkDKy54TdNSs05oFfr/HkQPJ4m', '2008-05-17', '', '', 'jwzExRHgd6vrZprd4mx9yQ99xHTUG1NoKKJsaLzgdM32D2ky8qRxckCaqg5r', 'ex7PLaJuScuGRPZzlFzQXV:APA91bFiFvIB21sz0I2yDvoSnDaHMogQcZVNeGPjsdGa6KS3QuOwB4oRRXwRYeeE4EniRHPVUxMf_mhy56BQin-etM7BYkX5kAeDtUqX9n6IJ8SsqUR8kKlEYFwhW6iV7-XxC0-Iaxrb', 'O', '', '', 'C6cSkAqNrgeD5s6dGYFWv1u1nBi1', '', '', NULL, 1, 0, NULL, '2024-10-09 18:59:52', '2024-10-09 18:59:52', 0, 0, NULL, NULL, NULL),
(218, '@gamerboy', 'pratibha', 'devi', 'manjri638@gmail.com', '9341058281', 'f', NULL, NULL, '$2y$12$Q1/Eb.nrjqQc8KD81ZaccOO35ue52iCT0s2L39c.YwE3Iuda3J0BG', '1987-01-01', '', '', 'sUAJm2d6VJTdMH1Re81KAjsEPPJHYz2aciyXWuOZqDI5IqOeGzIhq9Lz1DNd', 'crgzl5_7Q4md0w1QyTY9vQ:APA91bF0T2lc8fofi7jjcoS4r8TqVWrNOLctm0Is38eNnYtWPF86066BVAhOsU6CoM5POdOLVARnSDGEbXJTZrueT0v8uBqhNwNJ5t_V7C86i84uiAluxiaW6GFFK2Mdl3FLM4fJoBCI', 'O', '', '', 'Qq9u2OM1mrSe48tyq4tfzk4fImX2', '', '', NULL, 1, 0, NULL, '2024-10-12 02:57:54', '2024-10-12 02:57:54', 0, 0, NULL, NULL, NULL),
(219, '@amitsh', 'amit', 'sharma', 'amitsharma67678@gmail', '7570049730', 'm', NULL, NULL, '$2y$12$YKAqGh7hsiDQw2kAcRpd/ex82lZFxufranas7pBIfhuJvCvqJrwN.', '1996-10-20', '', '', 'EOCdhorUC6Cvtw16KvIUGLnopetulBZ3SBNoNhyIpPQ1NuH2spGVgiR8cdyb', 'fBw7UJrTTFuBQymKXzAeWz:APA91bEnY1JLNg6hve7e6imTndNTe1KIcU_DCUua5yssjXqcklRu9K5IwAfLSC3h4dXt4LJw3gFetIoxPu6hV6aOXlF9yaqTahdLjegvIGFFQ6BtwqmR_FWT9_uG9soti5BV9gEA2YzW', 'O', '', '', 'AMZERjii13R9uzLn37DyzQr1sOT2', '', '', NULL, 1, 0, NULL, '2024-10-21 11:50:59', '2024-10-21 11:50:59', 0, 0, NULL, NULL, NULL),
(220, '@thegamingboy', 'thegaming', 'Boy', 'themithun1@gmail.com', '9664589082', 'm', NULL, NULL, '$2y$12$b6dqI2eCjlN425KJFZye3uegPnHYdha6r8/RBUW68D4OuOfYZtWV6', '1989-11-17', '', '', 'tpb9a8STLyYxrMu4HPCgIFsbRm54tsZjGKLDx5dYpPOddr5AUitSK1CfUZhh', 'cbSucnkFTfqbqxK-emc_9d:APA91bFJ8sQWc2BOI5YisEmEJEVGh80g35oRWrCKFQgh-0ERfBJXiTaZflY8SL9TOB48o8mjdA8TDVIGkwMew2yz9__FiB3ydzX4f13eOc_UgUvW7uCQ74Y', 'O', '', '', '7U4q7yxylJV1U86TGmu6zqHVbxA2', '', '', NULL, 1, 0, NULL, '2024-11-03 16:08:12', '2024-11-03 16:08:12', 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `verifies`
--

CREATE TABLE `verifies` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `known` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audiance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_type1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_url1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_type2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_url2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_type3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_url3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_pdf` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `verifies`
--

INSERT INTO `verifies` (`id`, `user_id`, `name`, `category`, `country`, `known`, `audiance`, `link_type1`, `link_url1`, `link_type2`, `link_url2`, `link_type3`, `link_url3`, `document_type`, `document_pdf`, `status`, `created_at`, `updated_at`) VALUES
(14, 196, 'Pradosh Pattanaik', 'Entertainment', 'India', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Driver\'s licence', 'Official_documents/swkt7jXxy3QOaSplpKwklBRBEttCx5onpLkzHQiv.png', 2, '2024-09-19 13:47:38', '2024-09-19 13:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE `views` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  `add_id` bigint DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `views`
--

INSERT INTO `views` (`id`, `post_id`, `add_id`, `user_id`, `created_at`, `updated_at`) VALUES
(14, 35, NULL, 189, '2024-09-16 12:16:17', '2024-09-16 12:16:17'),
(15, 25, NULL, 189, '2024-09-16 12:17:24', '2024-09-16 12:17:24'),
(16, 40, NULL, 189, '2024-09-16 12:18:39', '2024-09-16 12:18:39'),
(17, 31, NULL, 189, '2024-09-16 12:19:33', '2024-09-16 12:19:33'),
(18, 26, NULL, 187, '2024-09-16 12:20:50', '2024-09-16 12:20:50'),
(19, 28, NULL, 188, '2024-09-16 12:21:00', '2024-09-16 12:21:00'),
(20, 43, NULL, 188, '2024-09-16 12:27:42', '2024-09-16 12:27:42'),
(21, 46, NULL, 188, '2024-09-16 12:31:23', '2024-09-16 12:31:23'),
(22, 30, NULL, 188, '2024-09-16 12:39:31', '2024-09-16 12:39:31'),
(23, 29, NULL, 200, '2024-09-16 13:00:15', '2024-09-16 13:00:15'),
(24, 47, NULL, 187, '2024-09-16 13:04:19', '2024-09-16 13:04:19'),
(25, 57, NULL, 198, '2024-09-16 13:04:46', '2024-09-16 13:04:46'),
(26, 39, NULL, 187, '2024-09-16 13:04:50', '2024-09-16 13:04:50'),
(27, 19, NULL, 187, '2024-09-16 13:05:16', '2024-09-16 13:05:16'),
(28, 54, NULL, 200, '2024-09-16 13:33:11', '2024-09-16 13:33:11'),
(29, 25, NULL, 200, '2024-09-16 13:33:55', '2024-09-16 13:33:55'),
(30, 30, NULL, 200, '2024-09-16 13:34:33', '2024-09-16 13:34:33'),
(31, 29, NULL, 196, '2024-09-16 13:36:24', '2024-09-16 13:36:24'),
(32, 62, NULL, 187, '2024-09-16 13:52:04', '2024-09-16 13:52:04'),
(33, 44, NULL, 187, '2024-09-16 13:52:32', '2024-09-16 13:52:32'),
(34, 60, NULL, 189, '2024-09-16 14:50:38', '2024-09-16 14:50:38'),
(35, 75, NULL, 198, '2024-09-16 14:54:25', '2024-09-16 14:54:25'),
(36, 58, NULL, 200, '2024-09-16 14:55:03', '2024-09-16 14:55:03'),
(37, 51, NULL, 198, '2024-09-16 14:56:57', '2024-09-16 14:56:57'),
(38, 73, NULL, 189, '2024-09-16 16:04:02', '2024-09-16 16:04:02'),
(39, 48, NULL, 200, '2024-09-16 16:06:33', '2024-09-16 16:06:33'),
(40, 37, NULL, 200, '2024-09-16 16:06:50', '2024-09-16 16:06:50'),
(41, 23, NULL, 198, '2024-09-16 16:07:01', '2024-09-16 16:07:01'),
(42, 44, NULL, 200, '2024-09-16 16:07:36', '2024-09-16 16:07:36'),
(43, 57, NULL, 200, '2024-09-16 16:08:04', '2024-09-16 16:08:04'),
(44, 39, NULL, 200, '2024-09-16 16:08:32', '2024-09-16 16:08:32'),
(45, 66, NULL, 198, '2024-09-16 16:08:59', '2024-09-16 16:08:59'),
(46, 51, NULL, 188, '2024-09-16 16:10:20', '2024-09-16 16:10:20'),
(47, 45, NULL, 188, '2024-09-16 16:10:57', '2024-09-16 16:10:57'),
(48, 22, NULL, 196, '2024-09-16 16:25:27', '2024-09-16 16:25:27'),
(49, 82, NULL, 188, '2024-09-16 16:28:26', '2024-09-16 16:28:26'),
(50, 33, NULL, 189, '2024-09-16 16:29:42', '2024-09-16 16:29:42'),
(51, 39, NULL, 188, '2024-09-16 16:31:34', '2024-09-16 16:31:34'),
(52, 79, NULL, 188, '2024-09-16 16:33:01', '2024-09-16 16:33:01'),
(53, 62, NULL, 196, '2024-09-16 16:40:28', '2024-09-16 16:40:28'),
(54, 31, NULL, 196, '2024-09-16 16:41:59', '2024-09-16 16:41:59'),
(56, 62, NULL, 182, '2024-09-16 17:04:06', '2024-09-16 17:04:06'),
(57, 22, NULL, 182, '2024-09-16 17:04:36', '2024-09-16 17:04:36'),
(58, 37, NULL, 182, '2024-09-16 17:04:55', '2024-09-16 17:04:55'),
(59, 78, NULL, 187, '2024-09-16 19:25:08', '2024-09-16 19:25:08'),
(60, 85, NULL, 187, '2024-09-16 19:25:40', '2024-09-16 19:25:40'),
(61, 40, NULL, 187, '2024-09-16 19:30:15', '2024-09-16 19:30:15'),
(62, 63, NULL, 187, '2024-09-16 19:39:49', '2024-09-16 19:39:49'),
(63, 86, NULL, 187, '2024-09-16 19:43:13', '2024-09-16 19:43:13'),
(64, 92, NULL, 187, '2024-09-16 20:35:33', '2024-09-16 20:35:33'),
(65, 55, NULL, 187, '2024-09-16 20:39:58', '2024-09-16 20:39:58'),
(66, 61, NULL, 187, '2024-09-17 06:32:01', '2024-09-17 06:32:01'),
(67, 65, NULL, 187, '2024-09-17 06:33:23', '2024-09-17 06:33:23'),
(68, 87, NULL, 187, '2024-09-17 06:35:50', '2024-09-17 06:35:50'),
(69, 58, NULL, 187, '2024-09-17 06:38:00', '2024-09-17 06:38:00'),
(70, 22, NULL, 187, '2024-09-17 06:38:19', '2024-09-17 06:38:19'),
(71, NULL, 23, 187, '2024-09-17 06:40:10', '2024-09-17 06:40:10'),
(72, 46, NULL, 187, '2024-09-17 06:40:49', '2024-09-17 06:40:49'),
(73, 80, NULL, 187, '2024-09-17 06:42:12', '2024-09-17 06:42:12'),
(74, 30, NULL, 187, '2024-09-17 06:42:21', '2024-09-17 06:42:21'),
(75, 35, NULL, 187, '2024-09-17 06:42:39', '2024-09-17 06:42:39'),
(76, 42, NULL, 187, '2024-09-17 06:43:29', '2024-09-17 06:43:29'),
(77, 88, NULL, 200, '2024-09-17 09:20:24', '2024-09-17 09:20:24'),
(78, 46, NULL, 200, '2024-09-17 13:54:11', '2024-09-17 13:54:11'),
(79, 36, NULL, 200, '2024-09-17 13:54:34', '2024-09-17 13:54:34'),
(80, 92, NULL, 200, '2024-09-17 13:54:42', '2024-09-17 13:54:42'),
(81, 59, NULL, 200, '2024-09-17 13:58:21', '2024-09-17 13:58:21'),
(82, 82, NULL, 200, '2024-09-17 13:59:00', '2024-09-17 13:59:00'),
(83, 63, NULL, 200, '2024-09-17 14:34:10', '2024-09-17 14:34:10'),
(84, 26, NULL, 200, '2024-09-17 14:34:30', '2024-09-17 14:34:30'),
(85, 94, NULL, 200, '2024-09-17 14:34:37', '2024-09-17 14:34:37'),
(86, 87, NULL, 200, '2024-09-17 14:34:55', '2024-09-17 14:34:55'),
(87, 91, NULL, 200, '2024-09-17 14:35:23', '2024-09-17 14:35:23'),
(88, 28, NULL, 200, '2024-09-17 14:35:58', '2024-09-17 14:35:58'),
(89, 50, NULL, 200, '2024-09-17 14:36:10', '2024-09-17 14:36:10'),
(90, 79, NULL, 200, '2024-09-17 14:38:18', '2024-09-17 14:38:18'),
(91, 61, NULL, 200, '2024-09-17 14:38:59', '2024-09-17 14:38:59'),
(92, 76, NULL, 200, '2024-09-17 14:40:25', '2024-09-17 14:40:25'),
(93, 51, NULL, 200, '2024-09-17 14:40:33', '2024-09-17 14:40:33'),
(94, 91, NULL, 187, '2024-09-17 15:12:38', '2024-09-17 15:12:38'),
(95, 64, NULL, 187, '2024-09-17 15:13:39', '2024-09-17 15:13:39'),
(96, 93, NULL, 187, '2024-09-17 15:17:47', '2024-09-17 15:17:47'),
(97, 52, NULL, 187, '2024-09-17 15:20:48', '2024-09-17 15:20:48'),
(98, 31, NULL, 187, '2024-09-17 15:27:40', '2024-09-17 15:27:40'),
(99, 100, NULL, 187, '2024-09-17 15:29:24', '2024-09-17 15:29:24'),
(100, 57, NULL, 187, '2024-09-17 15:39:17', '2024-09-17 15:39:17'),
(101, 39, NULL, 182, '2024-09-17 16:45:47', '2024-09-17 16:45:47'),
(102, 74, NULL, 182, '2024-09-17 16:47:15', '2024-09-17 16:47:15'),
(103, 97, NULL, 182, '2024-09-17 16:49:27', '2024-09-17 16:49:27'),
(104, 48, NULL, 182, '2024-09-17 16:50:23', '2024-09-17 16:50:23'),
(105, 101, NULL, 182, '2024-09-17 19:08:49', '2024-09-17 19:08:49'),
(106, 55, NULL, 182, '2024-09-17 19:18:20', '2024-09-17 19:18:20'),
(107, 42, NULL, 182, '2024-09-17 19:19:15', '2024-09-17 19:19:15'),
(108, 82, NULL, 182, '2024-09-17 19:20:09', '2024-09-17 19:20:09'),
(109, 73, NULL, 182, '2024-09-17 19:24:21', '2024-09-17 19:24:21'),
(110, 44, NULL, 196, '2024-09-17 21:49:53', '2024-09-17 21:49:53'),
(111, 20, NULL, 196, '2024-09-17 21:55:55', '2024-09-17 21:55:55'),
(112, 22, NULL, 188, '2024-09-17 22:02:50', '2024-09-17 22:02:50'),
(113, 105, NULL, 188, '2024-09-17 22:41:08', '2024-09-17 22:41:08'),
(114, 104, NULL, 188, '2024-09-17 22:41:34', '2024-09-17 22:41:34'),
(115, 110, NULL, 188, '2024-09-17 22:44:17', '2024-09-17 22:44:17'),
(116, 104, NULL, 187, '2024-09-17 23:16:47', '2024-09-17 23:16:47'),
(117, 82, NULL, 187, '2024-09-17 23:22:18', '2024-09-17 23:22:18'),
(118, 94, NULL, 187, '2024-09-17 23:22:35', '2024-09-17 23:22:35'),
(119, 106, NULL, 187, '2024-09-17 23:44:07', '2024-09-17 23:44:07'),
(120, 37, NULL, 196, '2024-09-18 09:09:15', '2024-09-18 09:09:15'),
(121, 67, NULL, 189, '2024-09-18 09:09:54', '2024-09-18 09:09:54'),
(122, 93, NULL, 189, '2024-09-18 09:14:15', '2024-09-18 09:14:15'),
(123, 97, NULL, 196, '2024-09-18 09:19:12', '2024-09-18 09:19:12'),
(124, 94, NULL, 189, '2024-09-18 10:37:53', '2024-09-18 10:37:53'),
(125, 73, NULL, 196, '2024-09-18 10:59:25', '2024-09-18 10:59:25'),
(126, 28, NULL, 196, '2024-09-18 11:12:14', '2024-09-18 11:12:14'),
(127, 33, NULL, 188, '2024-09-18 11:44:22', '2024-09-18 11:44:22'),
(128, NULL, 23, 188, '2024-09-18 11:51:30', '2024-09-18 11:51:30'),
(129, 31, NULL, 188, '2024-09-18 12:07:04', '2024-09-18 12:07:04'),
(130, 44, NULL, 188, '2024-09-18 12:15:51', '2024-09-18 12:15:51'),
(131, 23, NULL, 188, '2024-09-18 12:43:10', '2024-09-18 12:43:10'),
(132, 114, NULL, 196, '2024-09-18 12:53:41', '2024-09-18 12:53:41'),
(133, 25, NULL, 196, '2024-09-18 13:09:16', '2024-09-18 13:09:16'),
(134, 71, NULL, 188, '2024-09-18 13:18:22', '2024-09-18 13:18:22'),
(135, 112, NULL, 196, '2024-09-18 13:22:30', '2024-09-18 13:22:30'),
(136, 118, NULL, 187, '2024-09-18 13:40:51', '2024-09-18 13:40:51'),
(138, 107, NULL, 187, '2024-09-18 13:42:51', '2024-09-18 13:42:51'),
(139, 45, NULL, 196, '2024-09-18 13:57:07', '2024-09-18 13:57:07'),
(140, 69, NULL, 188, '2024-09-18 14:07:09', '2024-09-18 14:07:09'),
(141, 25, NULL, 188, '2024-09-18 14:13:24', '2024-09-18 14:13:24'),
(142, 95, NULL, 188, '2024-09-18 14:58:24', '2024-09-18 14:58:24'),
(143, 92, NULL, 188, '2024-09-18 14:58:47', '2024-09-18 14:58:47'),
(144, 37, NULL, 188, '2024-09-18 14:59:14', '2024-09-18 14:59:14'),
(145, 103, NULL, 188, '2024-09-18 15:06:49', '2024-09-18 15:06:49'),
(146, 106, NULL, 188, '2024-09-18 15:16:08', '2024-09-18 15:16:08'),
(147, 19, NULL, 188, '2024-09-18 15:39:35', '2024-09-18 15:39:35'),
(148, 112, NULL, 188, '2024-09-18 15:53:41', '2024-09-18 15:53:41'),
(149, 91, NULL, 188, '2024-09-18 16:02:38', '2024-09-18 16:02:38'),
(151, 60, NULL, 196, '2024-09-18 16:13:27', '2024-09-18 16:13:27'),
(152, 116, NULL, 187, '2024-09-18 16:18:42', '2024-09-18 16:18:42'),
(153, 103, NULL, 187, '2024-09-18 16:19:11', '2024-09-18 16:19:11'),
(154, 115, NULL, 187, '2024-09-18 16:19:19', '2024-09-18 16:19:19'),
(155, 119, NULL, 196, '2024-09-18 16:22:32', '2024-09-18 16:22:32'),
(156, 64, NULL, 196, '2024-09-18 16:42:22', '2024-09-18 16:42:22'),
(157, 119, NULL, 188, '2024-09-18 16:44:53', '2024-09-18 16:44:53'),
(158, 36, NULL, 196, '2024-09-18 17:02:56', '2024-09-18 17:02:56'),
(159, 67, NULL, 196, '2024-09-18 17:22:15', '2024-09-18 17:22:15'),
(160, 61, NULL, 188, '2024-09-18 18:28:09', '2024-09-18 18:28:09'),
(161, 97, NULL, 188, '2024-09-18 18:28:44', '2024-09-18 18:28:44'),
(162, 110, NULL, 187, '2024-09-18 21:12:02', '2024-09-18 21:12:02'),
(163, 55, NULL, 188, '2024-09-18 21:39:00', '2024-09-18 21:39:00'),
(164, 102, NULL, 188, '2024-09-18 21:41:10', '2024-09-18 21:41:10'),
(165, 59, NULL, 188, '2024-09-19 14:07:32', '2024-09-19 14:07:32'),
(166, 35, NULL, 200, '2024-09-19 15:30:44', '2024-09-19 15:30:44'),
(168, 19, NULL, 196, '2024-09-19 15:47:50', '2024-09-19 15:47:50'),
(169, 35, NULL, 188, '2024-09-19 18:39:09', '2024-09-19 18:39:09'),
(170, 62, NULL, 188, '2024-09-19 18:42:59', '2024-09-19 18:42:59'),
(171, 29, NULL, 187, '2024-09-19 20:34:21', '2024-09-19 20:34:21'),
(172, 120, NULL, 189, '2024-09-19 23:25:01', '2024-09-19 23:25:01'),
(173, 109, NULL, 188, '2024-09-19 23:32:49', '2024-09-19 23:32:49'),
(174, 109, NULL, 196, '2024-09-20 11:15:49', '2024-09-20 11:15:49'),
(175, NULL, 23, 196, '2024-09-20 11:16:54', '2024-09-20 11:16:54'),
(176, 35, NULL, 196, '2024-09-20 12:01:59', '2024-09-20 12:01:59'),
(177, 93, NULL, 196, '2024-09-20 12:48:32', '2024-09-20 12:48:32'),
(178, 43, NULL, 196, '2024-09-20 12:50:57', '2024-09-20 12:50:57'),
(179, 90, NULL, 196, '2024-09-20 12:55:01', '2024-09-20 12:55:01'),
(180, 80, NULL, 196, '2024-09-20 13:03:53', '2024-09-20 13:03:53'),
(181, 102, NULL, 196, '2024-09-20 13:18:13', '2024-09-20 13:18:13'),
(182, 113, NULL, 196, '2024-09-20 13:18:49', '2024-09-20 13:18:49'),
(183, 69, NULL, 189, '2024-09-20 13:58:58', '2024-09-20 13:58:58'),
(184, 91, NULL, 196, '2024-09-20 14:04:46', '2024-09-20 14:04:46'),
(185, 92, NULL, 196, '2024-09-20 14:05:03', '2024-09-20 14:05:03'),
(186, 82, NULL, 196, '2024-09-20 14:05:28', '2024-09-20 14:05:28'),
(187, 40, NULL, 196, '2024-09-20 14:11:38', '2024-09-20 14:11:38'),
(188, 54, NULL, 196, '2024-09-20 14:29:08', '2024-09-20 14:29:08'),
(189, 89, NULL, 196, '2024-09-20 14:38:13', '2024-09-20 14:38:13'),
(190, 42, NULL, 196, '2024-09-20 14:40:01', '2024-09-20 14:40:01'),
(191, 99, NULL, 196, '2024-09-20 15:18:49', '2024-09-20 15:18:49'),
(192, 48, NULL, 196, '2024-09-20 15:22:44', '2024-09-20 15:22:44'),
(193, 26, NULL, 196, '2024-09-20 16:42:27', '2024-09-20 16:42:27'),
(194, 56, NULL, 187, '2024-09-20 19:43:52', '2024-09-20 19:43:52'),
(195, 124, NULL, 188, '2024-09-20 20:35:38', '2024-09-20 20:35:38'),
(196, 67, NULL, 185, '2024-09-20 20:36:35', '2024-09-20 20:36:35'),
(197, 31, NULL, 185, '2024-09-20 20:37:35', '2024-09-20 20:37:35'),
(198, 131, NULL, 188, '2024-09-20 20:42:08', '2024-09-20 20:42:08'),
(199, 131, NULL, 185, '2024-09-20 20:43:48', '2024-09-20 20:43:48'),
(200, 132, NULL, 185, '2024-09-20 20:48:19', '2024-09-20 20:48:19'),
(201, 88, NULL, 185, '2024-09-20 20:49:48', '2024-09-20 20:49:48'),
(202, 87, NULL, 185, '2024-09-20 20:50:09', '2024-09-20 20:50:09'),
(203, 86, NULL, 185, '2024-09-20 20:50:28', '2024-09-20 20:50:28'),
(204, 64, NULL, 185, '2024-09-20 20:51:27', '2024-09-20 20:51:27'),
(205, 47, NULL, 185, '2024-09-20 20:52:25', '2024-09-20 20:52:25'),
(206, 22, NULL, 185, '2024-09-20 20:56:36', '2024-09-20 20:56:36'),
(207, 83, NULL, 185, '2024-09-20 21:04:18', '2024-09-20 21:04:18'),
(208, 33, NULL, 185, '2024-09-20 21:04:55', '2024-09-20 21:04:55'),
(209, 51, NULL, 185, '2024-09-20 21:05:24', '2024-09-20 21:05:24'),
(210, 113, NULL, 185, '2024-09-20 21:06:23', '2024-09-20 21:06:23'),
(211, 105, NULL, 185, '2024-09-20 21:06:39', '2024-09-20 21:06:39'),
(212, 100, NULL, 188, '2024-09-20 21:08:19', '2024-09-20 21:08:19'),
(213, 46, NULL, 196, '2024-09-21 06:56:32', '2024-09-21 06:56:32'),
(214, 76, NULL, 196, '2024-09-21 06:56:50', '2024-09-21 06:56:50'),
(215, 34, NULL, 196, '2024-09-21 08:57:56', '2024-09-21 08:57:56'),
(216, 19, NULL, 189, '2024-09-21 08:58:23', '2024-09-21 08:58:23'),
(217, 64, NULL, 188, '2024-09-21 09:06:47', '2024-09-21 09:06:47'),
(218, 47, NULL, 196, '2024-09-21 10:41:55', '2024-09-21 10:41:55'),
(219, 85, NULL, 188, '2024-09-21 10:42:42', '2024-09-21 10:42:42'),
(220, 68, NULL, 196, '2024-09-21 10:44:35', '2024-09-21 10:44:35'),
(221, 32, NULL, 196, '2024-09-21 10:53:42', '2024-09-21 10:53:42'),
(222, 68, NULL, 188, '2024-09-21 11:12:52', '2024-09-21 11:12:52'),
(223, 80, NULL, 188, '2024-09-21 11:29:20', '2024-09-21 11:29:20'),
(224, 52, NULL, 188, '2024-09-21 11:50:07', '2024-09-21 11:50:07'),
(225, 83, NULL, 188, '2024-09-21 11:53:50', '2024-09-21 11:53:50'),
(226, 56, NULL, 188, '2024-09-21 12:14:47', '2024-09-21 12:14:47'),
(227, 58, NULL, 188, '2024-09-21 12:21:49', '2024-09-21 12:21:49'),
(228, 78, NULL, 196, '2024-09-21 12:22:12', '2024-09-21 12:22:12'),
(229, 115, NULL, 188, '2024-09-21 13:33:39', '2024-09-21 13:33:39'),
(230, 67, NULL, 188, '2024-09-21 13:40:48', '2024-09-21 13:40:48'),
(231, 93, NULL, 188, '2024-09-21 13:45:20', '2024-09-21 13:45:20'),
(232, 50, NULL, 188, '2024-09-21 13:45:33', '2024-09-21 13:45:33'),
(233, 73, NULL, 188, '2024-09-21 13:49:59', '2024-09-21 13:49:59'),
(234, 47, NULL, 188, '2024-09-21 13:50:51', '2024-09-21 13:50:51'),
(235, 43, NULL, 185, '2024-09-21 15:00:17', '2024-09-21 15:00:17'),
(236, 97, NULL, 185, '2024-09-21 15:00:45', '2024-09-21 15:00:45'),
(237, 136, NULL, 185, '2024-09-21 15:01:20', '2024-09-21 15:01:20'),
(238, 134, NULL, 185, '2024-09-21 15:01:49', '2024-09-21 15:01:49'),
(239, 137, NULL, 185, '2024-09-21 15:17:33', '2024-09-21 15:17:33'),
(240, 53, NULL, 187, '2024-09-21 21:19:25', '2024-09-21 21:19:25'),
(241, 108, NULL, 187, '2024-09-21 21:22:10', '2024-09-21 21:22:10'),
(242, 98, NULL, 187, '2024-09-21 21:26:36', '2024-09-21 21:26:36'),
(243, 104, NULL, 200, '2024-09-22 21:35:55', '2024-09-22 21:35:55'),
(244, 121, NULL, 200, '2024-09-22 21:38:48', '2024-09-22 21:38:48'),
(245, 128, NULL, 200, '2024-09-22 21:39:38', '2024-09-22 21:39:38'),
(246, 101, NULL, 200, '2024-09-22 21:40:46', '2024-09-22 21:40:46'),
(247, 127, NULL, 200, '2024-09-22 21:41:03', '2024-09-22 21:41:03'),
(248, 98, NULL, 200, '2024-09-22 21:41:51', '2024-09-22 21:41:51'),
(249, 119, NULL, 200, '2024-09-22 21:42:07', '2024-09-22 21:42:07'),
(250, 131, NULL, 200, '2024-09-22 21:42:16', '2024-09-22 21:42:16'),
(251, 126, NULL, 200, '2024-09-22 21:42:37', '2024-09-22 21:42:37'),
(252, 81, NULL, 200, '2024-09-22 21:42:46', '2024-09-22 21:42:46'),
(253, 118, NULL, 200, '2024-09-22 21:42:58', '2024-09-22 21:42:58'),
(254, 111, NULL, 200, '2024-09-22 21:43:40', '2024-09-22 21:43:40'),
(255, 115, NULL, 200, '2024-09-22 21:43:48', '2024-09-22 21:43:48'),
(256, 86, NULL, 200, '2024-09-22 21:44:30', '2024-09-22 21:44:30'),
(257, 96, NULL, 200, '2024-09-22 21:44:49', '2024-09-22 21:44:49'),
(258, 19, NULL, 200, '2024-09-22 21:45:05', '2024-09-22 21:45:05'),
(259, 134, NULL, 200, '2024-09-22 21:45:22', '2024-09-22 21:45:22'),
(260, 110, NULL, 200, '2024-09-22 21:45:44', '2024-09-22 21:45:44'),
(261, 62, NULL, 200, '2024-09-22 21:48:30', '2024-09-22 21:48:30'),
(262, 116, NULL, 200, '2024-09-22 21:49:09', '2024-09-22 21:49:09'),
(263, 93, NULL, 200, '2024-09-22 21:49:37', '2024-09-22 21:49:37'),
(264, 45, NULL, 200, '2024-09-22 21:49:51', '2024-09-22 21:49:51'),
(265, 55, NULL, 200, '2024-09-22 21:50:22', '2024-09-22 21:50:22'),
(266, 132, NULL, 200, '2024-09-22 21:51:25', '2024-09-22 21:51:25'),
(268, 78, NULL, 188, '2024-09-23 09:14:51', '2024-09-23 09:14:51'),
(269, 140, NULL, 196, '2024-09-23 09:35:29', '2024-09-23 09:35:29'),
(270, 140, NULL, 198, '2024-09-23 09:36:59', '2024-09-23 09:36:59'),
(271, 140, NULL, 180, '2024-09-23 09:37:20', '2024-09-23 09:37:20'),
(272, 138, NULL, 180, '2024-09-23 09:37:50', '2024-09-23 09:37:50'),
(273, 106, NULL, 196, '2024-09-23 09:38:14', '2024-09-23 09:38:14'),
(274, 136, NULL, 180, '2024-09-23 09:38:16', '2024-09-23 09:38:16'),
(275, 127, NULL, 198, '2024-09-23 09:39:16', '2024-09-23 09:39:16'),
(276, 126, NULL, 198, '2024-09-23 09:39:37', '2024-09-23 09:39:37'),
(277, 138, NULL, 187, '2024-09-23 09:39:38', '2024-09-23 09:39:38'),
(278, 125, NULL, 198, '2024-09-23 09:39:53', '2024-09-23 09:39:53'),
(279, 124, NULL, 198, '2024-09-23 09:40:06', '2024-09-23 09:40:06'),
(280, 123, NULL, 198, '2024-09-23 09:40:15', '2024-09-23 09:40:15'),
(281, 135, NULL, 188, '2024-09-23 10:44:10', '2024-09-23 10:44:10'),
(282, 123, NULL, 185, '2024-09-23 12:35:27', '2024-09-23 12:35:27'),
(283, 95, NULL, 185, '2024-09-23 12:36:18', '2024-09-23 12:36:18'),
(284, 115, NULL, 185, '2024-09-23 12:39:03', '2024-09-23 12:39:03'),
(285, 62, NULL, 185, '2024-09-23 12:43:10', '2024-09-23 12:43:10'),
(286, 135, NULL, 196, '2024-09-23 12:45:06', '2024-09-23 12:45:06'),
(287, 79, NULL, 185, '2024-09-23 14:03:01', '2024-09-23 14:03:01'),
(288, 96, NULL, 185, '2024-09-23 14:06:04', '2024-09-23 14:06:04'),
(289, 25, NULL, 185, '2024-09-23 14:06:18', '2024-09-23 14:06:18'),
(290, 55, NULL, 189, '2024-09-24 00:02:50', '2024-09-24 00:02:50'),
(291, 112, NULL, 189, '2024-09-24 08:50:33', '2024-09-24 08:50:33'),
(292, 51, NULL, 189, '2024-09-24 08:52:06', '2024-09-24 08:52:06'),
(293, 61, NULL, 189, '2024-09-24 08:52:27', '2024-09-24 08:52:27'),
(294, 142, NULL, 189, '2024-09-24 08:56:24', '2024-09-24 08:56:24'),
(295, 136, NULL, 189, '2024-09-24 12:23:27', '2024-09-24 12:23:27'),
(296, 37, NULL, 189, '2024-09-24 12:24:21', '2024-09-24 12:24:21'),
(297, 43, NULL, 187, '2024-09-24 17:45:45', '2024-09-24 17:45:45'),
(298, 96, NULL, 187, '2024-09-24 17:46:05', '2024-09-24 17:46:05'),
(299, 109, NULL, 187, '2024-09-24 17:48:03', '2024-09-24 17:48:03'),
(300, 131, NULL, 187, '2024-09-24 17:52:40', '2024-09-24 17:52:40'),
(301, 67, NULL, 200, '2024-09-24 20:43:09', '2024-09-24 20:43:09'),
(302, 135, NULL, 200, '2024-09-24 20:43:40', '2024-09-24 20:43:40'),
(303, 113, NULL, 200, '2024-09-24 20:45:31', '2024-09-24 20:45:31'),
(304, 107, NULL, 200, '2024-09-24 20:45:54', '2024-09-24 20:45:54'),
(305, 140, NULL, 200, '2024-09-24 20:46:11', '2024-09-24 20:46:11'),
(306, 125, NULL, 200, '2024-09-24 20:49:45', '2024-09-24 20:49:45'),
(307, 124, NULL, 200, '2024-09-24 20:50:22', '2024-09-24 20:50:22'),
(308, 112, NULL, 200, '2024-09-24 20:51:01', '2024-09-24 20:51:01'),
(309, 38, NULL, 182, '2024-09-25 06:03:35', '2024-09-25 06:03:35'),
(310, 127, NULL, 182, '2024-09-25 06:05:04', '2024-09-25 06:05:04'),
(311, 47, NULL, 182, '2024-09-25 06:06:52', '2024-09-25 06:06:52'),
(312, 101, NULL, 189, '2024-09-25 08:41:47', '2024-09-25 08:41:47'),
(313, 109, NULL, 189, '2024-09-25 08:43:03', '2024-09-25 08:43:03'),
(314, 109, NULL, 189, '2024-09-25 08:43:03', '2024-09-25 08:43:03'),
(315, 144, NULL, 189, '2024-09-25 08:45:06', '2024-09-25 08:45:06'),
(316, NULL, 23, 198, '2024-09-25 08:50:59', '2024-09-25 08:50:59'),
(317, 128, NULL, 198, '2024-09-25 08:51:19', '2024-09-25 08:51:19'),
(318, 116, NULL, 198, '2024-09-25 08:51:33', '2024-09-25 08:51:33'),
(319, 118, NULL, 198, '2024-09-25 08:51:45', '2024-09-25 08:51:45'),
(320, 38, NULL, 198, '2024-09-25 08:52:16', '2024-09-25 08:52:16'),
(321, 64, NULL, 189, '2024-09-25 08:55:56', '2024-09-25 08:55:56'),
(322, 89, NULL, 180, '2024-09-25 08:57:36', '2024-09-25 08:57:36'),
(323, 63, NULL, 198, '2024-09-25 08:58:35', '2024-09-25 08:58:35'),
(324, 38, NULL, 188, '2024-09-25 09:11:28', '2024-09-25 09:11:28'),
(325, 130, NULL, 188, '2024-09-25 09:21:31', '2024-09-25 09:21:31'),
(326, 130, NULL, 187, '2024-09-25 09:29:49', '2024-09-25 09:29:49'),
(327, 125, NULL, 207, '2024-09-25 16:04:28', '2024-09-25 16:04:28'),
(328, 137, NULL, 207, '2024-09-25 16:08:04', '2024-09-25 16:08:04'),
(329, 136, NULL, 207, '2024-09-25 16:08:40', '2024-09-25 16:08:40'),
(330, 134, NULL, 207, '2024-09-25 16:09:04', '2024-09-25 16:09:04'),
(331, 138, NULL, 207, '2024-09-25 16:10:59', '2024-09-25 16:10:59'),
(332, 97, NULL, 207, '2024-09-25 16:11:24', '2024-09-25 16:11:24'),
(333, 146, NULL, 207, '2024-09-25 16:11:52', '2024-09-25 16:11:52'),
(334, 123, NULL, 207, '2024-09-25 16:14:58', '2024-09-25 16:14:58'),
(335, 147, NULL, 185, '2024-09-25 16:18:02', '2024-09-25 16:18:02'),
(336, 146, NULL, 185, '2024-09-25 16:18:35', '2024-09-25 16:18:35'),
(337, 100, NULL, 207, '2024-09-25 16:20:46', '2024-09-25 16:20:46'),
(338, 147, NULL, 207, '2024-09-25 16:21:04', '2024-09-25 16:21:04'),
(339, 83, NULL, 207, '2024-09-25 16:21:19', '2024-09-25 16:21:19'),
(340, 39, NULL, 207, '2024-09-25 16:22:09', '2024-09-25 16:22:09'),
(341, 127, NULL, 207, '2024-09-25 16:22:34', '2024-09-25 16:22:34'),
(342, 101, NULL, 185, '2024-09-25 16:22:36', '2024-09-25 16:22:36'),
(343, 91, NULL, 207, '2024-09-25 16:23:07', '2024-09-25 16:23:07'),
(344, 115, NULL, 207, '2024-09-25 16:23:31', '2024-09-25 16:23:31'),
(345, 23, NULL, 185, '2024-09-25 16:23:48', '2024-09-25 16:23:48'),
(346, 122, NULL, 207, '2024-09-25 16:25:01', '2024-09-25 16:25:01'),
(347, 85, NULL, 207, '2024-09-25 16:26:57', '2024-09-25 16:26:57'),
(348, 149, NULL, 207, '2024-09-25 16:35:12', '2024-09-25 16:35:12'),
(349, 119, NULL, 207, '2024-09-25 16:39:26', '2024-09-25 16:39:26'),
(350, 55, NULL, 207, '2024-09-25 17:40:38', '2024-09-25 17:40:38'),
(351, 48, NULL, 207, '2024-09-25 17:41:38', '2024-09-25 17:41:38'),
(352, NULL, 23, 207, '2024-09-25 17:42:46', '2024-09-25 17:42:46'),
(353, 130, NULL, 207, '2024-09-25 17:43:10', '2024-09-25 17:43:10'),
(354, 67, NULL, 207, '2024-09-25 17:44:07', '2024-09-25 17:44:07'),
(355, 108, NULL, 207, '2024-09-25 17:45:26', '2024-09-25 17:45:26'),
(356, 40, NULL, 207, '2024-09-25 17:46:27', '2024-09-25 17:46:27'),
(357, 129, NULL, 207, '2024-09-25 17:47:47', '2024-09-25 17:47:47'),
(358, 80, NULL, 207, '2024-09-25 17:48:17', '2024-09-25 17:48:17'),
(359, 116, NULL, 207, '2024-09-25 17:48:47', '2024-09-25 17:48:47'),
(360, 69, NULL, 207, '2024-09-25 17:50:18', '2024-09-25 17:50:18'),
(361, 93, NULL, 207, '2024-09-25 17:51:19', '2024-09-25 17:51:19'),
(362, 131, NULL, 207, '2024-09-25 17:51:44', '2024-09-25 17:51:44'),
(363, 145, NULL, 207, '2024-09-25 17:57:40', '2024-09-25 17:57:40'),
(364, 33, NULL, 207, '2024-09-25 18:01:34', '2024-09-25 18:01:34'),
(365, 50, NULL, 207, '2024-09-25 18:01:52', '2024-09-25 18:01:52'),
(366, 58, NULL, 207, '2024-09-25 18:03:18', '2024-09-25 18:03:18'),
(367, 25, NULL, 207, '2024-09-25 18:03:41', '2024-09-25 18:03:41'),
(368, 60, NULL, 180, '2024-09-25 18:07:44', '2024-09-25 18:07:44'),
(369, 120, NULL, 207, '2024-09-25 19:46:51', '2024-09-25 19:46:51'),
(370, 94, NULL, 207, '2024-09-25 19:47:39', '2024-09-25 19:47:39'),
(371, 28, NULL, 207, '2024-09-25 19:49:28', '2024-09-25 19:49:28'),
(372, 75, NULL, 189, '2024-09-25 20:16:33', '2024-09-25 20:16:33'),
(373, 157, NULL, 189, '2024-09-25 20:20:19', '2024-09-25 20:20:19'),
(374, 144, NULL, 188, '2024-09-25 20:21:19', '2024-09-25 20:21:19'),
(375, 124, NULL, 189, '2024-09-25 20:28:21', '2024-09-25 20:28:21'),
(376, 143, NULL, 208, '2024-09-25 20:29:33', '2024-09-25 20:29:33'),
(377, 146, NULL, 188, '2024-09-25 20:30:16', '2024-09-25 20:30:16'),
(378, 128, NULL, 208, '2024-09-25 20:32:50', '2024-09-25 20:32:50'),
(379, 143, NULL, 189, '2024-09-25 20:34:03', '2024-09-25 20:34:03'),
(380, 109, NULL, 208, '2024-09-25 20:34:42', '2024-09-25 20:34:42'),
(381, 38, NULL, 209, '2024-09-25 20:48:19', '2024-09-25 20:48:19'),
(382, 115, NULL, 209, '2024-09-25 20:48:38', '2024-09-25 20:48:38'),
(383, 45, NULL, 209, '2024-09-25 20:52:10', '2024-09-25 20:52:10'),
(384, 73, NULL, 209, '2024-09-25 20:52:36', '2024-09-25 20:52:36'),
(385, 143, NULL, 209, '2024-09-25 20:53:30', '2024-09-25 20:53:30'),
(386, 32, NULL, 209, '2024-09-25 20:54:09', '2024-09-25 20:54:09'),
(387, 121, NULL, 209, '2024-09-25 20:54:24', '2024-09-25 20:54:24'),
(388, 103, NULL, 180, '2024-09-25 23:22:40', '2024-09-25 23:22:40'),
(389, 75, NULL, 180, '2024-09-25 23:22:57', '2024-09-25 23:22:57'),
(390, NULL, 23, 180, '2024-09-25 23:24:07', '2024-09-25 23:24:07'),
(391, 146, NULL, 180, '2024-09-25 23:24:40', '2024-09-25 23:24:40'),
(392, 107, NULL, 180, '2024-09-25 23:24:54', '2024-09-25 23:24:54'),
(393, 61, NULL, 180, '2024-09-25 23:25:10', '2024-09-25 23:25:10'),
(394, 66, NULL, 180, '2024-09-25 23:26:11', '2024-09-25 23:26:11'),
(395, 22, NULL, 180, '2024-09-25 23:27:23', '2024-09-25 23:27:23'),
(396, 46, NULL, 189, '2024-09-26 07:27:52', '2024-09-26 07:27:52'),
(397, 101, NULL, 188, '2024-09-26 07:31:44', '2024-09-26 07:31:44'),
(398, 135, NULL, 189, '2024-09-26 08:28:46', '2024-09-26 08:28:46'),
(399, 30, NULL, 189, '2024-09-26 08:28:56', '2024-09-26 08:28:56'),
(400, 138, NULL, 189, '2024-09-26 08:31:29', '2024-09-26 08:31:29'),
(401, 34, NULL, 189, '2024-09-26 09:18:34', '2024-09-26 09:18:34'),
(402, 145, NULL, 198, '2024-09-26 09:19:02', '2024-09-26 09:19:02'),
(403, 115, NULL, 210, '2024-09-26 20:14:12', '2024-09-26 20:14:12'),
(404, 121, NULL, 210, '2024-09-26 20:14:27', '2024-09-26 20:14:27'),
(405, 75, NULL, 210, '2024-09-26 20:14:44', '2024-09-26 20:14:44'),
(406, 82, NULL, 210, '2024-09-26 20:15:05', '2024-09-26 20:15:05'),
(407, 31, NULL, 210, '2024-09-26 20:15:32', '2024-09-26 20:15:32'),
(408, 150, NULL, 210, '2024-09-26 20:16:43', '2024-09-26 20:16:43'),
(409, 134, NULL, 210, '2024-09-26 20:18:14', '2024-09-26 20:18:14'),
(410, 126, NULL, 210, '2024-09-26 20:18:45', '2024-09-26 20:18:45'),
(411, 20, NULL, 210, '2024-09-26 20:21:14', '2024-09-26 20:21:14'),
(412, 33, NULL, 210, '2024-09-26 20:23:01', '2024-09-26 20:23:01'),
(413, 40, NULL, 210, '2024-09-26 20:24:03', '2024-09-26 20:24:03'),
(414, 109, NULL, 210, '2024-09-26 20:25:01', '2024-09-26 20:25:01'),
(415, 42, NULL, 210, '2024-09-26 20:25:18', '2024-09-26 20:25:18'),
(416, 125, NULL, 210, '2024-09-26 20:26:05', '2024-09-26 20:26:05'),
(417, NULL, 23, 210, '2024-09-26 20:27:02', '2024-09-26 20:27:02'),
(418, 135, NULL, 210, '2024-09-26 20:27:19', '2024-09-26 20:27:19'),
(419, 140, NULL, 210, '2024-09-26 20:27:44', '2024-09-26 20:27:44'),
(420, 68, NULL, 210, '2024-09-26 20:28:29', '2024-09-26 20:28:29'),
(421, 39, NULL, 210, '2024-09-26 20:28:54', '2024-09-26 20:28:54'),
(422, 61, NULL, 210, '2024-09-26 20:30:04', '2024-09-26 20:30:04'),
(423, 66, NULL, 210, '2024-09-26 20:31:08', '2024-09-26 20:31:08'),
(424, 151, NULL, 210, '2024-09-26 20:31:56', '2024-09-26 20:31:56'),
(425, 60, NULL, 210, '2024-09-26 20:32:09', '2024-09-26 20:32:09'),
(426, 92, NULL, 210, '2024-09-26 20:32:31', '2024-09-26 20:32:31'),
(427, 36, NULL, 210, '2024-09-26 20:33:00', '2024-09-26 20:33:00'),
(428, 38, NULL, 210, '2024-09-26 20:33:46', '2024-09-26 20:33:46'),
(429, 101, NULL, 210, '2024-09-26 20:34:42', '2024-09-26 20:34:42'),
(430, 131, NULL, 210, '2024-09-26 20:35:06', '2024-09-26 20:35:06'),
(431, 73, NULL, 210, '2024-09-26 20:37:20', '2024-09-26 20:37:20'),
(432, 34, NULL, 210, '2024-09-26 20:38:02', '2024-09-26 20:38:02'),
(433, 87, NULL, 210, '2024-09-26 20:39:44', '2024-09-26 20:39:44'),
(434, 94, NULL, 210, '2024-09-26 20:40:41', '2024-09-26 20:40:41'),
(435, 35, NULL, 210, '2024-09-26 20:41:51', '2024-09-26 20:41:51'),
(436, 157, NULL, 210, '2024-09-26 20:42:37', '2024-09-26 20:42:37'),
(437, 32, NULL, 210, '2024-09-26 20:43:10', '2024-09-26 20:43:10'),
(438, 145, NULL, 210, '2024-09-26 20:44:54', '2024-09-26 20:44:54'),
(439, 65, NULL, 210, '2024-09-26 20:45:22', '2024-09-26 20:45:22'),
(440, 72, NULL, 210, '2024-09-26 20:45:57', '2024-09-26 20:45:57'),
(441, 116, NULL, 210, '2024-09-26 20:46:10', '2024-09-26 20:46:10'),
(442, 88, NULL, 210, '2024-09-26 20:46:38', '2024-09-26 20:46:38'),
(443, 146, NULL, 210, '2024-09-26 20:47:13', '2024-09-26 20:47:13'),
(444, 59, NULL, 210, '2024-09-26 20:48:02', '2024-09-26 20:48:02'),
(445, 48, NULL, 210, '2024-09-26 20:49:22', '2024-09-26 20:49:22'),
(446, 21, NULL, 210, '2024-09-26 20:50:08', '2024-09-26 20:50:08'),
(447, 29, NULL, 210, '2024-09-26 20:50:21', '2024-09-26 20:50:21'),
(448, 57, NULL, 210, '2024-09-26 20:51:59', '2024-09-26 20:51:59'),
(449, 142, NULL, 210, '2024-09-26 20:52:59', '2024-09-26 20:52:59'),
(450, 129, NULL, 210, '2024-09-26 20:53:22', '2024-09-26 20:53:22'),
(451, 149, NULL, 210, '2024-09-26 20:54:26', '2024-09-26 20:54:26'),
(452, 133, NULL, 210, '2024-09-26 20:55:00', '2024-09-26 20:55:00'),
(453, 97, NULL, 210, '2024-09-26 20:55:11', '2024-09-26 20:55:11'),
(454, 52, NULL, 210, '2024-09-26 20:57:09', '2024-09-26 20:57:09'),
(455, 78, NULL, 210, '2024-09-26 20:58:27', '2024-09-26 20:58:27'),
(456, 25, NULL, 210, '2024-09-26 20:58:41', '2024-09-26 20:58:41'),
(457, 64, NULL, 210, '2024-09-26 21:00:00', '2024-09-26 21:00:00'),
(458, 120, NULL, 210, '2024-09-26 21:01:52', '2024-09-26 21:01:52'),
(459, 26, NULL, 210, '2024-09-26 21:02:17', '2024-09-26 21:02:17'),
(460, 37, NULL, 210, '2024-09-26 21:02:56', '2024-09-26 21:02:56'),
(461, 55, NULL, 210, '2024-09-26 21:03:54', '2024-09-26 21:03:54'),
(462, 19, NULL, 210, '2024-09-26 21:04:59', '2024-09-26 21:04:59'),
(463, 81, NULL, 210, '2024-09-26 21:05:08', '2024-09-26 21:05:08'),
(464, 99, NULL, 210, '2024-09-26 21:05:54', '2024-09-26 21:05:54'),
(465, 106, NULL, 210, '2024-09-26 21:06:04', '2024-09-26 21:06:04'),
(466, 122, NULL, 210, '2024-09-26 21:07:00', '2024-09-26 21:07:00'),
(467, 95, NULL, 210, '2024-09-26 21:07:24', '2024-09-26 21:07:24'),
(468, 98, NULL, 210, '2024-09-26 21:08:05', '2024-09-26 21:08:05'),
(469, 53, NULL, 210, '2024-09-26 21:08:54', '2024-09-26 21:08:54'),
(470, 79, NULL, 210, '2024-09-26 21:11:44', '2024-09-26 21:11:44'),
(471, 91, NULL, 210, '2024-09-26 21:12:43', '2024-09-26 21:12:43'),
(472, 152, NULL, 210, '2024-09-26 21:16:03', '2024-09-26 21:16:03'),
(473, 50, NULL, 210, '2024-09-26 21:16:38', '2024-09-26 21:16:38'),
(474, 69, NULL, 210, '2024-09-26 21:17:53', '2024-09-26 21:17:53'),
(475, 24, NULL, 210, '2024-09-26 21:19:40', '2024-09-26 21:19:40'),
(476, 80, NULL, 210, '2024-09-26 21:20:01', '2024-09-26 21:20:01'),
(477, 141, NULL, 210, '2024-09-26 21:20:26', '2024-09-26 21:20:26'),
(478, 63, NULL, 210, '2024-09-26 21:20:44', '2024-09-26 21:20:44'),
(479, 119, NULL, 210, '2024-09-26 21:21:37', '2024-09-26 21:21:37'),
(480, 58, NULL, 210, '2024-09-26 21:22:29', '2024-09-26 21:22:29'),
(481, 72, NULL, 185, '2024-09-26 21:23:29', '2024-09-26 21:23:29'),
(482, 142, NULL, 185, '2024-09-26 21:25:06', '2024-09-26 21:25:06'),
(483, 102, NULL, 185, '2024-09-26 21:25:49', '2024-09-26 21:25:49'),
(484, 57, NULL, 185, '2024-09-26 21:26:32', '2024-09-26 21:26:32'),
(485, 73, NULL, 185, '2024-09-26 21:27:00', '2024-09-26 21:27:00'),
(486, 65, NULL, 185, '2024-09-26 21:27:19', '2024-09-26 21:27:19'),
(487, 148, NULL, 210, '2024-09-26 21:27:26', '2024-09-26 21:27:26'),
(488, 135, NULL, 185, '2024-09-26 21:27:37', '2024-09-26 21:27:37'),
(489, 54, NULL, 210, '2024-09-26 21:27:56', '2024-09-26 21:27:56'),
(490, 91, NULL, 185, '2024-09-26 21:28:14', '2024-09-26 21:28:14'),
(491, 56, NULL, 210, '2024-09-26 21:29:20', '2024-09-26 21:29:20'),
(492, 27, NULL, 210, '2024-09-26 21:33:36', '2024-09-26 21:33:36'),
(493, 132, NULL, 210, '2024-09-26 21:36:34', '2024-09-26 21:36:34'),
(494, 96, NULL, 210, '2024-09-26 21:39:03', '2024-09-26 21:39:03'),
(495, 104, NULL, 210, '2024-09-26 21:39:29', '2024-09-26 21:39:29'),
(496, 30, NULL, 210, '2024-09-26 21:40:40', '2024-09-26 21:40:40'),
(497, 141, NULL, 180, '2024-09-26 21:42:02', '2024-09-26 21:42:02'),
(498, 50, NULL, 180, '2024-09-26 21:42:18', '2024-09-26 21:42:18'),
(499, 141, NULL, 189, '2024-09-26 21:42:24', '2024-09-26 21:42:24'),
(500, 74, NULL, 180, '2024-09-26 21:42:36', '2024-09-26 21:42:36'),
(501, 154, NULL, 210, '2024-09-26 21:44:23', '2024-09-26 21:44:23'),
(502, 113, NULL, 210, '2024-09-26 21:45:02', '2024-09-26 21:45:02'),
(503, 118, NULL, 210, '2024-09-26 21:45:52', '2024-09-26 21:45:52'),
(504, 147, NULL, 210, '2024-09-26 21:46:50', '2024-09-26 21:46:50'),
(505, 155, NULL, 210, '2024-09-26 21:48:05', '2024-09-26 21:48:05'),
(506, 124, NULL, 210, '2024-09-26 21:48:38', '2024-09-26 21:48:38'),
(507, 83, NULL, 210, '2024-09-26 21:50:03', '2024-09-26 21:50:03'),
(508, 143, NULL, 210, '2024-09-26 21:51:12', '2024-09-26 21:51:12'),
(509, 43, NULL, 210, '2024-09-26 21:51:43', '2024-09-26 21:51:43'),
(510, 100, NULL, 210, '2024-09-26 21:52:16', '2024-09-26 21:52:16'),
(511, 28, NULL, 210, '2024-09-26 21:59:28', '2024-09-26 21:59:28'),
(512, 127, NULL, 210, '2024-09-26 22:01:15', '2024-09-26 22:01:15'),
(513, 49, NULL, 210, '2024-09-26 22:03:47', '2024-09-26 22:03:47'),
(514, 156, NULL, 210, '2024-09-26 22:04:15', '2024-09-26 22:04:15'),
(515, 46, NULL, 210, '2024-09-26 22:04:56', '2024-09-26 22:04:56'),
(516, 73, NULL, 200, '2024-09-26 22:07:38', '2024-09-26 22:07:38'),
(517, 147, NULL, 200, '2024-09-26 22:07:55', '2024-09-26 22:07:55'),
(518, 113, NULL, 187, '2024-09-26 23:02:52', '2024-09-26 23:02:52'),
(519, 128, NULL, 187, '2024-09-26 23:03:52', '2024-09-26 23:03:52'),
(520, 90, NULL, 187, '2024-09-26 23:04:23', '2024-09-26 23:04:23'),
(521, 81, NULL, 187, '2024-09-26 23:04:37', '2024-09-26 23:04:37'),
(522, 153, NULL, 211, '2024-09-27 06:48:40', '2024-09-27 06:48:40'),
(523, 80, NULL, 211, '2024-09-27 06:48:58', '2024-09-27 06:48:58'),
(524, 116, NULL, 211, '2024-09-27 06:49:11', '2024-09-27 06:49:11'),
(525, 76, NULL, 210, '2024-09-27 07:19:53', '2024-09-27 07:19:53'),
(526, 110, NULL, 210, '2024-09-27 07:21:45', '2024-09-27 07:21:45'),
(527, 47, NULL, 210, '2024-09-27 07:21:58', '2024-09-27 07:21:58'),
(528, 85, NULL, 210, '2024-09-27 07:22:46', '2024-09-27 07:22:46'),
(529, 41, NULL, 210, '2024-09-27 07:28:04', '2024-09-27 07:28:04'),
(530, 90, NULL, 210, '2024-09-27 07:43:15', '2024-09-27 07:43:15'),
(531, 115, NULL, 189, '2024-09-27 08:28:54', '2024-09-27 08:28:54'),
(532, 104, NULL, 189, '2024-09-27 08:29:02', '2024-09-27 08:29:02'),
(533, 85, NULL, 189, '2024-09-27 08:29:37', '2024-09-27 08:29:37'),
(534, 24, NULL, 189, '2024-09-27 08:31:31', '2024-09-27 08:31:31'),
(535, 61, NULL, 211, '2024-09-27 08:36:24', '2024-09-27 08:36:24'),
(536, 140, NULL, 207, '2024-09-27 09:00:15', '2024-09-27 09:00:15'),
(537, 112, NULL, 207, '2024-09-27 09:00:51', '2024-09-27 09:00:51'),
(538, 86, NULL, 210, '2024-09-27 09:13:37', '2024-09-27 09:13:37'),
(539, 123, NULL, 210, '2024-09-27 09:17:02', '2024-09-27 09:17:02'),
(540, 45, NULL, 210, '2024-09-27 09:18:23', '2024-09-27 09:18:23'),
(541, 51, NULL, 210, '2024-09-27 09:19:13', '2024-09-27 09:19:13'),
(542, 23, NULL, 210, '2024-09-27 09:21:21', '2024-09-27 09:21:21'),
(543, 105, NULL, 210, '2024-09-27 09:22:06', '2024-09-27 09:22:06'),
(544, 136, NULL, 210, '2024-09-27 09:41:16', '2024-09-27 09:41:16'),
(545, 54, NULL, 212, '2024-09-27 09:52:49', '2024-09-27 09:52:49'),
(546, 78, NULL, 212, '2024-09-27 09:57:03', '2024-09-27 09:57:03'),
(547, 36, NULL, 212, '2024-09-27 09:58:22', '2024-09-27 09:58:22'),
(548, 59, NULL, 212, '2024-09-27 09:58:52', '2024-09-27 09:58:52'),
(549, 60, NULL, 212, '2024-09-27 09:59:17', '2024-09-27 09:59:17'),
(550, 126, NULL, 212, '2024-09-27 10:00:09', '2024-09-27 10:00:09'),
(551, 89, NULL, 212, '2024-09-27 10:01:15', '2024-09-27 10:01:15'),
(552, 112, NULL, 210, '2024-09-27 11:36:20', '2024-09-27 11:36:20'),
(553, 158, NULL, 210, '2024-09-27 11:38:01', '2024-09-27 11:38:01'),
(554, 89, NULL, 210, '2024-09-27 11:38:55', '2024-09-27 11:38:55'),
(555, 74, NULL, 210, '2024-09-27 11:39:27', '2024-09-27 11:39:27'),
(556, 22, NULL, 210, '2024-09-27 15:00:38', '2024-09-27 15:00:38'),
(557, 114, NULL, 210, '2024-09-27 15:02:04', '2024-09-27 15:02:04'),
(558, 59, NULL, 189, '2024-09-27 19:44:56', '2024-09-27 19:44:56'),
(559, 108, NULL, 189, '2024-09-27 19:46:01', '2024-09-27 19:46:01'),
(560, 91, NULL, 189, '2024-09-27 19:46:35', '2024-09-27 19:46:35'),
(561, 79, NULL, 189, '2024-09-27 19:46:46', '2024-09-27 19:46:46'),
(562, 82, NULL, 185, '2024-09-27 20:20:06', '2024-09-27 20:20:06'),
(563, 82, NULL, 189, '2024-09-27 21:05:05', '2024-09-27 21:05:05'),
(564, 78, NULL, 189, '2024-09-27 21:05:35', '2024-09-27 21:05:35'),
(565, 131, NULL, 189, '2024-09-27 21:05:58', '2024-09-27 21:05:58'),
(566, 59, NULL, 196, '2024-09-27 21:13:39', '2024-09-27 21:13:39'),
(567, 34, NULL, 188, '2024-09-28 12:16:00', '2024-09-28 12:16:00'),
(568, 54, NULL, 188, '2024-09-28 12:17:04', '2024-09-28 12:17:04'),
(569, 123, NULL, 188, '2024-09-28 12:24:59', '2024-09-28 12:24:59'),
(570, 88, NULL, 188, '2024-09-28 12:25:28', '2024-09-28 12:25:28'),
(571, 134, NULL, 188, '2024-09-28 12:25:58', '2024-09-28 12:25:58'),
(572, 90, NULL, 188, '2024-09-28 12:27:15', '2024-09-28 12:27:15'),
(573, 57, NULL, 188, '2024-09-28 12:28:41', '2024-09-28 12:28:41'),
(574, 41, NULL, 188, '2024-09-28 13:40:17', '2024-09-28 13:40:17'),
(575, 98, NULL, 188, '2024-09-28 13:41:57', '2024-09-28 13:41:57'),
(576, 42, NULL, 189, '2024-09-28 14:21:51', '2024-09-28 14:21:51'),
(577, 132, NULL, 187, '2024-09-28 14:23:48', '2024-09-28 14:23:48'),
(578, 123, NULL, 187, '2024-09-28 14:25:38', '2024-09-28 14:25:38'),
(579, 126, NULL, 189, '2024-09-28 16:22:33', '2024-09-28 16:22:33'),
(580, 99, NULL, 200, '2024-09-29 11:30:11', '2024-09-29 11:30:11'),
(581, 59, NULL, 214, '2024-09-29 13:50:20', '2024-09-29 13:50:20'),
(582, 57, NULL, 214, '2024-09-29 13:51:00', '2024-09-29 13:51:00'),
(583, 81, NULL, 214, '2024-09-29 13:51:28', '2024-09-29 13:51:28'),
(584, 121, NULL, 214, '2024-09-29 13:51:48', '2024-09-29 13:51:48'),
(585, 105, NULL, 214, '2024-09-29 13:52:05', '2024-09-29 13:52:05'),
(586, 92, NULL, 189, '2024-09-29 13:57:53', '2024-09-29 13:57:53'),
(587, 38, NULL, 200, '2024-09-29 15:37:14', '2024-09-29 15:37:14'),
(588, 114, NULL, 180, '2024-09-29 15:51:29', '2024-09-29 15:51:29'),
(589, 26, NULL, 180, '2024-09-29 15:51:52', '2024-09-29 15:51:52'),
(590, 25, NULL, 180, '2024-09-29 15:52:24', '2024-09-29 15:52:24'),
(591, 41, NULL, 180, '2024-09-29 15:53:54', '2024-09-29 15:53:54'),
(592, 20, NULL, 180, '2024-09-29 15:55:07', '2024-09-29 15:55:07'),
(593, 156, NULL, 187, '2024-09-29 16:23:27', '2024-09-29 16:23:27'),
(594, 101, NULL, 187, '2024-09-29 16:23:43', '2024-09-29 16:23:43'),
(595, 140, NULL, 187, '2024-09-29 16:34:04', '2024-09-29 16:34:04'),
(596, 56, NULL, 189, '2024-09-29 16:44:15', '2024-09-29 16:44:15'),
(597, 152, NULL, 180, '2024-09-29 21:48:29', '2024-09-29 21:48:29'),
(598, 151, NULL, 180, '2024-09-29 21:52:29', '2024-09-29 21:52:29'),
(599, 104, NULL, 180, '2024-09-29 21:52:37', '2024-09-29 21:52:37'),
(600, 41, NULL, 187, '2024-09-29 22:48:27', '2024-09-29 22:48:27'),
(601, 120, NULL, 214, '2024-09-30 11:18:13', '2024-09-30 11:18:13'),
(602, 47, NULL, 214, '2024-09-30 11:18:28', '2024-09-30 11:18:28'),
(603, 152, NULL, 214, '2024-09-30 11:19:03', '2024-09-30 11:19:03'),
(604, 109, NULL, 214, '2024-09-30 11:19:27', '2024-09-30 11:19:27'),
(605, 45, NULL, 214, '2024-09-30 11:19:43', '2024-09-30 11:19:43'),
(606, 37, NULL, 214, '2024-09-30 11:20:03', '2024-09-30 11:20:03'),
(607, 36, NULL, 214, '2024-09-30 11:20:24', '2024-09-30 11:20:24'),
(608, 131, NULL, 214, '2024-09-30 11:20:34', '2024-09-30 11:20:34'),
(609, 146, NULL, 214, '2024-09-30 11:23:16', '2024-09-30 11:23:16'),
(610, 79, NULL, 214, '2024-09-30 11:23:44', '2024-09-30 11:23:44'),
(611, 118, NULL, 214, '2024-09-30 11:23:57', '2024-09-30 11:23:57'),
(612, 136, NULL, 214, '2024-09-30 11:24:14', '2024-09-30 11:24:14'),
(613, 23, NULL, 214, '2024-09-30 11:24:55', '2024-09-30 11:24:55'),
(614, 76, NULL, 214, '2024-09-30 11:25:10', '2024-09-30 11:25:10'),
(615, 156, NULL, 214, '2024-09-30 11:25:36', '2024-09-30 11:25:36'),
(616, NULL, 23, 214, '2024-09-30 11:26:19', '2024-09-30 11:26:19'),
(617, 54, NULL, 214, '2024-09-30 11:26:37', '2024-09-30 11:26:37'),
(618, 26, NULL, 188, '2024-09-30 12:37:43', '2024-09-30 12:37:43'),
(619, 87, NULL, 188, '2024-09-30 13:10:23', '2024-09-30 13:10:23'),
(620, 140, NULL, 188, '2024-09-30 13:11:21', '2024-09-30 13:11:21'),
(621, 157, NULL, 188, '2024-09-30 13:11:43', '2024-09-30 13:11:43'),
(622, 60, NULL, 185, '2024-09-30 15:03:57', '2024-09-30 15:03:57'),
(623, 114, NULL, 207, '2024-09-30 15:06:28', '2024-09-30 15:06:28'),
(624, 29, NULL, 207, '2024-09-30 15:06:43', '2024-09-30 15:06:43'),
(625, 124, NULL, 207, '2024-09-30 15:09:10', '2024-09-30 15:09:10'),
(626, 103, NULL, 185, '2024-09-30 21:11:07', '2024-09-30 21:11:07'),
(627, 98, NULL, 185, '2024-09-30 21:13:04', '2024-09-30 21:13:04'),
(628, 111, NULL, 188, '2024-09-30 21:59:58', '2024-09-30 21:59:58'),
(629, 124, NULL, 187, '2024-10-01 10:02:44', '2024-10-01 10:02:44'),
(630, 134, NULL, 189, '2024-10-05 15:42:28', '2024-10-05 15:42:28'),
(631, 85, NULL, 180, '2024-10-06 10:56:49', '2024-10-06 10:56:49'),
(632, 129, NULL, 180, '2024-10-06 10:57:20', '2024-10-06 10:57:20'),
(633, 45, NULL, 180, '2024-10-06 10:58:31', '2024-10-06 10:58:31'),
(634, 30, NULL, 180, '2024-10-06 10:58:40', '2024-10-06 10:58:40'),
(635, 112, NULL, 180, '2024-10-06 10:58:54', '2024-10-06 10:58:54'),
(636, 100, NULL, 180, '2024-10-06 10:59:10', '2024-10-06 10:59:10'),
(638, 86, NULL, 188, '2024-10-07 10:26:14', '2024-10-07 10:26:14'),
(639, 151, NULL, 188, '2024-10-07 10:53:22', '2024-10-07 10:53:22'),
(640, 148, NULL, 188, '2024-10-07 14:12:39', '2024-10-07 14:12:39'),
(641, 105, NULL, 189, '2024-10-07 14:43:46', '2024-10-07 14:43:46'),
(642, 110, NULL, 180, '2024-10-07 14:51:04', '2024-10-07 14:51:04'),
(643, 59, NULL, 215, '2024-10-07 17:16:49', '2024-10-07 17:16:49'),
(644, 47, NULL, 216, '2024-10-08 05:05:55', '2024-10-08 05:05:55'),
(645, 47, NULL, 216, '2024-10-08 05:05:55', '2024-10-08 05:05:55'),
(646, 32, NULL, 216, '2024-10-08 05:07:33', '2024-10-08 05:07:33'),
(647, 82, NULL, 216, '2024-10-08 05:07:56', '2024-10-08 05:07:56'),
(648, 134, NULL, 216, '2024-10-08 05:08:41', '2024-10-08 05:08:41'),
(649, 118, NULL, 216, '2024-10-08 05:09:22', '2024-10-08 05:09:22'),
(650, 128, NULL, 216, '2024-10-08 05:09:53', '2024-10-08 05:09:53'),
(651, 140, NULL, 181, '2024-10-08 14:54:59', '2024-10-08 14:54:59'),
(652, 111, NULL, 217, '2024-10-09 23:34:02', '2024-10-09 23:34:02'),
(653, 99, NULL, 189, '2024-10-10 21:22:21', '2024-10-10 21:22:21'),
(654, 146, NULL, 189, '2024-10-10 21:22:32', '2024-10-10 21:22:32'),
(655, 171, NULL, 189, '2024-10-10 21:24:38', '2024-10-10 21:24:38'),
(656, 99, NULL, 187, '2024-10-10 21:24:40', '2024-10-10 21:24:40'),
(657, 104, NULL, 218, '2024-10-12 06:58:27', '2024-10-12 06:58:27'),
(658, 86, NULL, 218, '2024-10-12 06:59:04', '2024-10-12 06:59:04'),
(659, 48, NULL, 218, '2024-10-12 06:59:37', '2024-10-12 06:59:37'),
(660, NULL, 23, 218, '2024-10-12 07:01:09', '2024-10-12 07:01:09'),
(661, 118, NULL, 218, '2024-10-12 07:03:40', '2024-10-12 07:03:40'),
(662, 145, NULL, 218, '2024-10-12 07:05:14', '2024-10-12 07:05:14'),
(663, 94, NULL, 218, '2024-10-12 07:05:27', '2024-10-12 07:05:27'),
(664, 124, NULL, 218, '2024-10-12 07:05:45', '2024-10-12 07:05:45'),
(665, 81, NULL, 218, '2024-10-12 07:06:36', '2024-10-12 07:06:36'),
(666, 91, NULL, 218, '2024-10-12 07:06:53', '2024-10-12 07:06:53'),
(667, 67, NULL, 218, '2024-10-12 07:07:09', '2024-10-12 07:07:09'),
(668, 127, NULL, 218, '2024-10-12 07:07:38', '2024-10-12 07:07:38'),
(669, 172, NULL, 218, '2024-10-12 07:14:23', '2024-10-12 07:14:23'),
(670, 166, NULL, 187, '2024-10-15 16:40:15', '2024-10-15 16:40:15'),
(671, 143, NULL, 187, '2024-10-16 22:33:37', '2024-10-16 22:33:37'),
(672, 74, NULL, 181, '2024-10-18 10:43:54', '2024-10-18 10:43:54'),
(673, 168, NULL, 187, '2024-10-18 10:43:59', '2024-10-18 10:43:59'),
(674, 103, NULL, 181, '2024-10-18 10:45:07', '2024-10-18 10:45:07'),
(675, 104, NULL, 181, '2024-10-18 10:45:58', '2024-10-18 10:45:58'),
(676, 42, NULL, 188, '2024-10-21 16:37:42', '2024-10-21 16:37:42'),
(677, 136, NULL, 188, '2024-10-22 08:55:14', '2024-10-22 08:55:14'),
(678, 141, NULL, 188, '2024-10-22 10:45:19', '2024-10-22 10:45:19'),
(679, 122, NULL, 188, '2024-10-22 11:28:46', '2024-10-22 11:28:46'),
(680, 83, NULL, 196, '2024-10-22 11:40:23', '2024-10-22 11:40:23'),
(681, 121, NULL, 181, '2024-10-22 13:15:41', '2024-10-22 13:15:41'),
(682, 91, NULL, 181, '2024-10-22 13:18:31', '2024-10-22 13:18:31'),
(683, 93, NULL, 181, '2024-10-22 13:19:04', '2024-10-22 13:19:04'),
(684, 31, NULL, 181, '2024-10-22 13:19:51', '2024-10-22 13:19:51'),
(685, 160, NULL, 196, '2024-10-22 16:00:43', '2024-10-22 16:00:43');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `points` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `net_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_tax_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_tax_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `withdrawal_count` int DEFAULT '0',
  `last_withdrawal_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_withdrawal_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withdraw_status` int NOT NULL DEFAULT '1',
  `tax_status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `points`, `net_amount`, `gst_amount`, `additional_tax_amount`, `additional_tax_details`, `withdrawal_count`, `last_withdrawal_date`, `next_withdrawal_date`, `withdraw_status`, `tax_status`, `created_at`, `updated_at`) VALUES
(1, 189, '37.8', '22.68', '6.80', '8.32', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"3.78\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"4.54\"}]', 0, NULL, NULL, 1, 0, '2024-09-16 12:18:39', '2024-10-10 21:22:32'),
(2, 187, '145.1', '87.06', '26.12', '31.92', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"14.51\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"17.41\"}]', 0, NULL, NULL, 1, 0, '2024-09-16 12:18:39', '2024-10-22 13:19:51'),
(3, 188, '84.3', '50.58', '15.17', '18.55', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"8.43\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"10.12\"}]', 0, NULL, NULL, 1, 0, '2024-09-16 12:39:31', '2024-10-12 06:59:37'),
(4, 196, '145.6', '87.36', '26.21', '32.03', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"14.56\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"17.47\"}]', 0, NULL, NULL, 1, 0, '2024-09-16 12:39:31', '2024-10-12 07:06:36'),
(5, 200, '54.8', '32.88', '9.86', '12.06', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"5.48\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"6.58\"}]', 0, NULL, NULL, 1, 0, '2024-09-16 13:34:33', '2024-10-08 14:54:59'),
(6, 198, '41.8', '25.08', '7.52', '9.2', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"4.18\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"5.02\"}]', 0, NULL, NULL, 1, 0, '2024-09-16 14:55:03', '2024-10-15 16:40:15'),
(7, 182, '14.5', '8.7', '2.61', '3.19', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"1.45\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"1.74\"}]', 0, NULL, NULL, 1, 0, '2024-09-16 17:03:45', '2024-09-17 19:20:09'),
(8, 185, '61.6', '36.96', '11.09', '13.55', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"6.16\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"7.39\"}]', 0, NULL, NULL, 1, 0, '2024-09-20 20:37:35', '2024-10-08 05:08:41'),
(9, 180, '13.5', '8.1', '2.43', '2.97', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"1.35\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"1.62\"}]', 0, NULL, NULL, 1, 0, '2024-09-23 09:37:20', '2024-10-07 14:51:04'),
(10, 207, '47.7', '28.62', '8.59', '10.49', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"4.77\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"5.72\"}]', 0, NULL, NULL, 1, 0, '2024-09-25 16:03:58', '2024-10-10 21:22:32'),
(11, 208, '0', NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, '2024-09-25 20:27:24', '2024-09-25 20:27:24'),
(12, 209, '2.5', '1.5', '0.45', '0.55', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"0.25\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"0.30\"}]', 0, NULL, NULL, 1, 0, '2024-09-25 20:47:57', '2024-09-25 20:48:38'),
(13, 210, '86', '51.6', '15.48', '18.92', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"8.60\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"10.32\"}]', 0, NULL, NULL, 1, 0, '2024-09-26 20:12:59', '2024-09-27 11:38:01'),
(14, 211, '2.5', '1.5', '0.45', '0.55', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"0.25\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"0.30\"}]', 0, NULL, NULL, 1, 0, '2024-09-27 05:08:36', '2024-09-27 08:36:24'),
(15, 212, '3.5', '2.1', '0.63', '0.77', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"0.35\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"0.42\"}]', 0, NULL, NULL, 1, 0, '2024-09-27 09:52:30', '2024-09-27 11:38:01'),
(16, 213, '0', NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, '2024-09-28 10:25:36', '2024-09-28 10:25:36'),
(17, 214, '2', '1.2', '0.36', '0.44', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"0.20\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"0.24\"}]', 0, NULL, NULL, 1, 0, '2024-09-29 13:49:30', '2024-09-30 11:26:19'),
(18, 215, '0.3', '0.18', '0.05', '0.07', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"0.03\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"0.04\"}]', 0, NULL, NULL, 1, 0, '2024-10-07 17:15:45', '2024-10-07 17:16:49'),
(19, 216, '0.6', '0.36', '0.11', '0.13', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"0.06\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"0.07\"}]', 0, NULL, NULL, 1, 0, '2024-10-08 04:57:32', '2024-10-08 05:08:41'),
(20, 181, '0.6', '0.36', '0.11', '0.13', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"0.06\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"0.07\"}]', 0, NULL, NULL, 1, 0, '2024-10-08 14:54:59', '2024-10-22 13:19:51'),
(21, 217, '0.3', '0.18', '0.05', '0.07', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"0.03\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"0.04\"}]', 0, NULL, NULL, 1, 0, '2024-10-09 22:59:52', '2024-10-09 23:34:02'),
(22, 218, '1.2', '0.72', '0.22', '0.26', '[{\"tax_name\":\"TDS\",\"tax_percentage\":10,\"tax_amount\":\"0.12\"},{\"tax_name\":\"VAT\",\"tax_percentage\":12,\"tax_amount\":\"0.14\"}]', 0, NULL, NULL, 1, 0, '2024-10-12 06:57:54', '2024-10-12 07:06:36'),
(23, 219, '0', NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, '2024-10-21 15:50:59', '2024-10-21 15:50:59'),
(24, 220, '0', NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, '2024-11-03 21:08:12', '2024-11-03 21:08:12');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawls`
--

CREATE TABLE `withdrawls` (
  `id` bigint UNSIGNED NOT NULL,
  `type` tinyint NOT NULL DEFAULT '0',
  `order_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `wallet_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transfer_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `previous_net_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_net_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_details` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previous_wallet_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_wallet_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addcategories`
--
ALTER TABLE `addcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addplans`
--
ALTER TABLE `addplans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addpricings`
--
ALTER TABLE `addpricings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addvideos`
--
ALTER TABLE `addvideos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_phone_unique` (`phone`);

--
-- Indexes for table `advertisers`
--
ALTER TABLE `advertisers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bankcodes`
--
ALTER TABLE `bankcodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banneradds`
--
ALTER TABLE `banneradds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blockmessages`
--
ALTER TABLE `blockmessages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blockusers`
--
ALTER TABLE `blockusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogcategories`
--
ALTER TABLE `blogcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commentlikes`
--
ALTER TABLE `commentlikes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commentreports`
--
ALTER TABLE `commentreports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gsts`
--
ALTER TABLE `gsts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `livestreams`
--
ALTER TABLE `livestreams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_types`
--
ALTER TABLE `mail_types`
  ADD PRIMARY KEY (`mail_type_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `officialpayments`
--
ALTER TABLE `officialpayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otherlinks`
--
ALTER TABLE `otherlinks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `postreports`
--
ALTER TABLE `postreports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posttags`
--
ALTER TABLE `posttags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replycomments`
--
ALTER TABLE `replycomments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `saveposts`
--
ALTER TABLE `saveposts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shares`
--
ALTER TABLE `shares`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staffs_email_unique` (`email`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxcharges`
--
ALTER TABLE `taxcharges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userdatas`
--
ALTER TABLE `userdatas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userreports`
--
ALTER TABLE `userreports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `verifies`
--
ALTER TABLE `verifies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawls`
--
ALTER TABLE `withdrawls`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addcategories`
--
ALTER TABLE `addcategories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `addplans`
--
ALTER TABLE `addplans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `addpricings`
--
ALTER TABLE `addpricings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `addvideos`
--
ALTER TABLE `addvideos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `advertisers`
--
ALTER TABLE `advertisers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `bankcodes`
--
ALTER TABLE `bankcodes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=795;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `banneradds`
--
ALTER TABLE `banneradds`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blockmessages`
--
ALTER TABLE `blockmessages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `blockusers`
--
ALTER TABLE `blockusers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `blogcategories`
--
ALTER TABLE `blogcategories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2977;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `commentlikes`
--
ALTER TABLE `commentlikes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `commentreports`
--
ALTER TABLE `commentreports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `earnings`
--
ALTER TABLE `earnings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `follows`
--
ALTER TABLE `follows`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=272;

--
-- AUTO_INCREMENT for table `gsts`
--
ALTER TABLE `gsts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=792;

--
-- AUTO_INCREMENT for table `livestreams`
--
ALTER TABLE `livestreams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `mail_types`
--
ALTER TABLE `mail_types`
  MODIFY `mail_type_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=403;

--
-- AUTO_INCREMENT for table `officialpayments`
--
ALTER TABLE `officialpayments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `otherlinks`
--
ALTER TABLE `otherlinks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `postreports`
--
ALTER TABLE `postreports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `posttags`
--
ALTER TABLE `posttags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `replycomments`
--
ALTER TABLE `replycomments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `saveposts`
--
ALTER TABLE `saveposts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `shares`
--
ALTER TABLE `shares`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `taxcharges`
--
ALTER TABLE `taxcharges`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `userdatas`
--
ALTER TABLE `userdatas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `userreports`
--
ALTER TABLE `userreports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `verifies`
--
ALTER TABLE `verifies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=686;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `withdrawls`
--
ALTER TABLE `withdrawls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
