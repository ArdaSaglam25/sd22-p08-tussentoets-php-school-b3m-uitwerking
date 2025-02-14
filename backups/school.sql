-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 13 jan 2025 om 19:15
-- Serverversie: 10.4.32-MariaDB
-- PHP-versie: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
                                               `version` varchar(191) NOT NULL,
                                               `executed_at` datetime DEFAULT NULL,
                                               `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
                                                                                           ('DoctrineMigrations\\Version20240925120001', '2024-09-25 14:00:23', 24),
                                                                                           ('DoctrineMigrations\\Version20240925131135', '2024-09-25 15:11:54', 26),
                                                                                           ('DoctrineMigrations\\Version20240925151921', '2024-09-25 17:20:46', 77),
                                                                                           ('DoctrineMigrations\\Version20241122110539', '2024-11-22 12:05:56', 69),
                                                                                           ('DoctrineMigrations\\Version20241205204158', '2024-12-05 21:42:16', 16),
                                                                                           ('DoctrineMigrations\\Version20241205205437', '2024-12-05 21:54:46', 22),
                                                                                           ('DoctrineMigrations\\Version20241205205607', '2024-12-05 21:56:14', 116);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `grade`
--

CREATE TABLE `grade` (
                         `id` int(11) NOT NULL,
                         `grade` decimal(3,1) NOT NULL,
                         `student_id` int(11) NOT NULL,
                         `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `grade`
--

INSERT INTO `grade` (`id`, `grade`, `student_id`, `subject_id`) VALUES
                                                                    (1, 7.0, 1, 1),
                                                                    (2, 8.0, 1, 2),
                                                                    (3, 8.0, 2, 2),
                                                                    (4, 9.5, 2, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messenger_messages`
--

CREATE TABLE `messenger_messages` (
                                      `id` bigint(20) NOT NULL,
                                      `body` longtext NOT NULL,
                                      `headers` longtext NOT NULL,
                                      `queue_name` varchar(190) NOT NULL,
                                      `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
                                      `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
                                      `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `school_group`
--

CREATE TABLE `school_group` (
                                `id` int(11) NOT NULL,
                                `name` varchar(255) NOT NULL,
                                `year` int(11) NOT NULL,
                                `teacher` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `school_group`
--

INSERT INTO `school_group` (`id`, `name`, `year`, `teacher`) VALUES
                                                                 (1, 'B1J', 1, 'S Bechoe'),
                                                                 (2, 'B1K', 1, 'K Mooijman'),
                                                                 (3, 'B1L', 1, 'L Govea'),
                                                                 (4, 'B1M', 1, 'P Thong'),
                                                                 (5, 'B1P', 1, 'M Hutten'),
                                                                 (6, 'B2H', 2, 'L Govea'),
                                                                 (7, 'B2J', 2, 'M Kleijwegt'),
                                                                 (8, 'B2K', 2, 'K Mooijman'),
                                                                 (9, 'B2L', 2, 'F Dasci'),
                                                                 (10, 'B3M', 3, 'M Sarikaya');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `student`
--

CREATE TABLE `student` (
                           `id` int(11) NOT NULL,
                           `first_name` varchar(255) NOT NULL,
                           `email` varchar(255) NOT NULL,
                           `last_name` varchar(255) NOT NULL,
                           `age` int(11) NOT NULL,
                           `school_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `student`
--

INSERT INTO `student` (`id`, `first_name`, `email`, `last_name`, `age`, `school_group_id`) VALUES
                                                                                               (1, 'Piet', 'p.jansen@rocmondriaan.nl', 'Jansen', 18, 1),
                                                                                               (2, 'Klaas', 'k.devries@rocmondriaan.nl', 'de Vries', 17, 2),
                                                                                               (3, 'Ria', 'r.degraaf@rocmondriaan.nl', 'de Graaf', 16, 3);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `subject`
--

CREATE TABLE `subject` (
                           `id` int(11) NOT NULL,
                           `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `subject`
--

INSERT INTO `subject` (`id`, `name`) VALUES
                                         (1, 'JavaScript'),
                                         (2, 'PHP');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
                        `id` int(11) NOT NULL,
                        `email` varchar(180) NOT NULL,
                        `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
                        `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
                                                            (1, 'test@example.com', '[]', '$2y$13$Ji/7MpD05S7Hx4XWyWqzpOOckbdD.Bg73x.7uwrXsdbFRzY5xDtfy'),
                                                            (2, 'admin@example.com', '[\"ROLE_ADMIN\"]', '$2y$13$xQZpw6oswc.C1leyGGL0seGeZ1hGd3DXiM0UxNsRpZt1zB6GIke5S');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `vacation`
--

CREATE TABLE `vacation` (
                            `id` int(11) NOT NULL,
                            `name` varchar(255) NOT NULL,
                            `start_date` date NOT NULL,
                            `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `vacation`
--

INSERT INTO `vacation` (`id`, `name`, `start_date`, `end_date`) VALUES
                                                                    (1, 'Herfstvakantie', '2024-10-26', '2024-11-03'),
                                                                    (2, 'Kerstvakantie', '2024-12-21', '2025-01-05'),
                                                                    (3, 'Voorjaarsvakantie', '2025-02-22', '2025-03-02'),
                                                                    (4, 'Meivakantie', '2025-04-19', '2025-05-04'),
                                                                    (5, 'Zomervakantie', '2025-07-19', '2025-08-31');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
    ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `grade`
--
ALTER TABLE `grade`
    ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_595AAE34CB944F1A` (`student_id`),
  ADD KEY `IDX_595AAE3423EDC87` (`subject_id`);

--
-- Indexen voor tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
    ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexen voor tabel `school_group`
--
ALTER TABLE `school_group`
    ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `student`
--
ALTER TABLE `student`
    ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B723AF3312ED03` (`school_group_id`);

--
-- Indexen voor tabel `subject`
--
ALTER TABLE `subject`
    ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- Indexen voor tabel `vacation`
--
ALTER TABLE `vacation`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `grade`
--
ALTER TABLE `grade`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `school_group`
--
ALTER TABLE `school_group`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `student`
--
ALTER TABLE `student`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `subject`
--
ALTER TABLE `subject`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `vacation`
--
ALTER TABLE `vacation`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `grade`
--
ALTER TABLE `grade`
    ADD CONSTRAINT `FK_595AAE3423EDC87` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  ADD CONSTRAINT `FK_595AAE34CB944F1A` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

--
-- Beperkingen voor tabel `student`
--
ALTER TABLE `student`
    ADD CONSTRAINT `FK_B723AF3312ED03` FOREIGN KEY (`school_group_id`) REFERENCES `school_group` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
