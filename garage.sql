-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 25 nov. 2025 à 12:56
-- Version du serveur : 8.4.7
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `garage`
--

-- --------------------------------------------------------

--
-- Structure de la table `g_article`
--

DROP TABLE IF EXISTS `g_article`;
CREATE TABLE IF NOT EXISTS `g_article` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `a_ref` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a_marque` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a_quantite` int NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_article`
--

INSERT INTO `g_article` (`a_id`, `a_ref`, `a_type`, `a_marque`, `a_quantite`) VALUES
(1, '7CK215G', 'Filtre à air', 'VALEO', 120),
(2, 'Q9DREJ6', 'Filtre à pollen', 'BOSCH', 52),
(3, '7CK215G', 'Filtre à air', 'MAN FILTER', 11);

-- --------------------------------------------------------

--
-- Structure de la table `g_voiture`
--

DROP TABLE IF EXISTS `g_voiture`;
CREATE TABLE IF NOT EXISTS `g_voiture` (
  `v_id` int NOT NULL AUTO_INCREMENT,
  `v_marque` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `v_type` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `v_energie` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `v_fk_a_id` int NOT NULL,
  PRIMARY KEY (`v_id`),
  KEY `a_fk` (`v_fk_a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_voiture`
--

INSERT INTO `g_voiture` (`v_id`, `v_marque`, `v_type`, `v_energie`, `v_fk_a_id`) VALUES
(16, 'FIAT', '500', 'ESSENCE', 1),
(18, 'TOYOTA', 'YARIS', 'DIESEL', 2),
(19, 'PEUGEOT', '208', 'ESSENCE', 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `g_voiture`
--
ALTER TABLE `g_voiture`
  ADD CONSTRAINT `a_fk` FOREIGN KEY (`v_fk_a_id`) REFERENCES `g_article` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
