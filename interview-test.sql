-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2022 at 11:52 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `interview-test`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `email`, `name`, `gender`, `content`) VALUES
(1, 'ropafadzo@gmail.com', 'ropafadzo', 'male', 'ropa'),
(2, 'ropafadzo@gmail.com', 'ropafadzo', 'male', 'ropa'),
(3, 'ropafadzo@gmail.com', 'ropafadzo', 'male', 'ropa'),
(4, 'ropafadzo@gmail.com', 'ropafadzo', 'male', 'ropa'),
(5, 'ropafadzo@gmail.com', 'ropa', 'male', 'ropafadzo'),
(6, 'ropafadzo@gmail.com', 'ropa', 'male', 'ropafadzo'),
(7, '', 'ropa', 'male', 'ropafadzo'),
(8, '', 'ropa', 'male', 'ropafadzo'),
(9, 'chitandoropafadzo90@gmail.com', 'ropafadzo', 'male', 'ropafadzo tek me home '),
(10, 'chitandoropafadzo90@gmail.com', 'ropafadzo', 'male', 'ropafadzo tek me home '),
(11, 'chitandoropafadzo90@gmail.com', 'ropafadzo', 'male', 'ropafadzo tek me home '),
(12, 'chitandoropafadzo90@gmail.com', 'ropafadzo', 'male', 'ropafadzo tek me home '),
(13, 'chitandoropafadzo90@gmail.com', 'ropafadzo', 'male', 'ropafadzo tek me home '),
(14, 'chitandoropafadzo90@gmail.com', 'ropafadzo', 'male', 'ropafadzo tek me home '),
(15, 'chitandoropafadzo90@gmail.com', 'Ropafadzo Chitando', 'Male', 'TEST'),
(16, 'chitandoropafadzo90@gmail.com', 'Ropafadzo Chitando', 'Female', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refresh_tokens`
--

CREATE TABLE `refresh_tokens` (
  `id` int(11) NOT NULL,
  `refresh_token` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `refresh_tokens`
--

INSERT INTO `refresh_tokens` (`id`, `refresh_token`, `username`, `valid`) VALUES
(1, 'bfd702f3b360032fc55e8763c757a8fd6736fecc9e591aa284aa78e884d3d929c66ae8b558129c478230ef26ba65a9df71164a20bea407597de73f338da8fca9', 'ropafadzo@gmail.com', '2022-04-23 19:54:09'),
(2, '530738560413f3ade155b32160d341f48f64f7b3d7206d79a16bf039e51d3a074ead199addcec795035714148f0f3afe98721fe40940308c46717305eb239e49', 'ropafadzo222@gmail.com', '2022-04-24 18:02:03'),
(3, 'd584570a2ce5060328348fc64c3cb80016a860012ef134ab52cd6ac94a116c327b8a5bcdaad824231b071a8ca2a3d04a72464281de388fd983c040023db4039d', 'chitandoropafadzo90@gmail.com', '2022-04-24 20:01:45'),
(4, '53eb9b59bc08a9d5117c50b1b4fc0400aeb716c902c52e0dc230cbf3c533d934354060fb85dc7ce0298c5e769b3ddc0f816a959b2f058759034acec6d88d9d24', 'chitandoropafadzo90@gmail.com', '2022-04-24 20:07:56'),
(5, '4e672257d25b15bf85680fb66baba1833b49b9e6416c971342d89988b6f3769a9f4607fd9ac772e6adf6159fd85be8c5408d4ed2a841b2e906cfd6e9c5f08824', 'chitandoropafadzo90@gmail.com', '2022-04-24 20:16:33'),
(6, 'b403ee0ada666d21c3da946b319a376ce2d2078e979e0114ba73abf61964828e535a3af8eeeeb96484d7a4c7442fc143f60b5a668bcdc7aea0d8b3a11ca1df3e', 'chitandoropafadzo90@gmail.com', '2022-04-24 20:18:50'),
(7, 'b87b052a552c0a954f1cc5681f14f88eeef7dce9cecf79a0aaba785b12e4d27cadf5dde433f2158590bab744e5a4a7963906da55d56c094586e7a57a740aadc9', 'chitandoropafadzo90@gmail.com', '2022-04-27 20:35:46'),
(8, '2d1a35694ab1ef0291ac2db9b8687cdbc2b81b8527915c160f1593e92877c5f3c3a458e6c9966f5c788030d19e3efa0afd28aa97da1c08c36736ca0be8124a43', 'chitandoropafadzo90@gmail.com', '2022-04-27 20:36:57');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'ropafadzo@gmail.com', '[]', '$2y$13$pCmrO2n6qsOpKtqayptcVe2cm40fUdAEce3FDfC7PB3AxbcaCrnr6'),
(2, 'ropafadzo1@gmail.com', '[]', '$2y$13$5nH8eU4CIBYpbauvfxIDsurko9gOdVsAYg3iA.Dc0YAh/32PK37t6'),
(3, 'ropafadzo222@gmail.com', '[]', '$2y$13$9utOacn7aROLRVtV9TQcSu6eMWgBsHvVz9Yko3pEP.ujKmWu/VhyS'),
(4, 'chitandoropafadzo90@gmail.com', '[]', '$2y$13$bvJKYj2efWRHN7nMF55RyeR5K.Ll.mf1.3oI6OPk62pZWlYvyaJq.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9BACE7E1C74F2195` (`refresh_token`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `refresh_tokens`
--
ALTER TABLE `refresh_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
